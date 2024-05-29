<?php

namespace App\Http\Controllers;

use App\Models\JurusansModel;
use App\Models\MatkulsModel;
use Illuminate\Http\Request;

class MatkulController extends Controller
{
    // menampilkan tampilan utama views tabel matkul
    public function index()
    {
        // mengambil data dari table matkul
        $matkul = MatkulsModel::get();

        //Mengambil data dari table jurusan
        $jurusan = JurusansModel::get();
        return view('tables.matkul', ['matkuls' => $matkul, 'jurusans' => $jurusan]);

        // mengirim data matkul ke view tables.blade.php
        // return view('tables.matkul', ['matkuls' => $matkul]);
    }

    //Untuk menampilkan tampilan views/matkuls/create.blade data matkul
    public function create()
    {
        // mengambil data dari table jurusan
        $jurusans = JurusansModel::all();
        return view('matkuls.create', compact('jurusans')); //nama tabel jurusans
    }

    //Untuk menyimpan data matkul ke database
    public function store(Request $request)
    {
        $request->validate([
            'jurusan_id' => 'required',
            'nama_matkul' => 'required',
            'sks' => 'required',
        ]);

        MatkulsModel::create($request->all());

        return redirect('tables/matkul')
            ->with('success', 'Matkul created successfully.');
    }

    //Untuk menampilkan tampilan mengedit data matkul
    public function show($id)
    {
        $jurusans = JurusansModel::all();

        $matkul = MatkulsModel::findOrFail($id);
        return view('matkuls.update', compact('jurusans', 'matkul'));
    }

    //Untuk mengupdate data matkul ke database
    public function update(Request $request, $id)
    {
        $matkul = MatkulsModel::findOrFail($id);
        $matkul->update($request->all());
        return redirect()->route('matkuls.index')->with('success', 'Matkul updated successfully.');
    }

    //Untuk menghapus data matkul
    public function destroy($id)
    {
        $matkul = MatkulsModel::findOrFail($id);
        $matkul->delete();
        return redirect()->route('matkuls.index')->with('success', 'Matkul deleted successfully.');
    }
}
