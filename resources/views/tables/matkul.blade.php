@extends('layouts.user_type.auth')

@section('content')

<!-- Buat untuk menghubungkan ke file css -->
<link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">

<!-- Data Matkul 1 -->
<div class="container-fluid py-4 flex-grow-1 d-flex flex-column">

    @if ($message = Session::get('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ $message }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif

    <div class="row flex-grow-1">
        <div class="col-12">
            <div class="card mb-4 h-100 d-flex flex-column">

                <!-- Header Matkul 1 -->
                <div class="card-header pb-0 bg-gradient-info">
                    <div class="row">
                        <div class="col">
                            <h6 class="text-white">Data Matkul 1</h6>
                        </div>
                        <div class="col text-end">
                            <a class="btn btn-grad-biru" href="{{ route('matkuls.create') }}">Tambah Data</a>
                        </div>
                    </div>
                </div>
                <!-- Penutup Header Matkul 1 -->

                <!-- Body tabel Matkul 1 -->
                <div class="card-body px-0 pt-0 pb-2 flex-grow-1">
                    <div class="p-0 overflow-y: auto">
                        <table class="table align-items-center justify-content-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase bg-blue text-white text-xxs font-weight-bolder opacity-7">ID Matkul</th>
                                    <th class="text-uppercase bg-blue text-white text-xxs font-weight-bolder opacity-7 ps-2">Jurusan Id</th>
                                    <th class="text-uppercase bg-blue text-white text-xxs font-weight-bolder opacity-7 ps-2">Nama Matkul</th>
                                    <th class="text-uppercase bg-blue text-white text-xxs font-weight-bolder opacity-7 ps-2">Sks</th>
                                    <th class="text-center text-uppercase bg-blue text-white text-xxs font-weight-bolder opacity-7">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($matkuls as $m)
                                <tr>
                                    <td>
                                        <div class="d-flex px-2">
                                            <div class="my-auto">
                                                <h6 class="mb-0 text-sm">{{ $m->id }}</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-sm font-weight-bold mb-0">{{ $m->jurusan_id }}</p>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">{{ $m->nama_matkul }}</span>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">{{ $m->sks }}</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="col-lg-6 col-5 my-auto text-end">
                                            <div class="dropdown float-lg-end pe-4">
                                                <a class="cursor-pointer" id="dropdownTable" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa fa-ellipsis-v text-secondary"></i>
                                                </a>
                                                <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5" aria-labelledby="dropdownTable">
                                                    <li><a class="dropdown-item border-radius-md" href="{{ route('matkuls.update', $m->id) }}"><i class="fa fa-pencil text-xs"></i> Edit</a></li>
                                                    <!-- Untuk menghapus -->
                                                    <form action="{{ route('matkuls.destroy', $m->id) }}" method="POST"> <!-- route ke JurusanController -->
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="dropdown-item border-radius-md" onclick="javascript:return confirm('Apakah ingin menghapus data Matkuls?')" type="submit"><i class="fa fa-trash text-xs"></i> Hapus</button>
                                                    </form>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Penutup Body tabel Matkul 1 -->

            </div>
        </div>
    </div>

</div>
<!-- Penutup Data Matkul 1 -->

<!-- Data Matkul 2 -->
<div class="container-fluid py-4 flex-grow-1 d-flex flex-column">

    <div class="row flex-grow-1">
        <div class="col-12">
            <div class="card mb-4 h-100 d-flex flex-column">
                <!-- Header Matkul 2 -->
                <div class="card-header pb-0 bg-cek2">
                    <div class="row">
                        <div class="col">
                            <h6 class="text-white">Data Matkul 2</h6>
                        </div>
                    </div>
                </div>
                <!-- Penutup Header Jurusan -->

                <!-- Menampilkan nama jurusan -->
                <div class="card-body px-0 pt-0 pb-2 flex-grow-1">
                    <div class="p-0 overflow-y: auto">
                        <table class="table align-items-center justify-content-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase bg-cek text-white text-xxs font-weight-bolder opacity-7">ID Matkul</th>
                                    <th class="text-uppercase bg-gradient-info text-white text-xxs font-weight-bolder opacity-7 ps-2">Jurusan</th>
                                    <th class="text-uppercase bg-cek text-white text-xxs font-weight-bolder opacity-7 ps-2">Nama Matkul</th>
                                    <th class="text-uppercase bg-gradient-info text-white text-xxs font-weight-bolder opacity-7 ps-2">Sks</th>
                                    <th class="text-center text-uppercase bg-cek text-white text-xxs font-weight-bolder opacity-7">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($matkuls as $m)
                                <tr>
                                    <td>
                                        <div class="d-flex px-2">
                                            <div class="my-auto">
                                                <h6 class="mb-0 text-sm">{{ $m->id }}</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-sm font-weight-bold mb-0">{{ $m->jurusan->nama_jurusan }}</p>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">{{ $m->nama_matkul }}</span>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">{{ $m->sks }}</span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="col-lg-6 col-5 my-auto text-end">
                                            <div class="dropdown float-lg-end pe-4">
                                                <a class="cursor-pointer" id="dropdownTable" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa fa-ellipsis-v text-secondary"></i>
                                                </a>
                                                <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5" aria-labelledby="dropdownTable">
                                                    <li><a class="dropdown-item border-radius-md" href="{{ route('matkuls.update', $m->id) }}"><i class="fa fa-pencil text-xs"></i> Edit</a></li>
                                                    <!-- Untuk menghapus -->
                                                    <form action="{{ route('matkuls.destroy', $m->id) }}" method="POST"> <!-- route ke JurusanController -->
                                                        @csrf
                                                        @method('DELETE')
                                                        <button class="dropdown-item border-radius-md" onclick="javascript:return confirm('Apakah ingin menghapus data Matkuls?')" type="submit"><i class="fa fa-trash text-xs"></i> Hapus</button>
                                                    </form>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Penutup Menampilkan nama jurusan -->

            </div>
        </div>
    </div>

</div>
<!-- Penutup Data Matkul 2 -->

<!-- Data Jurusan -->
<div class="container-fluid py-4 flex-grow-1 d-flex flex-column">

    <div class="row flex-grow-1">
        <div class="col-12">
            <div class="card mb-4 h-100 d-flex flex-column">
                <!-- Header Jurusan -->
                <div class="card-header pb-0 bg-grad-hijau-ungu">
                    <div class="row">
                        <div class="col">
                            <h6 class="text-white">Data Jurusan</h6>
                        </div>
                    </div>
                </div>
                <!-- Penutup Header Matkul 2 -->

                <!-- Menampilkan nama jurusan -->
                <div class="card-body px-0 pt-0 pb-2 flex-grow-1">
                    <div class="p-0 overflow-y: auto">
                        <table class="table align-items-center justify-content-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase bg-cek text-white text-xxs font-weight-bolder opacity-7">ID Jurusan</th>
                                    <th class="text-uppercase bg-gradient-info text-white text-xxs font-weight-bolder opacity-7 ps-2">Code Jurusan</th>
                                    <th class="text-uppercase bg-cek text-white text-xxs font-weight-bolder opacity-7 ps-2">Nama Jurusan</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($jurusans as $j)
                                <tr>
                                    <td>
                                        <div class="d-flex px-2">
                                            <div class="my-auto">
                                                <h6 class="mb-0 text-sm">{{ $j->id }}</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="text-sm font-weight-bold mb-0">{{ $j->code }}</p>
                                    </td>
                                    <td>
                                        <span class="text-xs font-weight-bold">{{ $j->nama_jurusan }}</span>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Penutup Menampilkan nama jurusan -->

            </div>
        </div>
    </div>

</div>
<!-- Penutup Data Jurusan -->

@endsection