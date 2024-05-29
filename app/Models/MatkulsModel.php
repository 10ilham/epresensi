<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatkulsModel extends Model
{
    use HasFactory;

    protected $guarded = []; //untuk mendefinisikan semua kolom yang boleh diisi
    protected $table = 'matkuls'; //untuk menentukan tabel yang digunakan

    public function jurusan()
    {
        return $this->belongsTo(JurusansModel::class, 'jurusan_id'); // Definisi relationship antara tabel matkuls dan jurusans
    }
}
