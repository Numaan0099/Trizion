<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Import extends Model
{
    use HasFactory;

        protected $fillable = [
        'file_path',
        'status',
        'total_rows',
        'success_count',
        'failed_count',
    ];

    
    protected $casts = [
        'total_rows' => 'integer',
        'success_count' => 'integer',
        'failed_count' => 'integer',
    ];

    
    const STATUS_PENDING = 'pending';
    const STATUS_PROCESSING = 'processing';
    const STATUS_COMPLETED = 'completed';
    const STATUS_FAILED = 'failed';

       public function isPending(): bool
    {
        return $this->status === self::STATUS_PENDING;
    }

   
    public function isProcessing(): bool
    {
        return $this->status === self::STATUS_PROCESSING;
    }

  
    public function isCompleted(): bool
    {
        return $this->status === self::STATUS_COMPLETED;
    }

    
    public function isFailed(): bool
    {
        return $this->status === self::STATUS_FAILED;
    }

   
    public function markAsProcessing(): bool
    {
        return $this->update(['status' => self::STATUS_PROCESSING]);
    }

    
    public function markAsCompleted(): bool
    {
        return $this->update(['status' => self::STATUS_COMPLETED]);
    }

   
    public function markAsFailed(): bool
    {
        return $this->update(['status' => self::STATUS_FAILED]);
    }

    
    public function incrementSuccess(int $count = 1): void
    {
        $this->increment('success_count', $count);
    }

    
    public function incrementFailed(int $count = 1): void
    {
        $this->increment('failed_count', $count);
    }
}