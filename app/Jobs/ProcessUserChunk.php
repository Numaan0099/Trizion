<?php

namespace App\Jobs;

use App\Models\Import;
use App\Models\ImportedUser;
use Illuminate\Bus\Batchable;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class ProcessUserChunk implements ShouldQueue
{
    use Batchable, Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $timeout = 120;
    public int $importId;
    public array $rows;

    public function __construct(int $importId, array $rows)
    {
        $this->importId = $importId;
        $this->rows = $rows;
    }

    public function handle(): void
    {
        // Check if batch has been cancelled
        if ($this->batch()?->cancelled()) {
            return;
        }

        $import = Import::find($this->importId);

        if (!$import) {
            Log::error('Import not found', ['import_id' => $this->importId]);
            return;
        }

        $successCount = 0;
        $failedCount = 0;

        foreach ($this->rows as $row) {
            try {
                // Validate row has data
                if (empty($row[0]) || empty($row[1])) {
                    $failedCount++;
                    Log::warning('Empty row data', ['row' => $row]);
                    continue;
                }

                $name = trim($row[0]);
                $email = trim($row[1]);

                // Validate email format
                $validator = Validator::make(
                    ['email' => $email],
                    ['email' => 'required|email']
                );

                if ($validator->fails()) {
                    $failedCount++;
                    Log::warning('Invalid email', ['email' => $email]);
                    continue;
                }

                // Create user
                ImportedUser::create([
                    'name' => $name,
                    'email' => $email,
                ]);

                $successCount++;

            } catch (\Exception $e) {
                $failedCount++;
                
                Log::error('Row import failed', [
                    'import_id' => $this->importId,
                    'row' => $row,
                    'error' => $e->getMessage(),
                ]);
            }
        }

        // Update import counters atomically
        $import->increment('success_count', $successCount);
        $import->increment('failed_count', $failedCount);

        Log::info('Chunk processed', [
            'import_id' => $this->importId,
            'rows_processed' => count($this->rows),
            'success' => $successCount,
            'failed' => $failedCount
        ]);
    }

    public function failed(\Throwable $exception)
    {
        Log::error('ProcessUserChunk failed', [
            'import_id' => $this->importId,
            'error' => $exception->getMessage(),
        ]);
    }
}