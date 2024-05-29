-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for epresensi
DROP DATABASE IF EXISTS `epresensi`;
CREATE DATABASE IF NOT EXISTS `epresensi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `epresensi`;

-- Dumping structure for table epresensi.absens
DROP TABLE IF EXISTS `absens`;
CREATE TABLE IF NOT EXISTS `absens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `materi_id` bigint(20) unsigned NOT NULL,
  `mahasiswa_id` bigint(20) unsigned NOT NULL,
  `status` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `jam_absen` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absens_materi_id_foreign` (`materi_id`),
  KEY `absens_mahasiswa_id_foreign` (`mahasiswa_id`),
  CONSTRAINT `absens_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`),
  CONSTRAINT `absens_materi_id_foreign` FOREIGN KEY (`materi_id`) REFERENCES `materis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.ajarans
DROP TABLE IF EXISTS `ajarans`;
CREATE TABLE IF NOT EXISTS `ajarans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tahun` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.arip_pendidikan
DROP TABLE IF EXISTS `arip_pendidikan`;
CREATE TABLE IF NOT EXISTS `arip_pendidikan` (
  `id_arpen` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_arpen` varchar(100) NOT NULL,
  `deskripsi_arpen` varchar(100) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  PRIMARY KEY (`id_arpen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.dosens
DROP TABLE IF EXISTS `dosens`;
CREATE TABLE IF NOT EXISTS `dosens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jurusan_id` bigint(20) NOT NULL,
  `nidn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dosen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile/user(1).png',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_wa` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dosens_nidn_unique` (`nidn`),
  KEY `fk_dosen_jurusan` (`jurusan_id`),
  CONSTRAINT `fk_dosen_jurusan` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.histories
DROP TABLE IF EXISTS `histories`;
CREATE TABLE IF NOT EXISTS `histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ajaran_id` bigint(20) unsigned NOT NULL,
  `mahasiswa_id` bigint(20) unsigned NOT NULL,
  `kelas_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `histories_ajaran_id_foreign` (`ajaran_id`),
  KEY `histories_mahasiswa_id_foreign` (`mahasiswa_id`),
  KEY `histories_kelas_id_foreign` (`kelas_id`),
  CONSTRAINT `histories_ajaran_id_foreign` FOREIGN KEY (`ajaran_id`) REFERENCES `ajarans` (`id`),
  CONSTRAINT `histories_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`),
  CONSTRAINT `histories_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.jurusans
DROP TABLE IF EXISTS `jurusans`;
CREATE TABLE IF NOT EXISTS `jurusans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_jurusan` varchar(191) CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.kategori
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.kelas
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE IF NOT EXISTS `kelas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kelas_jurusan` (`jurusan_id`),
  CONSTRAINT `fk_kelas_jurusan` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.mahasiswas
DROP TABLE IF EXISTS `mahasiswas`;
CREATE TABLE IF NOT EXISTS `mahasiswas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_mhs` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mahasiswas_nim_unique` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=1479 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.materis
DROP TABLE IF EXISTS `materis`;
CREATE TABLE IF NOT EXISTS `materis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mengajar_id` bigint(20) unsigned NOT NULL,
  `pertemuan_ke` int(11) NOT NULL,
  `nama_materi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interaksi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_awal` int(11) NOT NULL,
  `jam_akhir` int(11) NOT NULL,
  `qrcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttd_ketua` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttd_dosen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeawal` time NOT NULL,
  `timeakhir` time NOT NULL,
  `onoff` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materis_mengajar_id_foreign` (`mengajar_id`),
  CONSTRAINT `materis_mengajar_id_foreign` FOREIGN KEY (`mengajar_id`) REFERENCES `mengajars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.matkuls
DROP TABLE IF EXISTS `matkuls`;
CREATE TABLE IF NOT EXISTS `matkuls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jurusan_id` bigint(20) NOT NULL,
  `nama_matkul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matkuls_jurusans` (`jurusan_id`),
  CONSTRAINT `fk_matkuls_jurusans` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.mengajars
DROP TABLE IF EXISTS `mengajars`;
CREATE TABLE IF NOT EXISTS `mengajars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dosen_id` bigint(20) unsigned NOT NULL,
  `matkul_id` bigint(20) unsigned NOT NULL,
  `ajaran_id` bigint(20) unsigned NOT NULL,
  `kelas_id` bigint(20) unsigned NOT NULL,
  `semester` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menitsks` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jamkuliah` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_ttd` date DEFAULT NULL,
  `ttd` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mengajars_dosen_id_foreign` (`dosen_id`),
  KEY `mengajars_matkul_id_foreign` (`matkul_id`),
  KEY `mengajars_ajaran_id_foreign` (`ajaran_id`),
  KEY `mengajars_kelas_id_foreign` (`kelas_id`),
  CONSTRAINT `mengajars_ajaran_id_foreign` FOREIGN KEY (`ajaran_id`) REFERENCES `ajarans` (`id`),
  CONSTRAINT `mengajars_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosens` (`id`),
  CONSTRAINT `mengajars_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`),
  CONSTRAINT `mengajars_matkul_id_foreign` FOREIGN KEY (`matkul_id`) REFERENCES `matkuls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.pengajuans
DROP TABLE IF EXISTS `pengajuans`;
CREATE TABLE IF NOT EXISTS `pengajuans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mengajar_id` bigint(20) unsigned NOT NULL,
  `jurusan_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pengajuans_mengajar_id_foreign` (`mengajar_id`),
  KEY `fk_pengajuan_jurusan` (`jurusan_id`),
  CONSTRAINT `fk_pengajuan_jurusan` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`),
  CONSTRAINT `pengajuans_mengajar_id_foreign` FOREIGN KEY (`mengajar_id`) REFERENCES `mengajars` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.settingjurnals
DROP TABLE IF EXISTS `settingjurnals`;
CREATE TABLE IF NOT EXISTS `settingjurnals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jurusan_id` bigint(20) NOT NULL,
  `header` text COLLATE utf8mb4_unicode_ci,
  `nama_ketua` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npak` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_settingjurnal_jurusan` (`jurusan_id`),
  CONSTRAINT `fk_settingjurnal_jurusan` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.suratperingatans
DROP TABLE IF EXISTS `suratperingatans`;
CREATE TABLE IF NOT EXISTS `suratperingatans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mahasiswa_id` bigint(20) unsigned NOT NULL,
  `keterangan` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suratperingatans_mahasiswa_id_foreign` (`mahasiswa_id`),
  CONSTRAINT `suratperingatans_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table epresensi.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` char(16) NOT NULL,
  `kk` char(16) NOT NULL,
  `no_telp` char(13) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
