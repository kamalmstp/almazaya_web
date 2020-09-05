-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Sep 2020 pada 08.42
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
-- Struktur dari tabel `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2020-2021', 'odd', 'true', 'true', '2020-04-08 11:21:14', '2020-04-08 03:21:14', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT 0,
  `achievement_level` smallint(6) NOT NULL DEFAULT 0,
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_phases`
--

CREATE TABLE `admission_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admission_phases`
--

INSERT INTO `admission_phases` (`id`, `academic_year_id`, `phase_name`, `phase_start_date`, `phase_end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 'Gelombang 1', '2020-05-01', '2020-05-31', '2020-04-08 11:22:06', '2020-04-08 03:22:06', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admission_quotas`
--

CREATE TABLE `admission_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admission_quotas`
--

INSERT INTO `admission_quotas` (`id`, `academic_year_id`, `admission_type_id`, `major_id`, `quota`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 170, 0, 100, '2020-04-08 11:22:19', '2020-04-08 03:22:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT 0,
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', 'post', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Achievement', 'achievement', NULL, 'post', NULL, '2020-04-02 04:43:08', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT 0 COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT 0 COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT 0 COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_group_students`
--

CREATE TABLE `class_group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT 0,
  `student_id` bigint(20) DEFAULT 0,
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) DEFAULT 0,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text DEFAULT NULL,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT 0,
  `marriage_status_id` bigint(20) DEFAULT 0,
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT 0 COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT 0 COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT 0 COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT 0 COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT 0 COMMENT 'Pangkat / Golongan',
  `salary_source_id` bigint(20) DEFAULT 0 COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah ?',
  `laboratory_skill_id` bigint(20) DEFAULT 0 COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT 0,
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2020-03-15 19:18:36', '2020-04-02 03:50:50', '2020-04-02 10:50:50', NULL, 0, 0, 1, 0, 'true'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2020-03-15 19:18:36', '2020-04-02 03:50:50', '2020-04-02 10:50:50', NULL, 0, 0, 1, 0, 'true'),
(3, 'Tahfidz And Al-Qur\'an Recitation', '66ea73a6e6f3056b51c1254f07e9a092.jpg', '2020-04-02 12:59:28', '2020-04-02 05:01:52', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'Class Activity', 'fdc9400100198b61167d7a6a0de38dbb.jpg', '2020-04-03 10:20:36', '2020-04-03 02:20:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 'Science Laboratory', '6fa7785d20bc1a5228319600b9df1ef9.jpg', '2020-04-03 10:21:09', '2020-04-03 02:21:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Virtual Class', 'http://virtualclass.almazayaislamicschool.sch.id/', '_blank', NULL, 'link', '2020-03-15 19:18:35', '2020-04-02 05:02:13', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT 0,
  `menu_position` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 7, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'PPDB 2019', '#', '_self', 'links', 0, 5, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 6, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Kategori', '#', '_self', 'links', 0, 2, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'Uncategorized', 'kategori/uncategorized', '_self', 'post_categories', 10, 1, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'Direktori', '#', '_self', 'links', 0, 3, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'Direktori Alumni', 'direktori-alumni', '_self', 'modules', 12, 1, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'Direktori Peserta Didik', 'direktori-peserta-didik', '_self', 'modules', 12, 3, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'Direktori Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 2, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'Pendaftaran Alumni', 'pendaftaran-alumni', '_self', 'modules', 0, 4, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'Profil', 'read/2/profil', '_self', 'pages', 0, 1, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 0, 1, '2020-03-15 19:18:36', '2020-03-15 12:18:36', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Akademik', 'Akademik', 'academic', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kabupaten', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Propinsi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama orang tua', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'residences', 'Wali', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan pribadi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua yayasan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kabupaten/Kota', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(170, 'admission_types', 'Jalur Mandiri', '2020-04-08 11:08:48', '2020-04-08 03:08:48', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) DEFAULT 0,
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT 0,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext DEFAULT NULL,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT 0,
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false',
  `post_news` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`, `post_news`) VALUES
(1, '', '<p>\"Al Mazaya Islamic School Banjarmasin is Surroundded by Islamic atmosphere, hopefully will be a pioneer and superior in all aspect\"</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2020-03-15 19:18:36', '2020-04-02 04:19:39', NULL, NULL, 0, 1, 0, 0, 'false', NULL),
(2, 'Profil', '<p><strong>History</strong></p>\n<p>Al Mazaya Islamic School is a non-government school that has three big points in developing the education system. There are Islamic Studies, English and Technology.</p>\n<p>Islamic Studies, focusing on prayer (wajib and sunnah), al qur&rsquo;an (murajaah and tahfidz) and the application of akhlaqul qarimah.</p>\n<p>On English side, focusing on English skills of the students on listening and speaking sides. Students are expected to use English in daily conversation. The news and information delivered to students all are using English.</p>\n<p>Students are learning by using their tablets and they use e-books as their handout. All the files are transferred using wifi in every classroom. The students are also learinng using smartboard that has more feature then the ordinary board.</p>\n<p>Beside those big points above, Al Mazaya Islamic School also has great infrastructure to support the idea of International Class.</p>\n<p>&nbsp;&nbsp;</p>\n<p><strong>Founder</strong></p>\n<ul>\n<li>H. Taufik Hidayat, MM</li>\n<li>Hj. Sri Erliani, MM, M.Mkes</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>Our Programs</strong></p>\n<p>There are some programs which run well and become the appeal and characteristic of SMP Al Mazaya Islamic.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Tahfidz</strong></li>\n</ul>\n<p>Every student who joins in Al Mazaya Islamic School must be able to read and memorize Al Qur&rsquo;an. There is target that student has to fulfill and it is supported by all the teachers.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Super Camps</strong></li>\n</ul>\n<p>Al Mazaya Islamic School has a program that grows the student independence and confidence. Al Mazaya provide the students four camps to join in, they are Islamic Camp, English Camp, Science Camp and Maths Camp. In the camps, students will learn in different and fun way. There will be unique project in every camp as well.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Enrichment and Club</strong></li>\n</ul>\n<p>Enrichment program helps the low level students to upgrade their knowledge and skills to catch up and let them not left behind.</p>\n<p>Club program keeps and maintains the high level students to develop and sharpen their knowledge and skills. This program also prepares the students to join any competition.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Basarnas</strong></li>\n</ul>\n<p>Basarnas stands for Badan SAR Nasional. In this program, students learn about life skill that helps the students to be able to control their feeling in tight situation and know what to do. First year students learn about safety in the height and the second year students learn about safety in the water.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Translation</strong></li>\n</ul>\n<p>Al Qur&rsquo;an translation is held for the teachers before the teachers transfer the knowledge to the students. The aim of this program is to enrich the knowledge about Al Qur&rsquo;an and also to develop the Islamic side of the students.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Entrepreneurship</strong></li>\n</ul>\n<p>Entrepreneurship program is an annual program from SMP Al Mazaya to develop the skill of the students in entrepreneur side. On the first year, students sold food that they offered it to their friends and also the parents who took the report progress from their children.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Extracurricular</strong></li>\n</ul>\n<p>This program provides the students&rsquo; needs and also as the medium to relax their mind and fulfill their hobby of sport and art, such as basket, table tennis, badminton, futsal, drum band, Saman dance, etc.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Overseas</strong></li>\n</ul>\n<p>This program is for second grade of Al Mazaya&rsquo;s students. The students will choose the place they parents approve. The options for this year are Australia, Malaysia, Singapore and Banjarmasin itself.</p>\n<p>&nbsp;</p>\n<p><strong>Affiliates</strong></p>\n<p>&nbsp;</p>\n<p><strong>Badan Narkotika National (BNN)</strong></p>\n<p>BNN is an organization that concerns about prevention, elimination and misappropriation of drugs and addictive substance.</p>\n<p>&nbsp;</p>\n<p><strong>Kepolisian Daerah (Polda)</strong></p>\n<p>Polda is Regional Police that the position is under the National Police. The police officers help the people to solve the people problems and also remind the vehicles to be safety on the road</p>\n<p>&nbsp;</p>\n<p><strong>Badan SAR Nasional (Basarnas)</strong></p>\n<p>This organization helps the people to know what to do at the tight situation. How to give the first aid and how to treat people in a defective condition because of disaster.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'profil', 'berita, pengumuman, sekilas-info', 227, '2020-03-15 19:18:36', '2020-08-12 03:47:46', NULL, NULL, 0, 1, 0, 0, 'false', NULL),
(3, 'Visi dan Misi', '<p><strong>Vision &amp; Mission</strong></p>\n<ul>\n<li><strong>Vision</strong></li>\n</ul>\n<p><em>Provide the Islamic, discipline, smart, skillful, love the nation and has a global competitive mindset human resource.</em></p>\n<ul>\n<li><strong>Mission</strong></li>\n</ul>\n<p><em>Implement an interactive, inspiring, innovative, fun and challenging education and learning in order to make the students are able to actively participate, give the space for their creativity, be innovative and independent as their talents, interests, and the physical and psychological development.</em></p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 73, '2020-03-15 19:18:36', '2020-08-12 04:21:35', NULL, NULL, 0, 1, 0, 0, 'false', NULL),
(4, 'Sample Post 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-1', 'berita, pengumuman, sekilas-info', 5, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true', NULL),
(5, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true', NULL),
(6, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true', NULL),
(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true', NULL),
(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true', NULL),
(14, 'Student Achievment: Bellinda Zabrina Lailani', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place (1st) of South Kalimantan Level on <em><strong>\'Ki Hajar Dewantara Quiz Competition\'</strong></em> @ BTKIP Banjarmasin</li>\r\n<li>First Place (1st) of Banjarmasin City Level on <em><strong>\'English Speech Competition\'</strong></em> @Dhammasoka Junior High School</li>\r\n</ol>', '20180416101553_dscf7292crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-bellinda-zabrina-lailani', '', 4, '2018-04-16 10:15:53', '2020-08-12 06:35:31', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(15, 'Basketball', '<p><strong>Train the students of Al Mazaya Islamic School in terms of leadership, teamwork and competitiveness through basketball.</strong></p>', '20180416102310_dscf7213.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'basketball', '', 2, '2018-04-16 10:23:12', '2020-08-12 06:33:04', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(16, 'Almazaya Ramadhan Charity Day', '<p>Tiap sekolah biasanya punya event yang khusus diadakan di sekolah tersebut. Kegiatan seperti ini tentu sangat bermanfaat bagi sekolah dan siswa-siswinya. Bagi sekolah, event-event seperti ini mampu mendongkrak nama sekolah. Untuk para siswa, event dapat menjadi ajang untuk berkreasi dan melatih kerjasama.<br />Terus bagaimana cara buat event yang baik?<br />Ide Bersama<br />Panitia biasanya sudah menentukan ide untuk konsep dan tema event. Namun kenapa harus membatasi penentuan ide di kalangan panitia saja? Ide bisa datang dari mana dan siapa saja. Kita tidak pernah tahu ada diluar sana teman kita yang punya ide yang jauh lebih menarik. Kamu bisa pakai halaman Facebook sekolahmu, bagikan idemu dan lihat tanggapan mereka. Untuk lebih memotivasi mereka menuangkan ide-idenya, kamu juga bisa buat sayembara dengan hadiah yang menarik.<br />Kalau kamu merasa idenya masih kurang kreatif, berikut tips untuk menuangkan ide bersama:<br />Tulis event yang akan kamu buat di tengah-tengah papan tulis. Lalu ajak teman-temanmu menuliskan ide-ide yang muncul seketika itu juga di sekeliling nama event yang kamu buat sebelumnya.<br />Tidak ada ide yang buruk.<br />Ajak temanmu untuk bersama-sama membangun ide. Ingat, membangun ide dan mengeluarkan ide adalah hal yang berbeda. Mengeluarkan ide artinya mengemukakan pikiran-pikiran dalam kepala dan bersifat acak. Sedangkan membangun ide berarti mencoba menyempurnakan sebuah ide dengan berbagai detail yang saling terhubung satu sama lain.</p>\r\n<p>Proses pemikiran ide haruslah menyenangkan.</p>\r\n<p>Jangan takut dengan resiko dan jangan batasi dirimu terhadap apapun.</p>\r\n<p>Tentukan Tempat yang Cocok<br /><br />Hidupkan tema yang sudah kamu tentukan dengan lokasi yang sesuai. Coba lihat sekolahmu, dan bayangkan jika event yang akan kamu buat diadakan disitu. Akankah acara dan lokasinya bisa jadi satu kesatuan yang apik? Jika tidak coba cari tempat yang lain.<br /><br />&nbsp;<br /><br />Musik yang Menyatu dengan Tema<br /><br />Kamu pasti butuh musik di event yang kamu baik sebagai pengiring maupun sebagai performer. Diskusikan kepada pemain music tentang tema yang kamu buat. Minta pendapat mereka tentang dan pilih musik yang pas dengan tema tersebut.<br /><br />&nbsp;<br /><br />Buat Dekorasi yang Sesuai<br /><br />Buat lokasi lebih menarik dengan berbagai macam dekorasi. Kamu bisa mulai dengan backdrop, hiasan di langit-langit, hiasan di dinding,&nbsp; penunjuk arah sampai ke photo booth. Namun, sangat oenting untuk memastikan semuanya sejalan dengan tema yang telah kamu buat.<br /><br /><br />Ayo ikuti langkah-langkahnya dan buat event sekolah yang luar biasa.</p>', '20180220115117_dscf5098.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'almazaya-ramadhan-charity-day', '', 3, '2018-02-20 11:52:39', '2020-08-12 06:32:12', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(17, 'Tahfidz', '<p><strong>&nbsp;</strong></p>\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-ta tw-text-small\" dir=\"ltr\" data-placeholder=\"Translation\" data-fulltext=\"\"><span lang=\"en\">Tahfidz is one way to improve one\'s intelligence in memorizing the Quran. By memorizing students brain will more quickly absorb information also store it in the long term. The more frequent reading of the Qur\'an turns out to train also increased brain in digesting information that is very useful for Al Mazaya\'s students.</span></pre>', '20180302134256_dscf6110_(copy).jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'tahfidz', '', 9, '2018-04-16 10:32:09', '2020-08-12 06:31:29', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(18, 'Marching Band', '', '20180220115813_6c723503-9313-4942-a998-4bc9958067e9.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'marching-band', '', 0, '2018-02-20 11:58:14', '2020-08-12 06:31:01', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(19, 'Futsal', '<p><strong>Improve the attitude of sportsmanship, intelligence and forming the character in teamwork for students of Al Mazaya Islamic School.</strong></p>', '20180227085357_dscf6033.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'futsal', '', 2, '2018-02-27 09:32:54', '2020-08-12 06:30:35', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(20, 'Al Mazaya Student\'s Upcoming Events: Science Camp #3 ( 23-24 March)', '<p>Science is one of main subjects at Al Mazaya Islamic School, therefore the Science Camp is one of the Super Camp programs. In Science Camp activities, student don\'t only learn in the school environment, but student also practice directly to create science projects. Two years ago Al Mazaya Islamic School students made POC (Liquid Organic Fertilizer), Hydroponics and candied fruit. The next science project for this year, Al Mazaya Islamic School students will create \'Tempe\' and \'Ice Cream\' so that students will gain experience and broader insights about Science in everyday life.</p>', '20180301065815_9624d50c-e403-433a-9f46-379d7d6b79ef.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-student-s-upcoming-events-science-camp-3-23-24-march', '', 3, '2018-03-01 06:58:16', '2020-08-12 06:29:19', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(21, 'Student Achievment: Refia Azka Nabila', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>Third&nbsp;Place (3th) of South Kalimantan Level on<em> <strong>\'Ki Hajar Dewantara Quiz Competition\'</strong></em> @ BTKIP Banjarmasin</li>\r\n<li>Second Place (2nd) of Banjarmasin City Level on <em><strong>\'English Speech Competition\'</strong></em> @Dhammasoka Junior High School</li>\r\n</ol>', '20180416100630_dscf7279.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-refia-azka-nabila', '', 1, '2018-04-16 10:06:32', '2020-08-12 06:28:14', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(22, 'Al Mazaya Student\'s Upcoming Events: 3rd Al Mazaya\'s Anniversary! (15 March)', '<p>TIme flies and soon it is March 7th Al Mazaya Islamic School will celebrate its 3rd birthday. To celebrate this 3rd anniversary, AL Mazaya Islamic School holds a competition that will be followed by all students of Al Mazaya Islamic School. See You!</p>', '20180301070915_dscf3575.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-student-s-upcoming-events-3rd-al-mazaya-s-anniversary-15-march', '', 1, '2018-03-01 07:09:18', '2020-08-12 06:27:48', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(23, 'Karate', '', '20180220123949_12.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'karate', '', 5, '2018-02-20 12:39:49', '2020-08-12 06:25:54', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(24, 'Karate', '<p><strong>Equip students of al mazaya islamic school in order to protect themselves and train self-discipline.</strong></p>', '20180227085327_dscf6013.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'karate-1', '', 2, '2018-02-27 09:29:19', '2020-08-12 06:25:35', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(25, 'Al Mazaya Market Day Event #1', '', '20180221082051_img_5556.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-market-day-event-1', '', 3, '2018-02-21 08:22:36', '2020-08-12 06:25:10', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(26, 'Al Mazaya Student\'s Upcoming Events: Outdoor Activity with Basarnas of South Kalimantan (7-8 March 2018)', '<p>On March 7-8, Al Mazaya Islamic School has a special program to increase student\'s skills in preventing or facing a disaster. Therefore, Al Mazaya Islamic School is working directly with Basarnas of South Borneo, where students are given direct disaster management theory and practice trained by professional Basarnas teams.</p>', '20180301064629_dscf3891.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-student-s-upcoming-events-outdoor-activity-with-basarnas-of-south-kalimantan-7-8-march-2018', '', 1, '2018-03-01 07:01:14', '2020-08-12 06:24:25', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(27, 'Student Achievment: Aisya Novrida Putri', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>Third&nbsp;Place (3th) of Banjarmasin City Level on<em> <strong>\'English Speech Competition\'</strong></em> @ MAN 2 Model Banjarmasin</li>\r\n<li>Third Place (3th) of Banjarmasin City Level on <em><strong>\'English Speech Contest\'</strong></em> @SMAN 3 Banjarmasin</li>\r\n</ol>', '20180416101104_dscf732crop4.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-aisya-novrida-putri', '', 8, '2018-04-16 10:11:08', '2020-08-12 06:23:35', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(28, 'Student Achievment: Prista Oksanarlia', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place (1st) of South Kalimantan Level on<em> <strong>\'English Story Telling\'</strong></em> @&nbsp;GIBS</li>\r\n</ol>', '20180416101008_dscf7305crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-prista-oksanarlia', '', 3, '2018-04-16 10:10:10', '2020-08-12 06:22:48', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(29, 'Student Achievment: Raja Rafli Putra Samudra', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place&nbsp;(1st) City of Banjarmasin&nbsp;Level on<em> <strong>\'Adzan Putra\'</strong></em> @&nbsp;SMPN 10 Banjarmasin</li>\r\n</ol>', '20180416101832_dscf7346crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-raja-rafli-putra-samudra', '', 9, '2018-04-16 10:41:16', '2020-08-12 06:22:58', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(30, 'Student Achievment: Wida Nur Fajrina', '<p>&nbsp;</p>\r\n<ol>\r\n<li>First Place&nbsp;(1st) City of Banjarmasin Level on<em> <strong>\'Tahfidz Qur\'an Putri Pentas PAI\'</strong></em> @&nbsp;SD Islam Sabilal Muhtadin</li>\r\n</ol>', '20180418210239_dscf7371crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-wida-nur-fajrina', '', 6, '2018-04-18 21:02:39', '2020-08-12 06:21:25', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(31, 'Student Achievment: M. Hifzi Abdillah', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place&nbsp;(1st) of South Kalimantan Level on<em> <strong>\'Tilawah Quran\'</strong></em> @ BTKIP Banjarmasin</li>\r\n<li>First Place&nbsp;(1st) City of Banjarmasin Level on <em><strong>\'Hifzil Quran Putra PAI\'</strong></em> @Dhammasoka Junior High School</li>\r\n<li>Third Place (3rd) City of Banjarmasin Level on<strong><em> \'Tilawah Quran\'</em></strong> @ MAN 1 Banjarmasin</li>\r\n<li>Second Place (2nd) City of Banjarmasin Level on <strong><em>\'Tilawah Putra\'</em></strong> @ SMAN 1 Banjarmasin</li>\r\n</ol>', '', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-m-hifzi-abdillah', '', 1, '2018-03-01 07:47:26', '2020-08-12 06:20:26', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(32, 'Science Club', '', '20180406133015_dscf7130.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'science-club', '', 1, '2018-04-06 13:30:15', '2020-08-12 06:19:06', NULL, NULL, 1, 0, 0, 0, 'false', 'SMP'),
(33, 'Student Achievment: Aurellia Shafitri Suryansyah', '<p>1. First Place of Borneo Regional Level on <em><strong>\'Physics\' @&nbsp;</strong></em>Lambung Mangkurat University</p>', '20180419092142_dscf7358crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-aurellia-shafitri-suryansyah', '', 7, '2018-04-19 09:21:45', '2020-08-12 06:17:55', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(34, 'VISIT / OBSERVATION OF AL MAZAYA SENIOR HIGH SCHOOL TO THE GOVERNOR�S OFFICE OF KALIMANTAN SELATAN PROVINCE', '<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Al-Mazaya Senior High School again made observations, namely observations to the Office of the Governor of South Kalimantan Province located in Banjarbaru City to find out how the environment in the governor\'s office.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">The purpose of implementing this observation is to:</span></p>\r\n<ol style=\"text-align: justify;\">\r\n<li><span style=\"font-size: 12pt;\">Explain the direct explanation of Mr. Ahmad Yani, one of the chairmen of the bureau at the Governor\'s Office of South Kalimantan Province with a topic on the topic of National Integrity</span></li>\r\n<li><span style=\"font-size: 12pt;\">To find out the environment in the Office of the Governor of the Province of South Kalimantan.</span></li>\r\n</ol>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Observations were made on May 3, 2019, at 9:00 a.m. to 11:30 p.m., and attended by 68 participants, 60 people consisting of Al Mazaya students in class X and class XI and 8 others consisting of Al Mazaya teachers as mentors.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Observations at the Governor&rsquo;s office of South Kalimantan Province were opened by one of the Chairmen of the Bureau, Mr Ahmad Yani or commonly called Pak Memet. The event opened with a warm welcome and then continued with material delivery activities related to national integration by Pak Memet. After the delivery of the material was completed, the event continued with a question and answer session and photo session.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">The closing ceremony was closed again by Ms. Memet. After the event was closed, observers left the Governor&rsquo;s Office returned to Al Mazaya High School. This event can also be carried out also not separated from the principal of Al Mazaya Senior High School Mr. Muhammad Amirudin Hamid so that the visit to the Governor&rsquo;s Office of South Kalimantan was carried out smoothly.</span></p>', '20190509122854_almazaya_-_gubernur.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'visit-observation-of-al-mazaya-senior-high-school-to-the-governor-s-office-of-kalimantan-selatan-province', '', 9, '2019-05-09 12:31:14', '2020-08-12 06:16:10', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(35, 'SMA Al-Mazaya di ABSPACE GIBS Festival SMP-SMA 2019', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>The existence of competitions in the Non-Academic level of junior and high school level equivalent in South Kalimantan, Central Kalimantan, and East Kalimantan, held by the Global Islamic Boarding School, Al Mazaya High School also took part in the competition.</p>\r\n<p>This competition was held in order to enliven the 2019 GIBS Festival organized by the Global Islamic Boarding School\'s ABSPACE GIBS Festival 2019 theme which included the Speech, Traditional and Vocal Dance competitions and was held on February 28, 2019.</p>\r\n<p>The Al Mazaya senior high school students representing Al Mazaya participated in the competition, including:</p>\r\n<ol>\r\n<li>Belinda Zabrina L, representing the Indonesian Speech</li>\r\n<li>Istiqla Faiha, representing Traditional Dance</li>\r\n<li>Fitri Azzahra R, representing Traditional Dance</li>\r\n<li>Wafa Lettysia G, representing Traditional Dance</li>\r\n<li>Aisyah Nur Zahra, representing Traditional Dance</li>\r\n<li>Aurellia Shafitri S, representing Traditional Dance</li>\r\n<li>Aisyah Nur Zahra, representing Vocal Solo</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p>Al Mazaya Senior High School students who took part in the competition were accompanied by Mr. Firdaus and Ms. Rahmah, and got satisfactory results, namely the Indonesian language speech competition won 3rd place, traditional dance won 3rd place, and solo vocals also won 3rd place.</p>', '20190509122909_untitled.png', 1, '+3+', 'post', 'publish', 'public', 'open', 'sma-al-mazaya-di-abspace-gibs-festival-smp-sma-2019', '', 8, '2019-05-09 12:29:41', '2020-08-12 06:15:58', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(36, 'Al Mazaya Senior High School at O2SN Regency Level 2019', '<p>O2SN stands for National Student Sports Olympiad which is a National event to find new Indonesian seeds in the field of Sports.</p>\r\n<p>O2SN is also called resembling the National Science Olympiad or what is usually called OSN, except that O2SN is a sports version, and there is also FLS2N or what is called the National Student Art Competition Festival) and OPSI (Indonesian Student Research Olympiad).</p>\r\n<p>Lots of sports that are competed at O2SN include; Athletics, Swimming, Badminton, Karate, and Pencak Silat. The O2SN technique is the same as OSN, which has a level, one of which is high school level.</p>\r\n<p>The City Level O2SN of Banjarmasin was held on April 15-16 2019 at the Adenia SKB and Gor. Al Mazaya High School sent representatives in the field;</p>\r\n<ul>\r\n<li>Martial Arts, represented by: Magriyani</li>\r\n<li>Karate, represented by: Noor Maya</li>\r\n<li>Athletics, represented by: Taufik M Riady</li>\r\n<li>Badminton, represented by: Elmayya Jihan A</li>\r\n</ul>\r\n<p>Students representing Al Mazaya in this competition were accompanied by Mrs. Fatimah, assisted in guarding and encouraging Al Mazaya students, the best income was won by Magriyani in the field of martial arts because she made it into the top 6, although she had not won first place, this result had kept her pride because Magriyani did not have a coach but could still last up to the top 6 of 28 competitors, while for other sports, they fall in the preliminary stage.</p>\r\n<p>Even though it hasn\'t got maximum results, this will be used as a motivational material to be better in the future.</p>', '20190509122944_o2sn.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-senior-high-school-at-o2sn-regency-level-2019', '', 6, '2019-05-09 12:29:44', '2020-08-12 06:15:44', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(37, 'VISIT / OBSERVATION OF AL MAZAYA SENIOR HIGH SCHOOL TO THE BANJARMASIN DPRD�S OFFICE', '<p>Observation is a learning field and awareness to students to find out how to know the real reality of the theories that have been obtained at school. Because by observation, students will immediately jump into the field and find out how the work and steps taken by an agency / institution.</p>\r\n<p>Observation is an effort to optimize the knowledge that students get from school. In this case, Al-Mazaya Senior High School students observed the Banjarmasin DPRD&rsquo;s office to find out how the work process and environment in the DPRD.</p>\r\n<p>The purpose of implementing this observation is to:</p>\r\n<ol>\r\n<li>To find out the work process of the Banjarmasin City DPRD office.</li>\r\n<li>To find out the environment within the Banjarmasin DPRD Office.</li>\r\n</ol>\r\n<p>Observations were carried out on February 19, 2019, at 14.00-16.00, and attended by 80 participants, 70 people consisting of Al-Mazaya students in class X and class XI and 10 other people consisting of Al-Mazaya teachers as mentors.</p>\r\n<p>Observations at the Banjarmasin DPRD&rsquo;s Office were opened by the aide to the chairman of the DPRD, Ms. Andin. The event opened with a warm welcome and then continued with a tour around the entire room and the functions of each room at the Banjarmasin City DPRD Office. After the observation was completed, the program continued with introductions and motivations given by the chairman of the DPRD, Ms. Ananda. Then fill in the question and answer session and photo session.</p>\r\n<p>The closing of the event was again closed by Ms. Andin, adjutant to the chairman of the DPRD. After the event was closed, the observers left the Banjarmasin DPRD&rsquo;s Office and returned to Al-Mazaya. This event can also be carried out also not separated from the principal of Al Mazaya Senior High School Muhammad Amirudin Hamid so that the visit to the Banjarmasin DPRD&rsquo;s office went smoothly.</p>', '20190509123317_1.png', 1, '+3+', 'post', 'publish', 'public', 'open', 'visit-observation-of-al-mazaya-senior-high-school-to-the-banjarmasin-dprd-s-office-1', '', 52, '2019-05-09 12:34:18', '2020-08-12 06:15:31', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(38, 'Al Mazaya Senior High School at O2SN Regency Level 2019', '<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">O2SN stands for National Student Sports Olympiad which is a National event to find new Indonesian seeds in the field of Sports.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">O2SN is also called resembling the National Science Olympiad or what is usually called OSN, except that O2SN is a sports version, and there is also FLS2N or what is called the National Student Art Competition Festival) and OPSI (Indonesian Student Research Olympiad).</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Lots of sports that are competed at O2SN include; Athletics, Swimming, Badminton, Karate, and Pencak Silat. The O2SN technique is the same as OSN, which has a level, one of which is high school level.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">The City Level O2SN of Banjarmasin was held on April 15-16 2019 at the Adenia SKB and Gor. Al Mazaya High School sent representatives in the field;</span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-size: 12pt;\">Martial Arts, represented by: Magriyani</span></li>\r\n<li><span style=\"font-size: 12pt;\">Karate, represented by: Noor Maya</span></li>\r\n<li><span style=\"font-size: 12pt;\">Athletics, represented by: Taufik M Riady</span></li>\r\n<li><span style=\"font-size: 12pt;\">Badminton, represented by: Elmayya Jihan A</span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Students representing Al Mazaya in this competition were accompanied by Mrs. Fatimah, assisted in guarding and encouraging Al Mazaya students, the best income was won by Magriyani in the field of martial arts because she made it into the top 6, although she had not won first place, this result had kept her pride because Magriyani did not have a coach but could still last up to the top 6 of 28 competitors, while for other sports, they fall in the preliminary stage.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Even though it hasn\'t got maximum results, this will be used as a motivational material to be better in the future.</span></p>', '20190509123437_almazaya_-_o2sn.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-senior-high-school-at-o2sn-regency-level-2019-1', '', 29, '2019-05-09 12:35:53', '2020-08-12 06:15:14', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(39, 'SUPER CAMP AL MAZAYA ISLAMIC BANJARMASIN', '<p>Super camp yang dilaksanakan &nbsp;SMA Al Mazaya Islamic Banjarmasin dan Rindam Banjarbaru pada tanggal 25 Februari s.d 1 Maret 2019 yang berjalan selama 5 hari, pada hari pertama tanggal 25 Februari Full siswa menggunakan Bahasa Inggris, hari kedua tanggal 26 Februari siswa belajar Tahfiz sepanjang hari, hari ketiga siswa belajar Math dengan menggunakan model pembelajaran yang berbeda dari pelajaran setiap hari biasanya, hari keempat siswa yang jurusan IPS pergi ke pasar dengan tugas menganalisis pasar dengan cara wawancara kepada tiap penjual yang ada di pasar dan anak IPA mereka melakukan bedah kodok, Ikan Nila, membuat <em>es cream &nbsp;</em>dan pada hari terakhir siswa SMA di karantina di Rindam Banjarbaru untuk melatih jiwa kepemimpinan, kedesiplinan dan kejujuran yang di ikuti juga siswa SMP kelass8.</p>', '20190509124201_12.png', 1, '+3+', 'post', 'publish', 'public', 'open', 'super-camp-al-mazaya-islamic-banjarmasin', '', 36, '2019-05-09 12:42:01', '2020-08-12 06:15:03', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(40, 'All About Almazaya\'s Student Achievements', '<p>Al Mazaya High School students often participate in various competitions both in academic and non-academic fields. One of them is the English debate competition. The English debate competition itself has various objectives including making students more open minded, increasing self-confidence in public speaking, increasing knowledge and improving critical thinking skills. In addition, the English debate can certainly improve students\' English skills.</p>\n<p>On April 10, 2019, Al Mazaya High School sent a team, namely Charoline Putri Ichwan as the first speaker from X Social, Belinda Zabrina Lailani as the second speaker from X Science, and Affan Ramadhani Adjfarisi as the third speaker from X Science. This English debate competition was held at SMAN 2 Banjarmasin. The day before the competition, a technical meeting was held at SMAN 4 Banjarmasin, where the technical meeting was represented by the accompanying teacher, Rahma Anjarwati, S.Pd., Gr., Who was familiarly called Ms. Rahma.</p>\n<p>During the technical meeting, an explanation of the debate system that used, a list of motions to be discussed, until dividing participants into rounds. The debating system used in this debate competition is the Asian Parliamentary system, where when the team\'s preliminary round is divided into 8 rounds, which are attended by 15 teams from various Public and Private High Schools in Banjarmasin and will be judged by judges from SMAN 1 Banjarmasin, SMA PGRI 1 Banjarmasin and SMAN 4 Banjarmasin.</p>\n<p>Al Mazaya High School Team itself will fight a team from Kanaan High School in the first round with a motion&nbsp;<strong>THW punish people who spread as a terrorist hoax</strong>. Al Mazaya\'s high school team explained various opinions related to motions from an affirmative point of view.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Entering the 21st century, there are 4 skills that must be possessed by each student. The first is critical thinking and problem solving, in this case students are required to be able to solve the problems faced which begin with compiling, expressing, analyzing and solving problems. Then the ability to communicate, collaborate and creativity and innovation. In addition to the teaching and learning process in the classroom, in enhancing 21st century skills can also be obtained through debate, where in debates, students are required to be able to analyze problems, process information obtained to be an argument that is delivered briefly, clearly and densely.</p>\n<p>This year, Indonesian debate competition was held at SMAN 5 Banjarmasin. The competition was attended by 22 teams from various public and private high schools in Banjarmasin which will be divided into 11 rounds. The winner of the Indonesian debate competition will represent Banjarmasin in the province level. In this competition, the system used is the Asian Parliamentary system. Where the team consists of government and affirmative teams, each of which has 3 members. In this system, each team member is given 7 minutes to explain their argument and starts from the first speaker from the government team.</p>\n<p>In this debate competition, Al Mazaya High School sent a team consisting of Wafa Lettysia Gianti, Fitria Azzahra Rezeqi and Istiqla Faiha, all of them from the XI Social class. Al Mazaya High School Team got eighth place and got the chance to fight the team from MAN 1 Banjarmasin with a motion \"<strong>That the government requires civil servants as neutral state apparatus in elections\".</strong>&nbsp;With the motion, the Al Mazaya High School team had the opportunity to become a government team and MAN 1 Banjarmasin team became an affirmative team. Before entering the debate time, each team was given the opportunity to case building for 15 minutes. This debate competition uses a ranking system and the Team from Al Mazaya High School is ranked 10 out of 22 teams.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Two students of Al Mazaya High School, Amiza Qorina and Prista Oksarnalia, who were both from the X Science class successfully got achievements in Story Telling competition province level that held at SMAN 5 Banjarmasin on January 19, 2019.</p>\n<p>This story telling competition was attended by around 20 participants, representing public and private High Schools in South Kalimantan. In its implementation, this competition didnt have a specific theme that must be chosen by the participants. Before the competition was held, the participants were given a list of the titles of the stories to be presented and selected the one on the list and then prepared a story script that would be presented on the day&nbsp; the competition held.</p>\n<p>Amiza won 2nd place through the Snow White story she delivered during the competition. Whereas Prista chose Malin Kundang\'s story which succeeded in taking her to become the 1st winner in this competition. A pride for Al Mazaya High School because it has very talented students in the field of storytelling. Because the story telling competition itself aims to develop the ability of English-language stories by conveying stories verbally in front of the public and can also develop the ability to convey stories verbally and smoothly, with proper grammar and vocabulary and speech, and intonation that is proper and clear.</p>', '30a63ebda9b406a74bd4aed4965c54d6.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'all-about-almazayas-student-achievements', '', 44, '2020-04-02 12:43:58', '2020-08-12 06:14:51', NULL, NULL, 1, 0, 0, 0, 'false', 'SMA'),
(41, 'Dr. Poppy Dewi Puspitawati, MA talks about 21st century skills that students must have', 'pCmw1U5Cclo', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-06-24 21:29:44', '2020-08-12 06:01:44', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(42, 'Prof. Dr. ZAINUDDIN MALIKI, M.Si said about Almazaya and congratulated all the graduates', '-3aa2XVgzMU', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-06-24 21:30:18', '2020-08-12 06:01:24', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(43, 'H. Ibnu Sina, S.Pi, M.Si gave testimonials and congratulations to the all graduates', '2DOKcg27oos', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-06-24 21:30:55', '2020-08-12 06:00:43', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(44, 'Almazaya Islamic School Graduation Ceremony 2020 (Live On Youtube Channel)', '<p><img src=\"http://almazayaislamicschool.sch.id/media_library/posts/post-image-1593068178064.jpg\" alt=\"Almazaya Graduation\" width=\"703\" height=\"1148\" /></p>', '739287709d734f8452d73789fb0f0aec.jpeg', 1, '', 'post', 'publish', 'public', 'open', 'almazaya-islamic-school-graduation-ceremony-2020-live-on-youtube-channel', '', 44, '2020-06-25 14:59:30', '2020-08-12 05:59:20', NULL, NULL, 1, 1, 0, 0, 'false', 'Umum'),
(45, 'Banjar TV: UNGGUL DI BIDANG AGAMA, SMA AL MAZAYA ISLAMIC SCHOOL BANYAK PEMINAT DI PPDB 2020', 'eCn4NeO1lX8', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-07-07 09:08:01', '2020-08-12 05:58:49', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(46, 'Banjar TV: ALMAZAYA ISLAMIC SCHOOL PERKUAT KUALITAS PENGAJARAN AGAMA USAI PENGHAPUSAN UJIAN NASIONAL', 'ewlFFsGtdzo', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-07-07 09:08:39', '2020-08-12 05:58:45', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(47, 'Banjar TV: MILIKI SERVER MANDIRI, ALMAZAYA ISLAMIC SCHOOL HANDAL DALAM PELAYANAN TEKNOLOGI INFORMASI', 'Y-4BLYV_kfY', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-07-07 09:09:36', '2020-08-12 05:58:33', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum'),
(48, 'Highlight of Almazaya Graduation Ceremony 2020', 'hmISppmYkX8', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-07-07 09:10:13', '2020-08-12 05:58:09', NULL, NULL, 1, 0, 0, 0, 'false', 'Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `questions`
--

INSERT INTO `questions` (`id`, `question`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Tes Tes', 'true', '2020-04-02 10:25:35', '2020-04-02 03:25:35', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Education is a ticket for the future. Tomorrow for those who have prepared themselves today', 'Anonim', '2020-03-15 19:18:35', '2020-04-02 04:20:40', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'religion without science is blind. And science without religion is paralyzed', 'Anonim', '2020-03-15 19:18:35', '2020-04-02 04:21:10', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Live as if you will die tomorrow. Study as if you will live forever', 'Anonim', '2020-03-15 19:18:35', '2020-04-02 04:21:27', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT 0,
  `scholarship_type` bigint(20) DEFAULT 0,
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_default_value` text DEFAULT NULL,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2019-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', 'Almazaya SMP Almazaya SMA Almazaya Sekolah Menengah Pertama Almazaya Sekolah Menengah Atas Almazaya Almazaya Islamic School Banjarmasin Sekolah Terbaik Banjarmasin Sekolah Disiplin Banjarmasin SMP Terbaik Banjarmasin SMA Terbaik Banjarmasin Tahfidz Disiplin Cambridge Fasilitas Baik Strategis', 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2020-03-15 19:18:34', '2020-04-02 04:09:11', NULL, NULL, 0, 1, 0, 0, 'false'),
(6, 'general', 'meta_keywords', 'Almazaya, SMP Almazaya, SMA Almazaya, Sekolah Menengah Pertama Almazaya, Sekolah Menengah Atas Almazaya, Almazaya Islamic School Banjarmasin, Sekolah Terbaik Banjarmasin, Sekolah Disiplin Banjarmasin, SMP Terbaik Banjarmasin, SMA Terbaik Banjarmasin, Tahfidz, Disiplin, Cambridge, Fasilitas Baik, Strategis, Sekolah Islam, Banjarmasin', 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2020-03-15 19:18:34', '2020-04-02 04:10:23', NULL, NULL, 0, 1, 0, 0, 'false'),
(7, 'general', 'map_location', '-3.325160, 114.582318', '', 'public', 'Lokasi di Google Maps', '2020-03-15 19:18:34', '2020-04-02 04:11:57', NULL, NULL, 0, 1, 0, 0, 'false'),
(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'timezone', 'Asia/Makassar', 'Asia/Jakarta', 'public', 'Time Zone', '2020-03-15 19:18:34', '2020-04-02 04:13:08', NULL, NULL, 0, 1, 0, 0, 'false'),
(14, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'social_account', 'facebook', NULL, '', 'public', 'Facebook', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'social_account', 'twitter', NULL, '', 'public', 'Twitter', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'social_account', 'youtube', NULL, '', 'public', 'Youtube', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'social_account', 'instagram', NULL, '', 'public', 'Instagram', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'mail_server', 'sendgrid_username', NULL, '', 'public', 'Sendgrid Username', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'mail_server', 'sendgrid_password', NULL, '', 'public', 'Sendgrid Password', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'mail_server', 'sendgrid_api_key', NULL, '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', 'public', 'Sendgrid API Key', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'school_profile', 'npsn', '-', '123', 'public', 'NPSN', '2020-03-15 19:18:34', '2020-04-02 03:59:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(65, 'school_profile', 'school_name', 'SMP & SMA Almazaya Islamic School Banjarmasin', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2020-03-15 19:18:34', '2020-04-02 04:37:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(66, 'school_profile', 'headmaster', 'Rizky Pratama Putra, B.IT, Hons', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2020-03-15 19:18:34', '2020-04-02 03:58:53', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'headmaster_photo', NULL, 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'school_profile', 'school_level', '97', '3', 'public', 'Bentuk Pendidikan', '2020-03-15 19:18:34', '2020-04-02 04:01:15', NULL, NULL, 0, 1, 0, 0, 'false'),
(69, 'school_profile', 'school_status', '2', '1', 'public', 'Status Sekolah', '2020-03-15 19:18:34', '2020-04-02 04:01:46', NULL, NULL, 0, 1, 0, 0, 'false'),
(70, 'school_profile', 'ownership_status', '109', '1', 'public', 'Status Kepemilikan', '2020-03-15 19:18:34', '2020-04-02 03:59:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(71, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'decree_operating_permit_date', '2015-06-01', '2020-03-15', 'public', 'Tanggal SK Izin Operasional', '2020-03-15 19:18:34', '2020-04-02 03:58:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(73, 'school_profile', 'tagline', 'Islamic, discipline, smart, skillful, love the nation and has a global competitive mindset human resource', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2020-03-15 19:18:34', '2020-04-02 04:04:06', NULL, NULL, 0, 1, 0, 0, 'false'),
(74, 'school_profile', 'rt', NULL, '12', 'public', 'RT', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'school_profile', 'rw', NULL, '06', 'public', 'RW', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'school_profile', 'sub_village', 'Mawar', 'Wage', 'public', 'Dusun', '2020-03-15 19:18:34', '2020-04-02 04:02:39', NULL, NULL, 0, 1, 0, 0, 'false'),
(77, 'school_profile', 'village', 'Cempaka Besar', 'Kadugede', 'public', 'Kelurahan / Desa', '2020-03-15 19:18:34', '2020-04-02 03:15:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'sub_district', 'Banjarmasin Tengah', 'Kadugede', 'public', 'Kecamatan', '2020-03-15 19:18:34', '2020-04-02 04:02:24', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'district', 'Banjarmasin', 'Kuningan', 'public', 'Kabupaten', '2020-03-15 19:18:34', '2020-04-02 03:57:30', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'postal_code', '70117', '45561', 'public', 'Kode Pos', '2020-03-15 19:18:34', '2020-04-02 04:00:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'street_address', 'Jl. Cempaka Besar No. 57', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2020-03-15 19:18:34', '2020-04-02 04:02:05', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'school_profile', 'phone', '0511 3367441', '0232123456', 'public', 'Telepon', '2020-03-15 19:18:34', '2020-04-02 03:59:46', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'fax', '0511 3367441', '0232123456', 'public', 'Fax', '2020-03-15 19:18:34', '2020-04-02 03:58:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(84, 'school_profile', 'email', 'info@almazayaislamicschool.sch.id', 'info@sman9kuningan.sch.id', 'public', 'Email', '2020-03-15 19:18:34', '2020-04-02 03:57:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(85, 'school_profile', 'website', 'http://almazayaislamicschool.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2020-03-15 19:18:34', '2020-04-02 03:15:11', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'logo', '4e3022f586ec86f4ff08789b867ccbb7.PNG', 'logo.png', 'public', 'Logo', '2020-03-15 19:18:34', '2020-04-02 04:39:51', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'admission', 'admission_status', 'open', 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2020-03-15 19:18:34', '2020-04-08 03:10:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(88, 'admission', 'admission_year', '2020', '2020', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2020-03-15 19:18:34', '2020-04-08 03:09:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(89, 'admission', 'admission_start_date', '2020-05-01', '2019-01-01', 'public', 'Tanggal Mulai PPDB', '2020-03-15 19:18:34', '2020-04-08 03:10:05', NULL, NULL, 0, 1, 0, 0, 'false'),
(90, 'admission', 'admission_end_date', '2020-05-31', '2019-12-31', 'public', 'Tanggal Selesai PPDB', '2020-03-15 19:18:34', '2020-04-08 03:10:14', NULL, NULL, 0, 1, 0, 0, 'false'),
(91, 'admission', 'announcement_start_date', '2020-07-01', '2019-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2020-03-15 19:18:34', '2020-04-08 03:09:56', NULL, NULL, 0, 1, 0, 0, 'false'),
(92, 'admission', 'announcement_end_date', '2020-06-01', '2019-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2020-03-15 19:18:34', '2020-04-08 03:09:47', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings_senior`
--

CREATE TABLE `settings_senior` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_default_value` text DEFAULT NULL,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `settings_senior`
--

INSERT INTO `settings_senior` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2019-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', 'Almazaya SMP Almazaya SMA Almazaya Sekolah Menengah Pertama Almazaya Sekolah Menengah Atas Almazaya Almazaya Islamic School Banjarmasin Sekolah Terbaik Banjarmasin Sekolah Disiplin Banjarmasin SMP Terbaik Banjarmasin SMA Terbaik Banjarmasin Tahfidz Disiplin Cambridge Fasilitas Baik Strategis', 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2020-03-15 19:18:34', '2020-04-02 04:09:11', NULL, NULL, 0, 1, 0, 0, 'false'),
(6, 'general', 'meta_keywords', 'Almazaya, SMP Almazaya, SMA Almazaya, Sekolah Menengah Pertama Almazaya, Sekolah Menengah Atas Almazaya, Almazaya Islamic School Banjarmasin, Sekolah Terbaik Banjarmasin, Sekolah Disiplin Banjarmasin, SMP Terbaik Banjarmasin, SMA Terbaik Banjarmasin, Tahfidz, Disiplin, Cambridge, Fasilitas Baik, Strategis, Sekolah Islam, Banjarmasin', 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2020-03-15 19:18:34', '2020-04-02 04:10:23', NULL, NULL, 0, 1, 0, 0, 'false'),
(7, 'general', 'map_location', '-3.325160, 114.582318', '', 'public', 'Lokasi di Google Maps', '2020-03-15 19:18:34', '2020-04-02 04:11:57', NULL, NULL, 0, 1, 0, 0, 'false'),
(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'timezone', 'Asia/Makassar', 'Asia/Jakarta', 'public', 'Time Zone', '2020-03-15 19:18:34', '2020-04-02 04:13:08', NULL, NULL, 0, 1, 0, 0, 'false'),
(14, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'social_account', 'facebook', NULL, '', 'public', 'Facebook', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'social_account', 'twitter', NULL, '', 'public', 'Twitter', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'social_account', 'youtube', NULL, '', 'public', 'Youtube', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'social_account', 'instagram', NULL, '', 'public', 'Instagram', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'mail_server', 'sendgrid_username', NULL, '', 'public', 'Sendgrid Username', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'mail_server', 'sendgrid_password', NULL, '', 'public', 'Sendgrid Password', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'mail_server', 'sendgrid_api_key', NULL, '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', 'public', 'Sendgrid API Key', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'school_profile', 'npsn', '-', '123', 'public', 'NPSN', '2020-03-15 19:18:34', '2020-04-02 03:59:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(65, 'school_profile', 'school_name', 'SMP & SMA Almazaya Islamic School Banjarmasin', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2020-03-15 19:18:34', '2020-04-02 04:37:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(66, 'school_profile', 'headmaster', 'Rizky Pratama Putra, B.IT, Hons', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2020-03-15 19:18:34', '2020-04-02 03:58:53', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'headmaster_photo', NULL, 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'school_profile', 'school_level', '97', '3', 'public', 'Bentuk Pendidikan', '2020-03-15 19:18:34', '2020-04-02 04:01:15', NULL, NULL, 0, 1, 0, 0, 'false'),
(69, 'school_profile', 'school_status', '2', '1', 'public', 'Status Sekolah', '2020-03-15 19:18:34', '2020-04-02 04:01:46', NULL, NULL, 0, 1, 0, 0, 'false'),
(70, 'school_profile', 'ownership_status', '109', '1', 'public', 'Status Kepemilikan', '2020-03-15 19:18:34', '2020-04-02 03:59:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(71, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'decree_operating_permit_date', '2015-06-01', '2020-03-15', 'public', 'Tanggal SK Izin Operasional', '2020-03-15 19:18:34', '2020-04-02 03:58:03', NULL, NULL, 0, 1, 0, 0, 'false'),
(73, 'school_profile', 'tagline', 'Islamic, discipline, smart, skillful, love the nation and has a global competitive mindset human resource', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2020-03-15 19:18:34', '2020-04-02 04:04:06', NULL, NULL, 0, 1, 0, 0, 'false'),
(74, 'school_profile', 'rt', NULL, '12', 'public', 'RT', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'school_profile', 'rw', NULL, '06', 'public', 'RW', '2020-03-15 19:18:34', '2020-03-15 12:18:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'school_profile', 'sub_village', 'Mawar', 'Wage', 'public', 'Dusun', '2020-03-15 19:18:34', '2020-04-02 04:02:39', NULL, NULL, 0, 1, 0, 0, 'false'),
(77, 'school_profile', 'village', 'Cempaka Besar', 'Kadugede', 'public', 'Kelurahan / Desa', '2020-03-15 19:18:34', '2020-04-02 03:15:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'sub_district', 'Banjarmasin Tengah', 'Kadugede', 'public', 'Kecamatan', '2020-03-15 19:18:34', '2020-04-02 04:02:24', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'district', 'Banjarmasin', 'Kuningan', 'public', 'Kabupaten', '2020-03-15 19:18:34', '2020-04-02 03:57:30', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'postal_code', '70117', '45561', 'public', 'Kode Pos', '2020-03-15 19:18:34', '2020-04-02 04:00:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'street_address', 'Jl. Cempaka Besar No. 57', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2020-03-15 19:18:34', '2020-04-02 04:02:05', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'school_profile', 'phone', '0511 3367441', '0232123456', 'public', 'Telepon', '2020-03-15 19:18:34', '2020-04-02 03:59:46', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'fax', '0511 3367441', '0232123456', 'public', 'Fax', '2020-03-15 19:18:34', '2020-04-02 03:58:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(84, 'school_profile', 'email', 'info@almazayaislamicschool.sch.id', 'info@sman9kuningan.sch.id', 'public', 'Email', '2020-03-15 19:18:34', '2020-04-02 03:57:19', NULL, NULL, 0, 1, 0, 0, 'false'),
(85, 'school_profile', 'website', 'http://almazayaislamicschool.sch.id', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2020-03-15 19:18:34', '2020-04-02 03:15:11', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'logo', '4e3022f586ec86f4ff08789b867ccbb7.PNG', 'logo.png', 'public', 'Logo', '2020-03-15 19:18:34', '2020-04-02 04:39:51', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'admission', 'admission_status', 'open', 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2020-03-15 19:18:34', '2020-04-08 03:10:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(88, 'admission', 'admission_year', '2020', '2020', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2020-03-15 19:18:34', '2020-04-08 03:09:33', NULL, NULL, 0, 1, 0, 0, 'false'),
(89, 'admission', 'admission_start_date', '2020-05-01', '2019-01-01', 'public', 'Tanggal Mulai PPDB', '2020-03-15 19:18:34', '2020-04-08 03:10:05', NULL, NULL, 0, 1, 0, 0, 'false'),
(90, 'admission', 'admission_end_date', '2020-05-31', '2019-12-31', 'public', 'Tanggal Selesai PPDB', '2020-03-15 19:18:34', '2020-04-08 03:10:14', NULL, NULL, 0, 1, 0, 0, 'false'),
(91, 'admission', 'announcement_start_date', '2020-07-01', '2019-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2020-03-15 19:18:34', '2020-04-08 03:09:56', NULL, NULL, 0, 1, 0, 0, 'false'),
(92, 'admission', 'announcement_end_date', '2020-06-01', '2019-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2020-03-15 19:18:34', '2020-04-08 03:09:47', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT 0 COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT 0 COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT 0 COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT 0 COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text DEFAULT NULL COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni ?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan / KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT 0,
  `special_need_id` bigint(20) DEFAULT 0 COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT 0 COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT 0 COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT 0,
  `father_employment_id` bigint(20) DEFAULT 0,
  `father_monthly_income_id` bigint(20) DEFAULT 0,
  `father_special_need_id` bigint(20) DEFAULT 0,
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT 0,
  `mother_employment_id` bigint(20) DEFAULT 0,
  `mother_monthly_income_id` bigint(20) DEFAULT 0,
  `mother_special_need_id` bigint(20) DEFAULT 0,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT 0,
  `guardian_employment_id` bigint(20) DEFAULT 0,
  `guardian_monthly_income_id` bigint(20) DEFAULT 0,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(3) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(3) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(2) DEFAULT 0 COMMENT 'Jumlah Saudara Kandung',
  `student_status_id` bigint(20) DEFAULT 0 COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '2020-04-08', '152223', '15515345', '154851', '152', '451512', NULL, NULL, '2156451', 'SMP 1', 'banjarmasin', 'belajar', 'guru', 'tes siswa baru', 'M', 'Banjarmasin', '2000-07-11', 89, 23, 'amd', '13', '01', 'hksn', 'alalak', 'banjarmasin', 'banjarmasin', '71419', 74, 81, '08228552', '081524845', 'm@m.c', '2121', '2153102', '121', '12121', '2132', 'WNI', 'indonesia', 'ayah', 1963, 50, 14, 71, 23, 'ibu', 1963, 50, 10, 71, 23, 'wali', 1963, 50, 15, 71, 3, 15, 160, 55, 4, 1, '0000-00-00', '', '2020-04-08 13:11:06', '2020-04-08 05:11:06', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'c@lol.com', '2020-04-11 18:19:12', '2020-04-11 10:19:12', NULL, NULL, NULL, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'true', '2020-03-15 19:18:35', '2020-04-02 04:39:07', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2020-03-15 19:18:35', '2020-04-02 04:39:07', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Anton Sofyan', 'false', '2020-03-15 19:18:35', '2020-04-02 04:38:59', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `themes_senior`
--

CREATE TABLE `themes_senior` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `themes_senior`
--

INSERT INTO `themes_senior` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'false', '2020-03-15 19:18:35', '2020-09-05 06:36:57', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2020-03-15 19:18:35', '2020-09-05 06:38:37', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Anton Sofyan', 'true', '2020-03-15 19:18:35', '2020-09-05 06:38:33', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text DEFAULT NULL,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'admin', '$2y$12$L5Nkd8q2auiRAcaeUQ/TJ.Bo787EArWg9/ED0HFTRSU9VlKBru0Fm', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, NULL, NULL, NULL, 'true', '2020-08-26 04:52:25', '::1', '2020-03-15 19:18:34', '2020-08-26 02:52:25', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'kamal', '$2y$10$K6UvZkGVDhf/EGykgBWm6OMoD4eGJusqWCKx.H0FumH1//E9GLquu', 'Mustapa Ahmad Kamal', 'mustapakamalkml@gmail.com', NULL, 1, 'administrator', NULL, '', NULL, NULL, 'false', '2020-04-03 04:12:48', '192.168.10.55', '2020-04-02 10:17:48', '2020-04-03 02:13:02', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_group`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'IT', '2020-04-02 10:17:22', '2020-04-02 03:17:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Marketing', '2020-04-02 10:17:27', '2020-04-02 03:17:27', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Designer', '2020-04-02 10:21:04', '2020-04-02 03:21:04', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 'tampilan', '2020-04-02 10:21:40', '2020-04-02 03:21:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 'Teacher', '2020-04-02 10:22:54', '2020-04-02 03:22:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 'Administrator', '2020-04-02 10:23:07', '2020-04-02 03:23:07', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) DEFAULT 0,
  `module_id` bigint(20) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT 0,
  `updated_by` bigint(20) DEFAULT 0,
  `deleted_by` bigint(20) DEFAULT 0,
  `restored_by` bigint(20) DEFAULT 0,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_privileges`
--

INSERT INTO `user_privileges` (`id`, `user_group_id`, `module_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 2, 2, '2020-04-02 10:19:14', '2020-04-02 03:19:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 3, 3, '2020-04-02 10:21:17', '2020-04-02 03:21:17', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 4, 3, '2020-04-02 10:21:51', '2020-04-02 03:21:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 3, 7, '2020-04-02 10:22:08', '2020-04-02 03:22:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 3, 6, '2020-04-02 10:22:26', '2020-04-02 03:22:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(6, 1, 9, '2020-04-02 10:23:38', '2020-04-02 03:23:38', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('it5jshhmabqom9jkn8npec3rk9o0glcc', '::1', 1598416342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539383431363333363b746f6b656e7c733a33323a226130383135313337646663333239393939353839623339666338333866373039223b637372665f746f6b656e7c733a33323a226130383135313337646663333239393939353839623339666338333866373039223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3239323a22416c6d617a61796120534d5020416c6d617a61796120534d4120416c6d617a6179612053656b6f6c6168204d656e656e6761682050657274616d6120416c6d617a6179612053656b6f6c6168204d656e656e676168204174617320416c6d617a61796120416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e2053656b6f6c6168205465726261696b2042616e6a61726d6173696e2053656b6f6c61682044697369706c696e2042616e6a61726d6173696e20534d50205465726261696b2042616e6a61726d6173696e20534d41205465726261696b2042616e6a61726d6173696e205461686669647a2044697369706c696e2043616d62726964676520466173696c69746173204261696b20537472617465676973223b6d6574615f6b6579776f7264737c733a3333343a22416c6d617a6179612c20534d5020416c6d617a6179612c20534d4120416c6d617a6179612c2053656b6f6c6168204d656e656e6761682050657274616d6120416c6d617a6179612c2053656b6f6c6168204d656e656e676168204174617320416c6d617a6179612c20416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e2c2053656b6f6c6168205465726261696b2042616e6a61726d6173696e2c2053656b6f6c61682044697369706c696e2042616e6a61726d6173696e2c20534d50205465726261696b2042616e6a61726d6173696e2c20534d41205465726261696b2042616e6a61726d6173696e2c205461686669647a2c2044697369706c696e2c2043616d6272696467652c20466173696c69746173204261696b2c205374726174656769732c2053656b6f6c61682049736c616d2c2042616e6a61726d6173696e223b6d61705f6c6f636174696f6e7c733a32313a222d332e3332353136302c203131342e353832333138223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31333a22417369612f4d616b6173736172223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a313a222d223b7363686f6f6c5f6e616d657c733a34353a22534d50202620534d4120416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e223b686561646d61737465727c733a33313a2252697a6b792050726174616d612050757472612c20422e49542c20486f6e73223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313039223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031352d30362d3031223b7461676c696e657c733a3130353a2249736c616d69632c206469736369706c696e652c20736d6172742c20736b696c6c66756c2c206c6f766520746865206e6174696f6e20616e6420686173206120676c6f62616c20636f6d7065746974697665206d696e647365742068756d616e207265736f75726365223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a353a224d61776172223b76696c6c6167657c733a31333a2243656d70616b61204265736172223b7375625f64697374726963747c733a31383a2242616e6a61726d6173696e2054656e676168223b64697374726963747c733a31313a2242616e6a61726d6173696e223b706f7374616c5f636f64657c733a353a223730313137223b7374726565745f616464726573737c733a32343a224a6c2e2043656d70616b61204265736172204e6f2e203537223b70686f6e657c733a31323a22303531312033333637343431223b6661787c733a31323a22303531312033333637343431223b656d61696c7c733a33333a22696e666f40616c6d617a61796169736c616d69637363686f6f6c2e7363682e6964223b776562736974657c733a33353a22687474703a2f2f616c6d617a61796169736c616d69637363686f6f6c2e7363682e6964223b6c6f676f7c733a33363a2234653330323266353836656338366634666630383738396238363763636262372e504e47223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303230223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032302d30352d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032302d30352d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032302d30372d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032302d30362d3031223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2231223b757365725f6e616d657c733a353a2261646d696e223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d),
('ugqtes1s69n03c8knjihbbsh6di2ov18', '192.168.93.111', 1598859285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539383835393238303b746f6b656e7c733a33323a223833333766386430656135326636356261313032386461663833333231353464223b637372665f746f6b656e7c733a33323a223833333766386430656135326636356261313032386461663833333231353464223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3239323a22416c6d617a61796120534d5020416c6d617a61796120534d4120416c6d617a6179612053656b6f6c6168204d656e656e6761682050657274616d6120416c6d617a6179612053656b6f6c6168204d656e656e676168204174617320416c6d617a61796120416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e2053656b6f6c6168205465726261696b2042616e6a61726d6173696e2053656b6f6c61682044697369706c696e2042616e6a61726d6173696e20534d50205465726261696b2042616e6a61726d6173696e20534d41205465726261696b2042616e6a61726d6173696e205461686669647a2044697369706c696e2043616d62726964676520466173696c69746173204261696b20537472617465676973223b6d6574615f6b6579776f7264737c733a3333343a22416c6d617a6179612c20534d5020416c6d617a6179612c20534d4120416c6d617a6179612c2053656b6f6c6168204d656e656e6761682050657274616d6120416c6d617a6179612c2053656b6f6c6168204d656e656e676168204174617320416c6d617a6179612c20416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e2c2053656b6f6c6168205465726261696b2042616e6a61726d6173696e2c2053656b6f6c61682044697369706c696e2042616e6a61726d6173696e2c20534d50205465726261696b2042616e6a61726d6173696e2c20534d41205465726261696b2042616e6a61726d6173696e2c205461686669647a2c2044697369706c696e2c2043616d6272696467652c20466173696c69746173204261696b2c205374726174656769732c2053656b6f6c61682049736c616d2c2042616e6a61726d6173696e223b6d61705f6c6f636174696f6e7c733a32313a222d332e3332353136302c203131342e353832333138223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31333a22417369612f4d616b6173736172223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a313a222d223b7363686f6f6c5f6e616d657c733a34353a22534d50202620534d4120416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e223b686561646d61737465727c733a33313a2252697a6b792050726174616d612050757472612c20422e49542c20486f6e73223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313039223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031352d30362d3031223b7461676c696e657c733a3130353a2249736c616d69632c206469736369706c696e652c20736d6172742c20736b696c6c66756c2c206c6f766520746865206e6174696f6e20616e6420686173206120676c6f62616c20636f6d7065746974697665206d696e647365742068756d616e207265736f75726365223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a353a224d61776172223b76696c6c6167657c733a31333a2243656d70616b61204265736172223b7375625f64697374726963747c733a31383a2242616e6a61726d6173696e2054656e676168223b64697374726963747c733a31313a2242616e6a61726d6173696e223b706f7374616c5f636f64657c733a353a223730313137223b7374726565745f616464726573737c733a32343a224a6c2e2043656d70616b61204265736172204e6f2e203537223b70686f6e657c733a31323a22303531312033333637343431223b6661787c733a31323a22303531312033333637343431223b656d61696c7c733a33333a22696e666f40616c6d617a61796169736c616d69637363686f6f6c2e7363682e6964223b776562736974657c733a33353a22687474703a2f2f616c6d617a61796169736c616d69637363686f6f6c2e7363682e6964223b6c6f676f7c733a33363a2234653330323266353836656338366634666630383738396238363763636262372e504e47223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303230223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032302d30352d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032302d30352d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032302d30372d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032302d30362d3031223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a303b),
('r8d65j2dhog3095s1qvgqiir0tnr1g44', '::1', 1599287921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393238373633393b746f6b656e7c733a33323a223463346464623764306665653264633630653736373865303464636434343036223b637372665f746f6b656e7c733a33323a223463346464623764306665653264633630653736373865303464636434343036223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3239323a22416c6d617a61796120534d5020416c6d617a61796120534d4120416c6d617a6179612053656b6f6c6168204d656e656e6761682050657274616d6120416c6d617a6179612053656b6f6c6168204d656e656e676168204174617320416c6d617a61796120416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e2053656b6f6c6168205465726261696b2042616e6a61726d6173696e2053656b6f6c61682044697369706c696e2042616e6a61726d6173696e20534d50205465726261696b2042616e6a61726d6173696e20534d41205465726261696b2042616e6a61726d6173696e205461686669647a2044697369706c696e2043616d62726964676520466173696c69746173204261696b20537472617465676973223b6d6574615f6b6579776f7264737c733a3333343a22416c6d617a6179612c20534d5020416c6d617a6179612c20534d4120416c6d617a6179612c2053656b6f6c6168204d656e656e6761682050657274616d6120416c6d617a6179612c2053656b6f6c6168204d656e656e676168204174617320416c6d617a6179612c20416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e2c2053656b6f6c6168205465726261696b2042616e6a61726d6173696e2c2053656b6f6c61682044697369706c696e2042616e6a61726d6173696e2c20534d50205465726261696b2042616e6a61726d6173696e2c20534d41205465726261696b2042616e6a61726d6173696e2c205461686669647a2c2044697369706c696e2c2043616d6272696467652c20466173696c69746173204261696b2c205374726174656769732c2053656b6f6c61682049736c616d2c2042616e6a61726d6173696e223b6d61705f6c6f636174696f6e7c733a32313a222d332e3332353136302c203131342e353832333138223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31333a22417369612f4d616b6173736172223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a313a222d223b7363686f6f6c5f6e616d657c733a34353a22534d50202620534d4120416c6d617a6179612049736c616d6963205363686f6f6c2042616e6a61726d6173696e223b686561646d61737465727c733a33313a2252697a6b792050726174616d612050757472612c20422e49542c20486f6e73223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2232223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a333a22313039223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031352d30362d3031223b7461676c696e657c733a3130353a2249736c616d69632c206469736369706c696e652c20736d6172742c20736b696c6c66756c2c206c6f766520746865206e6174696f6e20616e6420686173206120676c6f62616c20636f6d7065746974697665206d696e647365742068756d616e207265736f75726365223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a353a224d61776172223b76696c6c6167657c733a31333a2243656d70616b61204265736172223b7375625f64697374726963747c733a31383a2242616e6a61726d6173696e2054656e676168223b64697374726963747c733a31313a2242616e6a61726d6173696e223b706f7374616c5f636f64657c733a353a223730313137223b7374726565745f616464726573737c733a32343a224a6c2e2043656d70616b61204265736172204e6f2e203537223b70686f6e657c733a31323a22303531312033333637343431223b6661787c733a31323a22303531312033333637343431223b656d61696c7c733a33333a22696e666f40616c6d617a61796169736c616d69637363686f6f6c2e7363682e6964223b776562736974657c733a33353a22687474703a2f2f616c6d617a61796169736c616d69637363686f6f6c2e7363682e6964223b6c6f676f7c733a33363a2234653330323266353836656338366634666630383738396238363763636262372e504e47223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303230223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032302d30352d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323032302d30352d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032302d30372d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032302d30362d3031223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a31303a22677265656e5f6c616e64223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032302d32303231223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a303b);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indeks untuk tabel `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indeks untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indeks untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indeks untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indeks untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_nik__idx` (`nik`) USING BTREE,
  ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `employees_email__idx` (`email`) USING BTREE,
  ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indeks untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indeks untuk tabel `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indeks untuk tabel `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indeks untuk tabel `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indeks untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indeks untuk tabel `settings_senior`
--
ALTER TABLE `settings_senior`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indeks untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indeks untuk tabel `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indeks untuk tabel `themes_senior`
--
ALTER TABLE `themes_senior`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indeks untuk tabel `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indeks untuk tabel `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indeks untuk tabel `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
