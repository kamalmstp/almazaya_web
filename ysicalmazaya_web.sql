-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2020 at 03:17 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ysicalmazaya_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `registrants_junior`
--

CREATE TABLE `registrants_junior` (
  `id` int(11) NOT NULL,
  `first_school_year` int(11) NOT NULL,
  `last_school_year` int(11) NOT NULL,
  `school_level` varchar(15) NOT NULL,
  `full_name` varchar(300) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birth_place` varchar(60) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(300) NOT NULL,
  `village` varchar(60) DEFAULT NULL,
  `sub_district` varchar(60) DEFAULT NULL,
  `district` varchar(60) DEFAULT NULL,
  `prev_school` varchar(200) DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `father_name` varchar(300) NOT NULL,
  `father_employment` varchar(60) DEFAULT NULL,
  `mother_name` varchar(300) NOT NULL,
  `mother_employment` varchar(60) DEFAULT NULL,
  `is_approved` enum('true','false') DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false',
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registrants_junior`
--

INSERT INTO `registrants_junior` (`id`, `first_school_year`, `last_school_year`, `school_level`, `full_name`, `gender`, `birth_place`, `birth_date`, `address`, `village`, `sub_district`, `district`, `prev_school`, `graduation_year`, `phone`, `photo`, `father_name`, `father_employment`, `mother_name`, `mother_employment`, `is_approved`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`) VALUES
(1, 2020, 2021, 'SMP', 'yui', 'F', 'fjdfj', '2003-06-03', 'rgg', ';m;l', 'hjuy', 'vvu', 'bubu', 2003, '39898', '', 'kjnjn', '14', 'noim', '10', NULL, 'false', '2020-10-08', '2020-09-19 03:55:54', NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registrants_senior`
--

CREATE TABLE `registrants_senior` (
  `id` int(11) NOT NULL,
  `first_school_year` int(11) NOT NULL,
  `last_school_year` int(11) NOT NULL,
  `school_level` varchar(15) NOT NULL,
  `full_name` varchar(300) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birth_place` varchar(60) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(300) NOT NULL,
  `village` varchar(60) DEFAULT NULL,
  `sub_district` varchar(60) DEFAULT NULL,
  `district` varchar(60) DEFAULT NULL,
  `prev_school` varchar(200) DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `father_name` varchar(300) NOT NULL,
  `father_employment` varchar(60) DEFAULT NULL,
  `mother_name` varchar(300) NOT NULL,
  `mother_employment` varchar(60) DEFAULT NULL,
  `is_approved` enum('true','false') DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false',
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registrants_senior`
--

INSERT INTO `registrants_senior` (`id`, `first_school_year`, `last_school_year`, `school_level`, `full_name`, `gender`, `birth_place`, `birth_date`, `address`, `village`, `sub_district`, `district`, `prev_school`, `graduation_year`, `phone`, `photo`, `father_name`, `father_employment`, `mother_name`, `mother_employment`, `is_approved`, `is_deleted`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`) VALUES
(1, 2020, 2021, 'SMA', 'Nama Sya', 'M', 'dfgdfg', '2020-09-14', 'dgdfg', 'fgdfg', 'dfgdg', 'fgdg', 'fgdfg', 2020, '3456', '36cea410682719a3b79ced618cebd128.png', 'agadg', '15', 'fdgfdg', '16', 'false', 'false', '2020-09-17', '2020-09-19 04:27:17', '2020-09-19 11:08:59', '2020-09-19 11:20:15', 0, 1, 1, 1),
(2, 2020, 2021, 'SMA', 'ghgh', 'F', 'dhdh', '2020-10-07', 'dfhdh', 'dhdh', 'dhdh', 'dhh', 'dfhdh', 5678, '3636', '', 'ysy', '19', 'syy', '22', NULL, 'true', '2020-09-17', '2020-09-19 03:08:59', '2020-09-19 11:08:59', NULL, 0, 0, 1, 0),
(3, 2020, 2021, 'SMA', 'sfkkj', 'M', 'klkl', '2019-08-10', 'kkjn', 'dhdh', 'dhdh', 'dhh', 'bubu', 2, '345', '', 'agadg', '15', 'dgdg', '21', NULL, 'true', '2020-09-17', '2020-09-19 03:08:59', '2020-09-19 11:08:59', NULL, 0, 0, 1, 0),
(4, 2020, 2021, 'SMA', 'Karina Nada Hanifah', 'F', 'Banjarbaru', '2005-05-25', 'Jl.Ir.PM.Noor, Komplek Permata Hijau Blok E/10', 'Sungai Ulin', 'Banjarbaru Utara', 'Banjarbaru', 'SMPIT ROBBANI', 2020, '087738861465', '', 'Sugeng Karyanto', '14', 'Ernawati', '10', NULL, 'false', '2020-09-17', '2020-09-19 04:27:06', NULL, NULL, 0, 1, 0, 0),
(5, 2020, 2021, 'SMA', 'Karina Nada Hanifah', 'F', 'Banjarbaru', '2005-05-25', 'Jl.Ir.PM.Noor, Komplek Permata Hijau Blok E/10', 'Sungai Ulin', 'Banjarbaru Utara', 'Banjarbaru', 'SMPIT ROBBANI', 2020, '087738861465', '', 'Sugeng Karyanto', '14', 'Ernawati', '10', NULL, 'false', '2020-09-17', '2020-09-19 03:45:59', NULL, NULL, 0, 0, 0, 0),
(6, 2020, 2021, 'SMA', 'Karina Nada Hanifah', 'F', 'Banjarbaru', '2005-05-25', 'Jl.Ir.PM.Noor, Komplek Permata Hijau Blok E/10', 'Sungai Ulin', 'Banjarbaru Utara', 'Banjarbaru', 'SMPIT ROBBANI', 2020, '087738861465', '', 'Sugeng Karyanto', '14', 'Ernawati', '10', NULL, 'false', '2020-09-17', '2020-09-19 03:46:01', NULL, NULL, 0, 0, 0, 0),
(7, 2020, 2021, 'SMA', 'Karina Nada Hanifah', 'F', 'Banjarbaru', '2005-05-25', 'Jl.Ir.PM.Noor, Komplek Permata Hijau Blok E/10', 'Sungai Ulin', 'Banjarbaru Utara', 'Banjarbaru', 'SMPIT ROBBANI', 2020, '087738861465', '', 'Sugeng Karyanto', '14', 'Ernawati', '10', NULL, 'false', '2020-09-17', '2020-09-19 03:46:04', NULL, NULL, 0, 0, 0, 0),
(8, 2020, 2021, 'SMA', 'Karina Nada Hanifah', 'F', 'Banjarbaru', '2005-05-25', 'Jl.Ir.PM.Noor, Komplek Permata Hijau Blok E/10', 'Sungai Ulin', 'Banjarbaru Utara', 'Banjarbaru', 'SMPIT ROBBANI', 2020, '087738861465', '', 'Sugeng Karyanto', '14', 'Ernawati', '10', NULL, 'false', '2020-09-17', '2020-09-19 03:46:09', NULL, NULL, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registrants_junior`
--
ALTER TABLE `registrants_junior`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrants_senior`
--
ALTER TABLE `registrants_senior`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registrants_junior`
--
ALTER TABLE `registrants_junior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `registrants_senior`
--
ALTER TABLE `registrants_senior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
