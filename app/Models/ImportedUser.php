<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImportedUser extends Model
{
    use HasFactory;

    
    protected $fillable = [
        'name',
        'email',
    ];

    
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    
    public function scopeByEmail($query, string $email)
    {
        return $query->where('email', $email);
    }

    
    public function scopeSearchByName($query, string $name)
    {
        return $query->where('name', 'like', "%{$name}%");
    }
}