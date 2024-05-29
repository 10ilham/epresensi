<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JurusansModel extends Model
{
    use HasFactory;

    protected $guarded = []; //untuk mendefinisikan semua kolom yang boleh diisi
    protected $table = 'jurusans'; //untuk menentukan tabel yang digunakan
}
