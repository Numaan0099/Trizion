<?php

namespace App\Jobs;

use App\Models\Import;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Log;

class FinalizeImport implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $importId;
    public string $batchId;
    public $tries = 20; // Try 20 times (20 * 5 seconds = 100 seconds max wait)

    public function __construct(int $importId, string $batchId)
    {
        $this->importId = $importId;
        $this->batchId = $batchId;
    }

    public function handle(): void
    {
        $import = Import::find($this->importId);
        
        if (!$import) {
            Log::error('Import not found for finalization', ['import_id' => $this->importId]);
            return;
        }

        $batch = Bus::findBatch($this->batchId);
        
        if (!$batch) {
            Log::error('Batch not found', ['batch_id' => $this->batchId]);
            $import->update(['status' => 'failed']);
            return;
        }

        Log::info('Checking batch status', [
            'batch_id' => $this->batchId,
            'finished' => $batch->finished(),
            'cancelled' => $batch->cancelled(),
            'progress' => $batch->progress()
        ]);

        // If batch is still processing, re-queue this job
        if (!$batch->finished()) {
            Log::info('Batch still processing, re-queuing finalize job');
            FinalizeImport::dispatch($this->importId, $this->batchId)
                ->delay(now()->addSeconds(5));
            return;
        }

        // Batch is complete
        if ($batch->cancelled()) {
            Log::warning('Batch was cancelled', ['batch_id' => $this->batchId]);
            $import->update(['status' => 'failed']); 
        } else {
            Log::info('Batch completed successfully', [
                'batch_id' => $this->batchId,
                'import_id' => $this->importId
            ]);
            $import->update(['status' => 'completed']);
        }
    }

    public function failed(\Throwable $exception)
    {
        Log::error('FinalizeImport failed', [
            'import_id' => $this->importId,
            'error' => $exception->getMessage()
        ]);
        
        $import = Import::find($this->importId);
        if ($import) {
            $import->update(['status' => 'failed']);
        }
    }
}