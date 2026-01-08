<?php

namespace App\Jobs;

use App\Models\Import;
use App\Jobs\ProcessUserChunk;
use Illuminate\Bus\Batch;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;
use Throwable;

class StartUserImport implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $timeout = 300;
    public Import $import;

    public function __construct(Import $import)
    {
        $this->import = $import;
    }

    public function handle(): void
    {
        try {
            Log::info('=== IMPORT STARTED ===', ['import_id' => $this->import->id]);
            
            // Mark as processing
            $this->import->update(['status' => 'processing']);
            Log::info('Status updated to processing');

            // Get file path
            $filePath = Storage::path($this->import->file_path);
            Log::info('File path resolved', ['path' => $filePath]);
            
            if (!file_exists($filePath)) {
                Log::error('FILE NOT FOUND', ['path' => $filePath]);
                $this->import->update(['status' => 'failed']);
                return;
            }

            Log::info('File exists, opening...');
            
            // Read CSV file
            $file = fopen($filePath, 'r');
            
            if (!$file) {
                Log::error('COULD NOT OPEN FILE');
                $this->import->update(['status' => 'failed']);
                return;
            }

            Log::info('File opened successfully');

            // Skip header row
            $header = fgetcsv($file);
            Log::info('Header row', ['header' => $header]);
            
            $rows = [];
            while (($row = fgetcsv($file)) !== false) {
                $rows[] = $row;
            }
            
            fclose($file);

            $totalRows = count($rows);
            
            Log::info('=== ROWS READ ===', ['count' => $totalRows]);

            // Update total rows
            $this->import->update(['total_rows' => $totalRows]);

            if ($totalRows === 0) {
                Log::warning('No rows to import');
                $this->import->update(['status' => 'completed']);
                return;
            }

            // Split into chunks of 100 rows each
            $chunks = array_chunk($rows, 100);
            
            Log::info('=== CREATING CHUNKS ===', ['chunk_count' => count($chunks)]);
            
            $jobs = [];
            foreach ($chunks as $index => $chunk) {
                $jobs[] = new ProcessUserChunk($this->import->id, $chunk);
                Log::info('Chunk created', ['index' => $index, 'rows' => count($chunk)]);
            }

            Log::info('=== DISPATCHING BATCH ===', ['job_count' => count($jobs)]);

            // Dispatch batch WITHOUT closures
            $batch = Bus::batch($jobs)
                ->name("Import #{$this->import->id}")
                ->allowFailures()
                ->dispatch();

            Log::info('=== BATCH DISPATCHED ===', ['batch_id' => $batch->id]);

            // Dispatch a job to check when batch is complete
            FinalizeImport::dispatch($this->import->id, $batch->id)
                ->delay(now()->addSeconds(5));

        } catch (\Exception $e) {
            Log::error('=== EXCEPTION IN HANDLE ===', [
                'import_id' => $this->import->id,
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            $this->import->update(['status' => 'failed']);
        }
    }

    public function failed(Throwable $exception)
    {
        Log::error('StartUserImport job failed', [
            'import_id' => $this->import->id,
            'error' => $exception->getMessage()
        ]);
        
        $this->import->update(['status' => 'failed']);
    }
}