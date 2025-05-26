-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 03:10 PM
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
-- Database: `perpustakaan3`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` char(5) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_Anggota`, `Nama`, `Alamat`, `Tanggal_lahir`) VALUES
('A0001', 'Raib', 'Jl.Kenangan', '2005-05-21'),
('A0002', 'Seli', 'Jl.Mawar', '2005-06-17'),
('A0003', 'Ali', 'Jl.Melati', '2005-03-15'),
('A0004', 'Padma', 'Jl.Lancar', '2003-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `ISBN` char(5) NOT NULL,
  `Judul` varchar(30) DEFAULT NULL,
  `Penulis` varchar(50) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`ISBN`, `Judul`, `Penulis`, `Harga`) VALUES
('00001', 'Bumi', 'Tere Liye', 89000),
('00002', 'Laut Bercerita', 'Leila Chudori', 130000),
('00003', 'Pulang', 'Tere Liye', 90000),
('00004', 'Bumi Manusia', 'Pramoedya Ananta Toer', 300000),
('00005', 'A+', 'Ananda Putri', 99000);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `NO_Peminjaman` char(5) NOT NULL,
  `ISBN` char(5) DEFAULT NULL,
  `ID_Anggota` char(5) DEFAULT NULL,
  `Tanggal_peminjaman` date DEFAULT NULL,
  `Tanggal_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`NO_Peminjaman`, `ISBN`, `ID_Anggota`, `Tanggal_peminjaman`, `Tanggal_kembali`) VALUES
('P001', '00001', 'A0002', '2025-05-13', '2025-05-20'),
('P002', '00003', 'A0004', '0000-00-00', '2025-05-22'),
('P003', '00005', 'A0002', '2025-05-17', '2025-05-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`NO_Peminjaman`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `buku` (`ISBN`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
