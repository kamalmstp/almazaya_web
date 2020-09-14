-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Sep 2020 pada 06.32
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almazaya_junior`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracerstudy_junior`
--

CREATE TABLE `tracerstudy_junior` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `tahun_ajaran` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `updated_by` timestamp NULL DEFAULT NULL,
  `created_by` timestamp NULL DEFAULT NULL,
  `year_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tracerstudy_junior`
--

INSERT INTO `tracerstudy_junior` (`id`, `nama`, `sekolah`, `tahun_ajaran`, `created_at`, `update_at`, `updated_by`, `created_by`, `year_id`) VALUES
(1, 'Muhammad Rais Norhidayat', 'SMA NEGERI 1 MARTAPURA', '2014/2015', '2020-09-11 06:51:04', NULL, NULL, '0000-00-00 00:00:00', 1),
(2, 'Halimah', 'SMA Barang Ay', NULL, '2020-09-11 08:29:50', NULL, NULL, '0000-00-00 00:00:00', 2),
(5, 'Kamal', 'AlmazayaJaya', NULL, '2020-09-11 08:35:29', NULL, NULL, '0000-00-00 00:00:00', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tracerstudy_junior`
--
ALTER TABLE `tracerstudy_junior`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracerstudy_junior_year_id` (`year_id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tracerstudy_junior`
--
ALTER TABLE `tracerstudy_junior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
