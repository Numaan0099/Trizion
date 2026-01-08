<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;

use App\Models\Import;
use App\Http\Controllers\ImportController;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::get('/imports', function () {
    return Import::latest()->get();
});

Route::middleware(['auth'])->group(function () {
    Route::get('/import', [ImportController::class, 'index'])
        ->name('import.page');
    
    Route::post('/import/upload', [ImportController::class, 'upload'])
        ->name('import.upload');
    
    Route::get('/import/status/{id}', [ImportController::class, 'status'])
        ->name('import.status');
});

Route::get('dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__.'/settings.php';