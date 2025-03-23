-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2025 at 06:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum6`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `NIM` char(3) NOT NULL,
  `Kd_Mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambil_mk`
--

INSERT INTO `ambil_mk` (`NIM`, `Kd_Mk`) VALUES
('101', 'PTI447'),
('103', 'TIK333'),
('104', 'PTI333'),
('104', 'PTI777'),
('105', 'PTI123'),
('107', 'PTI777');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `Kode_dos` char(2) NOT NULL,
  `Nama_dos` varchar(20) DEFAULT NULL,
  `Alamat_dos` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`Kode_dos`, `Nama_dos`, `Alamat_dos`) VALUES
('10', 'Suharto', 'Jl. Jombang'),
('11', 'Martono', 'Jl. Kalpataru'),
('12', 'Rahmawati', 'Jl. Jakarta'),
('13', 'Bambang', 'Jl. Bandung'),
('14', 'Nurul', 'Jl. Raya Tidar'),
('23', 'Siti', 'Jl. Asih'),
('33', 'Setiawan', 'Jl. Kenanga'),
('99', 'Wawan', 'Jl. Mawar');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `Kode_jur` char(2) NOT NULL,
  `Nama_jur` varchar(20) DEFAULT NULL,
  `Kode_dos` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`Kode_jur`, `Nama_jur`, `Kode_dos`) VALUES
('TE', 'Teknik Elektro', '10'),
('TM', 'Teknik Mesin', '13'),
('TS', 'Teknik Sipil', '23');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(3) NOT NULL,
  `Nama` varchar(30) DEFAULT NULL,
  `Jk` enum('L','P') DEFAULT NULL,
  `Alamat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama`, `Jk`, `Alamat`) VALUES
('101', 'Arif', 'L', 'Jl. Kenangan'),
('102', 'Budi', 'L', 'Jl. Jombang'),
('103', 'Wati', 'P', 'Jl. Surabaya'),
('104', 'Ika', 'P', 'Jl. Jombang'),
('105', 'Tono', 'L', 'Jl. Jakarta'),
('106', 'Iwan', 'L', 'Jl. Bandung'),
('107', 'Sari', 'P', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `Kd_Mk` char(6) NOT NULL,
  `Nama_Mk` varchar(30) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL,
  `Semester` int(11) DEFAULT NULL,
  `Kode_dos` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`Kd_Mk`, `Nama_Mk`, `SKS`, `Semester`, `Kode_dos`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, '12'),
('PTI333', 'Basis Data Terdistribusi', 3, 5, '10'),
('PTI447', 'Praktikum Basis Data', 1, 3, '11'),
('PTI777', 'Sistem Informasi', 2, 3, '99'),
('TIK123', 'Jaringan Komputer', 2, 5, '33'),
('TIK333', 'Sistem Operasi', 3, 5, '10'),
('TIK342', 'Praktikum Basis Data', 1, 3, '11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD PRIMARY KEY (`NIM`,`Kd_Mk`),
  ADD KEY `Kd_Mk` (`Kd_Mk`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Kode_dos`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`Kode_jur`),
  ADD KEY `Kode_dos` (`Kode_dos`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`Kd_Mk`),
  ADD KEY `Kode_dos` (`Kode_dos`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`Kd_Mk`) REFERENCES `mata_kuliah` (`Kd_Mk`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`Kode_dos`) REFERENCES `dosen` (`Kode_dos`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`Kode_dos`) REFERENCES `dosen` (`Kode_dos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
