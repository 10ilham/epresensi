@extends('layouts.user_type.auth')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Tambah Matkul</h2>
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

    <form action="{{ route('matkuls.store') }}" method="POST">
        @csrf

        <div class="row">

            <div class="form-group">
                <strong>Jurusan ID:</strong>
                <select name="jurusan_id" class="form-control">
                    <option value="">Select Jurusan</option>
                    @foreach($jurusans as $jurusan)
                    <option value="{{ $jurusan->id }}">{{ $jurusan->id }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Nama Matkul:</strong>
                    <input type="text" name="nama_matkul" class="form-control" placeholder="Nama Matkul">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Sks:</strong>
                    <input type="text" name="sks" class="form-control" placeholder="Sks">
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>
@endsection