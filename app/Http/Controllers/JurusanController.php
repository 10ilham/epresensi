<?php

namespace App\Http\Controllers;

use App\Models\JurusansModel;
use App\Models\MatkulsModel;
use Illuminate\Http\Request;

class JurusanController extends Controller
{
    public function index()
    {
        // mengambil data dari table jurusan
        $jurusan = JurusansModel::get();

        //Mengambil data dati table matkul
        $matkul = MatkulsModel::get();
        return view('tables.jurusan', ['jurusans' => $jurusan, 'matkuls' => $matkul]);

        // mengirim data jurusan ke view tables.blade.php
        // return view('tables.jurusan', ['jurusans' => $jurusan]);
    }

    //Untuk menampilkan tampilan views/jurusan/create.blade data jurusan
    public function create()
    {
        return view('jurusans.create');
    }

    //Untuk menyimpan data jurusan ke database
    public function store(Request $request)
    {
        $request->validate([
            'code' => 'required|unique:jurusans,code',
            'nama_jurusan' => 'required',
        ]);

        JurusansModel::create($request->all());

        return redirect('tables/jurusan')
            ->with('success', 'Jurusan created successfully.');
    }

    //Untuk menampilkan tampilan mengedit data jurusan
    public function show($id)
    {
        $jurusan = JurusansModel::findOrFail($id);
        return view('jurusans.update', compact('jurusan'));
    }

    //Untuk mengupdate data jurusan ke database
    public function update(Request $request, $id)
    {
        $jurusan = JurusansModel::findOrFail($id);
        $jurusan->update($request->all());
        return redirect()->route('jurusans.index')->with('success', 'Jurusan updated successfully.');
    }

    //Untuk menghapus data jurusan
    public function destroy($id)
    {
        $jurusan = JurusansModel::findOrFail($id);
        $jurusan->delete();
        return redirect()->route('jurusans.index')->with('success', 'Jurusan deleted successfully.');
    }
}
