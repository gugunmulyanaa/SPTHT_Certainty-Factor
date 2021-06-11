-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 01 Sep 2020 pada 08.42
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `works_sp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala`
--

CREATE TABLE `gejala` (
  `id` int(11) NOT NULL,
  `kelompok_gejala_id` int(11) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `nama_gejala` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gejala`
--

INSERT INTO `gejala` (`id`, `kelompok_gejala_id`, `kode`, `nama_gejala`) VALUES
(37, 1, 'G01', 'Daunnya Kering atau Menggulung'),
(38, 1, 'G02', 'Batangnya Lemah'),
(39, 1, 'G03', 'Daun Berwarna Coklat'),
(40, 1, 'G04', 'Tidak ada Pertumbuhan Daun'),
(41, 1, 'G05', 'Berlubang-lubang'),
(42, 1, 'G06', 'Terdapat Kotoran ulat di permukaanya'),
(43, 1, 'G07', 'Kuncup gagal menjadi bunga akhirnya bunga rontok'),
(44, 1, 'G08', 'Bercak-Bercak pada daun'),
(45, 1, 'G09', 'Daun melepuh kemudian rontok'),
(47, 1, 'G010', 'Permukaan daun baik atas maupun bawah menjadi hitam dan terdapat kerumunan semut'),
(48, 1, 'G011', 'Terdapat telur lalat di permukaan bawah daun'),
(49, 1, 'G012', 'Tanaman kelihatan layu'),
(50, 1, 'G013', 'Mahkota Rontok'),
(51, 1, 'G014', 'Pucuk daun keriting'),
(52, 1, 'G015', 'Daun sobek dan menguning'),
(53, 1, 'G016', 'Tangkai dan akar akan membusuk'),
(54, 1, 'G017', 'Pada batang ada hewan cabuk tapi masuk ke dalam kulit batang sehingga batang terlihat bintik-bintik merah'),
(55, 1, 'G018', 'Tidak bisa tumbuh daun baru'),
(56, 1, 'G019', 'Kalau disiram air tidak cepat habis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gejala_penyakit`
--

CREATE TABLE `gejala_penyakit` (
  `id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `penyakit_id` int(11) NOT NULL,
  `md` float NOT NULL,
  `mb` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gejala_penyakit`
--

INSERT INTO `gejala_penyakit` (`id`, `gejala_id`, `penyakit_id`, `md`, `mb`) VALUES
(97, 37, 10, 0.2, 0.4),
(98, 38, 10, 0.4, 0.6),
(99, 39, 10, 0.4, 0.6),
(100, 40, 10, 0.4, 0.8),
(101, 41, 11, 0.4, 0.6),
(102, 42, 11, 0.6, 0.4),
(103, 43, 12, 0.6, 0.6),
(104, 44, 11, 0.4, 0.6),
(105, 41, 12, 0.4, 0.6),
(106, 44, 12, 0.4, 0.6),
(107, 45, 12, 0.6, 0.8),
(108, 47, 13, 0.6, 0.8),
(109, 48, 13, 0.4, 0.8),
(110, 49, 14, 0.2, 0.4),
(111, 50, 14, 0.4, 0.6),
(112, 52, 14, 0, 0.6),
(113, 53, 14, 0, 0.8),
(114, 38, 15, 0.4, 0.6),
(115, 54, 15, 0, 0.6),
(116, 55, 16, 0, 0.6),
(117, 56, 16, 0, 0.6),
(118, 53, 16, 0, 0.8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_diagnosa`
--

CREATE TABLE `hasil_diagnosa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `kepercayaan` float NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hasil_diagnosa`
--

INSERT INTO `hasil_diagnosa` (`id`, `user_id`, `kode`, `nama`, `kepercayaan`, `keterangan`, `created_at`) VALUES
(1, 3, 'P005', 'Coriza/Snot', 76, 'Penyakit yang menyerang sistem pernapasan dan disebabkan oleh bakteri', '2018-08-13 16:54:20'),
(2, 3, 'P004', 'Pullorum/Berak Kapus', 98.4, 'Penyakit ini menimbulkan mortalitas yang sangat tinggi pada anak ayam umur 1-10 hari dan memiliki masa inkubasi 7 hari', '2018-08-13 16:55:06'),
(3, 5, 'P002', 'Corela', 98.824, 'Penyakit ini sangat erat hubungannya dengan berbagai faktor pemicu stress seperti fluktuasi cuaca, kelembaban, pindah kandang, dan transportasi', '2018-08-13 16:57:46'),
(4, 3, 'P004', 'Pullorum/Berak Kapus', 98, 'Penyakit ini menimbulkan mortalitas yang sangat tinggi pada anak ayam umur 1-10 hari dan memiliki masa inkubasi 7 hari', '2018-08-30 10:39:41'),
(5, 3, 'P001', 'Terelo/ND', 90, 'Terjadi karena infeksi viral yang berakibat gangguan pada saraf pernafasan, virus yang membawa penyakit ini adalah virus paramyxo', '2018-08-30 10:41:04'),
(6, 6, 'P002', 'Corela', 98, 'Penyakit ini sangat erat hubungannya dengan berbagai faktor pemicu stress seperti fluktuasi cuaca, kelembaban, pindah kandang, dan transportasi', '2018-08-30 11:18:05'),
(7, 3, 'P004', 'Pullorum/Berak Kapus', 80, 'Penyakit ini menimbulkan mortalitas yang sangat tinggi pada anak ayam umur 1-10 hari dan memiliki masa inkubasi 7 hari', '2018-08-30 13:01:09'),
(8, 3, 'P005', 'Coriza/Snot', 95.2, 'Penyakit yang menyerang sistem pernapasan dan disebabkan oleh bakteri', '2018-08-30 15:43:26'),
(9, 3, 'P005', 'Coriza/Snot', 68, 'Penyakit yang menyerang sistem pernapasan dan disebabkan oleh bakteri', '2018-08-30 15:45:11'),
(10, 4, 'P005', 'Solusio Plasenta', 95.2, 'Konsultasi pada dokter sebaiknya segera dilakukan apabila seorang wanita hamil mengalami gejala seperti yang disebutkan untuk pemeriksaan lebih lanjut.\r\nMeskipun rawan terjadi di trimester ketiga, solusio plasenta juga bisa terjadi kapan saja setelah usia', '2018-09-05 00:22:36'),
(11, 3, 'P001', 'Kehamilan Ektropik', 99.6, 'Sebaiknya Anda segera ke rumah sakit jika mengalami gejala-gejala tersebut. Umumnya penyakit ini ditangani dengan suntikan methotrexate untuk menghentikan pertumbuhan sekaligus menghancurkan sel-sel yang sudah terbentuk. atau dengan cara operasi. Kehamila', '2018-09-05 09:16:38'),
(12, 3, 'P001', 'Kehamilan Ektropik', 80, 'Sebaiknya Anda segera ke rumah sakit jika mengalami gejala-gejala tersebut. Umumnya penyakit ini ditangani dengan suntikan methotrexate untuk menghentikan pertumbuhan sekaligus menghancurkan sel-sel yang sudah terbentuk. atau dengan cara operasi. Kehamila', '2018-09-05 10:12:04'),
(13, 4, 'P001', 'Kehamilan Ektropik', 99.6, 'Sebaiknya Anda segera ke rumah sakit jika mengalami gejala-gejala tersebut. Umumnya penyakit ini ditangani dengan suntikan methotrexate untuk menghentikan pertumbuhan sekaligus menghancurkan sel-sel yang sudah terbentuk. atau dengan cara operasi. Kehamila', '2018-09-07 12:56:57'),
(14, 3, 'P009', 'Infeksi Saluran Kemi', 90, 'Penyembuhan ISK dapat dilakukan dengan menggunakan obat-obatan antibiotik . Selain antibiotik, obat pereda nyeri seperti parasetamol juga mungkin diperlukan untuk meredakan demam atau rasa sakit yang ada.											', '2018-09-22 16:20:51'),
(15, 3, 'P009', 'Infeksi Saluran Kemi', 96, 'Penyembuhan ISK dapat dilakukan dengan menggunakan obat-obatan antibiotik . Selain antibiotik, obat pereda nyeri seperti parasetamol juga mungkin diperlukan untuk meredakan demam atau rasa sakit yang ada.											', '2018-09-22 16:34:33'),
(16, 0, 'P006', 'Preklampsia', 80, 'Karena penyebab preeklamsia dan eklamsia tidak diketahui secara pasti, maka langkah pencegahan cukup sulit dilakukan. Namun, dokter dapat menyarankan sejumlah hal kepada ibu hamil untuk meminimalisasi risiko terjadinya kedua kondisi tersebut beserta kompl', '2020-01-28 03:58:03'),
(17, 0, 'P004', 'Plasenta Previa', 60, 'Jika mengalami perdarahan dalam trimester kedua atau ketiga, sebaiknya Anda segera menghubungi dokter.\r\nPenanganan untuk plasenta previa umumnya  meliputi istirahat sebanyak mungkin, transfusi darah jika dibutuhkan, serta operasi caesar.\r\n											', '2020-01-28 03:58:54'),
(18, 0, 'P003', 'Mola Hidatidosa (Ham', 80, 'Karena kemiripan gejalanya dengan kehamilan biasa, hamil anggur cenderung tidak disadari oleh penderita. Konsultasi pada dokter sebaiknya segera dilakukan oleh wanita hamil apabila dirinya merasakan kejanggalan, terutama pada awal masa kehamilan.\r\n\r\nJika ', '2020-01-28 04:48:40'),
(19, 0, 'P01', 'Kutu Daun', 60, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-05-26 10:50:38'),
(20, 0, 'P02', 'Ulat', 84, '										', '2020-05-26 10:51:10'),
(21, 0, 'P02', 'Ulat', 84, '										', '2020-05-26 11:06:43'),
(22, 0, 'P01', 'Kutu Daun', 92, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-05-26 11:13:24'),
(23, 0, 'P02', 'Ulat', 60, '										', '2020-05-26 11:14:48'),
(24, 0, 'P02', 'Ulat', 84, '										', '2020-05-26 11:15:29'),
(25, 0, 'P02', 'Ulat', 60, '										', '2020-05-26 11:16:32'),
(26, 0, 'P01', 'Kutu Daun', 92, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-05-26 11:22:01'),
(27, 0, 'P05', 'Jamur', 80, '											', '2020-05-26 12:31:54'),
(28, 0, 'P01', 'Kutu Daun', 80, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-05-26 12:33:10'),
(29, 0, 'P04', 'Cabuk Putih', 80, '											', '2020-05-28 13:13:36'),
(30, 0, 'P05', 'Jamur', 76, '											', '2020-05-28 13:14:30'),
(31, 0, 'P04', 'Cabuk Putih', 80, '											', '2020-05-28 13:20:43'),
(32, 0, 'P05', 'Jamur', 76, '											', '2020-05-28 13:22:40'),
(33, 0, 'P07', 'Tumor Akar', 84, '											', '2020-05-29 03:47:14'),
(34, 0, 'P01', 'Kutu Daun', 80, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-07-01 12:22:41'),
(35, 0, 'P04', 'Cabuk Putih', 76, '											', '2020-07-05 11:36:35'),
(36, 0, 'P03', 'Thrips', 80, '											', '2020-07-13 07:07:31'),
(37, 0, 'P01', 'Kutu Daun', 84, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-07-13 07:08:21'),
(38, 0, 'P02', 'Ulat', 84, '										', '2020-07-15 14:14:44'),
(39, 0, 'P02', 'Ulat', 84, '										', '2020-07-15 14:16:54'),
(40, 0, 'P02', 'Ulat', 84, '										', '2020-07-15 14:17:25'),
(41, 0, 'P02', 'Ulat', 84, '										', '2020-07-15 14:18:07'),
(42, 0, 'P07', 'Tumor Akar', 84, '											', '2020-07-15 14:18:42'),
(43, 0, 'P03', 'Thrips', 76, '											', '2020-07-15 14:19:07'),
(44, 0, 'P03', 'Thrips', 76, '											', '2020-07-29 11:01:32'),
(45, 0, 'P03', 'Thrips', 76, '											', '2020-08-05 08:15:58'),
(46, 0, 'P02', 'Ulat', 84, '										', '2020-08-05 08:43:51'),
(47, 0, 'P03', 'Thrips', 76, '											', '2020-08-08 12:14:59'),
(48, 0, 'P03', 'Thrips', 76, '											', '2020-08-25 15:29:05'),
(49, 0, 'P02', 'Ulat', -16, '										', '2020-08-25 22:58:11'),
(50, 0, 'P02', 'Ulat', -16, '										', '2020-08-25 22:59:05'),
(51, 0, 'P03', 'Thrips', 76, '											', '2020-08-25 23:01:17'),
(52, 0, 'P03', 'Thrips', 76, '											', '2020-08-26 09:54:59'),
(53, 0, 'P02', 'Ulat', 84, '										', '2020-08-26 10:12:50'),
(54, 0, 'P01', 'Kutu Daun', 40, 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			', '2020-08-26 10:28:32'),
(55, 0, 'P02', 'Ulat', 84, '										', '2020-08-26 10:29:07'),
(56, 0, 'P03', 'Thrips', 40, '											', '2020-08-29 04:03:00'),
(57, 0, 'P03', 'Thrips', 12, '											', '2020-08-31 07:55:56'),
(58, 0, 'P02', 'Ulat', 20, '										', '2020-08-31 07:57:15'),
(59, 0, 'P03', 'Thrips', 12, '											', '2020-08-31 08:04:51'),
(60, 0, 'P02', 'Ulat', 20, '										', '2020-08-31 08:06:54'),
(61, 0, 'P03', 'Thrips', 12, '											', '2020-08-31 08:13:37'),
(62, 0, 'P04', 'Cabuk Putih', 20, '											', '2020-08-31 08:14:28'),
(63, 0, 'P05', 'Jamur', 80, '											', '2020-08-31 08:15:04'),
(64, 0, 'P06', 'Cabuk Merah Pada Bat', 60, '											', '2020-08-31 08:17:37'),
(65, 0, 'P06', 'Cabuk Merah Pada Bat', 20, '											', '2020-08-31 08:19:41'),
(66, 0, 'P02', 'Ulat', 60, '										', '2020-09-01 02:58:55'),
(67, 0, 'P02', 'Ulat', 16, '										', '2020-09-01 03:03:03'),
(68, 0, 'P03', 'Thrips', 20, '											', '2020-09-01 03:05:23'),
(69, 0, 'P03', 'Thrips', 36, '											', '2020-09-01 03:06:48'),
(70, 0, 'P03', 'Thrips', 148, '											', '2020-09-01 03:22:43'),
(71, 0, 'P03', 'Thrips', 20, '											', '2020-09-01 03:23:03'),
(72, 0, 'P03', 'Thrips', 20, '											', '2020-09-01 03:28:31'),
(73, 0, 'P03', 'Thrips', 20, '											', '2020-09-01 06:29:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `user_id` int(11) NOT NULL,
  `gejala_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`user_id`, `gejala_id`, `created_at`) VALUES
(3, 5, '2018-08-30 10:39:41'),
(3, 6, '2018-08-30 10:39:41'),
(3, 11, '2018-08-30 10:39:41'),
(3, 12, '2018-08-30 10:39:41'),
(3, 8, '2018-08-30 10:41:04'),
(3, 7, '2018-08-30 10:41:04'),
(6, 7, '2018-08-30 11:18:05'),
(6, 9, '2018-08-30 11:18:05'),
(6, 10, '2018-08-30 11:18:05'),
(3, 10, '2018-08-30 13:01:09'),
(3, 11, '2018-08-30 13:01:09'),
(3, 1, '2018-08-30 15:43:26'),
(3, 2, '2018-08-30 15:43:26'),
(3, 3, '2018-08-30 15:43:26'),
(3, 1, '2018-08-30 15:45:11'),
(3, 4, '2018-08-30 15:45:11'),
(3, 5, '2018-08-30 15:45:11'),
(3, 6, '2018-08-30 15:45:11'),
(0, 9, '2018-08-31 07:08:35'),
(0, 10, '2018-08-31 07:08:35'),
(3, 16, '2018-09-04 14:34:02'),
(3, 17, '2018-09-04 14:34:02'),
(3, 18, '2018-09-04 14:34:02'),
(3, 20, '2018-09-04 14:34:02'),
(3, 16, '2018-09-04 14:34:32'),
(3, 17, '2018-09-04 14:34:32'),
(3, 18, '2018-09-04 14:34:32'),
(3, 20, '2018-09-04 14:34:32'),
(3, 32, '2018-09-04 14:34:32'),
(3, 33, '2018-09-04 14:34:32'),
(4, 1, '2018-09-05 00:22:36'),
(4, 2, '2018-09-05 00:22:36'),
(4, 3, '2018-09-05 00:22:36'),
(4, 28, '2018-09-05 00:41:54'),
(4, 31, '2018-09-05 00:41:54'),
(4, 32, '2018-09-05 00:41:54'),
(4, 28, '2018-09-05 00:44:03'),
(4, 31, '2018-09-05 00:44:03'),
(4, 32, '2018-09-05 00:44:03'),
(3, 1, '2018-09-05 09:16:38'),
(3, 2, '2018-09-05 09:16:38'),
(3, 3, '2018-09-05 09:16:38'),
(3, 4, '2018-09-05 09:16:38'),
(3, 1, '2018-09-05 10:12:03'),
(4, 1, '2018-09-07 12:56:57'),
(4, 2, '2018-09-07 12:56:57'),
(4, 3, '2018-09-07 12:56:57'),
(3, 30, '2018-09-22 16:20:50'),
(3, 33, '2018-09-22 16:34:33'),
(3, 30, '2018-09-22 16:34:33'),
(0, 1, '2020-01-28 03:56:02'),
(0, 18, '2020-01-28 03:56:02'),
(0, 1, '2020-01-28 03:57:43'),
(0, 18, '2020-01-28 03:57:43'),
(0, 1, '2020-01-28 03:57:47'),
(0, 18, '2020-01-28 03:57:47'),
(0, 1, '2020-01-28 03:58:03'),
(0, 18, '2020-01-28 03:58:03'),
(0, 1, '2020-01-28 03:58:53'),
(0, 2, '2020-01-28 03:58:53'),
(0, 3, '2020-01-28 03:58:53'),
(0, 4, '2020-01-28 03:58:53'),
(0, 15, '2020-01-28 03:58:53'),
(0, 17, '2020-01-28 03:58:53'),
(0, 33, '2020-01-28 03:58:53'),
(0, 35, '2020-01-28 03:58:53'),
(0, 36, '2020-01-28 03:58:53'),
(0, 4, '2020-01-28 04:48:40'),
(0, 5, '2020-01-28 04:48:40'),
(0, 6, '2020-01-28 04:48:40'),
(0, 9, '2020-01-28 04:48:40'),
(0, 10, '2020-01-28 04:48:40'),
(0, 11, '2020-01-28 04:48:40'),
(0, 15, '2020-01-28 04:48:40'),
(0, 31, '2020-01-28 04:48:40'),
(0, 32, '2020-01-28 04:48:40'),
(0, 33, '2020-01-28 04:48:40'),
(0, 35, '2020-01-28 04:48:40'),
(0, 36, '2020-01-28 04:48:40'),
(0, 37, '2020-05-26 10:50:38'),
(0, 38, '2020-05-26 10:50:38'),
(0, 39, '2020-05-26 10:50:38'),
(0, 41, '2020-05-26 10:51:10'),
(0, 42, '2020-05-26 10:51:10'),
(0, 43, '2020-05-26 10:51:10'),
(0, 41, '2020-05-26 11:06:43'),
(0, 44, '2020-05-26 11:06:43'),
(0, 37, '2020-05-26 11:13:23'),
(0, 38, '2020-05-26 11:13:23'),
(0, 39, '2020-05-26 11:13:23'),
(0, 40, '2020-05-26 11:13:23'),
(0, 41, '2020-05-26 11:14:48'),
(0, 42, '2020-05-26 11:14:48'),
(0, 44, '2020-05-26 11:14:48'),
(0, 41, '2020-05-26 11:15:29'),
(0, 43, '2020-05-26 11:15:29'),
(0, 44, '2020-05-26 11:15:29'),
(0, 47, '2020-05-26 11:16:11'),
(0, 48, '2020-05-26 11:16:11'),
(0, 44, '2020-05-26 11:16:32'),
(0, 47, '2020-05-26 11:16:32'),
(0, 48, '2020-05-26 11:16:32'),
(0, 37, '2020-05-26 11:22:01'),
(0, 38, '2020-05-26 11:22:01'),
(0, 39, '2020-05-26 11:22:01'),
(0, 40, '2020-05-26 11:22:01'),
(0, 53, '2020-05-26 12:31:54'),
(0, 55, '2020-05-26 12:31:54'),
(0, 56, '2020-05-26 12:31:54'),
(0, 40, '2020-05-26 12:33:10'),
(0, 43, '2020-05-26 12:33:10'),
(0, 50, '2020-05-26 12:33:10'),
(0, 55, '2020-05-26 12:33:10'),
(0, 48, '2020-05-28 13:13:36'),
(0, 49, '2020-05-28 13:13:36'),
(0, 50, '2020-05-28 13:13:36'),
(0, 49, '2020-05-28 13:14:30'),
(0, 50, '2020-05-28 13:14:30'),
(0, 47, '2020-05-28 13:20:43'),
(0, 49, '2020-05-28 13:20:43'),
(0, 50, '2020-05-28 13:20:43'),
(0, 48, '2020-05-28 13:22:40'),
(0, 49, '2020-05-28 13:22:40'),
(0, 50, '2020-05-28 13:22:40'),
(0, 51, '2020-05-28 13:22:40'),
(0, 55, '2020-05-29 03:47:14'),
(0, 56, '2020-05-29 03:47:14'),
(0, 37, '2020-07-01 12:22:41'),
(0, 39, '2020-07-01 12:22:41'),
(0, 40, '2020-07-01 12:22:41'),
(0, 44, '2020-07-05 11:36:35'),
(0, 47, '2020-07-05 11:36:35'),
(0, 48, '2020-07-05 11:36:35'),
(0, 39, '2020-07-13 07:07:31'),
(0, 41, '2020-07-13 07:07:31'),
(0, 43, '2020-07-13 07:07:31'),
(0, 45, '2020-07-13 07:07:31'),
(0, 38, '2020-07-13 07:08:21'),
(0, 39, '2020-07-13 07:08:21'),
(0, 41, '2020-07-13 07:08:21'),
(0, 44, '2020-07-13 07:08:21'),
(0, 37, '2020-07-15 14:14:44'),
(0, 41, '2020-07-15 14:14:44'),
(0, 44, '2020-07-15 14:14:44'),
(0, 37, '2020-07-15 14:16:54'),
(0, 41, '2020-07-15 14:16:54'),
(0, 44, '2020-07-15 14:16:54'),
(0, 41, '2020-07-15 14:17:25'),
(0, 44, '2020-07-15 14:17:25'),
(0, 56, '2020-07-15 14:17:25'),
(0, 41, '2020-07-15 14:18:06'),
(0, 44, '2020-07-15 14:18:06'),
(0, 56, '2020-07-15 14:18:06'),
(0, 54, '2020-07-15 14:18:42'),
(0, 55, '2020-07-15 14:18:42'),
(0, 56, '2020-07-15 14:18:42'),
(0, 41, '2020-07-15 14:19:07'),
(0, 42, '2020-07-15 14:19:07'),
(0, 44, '2020-07-15 14:19:07'),
(0, 41, '2020-07-29 11:01:32'),
(0, 42, '2020-07-29 11:01:32'),
(0, 44, '2020-07-29 11:01:32'),
(0, 41, '2020-08-05 08:15:58'),
(0, 42, '2020-08-05 08:15:58'),
(0, 44, '2020-08-05 08:15:58'),
(0, 41, '2020-08-05 08:43:51'),
(0, 42, '2020-08-05 08:43:51'),
(0, 43, '2020-08-05 08:43:51'),
(0, 41, '2020-08-08 12:14:59'),
(0, 42, '2020-08-08 12:14:59'),
(0, 44, '2020-08-08 12:14:59'),
(0, 41, '2020-08-25 15:29:05'),
(0, 42, '2020-08-25 15:29:05'),
(0, 44, '2020-08-25 15:29:05'),
(0, 41, '2020-08-25 22:58:11'),
(0, 43, '2020-08-25 22:58:11'),
(0, 44, '2020-08-25 22:58:11'),
(0, 41, '2020-08-25 22:59:05'),
(0, 43, '2020-08-25 22:59:05'),
(0, 44, '2020-08-25 22:59:05'),
(0, 41, '2020-08-25 23:01:17'),
(0, 42, '2020-08-25 23:01:17'),
(0, 44, '2020-08-25 23:01:17'),
(0, 41, '2020-08-26 09:54:59'),
(0, 42, '2020-08-26 09:54:59'),
(0, 44, '2020-08-26 09:54:59'),
(0, 41, '2020-08-26 10:12:50'),
(0, 44, '2020-08-26 10:12:50'),
(0, 53, '2020-08-26 10:12:50'),
(0, 37, '2020-08-26 10:28:32'),
(0, 41, '2020-08-26 10:29:07'),
(0, 44, '2020-08-26 10:29:07'),
(0, 41, '2020-08-29 04:03:00'),
(0, 42, '2020-08-29 04:03:00'),
(0, 44, '2020-08-29 04:03:00'),
(0, 41, '2020-08-31 07:55:56'),
(0, 42, '2020-08-31 07:55:56'),
(0, 44, '2020-08-31 07:55:56'),
(0, 41, '2020-08-31 07:57:15'),
(0, 43, '2020-08-31 07:57:15'),
(0, 44, '2020-08-31 07:57:15'),
(0, 41, '2020-08-31 08:04:51'),
(0, 42, '2020-08-31 08:04:51'),
(0, 44, '2020-08-31 08:04:51'),
(0, 41, '2020-08-31 08:06:54'),
(0, 43, '2020-08-31 08:06:54'),
(0, 44, '2020-08-31 08:06:54'),
(0, 45, '2020-08-31 08:06:54'),
(0, 41, '2020-08-31 08:13:36'),
(0, 42, '2020-08-31 08:13:36'),
(0, 44, '2020-08-31 08:13:36'),
(0, 47, '2020-08-31 08:14:28'),
(0, 48, '2020-08-31 08:14:28'),
(0, 53, '2020-08-31 08:15:04'),
(0, 55, '2020-08-31 08:15:04'),
(0, 56, '2020-08-31 08:15:04'),
(0, 37, '2020-08-31 08:17:37'),
(0, 38, '2020-08-31 08:17:37'),
(0, 39, '2020-08-31 08:17:37'),
(0, 40, '2020-08-31 08:17:37'),
(0, 37, '2020-08-31 08:19:41'),
(0, 38, '2020-08-31 08:19:41'),
(0, 39, '2020-08-31 08:19:41'),
(0, 40, '2020-08-31 08:19:41'),
(0, 41, '2020-09-01 02:58:55'),
(0, 42, '2020-09-01 02:58:55'),
(0, 44, '2020-09-01 02:58:55'),
(0, 41, '2020-09-01 03:03:03'),
(0, 42, '2020-09-01 03:03:03'),
(0, 43, '2020-09-01 03:03:03'),
(0, 41, '2020-09-01 03:05:23'),
(0, 42, '2020-09-01 03:05:23'),
(0, 44, '2020-09-01 03:05:23'),
(0, 41, '2020-09-01 03:06:48'),
(0, 42, '2020-09-01 03:06:48'),
(0, 44, '2020-09-01 03:06:48'),
(0, 41, '2020-09-01 03:22:43'),
(0, 42, '2020-09-01 03:22:43'),
(0, 44, '2020-09-01 03:22:43'),
(0, 41, '2020-09-01 03:23:03'),
(0, 42, '2020-09-01 03:23:03'),
(0, 44, '2020-09-01 03:23:03'),
(0, 41, '2020-09-01 03:28:31'),
(0, 42, '2020-09-01 03:28:31'),
(0, 44, '2020-09-01 03:28:31'),
(0, 41, '2020-09-01 06:29:09'),
(0, 42, '2020-09-01 06:29:09'),
(0, 44, '2020-09-01 06:29:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelompok_gejala`
--

CREATE TABLE `kelompok_gejala` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelompok_gejala`
--

INSERT INTO `kelompok_gejala` (`id`, `nama`, `keterangan`) VALUES
(1, 'Gejala Fisik', '-'),
(2, 'Gejala Non Fisik', '-');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit`
--

CREATE TABLE `penyakit` (
  `id` int(11) NOT NULL,
  `kode` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`id`, `kode`, `nama`, `keterangan`) VALUES
(10, 'P01', 'Kutu Daun', 'Dengan Memindah Tanaman Tersebut Ketempat Yang steril																			'),
(11, 'P02', 'Ulat', '										'),
(12, 'P03', 'Thrips', '											'),
(13, 'P04', 'Cabuk Putih', '											'),
(14, 'P05', 'Jamur', '											'),
(15, 'P06', 'Cabuk Merah Pada Batang', '											'),
(16, 'P07', 'Tumor Akar', '											');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level` varchar(10) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `email`, `level`, `status`) VALUES
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'mochammadsoelaksono@gmail.com', 'admin', ''),
(5, 'mamad', 'adbbc2fab9fc98641cdc502e091c15c7', 'mamad', 'soelaksono13@gmail.com', 'admin', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userx`
--

CREATE TABLE `userx` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `userx`
--

INSERT INTO `userx` (`id`, `username`, `password`, `nama`, `email`, `level`) VALUES
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'hardianti', 'hardiantix.1@gmail.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelompok_gejala_id` (`kelompok_gejala_id`);

--
-- Indexes for table `gejala_penyakit`
--
ALTER TABLE `gejala_penyakit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gejala_id` (`gejala_id`),
  ADD KEY `penyakit_id` (`penyakit_id`);

--
-- Indexes for table `hasil_diagnosa`
--
ALTER TABLE `hasil_diagnosa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelompok_gejala`
--
ALTER TABLE `kelompok_gejala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userx`
--
ALTER TABLE `userx`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `gejala_penyakit`
--
ALTER TABLE `gejala_penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `hasil_diagnosa`
--
ALTER TABLE `hasil_diagnosa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `kelompok_gejala`
--
ALTER TABLE `kelompok_gejala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `userx`
--
ALTER TABLE `userx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gejala`
--
ALTER TABLE `gejala`
  ADD CONSTRAINT `gejala_ibfk_1` FOREIGN KEY (`kelompok_gejala_id`) REFERENCES `kelompok_gejala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gejala_penyakit`
--
ALTER TABLE `gejala_penyakit`
  ADD CONSTRAINT `gejala_penyakit_ibfk_1` FOREIGN KEY (`gejala_id`) REFERENCES `gejala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gejala_penyakit_ibfk_2` FOREIGN KEY (`penyakit_id`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
