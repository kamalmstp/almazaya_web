-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2020 at 10:21 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almazaya_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
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
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2020-2021', 'odd', 'true', 'true', '2020-04-08 11:21:14', '2020-04-08 03:21:14', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
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
-- Table structure for table `admission_phases`
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
-- Dumping data for table `admission_phases`
--

INSERT INTO `admission_phases` (`id`, `academic_year_id`, `phase_name`, `phase_start_date`, `phase_end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 'Gelombang 1', '2020-05-01', '2020-05-31', '2020-04-08 11:22:06', '2020-04-08 03:22:06', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `admission_quotas`
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
-- Dumping data for table `admission_quotas`
--

INSERT INTO `admission_quotas` (`id`, `academic_year_id`, `admission_type_id`, `major_id`, `quota`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 170, 0, 100, '2020-04-08 11:22:19', '2020-04-08 03:22:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
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
-- Table structure for table `answers`
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
-- Table structure for table `categories`
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
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', 'post', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Achievement', 'achievement', NULL, 'post', NULL, '2020-04-02 04:43:08', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_groups`
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
-- Table structure for table `class_group_settings`
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
-- Table structure for table `class_group_students`
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
-- Table structure for table `comments`
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
-- Table structure for table `employees`
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
-- Table structure for table `files`
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
-- Table structure for table `image_sliders`
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
-- Dumping data for table `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2020-03-15 19:18:36', '2020-04-02 03:50:50', '2020-04-02 10:50:50', NULL, 0, 0, 1, 0, 'true'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2020-03-15 19:18:36', '2020-04-02 03:50:50', '2020-04-02 10:50:50', NULL, 0, 0, 1, 0, 'true'),
(3, 'Tahfidz And Al-Qur\'an Recitation', '66ea73a6e6f3056b51c1254f07e9a092.jpg', '2020-04-02 12:59:28', '2020-04-02 05:01:52', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'Class Activity', 'fdc9400100198b61167d7a6a0de38dbb.jpg', '2020-04-03 10:20:36', '2020-04-03 02:20:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 'Science Laboratory', '6fa7785d20bc1a5228319600b9df1ef9.jpg', '2020-04-03 10:21:09', '2020-04-03 02:21:19', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `links`
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
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Virtual Class', 'http://virtualclass.almazayaislamicschool.sch.id/', '_blank', NULL, 'link', '2020-03-15 19:18:35', '2020-04-02 05:02:13', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
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
-- Table structure for table `majors`
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
-- Table structure for table `menus`
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
-- Dumping data for table `menus`
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
-- Table structure for table `modules`
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
-- Dumping data for table `modules`
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
-- Table structure for table `options`
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
-- Dumping data for table `options`
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
-- Table structure for table `photos`
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
-- Table structure for table `pollings`
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
-- Table structure for table `posts`
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
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>\"Al Mazaya Islamic School Banjarmasin is Surroundded by Islamic atmosphere, hopefully will be a pioneer and superior in all aspect\"</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2020-03-15 19:18:36', '2020-04-02 04:19:39', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Profil', '<p><strong>History</strong></p>\n<p>Al Mazaya Islamic School is a non-government school that has three big points in developing the education system. There are Islamic Studies, English and Technology.</p>\n<p>Islamic Studies, focusing on prayer (wajib and sunnah), al qur&rsquo;an (murajaah and tahfidz) and the application of akhlaqul qarimah.</p>\n<p>On English side, focusing on English skills of the students on listening and speaking sides. Students are expected to use English in daily conversation. The news and information delivered to students all are using English.</p>\n<p>Students are learning by using their tablets and they use e-books as their handout. All the files are transferred using wifi in every classroom. The students are also learinng using smartboard that has more feature then the ordinary board.</p>\n<p>Beside those big points above, Al Mazaya Islamic School also has great infrastructure to support the idea of International Class.</p>\n<p>&nbsp;&nbsp;</p>\n<p><strong>Founder</strong></p>\n<ul>\n<li>H. Taufik Hidayat, MM</li>\n<li>Hj. Sri Erliani, MM, M.Mkes</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>Our Programs</strong></p>\n<p>There are some programs which run well and become the appeal and characteristic of SMP Al Mazaya Islamic.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Tahfidz</strong></li>\n</ul>\n<p>Every student who joins in Al Mazaya Islamic School must be able to read and memorize Al Qur&rsquo;an. There is target that student has to fulfill and it is supported by all the teachers.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Super Camps</strong></li>\n</ul>\n<p>Al Mazaya Islamic School has a program that grows the student independence and confidence. Al Mazaya provide the students four camps to join in, they are Islamic Camp, English Camp, Science Camp and Maths Camp. In the camps, students will learn in different and fun way. There will be unique project in every camp as well.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Enrichment and Club</strong></li>\n</ul>\n<p>Enrichment program helps the low level students to upgrade their knowledge and skills to catch up and let them not left behind.</p>\n<p>Club program keeps and maintains the high level students to develop and sharpen their knowledge and skills. This program also prepares the students to join any competition.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Basarnas</strong></li>\n</ul>\n<p>Basarnas stands for Badan SAR Nasional. In this program, students learn about life skill that helps the students to be able to control their feeling in tight situation and know what to do. First year students learn about safety in the height and the second year students learn about safety in the water.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Translation</strong></li>\n</ul>\n<p>Al Qur&rsquo;an translation is held for the teachers before the teachers transfer the knowledge to the students. The aim of this program is to enrich the knowledge about Al Qur&rsquo;an and also to develop the Islamic side of the students.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Entrepreneurship</strong></li>\n</ul>\n<p>Entrepreneurship program is an annual program from SMP Al Mazaya to develop the skill of the students in entrepreneur side. On the first year, students sold food that they offered it to their friends and also the parents who took the report progress from their children.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Extracurricular</strong></li>\n</ul>\n<p>This program provides the students&rsquo; needs and also as the medium to relax their mind and fulfill their hobby of sport and art, such as basket, table tennis, badminton, futsal, drum band, Saman dance, etc.</p>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Overseas</strong></li>\n</ul>\n<p>This program is for second grade of Al Mazaya&rsquo;s students. The students will choose the place they parents approve. The options for this year are Australia, Malaysia, Singapore and Banjarmasin itself.</p>\n<p>&nbsp;</p>\n<p><strong>Affiliates</strong></p>\n<p>&nbsp;</p>\n<p><strong>Badan Narkotika National (BNN)</strong></p>\n<p>BNN is an organization that concerns about prevention, elimination and misappropriation of drugs and addictive substance.</p>\n<p>&nbsp;</p>\n<p><strong>Kepolisian Daerah (Polda)</strong></p>\n<p>Polda is Regional Police that the position is under the National Police. The police officers help the people to solve the people problems and also remind the vehicles to be safety on the road</p>\n<p>&nbsp;</p>\n<p><strong>Badan SAR Nasional (Basarnas)</strong></p>\n<p>This organization helps the people to know what to do at the tight situation. How to give the first aid and how to treat people in a defective condition because of disaster.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'profil', 'berita, pengumuman, sekilas-info', 20, '2020-03-15 19:18:36', '2020-04-11 10:30:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p><strong>Vision &amp; Mission</strong></p>\n<ul>\n<li><strong>Vision</strong></li>\n</ul>\n<p><em>Provide the Islamic, discipline, smart, skillful, love the nation and has a global competitive mindset human resource.</em></p>\n<ul>\n<li><strong>Mission</strong></li>\n</ul>\n<p><em>Implement an interactive, inspiring, innovative, fun and challenging education and learning in order to make the students are able to actively participate, give the space for their creativity, be innovative and independent as their talents, interests, and the physical and psychological development.</em></p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 11, '2020-03-15 19:18:36', '2020-04-21 06:52:28', NULL, NULL, 0, 1, 0, 0, 'false'),
(4, 'Sample Post 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-1', 'berita, pengumuman, sekilas-info', 5, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true'),
(5, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true'),
(6, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true'),
(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true'),
(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2020-03-15 19:18:36', '2020-04-02 04:29:18', '2020-04-02 12:29:18', NULL, 0, 0, 1, 0, 'true'),
(14, 'Student Achievment: Bellinda Zabrina Lailani', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place (1st) of South Kalimantan Level on <em><strong>\'Ki Hajar Dewantara Quiz Competition\'</strong></em> @ BTKIP Banjarmasin</li>\r\n<li>First Place (1st) of Banjarmasin City Level on <em><strong>\'English Speech Competition\'</strong></em> @Dhammasoka Junior High School</li>\r\n</ol>', '20180416101553_dscf7292crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-bellinda-zabrina-lailani', '', 0, '2018-04-16 10:15:53', '2018-04-16 02:15:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 'Basketball', '<p><strong>Train the students of Al Mazaya Islamic School in terms of leadership, teamwork and competitiveness through basketball.</strong></p>', '20180416102310_dscf7213.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'basketball', '', 0, '2018-04-16 10:23:12', '2018-04-16 02:23:12', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 'Almazaya Ramadhan Charity Day', '<p>Tiap sekolah biasanya punya event yang khusus diadakan di sekolah tersebut. Kegiatan seperti ini tentu sangat bermanfaat bagi sekolah dan siswa-siswinya. Bagi sekolah, event-event seperti ini mampu mendongkrak nama sekolah. Untuk para siswa, event dapat menjadi ajang untuk berkreasi dan melatih kerjasama.<br />Terus bagaimana cara buat event yang baik?<br />Ide Bersama<br />Panitia biasanya sudah menentukan ide untuk konsep dan tema event. Namun kenapa harus membatasi penentuan ide di kalangan panitia saja? Ide bisa datang dari mana dan siapa saja. Kita tidak pernah tahu ada diluar sana teman kita yang punya ide yang jauh lebih menarik. Kamu bisa pakai halaman Facebook sekolahmu, bagikan idemu dan lihat tanggapan mereka. Untuk lebih memotivasi mereka menuangkan ide-idenya, kamu juga bisa buat sayembara dengan hadiah yang menarik.<br />Kalau kamu merasa idenya masih kurang kreatif, berikut tips untuk menuangkan ide bersama:<br />Tulis event yang akan kamu buat di tengah-tengah papan tulis. Lalu ajak teman-temanmu menuliskan ide-ide yang muncul seketika itu juga di sekeliling nama event yang kamu buat sebelumnya.<br />Tidak ada ide yang buruk.<br />Ajak temanmu untuk bersama-sama membangun ide. Ingat, membangun ide dan mengeluarkan ide adalah hal yang berbeda. Mengeluarkan ide artinya mengemukakan pikiran-pikiran dalam kepala dan bersifat acak. Sedangkan membangun ide berarti mencoba menyempurnakan sebuah ide dengan berbagai detail yang saling terhubung satu sama lain.</p>\r\n<p>Proses pemikiran ide haruslah menyenangkan.</p>\r\n<p>Jangan takut dengan resiko dan jangan batasi dirimu terhadap apapun.</p>\r\n<p>Tentukan Tempat yang Cocok<br /><br />Hidupkan tema yang sudah kamu tentukan dengan lokasi yang sesuai. Coba lihat sekolahmu, dan bayangkan jika event yang akan kamu buat diadakan disitu. Akankah acara dan lokasinya bisa jadi satu kesatuan yang apik? Jika tidak coba cari tempat yang lain.<br /><br />&nbsp;<br /><br />Musik yang Menyatu dengan Tema<br /><br />Kamu pasti butuh musik di event yang kamu baik sebagai pengiring maupun sebagai performer. Diskusikan kepada pemain music tentang tema yang kamu buat. Minta pendapat mereka tentang dan pilih musik yang pas dengan tema tersebut.<br /><br />&nbsp;<br /><br />Buat Dekorasi yang Sesuai<br /><br />Buat lokasi lebih menarik dengan berbagai macam dekorasi. Kamu bisa mulai dengan backdrop, hiasan di langit-langit, hiasan di dinding,&nbsp; penunjuk arah sampai ke photo booth. Namun, sangat oenting untuk memastikan semuanya sejalan dengan tema yang telah kamu buat.<br /><br /><br />Ayo ikuti langkah-langkahnya dan buat event sekolah yang luar biasa.</p>', '20180220115117_dscf5098.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'almazaya-ramadhan-charity-day', '', 0, '2018-02-20 11:52:39', '2018-02-20 03:52:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 'Tahfidz', '<p><strong>&nbsp;</strong></p>\r\n<pre id=\"tw-target-text\" class=\"tw-data-text tw-ta tw-text-small\" dir=\"ltr\" data-placeholder=\"Translation\" data-fulltext=\"\"><span lang=\"en\">Tahfidz is one way to improve one\'s intelligence in memorizing the Quran. By memorizing students brain will more quickly absorb information also store it in the long term. The more frequent reading of the Qur\'an turns out to train also increased brain in digesting information that is very useful for Al Mazaya\'s students.</span></pre>', '20180302134256_dscf6110_(copy).jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'tahfidz', '', 1, '2018-04-16 10:32:09', '2020-04-02 07:48:31', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 'Marching Band', '', '20180220115813_6c723503-9313-4942-a998-4bc9958067e9.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'marching-band', '', 0, '2018-02-20 11:58:14', '2018-02-20 03:58:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 'Futsal', '<p><strong>Improve the attitude of sportsmanship, intelligence and forming the character in teamwork for students of Al Mazaya Islamic School.</strong></p>', '20180227085357_dscf6033.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'futsal', '', 0, '2018-02-27 09:32:54', '2018-02-27 01:32:54', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 'Al Mazaya Student\'s Upcoming Events: Science Camp #3 ( 23-24 March)', '<p>Science is one of main subjects at Al Mazaya Islamic School, therefore the Science Camp is one of the Super Camp programs. In Science Camp activities, student don\'t only learn in the school environment, but student also practice directly to create science projects. Two years ago Al Mazaya Islamic School students made POC (Liquid Organic Fertilizer), Hydroponics and candied fruit. The next science project for this year, Al Mazaya Islamic School students will create \'Tempe\' and \'Ice Cream\' so that students will gain experience and broader insights about Science in everyday life.</p>', '20180301065815_9624d50c-e403-433a-9f46-379d7d6b79ef.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-student-s-upcoming-events-science-camp-3-23-24-march', '', 0, '2018-03-01 06:58:16', '2018-02-28 22:58:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 'Student Achievment: Refia Azka Nabila', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>Third&nbsp;Place (3th) of South Kalimantan Level on<em> <strong>\'Ki Hajar Dewantara Quiz Competition\'</strong></em> @ BTKIP Banjarmasin</li>\r\n<li>Second Place (2nd) of Banjarmasin City Level on <em><strong>\'English Speech Competition\'</strong></em> @Dhammasoka Junior High School</li>\r\n</ol>', '20180416100630_dscf7279.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-refia-azka-nabila', '', 0, '2018-04-16 10:06:32', '2018-04-16 02:06:32', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 'Al Mazaya Student\'s Upcoming Events: 3rd Al Mazaya\'s Anniversary! (15 March)', '<p>TIme flies and soon it is March 7th Al Mazaya Islamic School will celebrate its 3rd birthday. To celebrate this 3rd anniversary, AL Mazaya Islamic School holds a competition that will be followed by all students of Al Mazaya Islamic School. See You!</p>', '20180301070915_dscf3575.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-student-s-upcoming-events-3rd-al-mazaya-s-anniversary-15-march', '', 0, '2018-03-01 07:09:18', '2018-02-28 23:09:18', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 'Karate', '', '20180220123949_12.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'karate', '', 0, '2018-02-20 12:39:49', '2018-02-20 04:39:49', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 'Karate', '<p><strong>Equip students of al mazaya islamic school in order to protect themselves and train self-discipline.</strong></p>', '20180227085327_dscf6013.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'karate-1', '', 0, '2018-02-27 09:29:19', '2018-02-27 01:29:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 'Al Mazaya Market Day Event #1', '', '20180221082051_img_5556.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-market-day-event-1', '', 0, '2018-02-21 08:22:36', '2018-02-21 00:22:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 'Al Mazaya Student\'s Upcoming Events: Outdoor Activity with Basarnas of South Kalimantan (7-8 March 2018)', '<p>On March 7-8, Al Mazaya Islamic School has a special program to increase student\'s skills in preventing or facing a disaster. Therefore, Al Mazaya Islamic School is working directly with Basarnas of South Borneo, where students are given direct disaster management theory and practice trained by professional Basarnas teams.</p>', '20180301064629_dscf3891.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-student-s-upcoming-events-outdoor-activity-with-basarnas-of-south-kalimantan-7-8-march-2018', '', 0, '2018-03-01 07:01:14', '2018-02-28 23:01:14', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 'Student Achievment: Aisya Novrida Putri', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>Third&nbsp;Place (3th) of Banjarmasin City Level on<em> <strong>\'English Speech Competition\'</strong></em> @ MAN 2 Model Banjarmasin</li>\r\n<li>Third Place (3th) of Banjarmasin City Level on <em><strong>\'English Speech Contest\'</strong></em> @SMAN 3 Banjarmasin</li>\r\n</ol>', '20180416101104_dscf732crop4.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-aisya-novrida-putri', '', 0, '2018-04-16 10:11:08', '2018-04-16 02:11:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 'Student Achievment: Prista Oksanarlia', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place (1st) of South Kalimantan Level on<em> <strong>\'English Story Telling\'</strong></em> @&nbsp;GIBS</li>\r\n</ol>', '20180416101008_dscf7305crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-prista-oksanarlia', '', 0, '2018-04-16 10:10:10', '2018-04-16 02:10:10', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 'Student Achievment: Raja Rafli Putra Samudra', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place&nbsp;(1st) City of Banjarmasin&nbsp;Level on<em> <strong>\'Adzan Putra\'</strong></em> @&nbsp;SMPN 10 Banjarmasin</li>\r\n</ol>', '20180416101832_dscf7346crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-raja-rafli-putra-samudra', '', 0, '2018-04-16 10:41:16', '2018-04-16 02:41:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 'Student Achievment: Wida Nur Fajrina', '<p>&nbsp;</p>\r\n<ol>\r\n<li>First Place&nbsp;(1st) City of Banjarmasin Level on<em> <strong>\'Tahfidz Qur\'an Putri Pentas PAI\'</strong></em> @&nbsp;SD Islam Sabilal Muhtadin</li>\r\n</ol>', '20180418210239_dscf7371crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-wida-nur-fajrina', '', 0, '2018-04-18 21:02:39', '2018-04-18 13:02:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 'Student Achievment: M. Hifzi Abdillah', '<p style=\"text-align: justify;\">&nbsp;</p>\r\n<ol>\r\n<li>First Place&nbsp;(1st) of South Kalimantan Level on<em> <strong>\'Tilawah Quran\'</strong></em> @ BTKIP Banjarmasin</li>\r\n<li>First Place&nbsp;(1st) City of Banjarmasin Level on <em><strong>\'Hifzil Quran Putra PAI\'</strong></em> @Dhammasoka Junior High School</li>\r\n<li>Third Place (3rd) City of Banjarmasin Level on<strong><em> \'Tilawah Quran\'</em></strong> @ MAN 1 Banjarmasin</li>\r\n<li>Second Place (2nd) City of Banjarmasin Level on <strong><em>\'Tilawah Putra\'</em></strong> @ SMAN 1 Banjarmasin</li>\r\n</ol>', '', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-m-hifzi-abdillah', '', 0, '2018-03-01 07:47:26', '2018-02-28 23:47:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 'Science Club', '', '20180406133015_dscf7130.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'science-club', '', 0, '2018-04-06 13:30:15', '2018-04-06 05:30:15', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 'Student Achievment: Aurellia Shafitri Suryansyah', '<p>1. First Place of Borneo Regional Level on <em><strong>\'Physics\' @&nbsp;</strong></em>Lambung Mangkurat University</p>', '20180419092142_dscf7358crop.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'student-achievment-aurellia-shafitri-suryansyah', '', 0, '2018-04-19 09:21:45', '2018-04-19 01:21:45', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 'VISIT / OBSERVATION OF AL MAZAYA SENIOR HIGH SCHOOL TO THE GOVERNOR�S OFFICE OF KALIMANTAN SELATAN PROVINCE', '<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Al-Mazaya Senior High School again made observations, namely observations to the Office of the Governor of South Kalimantan Province located in Banjarbaru City to find out how the environment in the governor\'s office.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">The purpose of implementing this observation is to:</span></p>\r\n<ol style=\"text-align: justify;\">\r\n<li><span style=\"font-size: 12pt;\">Explain the direct explanation of Mr. Ahmad Yani, one of the chairmen of the bureau at the Governor\'s Office of South Kalimantan Province with a topic on the topic of National Integrity</span></li>\r\n<li><span style=\"font-size: 12pt;\">To find out the environment in the Office of the Governor of the Province of South Kalimantan.</span></li>\r\n</ol>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Observations were made on May 3, 2019, at 9:00 a.m. to 11:30 p.m., and attended by 68 participants, 60 people consisting of Al Mazaya students in class X and class XI and 8 others consisting of Al Mazaya teachers as mentors.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Observations at the Governor&rsquo;s office of South Kalimantan Province were opened by one of the Chairmen of the Bureau, Mr Ahmad Yani or commonly called Pak Memet. The event opened with a warm welcome and then continued with material delivery activities related to national integration by Pak Memet. After the delivery of the material was completed, the event continued with a question and answer session and photo session.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">The closing ceremony was closed again by Ms. Memet. After the event was closed, observers left the Governor&rsquo;s Office returned to Al Mazaya High School. This event can also be carried out also not separated from the principal of Al Mazaya Senior High School Mr. Muhammad Amirudin Hamid so that the visit to the Governor&rsquo;s Office of South Kalimantan was carried out smoothly.</span></p>', '20190509122854_almazaya_-_gubernur.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'visit-observation-of-al-mazaya-senior-high-school-to-the-governor-s-office-of-kalimantan-selatan-province', '', 3, '2019-05-09 12:31:14', '2020-04-08 07:25:53', NULL, NULL, 1, 0, 0, 0, 'false'),
(35, 'SMA Al-Mazaya di ABSPACE GIBS Festival SMP-SMA 2019', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>The existence of competitions in the Non-Academic level of junior and high school level equivalent in South Kalimantan, Central Kalimantan, and East Kalimantan, held by the Global Islamic Boarding School, Al Mazaya High School also took part in the competition.</p>\r\n<p>This competition was held in order to enliven the 2019 GIBS Festival organized by the Global Islamic Boarding School\'s ABSPACE GIBS Festival 2019 theme which included the Speech, Traditional and Vocal Dance competitions and was held on February 28, 2019.</p>\r\n<p>The Al Mazaya senior high school students representing Al Mazaya participated in the competition, including:</p>\r\n<ol>\r\n<li>Belinda Zabrina L, representing the Indonesian Speech</li>\r\n<li>Istiqla Faiha, representing Traditional Dance</li>\r\n<li>Fitri Azzahra R, representing Traditional Dance</li>\r\n<li>Wafa Lettysia G, representing Traditional Dance</li>\r\n<li>Aisyah Nur Zahra, representing Traditional Dance</li>\r\n<li>Aurellia Shafitri S, representing Traditional Dance</li>\r\n<li>Aisyah Nur Zahra, representing Vocal Solo</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p>Al Mazaya Senior High School students who took part in the competition were accompanied by Mr. Firdaus and Ms. Rahmah, and got satisfactory results, namely the Indonesian language speech competition won 3rd place, traditional dance won 3rd place, and solo vocals also won 3rd place.</p>', '20190509122909_untitled.png', 1, '+3+', 'post', 'publish', 'public', 'open', 'sma-al-mazaya-di-abspace-gibs-festival-smp-sma-2019', '', 0, '2019-05-09 12:29:41', '2019-05-09 04:29:41', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 'Al Mazaya Senior High School at O2SN Regency Level 2019', '<p>O2SN stands for National Student Sports Olympiad which is a National event to find new Indonesian seeds in the field of Sports.</p>\r\n<p>O2SN is also called resembling the National Science Olympiad or what is usually called OSN, except that O2SN is a sports version, and there is also FLS2N or what is called the National Student Art Competition Festival) and OPSI (Indonesian Student Research Olympiad).</p>\r\n<p>Lots of sports that are competed at O2SN include; Athletics, Swimming, Badminton, Karate, and Pencak Silat. The O2SN technique is the same as OSN, which has a level, one of which is high school level.</p>\r\n<p>The City Level O2SN of Banjarmasin was held on April 15-16 2019 at the Adenia SKB and Gor. Al Mazaya High School sent representatives in the field;</p>\r\n<ul>\r\n<li>Martial Arts, represented by: Magriyani</li>\r\n<li>Karate, represented by: Noor Maya</li>\r\n<li>Athletics, represented by: Taufik M Riady</li>\r\n<li>Badminton, represented by: Elmayya Jihan A</li>\r\n</ul>\r\n<p>Students representing Al Mazaya in this competition were accompanied by Mrs. Fatimah, assisted in guarding and encouraging Al Mazaya students, the best income was won by Magriyani in the field of martial arts because she made it into the top 6, although she had not won first place, this result had kept her pride because Magriyani did not have a coach but could still last up to the top 6 of 28 competitors, while for other sports, they fall in the preliminary stage.</p>\r\n<p>Even though it hasn\'t got maximum results, this will be used as a motivational material to be better in the future.</p>', '20190509122944_o2sn.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-senior-high-school-at-o2sn-regency-level-2019', '', 0, '2019-05-09 12:29:44', '2019-05-09 04:29:44', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 'VISIT / OBSERVATION OF AL MAZAYA SENIOR HIGH SCHOOL TO THE BANJARMASIN DPRD�S OFFICE', '<p>Observation is a learning field and awareness to students to find out how to know the real reality of the theories that have been obtained at school. Because by observation, students will immediately jump into the field and find out how the work and steps taken by an agency / institution.</p>\r\n<p>Observation is an effort to optimize the knowledge that students get from school. In this case, Al-Mazaya Senior High School students observed the Banjarmasin DPRD&rsquo;s office to find out how the work process and environment in the DPRD.</p>\r\n<p>The purpose of implementing this observation is to:</p>\r\n<ol>\r\n<li>To find out the work process of the Banjarmasin City DPRD office.</li>\r\n<li>To find out the environment within the Banjarmasin DPRD Office.</li>\r\n</ol>\r\n<p>Observations were carried out on February 19, 2019, at 14.00-16.00, and attended by 80 participants, 70 people consisting of Al-Mazaya students in class X and class XI and 10 other people consisting of Al-Mazaya teachers as mentors.</p>\r\n<p>Observations at the Banjarmasin DPRD&rsquo;s Office were opened by the aide to the chairman of the DPRD, Ms. Andin. The event opened with a warm welcome and then continued with a tour around the entire room and the functions of each room at the Banjarmasin City DPRD Office. After the observation was completed, the program continued with introductions and motivations given by the chairman of the DPRD, Ms. Ananda. Then fill in the question and answer session and photo session.</p>\r\n<p>The closing of the event was again closed by Ms. Andin, adjutant to the chairman of the DPRD. After the event was closed, the observers left the Banjarmasin DPRD&rsquo;s Office and returned to Al-Mazaya. This event can also be carried out also not separated from the principal of Al Mazaya Senior High School Muhammad Amirudin Hamid so that the visit to the Banjarmasin DPRD&rsquo;s office went smoothly.</p>', '20190509123317_1.png', 1, '+3+', 'post', 'publish', 'public', 'open', 'visit-observation-of-al-mazaya-senior-high-school-to-the-banjarmasin-dprd-s-office-1', '', 1, '2019-05-09 12:34:18', '2020-04-11 10:34:12', NULL, NULL, 1, 0, 0, 0, 'false'),
(38, 'Al Mazaya Senior High School at O2SN Regency Level 2019', '<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">O2SN stands for National Student Sports Olympiad which is a National event to find new Indonesian seeds in the field of Sports.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">O2SN is also called resembling the National Science Olympiad or what is usually called OSN, except that O2SN is a sports version, and there is also FLS2N or what is called the National Student Art Competition Festival) and OPSI (Indonesian Student Research Olympiad).</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Lots of sports that are competed at O2SN include; Athletics, Swimming, Badminton, Karate, and Pencak Silat. The O2SN technique is the same as OSN, which has a level, one of which is high school level.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">The City Level O2SN of Banjarmasin was held on April 15-16 2019 at the Adenia SKB and Gor. Al Mazaya High School sent representatives in the field;</span></p>\r\n<ul style=\"text-align: justify;\">\r\n<li><span style=\"font-size: 12pt;\">Martial Arts, represented by: Magriyani</span></li>\r\n<li><span style=\"font-size: 12pt;\">Karate, represented by: Noor Maya</span></li>\r\n<li><span style=\"font-size: 12pt;\">Athletics, represented by: Taufik M Riady</span></li>\r\n<li><span style=\"font-size: 12pt;\">Badminton, represented by: Elmayya Jihan A</span></li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Students representing Al Mazaya in this competition were accompanied by Mrs. Fatimah, assisted in guarding and encouraging Al Mazaya students, the best income was won by Magriyani in the field of martial arts because she made it into the top 6, although she had not won first place, this result had kept her pride because Magriyani did not have a coach but could still last up to the top 6 of 28 competitors, while for other sports, they fall in the preliminary stage.</span></p>\r\n<p style=\"text-align: justify;\"><span style=\"font-size: 12pt;\">Even though it hasn\'t got maximum results, this will be used as a motivational material to be better in the future.</span></p>', '20190509123437_almazaya_-_o2sn.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'al-mazaya-senior-high-school-at-o2sn-regency-level-2019-1', '', 2, '2019-05-09 12:35:53', '2020-04-02 07:41:11', NULL, NULL, 1, 0, 0, 0, 'false'),
(39, 'SUPER CAMP AL MAZAYA ISLAMIC BANJARMASIN', '<p>Super camp yang dilaksanakan &nbsp;SMA Al Mazaya Islamic Banjarmasin dan Rindam Banjarbaru pada tanggal 25 Februari s.d 1 Maret 2019 yang berjalan selama 5 hari, pada hari pertama tanggal 25 Februari Full siswa menggunakan Bahasa Inggris, hari kedua tanggal 26 Februari siswa belajar Tahfiz sepanjang hari, hari ketiga siswa belajar Math dengan menggunakan model pembelajaran yang berbeda dari pelajaran setiap hari biasanya, hari keempat siswa yang jurusan IPS pergi ke pasar dengan tugas menganalisis pasar dengan cara wawancara kepada tiap penjual yang ada di pasar dan anak IPA mereka melakukan bedah kodok, Ikan Nila, membuat <em>es cream &nbsp;</em>dan pada hari terakhir siswa SMA di karantina di Rindam Banjarbaru untuk melatih jiwa kepemimpinan, kedesiplinan dan kejujuran yang di ikuti juga siswa SMP kelass8.</p>', '20190509124201_12.png', 1, '+3+', 'post', 'publish', 'public', 'open', 'super-camp-al-mazaya-islamic-banjarmasin', '', 3, '2019-05-09 12:42:01', '2020-04-08 02:42:58', NULL, NULL, 1, 0, 0, 0, 'false'),
(40, 'All About Almazaya\'s Student Achievements', '<p>Al Mazaya High School students often participate in various competitions both in academic and non-academic fields. One of them is the English debate competition. The English debate competition itself has various objectives including making students more open minded, increasing self-confidence in public speaking, increasing knowledge and improving critical thinking skills. In addition, the English debate can certainly improve students\' English skills.</p>\n<p>On April 10, 2019, Al Mazaya High School sent a team, namely Charoline Putri Ichwan as the first speaker from X Social, Belinda Zabrina Lailani as the second speaker from X Science, and Affan Ramadhani Adjfarisi as the third speaker from X Science. This English debate competition was held at SMAN 2 Banjarmasin. The day before the competition, a technical meeting was held at SMAN 4 Banjarmasin, where the technical meeting was represented by the accompanying teacher, Rahma Anjarwati, S.Pd., Gr., Who was familiarly called Ms. Rahma.</p>\n<p>During the technical meeting, an explanation of the debate system that used, a list of motions to be discussed, until dividing participants into rounds. The debating system used in this debate competition is the Asian Parliamentary system, where when the team\'s preliminary round is divided into 8 rounds, which are attended by 15 teams from various Public and Private High Schools in Banjarmasin and will be judged by judges from SMAN 1 Banjarmasin, SMA PGRI 1 Banjarmasin and SMAN 4 Banjarmasin.</p>\n<p>Al Mazaya High School Team itself will fight a team from Kanaan High School in the first round with a motion&nbsp;<strong>THW punish people who spread as a terrorist hoax</strong>. Al Mazaya\'s high school team explained various opinions related to motions from an affirmative point of view.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Entering the 21st century, there are 4 skills that must be possessed by each student. The first is critical thinking and problem solving, in this case students are required to be able to solve the problems faced which begin with compiling, expressing, analyzing and solving problems. Then the ability to communicate, collaborate and creativity and innovation. In addition to the teaching and learning process in the classroom, in enhancing 21st century skills can also be obtained through debate, where in debates, students are required to be able to analyze problems, process information obtained to be an argument that is delivered briefly, clearly and densely.</p>\n<p>This year, Indonesian debate competition was held at SMAN 5 Banjarmasin. The competition was attended by 22 teams from various public and private high schools in Banjarmasin which will be divided into 11 rounds. The winner of the Indonesian debate competition will represent Banjarmasin in the province level. In this competition, the system used is the Asian Parliamentary system. Where the team consists of government and affirmative teams, each of which has 3 members. In this system, each team member is given 7 minutes to explain their argument and starts from the first speaker from the government team.</p>\n<p>In this debate competition, Al Mazaya High School sent a team consisting of Wafa Lettysia Gianti, Fitria Azzahra Rezeqi and Istiqla Faiha, all of them from the XI Social class. Al Mazaya High School Team got eighth place and got the chance to fight the team from MAN 1 Banjarmasin with a motion \"<strong>That the government requires civil servants as neutral state apparatus in elections\".</strong>&nbsp;With the motion, the Al Mazaya High School team had the opportunity to become a government team and MAN 1 Banjarmasin team became an affirmative team. Before entering the debate time, each team was given the opportunity to case building for 15 minutes. This debate competition uses a ranking system and the Team from Al Mazaya High School is ranked 10 out of 22 teams.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Two students of Al Mazaya High School, Amiza Qorina and Prista Oksarnalia, who were both from the X Science class successfully got achievements in Story Telling competition province level that held at SMAN 5 Banjarmasin on January 19, 2019.</p>\n<p>This story telling competition was attended by around 20 participants, representing public and private High Schools in South Kalimantan. In its implementation, this competition didnt have a specific theme that must be chosen by the participants. Before the competition was held, the participants were given a list of the titles of the stories to be presented and selected the one on the list and then prepared a story script that would be presented on the day&nbsp; the competition held.</p>\n<p>Amiza won 2nd place through the Snow White story she delivered during the competition. Whereas Prista chose Malin Kundang\'s story which succeeded in taking her to become the 1st winner in this competition. A pride for Al Mazaya High School because it has very talented students in the field of storytelling. Because the story telling competition itself aims to develop the ability of English-language stories by conveying stories verbally in front of the public and can also develop the ability to convey stories verbally and smoothly, with proper grammar and vocabulary and speech, and intonation that is proper and clear.</p>', '30a63ebda9b406a74bd4aed4965c54d6.jpg', 1, '+3+', 'post', 'publish', 'public', 'open', 'all-about-almazayas-student-achievements', '', 8, '2020-04-02 12:43:58', '2020-04-11 10:16:16', NULL, NULL, 1, 0, 0, 0, 'false'),
(41, 'Profil Sekolah Al-Mazaya Islamic School', 'NvfOLv4XDbI', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2020-04-08 11:03:15', '2020-04-08 03:03:15', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
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
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Tes Tes', 'true', '2020-04-02 10:25:35', '2020-04-02 03:25:35', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
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
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Education is a ticket for the future. Tomorrow for those who have prepared themselves today', 'Anonim', '2020-03-15 19:18:35', '2020-04-02 04:20:40', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'religion without science is blind. And science without religion is paralyzed', 'Anonim', '2020-03-15 19:18:35', '2020-04-02 04:21:10', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Live as if you will die tomorrow. Study as if you will live forever', 'Anonim', '2020-03-15 19:18:35', '2020-04-02 04:21:27', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `scholarships`
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
-- Table structure for table `settings`
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
-- Dumping data for table `settings`
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
-- Table structure for table `students`
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
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `mother_name`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `guardian_name`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 'true', 'false', 'false', 'false', NULL, '2020-04-08', '152223', '15515345', '154851', '152', '451512', NULL, NULL, '2156451', 'SMP 1', 'banjarmasin', 'belajar', 'guru', 'tes siswa baru', 'M', 'Banjarmasin', '2000-07-11', 89, 23, 'amd', '13', '01', 'hksn', 'alalak', 'banjarmasin', 'banjarmasin', '71419', 74, 81, '08228552', '081524845', 'm@m.c', '2121', '2153102', '121', '12121', '2132', 'WNI', 'indonesia', 'ayah', 1963, 50, 14, 71, 23, 'ibu', 1963, 50, 10, 71, 23, 'wali', 1963, 50, 15, 71, 3, 15, 160, 55, 4, 1, '0000-00-00', '', '2020-04-08 13:11:06', '2020-04-08 05:11:06', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
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
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'c@lol.com', '2020-04-11 18:19:12', '2020-04-11 10:19:12', NULL, NULL, NULL, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
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
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2020-03-15 19:18:35', '2020-03-15 12:18:35', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
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
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Anton Sofyan', 'true', '2020-03-15 19:18:35', '2020-04-02 04:39:07', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Anton Sofyan', 'false', '2020-03-15 19:18:35', '2020-04-02 04:39:07', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Anton Sofyan', 'false', '2020-03-15 19:18:35', '2020-04-02 04:38:59', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'admin', '$2y$12$L5Nkd8q2auiRAcaeUQ/TJ.Bo787EArWg9/ED0HFTRSU9VlKBru0Fm', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, NULL, NULL, NULL, 'false', '2020-04-12 12:41:49', '36.75.19.47', '2020-03-15 19:18:34', '2020-04-12 05:42:13', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'kamal', '$2y$10$K6UvZkGVDhf/EGykgBWm6OMoD4eGJusqWCKx.H0FumH1//E9GLquu', 'Mustapa Ahmad Kamal', 'mustapakamalkml@gmail.com', NULL, 1, 'administrator', NULL, '', NULL, NULL, 'false', '2020-04-03 04:12:48', '192.168.10.55', '2020-04-02 10:17:48', '2020-04-03 02:13:02', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
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
-- Dumping data for table `user_groups`
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
-- Table structure for table `user_privileges`
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
-- Dumping data for table `user_privileges`
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
-- Table structure for table `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('qiotdk9v7cs164it2fcotv1oeem4mo14', '172.69.34.151', 1586668266, 0x6a6b37764350584935795833456248714c5035513447545f6570556a6f454f39736633345a484749594e745955586a7550567771336f47634e484c334e634e706651567947435443652d624d5252577756577838624b714f483430446c77413677716c75726e6a36674969685a48485f765535656e6c55436a645850346d446255555877686e6330306144377732456a7256794b76503477573954516d54622d586b5a792d42476e55756f6b7079496c4b71316e52773859725a53744b38394f4879356e487351396c716e7a386f4d346f374a75327a463555706e4378745f414f46757547415f706e334b68774b6b346f424a786634556c424245343257434e6e3870567479335465424454304f42474b6a306b33704147656441723574324f662d534d725961695f6148436b6f4e7858323944635a6463306f514d314b515a3461382d473733766f32367757782d50457666734e4654466954416453515372706775767564722d50462d78543837737932495754354b6b5f474b664f315066414562557952654836737a5052734f5a6a735876425438677670793531742d4b7a574863684f6e6f35675073664a64746d4635706d4134585f565a347a5a4d39424236367074364b6d586e3059754d477a4d674c6c683736455f6d4d4732796c7672624b686c54676b645349312d315f334d3163762d546b5277507a36586a6d323963315f37614b717a344e7065304d6d33613265612d5148655a426f514336536838316f52383153466762466771416154795173424261632d4a45664f4d475f74414d6a41413755477165315a6a615834575037466e634c465f494c416e5f386635345f6945636b566c3964485352376167592d776c416f762d484d76354b39704f34574b7467304b6f6c50775547715657777736754749724d37763773536f3957375172786c32475330716a6c626235342d63526675576e6f4a57686a7538496236496e376b726c344b4934776a41794544696a46706241785f526f50536b4c5f4847703067724b306353316d334b415035687273617a31715f334b636646586864477162754471645a48473167514e3254396c5939487434774e6b5a4c4e49765072654c58635f6661776d6f474448553953745a753176576f6a2d4758725a6e6c6e7446636d2d78676b4d576857466230307372317a61756643377469636e6c697a54774138386943316e55634f376c2d49646245437a354c75464c4e41475f49707245426b574257316e6e6952505a664263764a713569394c7369676d5937345643477679724d31595a31755a7a475f58337330323279566233645f4954687356677a54666b6d746b457a59534b4c7976325775795a3336396143322d6f5f644b504862775f77647654376c524753652d6258534c437651584d575535536131724463416854502d41576c30585843686e5870567667794247335076354d68396e382d517879732d7555625f5145554471694979366e5377784735627671637265314d44345f5973625149566c4f6176682d422d68346678743342397756475031786c714b6c4559504a50632d5932586b71436547304e453043616d63515f79576f37674733713156516131336c6c494f4e3944556f59626f5a4a6955334364547a767651344c745a37726b487671675f6d4e324244766f5558684969423139544678534e3139586471514767324869793977555946384561765567457954766d596a484f44463474585a454636684e747135646f6f724d6e6941497038416c374468643833336f566a6464375673702d5453774771704b786a4d3667575234574d6f41765079424f36575545346672322d4354376372735a4e33324e2d643348713544742d544e2d536b373774313261503436664f73503570776f6237685a685242356761715062647977565051426144464b45305f716959753945675f48437345767033767658754750564d75547542786847784132303241474779424447784335384d6b73337a646730506c77727041444b59535665554b306365717a427741474f4477505f6733495756347148377a434579374545634e6675696d6e4379483550506a75512d765341304167766b2d4738544161583363714e5a66326e39466b426c55425570536b47394d6e47304b41664948506c2d3033763375446251704b767a5f445037756a47636775362d427644525137324c795036566f735843614c56416e7a4f396f76646e654739505530436e486652702d7861466a7a6232575a7546614479416c736e6e4c5a645979323153464631513956615162555763694b445278753557675455424c61794a346775742d50365a4645625f754a63527458647a46496e397954486c304465416c36726267766466764e435356744a6d5361416763694a774a4573564e44315044726a6d7a4748767a32676961636e2d787a38424b4e56633641597a3058476e717549736d4e653376596c582d4a707967714f576e6a64304337382d7043513630487871683557443447383630637634794372754f4556754633474450774451554c43666f766178436c46563466634667663956342d323134487a304d7532395954565a714e57346d75497938584a32673845664a356a50694335765f463752536973702d3677736b5078383342577a52716e62377555343134624c514373556870566b4a6f734d71305f712d43376865534d444e4c614641676e52534236456e714531506d3544384a46712d366146504157746f62413272537053564570764e4d6453326861356d6b41586776335763614d784e726239577730776a48366234594632596b38326437574970705f4270635953765344556d5a4247616d366976716e426a48625a77345f47306e495078503147516c336864314c5945666e6f574b642d435a4b723779745f424c6b355a735a53377133764149774e517a70633457695074574269306858304f714f62595058435f5771372d7241524e3345536161473676776739624e53646f666a4e6d78516b6e4f423169376b7550323145474d3258763177465f663579625451743965344e6d51777641524279473662745a64504147575657575135624a6a53715470475533685541546543564e594e315956784f385a514c396f78477a3767586a44745a4163733458457471323167764f70696c515333756a7461304166435842694c4e386c3378365f6a6a4d7a3945414d625245333867755344624b53786a7136686830566d6e4d675277795f3936547a47615166624e627734556944537676614862426d33434e38527444484f387349306267317a5636636d3054307174715a72787251433869512d73724751487a534e6c5671395739315f2d49627554484a7867424442586872315558334f5430734e6a437062476f6371367654367a4c69516844426778726d492d7541316f625a63524a386767755739514a6c46654d525f6c664976537579472d75456153554d52686b7554374a546b397837485a6e5a484b49616a6b5f413856376b515f7a686450476e7664713030444d61667a436c6e57516f314373714e4a7a7064364a5944617a654447703143336730416e347453424464347536624d755534597255474d5a59545658325f31535f4a537952715f76754c714852667163395a563556336d4d6266506475444737796950684d5955597433725a794f6f537141444f7a316363505630633066513469773241384274575f646c4f74306b394e4c6f6e5047494b706877444d67585775314d4a4564696b69387a376c41386b794f6d306a6a514670734f4c514347626f42316c51584e465a5151593449504848364f6c755f745247636c7759643169694970764c7a306c6a5453437434773043483744785357744366754d744363712d70345135365a336d304c4a6970336d6a4b6b6f37354a4d52624b38796f7859646b48484b6d37785a6d6763744d7949586337424e564e58734549696d5a32323043415a4465354c4744694668327531585a41585a4d52322d5f717a63734a483650437a364f627136534d766555784c6f743936646e784c5254767933415732626833424c394a6f6565533665782d6a49427466656e5a575f4a592d66676474614d4e7952735f44417a62355034332d59634d66305f6449524c4e4154476376476e434e39445a33657433506555374c4f77706a6d6846784259504b706a70697278337043597530664c716d744838457a6b6a6a5a6a6f6864756b736b53464645426139416b7959422d71686a764d6e396578623034397739552d796654302d337a48356e6d5844535838313756505059543479352d69746e76473278323868437066314d745579785435516c65504a36435551666b516575724e596d5a6b6a7753434e70666164464f4a716f67505f614f473049776c44425250554e4141336c473159646a5a30636d54794d485234377967787633346f564a796864716c6861305f2d725462456f666c646665725f385565315f375579427076677a594e686f382d4766627a6a5a776f4d6353387547764336436b71647149704b3036565a5671465039725f6e625438463467725833523978336351635541772d4c316149667a74784445393370664b5f4458745a6762746542464c596f4d5364336a736955754d7a382d7548767142523756697a42373936364952644a3570486f505f4e4444645a6f4d6d754f48367464685f437755654b6e7a51733356665962592d3858566a64654e73774578495a7779455751527475546c5168686e327a524d43774f475a326844417450717a645f63654863627050757634784c5249617756736779675f5a5143745956365a702d624657726c464f6f434f48493868436e74375059374c4578665f65794e566a4f69394f3279514979694d5f337777394151366237336542624b77383254734564787235634964786d57534b3874394747596b55425034427a5075425158712d365f38663658554d534349497930614a336764755f75354d696549346e53584b4f6732485f31795543364d4e5a3639554e675a444b344a72587750795a42325237344674504464544d5267636c67786935726d2d6c5631684c51453451386c384865614c653964354341765934625a757767597345336d47656f6a375039796947687772444f37646952504b78643367585f4f477861364562447851793545326c543655484e366270554b49726b6431694155434b4a7a6b745436734757665562426b4266446c622d414f52302d764159524477437870684a4c5039417476766d32456857695269466a78745a3153786f5a6c514848544d725f455f59534f513165396870336e515f4f485a475862483039306834456446384e4b576358335f5055456f6e662d63353073716b5036694162485232544241574e757935566551764478745a50435237644c563942724e556134387a6f42613338734c644535414259455f44357151696164486850424b6b3852515a5a79754855484a6471717531532d484c6f2d446a576266577150724a637237676b787555476e4856773732653946464b473946415a584e4c4c4232526a5966656c3849482d44414d5a774e756d516b32376b364733664b516d5034516e4c5535642d4e6b5033594f385f644e555577626b6342444433616372477457615164326c68383053746d472d4e69744978315263307864387336315873354267443747415677346430794a505773616644616c35794236704732305577675f5432615333397a53724835794e4e706b313558535661315537327351315f475251565a4f5f576d70484a316334657554793357775050745047316e4c6e51516c7274516e747136323153573451547a58564e47413565585a526b626c6d38613465625475665974505076713947796d645642576b4f2d4373643964586f314d676b5f323737436e6e692d547a5a39634571356b3450795064614f30334359583555697864325a72654d726271644e4f74796b476a37484f64634c4b5f6d545a787579634335366d64543465595f75636f4a68665143366e71437a4e643661503662454d7277544f694f516b4267426c394b57394e6865515258644d4b3848636b573339314e5838496b75773639686f7a7a303139677a394d5931573946564e7450487a51694d5231664e45597377476c574f734964374333754f575f6e4d4c596c37485645384c5f35302d6a714337527474792d5a31646e6f6674377052494239432d564434437650787068587445574d4939655359336a466533584a44715347482d42326171774f765252682d38455161714879723039767a5778614b427656385f77634c4c6b336a54356a6f7134644d72493549515a56322d6d4f657830795257306d47662d5368627648515270517a704f42696d6f77503554726e30594d6c46555a48756d3271426a784d517477597a6c4f5749553335364863397477756a6b4950417855556c6738766949554b45794935317a7353647647655358556a4e757938704f4b4d56463852364366497633343463624544686e496e49326972453547507672574259415f65557436776a37444d7535514676366b5963334433347558684d7142496e72764551304e7a766834394a445f4e65366247732d47723858586d587a3769422d693336556839325f6b63643949336751555f517134437a666a61635969716b596d51706d71377757696a516c5f483161465a6f6e596e4553375369534179737750656a2d74446e4b7537434a5f4469325878684d47664748734f754e5971316f5f745a6a5a4331756f6c684b435866784d4f45745848693543392d64796d77593162685a4361727368586b484766756a684c78776747585a4f656f6579664e32324a49325572696d705579584d6f5f7564567a504a626837664a68464e614f33344146676b2d384841382d42574d7764734c77752d35623364593352306843436f3763353947674537323473486e6f775f7433785048373055324d2d435554743955735966617a573262774f3357674f52364276394d4572386d6447432d5269564b7046686f6275316f4f78653469785a7256474c66635068454636446b4574394a447573654e765261623668594f5551336a3652335468425a6e626937415541434f677a503861774741384e706f6c33644b594b613045695045624663756250746843314576595a78515939596a6d6b4a32744b47657677554d7a5a686d69426e6c6744575a3448576966745330676634465833434e476b73327a757a376f2d516256695a78672d5171476a39773939364c6d5079725871654e433769555a483732375a66556c5a394b415a624a78564c5067626b4c755779766e6d65324668327a506467374f31594d54594f43375445776f4d686c375647576173365163783162346c6c4f5f73586233673345367230503776347643764739617a556b4e595776314c71414a347865345061765f493338637279755a6a694130733762764e6c6c667a47333442366e646133465a52416c6c552d68424f71694f4e62383947715a416977303347347759756155716677764439556265354532355049764c78325f44336e6c73307a43564765357977367743464b746d54344f5948374a44744c337048717145446751597857723268447178565368414f3039663833702d30436b62317436777355524a683855774b66773352684f44566b6f585464424c544d7542375556524d564147566a315553745f626b786f41795075597a6e49444f47366f6f4579456f705665766766363247794562436346534e646b725948783970683245695055715376415432724951574c454f4a592d7255676e6765304f55733838316e6679717849654b6431316f4331556847),
('908phn46p61ce3aegc7s3mg9jaf4b6mv', '172.69.34.211', 1586668353, 0x48346237426d4245764e5164554e3751476654684e6e2d497052794b3148574462645347784c32456c634a44536879795862354b517a38645435707545395978317468357446543868614f3047556e7448756d42305f4463386375702d62554752334648646565693179306d4a6a57434f464f3755786a71414b4f754766763067787650374b56635a72313131494c6a65445f617a366970416a366c494e3674523843665a6c78643431653870795f6d394e5a664244465136342d6d46702d4b5955497938727530394c6e67515739694a434a5370797a64556734546f5446786e48384b6b2d5546507832366b6a384d5569696563455174414d39666634413838713732665f6e3077442d5547617654655778356e327a7150543861625565726b705137534a4233425766674136764730554f5a474e3754466874772d4b613048445a7a735662467a6d4a586d6b7a7a6f36446862644a5255697744325f6748664d2d46356b524f56336f7a644842363837616e69625f6a5f7845706e3266647652774e526230454d4c44736455484b6855796f7449425566386b617a6b4d324f70776e356b4a33797639356773526237303165754e59394270344676504c3647767a5a5a38615f66675249754c5330786a4d505249774a63446b4c3948416153585434664d496c535a62504c72554e6852526e4e6956643966715f5f713171746f4b6b58792d37775a35646638554e785a71642d6d6d497377367230634d72685855642d59324455364a344167544d4b6b4b4c796d304542394f334d36774b2d4438472d7266425945324f5849523161586f514576396b545054704a6c61472d5534387755415a644d3455636c56724d4c613464386d6971306b744e714f6b6559556d544d59675571515445524d6f6d6a6f79335945337879345f6d397733485a4e4c4e5a6d3656586b7a4f586b357957615431564e663635422d423147567868323854305274756353446d6c524d4d6e354f6358324d49614b745654456b38464276327732374a55776237384a79366b54715463563373412d686b5751524f5f31556d5f7239304c656d6a6a5734716f367973583230684b45413153484b63524c50546b6d6c776e4356696c513958416f536f466a466b7863465741336c4b716842596d6554554e383264466a73415f4855387a4974446c7a5a43424e51395067786132445a6b41436c39795f477959305a34384f544d5268494c316938564271784d58714f6f564f68524c7078636a71344953773358375544477745364b733547714745733773785f3666384b486c637771644e794950787a53594a59535074307244645365656378764e354c567136667a312d673157424f704a62656f456e6f43786c2d757a735f2d397450355f62554266703449656c4c574b694a752d6847323132516461644241734e305561314464576e6e33503073766e583759324d436d774678436a4342537137416d5f586b67596756516e47454530395f4d416771554454705076674d62656a2d6c594b43796a61417748584c31527451683658593359724a646373706c3661666371713652797273424332736666744c516b5a51383154635772765a626d473356505f53775546796f7234596a6f44642d646b76683076752d5a463841326a503735482d6f3231496362634450482d5776554579315a57616c585a3653547442336c7242726168336f2d366e4d2d52365950774f4b446f464d384b5053307236575753655f43736e476e67325f62662d4e534f334d63784a5871564c395f5661324879736c64433247494471707168686666354a593431776676346d3052714c556b48457233565f786b5446435f52696e3165455371343763374a72336e69614355505276634738795a4c4e574e2d684c4d637170666948435f394a49727665425f75735a3359715f2d35544830675659355138664e6465766b49326d68736a4254666d355359754b2d524b714953344b44684b3878776f6f33675051315430706e4567664c594a385671447a345441415a4d78774a4350434f396c6543517a6862575f5a786e325f793664774d4e6b6e69317a346a3865486f6962756b394149775131327a474f5a774c77332d6472506f47464e65746174766d7859574437415f4f4d7a3141376d6561524e4e4132535a495172385151373242366a616f4f3147676b6f6c4976303948724b75366a785a565f58557349613850615a7163544f716d69432d676c7a664c644c48706c2d305f3955506f754b3146344769392d322d6b344e31645058757664743845485f413474377069385364756e665a574d434e63535f61505743495f565546496939774a5757375a77443441633234636d497375535452325436526966434b425155617752434d454f77355857796641514148385339714361614268504c446a305a6532365553354c72695a33614e5a7453623143486e42626f4d6e546165344e42385562446a6e794b396c436959506b6d696e726a67546b436f6263446f335048796545626877546e3732384c46394e7064675a736f39656e5a584d386864376451364c4f307a583452446d6579764f337732534b59492d496971653062467330746c72396f4764536b7456675f68437a6f63693255734b4a6f3833315f435570376337596c7444444d413144596e595979676a6c4c6377647961657079656237697949534a46457459304a745063304256356845596b6974737a4c486254536b5f72357868686b544c534d3378436155756e564c2d787745794836344d47476e694e426f3059324a365936776f74555f7965444a4370724b304b6a415961503330764331396f494f54356746706532663548764b2d3579583450684d5274792d454846777034714431722d46657a744f44644b747a564a4c6a4a6d413933626254786f6755544161413157324161785939595763574f7936304453433770797345685764413679626c30536e6e355f696a6f306d4437554575736b4d37775456546f686736544f575536734a50694f6971526c4a537a555546665a5174316e79706b634c48696e65637346304e6d4c49515167395652475955686c635a4b5253685345314a5a5333446d64316a5239424b4b304872444f614b74713279417550366454776d766a4e7a714431592d696a4a496165744879376f5f707353424f5f53746f5a7053794931785748427a4b57366c455a657a6969567a4e344e63793166315443464574315945693962577a355637715459786836677776456d6b494d5975786732303473556c43474f503537476b4f7a33795f53364f4b4a7a6f4d36656d5353574a454a5970543930676e48366265304c776c3978494d5651517952616673587a4a5268716b646c70754f675a7a5746486461337a3950647955724f7a56444965694663497a35484d633733714f546f716f456375765a6d7a48615941344476383274534d5335616b63786e3177716579375739646538527546595262476c6b575257326d5555324b745463346d4177366c2d504f52542d39672d4163573979547642675834752d71396b31795562514f646d39494456516a5a4c353857326a5f653451777a4547725a445732585565556759773974654c6c66425631395f74774c376f36454d682d4e775a31386748736576694d66324e6e4a785961354f4a37703135734d385a4e53575f6c347a7052736b3241556749335133704c3568483571566b362d5f714a6744465f4d6a4a655249627179462d4247624b2d41377749366f724564474c556954497a4b5930534c795a544a4d6b5671356a4b5179574266306867343073634b38485a447a68794a6370324565737a74534c4e415f482d75774c6a5f5041743446413773515447756b37536b5a6c5231725f526a396f50416534344b4e6a3537525f72767650727a796359533378724e7032697a456f72676e305156574964423457674a674a394e7a7667506f4d58354577416f6d575855512d574c4d5f57676e6e587a31366e626f73447a35795645704a69736f537443754a326a5130457478315568334a744f39754d323377676745413243534c577645364c424a7a474e67643775365a31474f394a41576d6e5859563149657a3658416a65653656745063525733576436484e52424c62653353494d624366763151724949386d34485a6242573251564e754338345a4e5a57316964775362446e74636252537174652d637036426d52784566506557413068544c64467842566a416c6f506c4970715f4d6854476572504f425444774b65786f617446377374504c594c39457573354d45394e584642414542717447655241646447486a4334495a6d6e315966724839305a4f4f664535437863774f6c4743546c2d73587a644b32306e44364f536b2d4a35377770746b4b63433166677167454c345f575f7879413968523363736d5563446a4473426171524c6741596753344b476b7762595368314b5f79396a3964726e6658316f513876754b7678616e34546f4a433754454b4479617649543663527862447a424e6d36766b4b676251614534794842384250386834377647327869394676364e4d4177514c73384c5941746277366f654748334771726a576566794d7a305134737045416e64464f34696153545669727a30475973384d305849334a36565f555a7356526c2d39596b5933583531653972704b72674c79304a6c613273464943327a6170436d42566a64364d4c30716d346b74322d64494d35674b572d42394f6a426631356458336b5976434b6659713766467369774e51574e7349613976454f30584b30472d376667526249536b2d2d48706d4a522d32376b4b78367a775148706e6a6e442d4e6179665258624976646276696b736c42364c616a6d4978427653306e4c5238736a796b3074656b305366366b726a383836374a5f59656d3461304e6b744c6d355838324f6b586631457332756e6e4f546f5a5a6f64595833304b7250516f34666e72307a73474f79566c4a5366366969376f4a6f325753555f7a4d5a4f425371455969455035627266584650387350704a624f417072414957555658616e4e5858464a5967494f30433258466a76773857537347677a44744c4c366b706c6f6246414a3770386748356f526b79325662553476345f714a54773163726648387a5133465f792d4369316d5f52796d5453556353566d7056715075667147527a2d52513457317a454f4f6c63666c3549304c6b5546704f39347176677a6335636d79776b4f7a5264426e5f6b78624f5f674232314b6b5176576c42357a544338743876446c5a474a53376f444773754272797635746a546c6779597a7639356b4b365973344e5639536c597a5567324c5758624a6c6a744868415843336e36303479347a394a4b686e6652496f767a6970524d454c62615a686e5a754e514a59384138536b684739764e5571615a474e4e476e704d5452566554656e495f474f66725f5a4163446a4c723845385464437770336c335062324265574948465563492d34305068524254544a76444b733935637576545635644b532d4e686c4b2d367078314f485f666c783761343164674f6c4e3443325259716731476d505a565971506d6d58366c465f33574a59366e32656d336f7934325f44354848445a41544f4833754139562d3249445a64726f30566f536d766b576e4d664344474e377747557551314d5a6b47683761493151504d6b3778435a4a48666c79546651514e797074304e644f686c476d36506f5432417649576c6970484d385f6c796476754832596a76416b4e633871656e59526934496d6b6e467a6e5f4745795744494b6d534e636944795133335653524b46463346536f6457377834763933302d325735596e48774c485a714f485a64326a7654432d6f54726570757050506c61307a5832656a447045733268694f5048626a726231575539375f32737362693355454a2d453065657149796372746e754d6331564e6a306c5a6154754770656833735735674b6d4c2d4c4c6841514e43586c7574676f4536336e626b6f33427939695938484a4c455f705a3332593253456b6e384d6e7573794665644e3544384b42514d422d4b326b6874446d2d454d4d5846326d5f4a4c427536785171556149395447455f32486d59316d736266514f7543654869333272336f4941747375437a45745634326332674a42624f44546a35773255307356635f515363365169503636514a6744453945426d364141494c6e76773768434668564654543131526f494a49764c716b53567a67644473676d54666a6e4875636746514c6473493177695855673556726148426d416c5a39586767644b3479774e446f514455326d6f6f38345f342d4c53674e3437544d6876394a695247357051372d6a4e366b5256454855652d4b5965626d4a494854483245766e4867794562337266365846383636396354754765744145364138796d517562524670615a6355713955396841514c73647a32763268434f6d465865615a446930625866644657676f71477a6e496d43716c3554786734666d53336b4c5441394f4255526c5f3751716f386a6d354264365236434f667041376f357a557549317978443541656a4e32585f4641464e63496f5243494b4a35723544315a59386d5730437a795776304e55477453765a55474e5350797256434e354c6d67332d63596175737168454f62485a75504a4f79755552473676344736354543454d46376841396a5051457138674f7675434d41706d674475784b6179363370774f566b57476d527a6e2d3436624264374545744e59514d4c6a492d615332684c6e304e5336626a4d6639477a72566954684179304d73456851646b5453493842732d2d305f38417a2d4f49334c5f362d5078726e5950336754524753793571656c7044306c4f7270467044724c766a3131785462686d4c744854706438625868705a4842566b757a665f5637584b5143345442496b62656e525f78744559576d68487179635851387842624862784a4b54755a46724d346f444230666f6d763646764466386365326830794d7342754772774f3951557a4f512d69425a4668345430504e776376366e595a3571654d71386f393776614578726755575838304e517a5336543967643238316a47784a50325474304e4c3239304e346479673642796c6f487451766e74333737365162547273657766415759746e6c4752674e6a7a32443044786d37346848396365546b616f5a35514c5451346556422d3850414e472d4269467956586f49423970464e3950417979324332746d484a6a363835656c665066705f524c67485f437344376f6b65765252536e58706f51646a6a68496a396f667170357934396953774944326f743833766b5543337a69597a4e31714d6b486e795a356c4950547268347857615362564d71496c6e69784b6b5871547356526c46462d59554e455a45484951705157756c734c79306555696a3353374b676c4c3738744947792d5f7a5a5f46647978697568692d6a5774494d4938796a5a796a51704c7a5f50573570347866566e787066576477653242786a6b763358626748716e3439377335455563616458657a484f6f6b57776e5371366b5f7962484f437a694846494d6e5a6269516f6875354c4a41744d35505f733070784e66626152574d6c556f786753417454644c6f72312d77716c41434f7a484c754f786f664649456f6e362d516a7a74555574355630762d70345a335479634f36694b355f4862553044765450314d54565f69556e69364d5f5f332d33627a7744324e66706c7171664f5361313655586a4d7556395f674d6d51456d4b72673243714b535361415265336a724363787251556d6e4f66),
('2vl5e0ltsaqf0q7am3ltgjtegt0ahabs', '162.158.178.48', 1586670248, 0x307161686a425177746a66516c717a556570304950356c41566d7651746454786d41644a5754684c46336b6444314654444b39656237386f6752465f7066304f31574c6c6867466e466c42587163353158576f4c715943707146757a6e634470416d6e4c374c746d76753355753848704f3878366c36495141644b776e4d5768326e5a4777463839614d37756a6a396671722d614a4b6a31504c6948326e3335796d6472675048717839366c316a46757245523558586c61656c756146654364345a6b323045306c772d6a33754f6b45424662727947514f51396c4a3237777553533966375a595f4b755149796272567a4d5451467a5877474a61792d593177544e6443655468313571384a6c5334356f7a735545353971344349696d6f6f5054396e5146574277422d4d7246524d6955446652436e5837704c5076456250792d7955556d65437a627a58755852386367776f6a6272713532774769415739626c5a54616d52525556684a7637444b34797130704130335a5159702d37753771347375744b35363642476c37343574347a4d65414352644f4371384579464f49795f536b52546f41576170737648356b47763571544b306a587038516e35684e494a7a615958373066324f30546d674d5147666c4a304c657a656e667630446d634d57473872695272306f4c574c6b773333504c443351384b5776575630326567584b51516448644b5a78727a6355565972583162356d45467378664d644d306a71395250636866686f6e30695a6a6b424e37796671305a7a71307863434f5879786d516f49624668397139526f62747555745f46704d4b5a6e566177695278354d595646664c595064384855784b586e493033543148384b6f576d36524d5f5f696d3468566a4b7632776731315930546549794176514452427657626764415738466a6d4d436d39326436677172462d2d5f42474b6d466d734d657451696b732d67715a57686c797834507a324e736f717a3236526169593235496e6d6a6f68647a77666838567334377657665f6979534568575a4f51554842513465784c7336706248736c7a59674337426a54416678426a47696c32686941307778516767724855412d4369666b576d46685668443138454a647843384e6a6e42524e6b7a49766a505f496c6b5875594435476c4c484975657044654f6d6e4539493867414a436d4466596c36364f77434f4b4f346e5a4f61444f4b54506963495965785f51554a456e5065725979504e787a6f55354d754c696c33393651503633573776666438467961325870746e364d414e57703961695466626c4565325978433357676c734130385049746b674f57716e65564163755f7a6a5f516f373844417a6a7970433073506b4244586549367232564b463052793136306362513168497672676863444b396b496367534e486136722d724874555a6e506333394a53756c4e3750516934474b53364267335476346567483448415a466e4f384975437a2d35746a4f70307470446c77366f70746a35575a5a615a6a67446f33436c4b45652d5f646c76614f646d626155474f7972755765734450564552387a4e64646b794838725f304d58627446436f6345714743757179445242674c6b7363535935516b797371315a646b2d49317a434b486c545856527a495378636a30435868644230742d33705665414f5379754c3263304b657a7657506a6853675642416264535f51387738734b5557564c702d3962587a335f586c572d555257426b743051746d58547944534e6e70334c745242366f645579354647496c6c4e6d725a4a7261714c42416e7765754370647334476262775966632d676d596e6e4b617a77696e31636276377a334f302d6c492d42432d49716b303050784435324b6457576a5630415a4644337a736a77654b47465f554d4e345347467364447567572d57396f6e6a6f587a424f4141477a556b4c346d535239787146386a385f50493859485a4279552d455a444a696e744a5242544654566133783347787a375a476a4e514a37676c59316564716d53694d564733755757306d3131376650785f50356e456d414b5a534f435374704d6a52774770316b625f627344544e61694a54574356637a43746c513053672d697a304933343550473863314f743959636b4a7a6756444a6c44746a54594f6c304c73666163596176446d5163444668747a50304937494f4347795570453466644c5a4e71694d50644764757554304276507a4745456c434f70335f4c7667746e4847744e7177375a6273693451513644545563675a584c485a6335727556316d5f6442643530533435746974736563323374577779414d4e73755f4e7a736945325a35785a7779764d486d36715a52503550506d636c4a4c7964574137315558664b68576a5939706831634868596f72303155596868695678413262504e533068542d4135726f534175564c506557617949795751766a7a4247436e61684d43756a4a72676d77636c617870346c65486274454c575732594b6e5367584852775150694730384147723932486d706c4c316a324a7741416c765a4b636b7648334d32727a5f6337337567626b5a6741793931734265474673566731705956663961356a7864386532636d435f53336b557049614c5969724b72746a796c655a505a31394f3249755a705a6444496a44717a71525f69574a4e4d6d3573514a665f5f78334d6161774c39345f587964644768476c55625142677a635766454c736a656136745547773950466646343768436e39545441753656316153655772414d4e5f73315a594556575150374f73384c35744459424a42544f6e536a634c6c772d6f4f323765784a42396a43612d4b794d4a4d777344387a5a5f734e38535f356e6141526a77476164644f6c323851306c4d4e47487378436b7177625a5f74565867633646576e6949722d47724e5239546b695a78667749374a6b714773635448375f4b55664f4e5f416b3036665675477177704576454f71594a78724d4c636446346546444139714d7154566b6f4642624a51674b656d77416133507645474b6f71704e68556f4e614a2d744d5a4e534f68557435325a754267556d643131743248387673566430586a424c575a4f716a5f67575934586447393575585154354d4339775269736d7a73595f4b6b4a38344378746f583146436f6c39466b4b3475647255556f47344e594d676e4b54414a435f43715f775637585f536e56715f6273735f677169334e74615a5034534e36646943716a79656431453374766a4751525f4d6a4a474650674e59783830333145626e4c735449384738544577734c5f3835314e4b5761324d5a5f68454572526c4e7050676e6f3432687074584c5358374b5565467943793534434e3454466d4d33647276313141703661696f67442d6b39446c5a4778324c774a316c7466766e74637149747a4a4b584e534779633468654d526a694377455a3072314e3850616852684b4f6d59474778624f305864707572306b71534864394c35397a616d63506c5479374179793163314559546f38567a6d356b4e675934596475366d3853557a66725439317947594d68634e4168356f59687154396d2d517776555676464c676e50667352422d66675f42436239325771574647676274687a5f5f6e4149314f45714a5753734d4e4572556f4a366f5a4c626f5a527936485341716b6c353637566c325548544e776968397055796c6e795244743864726e752d62412d336b334e5063703774564177626a435a7a63656761644c68706748376c4e357a424f6759346e6b736a75786b54453847485457666c7645464966753931536a4467484573484e3833737054555a354d7233673078626f786c505f4443536d4e414b6262717461344b48664873754532453257764e566456513633743933573175496f6162486144676f48616138716936473133464e4869356c707434505a4a594a447242463933494f51516162504e446a746d5f332d39643759716972524551536d573134436c63536d69364a504257536f673636417649695a555644574775336e3436335a4876337061677365366b72386f5378675761704e4c6e71334b6e304e47326e6d7851677a79376845377346703135363838437653585f58744965546b5f784e4c54524e2d4d633239526b3153423939386976547970456562564f7a42553257337031685462785248674842744b463153746e526a6e426967533452774c734b5f662d36434a3171446e5135305a72445a58775754594a63594a3144596e5851756d7242646a553874576a48565f46477834756f755970433156516c33787a6f485a72574362734244422d76566c534c4e33742d6a5143626f73624662503053434f564e5074336d584663616c3979564c6937644672554c3176366c50514b53307249665676454b5870314d45674b38513552776935664f4776416938687368544c5f2d4d3165504c6c733873466e34424464596348354749674b446777384874454e417373663855463368436a417a4a466b70502d3342556242583030334530594f3073644936434f412d6d5245424c6b70333159656e6d44676958576b78576d6f47762d6c6a435548314a3869362d6638463630416a6d554b67464432376264643665553768775850434248466e4a5957587236665a58547474685a35775a7253675370524173575a2d453941475a653372707139466b68784e5468585a7670674a2d35476b356a5a37356a676a36305044694c7458686f3371764f694577316445365845663870785345484e4a792d744c57326461305643524559746259566e756432746b6d55385a6576732d4d337048677a324d3136425266435a74326e4145354859615856457a7754576d4737355950595844354b7038787162344a45325974552d55565a38764c362d54706e6d695271705455515f3765535563526a7375445471644f4e497358583449335235567a62314c583747394b57516a6b4469793164344d5073456442734e2d43364f724a624c34334c6671666f52716e786277437a4b432d763343446270512d4a4f32715033455f4d46724a723837356b4b5341626162735a4d7541786175325065717533794a366d564a5470786830377839654268794f4f694b6357457179776a6b4862625352535166386162577536353449743634466645515a4a414b68724f56345f3646706e363931485f306375684153625276656f434c4d54534e47346b486556585475364e76494956346138796146475f6368505854384c39475f775152665f687776714441766845795a5648497a67594c594358566f4d3573316d6151337770585a6e6c79494c796332596d7a6d766669357458356743346342716162505f63516834374b693168427939734e366632797449525f415a556d7a467a5142354d5763574f4d73365473776736333364414e51466d48626b364f624e4f727442524276536248742d33716a682d6e2d4633474a73396a597451324f2d654e68686f68477976366e436e78774f4b6f616b3144546f743250584261744a7a43656c35326935526e6a4d7a797952325576484164426c4f747030695455773546582d3877466b48596259455a4174536f7a49724c4d545637466f4949383258664532693236377137464c5a68625f71454a442d454a71526b465037587157343141375849457630333253654149567237494332586f5234383648563747565f337553435156355638784a6f6e5a49536774553958534b796b6c44586279546172647a2d6a553845316531345242346b6b455633766f585046414c484841562d726f324248646164586430684742594c503341306377434a6a5665305179504946774d5f4b41787a397a74386c5f7947434662374b4e416b68736e622d7679464c66346f6b7272347558686345373630642d746d316268316e785473667a4a763130782d623339424732626851714d334d524e6546755f3738787939556c7266536b5664363051306339386e3876304975344a37796e61765a4f324d66463533776a7a633453513765716f545649744344324167794136573369716f507a45426359376f6f7647767830464636547063695a6e364f556d2d465a76427a6446786957545745446163773958675276533030386c32524552504e6c555a4549664d6241676e446a4f3743554c594f754b4544325143576a41666a78346c373549735f35374e727978726d62577135492d61575631733757307564464456345967684c776544553158534766674259544449587053665f6b71434e6a554d726a3453636854393364694862496b45505173454d644a4733356f766b345a773153485933633154587457785a4578684457446a5f744d7171637846544c546c69317973475339644659504f45486847666e6933756634314841356348694c5971386b596469684f393468495a725670396c7845714c6f4a7035446d2d6f344f7279703656742d317a31714f4534546a2d344971574d5649314a444c5470384c6f377773797a4a31567455587645715675537644727963524651444d5a43776a66314d4677675750334b6e6f544843554731506544304c713035687273535a524552666759354535653970436d6e72717a4a3352585638375739636e4a6b5a36566a454a364578577570755752714139535363327031366f36585035526879616d75776d45477a71694e4f735278502d74723561794a7038645a675a544f5058454d4e6d6b42366d4b354437505f6b6d796f65535963614d4e67364837464e3643497a7478614b4d47305347347150727556796b6d577945755752715849324d5043313130707a51797564345941432d715a5f6a395452556274486a41545054655762665a554969704a41715079704a75685367717769434d5a336864416b533176774264416d356538644f4832427064616f503765585a6372414330696d6d6267356f6956466370545f494f394b33467a32436251766d6f7561663843374d69657a63456778566d544d4c685a3449664d746c527a435974564550784e5970436a7146433251365a55704c5f33496778754a5741465136624c68503664755f6e306d756f483247506a316f68684b6d6b3037375730634862776e704479565537677a4e354a79445f772d704738652d4d476f58412d6e764f4d464139583546634e4877554e435179756a4e4d6144394d656a535f646d3279573048657846794e7a6a5254734e74747a6364306648394555526f53576539544472675032506957613833667733396354656e4564387a56716650525a676149496d4469767257346e482d424e71357a6c525572746b5156715244555f4f636973564f7271483554576a6e7131706450486e77536c426432625442516663784e44516875683266667145723654774f377a5252506e6371795747397a66766a394f615a576f6e4b6e443846384c736e6d436d617749456d7245706c41783148526c337634766737635a78586a7867377979464a4e4c595654496939325f366436316a496b4735513572337776747532635f5a557861644d2d4c4356337872724535413137785837516a7a714a55305f51774d47594c684368625461364a75793565327838704d33776648736166656d6c6d5239626e514f4843653433466f524d4d34367531634f6448572d45766b4e7a4a61543357484b6f304b57645a5f4f4e6f5959394772776478347a66546b38344c656c3556467636494f6e4651664853416272354d5945442d58565679337a6368795f4f4f5552524c763973727a775137744856665932314138496968356c3745473658314b74465044664d665467627a4e6750355a543255726b79564272674955774650716a),
('n89mroeiqm5j9qcnbo97gef4ve62nd1h', '172.68.255.11', 1586670084, 0x3733424c69416e4c79366a444e76524f664c6a71654b435654726e524a3039364d4339665436624178346a48726f674446527a48716d6f4346766a66374574426a53693531794e753878566d6e764264366c31503463546e626b704847497346517a634c387a72694c5f527559394e497759444a596c615165345568796e353343425a4c705875427265314942394e7768304758775756707a3658714e5633336c44376b3844395868596937703143476546547a32614847392d7a50544d4374336e6f4d674c32517036734a35386f714e524e6831364a574f463866413932364a44354358505373535372307a676d7773484a663652636843524f434154727765416d64463648646c4157344941614b4342587955463233753549696e337761653268357253316a4f4e37396862346438737043444833346c6e33796d5179685a686e69644a476d5076677062454242316a77567232746a716c714b4e61584267457355675448704835494745395f446459706f4d3361616942746f7679506c324667547a44503455663337496a476669636d776d6c53597a67725f666c64775f754e3674427453716f38774b396276416f58316c3555396b7042672d5951794a526b39794373597865446b6f755a764936524e4d50696744314a5374524d697a7749517664336b326e64617868326168516b4d54596857336c764e6b435176444b6464564c354c384141496570596877716a4e4f2d676d73516143756f763467396e4b51517476645f664a64735331675767556e456b6d534838732d616a4e4b6e3432755a564b6b5479623279786c6a6f4d7a544c4c57534576707466785247302d457379624a596f64323650756763546b775a54496c71376b6c57464a4b793358437857684d4d646256466553596c7659622d7a7833716c4b4b535f35355a3668536a587939622d75655f6c446531563553633948624c6d2d4861384951754266724b4c5771746878492d395f3175686f756f5055313938713375572d7a727764306a2d526a594877697165794877535946516865426a396f613635364e43545373346a2d5f7a43466854727a4342786833796c4c44566c4e734f6a4c35514b57673848496d78424e727830673338587963506c52326e484533526478515a54783574784639575364526d70314273417356785939435353776b31674c5a31674d6d7076394a776867694c6e4861684c345f6656755648783467716b465a6c35476e49395f4534366a4d7375564d6973444f6958705f3134755437326c4531634c684e615f487a5a673037664a426a724c364d306e58686b715a704a43564b76473244674d31594365725977642d736f526869645051504b4647666f30586e66516a314e30557850764c31495a3751374433647966654d56666e5265464353354f5f692d414b56695266326c44524249694e4f73676568714278795f316644635233785164344661546668514157526b4c7874524f42684f3568704a584f6642474563427950475173493165446b4d6655644d77705568366f325752396951456f594c3162706c486b52435365324a6f4c72744e46756438657a576171692d5066732d454744657864346c4778535f796c6c6858425a6e6d4a304435773064556f7764734e6c45485550565063726d446d6b5346774e716255492d694542377755387a46387a46467748546a474b66446c426e6751547432674f5331705266324b6c53436a33584551796b464b427437304d4b5a62664839545578537a664536374a63636a6a696a4d6a6e79546c4370696b5554386748644e67747841574363597643543457537975516e775348316b7249476b4e43794c4b70564f5a57726b5f794f7a516a524d4f433658624f61555f302d737154737638444a79784a3146314e6d6135545631524c3759395f474f2d7671774c426e337550646b6a586f55705f6757306c52354c525059397846736c36526d6564574379356f543069517a316e4f777a5939557444374d4a575f574e444439485167424e396c4937354f6a706c6e756f345138506169632d61514b5943436c6930515277524a66302d7333635a37594276485f57544e6d786145744f6e79557a5248626557574b665441497661484a4964697a456339496e51396b725961786d30465370724f72527a344d637a6f2d44556149734f32323961645f502d73676b7851524b43625967486d2d6b71356e3249396b78792d597a6959773950556f4d4e79706c526276376d64785555394856317149676b3075774262727a566a4244662d4a484b737a6a346c59386c7579496c4c4e6871796641464a4f6c4a46795052704664627a304e4a6b764c35486d3036434a3654373157306c4936505a3959505f656f4d4a6d666e51634f777a42476762657a584b5a4952714a617a3438714366326a675f4d5365413957494e55566c79523765786b526c37752d4c504d5a54664b456b433550437a65636d7a53623179454973307573716a654b74773534416735314b6f716e697858656d6748674b51766332514c7a384b4e377563465436772d515a767a6b4f44663631766e54534e4e46396771695353576f7a66567178727973626348345a633368314d706659366737452d785a74356b6964676241556262754f584156385848557179505956427833586c593467546b313741645772533372552d5267393145575642744a42694f3946774948457336637134432d765074592d4543346133423550675555526b4a595733467161506769765768385a5839456730536c747a6e74345157706b6b345f6874697972797077797a527a63306f713359656f346b356e6454506c77386e67766967343435796258466b6b5f70494c4d61774657655f367750633731504d6476474b6379564834786e306c32566d6664694d4e642d446951444d4f466f35507448475162516535486549576e4d566f445763344a6c4b6179745f306d6247585135616156784e384478794231453162547976754d7a4942617773416c59674151616d6948445a49315673624f6c3170745a67354b30695a48696932695f624e523172556f796836494f6b627a4936424e5f667a55487434667261476a394f7135457762493954314a3544534c49736c6854336a776b325759734e516a6a474d663736336f394e7a533371553074475f79424e6d486e38756e5242642d52496e56567044394c5259616b64375830344a45744855634a6670536f5a677a48493557724742586d7642776276774e4d386534503863764f32636d6f714f496d6d784250497047575444364a314a634f47707567782d323833304e50725157715f5f4453483131314830737a63686a4f646f6247467935453861493230346a374d6254444d36796a50654d7557704a412d754d43513068644a3330655366425f75546452705965456d6e68776d745342714a7031363572614a4c466a4f566c65396d524d6150366b5a4b30494351464f735f4f5835304a74596245344c3371726768584b376d6256715a7a506b43306732772d6a2d71525a4c6e7173662d5263376c486931364c36716d3234596f485f627047414b747a416d6a7570504b5634533562354e79623347617379766a4e51594752776d72434e4e30487947426e435674337362746c7562304858455a314554465f4868727a61304368613334633035343476444745566b635739636531706e4b4f33774a62664f455570396467545734345361395a6a496a33506b6f684d50712d41696c48363045306e684e5659776566656c6d4b44415f567a33464c58675a79456e36746e3641322d39597a7a3952445842754a7a6472614f6a3646424b44484a6833446b46674c6c4b5a705a354e457248523970466a307275746e3862366a463570717835646c5f69386f744a634c7839346967726c6859726879385a57484b4a4d3178794850387a7a754a494b6e636436397050526e626e4d48556877535766726e4a4145425f6d3635765938683577546743506a304f73775876516a5a31444870524a433158597252315f6e77733936496c424354467a486b4549452d65456f746b756a424659345f426278574e35786a3137566a575366454958692d614d306470395666304e35514d79714b3769303265377a30564b4b5461744a314a6a357561374f4d3742754a33585451337144663765676c41636f375858714e6569496d504363656c33356b5a6f646c483873725467486c6f78416f55796d596743354f7253386d63624770486e69475f395237367768444955416b6d30357079684167675078573051734d35634f5230686f50694f696273704c334f6b684858614d5541434533754d31657844476c57565866545f71434167746c534451474c436f5f384c6668673964484f6a794a5a566a487a74766f6a5f7a3455706a39357158784a44344a5a75424245753442314958756f366c5431686f4e776b557a443771477965724745327a6a46445f5255584967546a546b634f72656573456a44766265344e305a4c7831554955657a667551365f4f79416646337364494d4b68484c6679327a7949485171463952314535303774654830766a744641345f6d642d656d6d73355657785f52734163675366485f4f4f714e574332336b42376e6853324f595733577531504467714c71776b6957513936426465723776392d667743454331745773706d546672634f524d424e725532517155556450454977324c6f565458554c77754c6d667530705a6d574e464438426c393432767349495254387270386149476973753277324f6672746c345035567945624e5f5742726e3034424d4843656e4e72313747315961494a70513761734f474e4b50624272374f6970624b6e43516555536a64334c413142594844764f4637565f6b4b3948627668426c746b52593735365365677165336f57734650614468674f5650495a414f66364e496c5a7654775033595639475f545f4a475844646c7a657251596f5753306669336e6e7a424e41685663794b5074384e6c445a5f6b63425f59722d744a6b394a62456e4a4d30626443746b584a5049696b4f7a4c7753666f5548566941635a51307163694848754570575835765145345239364567594b524c2d6f73516a486863664271326c41694d38645f565f5a63756852585a56376a4852546b6b5f574e364e4c426f357138544735615349694265325a4f6c4f4b7a6436666e4670426c2d364c643676375839796d676359776735746d7731474f6d453650347a6c6e34526764484e6774653533763174524a75614c4f38435f58334c5073785f4e5665715379635949662d4f487243737a51355a623977676248474141446d7532356551622d2d7165754779345f7356703247376d32444c42306974437a4c3779594e596579516b466f636241364c5130333231647735395872394c2d707a5959577a33617933653138363346704c55715534595a3071754f6b4a4e766f416533486a6f345f584c695a355f565f675f534c52493671505f5944797a3439346c653453597874736757666d6c416e6e697148704533756e353842393453456c5177374c4336707278677566735f6b796b7247536b477a624c4a363268586b69514f797155764555567a36645753785f6a496747794f7070545f6c617874684f316e534349615f576549514a466c6a2d316538665f7a6636795a433432624376567565344557753052633435344c32734f6962584d744b35396a7531525835684c7663357150366c3661683763726430594874746e4846617a344d68325a73326d78667976337339766d443349446252354f4c522d2d3041654f565738466d7178534732537175434c326a3632562d7276575f566c726f7547724e4b4f5a51506b7165374e484876614d6c7861667679664a77775856674f3764584e456d33746631683038764f32666f5875424267644e547550586f334a78365a5378566d5741327149424a7a464645626d3061614569716e725f655458565a434f4b704a514c69324979494f3056346477436d38337259493234596f754b65586972705671314174665164465268414c4e7a4664766a6e7a574b43495056334761313238526f4a356a687772363241504738587a2d525455757a6f7548424d6e76624a416e554c614c494b32676e786c526a65526a79747876554b676e6c4e384b41547178454d416f79437135467546593870305a624235646e684a30437a3873653263476339534d524c684f4a676f6558707345583062563354695372397632316b7279634a4c5f4f62376770714277694371626d6c51645f5553724778496843306c486a62417473704d566c2d4b7642473832793378475a726155533379477372546c525558752d586a2d756e36373257686e62526975444448524f717768644e6b585065796a325a4c722d724a4e32494c43536c3661464e63543351516d52527433314635344d3876474459634c557136444a3941616274614c75786976436f75793455713753512d58634d306d76546b445249616e555763556a69326c746e336b346953695077656c425655666249597a6e6853735245616a41414b534b62725375397056395744533362355342336a6d46636869596169476e5074394446456c3934727147574b494231776e7a6539585863415254476c7944457a322d2d39317239774d42644e67692d4a542d634674725064497a44334d346a736b3142505a616347786d576e4e6569625f347a63344844566462585150394d7831364367736d7348506f474e556947597048356b516d54624e676837634d77706945537843325647634b6b6659454b6d6d466d50414247506a4543326a575463596e76333356645467682d4870467a586f7a464b6337685042573754496a71374b67656676356c322d6333466c46557047646f3233456c754258465957726f524e3448574f415974694e644d5555567630576f486f2d4467635671774f6e6f644b6d6a4d4c6d337435745a457a32786b554e764b456b68506e523039776235547668717658755f703050584e78475f574d726d4d50566d506479692d32505a79376e5f47516a5576495469786555426b344b533873597138454b73682d6f75736870753850684a566c4c336e664e6741396c56424a755f65726e6e544b4d46516573643232716c67435a4e354c7663716e2d685854394d734f77765f4654687158554451495363384d637753365269465037515057423557513752734e77425a683668445641667044622d752d49697a7053756e545742554f376b6a62597963414d7679726b3633734f4c36536c686e476d4557585a34336d454b464978556149354541573144364c33365371444c6c702d51575142455178683536383150783258356238625a4864734b795a63414f3047367a4d314c524c72346a764f5f4f74367575594948676c7476486d65465453754d38486757426268734c505137727a4e507274356f387631657973794f5839686377744c36434e7675726e304b722d4d424158464a336177417053667573585735676743746d4c5a786a385951347479787370675f72633851494b305973724969794f7839474d376f326d6274424678735f553732613235416261515338357464615a6c6f554b51676d476d397474322d58784131764846744e6a4c517a68384873365950376649512d576d75754c35786a43766936695178756f517561392d5f5f374e304e37786a7276476e4a55353534754931576b3358686e6c59774d3171583349376f416763354c377339567a69506666775949595374734b52675666366c4e6454732d755843536f345f597832445236562d7976444b7261734c556d597378485652614673576b555868656e4c6f63726c4452);
INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('7ep43lo5qp4deo3ft2ih7rpo93qjt8fi', '172.68.254.93', 1586670134, 0x4130324b4a39495a396b69356b315f344c535738336c476c63415676705742375168736c786174762d6d51576f48486e624a683438625f3177763463706847517742543434486543326f70757748676159416d45577846615f55525256354d65734f4251624e4c7557583136685635552d3166525f676441656767596b4c484d534c50765553654d555678617055497a356c616e4e52756e3773326543794779706e565a49326e4d74323065784c58482d6231594b2d50374e6467724a743267534d5268635853527652576e44686c7a46746e3256346f487a6d693242746667704f486653384b6d716c70484e34752d5978793375516257444d3538565369753271434e52376c54493348384d52306b6d7273385237304449506a6d66423343433832554b35644f3752636a2d79466532744c52574f566e6e68336b73443342674b305932514b6e36333871424f555576476777696a65575f5f7139556558745f6d3062306e724e6435553450704d537471343076586f4e7a44704d3948592d647563683542784a71445f7062684c357838375251797961777a5a424d6f416e61726a6c305674486334326b765a316e66556448636a6d596757366e4f556a736e3061595f66666b326c35724d487244412d395951744d32627554717879737650724637767a6b766c4c382d50494d486e6264686171425a5453323357614e5a64694d6f68594e4a63744a704c6c3663545737447a6e4e4b355859504a4256383663434f54744c6e707944526e367845784667734a3276796d646f6f6658354948747a3649595836537941316f4f72446e426f782d6f6256765735736845416d746377693065635744316d7369326770644d574e36355a53625639336445746a6b42744a34625f4d7074764855754f6355355077502d376f416e3965424d72476f4661324b6d4d50686a74685f3151696a4f654a4f5476736330386761354d574c3979387232684d3735416a52702d793742693079385f352d2d42564449725031385f6d563648317071325462394c4e694b596e4e6e5841514172667766766c4f736f586f6e4b6139565752446630615a70494d4e4c72547063484c4d30733373326b51596e5a447a414152697a4a6d63476344656177685a4a2d67342d42392d354570335f6c6f73766c2d444d614572486f4f2d5444366977415f353952413447394971497752326b4332384f536f6451544b33456b50347757595f78765f456e537668694c4c337945636c3252647a444b66367279734c3161785356787847547a394b71685143464962654b6565705163306a6c6b3130566c534d794254657a6f79347a6e656e56556859334b49744a516b4767754e706c38477369637a2d423032794259726670466c3866683057425046656e4856384e465a6b6466616b5a31346f374776502d2d43534b457470366b596756475373516258506b6a4178746d6647584d614177645150484e3156454b7936766e39414a2d7a4638523553564268646a61394e5952444d536a5f7256334655335f7442635656775147376e773443366e525352495f444d41715f6d37693469463247776e756b584a4a6147516e5863624a4342393758633069587757675242664d7a546f594a504132334766463679654b6c707a3258323579436943527474435230516f71705941666b49557036656778545a43487232335267334b3569535a652d5530754153325665357947735767707259574841796a494b57393461416334467753655a5635534e4f30462d58694a416858504f6f59546644386f6d42454962634978696637504b5f473330673966477135566d493761787145685f6d61755359455255347930697a354c624b2d68634870683075724b77685637356a6c34464e6b44553678665041536f57634a314650592d35657a556c524f54784271554c787253303832306e6f4c2d54345171525453762d56744d744a35434171766d56627634545964543357514a704a696c4d6f4b54747a4b55586d5a6159634d32595167712d644f4e35335346545930473246467248395f4732545045655772717379556977617546524c577a2d486c76687546395f396179636144415244465a4c72726e524c5a475357337653386a43583376746274345864416652713850345366647a666877714d4f684c4c7464764867576756434a75467a387856526858384f6d4a493032624d6677366b5561552d66587162326d4441764d2d6e3976724e777842664c754d5f4241437143345a7471495937433079685f4b6b36695a6e6f767261654446616b56776c637472645973363152386f6c65334a2d4e79317446796d306a337549493332374b52374f723261386e3065756d72635f685536326b366571745f786e2d7a704e77476565655a426f6d663667756a6d794338304e4f57586d6c67387659346f623877676670387a5a6c4935344239653264664d566d6b4f46523276383535594e495459776c444a5949775f4b6246674b56724e4f79444a666f4562394438425f646570526b396b68345745456372365465556469554637734b6932664e4d63686c6e305a62676a566761683366673639796d617356304e55303247386c7958344d49704b58693570546b494933696d4c73304b55423655554c366170476b2d71567375337649666d495f694f73564c7252557546436655387252344a4c774b6e4e69797a4a4f745f75787a505972563342584957784542373464526e757576322d6f535975343279506932584679534b3138494544455468494e56504e50624232394c484a5a43324f4d3232324572534b346b557959616f463748473078456f57427057777a6a49456d7a5f72796c2d7a713166465253517863486a52567574314749456876475830616a635447394c7443332d3073766b715846794b474d4478634a7075774273514d5f474f416e57433032755669593635316f752d5f686c382d794c536c44694e4d76577a4a307747306f786a32425551515a596c30354478624f6b373479314b4e4242336e676976746f4b5365696d56337736384f39374e7837425853326e67726d6a6d53446b7251536c4f5756554c48387633366453592d7a43344f744839384b636a594763463838486835626266392d54433464316c37375743446a4e5743613442417762685f5a4178615a346d6d50396e454f42707136537368656375304c33625a71394439617230705f61737435616d6c4b64424d533252696642746c68613467744e6379527854664a34723079642d44576f336a3549703165346f744d44745877446454532d6d4466373550454270526b4551455274527353354e692d736d4f6c47384f6c6a5037574a52615330644a4b72626a466f6a62696574587562346377365779456d654a42746b59716c715f586b437258586c54315a654c65784c744171656f414d61326737323869572d6149715f4951354c4f516775394765306e395f336c375134614a4878384f44456f48464b6e304e395f4873774e7a51474b557765623953744e54632d346552474d786f49506f39725a66783252444f6137766a43744644776c694d775f756d757167414534702d6c70365869594d4a36776a762d464d6344766a7a33527376335a316a344d357849714a5450504e587154534b4874535252616c324c6f5f795a334d6647462d35697a595f6e376b7a63324566684776464231516a6b7a78436672704c496149704944686254746933354348324c46396e3653614b3337394f645a67633965553550514d5339693455545f4276656f697964796969565f2d346443374375636863616656675367457935316a5a70534c55387a534c64776e324b3071616e4b687637434c75775737433368546b7952425a6e48624537375f664b333834656a613950397a66476c6548374b587736704d4c734838664770453347633162596f356756596838634932387850506f703547636d44684f707152504d787061444e7a38704f725236736d78366f396d58695a73385f4d34535748435037586545396e79774950665a664b74647235595f786f66507450747a68585675397454615a77533369656a6c6632345777785a6f674a4f584c3033757a5433505641416e30376535473570715a5941595f4746596b4a4953385150456156487077533578624163705635616d78304e7a724666653541375042665f5671764744782d6358427a75424a395473734a6845504b62664f3570766737386d4a6439662d3335524365543945337459774c6c484f66794f73654554395f656f2d6e4c5f79756a564570584d34517a563679424a6d4c497a6d79363867564f4f6c59754f3278485653596659336356764b4854616c38753847414845453373425446686a53366f49654262563679335f334c3471736766704d56436e67706f66744f454561474c56512d57613765465342346a377539342d50345a706f54523978314a65677a4e72476d344657694669576d7370515771593343755338503352456a584d764f44335955304b485a426665375a6e7573774d454568704d75793847564439444c78477a714d515a5a4f3672674971624e4b5f52504e686b754e655f70663838666a445a3432554b354f5455423253554b785a5f736a3841536d412d413872645675694166524f796e704935676b304367793364476e793869392d6f645a4159534e704d353956346d426778383548656a676d6a39447741536a6368766b596d774b7679574141334951594856505f694b6e3159746d5f52514c712d6d6147396753444e7070344f6d56754c6649773132374f2d6b376d41587268534f6a4b476259386532577968697441484d415a4e646d6d547a7242785a49794d513964457562533878316a58644b5571577444596c6c4b6d55506b6c6246375a57696c4c50704f4b576a4c3359505877557155704349424a48384743506d6c654e4d5f504f7a624a48705a43445a5a55766d2d7a393263696a705a53333456347165584c674d547a77667231626239382d48316e33746a467a6245647030482d644f65766e6863576547516b6b7369674e4457492d695565394843746f6e5a31456e53784e4650496d66584f465f6d51504d695a6c4e5a363445763752414c5963615f61315a484f493977355945564b7645656f5a6271613977466d444247346e6d6e744946627263566f6e56446269594573472d54575a504462716e756a764d35375f4d64395267464e7157705351574265774d4e30344732644e4c4248564b5373562d37464642687461564761477176487556314165363230693843795536334d704643697a6b397672774a6d53786269477157425342454f6550637354666641633352596a6f32394e6c2d2d304f3046363978327a326a2d5741414a6c72746a5371395359416d63746e587a4c37316c55306b47514853484c7244584e594e7667496858494734515149444f4b35574633337865636461634e4242575169665735525078394c65554a5f335a5465766d54787275322d646434716e504637706e6155794b6d7a53584533464f34476249317766524e4970783051714e796c6838434175533230546943663663676270317356772d5373366e2d506b452d67763774464733474d58456862514f566f63425654455666344d6d50595a773750566a5655344c52556b755644367451656f69394e644a735774326a4d6a6a564d4757666a334a73417558323045743069694436554478505a36484236473172353979517449364c4c72625646525a7a656c687a37334e7648357a554c31726d63497847665a75676d56665739596154476a4562767a616c7254596d385a784e623370767a4f70367176505a67323974764957525866456d725a6f495753516c4a6835466b43675a5071636832574c4455524a4974787a424e4d76685f705362626539634845545546394e4a736e57424b4c75346a5a3563546f6c664d4f5678676f3971786c63355542477176794e3159566e446374737a624f645f3751657543494c63315f58324a71673641764d6959385656497153303252446879702d50566767576c34695132524f4b4e627256494a5f424a70695f7654466c655a2d6f447a6975702d7032616937696f58626a39485834484c726c6d363277664d5251686663327174655f5534466a385938685277336156775943616c36696731305a643472505038535a62324b7a534848766971474b467035556f754754777568434b4b5446317672464a35785f394f6c553677536d30345f7066447a68564f566c6a57674f656d396e47694246665f39426c336a6a464765305a497a584c656f464f4a66557034616d4754727a6544434771416a504d3075497a665143443747794f4331492d345a454a4259755a33765f772d666c323362786d6e6e42766679445f4271597763466965396849494352612d3576577350353230656b5f6c57353539304a79387848694145586f2d70484754364e5033547273473730797639546a4d6368515273397250743141625055742d4f74796d66696b3647335579412d476f327771364e79416e352d47556d357239524d5030424c5a496b7252495a303353355f76544351554735544c4f55307a444f6864567868734977527567786f587448643548715372714f775a73307843426b456d364756646e764b47555a6378504d6362745f3763316346775278447752756a7472317241544b4a67586e6c52506465416c394237384f49715f6f6a545f4d7766394e4234492d7a474c726d745549595061696d5f4b377658353132422d39475f5337594856484d536a736535795739455071525a5a77674a315370644472383343516e6b697a374a42434f594c35686e4a7a3170764142356b5a3354674239513542575f38464d54426331704a495533726557706a747a4457516264565062626a41637852456639506d443131415a507165433654415a7559633672324a564d6d35754f4d515f55384c5077526f6d705a76786f537178695866646c5531525956327644624271622d4c545675316b505132636148644c71717353743370594e414c67714352696e766b4739664b7044466d747a7451416646697956307a7949436a5156746c4470774f6e5037484777456e644679444f744e767932795f4f7a6a724952627373526b457875667568556d47463737686f644d445468522d6b79356b656f5841716438746e78466973345a667776714676424c473753464a4d6856336c39426a72492d6547587a3950434a7a51544177553143504648356d5739374b675635777a386d46426748414a2d52435639497147467345535f7377534273493667387071383530324f393050484b323453354558486c6166746c3679386146365966585a3548586130494f34706b487950584c3778395f573877522d335335434a725f4c6a53477a4d4662775530337971644e335a48766547337372535a316e795971426b485569457565347a364f595154624832736a724c5a634d586e7879316b46784c2d655030475f6476714f756e754a6e7655376141667265506e6e32332d5642462d73597053496e6a737637456b434a62304d69327148664442466f6170794a354d59684f704a5a74515a42474943756a545849487232776e685862664c6943753466584d3957674d68786c7a624670705f396a306465566257566a4a796a5a756358734a525035),
('b0comr10kinjd8qv8uq3gdrlndjaep13', '172.69.34.129', 1587217141, 0x5559486b616758534f4a70497577797a394e4c6549424442764876636e65416b33464f384f6b644e58336c335a483146477177586c306d4271654966616e39552d4d553062515133395a56736e533062363233355766694243706f3146464631766b7635534d4153473561623336655548655771555a7653773853306c76564a38677751312d30326363644c46524f7050714879342d4c75495f34775263584d634e416936324a556c62354e7578334d654a515650434252543944785876746f6e73594866346355556433717974546b465575734c497477725653695f362d445f6d6d39414c456f786f715f4953384a3859664d31566c6d765f376e66626d552d487a3570746e6439555052774c6c646c5444556e74416246704c503857757a6d6e54566f7a7378635568335265586a70723448306c4c4f66506e78795064516673456e4530597142514f52764635786d5f45616768695356415a753651597a505a6d2d2d5f5a6c5a42594c74584e6e346c4a395464546c49703772672d375a386a4f336d7676724b6e77675956467350316d7a534a534939574c504c3542654d783232634170414c424e6e6c424c526f70774a61385670794b3464776b67336c4934734e62793976455449466e465976586f76376864716a5044347338384b4d76726b744e65663451553861626558715955636b4d6870397644494f6e6c45484e3647484a484e674b396a5f5f553172715952563833444a4937796f6e6e6561684e3369334b76574449564d4e6a6e687534626f4d6e52354864304c77697a34713153464d6534734f647862466a34644568375a657176365a6f326d5f5f6b774d62627531446b36424833337a6b55563072566b4f426a75734233715458426c6c4a6434525f306442612d46782d4d66665435342d547037426f6d5f67415031396c5642675275657039637274714565697576676c6a4c4748476e527834663473574d357049537763475f4e6f517077485068704f59634c50702d6f58756e424534423655385f7847416b3137496c596d535875764435462d4c4d442d506450464b5632466a647a6434535861687443306c304f39706835773238464f414e774f423838676176734b70686f72304453584547515347505744654e31514b4f6a37584b55456565327657624a2d5f51444f2d355243554e504a41746a57583652704d707a39587331456b557a6566434c6c2d324f594c4647564c6f5f557078666d44516b7a445568386f4f6a68685367626644592d624553393356674d77656346337237376838614d4e6b617a6766747a644863454d54677359476d3858316d635a765a575a7a6d50505f506e4d42464658702d72594a5171516c6f43676b4879555438434a54694f31696165453539552d7767777663707431773252623630544b3578436d6b5776667146376935764e4f7a575f69393938525f5634566548504235794c4e63712d50554f526c5a5935615857773469396a674675316a77575761676a5656306e73516d3339325235484d6344735f394d71706237746e4e6b73663765364f4c465031755a6f4e68644d2d5f2d3152475971674b446d6b51554b614d39746c3172785f75324e71565a384532794348477537794746704761517741396c377534706c6c6d53774d33344d323675756939695f3079374e39365f4a7a4941655571587a3864426f526a46774464635f667270626172666f7971707342504a4d4c74714e51366d376a4374544f7259666b7065564563645f427077704e55726f5f6a4c343565476b4d7763393965742d4d6b76794e53484c6a564e63564b6555344864324b586f33656b50724164413779747a525a366834346f37716f6a54494d39304569395f4843775f557341525a4d6771474e454c42594a65514c685a6970735551626c5834463947574c4d436f306d3152307978595637524c3652685948617065615478595034456f554b58795037416b5747456c51444e77345730734164434c4b6979374f3937562d514a444b394433746831334578763274736a326e4d77377a616f4a3967766c316b48426a712d7a7a6b76784c707a5850383866364d473949334a5133545869324d4f514a63356658434e745a4f6437576330516a6b6862506930636d6a50374c2d48715065354b48385561653735495155777a464d337a44617876447a6b584a774b7156795a534f7a6a525a41777963616b485a5071354d337438536635556d6a77634a71336b70706c4362714f554f32434b6a4b567759504f2d3736394d6b5f306e733237636e686168436e5f347a4834476e534c356b34445345534354336732615958434f41456c4b7a4530584e3966475655316774716e6e76526267385636414a33304d533848422d6b6a7074396e386572544b6c5344582d387a54497773766f71316752526c57793178767665716b5259512d5f30564d56425363786a316444706236524f3057395153777172473343547634385430566234486d636c6c6a347543684941664672547a6f44444c354b614f4e676562554957545675395a4470485a7848544d385654536e41516b3054565067536b706c4a38343864666e706478736c7964435153784838767a5f42756865563268686e4478676258723749735f6f6c59796238586a6971396c6c3835475149726b737658326f62454d39627375324c717549686d624a7034367132724d694146774a35567366626c5f67515755564e45714955474e4c64365a5a71727252633275426d7a356d4b7765654d4c694e727945626e57436350785f78773562777659727a5455796e5f6c7a754a56476f465966476e36323075534a362d446f534d6c504b7838726577554b6137677279736e3959754a5a643562744b355045693565776a47473957635a6b6331676e4b6338644b7654505833424a64475a33344c515a5a324f4e6f66386b394977583767637647715831774c6345556c794b7a7971594e315877303545734175464e367036354b504c565f4d7863796e74764859754a394c7064565a746f506f37536c50364e634c586a6f425f4c383371494d6761764e4f73745f4d736f38756a6854684548324953712d4b3677385a48624e5f412d424a3564546378785330375078754e6e42685552697357795a5f726e77493555646e627478645f65314375717a363431384437654646445a66746c5a3656654b665435635a734b347a414e4c5634616755452d325f713278636159436e78546c4a6c34554b39786c69367769565f5f2d534b58555458504a424261465f6b53306235327165684a4c5642594e4e447a586570743541424d6a7743374d627277686656515578353058674e67466c47425f4f5f4c53376765756f7368314f5f654d496147555f4c4a6250386d5f33656c7571466e32384c4530642d4c46397742444b2d617668376d5769655166794350557a336e795a7947474d76673458626b6259366c78446276384a634974496c6941673963787776325250336b5739425152574f434243675272372d7071565f5251383241517730637463704259614c52714f4f4d586250396c4131727a6b67557a6f666f49434f5f4c56482d594d48387a4e7a587959772d71513838696336634f7958347a3358594136507473327a3149536c636e39546b63654863344c544c566778647977534c2d75326f3830585453333462553749554b4b66486c53717075676f64675a5252454d4949524448336b6558364c794e6576553046375356576a79574d31504179556a50776562444364456b374e416a326e524178656443777264616968637179722d393077767563785a59637032457a41574752327430524e7151577453654179344835715f5969622d6479634453745459736e314c6e4a512d79707a61554a57374d4b6b4a3256634b616d615851644d6c2d4c72315963746530434e48696b577849506a48476f65786948526c376c565962577365554f5142464937475972457a635565303162372d3547556b31744d4a42636d6f7252352d76796a484733417931626d63465064576d77565452576d2d767a434d5751774433764f3463744a33584b5f30496a6a75597648484c71375a64306d686a4479622d714f474f726f47504936516e6f5a47496167636d51587a394e31562d7850577a62714c37453674414a7568735457674d4a356351414c4f4439534c395864646d4754695a3255326a754d386a6b6132507863374f4c54426d4c5a305849375a6c74684e713169537548687847646e687347586d5267384650385751505932354d6649776f775656545f4d6f43505747454b546c4e4c526f6b443130467665356841516a476442786e485a48565339477059774c5878377772474a683055527972746d7a5346735a37616c685453325868674a6c5744613767536b46763575737538496a6663416738417554356f43522d4433675871685254726c38384a31744f6a394a4a785262696d30344a465a632d74336b64665a3449436675726941394a446d76492d76367130725557446e7169434158374f453268742d7363466c445766665856596830723968484f3571424b4e53737172537156684c5662306f676d47386a72545864507a483454576b3142584a4f366434596b436362514f586764346b6137666154512d5557353679723351746f684563684f6930305a676a3778486f635a657a7a44386f666350557a726434304a736655775a4e6c546e442d5278423747456d465166335a343175736d7572487155447355554f4a564c737859537270707630736d5f70663867454e2d2d4d365761374e72763153524357444f2d615278796e34656f4a5168576654724a4c42686a574476426f4d4c39424f62426c79774c4d346939557a5a41593750774d442d7343454b525478636d705a3647796a32566346716c6d706f6655334349776243785352564a502d4b582d4851687137717359784561515f372d506337517130596c3136394c7232714e564d34766d4136776739684a7445685547656f6a6e5045476f4b574f334737383233534a6f4b4f4b55695148783332443845684658345445594666436b4c58615f6549734b7a72737072695a723132355f52766b795967784b666533686f726e73346a524852334b4b4f714d6d4b344d6f454b73496a59466737644359357a30576b496c4e5168724d30374b3976454b2d2d6b6f3939495479367741734e686d632d3953737341354a6b6e37416d6856575946644c4b5544427878545938744d70565373715636634a4a73757356646d5f736533714c31744e79614f6a6a6778494645785743725230636c7659464b78485634764c3367327967366d303944355f734251343578676f464f68754474657349514443434941336353634d52577341507a716b7247566c59454149336f6a6d4a4e43656e326c49365163664d6e65345652302d515f4a2d6e6e522d566c413356456e3759487856544e506e442d456c666f317a663176674b38655154374d696f427847665f5f756c36776d61504968356e7a4b33373745316e715f356d4e64564e496c48326330457a633264694156464f544a695667552d77674577326137694d694c575149794b546e54503747582d6a472d5f78627a4c734a3761545f7733627164384c535a3179393554785842556c4245664d6f7430386a38744f495970644762584845784a51683872786e4d6d5a68547044732d383763387645453253466642753045734e3566366a5430624a3872346f575a49366f346859686b47656a4f7a52487564504134517436506b5f394578654a4e47696d6d5331683564697a565069635773576c4c3137676367783169415541346f416934366d622d4e4f4d724255797559456d75357156516862387a53576733694e3370635462332d3465393378756f454248324b336d5379774e424268563943793856434649456b4b73436751795f426b566a4858476b35623443495257585571636e532d57794c7572424f6272354279616a6651696f746e4e4e3747717570356e666c6b776d776353596768706567697446505854327a304b4a665f455f74686e36754342322d704e386c6833665a39594f454445636b374b306d384a306a78334e56754d70634d72494a6c3578573365596c625232636f3963484d5f583969766161634c4262444a43784e644d53564756664845554263396467586961724b45796a765f424d735f6f707a4c784578624e626c4e70593676345a705835616a4c5837634d666b5543706e784959366c7843727355434c34662d733276526937693751423377756c566e4352557251303231444e727a57665435437477646c414551386e534b5061596b456c39737156696d72354d6a42455f65653630475157737557783073565936777057746b304a6f745071765864794f72746e434268574763733564706a546a6676596e6576634d4d6265696149325761325035716141562d43454c7156415573354b664967796d565f3749304b7735705a757678534c4f646b514a66456c794437774b7a7453347779426a3270704f7962323366765471644f7a4b6c6179625738676c626e4655596e444f5a505644366d6f795a353351323662526f387a35554e596f5452752d74744351502d6e32566645535a6b6166437844364b35384e6458436e335177667374546c373132683078445766744159426e5f3157454f55364149776635485651504c524f71394a61496e59524b732d477237334b325155665f665750656b51734e6356314e4e372d30713747457654693346323741665a55753762686537376c696668376b58646f4e714931327a5576715851357a323741367365487668473073536e676c6e4d6738494d4545727965495374396c794b51503958756664706164306345736b56336e713963337439573359764d423167654c584967395a786346465a745f6632686b4c5f554450455a6176726c59345f72317a314c506e637a6c3931766f3448754c613374436844744e435537534a47515551317732506a724373677079483155665539427459426268656d74467a5a47373444794b625a5256567777494843785a6b53333858613654315f434759336e584e5978647431626b635f4449674c7377304d3752517143766e55524f5065413759443578486b58495a59616f4b586731506878776d7a71664c7153764f43754765477169305f75395762494f6d656b624776327370352d327030514549316631654a316277416c514359736f695f326d4e614e507170574c4e5a6a514b5a6e39734c5a656447557a5868666475424436524650705a4c52447378735a6a676777307a696542525f48577a6a63694c6c4e584c636e6772413243683477555a5a4f356b575267465079675253752d526a535672624931773068776a56476675624b6c4e564536676b45734c624676545f42684373312d53666e52524144545f5354327930375739557938547347335a713847574f6c4d74364c4d68445341764d776238646e733173546e62536d64484d69574e7547523166656374324f5a65472d6144784262496d43614f4475427779655a38547434703264706868504d4a6d644a2d73363134347a7a514b65756d536178387a5142346432703448796e415167597849373157386669755432583375315463564c57334d456362656363323675425064735476696b6d4d733332705a4b386875473054633351594c774730324e65434d452d4263546b32333636534b33376c584f7645383837704e42627159326f466c794e50794f556379476a456733495f3248794d2d7a6a744f4e47726543447262564165444537676e735546366444486136683148776448546d566a42737a3975364858783072562d5445477935),
('el8qamflbsdhfmcq8lihrph5b134296b', '172.69.33.72', 1587433803, 0x73325f5f476268645a7655664466743375775438754b6e49683071574856345468634d63506a4a4a62514f5367446b66616b30446f4e6831366a6e744a5550467443356142575754797642756c3134314a654650365a6973344937796450344e6c777249705845536a65516a49594d354a5f363970744a344f4133734b6c314b4d713770472d35414d74696b566d50454572703332556c486e5554446336515a6f6e4e73495242685a6b2d504e3447616a4b734c51676c797a324e694d575f6f6c646669567777627a4e4152514b4f6866344e2d5a57496655497a7a6e47304667757438664e706c3046484933556b4b4d443358496857377135744a65654b65746c71334744352d426a5833446730546d44713356787761305f706e78354c3455725462447267756a4e686e624f4a57484a6c754d655f6172317166434a2d7632503632385f5a71532d562d51316d3159366e356276656a61695448442d625a334b384848477339744e6466417777725834586b6f664c66306b704d7645466c73686a7954525163587142776678324e67736d587a5145516c77315a4d5863366970746f717956334b454c6941775265745a7a524a4937436564787559783142383058524c5178577958687369727a614e696b45746851505034496769626465456f43415f7977567969326465525f747a76786e6e754d4a5a79444175436b4b4d70614443773674795a587a753978753971553469706e427532595f4a5661745f643469787352717861556e374e6d377a4e6a4d76373967577779634b7552355454386b7a555759346f6b6c5a413767524b6156775470686b3344765f776243556f4564657a75726b79794133436d6c4f42636d4a344935626136635f3244572d565a4d5834774b555961437246376b4662356e495f556a63427a7236723466706a6f6451494171554e7765514964586a697635326c7464346544622d7846485a635352636a724a39486a55654c466e5f665679666337535f67306d745a466f6d5a50697332325454786b61675448746570553447744776706742376a38585655625f55494277594c386f727063734a765448715a706c665036563264336354717852327173412d6e4c314d6d6b534c6a5358694f6e464a4d316967524241794578414b79523150575a776d775a354d4b4758387643714b6168584e44666d396642627655425470636f4c31587843484a4c79365f663538716b7967384d71677457776c47654477726b44745f616f515567515a634f37667641544c4f7932536f59597644555f6c42783748666f5159765f574978475f7a6f6e34764d73535338546479525442444c7258547a793832644d3238376f76444559674e484c7530457a446b794e34756a4d625a37755952675f5a4e4668646b4f5268524844356e585f59575854383830646758757165554748797043774c4d3533497a4b533873516f77467630697a506e597a6d557079306d5a31544268306e703959333649756f6d556c347a50705361444137686d5574706c304e336451784330785f50344e4a4c4f65644e73334678426b792d396c5434684a6d37594e30315a52485754396449386263324c317333376d6e30562d6f374f455337657737685745443063624d424c775431334631727a344d37344c32786247794f635f6b51697a70444a7379624d45382d3252515f625876786f4f35636558707338704b505833684a6552335034704a735a774a2d54477259646734516a705147502d7a555268633773354854543139655173666668654d50546d3075576c7449777778342d386c494841525030357a7459467539516d5954424e766f50476953526b526361455a36556a5a7446617939644d7177675f6f6c326e5171464970654b6f4a564978566b596132543464416c4c5279434943596c355077754a3961354e49446f7038697a746c4d5172565f614f623945763044786c3852507247357872614d723767454a37675954503132337131447a31754d5f736b573248566561544b6930736e564c46556e6474756572665267596a4c456b4a304c417949443175584a6d6f6158756268794d6f6e61724f656965444d35345f395f6d6e42596d32635374493943704f7564674d355966715f4c754b366932584e362d756e716f7a6435312d7252626c32334931695238675f50387a38454677513363504136725f6d6b4a754c6977742d51714f71483049517356544948786b5454427737336b6738627257556e3465776552384f567757754941347a72314d4b56722d3658643650724c47306d746f7a647842776c504e666b3948733337733045666851366e7a68384348715f44434e3964317530597064437768714e686a656b7875517a4338434d655a39306232756748326a6f303245694e5f367767703849447932615a4a6939647975564e4a5679355269386e59586a6837424d3442557941587435563472704a4c4d386d4170416272436c4a52397677474d7a67627474785567695a694b577a674d7a5752474141444257382d416d616c5a5249775056424b4c43615378426e6d3846526732704b79497a744b394253506471744b352d77356c7249754f494e667a6c56764d6f4952477031736c583164387863686d7164336e4f375948476c375f4948794b42524e35344d434273655f4b31434c30737a477639677476694f544b36364e417174496d386f35645777544679786f4e48644a6e783072624a412d425169434c4b4b785f74717a686548443273742d3861795064526f516e4b787a4551496b35715f6a7851366b64782d634b4c50315776345a7746526c786435445166697263784f445a4c473661796c504238656f6b526a55385252384f304d49354c6f545947704661705963504947584c6b5f7876654474472d697579614e69326330555a46554876464a6977756935535f544f43566645776b77314a386b39474d726e4a53346c4f7976774f57347049467575706e6f53646470396472456761736c76675f5934573243454d46537a516a4576315742616c7a637738734c6e507055326e79333873534d5a74597a6d71475f6263384f514f6f59797a537533666c7a665364375861464c4d7a5033334d366d42634b775a4b4a78734138757a4f437865662d466b30664567684a555f474b376a6e4a3243776b54646873345251576c32773667506559593275743568737455345462674b766a676f484343784b78715a6641506f66366a312d34657255395f3862794f3562625636784a2d44454e57696569767a524139683849627a6c414b50544861576d45585365513773734e59366b544c666d4d465a58316a43754c314553726c4e6b47316d5462306f524342596c2d59664f74445762714b74596f6b6b764350577155504679796d414946494f4f675f6c756a6c6d5452784e4b5657766c57714766396a7942515443497357366f4a71754c59756141466e35386b5646506e712d6b72694a4f6263486e48485656377a45526a3030372d2d3452324247414e6b54336872446133575f616a6d41325177374f6a434c64794b616851554668714a6730497a3133443154356579463872695675513666394b787569443444306c6b584c6e6745633570366f5f737736453543622d6f6241365031425f4f50547977414d36524c386d44734f50357068747057346635446a6b7a33654166793253695a43566a5744746a3336444332456d387870696e4d337869716c4d744b42537549706c4a75386a32553843324761724438494c57534e313934717943506e614676525043696864437a596d50686e6c70314d484b6f75784a78655a426c446e5a6453486b4248396746684d763355737051446f6c30724e75466739357a3277694373345863466f39715f47776543307a3173504f787a59724a31633248526b37615651624372552d73754247423050707269496e7a41634d4676775275364930626e684d796b4b5a42574f79727236496235446971644c427059636e3056685a6154746a4f6948616944445a4c7461324a47685456425a5846436948736b3435307a7a6d4e387666326b596a55756f357178686d426c4c786c626d6b6f534858303556552d6664446f413076576977526662354c4d39703735677730725757363150302d444f4459363775724f6a43546578396a755735317853436d54513732597a5532615368574a596861724165683971617a2d4a477768474d5231774f4c595031787166413776596c504764747049584a394e4a5769656e53794931445a6c594472544c4c5f57384933777956485930474c73334d68627675666a4a723132487a514172377878475166544968384b4c4c76694d6779444436566d4c757073794c4b36357169507739716a717a5564524a426f6f62314871397444396568324c39492d7a6c5149315967705a32326c574e726f4866734e69325974676b48317455674b6158437451765f77686b3948576d716d41366a7454367a786248637241545247307468497a54455039506256526631516b30636d32357a7743306d7142713675355466513352562d624c5357745a764267575474575f546a65713930716976704c593046575f626b3768496c6f4b5666335364625475646454687337616145756c4f436c554c69585f56474453426d5375746c356d7a68747976774e6f664c325a2d314b435144545231347032494d366c6b6b476a687534367345413169786c53476c776230414347436b55316e5931775763635379353432676f51333954505271446d473756537a44784b6f717a567469614341314b4d724269344f667a4135795155627666365f636f6f506c41455f455f7a75645650596b6d5f2d42674b644b7948734e314c357837335776766452316a6d5f2d42686345505f7466614b2d4b6354624e586238335869652d495a72355a4c736f336f3653637968303931514a33424f59685365637842416235314e5842553130624967586b6e315076363276616d73774176364230547a504d634642326353492d503655656b3632765743394537314976354f37776d573969573958754f5a693179596f6866654c422d5f6a4569386264725337554e4246696e314f706e6b5059796f45356e78745a4957786d53586b6461355646644b6c697775696c753779756f626c5262795a5244716870426538444a71464f734c794f574749624a487763383845506d3577334a6c32482d33367946484d6e58553448396e574657386f6f39457a69696f6364394c6e44705f664f566f34596e4f39516764314c36764363642d354e5f456f5f4a334d3747446f78506157525f62697553536d635f5954545543335445337331326b53776c67584a476939657731554c43506f6a6449756b6b4d5458444c74754970415367454142465776657464377467474f5533574c5168343773413658746f69422d346948427531574f5738356335474d776f6f4f6a3948427163434d74312d304e4d433251565f642d76334757344c582d6c516b5338304945717a777155596b58455a68572d756246484966337348414e6b773865545678476c367362345a56365a2d56435f5f726b3554796178684668465a79646c6a59533162756b6b374b637250384f45367a5748423462417874414f7a744d5a6370746e384b575859565a79774b6b426174534f6a676b6d6d4873644972754b50657967647a4d726937596d664856794356705a70586f5946536e52716c37686c4b3863464879684c76374f5f74395a4c68426d74766c4759325458394339387039563046547a32644758717a3432304c307832335f6b7670615378663241626a6e6e395f6f37695a72554c70754f51554b634e71487a54524b6a35344157754f386a52383969724e3677536f393269495f3737657531724e2d4a6b6551514667796175654e7550456c754b5747434b53775379494149723243616743446a6277784469323171454738526b31385f704257395f694d6d6977426e51592d3177456e6f65794861645f503050765f2d4b50415569796672764e525336374e353767665936763346556c356d78466e54514e4b6370644a4576343051526d54702d617339494b38596d5a5a6c6d6e5176367835697554394549776943315f2d6431354d5a5474684e416c66354a6f36725a7936664e57726a6574777247676847456b4f42563731384e686261435f6c6f715232724249454f586e69754c47755f3333345446485131386765625a677133307a6b3045547a6e476652467033616353755a79503751635868386a494f756451466f592d356178446b79326d757a52704b3536726f564e375a3735326b5f4c354b4b66477375783835307556572d5758535851674d33774f754d596a733546456f52456f496a72357a513277734d4b5541676f57484e674e685a52526569325262635762677a624c3172676d686376423863477a6e64694579693548577641574a455a772d7056675237415f38624450475956684b4952735a55596d69763042417050516b5f346662305f7544697a30572d4e53697345474b6b784a6654557a6d63555865556679357641566568556e3662615771747942515561684d446546643232583650764e745a7267376f56416a4d616b454a4d74735f4d426330447a695765365a4f4544504174514d386e584c4f62685964477050524d516c3877775546334870365958694c7a6250634c743874454a66555148457259524f45614f53705f3465534b7976482d694e485942446562726b556b6558695667696d6968747a424e35743638427648383270345651374d4d304c6f5f72494230333242365a716e36387a5a2d374a764e634b45423853613168334b4334425a504d724e4962324d4d373955344b6d45332d527145537361634b4269564a687a7336437879446b6652436d4d74644e656e48703668316438624e46466f4e6e6e785a4b4f6b4451446f4866324f6a723266486c3633456679396c4759365f7641415a37523238436e3652655157447267515f434430616a44704a46486d506d544b5030425842716870787364563650333644624f6e6968647442476232594f494a335f6638567767496f34596c5a316a61415f67476b303434626b78454869513858682d5a6a5a4b556668395f396c57723468696c6461624b44475a4d723636635f444a444b6d436964704f4332774d635f6a715561594169336f3478654273474d736f586856434533343943485763544a486d4f4f52614f434f785855594d4c624747594845564e3338324b556f327543763049673858694950643366522d4277366d624753427052646d394b723857456349796b4e544767574e31475f724b38395174347138723132424a784a616f7034576b47672d2d65345a7a717a4b42745f4f5941306f566e31524573495939664b4b495537574d36636154303477704730314172582d3849354b366a585266687677356a554779456b4d69326d596735754a335f413172484b672d70495a6e5539682d775f7a76627378556a6c306e63577a417174684e646d794c77536a41695261356673504f2d65444a57417a4f6575344c42614c576d594b7573614f5275585a5a635137384c33366a547a715a4e707549526f6f797a335a453635584c31325f49503774597631706d4a6b584b514838675667394844627a364e31454549586d6c797a774d3454456f6c3853644d70364f2d4b4233564a38355a366a4d4a31422d383030584c363156334e374b6e55364c4e49427a3578552d5333764850476e666172652d7369725a50656d2d644733584a6d497436345a4d502d446b3845397348375163723532687a4363704a56472d48516578314655626c694552702d316656414972527362525a36674b4d6a6b5a74),
('hdi0h1n5atjlm7ser7l91k43m3l994uc', '172.69.34.167', 1587449444, 0x4f316f327678522d39544565572d623333653067774e63304f4462356b7849516e664651436e4764416a714d584a4a72554d52524a7161547a614c4f686679696751644d76673830376b307666325848686b6a3858434961354d306759346b5a33617731566c49374c356947415172567136446a74666971704a563862364f356557735939616d66484e354557716a4169695668576a623072446d6f715056304f7744755f3541323576645838674a474d756c563975457a466c4b3177455f4a2d544333664676784e6d566a394c53614e4359667348636c653874564c6b657a3272694d587232424c7262546749756f695765705a52565a75542d6e617a5a74684c54794367456b5a4a3048634e36314d58783152544f7739766734465262644b2d667834796a415559516b5578516579506c7a62684a5f6e6376672d4965636465364645576d39437851346d5f59303049676d4661794775624146466457785f5332576437695a6e372d35426f4c7543366769583443357265393036457a58744f4f735731465875427776564a36377a6569576e383867676575384659556e523572736b66616e685053526b62764f30794364496953554e485a614364472d695f514436733830686933717338744231595a316337714b67526e4b67552d564b47696e49574b64304e47325a357656775566326f38335541566a454e68306b4e7064314d37486f58685a6a6e31656c7a4e516272746d52627638427744684d4765535844646d5965615772663767784d55335347414b73797a4e44735379634d4a3748627150466e424449394e56554b4277364d62585635433747636343667445696267386a595839646c58416e5a686d6b6166794a314334714a33636d664541564a335a4f6b636b493970422d35584d774b71623839614f375069434332383830544e336d785137644f594e4b3551494e386d75724b71705f52736648544b367747644a77336832754b43474365544835747a30386d443656724a6d57464a4c54376f59355f4b644a45766f6a466850684a516b32396f586c4b334f484b456f414878384366556e506f6943636d2d587a434867447a396c724a4a385543796c316f4732687831474c475637567267657378396435773361337a47394b456335724b74726b344b5165595055644d65446e7977512d7363764f4a3159344f6a734c47337038784644726e35567757667378634e574666365966717a684c4f376537586a467a31444d4775767848543369734f795248417857557254545446414d49786b44343871615336675752537859524163316e356a5870477955304f7a642d4e466b7a454764726f77317a506f6d31726e477964537747417366736c475f4a7772416c685754544d724868416c6947563576537541412d6679426e716358364d3030655930534a7543495f4742546942454f4966544d50736f2d554266754c6e306770315149556f496369313037553852615f35336978723875526d574958307331736d6d684b416d54567146775875496e79675a3935616d663633556d4b3532515a6a47794765314a74627264663775524a32445647344755664664466f67376b6a35564244454a5530726e4f685f63636b4944657a7337746b61544d68772d654e305f596d65686a7342394c617236795f61547953685157704765397431744d467369314b56573075696d4a6c464f556d574663454c6e5431655461727373563633376f5a5274563366486e6a31507a397266745576417a4e57376550617a7a782d4534433033705262685679306d36664d5734586957425a735248526c49613371714d5558595f4d646e38624b43743233514b33714e414c443278706f65763264552d303330316e7a495365544241714668664277436538744337703075744a7277466645626d5a49677959427361694d4a4a6961777770685a6d435170486e73576a635534634c324e384c545143614374737a5a6431544162507930724b6a30496f4b637a4e613975325136576132464c33424f50355f41655768343763463431513774646455436c31585a595668735a532d4c6853764d7443476830676d614f58645a6871434345613851334c415f526a6f6161753850725a46354a354a786730746d566d5f624a425a6956484958434a55794244667a4e39504a562d306455717368487658446139764b4e6e6433496b444d4a62654d6e66774f73313178617761345153624152735a632d4b5f6a7843624371484558537a61645a5346392d6343545f41345a4b314b326942752d42594a487276726f6f577267332d6d696166726f753873517a4a57774d464c736e463054414763366b4678625355417867446f5966484f374a6f5a30673062587345423063677454625f4b4a2d4f77636d34464b5552325935615873354d756e334d6d624e4279576a344769715f4146777a4b436e6a675a317474664e31376e4147577448743946594f62586c612d4c42716b6c5f4b317578586e4e414b4c776171596f732d596f58744443375135435a6d54747346744d754832786b39786e6b5675354558344b4379423976705f68316c354d74372d68525a784e4a464834537a617661656353473432487a4c4c326a4e36387555534d32655141325a494a676559716f53623270595a33514d6e6572714135767150366848636c5f2d4478626f7953685a444256393437363942784b7850562d796e42527662374757553554684f776d416643454664324330345a6d45674d5162304f4858367137765a6f556571615a35594a753061714b306b69327966766d6a774337324a33456b685371353341462d44426a414359514749384a75434250756b672d5559416b66613156613370735138623245465f6c633345546c6c646366624c664b316459566b30676132376c6c6d68575252434e476e5f35355439314d73412d4b6d63344b707a3141575732794c6469514f41656739754f476d4c42523973735179726f6e36364f6452334139766c39784e706476306a4b4b4465316439716f4141574c4b53444e4f5a665f544d5477596c774c4e4159446e4557436d7a5a35796b45497475436861417267774f6147724a4e536e70486c4571456457352d5167675643356441517a326335355f41566b55686a487450597044396b4b71676436414f734132693475344731423332706b466e52396d6c2d506c525f394c30797575347379343265566549564d61645366796c374a6b5050722d35334873717067356f32515248794e6534337239666f614f3679546b376474487162474231356430776b387a50337236776e384b712d412d6f34365576766c354267464c706330716c5f68644f375a71646d79315a336a535468446c6f6d535139466b4b6b7668635644706f573375364f6b495433756d774b3066614959415747644661392d584a476d67646f6d466347664a31485845714c57317547454272786a746c773244546c582d63535833354b425a44706d6655515469412d61395a7867524557674538697341483570686b42543438776263386864382d42636c59474154584c66394b6133744e3371334c7866557a4f51525077385557447776585657786b4447396b72334b326c6d5850396562374a61305f66765075704e6b454a795545325456314a364e2d69683139534b6153675351536e4451616f7245704c6a7a305546317259526b2d7039595257584b58624d7642316175764846523156446373764e716a3069432d765645574947455f33316c4a6e61757657624a51486562326663794f4b6570554e484b39584d73524653304e5459355f765031434d7533497138686d4d4876565a4439752d487a6b2d4163636b63524e5365565055796e5371317267384f625a79366b716c327675666b5a7849333048416f4c576e5a43426f5164557a745672497131705a643057494e476141774b30465a39493844694b50735052546543763969364a345469746365306d39666170466e68574841777a456a2d76593150686273734f4e6b692d475a325f707576472d7a66475f3332674d4b6e496e48464f413258673837767863795a4e313750324f6e56553066636456633330673767703145724e64467975477853413570633632753077576b74345775585143436a41673766655f506a7a346642556a4836635f335450576e6479524e4676314738466f786c457766475275554c4733516b45322d4e666965594e6a4d4f4f4363505957474c56425474724b6147386f55666c3456715270477478414f717935417864475647766e4d4b7142675862684464464f437265585350707546786f4567756f6c69754965377a66564937706a555069346463416f4f456c50443732564e4b687571447a3949747155564e544f544445312d3830676f617053522d7436364e57396b666e48517350467a31683247727072693252384e3872694a623061364d70345f6c6e594c39786b694356397036756a454e41666e2d45305f4c6364464f4d55506e6e447748536a695a4957756a55446769524930784d4f5876556b42584b342d42634a31424278466f77486744366e76774a573279466c65487532443655593834454b6c79494a6370664667496c3871614b646b5958345a7839435369316245412d68525238725844744454522d79537546545a47315a5f5f634c726f45565a754256364b37564e48614250516c737341736c6b46315770764f41586336394d4f684641373261622d4b4f6e636f4f626a6c65726e58316375585646695644786c61316c4e5a38473259415876694448687047526d737365492d7757796869316343356d466370334a6836514a5268677161346b645159427948352d5565584c665f33594a3044473037545a574b736566675731714f6264706c597a4e76374572376147623144467a4736597055635f4b34752d5649684b51695f423462705a364d3553524b43472d7549355744454b6c51526a625a696a35334b586765365a396f336a6e2d326553624a417473436f4730796d7a4d587432734a33575a443538416352417836466f66776c33366a6f4c73736b33307058716a76775f693854325269466934706674735745686b6275534c704e71426864623667455547482d354f6a774f76466770523448785033682d6575706c7176684d74724570414a724e56386c744f4a63553159674d45444d543645385772373143354f6535634a414e6145654b766c35447a73686e5646536f676a5156655441594842636b6d5f7a6b756f304a334276745f7131785566504f45694c6e6a4b50472d4c74414335574f574256527234584f4b566f52585a743950743235536e7a4633426a5058594f4a775439656b546e4c4b7266484464303772434b4d576e364649376e3955324d54474b4e36784b7437696a436f39567a6f6933666a59577a4c4d666b6358533750366e576774567345366e5458744445497150514d57466a416d784674587a5f5363555543334e43472d31353050446f6652386178355138466b7637634152735a574b33556b49447a6a355636456e316f5732497835454e5275734e764f6a5a434f696b52487765526e4232784c6758326667307a55317a58415936765a73794e56675f446f596237634e305a58676c61324673565a62537741436a317159425779684434516335396743435955636f48373969706f6f51302d72544c496c684a642d6b4f594b50483972756c6137507a466949636c576e30675549786c5530565734575452415636444f734270733445695742473654687576424a5234326f5131465967395379626f645275797269474431775238344677627044773873643658377572546a49674278676978326663764c37326e463277654a5a76774b30584d673277456357633374375f6137686d6d544454543164304a396e41447a773031687179466959753374642d71595275306b6b4344703869567a4b465a4f435734654f6749656479645365665f30573655345554744a47753739697070666b4538475355534f56317232726d4e7636654443356562675f6f3758464e563046477a4e634d746156666353544e772d4756347837555f4163396e6e7a4d717468344b6570697032596b7a7a47623848327a4a5f6157357436425450544a30657939453964353574576b6a6372567771667946344d764478756346566638546c74316361647a426f35684b437a5543536a4a4e35586773346d677168715442465f542d685a65754d4c5962617937426e7779626878634d2d46484b3659706e794d6f36577759577a715568653541644a337253314c656a4f383645455a4c564a654b323654383434466c564d386b646c70396e52424268784d4d76744c7932677476757561514478314b4131725f6976696f5132746c457332696b4f6c396275523875513935516f5f36466541345750766c6a30736c596a6d38486d7a36337371556839733657696f6350504d594b356348444d6f4c5a4850554730743461356736666268394b6246697673325a5851376143503564446a367a4458694d31304d4646436e36365f4d5a394236363966596969596d554f4d61786c794c314769767269666f664f365759463052376743317041416e63635a684849375674526a50515042795748414b652d396d66422d33582d6362795a4a4e3671553834322d69344d496c46696a6a78443666474a4f717635366a7462304932424f653239424174366568742d71796e575f6f3176594b5870446d31766f6b686d417567476a457841545f316a4a5730566b594345426c49446c4c75367772614b55363544656476686757586e613432584547357a63716e4f504b66553571464447566e2d73697a36524f6731557a374b2d4c5a4c4438675830466b48474964384e4750434a59716c6b5a376a56662d6d39526361794e7975516d655a625a6a37346c65354f42515a4e6d7031744f366a65726552553170364b6f4671766e4f4a4f3975425941765443413770486c527676657833466d5359444451386556396830766e6555485f424b5932593464345f3662753678555151425641695f46526f6b6b6f5351324f797477457530336c4f4d426b782d4d6f34756137384347726436766c594e746733714230685072566f7545676237466a42645641505136684a663244495777375f4a4d4b2d725246494f6a67354735726c655765613173627437307163535f686e54486a6344797057354a4e4d496531384b334d4a36416471754e5550497253414c43574e626e33386531627738394a464758654c6a304931773337592d4f3933755638687a53346169755261396849416e4b357a4b4944687430443148695531655332464f6a556c585f365941677243615a7a575f6b45316b6f684b54493150363044707a516b4235716c6b5376566343634d716370454b5a6b43714c437531685057385564765f714439524e30444835316d5f3746584f76424a4f445354326876447a684f36767946655a34476f706f32303444336736524f5269336a5334616c5069355f78574d6c4e78574f453261435a73756e644a455a77615171597879345177626a2d4544425a42385f73626d79573963624b455158555556634756424845357664574f41676e383330376159453365365663556c4a63697a4e4b624971647a68486679374a75733535722d6351637037474b51476276706575764535796a7a714f73386f7a41454d52495377446a4141736d427a5f4f7a524d706e646132566a4759372d57715843587443735573424b65525567626b717378624b6b4f4339507a6455726d32694862385932735373673431384c636c65766a4d59374f6e59385a562d7239527469544d52684e794b7657432d6b64495264475f5a3663376732);
INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('l31c2sa6cmvndv260d6p36k7l01c48t0', '172.69.34.51', 1587451927, 0x5651383231546c6f5244455064764a4c52586f4834694e53766c5953596972725a6d526d41416d33424a42487941535f334952565f4e386147556b6b4f707946426e6f74666e4c7a47594f396d37333473696f5258495155413858704d784959455842754a39465f5a4533417042736c5f73584c4378397144536d7877787141737949665148675548524c57397049393445436a79367378327946636a32655255744e4a4a7571765730716e4e4541644b57795a736634595a4174614832774d524250384254596e66546d694e57576d53745465652d7243442d63703966456e55316d56533876534166566e673764726b3168506e6f6d6e64752d52704e594b7744426d78516f5a4e45616537354e5f4b50464c3172316a33483946327055386d572d4368696772715a54526656616e537731335f5045526a656559443657715a6b7954305a534476416f6b39573832703076335366722d5552326e3967313764517744753975587243706a434b5f6352444857307254514f6368476d6a5a54476d66596d677a675268506e51356139782d32513758673156706f7054417a306431665a73307376396c6c6d384f69477455745558754f6d6c464a656943733347775a574e6c434875695373464d324b526a574b6a59737a52554630642d387573424b64723633785963386c544c422d66475f6f3963387750744730662d694171745f30424b70674b49544d77725036304f757675696c4f785a427548706c6d5241497730524b6779347a42512d65594e4465673473524d6a7453575931476b44316c48494342636b6956546463415445316d69374e625f646c6d4f655f354e384339466f615878433247657371456f37685f4e4e6c735639703377314a62526a63586a7277676d2d575165616148514847786c3274652d48394e41766c626e6b436d7a6e584432716935535242754a7a68326639382d46756776532d76775a41475f575342795a51525f7661464a3474436c3873683258445f72594a72476765645a393275663341726a4570764b6a7237334456513870724c4b51516f716754763241696a6f67426d736b6a614646536a55716a3067735a6c306f3533483352494d7863744266324a3661524b324d336b7971766b695778647072475462556e534b4168484e445573694876655670416d4a58656b7a4c7430664648536b427a34756f4f64645a47544a35614a762d74453667315850685f76467464715141655f4c68715a53694e394e4e784559586b444f77776b6b6f4d4d38794d664b6b6a385a673645584a7936304b424173386c71496d76426d4469696f4865697949426c7571553167494f3963734b6737506b2d79565f32516a6975345a3149386a6c76673273674471352d4e4b4639394c35336738767765754a6963683864386d786d6a574e4c535939674c6234504974545477677634556535554670614d336974524679674c6e677744475648745056713077424e7874386778746250363554356230574f717477336c38696a3259782d6a41765f3655494d383241704c7131575070736e6f72416d48757733726e48435647662d326d587054546e71744842465668413059557a6c5a42613158654c47524e5655304f6a6e3851397653644a3278734b6a4366336247776576474e34324c586e383969744a4d5932533867573733774849305f4b6835744d385a395850526f722d4a49584b32357565324e664a4458394d6c55746648674757666c7a306a77424c6a6b792d74686e564b5252376f364d52553975437a783772493568636e775652436a36504a6b3131326c4d76617939357a7a496b70343336454a6c79414b70513131525f7845763231386c37613353686a576b487a42314f6b5f64327231573157484d2d6c756b6d54784251584d452d4b4454774c6c4254775278306177326352347a6e4d45627a6259443476727672576d3239473865575674764e3355562d6750673067436c4b335f54325665567a51704f495842314673703448515f654f6a6c77706d3673334a442d6830757372414733436f444a6f735832336c7470724b586e43676e3655465a4e5736544b696b7141446e35456c667871375553764765304a464b305a7867496644694c75352d414937636c717531534f47654e5a693965693345506a66785a3663476b3642494337356e344e754d636a7652646332556444586e514476475a546e7371544b35723279396838306d74374e746f38476748334161324f714f5874477a7974326e384d5678727272666d68324f696539484e6d5a745769446b6a6e615a626a366c4142506968326e38476a6d54456b6c75347778687049395837696756496975754445685757335348725a746836577a48766c576d5f50533043533857354455776a314a733741374c6b5634494c71374d7958794e36587257686678466c3762476f4e527a62724f746c375f37555975667251435a6b3645746b5a336339395a4464552d444f756d334b5a74586b5863327066396f6c756253454a31373255346b362d4c5933492d6a363742544c5162396b4d6856374b51304937727057776f45365178775f754f7178706c464731326c78666331466e2d4f67586730416871636a714b424e6f514b366c653536314654646e65375a7a50764c74686f623745427a797279516d4131763135535553516e73536536637a72475f4946315941516979325f2d564d6c2d6e763175504e765776337a706674306a48354d48734b7a6a33364a746649684e6b546f35456e63703647586b417745656252346e5975726a4d707871343053522d4a47574e724371696a444861747965694541586c7a466731754367682d6e6e4a6b5169756e4958736f7a504136574f373738704c44527a797430444d3773486f584157474b53364d6a554a4b724c3955472d6a505765597830397458644a716366543643392d4356375f42312d6a45376c3776483477557051536f37494b4d6b4948716349595772392d542d3631744254367469486a316b6738736c33736e623743304f724f456a4c6d5a4b54784d755761572d5264786f736b5156326364497a3970326c346b4d34354d63565867614a536a5163464f6f2d4a636d2d424e59726932435367473549436471333836475834623041436e5256494e30326e737a766e71344d356f685068323853626c593758326452386c51577765374551755078395a655a6c355856676e525045416736386f4a706c78576f5a35305776365846367934587a663236597039556656636f5269685a79716d366d72326850767869497862647a69585632427a4b5f446641547550694162724951654d526e4d67416749474e5445536670396e3244486d4e704d66626352435f3257646430627249533052576b4c5253704e35777846317a6e6e415377587951344c4f443430535053467536555554674f7663527679735f7042397258537656396362385049635859416542476568727a42304f675f6d49567a2d55445776685036352d4f696279645549644163306b776e625a5057466947613247574653744b2d62355a35665a4f48654d634d6d4478383265704463395372695f4d586d5a545539416c7162796f4b396c6242644a526c385f4c4330324435737a4571494e776e6e49324866586f536e626d56556e364d7973375847347a786847616c6b4165796a373073616d324844795073764c50495442555865386a57516c644c6572692d2d5f65624b4238484d383946346e66775034353230795f746d42474b4c493966563945766a6b734170696939665f74694b316f74526c66563146756d7435314d7147663532464c435947435a3968756c72704e3156585f466d567a42575a5664464b626d3841444578593333345636515548353873423369636e2d645f357155702d316f775f6138466a4953776544463465723133796d6857726f6342675677386c4934566f526438585f37686a4b5a5962424872524f587a356b505136326d77737639497750454c4a75445374764d782d486145457836356368366e493945307654797a645a4d3246523962337a31706f2d45777a6a685f676e74653230355338673172477778694a704f4f64473977367a594c56657439326734647337594b707754302d6d7055734b695f506a78617966584f437676796564417536636a70336e647745704e542d5a36447a7935593659723266764c34614c6c4a5952655943544a397a36666c59444e596b3667513947525a4a5f735875626a7457354f687a576932635657594e766f6c7a45434f6b79724a7868683943596645414e34747667486d37355977434461494b6f3253527a366c575a464f367a5568645658516a427768703572326953595576743170797735306c304466674a79482d6157766f4a434a554271475846375974733867734951417679695668375261644675442d442d4e693039306869646638776b754a74396537744e446a6c4f75394b6d31722d6468573754775436674d62616862764a50474a4f72613433454e3468386369364759736c4e477846496b726b7644747271425a5a3566314852445956305655324962554b7854674f4d61355933633759475330654c626c4e695f32714b585779503366666973625f323669575449594b67344555475056645775373158614752332d58747a497733474b477555364e33367663414d34676461497a6a6f534a32786543777673744e7a667464674a6f706b48704564334b6f394a4b566947734b694831394b4b30785357653475587a376a306b4953454a6e3462396f51726a464e6567664a546662724463444158784e56416d57565a6c39774f734359544f536f7568734a414865692d4d584c4454694f43673948795a346d7a5042726c3850303661644a625a723478345739774e4750785a72325f7a7370695150726574716b7737567a61467a6c574455325f6d30496e337232454a367556367a7668507974364843322d434865446e5f4164394369632d623165486a4451394d51565658556d34534b54355f6670786b35564d5535582d48715759497a69534b6c52764e6f4568317a547066415767746e7639483173524237417a7032646c7034314d784776756754494e774a5f434578785259564b6a4f344a48774a627a44767867315453527850485f725a795058494a4357346770326e584e383936564f58744d7450733155334d344175674e3047445a634351444e4738466653555053487a6d5873363777554132364e6b4e4c6b4555584976315a79484b4878424e344171354e3479394a6d577154452d5749396c4c68675569747a3551446a53687863464b374a74715a4548385a313241535555345a6937527a5954555f66563433615051694b32767135416743644e4e663567427841626c5f6a7643635a7a3941664a524e6d6a6876312d4d487a6a41714e6f2d634537764d6131703177425473384f78736e7a5068386b6774354264756c5033586c457265724b6446737337524334673730364368516d3769633673516c7a49552d43796e5035783432556a425a436d435943446e424e777444747153715a635f747535354a39462d396f57396b6d666e7a62563739542d57324a4a774358695044795a39395567313262687a78785333387a6e6b335f4c344b63545f39536450457572634f316279634c68414a47375f6e636864784c68747758697867474c376661697a6d3070463232696f464230456d635a683962326e3263774c745f677571616634744b2d30526d57544d63416677674b3457747457516d6e6b4d78445669626972786874344e62394b675677615a73504c7a6d4b7653434f674e423048474869536e707779576e376858495652434c6774763067596a34717068726c4d535379375f534b36386d4b35517243474f6e5f5a594c6c6a61783244526e524d7432735134794346392d38676f684d4f33303533764e71775f6776354b5f5351466a36726f6a464a5a66594f76617a6468565366784a416d696248675949445a4b67464f6b4e48467832353746325f612d65676b4137385632694a6b39675f3054637645353555474f466f457148527034733959664e4343742d66477457344149586a474577713279734a6a366c61764a5a6a6b647639344d63786f7969446c6769474b2d76694357736e4a6d646f52396456705368386e4f6f7167396b496f5354574231633362725258365a6267463066304d374c5532626b59384f6f366c33446f78624b6b334e712d394d524b6e484878555864656a6159495279686d2d5a6d2d612d4d6d566f5931354535316462304d7877355046365457664d66366a654d6c447278752d6b774a356e334a6533554f78574275355938476c68447730557a57654b494674614e735a62585f4a7a39655834636a314d55537956773443744761596a67553767534369436345393238344968382d57713836376347766355365143534479646f69324634316f3649786b342d54785042704277386a5141576d567a7150633173434f6d7972623566317371476a39483033344f6d585255707967692d4c41486e694477487732416a5135533853386c7346467172456d4f6f38644958624779467a393479454859584e4b694a524f374d35386257653234766e646235716d76456b524664536c6a746c5259716a525f717865346268504761484b31576c6a5842537978616955356334726b43623552676e34714c61707965526c31454f37546f6d636f37426b32777a76544a687574337944744e7531477a6d6f717731595a6c78453856316864526a4d4c33304450684a326d746b5a486a67344b6c664e545270794872726d666e545646626854633349514f70756e6f2d7659543973707a2d33457a52574f315764786e366477414131634f4f4a77647079634b4164564236385743705f677535394c4d666b6c68415631554a62636e684974357a75704a664c4d6f6c35396341686b524d663769353161646f5639306133385758505565724e4142717a6e53535033304a436f766e50614632473475784a7630574f37355776467071764e565443337a786e356e63317833343143755f6d62436d5f57366d5a6f555a735a3856503168426e384f6a41514c48777456674877344664704d4c5f4970314559683179474159344b3571446f504b50425a33464670446767306b4865684c415a756976306d6b543941475830336a73376f544646484d5777577a582d7859744c7a4d3155547547527678324d53466d6f733857656e306944765157554c6362356c56614c595848666f724f384f4e3945336671303971366e687a30393452535f324b4d4f48495f37435270766e3664454a6831726f4873654d473763705439565333305f37744945507175534638456555652d4266424b6658613839526c53394c764d4870665751344d7645503638467850615463484d596f3978565f724b4d465264377778636c5a677a724f4a525f7749524a38326e41787a5071466550686d656d743633317264546c373551585a666c765433577038777637643054745f4b796b6c4c624b3146567a506141733535474e6b4e6176785f5732323956484d6c5174686f785a4a6a4671736f4f504c4e3563755a5455373933734a335749632d566457464675305570784a36784d38344d376c4b71307a6f4d787665737871342d6e545f6d464667336e4a4d476f5f6634754d31316461526e4a416c48394e43655941397842343638584c3959376e3352436973656f674a59446548626a797733744a6e676a54327933426653674b7a6b746c57396a5253386a5634594b4d71334b7252324b524635306a376a5848696c567567617a566733694262705f64674c7135725f4451375261365a6b34494253737a),
('ddusm1ssofgonisbh168amab7nberpm2', '172.69.33.76', 1587540874, 0x5f436f6d5475414266555575595555724f5f3850536c4949533837497259306d45345554354765626f6e566a6d395f57393151486e5532506f4e59676f4d4f714d387677574a68773972666a4a774d3943554a4b7a52306639494f516d6b6670794a2d70573352506c62525f742d736e7a6645446f516733354a37354c6765626375375666357a594338586f715a56433875644a3461796733584e3864644a314156694e614c546b6d6857305950505f4e4b715a72507a706f67725465516644654531744f736d4970593575394b76496f586f324c654d4f434731316964654a4e6437334179465954454b2d33447837326e6f51767a3252376b6f5369537536547a514575785354494459774269356634755f772d386f6c76355271304d42732d6e646875336f4c4f574e726f4933794a3336524e36457671416b7047344d746e70526e306c76557554336e446665746b73562d307678513076305477365a3368583538574d7452694e674e4b67477a4f326b5572334b4232686d64366b6365494f69344e6335593938597a4531534a5550754461633762305a654d4d4f33375474516f6c4e4a66394d775856745f6b616d61377a304c56525f4364786b575f66775a6d6e796276616270342d6c6c4b5039437678567558384a6c56654e4874754c52385373705378476a67575147445657464e79426d4170372d554d7a6657364e74774945585464525273444361384e50492d6952566e706447323661347651415f5a55707a4936726a6366336970664d725a35735438544d796c763442364950596948354f3130587976712d58316730665344545a4b765a356b385044634642416b62325a56636d6c5f56496e364b552d5f494b4b4f343549666a305a6d69737232716442763033734a514332725578684b4f416d50336365435a44584b313044444d343163724e59467066487036686a625f55735663755f396b6638645746553555666d365f582d304e70717543647531524c51646a52546c6b714e415a4c376a776e78515f70727876614c764d546f37544274626b736b4962644934304e6154464f6176396539594b4a6e6a4d574f7068516a6b376d5f5279744a65526f6a6d6e57686d6b2d477a31692d4541536a336c32375a3250756a633846773271483455576b4179395332533350693655783930693633344e704c714a6669734a543879413879786b384a3848483245434658727058655234514637374f5f6e454a374567616f63565873724d74726a7848366734704d6e454a307239596b394b50506e376e54374c35347752397637554547625a326f72754e6f712d624d75683776436e357a69376c7672626c4a50514b6a346f2d6a546e612d5f325870717546644467653866776c6f6b4656414f4b356d736532414f622d46385f777a59376d59337733494a78483162764d4c7962447554324a692d7a586c463856336246337475314a5078714351394a4c4b354f6f79496a7a58644569794875337138567870764c6852544d724e58646c776635616251643154315a67456c7963586c614732636857677256596d6664385249352d773839534574374a597455337475474f7850756759417437485148415f554a344b5942493548673559706d303674474735323765324c5930444a655934427442376c48516a4c77564f6a304d56656659574d384a63734145566e63676f464c6d47427539384878724a535f7645337a6867664a4a48615645436a7431774b6835666c58735a4b786e6276614965357858574e4e2d666a61784730516d6d4c647171474d6d494a7674715148546e3347347676497136756965396646314f5a51387344566477574e58572d6b3459307448486b34683535727966395f724c415a385f45666732353546644b6258507364695a6936696b475133326b6b586a716b5672755662564e7879356f32703862345338564f52704c38796d6f592d4e4747716c32526f63694d526c5f52664c69315830387a6c364e72507a794f646751554d627a305a676b6f7373564b3865544e793069327775585f6e667347553930714a6230767949664c7539514a6d546453754377376b44415a787a693871415f524351524559636f76326967745345666d6867335a7a6f6552655a436a636955433059686f624c7946554b75626f626c35675947397462786232456c7137325376307154445551626f34553865464d6975684d344656564e497053715848677450586951674142593648314736372d6f4d6f574f41317a594635494c644555337346714a414379507661354c375a4e44634779456746533577725474587658643778465643385135396d744d346f4c4858306c306231464a616c4930476338766a6c445a4a48516137757a7a716b62744d79507348595672527a614d34395972384d79566c6d484e79586b4a4844424434364c564f79647532775831714275623568784e326a564636326e745f5655574b764f55583149506d376d49354b547561343270582d4e6f303668384a4d72485a4d565a65433872643243666755585f7738776770352d735933685851503175336d6a75547a795562666345396e6b56476e2d714732504a38546b796467676e426f614d424c6830637a506b6b7255535649393043677968714b4f6b43586a43416b7163616d53775643306f44506a6d63574a2d79752d387a73666d565879436d71696f4b466a586148443356786f6e7a4c6558437a46693751535a545545704569763849417649714a7a614b50314a576474456579754277444b314d445a7056622d507247652d7a6451524f5570306f4c51364e6e4c5943484859316d7170506c44685150396f764358726f4b307a706b666d5f445039776b65696f6e652d354a72352d4a784e675770584c38306c52417242475f5f6a466f6465327243506a6e61344d49456138592d437a3738344f524879594934687459523851355a73442d654e36333473564e6534486730316c4d70626b686831526d30694670494c73695461425a50717a2d785a664979763779744f72784257314d39656557795a31424a38597a66706c38696c434e6b6755664668505942535877315153536b59444c30476f6848494e4832554f36364f6c5130642d3750444638527462664a7a6d744d61483351344643435864557a6e525846454b77756375356b37674556354d653256427970564667707448675a4d633457416779765641383262377038757150657075594d5067774c474543346545505734664759596247555a447a636872717a4b3647707877525a5833707a72684a54324652773759476d3778337066306f6d48664d4f2d7657556c7a565659487646304f2d555f626770482d6d766458386d314548415065727a70346e45652d30543677616f6c47727071715f773758797876486a342d4579395542554c4137427a53772d765668514444385f6a734774635536614165687a33677465654e3942614862356a4d5a776e394f6c494b62355967697a323065676a4949684c4e4e7758566d6d647155374b6a59677946654d4435306d4466595a3037426756716c2d6d33444f454a504c504f6247313154326d5049516c6e5635483275626a69496d70625573795069386258736d646b564e57483366515641676761767a53474e38326578422d56612d376271383677364233556b75467467524e42675255547058587778416a50626c5075487a6770317258556272727767574f497a566974673975436c7139736b327773334534474d6f3953664759335143643161686b67503052616a476f356e4f455954682d49456d6c756c4947356f45613546554976554d67565a6e64546e6f4732624952374f31655f7553647953754876423045463273615a7937675a776c35756b722d744e7a614c4a3731664739414b486e33736776634a6d685861656d75312d416367394f316d356972546d5a34417a634a71585535463049544139394b5a3034693662676a326b75415968747841466a506f715570386c416e305271384c4c6d5277704363472d517931514d5953522d6d48747268445331666b7370533044336e745a674e666235723754654743525a4a467070387355504534586338642d6c70644d544d64664f513961784836486174774668512d7251534e686e6463535f74574a66733850384e725a516e7a36445632365a38365f614239656730726f3961684d424136526f3279344d6b61694f6e4159566e527569327237647750746849504f33516e54554551446d68425a6e53714369667147775a6e7a4b4f334178486d70676253633451482d4d2d725f61564c54494c3876345848384a674c6d49666a4f4549734f6945374c5769346965684d72424a6b30693866775a793557614d527839416d59525872576a706e6a505961626b5754554d425f61554b35535368354c556c753574663244554962324c7a4569645259523476427162676f2d4234786e48314954414d71444638796663562d38713750634a595150445279616b45424b6746354557484c4975466958685a49413958766c5f303669796d78464e527447724d2d39533137504e797a3678527054446f453647526a663174764a4f7471474a43634c616d35764a4a506e4f6e45424a5973513363326c4c5250515079356f44774354524559566962646963427a6d75492d356a716d4f6d533957417961595454793344307543706342444b4a7665514b544f6d37643249616c3535674c7450713232706770754d36334d74636b69677579377136464659363435456b754a5854414b51592d57367a46776a5636546c355f3037513368474d2d7a504f30547a7a624530444a685f623049697941513347743366326f4a3842766c5a2d5734686c706266333366535138697538797667766d78616256497931396f484b7267454c426b51554d654b39487073376543756f3056614e4454694d4d704549644263477771776b6967416f6f4739787465744a5450633136597742736f4543767a35614455346279304933556b6b4e79332d47356a417755597343616d55704c3670432d5462464b31584833786f5070596d4d4f47526f6d356d5a4f4e47506d4744386231705a3349525545413561764334364f564e307964427635397652304165633447474e393534716250676a79696c495865785a57634d6b4d325564497a656676733367623739504c3439756f5959355078474656524c75746a75315443514936766b5f6e2d764778576b69724c30486c3542726a636b56322d496a623361566f4e413753624b577558464555614f654a6a667477776f537230554653726c76344f66694c504b624a4c35536543444f545955573569624d766e76342d7258613068434e4e4c745865516e676b49616974784a63576646504149325532467246426a43364a796c4f70716a52615979684b477157716273666b6e7350525568413444785043335162522d464e525f7a65496c4f71346a3464454f596d644554442d2d77724250446175375769626c734445366576346145514b75542d623952745546534c77524f6e665136617873436a6172464c6359517461326d582d6772586c69692d6e46656c3568723462695873696b675f4c6c6448684f6d2d4255426e764243705a45714a3167306179396b4c6c574173756e39376d4c6e4366486746336b496f496f6a354e797167416858627577775754785263594f43635066717148387845564870394861462d5054513562496445622d705875395f7561686b6b73627365497a774e51744a4a376e7465444266585758497949435633693848733664622d4c71456171712d6b4c3763436b36364b4f7831576f3968496c456e376d6f375369514b386179752d62774159486a5579346d344136617032463263594e4d672d3948326c6367306f55774b743475717735417865594c5f576e756c47766c505f546936644f55326d4a726138527245673950653263324f705349426456536f43375777564950336d76665f377a7873446449674254527356736d7158664e3777365a31517949773637494b74306968414b384a62744b625644385366696a6b7042596433447555494a6d447a306d77544f394350534258574970775938396e77366745396d35675a4c5a4677556932697544546e335266535555395278574468414b534659696e6f68657336656a3874543931583678773637525645626f5a6b33336b2d6f484248786e51645259314e6f6d436644585072695446385643755665454b355f654d6c416b49412d327150586b722d76796b33697441393253454d724a2d616e68435158456e64796d62397a564259326d6857673364544a494177776c414f57394a3051584977375f74737531595972594c436c722d4a7a705076532d6654315a5950726950386e47685739497139314f4d38744c467a546b5041585664556a4a6c62794d6c4f32795838325073592d65774f6f36366f514e585a48444143583563546b55534a38635278464659565548655348353967463277692d684c45752d6c6f4235446b527279664f4f6559376b6b566447496645325166364d6f7233707a447136774a57713033337a5a7164394d786146424748686c424a75617946456274496f5f4f34643372676e574749467150313852575635702d47335446666b506d66415f764e624f4157445f6270346c44786774744672574c7255517a756746553276306558575a47446b475f6e634b4176762d5a356e417051696c6a4e63336167764c387a32674c486d64456753336257703061304d7945706d576b4f636f444c6b682d58634d476430725f48427a33696541735349416e4e56454b2d2d784b4269564638372d5242334d325055417a71797a653847324a2d774d385a4d735278566f587865776c4572543835676c5f44444d702d68784a5a526f343050574b3279665561724873522d466b58317058445448383058416a646e526f706a547a45485a7a79706b767a325939556c32756732744b5f444f425239645f332d5653584239453456725453652d7a65386534364a75677a5876534e464c51776d73626b486638347052703363694c39516e7468584f6759724a344a6f643166356a49533535375f526d4f4e64797a6f6b4746693170796233574a6b436b41624a5073656c34547072687a537374436b4e3367557a54416f37487745485359687331722d6d4477515771527a556d4b7575566d5034776e444950774d6f6f2d6d62473439765a375a624d707a463153384b41596e4e6d6453527a67754a485a5f6368616737795155505341535a5f617836584157322d3972335937675a535967424c646d7659796665447448484b5444366c702d4c546b6f56343253594168576a626b6b70323364715f4b7275774e3564567a56726d476d6f72764c5a625539476572554d48736a36314735616d31695f36527067632d7a346f45723165764242614f577475743345356f6e38665838785a36364f3138334e49326e464159577578634c736d337a6c5759686a596842622d6771734156414e5f72392d7159303763337a5449726d6b5a54326d7070337277443448714f2d6d6b3073706e3841486f6f5033674a5f6c384e65474f797075444d6250703675766e6649626f2d692d5a49586f765566494e573045777936664f644a41453950647a3837633933307730436a6c624a335171746c654b6f7030716a624a6f454934616a3965413152575a426e4a55417737656d5169484b654c6573424f6c53706767565a6c542d6a5169455f397a744c432d6e7a566964695f5f7376795f734d6a4646653751336579586c384e483064364145737a49576a524a774a6d6450776f2d754978524e6e6a716231763756422d696e52525263345a4b54),
('k28sr07d0k9qokncat2dne3ragc4g4cv', '172.69.71.51', 1587540914, 0x6478366c6162715567773875726d75424a5a433572394d616835496f5f3672657a784d4c322d5f6e6244585a31524e43716d797461574d59417131347655705f4c794a6b5a463533597746507a52665455723867383830387173467570624e63674469624734644f5732573134716b6c734259576f5677566b4d42574a6d526a51457861584f6154577a693957634f34426d4a2d396a765779616a416e35445358664e6f57355635765550714831624a6f65316764786c614f6d684e556b504e58723068765737616541515867596c304e467a62536149305a49332d7472516636435f62706c6e3967364d373170595344644f4f586c444a3873427862677868756d434c39573243584e54773775474e6268634576784a397361503574546636697132705145352d525467794c383067637336674636344730666d42564c3146516343596666735f346e6e47667a5a4a334753683833664150617146584741503774334a356970354e306c4c5347316e343130426c78674e582d2d74647636726f7837783079324b31506a45796b5a636b384d596331444f4d456b524f37777639564359386e78766457396d53634e30564c4b3765324d6d3737354444536879637747364275513335757a672d364e716f78695f44714b783247494436387278426a4355475163516f6d556f70714664566a7448477135693436326265433166487a416e665f384e30646c554365384f335170687154367834556434555148586e586852343374302d41494e536e704c45644d687573773164314c795f736b684b554358462d4c486c6755496468777668707179697a6f6f5767397a4b6b5f524b79354c5669614d4731474a4d474c5f65574b7078684b5a4b4e372d5647536d4374384c526343636c4344645542316679674b655443666477684e306b3134524c7076564d565f4443345f455a3368703043334e564344676c6d486a335a73756f6f5a50525735445a2d47594e55684c6456484f306e426f3434434a3339416e584f71507a34716e4d6d345f6536635168785065686c4b35455456306a5944485a4e547255747855695179687a3751526b6b596e6e6e684937724a637a34513444767069445148704172727876656c687775685f4f5a55577a636143304d37325942484d625756744c6174395950762d58326e744a3649586a7959354e73426670624f543774717a4932375155423542396d784550466b59742d713958456950305a4a51675f6156793773345068476a424e776e7977596a344c4f34397456654e31692d74347953783957524f516d3172526e37487749665a58684b62506e4f32777756384358484e7372706a432d706e6f4e795a73546e4b78322d7a707a39595675787a76384a56696d726a35687079426f316d5474574f725a68774d6e42706c57745268667075386545494368593236436d63412d4a5232455738334f6a726669564c5f4279685138654c646a534637676338444e6837635f425865666c532d656e652d4d775648694536363959734632566a74664e667446354b624b71454f4e526348747469304a423165364f677556365f4164574c4c6c4a52506251707949334177654d61705f7461774e53586d4f5235456851676a464147375a6d5955463770684766764137472d65726d594d4a5f4b6b793454584e5f4b326753526967784d443047617449395354617355796e3279536b69566c474459354569457279736d484b7a6c5f62496d414f357167355f454c574f634e68506536756455317068674f444241506b5354394d6c324e73766363384b2d437637496e344a42745738617447664533783641734e774d64325864566c4776683048623241734e59354d64424d6e326a65684a524d35446a776b63593431366d6b7861684a4d356d337a47547a4e6c77674e4f3770766e53313371695a4a37566636417674567143354f6c744e6c7755744d6b576848554254617a376e33554a425a6b316b4657515441784231415a4c4c6f74614d63776e416f764974514b4f496661622d6e663364397864784d367548686437435537575f6c7539493730316c38795133727a78626c646a69712d6c4b55685368362d5044625175587039414635456974463058543833775f787676707430616656772d30355f733159624e57794a344b34476c5666464e71357a5848464966316c7359314b656d63334d6f5f6e4e61772d504f74707758587a764f666f44554a6a594e792d2d676d315a436d63444e47314f6b507441506a4a326b6e6e30315449456857316c4b70736e79755135326c754b5a63554a495050725537335a38453856422d3568534b724a33687a504674676e76524b463432536f6f4f4c6241686c34393165624d594135647a542d4446486b6c5872384e4a44415330595135465f4254564f4f49714d49384f46767a4b70496835384f2d5348645134695a4c39454c4647367a626f6b4a346c49564b4b705a5831774e64416f666c64794b6a635f4f526a6e5771594951345f514851534a4e5876744353357249712d51786a3753525f75493444365857596b624174416d586e4c35597834587475416c33524261514137694b4b314153696530686335413632786f325261497135647131575844793964724271564566575f3831425158376c59616957414f3951437a6a5a433865564d584752517266686467485f2d6f78474d61795a4f48516f4650742d7358587844656f65526b36665562695239594c36765832757a77754973494b48753458676e4e6d50476b46354c7832366d75474e31386c53386f6a566c6a787533674b6447445a756331364f793955474e6743754f5a4947706569463630536d78726676495834305651326f394c346377763036484d6c417338476a6249673870746d3070725a62323558505f37593052702d747a7146445257517434323149387a6a346a304e36686d6e507a5871643048776a5a5577457545694263565931344b50422d3079734a6a473274416970586e636e414e376c4f6553416c795a546d77364936563177414f4d326b63345877754d326865714277425a4a6b6531625977445f6936666b624c4d48474a6432415736565759724e5769714e4474584d6d6b7963567734372d3934546d4a437434795959733838434b4a4e49384f7253464c53526f536f497446324b786c7444464474706e62453054487477665a474959376775557230586d426a7742743864625f7541545046396862766d72623851366b3870774c386c4974784331787345704e6a54756456615a4e6c672d635346324a5f3862684839695775615062517666634238304d49793743343868686a417a79396e6c6c3237466654316654562d6b4e73316c70747739636e6a665336474a675046784d5341356365472d2d5f4950522d6a6470734d52654b6f4b6d776f63367879554f4c41566c7574766d682d70304b64377a53726e705138585070464f5f37426462715a70454b6a324864646f656b625965726b4a6a73505352706772555262574843325637504354376331452d31794e65315a516c653066365652774964446b644e6c4351782d79503655674a6c5033594d4c626b454754416179775074567a5f4534546c4d46626877373557394c455f706a5a35706a69554357417a435f5a6c3030504870576d704c6f635844667647652d336a4349593236557a61324a566a46762d516d7858773234396d4846626973614275356e56533279556f67536457656364485537546c384838336161485f6c664f4d426a6d4a5a6170625a446b653868727876745a507952674d6e793655545a6c56776d39664a492d496b6c413371557a46796145335f7250513362696d7864435464667a456e475532674c4b333930465a61724c436d44774a59664c5f304f7432465841776b384a4542394f4c7031684d74787967576a77626d4f64535a676b737a6d4c6b2d57744134726e734a55386d6d324159615779797071486f717a42667549664e726a68726d684e3675355566346838394178787462724c645176647852704c62706c4343635a4e373751416b5f6c525f6b33744e474a766944783843525f596c6d554e4447694b5346323052517142364c67526f65745141663076326258574d614d38346b575f4f5445625f644c514549566177615133695a45617150746a706a6649374c426c4e7a2d34346372684a4637356d5134397a4d4f7950426238312d6338692d48436e6b79445367525767734d75596d5f3649366251506d6e62525a5573572d686c6b794a46685f557369592d4f4c39444249555657306a7839374b585a79616d494a653037504e526d57484c6f75535a35765855786b554148346f5a3377636c31704b744d565544417063616f6852594f746c3662496d3833333275756e55306c6a5a346f6d4d34694a425a695230704b35576761345257777549305a38724d546c4d5a595872566e55714a67774669524872755a6f4458705368515f492d7a4a785966533069694f354f5157767979455a715a5361665243376f777432533170752d6b34664b4d424a6e74445145436a4674484d59365235475030715635704c34726555745873306573496748736e344d4d386f6f6a586945755f4d42744d454833434f446d41656c386a72674b3076563871653953664f4a4b59533474797657335073756470324f37434a786f566831564e794b7739656e565230344c4870764a434f707271326f49474c30566e53666a5f5558576b553862536d686d45796b686a61784447464866644c70565a595348376a397866464a4a6668425777445739545f364763695841565f6a4e66364d303264736263504e646a4b714567613451485f714763767a734931767a4e6c413565764f6f5a46493369625a53697241566c315f4b68764f6651673237375a436168345644787762634c52363968454258527a43763630686d616e75796a4a5048686543454c4d34385a79686537724d336c48765571763572444c517736653545765f62526e7755514e7947633243324b76714e66494e585f58775465734e6475366f4a306b3035662d446562465532785f6470474f346e693752696543326e3466414f3870736a4d5464657a544d5a43726d32736c5941666b4343467469656837325f523254574a5a4c6564464355476f6f656767626f7a474b794e776a7777394578434a4869772d2d673150543377776b545f496f593877435641356e65385f6d70636e6e71594c38322d3145545137414c66336e454153315250656a365844425a643449646c384f33724e49434d776f53434f63492d63624c347855746355316a5130446f6d5539766e39696c75584d2d474e7a524a394637774c7a43714438754871747075555a674c4c68586d357842374a4c575844563957474f63445236306d4f62624a7535585a316a5f7965346e5655435a71525f6d517168506c5f34773478726335785030314368625a484169527a446c3057544b7979474b73395f4355444e383757564f6c6652794c3472492d32755a657048356a394f6d4550736453716d46436a495061456537487931786b5a665f4d3751455536395537644c6f397942794b745836656e4f3655644e4554575135366e566e75376e54506646446c316f745f70664d2d37464d2d584c38595a326c6b546b694e4355392d2d754f7a784757314837686f643862714d5f3362706331637359786b757153764c5364365f566e6646596f474b717336425f5550676b45692d786d62373431445a59554c58523173665842674e474e664d385a4565694f69587952715168317a7136694f634a5852774f37626e6b6c41563542704375536b76453433343248664273314536744e42304135755f6f71495a46714a2d61503233366e6464515163427943446933456d416b686955335f6d6e4f7932504f627548626c424e5a4b5765614f416f696f4d59512d734f38506e4d3573556d473659357277634b7343556b79706f59753444453779434736375f6d51416a6f3043736e69594f353161786a6f4e47414656745164716535647659506e366665756468427651495f325431626a706956353949707a305f6f5f3876744e52596f516a516649706644356948596c78755146316945474f483245535543385a2d5f4c6c4c6741667873424a514b4a44423937504a796c4f496775494e4a787a62477762727970627667727a527536434e3362683156575f4a66312d67556778535669576d59785535495a324f696e30727874645050776a652d7958574b745659473445476b70616d654e6d66434f6338304b38376742772d4c5f674e534a6a654b7963465a625672536d346c62336d396c645137627a51797963315f4d33514e413745713152677a614c4d6576343661724d374a557856685a49514a6665594537796249376d6348506561555336514431775a7572394575335a352d64537833446a623831345f36454a6b4262314e70365f64546e412d7863434b326d704c76733168772d6c703069527061396c5743476a4b5f6966484c54324c61474f61565465783869677337766643734e4734347769344569624c783379544c4c5473453456486f55394e646278336633574a46435041637a4959413350614a48534461396e6e4f5f666a504a3938375430423643684c2d7a315575694a4c43545946424c5f76326562397a627779723153415f796f31485f545a6d364378576253474a79766e4f5768562d7167324532746a4649627856784e5735687950756b7570747a425473774a323931755731506b53674c676b6d4b654f4a55424b5f436457425075576f4961683832792d51576d683153744e6667305a6d535336677848354e5264567a3347616a6b7934743457334f4b6b316945365669576b63426f3232384a6d31514a5547704871585873663149384e5835464256784c6448623438524e467a6b6b71374467593938786b5458454e3430336147323136485a6b76306e4949457377643843385a4267782d326c58486d5358327851703430686e304e766364793437494543326759706374734361584648784e79424448473844504565436c6d737570525865417747724f4f5633584175356e4e5853654d564975506269766e336b5a4c4f3857753639324146506d48506b456f672d596c48616a6665702d326c3553617271343778765a3132594754464c426d6f3548366a35454f5f762d46796f584378624d4652456e7732343578784e5863554d7334435753745275786b63534b737146317a6b53464d4f59747534384368474a396f415f763635337947742d776e6e4f6e7071662d474b4a71395a52556b4c676e4a5946527a6944433065484879714e3737434b2d6b586d52557a735048703034545171416935725968676c4b6f386639782d72724e4b583553577944507855346833564f6f5f794d4a487a7978677a767342633759596a61565f6d7869476167783647326f6a36356370462d684c636674763161385141675a63507158335443646158505a616f5a4347555064584745505766632d78687665694e6d7530556f3476394c44556e577947326c745f7a4e384c317069794261424b635f36506f4c357364307857446a703062505567795a4f6776594e46354877685f44436d6c525a5079536558534934494f546a45714b5277343176526a6c4f41463054494d66305f4d4249546a6f377852576a527a5462494f36306d4e42526372425249357578616e517a62336868494c4e4f4d4a7051535272744b5455674659343074637a54555a6930416831343742715f5837396748434233637a2d6c654b75425758486e73776a413054414c6261366c376c6d30314d5a533657564636496c495657396e434f67534738545762446e6938),
('2pcg9d0kg13qci4eorspuf52urlnssk6', '172.69.34.21', 1587541080, 0x4d78744d49666d516e6d6b4c70695f4c70496833694f35397870532d30723564784a66473379705150774739316d30787237496e70766175616f62432d4d624b70625936345a417a3979504555676e775a6e69316a546a656a7a617851634972717931634d656e706c356f3536715f4459794c346a53314c5656616a334a7143617164746c4d42324b5352756d656f596a3377695f77526431316a54414d356f514577684b333857336b7230583246647663496846396c667a6435327a614c7761695664556d35537a6179454c613337534c753941315a5252384c4e54335172576152665331645277755437656d5031694845307073647a3752766879374d4e745f6546617044786b76466c467175427a6b6654696855646f5069484f5568344c56566756484d4636354e3548365374575762536e566531757970325670784a5851495a30784459684f6d37723957315639505947753873324733704e4e7475674c57764237367879366a724147416e525673676b6164685145595137796e6d33423432763270306d4e434b34424c3431674e4341525f4d436d63394442794e76315835724f78504877396f72354162556456494b486c58743163635671784f634b643548635f3372513979662d68572d4277796a675039354f7357557a70676f544372316a52506d4f4e58695a6f5a6349546a4d775974615261564150716275415f67655165367856444238564d456179305a484f552d373743665f704e364a6246322d4d56586c624c5946786a7a47776755483577326a6c416d36705f6b75686347694a494366744f644f554f465633484255504445337154304b5133514858594772435838393535494872435a457847364f456c55744464685f637965443445564a4f4f78474d6b6f7a4f326132776c423343345147714a54796a5742584c5f794e4873687643316a746f5778543273492d5737585269526c4c78696f6b49724565454c7a32357654366b5f764b5357744136744a68362d4e36794f707877462d744d6f5037346e726a506752593066536530686e374f6135744b6a6e38426d6471414437637747624a736b3165665f4d46797559507050337749516f79594b7062786252685f3730586555717a4e4a447a4448664e45412d6d31344b2d666b344a62333530317174616f50386a4772544f35413659716348666c7534327775755447433155416f624630543878524a716363326837584f584138513355524d70633630384e435743464146385462466767453877434932464b2d376c7a486e626b4d5176704c335f3037355a2d426c6a77693461454c5031457541484d54552d70644833536f4f546544305459766b41554148677651646759547573324a7070697951734c4b6c7833536a655a4a78467749556c6e6b504258626154616750564e4d367867694875397251444137543965616965624f35593473424b315266767a6c6a546a424376526269396c7761707639746458364e386d437734554f45644a5730527a5666486631467667435a7970426358454c6564774532345a50585456366f323042322d6a3854706e476648715f346c6349466a4c7546736f6f497954396754347a4a5849585731386e326c652d454d6a5843616b2d6f5f445f62424a644f523249335939703155514268624b3841677675446b784237434a785954614532706734304a686255536a4b4138354f3774533357507267324e4832705f494358634c64684f39434d306e366d386d4c6e5430355154635a483569615959666341352d576a7a6c7063756741513870376f315768532d335f38665451503059636f3567554d4f49384448752d66576f7a3376453769794e426c354971487848374d744f526765466774644b704f7a3549687932414c42335f3447495043454b383868447a6f5f59724833444b694169304654455571416b3244796c7a6859365a69305236596f4837466b36706d6f51727665597834516d7a50452d70597445515a32345953366745527a71756a6c73374659416b7a50526c784e49394975433239556e3271776a43723673665068714c626e5a6d6f6973394b536e4f2d62725879394b48427937614d494c5379704878627756712d34466e345f724b597662496677764d396d5f2d2d373432535035376e414574554c694b38653578593177735a74695135346a673231534f6b5a634e55435549324e447239754d68384767332d4e382d425147367a4a4e536365316d3366516e68596c77384955516e5f49624a536e6b4a70475657537952337239385447545a36396d315a6543674863683568516949665a4d4f44324366675241776143775967315f7976467a704450755642786c74776d704c4f765464544a435753446452576970394938493033434343713467515538542d4e74675956503037554d6a4f534a455570634166433143304e5f6c4a56725737306c544e694968676a64714b526252764f5475575976664341523253353852627370797a526c584478794a55366f673256574467765568593438366d6b326643486f3037797165422d3166744568564d4d4e776439625659764a6c3966505a772d63624a4f3779714f5a56374456654b31705a5f65786d33757962795869517758587647437641386c4e6652307375324e574136374938754a4b41383268524162634d6175395152534d6a45544a675445565f387278627a5f326a6d514e384c4d7049466d646b676e716b584631414c6639734635753743614d54794937387a70384251784b3670665742556436477967686e6f48596f686a2d4f4a4339435a5235306a4449394c5a687273724d69363438305468646f61394f46435a64796e4d554176364a76305951414c31794769354f704663644d5f363764384f455636766e573837576f466d686e497a6e6758554447336e47624b327167576e624c7372386e7575754c776b525a5f486543534261497978766d6649564279394b4b4756387763536a47647a4964697769674d304f7a6e535472387667784b7547664a727169695f54463542566d7a62736b754a36574564384445653154654a304e396b2d6875767045716b5376786c464d427370316b597a667a2d556a625867587632447378387752564c437736716667726150754572354e565f416c6b3674797372434c58346743536b6f315874364737506c4665667354475130306657646d47796b347246485a524d2d626d3070774f426c514b787636516b755362625f566d3679505a57556c504e796e52415f3463627a41516f6746645076663041456e454350574b444a76494a73796c5953596a786346614b6951564a567672363365354333512d45753172443131675a5368786a50356f5153303067314554353674316b427552525270527a2d5241656157567145584d585a37586936564339477543663370534f6669656f7743513879455f516d7567486944586c7a6447714f6c36536e36575f31323557594e5067342d684a37502d5f43333048756a735233356759496d77436e374257764f554c3472317758314f414e5f67595a4f55316a6753666e7a366a4c4168387857364544735a4e7a66347165716f394a4732794b516e5253357578625a7a716264314a54387a446c50356465684377726f5248566d364d31377339712d4b55722d55555277654e35616877384c6677714e4f5462425f78397176527839723950675a5a506e384966474d7763447773516c784c62716d6a70394c493431454341477533736848736f76656e69416770515657736672467466686d644d4275475f736c5a3872665f4b78724642464e4169644f4179476e37545f68315a3743373450554a6e636447765a386d4259514f7a41322d6e786852677357366776444742365441314d444d49784865316a694d347143614f3932663644506d70485234453375674a754c575153734b305778584936594d4266667a2d7969564f58644f685231426139664e494e496b704746512d36586c4a5369715245736d67495f394b6e6d5a523955516748785a4e4747304e5836375a6c31545556673477546d4764415f49326f31384649395054784d654a776f447775556533466a39426746454179487659682d45486c4b7744536c756c68636b66577571476f35473850726149643733314d3362466d4c6a326b51676a51616d48584f367a39335548686c2d4b337161617033306d584242457971307a686654673077636b583937594979486831495a2d55393877456978485659696b713775353272366a6f54744f6837456133515049384755644162636b2d56695648324768545f6d7a6d43573077505975415838346e5758715a5545383377535449745f7a55786967556b4c444c437a715678584378686332764d37517a75686e594559447332415a74687435467348546c716966664a6768737774617473307633326839777847615079536c7458324a4f4275685f753743527773304d37356f3550544e326178564c676f56736356775239324f497268584a6b354c304357354a79774f4c34646242304b3542586a516658756c5f6b4e4e3049384f6e4532355161656a634c334170385a4c6b536b5f515f423153537a6a474535686b43617478526750595172476f69592d6770627076544656675469786d2d37332d6f46596d6436366f4332735f486a594c7447505843656b344c6b7265427561426f39384c7843732d6f307572753947494150794d685132796830674f526635655337584570464439504a766a42553551494136654f677a57616761726d793277624c5139536d674c565738766e446474445850736d7265474745355955494b3357596e726b544d444b706c516d644634446a7062635f544e666a4c425957644a6a504c316e694478354e4e6161663438496156375438657430754b48733879356d5854455a474945654236464f636349646d727832655a577a6a62397852545a325968613278556c4a4578316f4763636e4c4d737a6f43614473337241594d3575493861752d514d4b56756c76313668574772366370637a6d77385544516d6d41493678396b387a314b77793977756c794441734d724f5030364f6a35565f546570386163306a433454446e5a664333646d6c586b76635a476d614c51376f5655693057616d76424949335a4947546a756a7871494631366147784d5135682d66353074387879464630674f3575793164685543507345514250354653514b735f41437a487748654452337874426e6f664e32786673536d6a664272346959454f677a344249772d677a5033457737327a3867594a4d6d587a7330335561316b394e70456b7442556b486e52696e6e42596c7a6d353533556a6c6876557774704e5f4f7552705364734c6864317145304c4e395059646754336c5a4f6a714f555436395355396f6b44684b41485742736c7365394f6461516f305563647a31716f5946597267536c6c4f486855415156706b596f78717a4e524a475f556c42414f335f79617044686954346b63316e4452354b56487a35755a5056694c2d6831397376544b6d6d62584a6e55355f3061515378777859534137475153466f5f383258705a506f634a782d79724b47415f6149463358597873556c694c555335564b766736425064664949304f544c72756a5132474f326179456d4f32784330553930304c6c545568366a574f686a79636a79665133357373655f67736f597065777756614d352d5a546e3072552d6b494d51794f76714f3435437767537636304d5a5a645f3470477a754e4b33646a4155464c4c4f7a717749584451785478664d6e645a61787678792d6a785550574e794442486c58384544395a383046776b3566343735324c64506978595362552d6b5953334861423962326f6f7062374e7a5a714b73494178616d33564d39786a32307763416c5162466d656d4363555668336e564456763341744e326336637a31354f637a336b476369483531715f694b5146664d676e76304a5274562d44796f6c6968324139567241347a326550516433387a61787043413238574b7165432d79306f74337965715a685a78737633514e3866466a6446546e765f307a646c626457462d4647386a726457306a4a5f744563777669784d3163466279657a4a384673744a4c713038686868784d53324d6743633943486a4f6765634a426a307457386d475f674970345a7070724d706d5565786b376b434937304833503534303465495a625363486b556a58334f5f30586337337452706d697945584333725762326648326e784c316c412d6354455f773251564650495232363830366b6a564671684542614641564363726a536c566b79652d75565561424b4d39344e674f333070317a754c2d4877532d67355f6f52585353677a4a6451794879746d685645733269354a4166586a635776764876474d326558724d69794e33665a336f34567a5433684979554e305f585f316171443546724a736a2d58484a373251776556475564313030655f366b47496c6c546c5639586566526a546c5a3033786542454f657259535a7133342d71535469736e6a6272426b714c71705363764d635251734f4846725f32625f5575424a707257696a67504e4e54505a59646a79567070352d7572785177644d41776b73504f36384c386e4d5f666b72592d5f6945424b51586c4b376e526f52555633784569755f457371734b6e4e58447a31487836496649517a616b2d7670775f784250786e685a5a466d4d6d6830454c76654570476e2d5163774d3853656f5252522d323476595531483250687a4c76392d7139616a4d454576534f3153462d444e71445a754a505f4b6b7944514c6e7a59574b6d66687346364f6430665a6f314b6275736f4f3953754363364936497a4d7334687871776450517a6a666e335746395335615a57586e44346d427a4f7675424b4c4a7a50623979367a5744553035315f5a63777874414d62394175384e50323661304c2d74736963785a7353724579706f545f47783953574b4752307131724c6133575358587057504964393655306c4171516f52674f5875495f704d34577658785f4b7a555350514c3774727a432d4f4b76417575485f3945464e51493462325370506551714e6d706c536d76516231395a6d31524769566f2d665a4e505931493371475561437742464b5132756f6f654575316869494b3430374b6f637052726950466b5046482d7669484e464c6b71636156643532734e4464366547615068323477373376644e4a5335396f335552594538514270695f70312d456953757234745242685f666c374f59435a5f3667775f765f4a4838625a75626f393366392d7a3035596b514a4e4741306b5a4a2d6f706637505532464b5971627951365a55366b74634a325654486b70757170726d6a6c705a5f683367782d43597147554d344d3577774b615f6470704969666b55725f5f715f76334e77634a42444f50634234644b78706e75644455344d4b747453496279315a686b6647564c4e4c475831576a385f664b54706c3249306338636b36664c544e4f43797a412d5834434f624f65504f5568654f4a583759447365336854482d6a694852784a75436849476445566a314c4c724f774c6c50485853677a77593649466342427463316a6a664137675a5470514b32487939684f4a6b4e6a445a3069747148585577397344397832616f52466d6678335942554b64316d77437a485779466a6a37562d5053637365387a364c4d4e373956563475434d387368734f78684f6a74354d4b46546942723970716b584c4f6b567669744c6b426b59644a492d6774446e775a2d7455516b76746956494f4276423971746b5871394d52654f59356434314f7a754a706a754a5f4d337a);
INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('qlhtecm20j9o67ukq8q9ttuso10hahka', '172.69.63.52', 1587541768, 0x3277507a59537457386854556764326b65664743646836394d68717079325f54773050686c6a515846667174634769646f4b5f516a4d687a7257724342416a39375a6a3850594e4b41784530674731317151655f76636b736b41386a5069634763627a2d734547506876727971565f6c5437744a4c714a6451414b506d306c4a774b4d306336726c4a6357437865427038546f4945437a64366b704f387666526746767838456f73323437326d55334d46793038715a49556274744831334d6d35536e7243394957796a553078612d314f4c72576244526f4e2d707a59323938464135755854356a6c3575396d6d4774616f7157716336576c573838306e61535442706468565371333174664e466b6e3252437074556a366b51357a365267786a515668396737645f386f374d3253375f647336576774495a55756a42475f3254704b644937394664496239337470576271316c5f34594d505147346267636267783853336441614e30526e553732396373557a486e58502d393459616f54316e395a42594d6741414e38724c4f7354374f3565716548446370664b684d4b736f75645559664a646f7849593479305a4b434f4974616b31366d764e6651334352326b65785353564461723974733737505f42455a376d5849734c5a5457446174595574443858794f637a635577683779764b34516b43624a786373335839507166694650725144445755737852396b474d6f50324557494e4468617342474e6373535241334b6f674f7a324a3365386458546c52676772484b6e34693454423435496450735a4e7a45585559776c6a58534f474c3651654e5a726e464c2d46765738386b7a776a764e486548327a2d6f517642386672536c6c566876593038644764785231556c636557614961475064666631676870427531375a596d6553584a42526e316c616746563131623862303362796d37574138794577516b704366536e796e4c4c6e4634467651446c74617733567768453841704d355665304e452d4273536a6b735f504b5747583866636e536c445a6c414b484c496572636d734869455a58483857525076706845736a6c31517a6f6644794c46766d42674f796959416733424b3359677a695267394752787a6879653642344243346951346a736a68593362735670433042594766712d414d6a524b4f54744b7851644157464a79426438434c6a5a6d524a69574b725030566433676c484e6536674d43477341786864395f6537774b555568646b6a56574857564972516878305a2d3346316876444e31693061463554767a656c65795274354a78413873494a68465361464f3277336778794633336f796c50314f7462635a39456f4a645577727875652d317854647468753134315a37363541575434467435567561774f6c564f4f6d337144326f52724a5f586f7975656233384647624546746f4730567830766737785837674d7369753046706f313432535a6b7377755a333957563464456453764e5031416b6e6f3959367052726f67566244314851695f615276764c506c356e737539644868556e2d4246636b50384e34433344466d567a53764970383858377959426345347935543077527257416761474830666f787954667379347050656a70385844366b6d5763646c484f476e50476a7246426f6f44725a307665746a644b3570734c474451555332577043477877324d35547357356d47345a5f475a4d567043304f3034517464763878364942446d496d31586133744b3074454b334d466a77747a4b77634956706131496458395168507a556753746e7a36672d34702d4373515f514e374a3848786b3238357a5641726f697a4632536f5a394a2d4f7032547064486b41426c30793564665654774c5a7546443154615f4633354e4a7a63324837665651516b6a7464625f6c6b3773484676656d7a73384e4d4a5363744f6c684e2d677a5745515478534143527a6867495a4b6e65546f666636556b3669307336684f4231386871634a6363314447644a6b6a6c6f714336366646436953554670626e615f53334b5a4a6b6c4e79635074585664786a662d68546d73787335546f355038436c637a464c72506732356f6b3651337253503639767a4c77635630355f3659526d4843615270646b6e7050744c4a30576d313044597666717049336548797957676e5a5876756e51707844373466435751434a755a3076486c31704a794e7a5a3057416d3149375f784b2d7948364e73656f31304e4f4f483644597a687948724a786c5f2d566478764164343066427069474b716f5f655864654c56544e3877506e715434594a6f694f4141546d42777a7a6f5f63565f7936526c45586a47386932426431754a6f55306e6658397259504b5f7951585234466b4c7058476e4f6b45567757696d3047325f6e5955347032393268372d72756e45757871787167476b447979566131324951436368784256326b436e4b44444947776e5432326f6d7065596d7045425a4568586d4d5f6e4e444354656a6677393832393241643062486c4f6557313633624c3152324259456643617249685551615774796c734359554c7271356e355a4130446776785965756a595f62443243304c4f524463617759575642774b43467835446c63304d634f763054595735777a326c5667517378796730515072563175536f6e395631533145626c334e546f683355666a5572685079394258524f786a36686857374f5a55594f45657354315a476f46317a7a314d4f675a38684e645a5250777431765a445762614e4e793450536e717a5257435f3553516d5437644f6268734256344e475969346b566b7372367a5a51613963777a575a725968507334375237324c7a3338776c6a69667674333942486a747a7a463359324445557a493351736833452d61427932664c683844304e7269326a4e36347a4233484671624d49746858384b357a684135766778766a6f7672417731762d4c367a336b46544e5939735f733739414c6d397061754f4a70384a76593474384e4344424c75394d63555153717361457a6353457756583369706f6c4470375877646f676765325346644a504356337979525a5f766a55776b674c7453674e5f524f524c7669565a71685f4748514863535a784a7865794d64554b376e7a53644d777a3561697465324d415a5045516b71386d4f7939643452747855476b773063754352617341706a535135714f787045306932795f4d6a4c385470575f49306430536f6d3376336264645f395378326c30555846395537786444766f48734253724c7642443061695379696258484b67423042745f5f594a473855744958594934444d3032656253596c474e636d687876635a456b665f65534852484c7778433669654f786b4831445a655755433674355f556572364a5661446d5357524b5f4a797965437968597349694a6f6a6f426b30385658716d6e435f6970493568426e335a55766d61444a6435507144452d327357595051705a596f596a5855666e67334e51774c6a784e6771307670756f683143326b5767514850775a6a7a53635a5a66487a38727567705a4738446f587734707775644954774971716f487772386c6779504b6a787a462d5572677430716b30547974755856556d3141475f723856384f6357383251675567664341357a44586856533639324e6f5f6b3856745f6276622d356a587a4c4343674d756b6847414f346833544a344971464e5656306d5659456f43427250493977566834567977397a46726f6a3355594731454933562d496f30584b66627156356e794d36635853376438754b697633743533556d4559375574694c686d4646323242576b66306f412d7744702d38557770504c5672454d59576756356e5439676c446f41735a724b4f366f554530445a69506c4a7a4d4c753654416a336a4b414d6d67363355445876366b484d724e446e78746c7641713265414255474f4c6c635a6d6c3954784d466564696c4e7135505534332d476543456b6a77324e3559556778775664564776595f75465752736858355977574f473879784f3469744b63733437356f4e5259694c72663155366e4175735f55735f7249594d656177455176456f59324c6e48612d4b756b4a35677465377541773775356a66746a5777724e3137466474516a696a61776c58355562302d447874375968312d6364374f614f7677544d304a47766447705f4c494c6c59735a58413042656b3036692d494637676852666861484e7854764d684c4b2d6c67786242725f53486249704b753551553878716c6c7646394f614d30756843564931684736536f63366946365634446d496f464d4a6b73644e597444445035617751574d5f3963446f46374162582d5262796c68397755357577726a476759586964665959645063484e50434c356c707156656d554263653079324248477557754150572d516a51375a5a5942347a646e43684b7a536f594a7a4e33682d345f6c737571783354487933663044424267736b6a484c6256544f717935636b7177436b336f4d7a4b512d513635665962374a614f3230614b326c67704848345838576567794a7435304b354977774e596649324f71626f546555624f6b495767524676657a473946474336397258496c676167455262696c70685a7535693543477859593534316f68634d4145645f77494b313436305771306f35496a34705338316b43655950326d796a6d4c6e3946397a757733546d494c7638664953496b7a584b74766b306a62556e5134354370666469534b66485379614151476653716d485672614e4957596167553645367277764d317066685030674c336577585676703576466c4d5467627770312d456e487267413344444c566d71766a5452414b6638682d59324449616d536246647870305f54535278435639334843356c5f586169764538427239384b634f4c482d6b523532685042515241336b65415a77437675366e317878776d5667654571744b4776614b4f3739724377546c6333675437476b6c6e4c767658584a6237394345796d4c4742534c48324674507946304c3464573053303771466c4a56726a333479573161495757303474354d717133494e495538595a44356d5533504e684e426a4544446c70766852346756315a6d7654466868323943427243736a614f3462653864616e383677673272336979757a675168375f7474786353304d6752684a3138507277484532525071623376506d5a546b41393156306c6e6e496133642d4459646f4152675935496e33725752576d7639475039684a4e4169744a74774c417a4f793956507174374a4c6f6d6165377748357539724a63346238655376674465646270774d6f34483964416d375f3048524f784b6950383363676d617a6759477033326c34504b586e36634355667665574c674163645f557a4448347a342d4f7a71656c34335557594e5f684d5f424b36616e685234457a706b7938536839557379675664496f72334734746d65596d536d676245784b384337626e56694c6f487a6c662d416c5f6b6d416f437250374c7a324f3557363438314b39627a43786151546f51765072427869623764554e442d48724675445352586d45427438587265734e392d7569425470614752426774556d76454d6c7768704f794a786b7258463055317030696a7a63415646454b424770385a624531566e676f754a727855414a56463652657a654c707856535a437667374237725477775f32396b66304b746e763530747463764f33655f543536534d63774d5f42344d526b70716f34776944526e704e5365756e6f35724b6e7a31467433774e426c4232326341574c3078344c77326142423658355a6f5779377a32355730693232584945745749524a59336a672d727345304343754734774f7a5138304a62667549572d676264315f526e6e527458753130486f42674b6e31595f712d4b55726b4b36615475476e49704f7851366251695156313036754f3569577766724f31796838347838584370325f3971317478364973394967726b3259765637634b6247732d414d68655338773839797652674f6f36643639674f444755564b6d762d366d706462315748563934484c5355736b5f4a37765978654361454f4a654a465063634e437861717332616f576a3456707346313534416d744b48454b70314b4a5052483231506a69343336547937333552573165385f384a513356353777316941374e7466586e5a39696a38793062344c755955754b3744486e63326375736853466154716c4e507436304337504f7171565f5f5f6a4c653742794934345a7743565549716f6e445a576665656141615f4f57537a2d6c7043696b514572394e734c6c726d6943485452357148696a4f663576506e6668624d55714c584d5858676e5231525a4641597435594d4a38734d6c49363368304e6c6d31526d6a715f333566656f6446736c37687555374271425f624a32573352735939786e5f61416c6b6b5366687a65465739565a584e41336f3476526f654a76656566364b62494a554e4f6276446c5664586377517a717a654359614e325242484a5a37714941792d76544e796b414959536b377975696d475a73336a37777141513241525a394a73656a4d6173514438795453646c75336648386d2d734c50306b53576267414259484c4f696e374d3666596470616c7a385952525f42453635677177707748797876497865694d77446755553841417a3573696c45585633316a775f504773716b345654344376444a533537434d69486333385f4a374e4b74657953775232447a6e664d4d32396548544541437258766e6d5a5948347072463679537438764264596f527332526576693949583944594a6872714d5572687558464a7877514b516b78704f4c6668644969433579422d656e3133345f6931507457743253314d46354835654a74596369577965774649786b6e5f54565242375a343046397a505f4c7a73636f79365163422d344a5a744e7751484d494435546d68395f6333465931507a48424c6d4d704d3837614351594952735f306a45306e6e424854733753706363343259396b654c69447a5832733947625f43394c58663535695f6c754c55713271614a586c70794b37492d31584b356a4571736e5958775672705a2d485967315a4c4f7167394a56757273364e6841355f56325f35463851767064705043364f455f4348334938535036376f685946425547696d6467567739575947646372656a636e736f524b4c6837326339654a5f37367561506366416c6b4c644d4743455658724f4379707877506e4c4846346c69724b4b7a46314f304f4f626b4f49633247314d4c46516b594865536d2d707367644d394733394e704d49596a6f75785155396c754f764868755146586c4544413546397232626b53747a506b415f33557a49653572763174495156327161557a306f355f4266337253474579734878624b37354b3744394f67463256334b72336b4d7537657557364c44687151464e6e2d734c7938357657765a6347377163494c77335458755f56586c4d6f7176445041683679526153332d522d4f7479416f4a596f51456f303748575565384a4163324142375f4d3549727a6864524a50506e796e4a665a53394f46636a67414f564b397a593035596d33616351734871494144654f625a6459376a71783648724e4731734e2d452d5137556f68392d324e5a5272726f64355f486f43336c706c5953675a544553766f435f4a4c7a545f7a536739576f36765844524e67636d536978313143652d57746532484332556c666b6959525a65666a46787a49396d2d6e744962634842337a4d656c726d6a3144536c2d34346c3931476e446c64783062),
('nnhp92pqlefa20ts6niojoiic3k882a3', '108.162.216.55', 1587541789, 0x74595934555574746847426a55576558583464505242685362595368546d566d444a637966567a516b3246595a46786d65646c7052765261716b714c73526f49707178647470496e555453776d6565554f4336464c6e5833746e6b5642595a75446771666d593546754b7636496b73714c35555655593671464c614c44696737715930646a534445776737495443567a4d4639564b77703165513330313547424c5f6d63554f3845653674335f6e434561627634424a3749534f756b48656f53394c615847506b3957544f71784c704f5858674f5736486a714d525630556452614e6234584b6f6a4d644d415f744b7066336c52642d6a3558343855764977715a78397847507135565437764e795a46464844556e513238686771524475615a665868785835646f666d596778654a4b7761416b6e6e7670437143766c484d6b50707656495f6979305379707a4c576e3857743570365131305275384e5539305f513565362d64516a5074386f5a5557704b5f615944514a4e69644557725344366632486d3163354e457274716c6c6c6a6747564e75656359384b48617959393179496d2d6f6931454533617a6c343445557269685172666757475f396150454e4538655f6a646a63656154754a6a637a364c327a4e62775468676a2d43343361412d347a796650483471506f767a59387042545a38724b4a31664c6a3741504a78692d616a59584767686a5a315a3947397045642d6d744465774b773746655163744a526971792d4166553250374e50663272515332675a6d4875636834414e6d5643663850445352355445386b646d363564535a7a4a7971584a7a475765366e6846537633796f3530413445676d5748784e63525250786f52756e50373876356a33766439517256734e6b575a4d424b487a485f756e576d6d7838344c58624f776e7a765172776b695a5f556e6a6b737552776b7570395971627a4a756338544a42757358336b7841784753496d36626a3735566f4f5a353772503641786e497a7975566c4971734b4631755530754732586c75757970484e6b6f584e68306c6f7962516e4a433639726d714a33735478436c76696a4c3546325a774370444a724e6a5a584d53616c46744d73717856426c5566306655487967643045586156656439376569354a68725464612d33584c3431536a3449663274323248786a72714867654761476c576f646b46654d3039667947434e756a6e67456d6f2d644c567352346c4478534c6739446b5f2d6a78314d5956555a56684a4458596f53303364373146704e6e6164634f7248534e55584862324a46424852566242396f5f71714f62684e4d624a6f41793161354a336a354e54684d6970736f7174734b6d566f4c37476370586f47453734385446684b75714773506f4a3049793763785358374a4b5643716c715f3158614c5a6a3771336955574c57334b5255644563725f304348755f32773579635f57764631596a6b467248376e436b38326353695365745275774d39525a4c343635437546694171623547785a5a316f6b36345854456f3979737062794c386454384865374938484a3678703065625535437435503473655165746136696b785272357170477a4c4a564b5344484e693558567a38394f62666c654c59746357336a75506b5f4c373539412d5777756b713655416c57424347666350506c42627979715a7a374b426b7449417239493634344f576d6b725a6d4651456a4f794a56587266755f694c7251494d39437a4a3849594465337250676e31774158366a7839356b5855784a763952366b417a61705658454873485973306e6245687631573662543363413745497472327845677a6a516b784354496c706d79674c324d77622d535a7965416f674f32754c4f51384d534b46624a7776624f50753472325679524649546d35557050544237452d705a536d737a5676546e3478505447774b782d385f4e61694778527868755862576a7057707334766d5974695a5255686a4f634a55764b5264414e524f4330366c32736569545f504b6872643070654a77507a306172487550634b31354d476775304775355834794e3547365757326c5f344e37637950527449373641685752674f49324d483849464e48726b5151316d656a39367274304277557848366278445755463677714e4c4d6d584f38554f345453414b3245525a52504242724f7878517232684c4734724f52735a4d4d4765614b5a47344b6b446a476678336f6d446b6a6e7642665f5a4757447536445f476e7966684f5078557a72427433794870705f6b6c54435676746f6e584c594e7855324d4a6351497a573034774847396a6f7a474b7a574b34416f2d7667425f6f786a304c79486e3177566c5852524e756a34346151305a593666626f454d6e3471595a6d573946694d376835746333656b69326b516b5931337464346151513056476268754970786a7a517567482d7969443775594261376d35354b615a505749524c6a7366627a464f5150695f616e6f694462454d6e7574323257334d6b374846764c656e36796978735f50714a774369495138534144533941354c556e724b46735269637953747971694249645339617164456d725947625037774f49435552536b434e70517a6c4d72705f534a6c71505753554271345f4d79677552375a30614c573965486a5347695a494c69476f7932394b412d6270547955587a31444e394357766f6735744c735a6a556b3063597a6f364e694e3270494d69545f4c4f5061616965424e5a4761764448743441547661392d6c78316d49676e4b4f53456a7370333950505f4f75676b35496b526e637a526d413350394e3153466e5f4761315a64625f49566c55527a4463645f4b49787238554a2d77454a65434c43567557365139724a7a596370384a444e7268644f5071353267496a415f71796a3765346f5a647438366e6d53413168346b563854707a38472d7a6b6d6747486775586630443946705f6d5f625043646149734c3977614b55454733504a42665571454b774d4f67614972576c4a437170376e5432526c656c3432344a5a724b516862767157333663307159474b6d59693651783378784f456e6973352d4e36423074534a474c536737725a596950435a6963447568485a4a484c71674647593250686a386c7a366b646b565431717233653534325a6e734437672d69466b5f79576437546775733373666b542d65744964552d726e36383451315f57577a6b304f59724e6b4d436c575a50543245326f65364f665643776f7468754e4f3851485f787756765451566d594771467346684d546b764762353471686432554130644e2d50616a70383836316243472d616a44335f5766373230552d535f46584270425272374a584548556a6c764778696b6849545946504d374470584a586c70616b6e4b4373436d7045376a6e414249304e4e3657376f7550516e71635134437136663477453749585f755f486d694a4568686e51645f5a3747416e4f76695933774d2d595161596935576a3463593965647a6b46373477766a584b774a5867546e6d70785a395a79615364753633385a6e74554d6963784a7541384370526a4f736c354d4c31653561524f5154506a636d41324d4c617272534e4539555568444c6874535f434655684355595648716d7341635f3665314c7941546e645770635672634d6e366762522d7572726d6970586b614566506d3255336c44726a37544c5334376d655332744358757668545652436f7730416a6e324a6634536675416c37327a336576687846362d70336f6938746537474635716f714e6b6c326c35426757435962394732373246546956507a6c5239503744454e59765f74724f6a50323463674b4a6234626676517639676c39746e65736f786c426c344553634749443354744d76666f627848363756645958336335443233763345714d774a347464686247564f36666c68325a75474b766b3544522d467a4d4349563959306d78496f62764b2d515f6f66466b7a656636723148376852485f43304f4978437865707077424a484247303541765454546a4a4f59764b4930643250703657695744457964556e715343753946374f676a614d37574c4f7475437048716c47676f56387a34524f364947767059395f752d7433424c5136545839366f4b6e77743478724b4975484667315067726e4e516b6e377570455f326636634e424d6d4539333667533275667237784a5448423334425661514b4a696c476e5a30354b4a5273316578655476627654794e414a4579796336335438525141474273516262753563474d315132696f6e4679474f666f35684c4239687a6e2d386b434261746c4f416e5f43766347455757555676353277556c456e4f394971514278536f4a4273386d574a47723174346a6b4e4139486462574a4f5f544963346236756b2d413679725579485a6d6d436d574e706158323850786c6a644a44413230684b6841456155384341707163723265566f6d32334772564279516b413044636941317768694e476d7a3478725a716142554262505a677234776c38507374556470732d48636c79546476745272376c707950517a5a6c41716c36435a68497374704735584b53434b737934474b366577485348564430344b51424d304b35466d54547059706b5943394c316b586751456c36794c6d4a506b64515570664c75704d71356672357a7a6f6e4d4e53724a4b3837506f572d46644b527a6346794838454436655a464335745372353754524a71796b613475434b65414956427a573834673534694f6b556259333734305f42576b75635f6733396841513841754135377046787154736e753575713056304e38444d5672392d4c5857317547582d4c70455569716c72624264425334666d336b33686733633574367855685668316733387a6c745863505334486336725f4c4f6a77355246545258426b5530647532437258504b464f6f414b3068765152553068765f32474d4d6d36484c504f326577314d7252774147654e42424b6c767a7664346d70745f684273534a6f7a364470316577636e6b5a4b695756654a343366534431734474595051374d74424e54686a634c4e6a574a5a2d5f64447272663638554b57624d53765a644439746156645a3567774f723673456d737932476e534b715859676d4e585f4f63304239766f3371727a795a5550416535325a3534737a43414f6d794c79644e4f75446a592d53774e6c594e334f4b65666a746267594b2d4e4f756d4b5064776a4e7a57786a30467441557a655f4d324e4c69496371655141782d75425659705155324f78534e5a5332386a5f4d375577445a42726c7643664f484734685a6b766e3630514a4d4a2d4374564e423373763162785f55587248504e787a5f6c6343543370476c3553734a6d374a70537962385458314a4854536b53636a5552553162466f437647695674515272304e704237546e655245367830575867463862644b75763044516f71597752434d5161785677396c38394478633447554f454c4138716653306651752d544b705151616631426a4745354f53304d3132786973486d61724734315755693344376e71766339616c4b6932444e62674a796531304f526848427a4b49756a2d4b59344a6d643258714332674236334e33703864704745547661354b6176706d71734253514f6974493858533755627a4e68564d58416a536d63304577596677767930695a7a536e4f6c4338726b6c635f786e6a564a313452655649446b33376d316932366a314f3464676e4b4245636d49335253656232574d576237585450372d4734732d72546c426737386b5443723434344e6e6b753347696978524473456334676471385162586a4e694654786f474e7447414779436547495f6777796e7568684b335f4458395f4b6956373034594d49506d4369314766796577514c77794e5f65646c3254764178563333666d526b43443469416672446e764a7772552d7939562d4d5666454d6f68616e43666c485846436b4964686a734a47326d507663693359493954464d32583455495a6d30764e3257566f5f4b665a5466662d5068706f346b396978715f3437733968644b4d504f2d444e6d767a6f3939735f4a7973684738483632664f553173476b7a5f5a386d67734c66433048716267383873533168717774506c42457478766a3741726d7474446d4c58634a7277326e7762636d2d6b715731325f53784e68446c6b6d4169623230636e785a47416a556b3349495f63494962424556536d444f2d465f3167324d654d6847495f49524179455469394f5f3362486c37725873724c523671756f51773879695f6176543131704f5364744f47677935303946567241704c3055694b354f3765754f525f4b436e73662d4136766562366b63306d5f676a79533731443347305a4d4d53373636387a39395332477933473842506e7331366e6a374c2d33755172596466785835414d4b5a575376576b564244414a427a7243313148655a54624d6642564e52634e35694a434b52636e7a4c71537756624d782d414d77526a6d5343715366595a724d756d44685233343249394f543779566a5f67496a547549493043674c7259377166525a483845736559544974647266634d75695853664c4c61585a6e392d756f647637356f4b634456502d3664636d3671764c584142687053784f625871653042634f4f384c4f4b4564754b71417971497642694f336a5a306d36376f655658665230656a656f5672413631587170564b3068666877794a72316b32775278624a74624441326c766f70555f61424441643833464a336e6644796543686634685f714f65704469396461686e36704c534e657a63354c6a6a726738486b5956757062664866684c6b48566674447a6463547a525a4f366e7269707863783243556e576250684f79652d5a31625131685f44416c5443454d6b4963784d5a3768612d2d746f425235713830693033305275336369726b73476341776c62582d4d456158766e44314c594d4859637553787757346343392d74346b334879573346714b2d3857326a5139502d7a71672d4d6c455644366a41574e376972375543423463714b6966376f6c6f796b726a736d6e795a7576644365492d5a5a6642526257712d314a7a656239476a4461584a4d4130644c7973557a2d6678777237513372744964797a556a514e30657251704b4b47586452697264756c647547314e5878746d6c45644d754356446d72534e796365556d5f6f766f624a4f59465777415547384e5f376e425f3131374e4346504d6d42784b437761415353562d51585837774773384b79525853705479365f2d737470476c4769316e6d483230597953675147364b6561327a4c667834625670566f4c32585a584f385643332d79445038787a70344431466966774975363075613237676941336135464749795673717178386c556a76414571366a4a50774d4b59494234524b625f326e2d415f707a545864465330506b54416d544b793479307731795757744b6c526a5652434434765f565a4d4d4c5231596f34484c535a4548506177426a457065725858393054314e74384b6c5f75523052447a2d61675973392d536468434d6354357172417134775a4573547348426765662d32636e34547633475a676233505776675f5138445039435a66395f657264433159476f566f7a316c357644364c37534b644d634554365f336938563136395a6e4479306435507a5533626c42584c5f4c492d4f72523954524f72765942344e494875336d536d7339676649366b46517377534b55516e6c517276706a6e6d54336257325f61456f5f6d33516137423455484f6936306575314554684e3677),
('eoobtili5k1cse2r0gob1208ieav13hr', '108.162.215.145', 1587541987, 0x61584d695869687253795754676a5456357376615a3248462d673435467376646c7a64386a424869766142314c534d354a597a36424a435869585238424364746676394f6e6378417a62535741714d6437644c4e4d41486d4e63696465694b30766838753862444c4a314f6b33574f4268664c55384b4d337a5648516234745844525a345458434a76625071334770482d37484d63613459386c4947684c38584a6f4c3263514c6c464f5132456a3667556d326c696b4d7269656d76465330476b3364614370626c33365033555165776532614875527734776544746d35624730436c4d505a43314e49624f537a4869547463716d4d677a775745346162396c73576f4d74583272584361715f32554972377942334f614f736d5562675f303244774a355356654a4c6b7730714b695133356563686c54786f4b586d424b6b6a6c5351526a425358587567637373434b48306c45612d686a3554704e436b6d4d3858644164366f6e323069546737423050624e345965654d70347672504b575772716e6d566e776557534b49736e3565467879444c64626b47716a4f7a3968577969664246552d38704862324568744776544a5844466b336f31446e4e4b63634e5f70454775657568316c5a53774c4e5462356554535663745f4f4375664e314c6e6f4e6c61694776502d5f2d6147732d6d51485442456f337558785362634b30394235757a567735343562653151615876316132724e7a654759744c7576645178316b386e3744344c4771554d39346d6e6c6c355564747a643249336e6c2d5f746d4479676671504157672d61695f744c45726a52385a6b5570374d48456275564a594372537435634932304b42445a476d75583874494256632d6c4a64716f5351687a363068476158462d644945673734544e52736b4d45774e4a6466397175795f7841764c497865584b705835306b4f4b654938514b43483249647370336750314c6d77685177717643394752352d35514146464b373441427773773973517751587841744656585944626746566478775674644e376130577a547a6b714943355939326c634231384f34627936656a4555633839717a4d49746142744548374e5756756c567a31666f7642754b4d4d4856356e3830356538445549595746504a4169507761684c37563170353479556130477a646d4a4c6f46444339355251796253705831694f7165656e6a30365367344945505242454e444d4b5752503143736c45674272567857444a79704c54515833375a43746e4641544173704e692d507a726533503843763033457664467353474c7953744e54777330545a6c556b334f6f784845596d3141335f6a305978653549754a6d325542535636514332444f4b355975516674596b7249676a6d665f41694e7a4f455a79494c734267395530713061524d47475a745576387833504a5567584a77494c6c65527a6a4a775377336b464f466b6f6d7030434147506e764e4e317a515a5779514a3731625772753631685261752d48652d444a68716e586162686f63652d6e4c62735937636352715536587a46387945304e4662534c653077547a575652345930384357796d3450596f49527075374976434a516f6355614663374e4f32585641534a416e7045493973375672786162736443396d325850394841497a657343586b63597369504b4d4670774b4f4a6974504752677268753855344f7842325f5574376f75354355415f4f4657564c7a6f4241564e796b497733574869666e503858657468355f593763554846595f585354423564324a4f6c6c7530686e58697233645572376c574f534b4f52784a4276715a6c454b316f532d674f7541576a564b4d4c784e696942516c42696876756a53766d4f3058345242395833733648624b416b6b6f57356d5f33673676694671383076536f7a446c69453867514e616e684b6e5a4234442d5635737735503733476b2d466b4a6c7578506d597534713877426a734e4342534e383575435454324a614164746d755476346878344936504a6275656946714c4b52644e446644617565484e643162642d6235416f5934616a6779544c364d7238694f3769686a475a46316a30414931692d6b5a3737586a49366d705f68674d45374e756965367a725f347370737569366766675036424e35746e3958735066352d49784d487675745851462d312d77616c667867493170332d6b51544448342d736832486d385046307a62574e623167775250526c775950427a756b65317034654e6f75594a5848506b6b58575a7a737442594f453663785654517149515f65453841656a7138536e6b6e732d534e4863626758512d76526c56366a617a324332332d4c527679396d6b6b414e6359554132765074494774644f6f4f66446855687a6d2d7644764d6f3172437362413069664c62316e4768383953336b31396845574245304539316a6b4f372d5a5f64345871336264694373396a7943497058323975467968684f566763515655585f4a436b387152777a4a7171343777766d76484b4377335f56693473717158615f3344513472344e674945634543746f52376f7832507037696a68716f4f506351575161505f6c7943646565574e59457653586b6e4b71594474396b69514c36686c756f61726a465961565539346e475f75596e554449306b37534d6655636b4d42394f4a734a6b45714e69774e69637a4771416b7346697836795a344354393157635f5f777a6277554d6b734a6935306a6e53614f6d333672674658434f346f47373266643856654e3057355373686f32424637506c5648486b747857316b6134497852686c594c4f4256625a544c53735634633370305a334267724d6d6a6e77796e31345f3142476b7655412d377756774e4a4344726170794c7469544173784734746e37575263306a512d553745527963366673504f34477070645355486168596d76414b624f2d637a5436584c707a4a314c6b7454514f356a625f54376e7345486c424b4a2d655278374f4e6c57335854785a2d5a7761417337664e6a596354443870357a6d556951496a70584974387875386f596e37655977426c307274454e556a353478745141736753364541334372795f597473563168514d6e5543756a724b525a34573370506d6762544237644b67574e546b4e552d666545666734395a787567674133737056647132334d426a4c6778435a47374e5365524e4b774b324c4a736d5562326c736344336d78774b643254746c414c357872305262414e354359515553584666465055577461652d5a61305343344f757359745730465172744337476d414a37476c45425357526e38666468434e35524563646550735450414b4d5f6e547071524352324f4277614e65666d646769576d797867306261655744734c416d6c5a41482d49465938635948747a795f5a4f4953753235586b71522d42646b31774b56796474646555666b76752d5774424656326a575051387462545553684f797262474245582d64585f61567975615f6f744777713147455f6e567163383579377441637342554d674b656e35527443666b516550315866504c344f4467705f4e73453041684e326c664a746e5973682d7672706f42647a5a7139536a65734a4f746d77456b4665564c487458554848503758474a666262416a367a7a796d65774e536a6c48377245637972384857357a33593559724c34494842484c653935324f58573546594b46757047757263596950346635576e7569344836395676435532503841384f31614d445a66576e6c5365755279626b55776d37625a4d6b683152722d484b596b32546e423570342d67534d305463374c4e41625f6f325f7267766e74794c2d4c424a756936746e78425f42736867367231486d4562796e586e747337544c535943614158595050336277327234374f7461334a426e2d56674c5130785a3636515a4c52684c3245384f534a55484a5a6158514c566176447963614f3974756a676b47726d6376707a515541694e49675132486c766e314b3371597176396b4d784833326d6c4170396c49704759584c746e4d446179557250546f654b627443497a7346363947392d395253586c41512d44665469645a32355252673630755f6256794878345532316472466e705a612d6950706b5653746d45516876484542634a7538634c675f75352d5a3379704b41374767534e723471354951476746627232644c6d4235766c593630354136335f624f6672463375495848794636613977666b7443746d63395179734b553953717062692d595056425f647675535136394b374675387a6358643077427a6d61654b697762787272343850456c734b5a437a435231566c53343478775662547951373670745550512d344b764f4f624a385351317149722d6933344738626a74697073447335577278444c30777133796e6a346f45464b46444b3168504b58594f376c6b63342d775231524c3547526a677a534e724f4d3964316d30385674554a3379424b66476f657731434774365573445a614b444b315865352d4d7053394c5f4374723543357a3144464576453174536a5f6e6d646f702d6d6255394a727950433279546154464137797a784247326c36364b6d4f54556450656468796a706c70536f784f5a785756777870663931446a62344b355133725a374d61696b6d786d595952483949383530704b724d614b486b303846554635316b4c32656d797634496258336e5850314c4e30525f392d68676170766e4744434850336e5f4e644a366d546a4f69354a4c44547a704c4a69644a6d47617157773170795546786137776d5a48707a4e784656452d5439493867727159596c414161784e73796a5f753376335a76584d726c35446352384747644256333642576e6844726645555153493263616e4b6f4c645f776f384a76524d582d7555446f526e4770716d4a656f6b533248594832685166672d5474566c796352516a4a327a4b41785954426b58593446426563335561615a4139517072644d61473369644949624e6746656359516d556551514f643261437a6b6f644e45474352696875393568393375525a5a675f72545631744b475a2d375f5f723735445f7078786c5979523632643647776932446d555a6b454765397462307846483356425a4b2d2d7a59645357637849796f7073317241384164544b306c50383246355a786e496b426a62507262645373576c524f487073755753544979754574373837524138516834364a32643868384d4b6f745f667876374252554e665452756946366342384f6b73506a3151786d4c705a74564d5168453758305130394f544c63374d45455654796d357a3251494a59484a6474574d715077696a4f31464b58585a6e563739735a76616a4d2d4169304d6a776c357a33786141573657777478394c3370434466614a6d75333448666454574b7a575873794551577556624b51376e7a33694346615133663036356235365030357375336143695565666d6a5a5736446c5033646b6b74365a2d765a44587a6739374763316c4766373957654f5f6275546e4d7335597038415273643368733757556954483754674642657855627264356258303430576f4e546f4f32323366396638726733547259544b45717341654d312d6c366c4a725f7453635457514b63533963665f5136776435565a77637652676d787764727973537141485556534d47696c39324541764a46523459674c4e566c4f6b50464b755663374470374137555a31704b346945364166354d6c614c525f48465267564238764965744a36324c53314b304e6c49353144647a34324a52306863725967684b594b7a6b3143757258556f64356d50534741674158444a6e5243774d365a4f706459665a4a3041723063656b4957324c746d7174396f56382d74576b54424953755a64324762735638455f784557786e596d4e715962573661754f6369386b5472615f656e65394f4a55715945495338696344496754326b79664a5f37707371704d4956574d6a2d7437594f69397565354d59626647536a7a414530676b4f574467713269696257417938617976646c57624358696c796246746a396b38363645783269424763624e757a6c457530765532376b74562d5151726b4231386f587876766d445a693938513158314944634672715772315a6e35686d483245522d4b6c6e3631457736684d777a67693748652d57543346564e72377a4b426f6b75484a34776d59496364496c6a34715673424a76705a3843746f5f386c6b2d6c5f6c686b514969444a4965455954644c6d4658315070583739674735423856744e38593261336f41316868316c645854766973686c345a6545647136654c4265344a4367454e6249544569617834586657615879626f384f33664b7444657763516d6361774135337546457175683241752d5130323365494a58724d3438677477343249477974354334367370525064683776612d2d79585233454b6246666e535f356858486e766d7376586a72305861546778346b67504c6e387168744e386448375764527a6b4362314e4a346c6c4b3253664b344c554b385756683747705671587644517354742d5f5666546c36594e67336557714f63323374476b32595a794b4236696871477270414f4876525378414b744f584d6552425351394b4f48593063567149595f444d37456f667572614d46737230676a4c70584b756e5763727268352d65563764344b74354c566b665a5555504d56313755346c536755776a644c737644516446646356454872495676746d446e63467253744d586154447a325642575a54646c4364737a495f4773506f324f5a4d5134414b3433543363756371735f517631672d545269576f34417a6a716c555733416a4c5a5139316e2d796959364e3239324b565156764c45666973446a36784b587131564d2d393355714456746e333739305878324456766a6354416b596c4a576b745964776147464a5757555a456f36634a5a48583556713532714e3335586a48307062764e487a56756a32787345736b58536e7469706247664a4e79734c357a7665684f5a5f31495978445453424b44555158786f646e4c30786b6c5f3652316d56424450583067357174427946654a346741565535314630356245714c44723256772d5a5449665f5a735445367771315855394f6778667a45754c2d36776e5a6243304f70545278766262516f4d31787559667769457256634968783831336257794a5658794531594f47726c664d756432313035717664414b34457a366f64516258366243697530646c6c6d48646b4656723173745048724e684a6d514a354c336a47525f7870774554324a4b356c6d5a685a6258545463487a366676432d6d4955414c72736a6f445a426361436e526754727a7a4644724f56687675784176486f54446b5366397632305433776739356766516d63325f6a7a6366427a6e646554316a31325f4f6d787078654a517942325172424e33595878517841594b61345f35396878615678716a4e304a5177756c766348646a663169534e623439524242336b6743776b46763968425a795f5a442d66766d695933716a6d4e354a474c457873504451536e464a4c726f69693650424d4648564f416c2d5a56584645764470494b575934696351704266583744423165585f52574c4361664132537451753968656869387449713662796a4172545454765770556a79464e63504a4c736a47694145694741685367466173326249596f6c50755978646b5f5f39455f49375f58637a5f7141636b7857594f795778486f335557416e305070315f72376b5165367038616f79784f4b506734786f314c766678696a666e4e72736a62686176304a7a37);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indexes for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indexes for table `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indexes for table `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indexes for table `employees`
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
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indexes for table `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indexes for table `students`
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
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
