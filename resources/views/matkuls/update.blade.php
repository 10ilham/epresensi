@extends('layouts.user_type.auth')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Edit Matkul</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('matkuls.index') }}">Kembali</a>
            </div>
        </div>
    </div>

    @if ($errors->any())
    <div class="alert alert-danger">
        <strong>Whoops!</strong> There were some problems with your input.<br><br>
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <form action="{{ route('matkuls.update', $matkul->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>ID Matkul :</strong>
                    <input type="text" name="id" value="{{ $matkul->id }}" class="form-control" placeholder="Masukkan ID matkul">
                </div>
            </div>
            <!-- buat jurusan id dropdown dengan otomatis memilih data yang sebelumnya dimasukkan -->
            <div class="form-group">
                <strong>Jurusan ID:</strong>
                <select name="jurusan_id" class="form-control">
                    <option value="">Select Jurusan</option>
                    @foreach($jurusans as $jurusan)
                    <option value="{{ $jurusan->id }}" {{ $jurusan->id == $matkul->jurusan_id ? 'selected' : '' }}>{{ $jurusan->id }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Nama matkul :</strong>
                    <input type="text" name="nama_matkul" value="{{ $matkul->nama_matkul }}" class="form-control" placeholder="Nama matkul">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Sks:</strong>
                    <input type="text" name="sks" value="{{ $matkul->sks }}" class="form-control" placeholder="Sks">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>
@endsection