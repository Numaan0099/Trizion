<?php

namespace App\Http\Controllers;

use App\Models\Import;
use App\Jobs\StartUserImport;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ImportController extends Controller
{
    public function index()
    {
        return Inertia::render('ImportUsers');
    }

    public function upload(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:csv,txt|max:10240',
        ]);

        $path = $request->file('file')->store('uploads');

        $import = Import::create([
            'file_path' => $path,
            'status' => 'pending',
        ]);

        StartUserImport::dispatch($import);

        return response()->json([
            'message' => 'File uploaded. Import started.',
            'import_id' => $import->id,
        ]);
    }

    public function status($id)
    {
        return Import::findOrFail($id);
    }
}