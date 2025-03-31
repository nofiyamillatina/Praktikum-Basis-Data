-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2025 at 11:17 AM
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
-- Database: `perpustakaan2`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `Id_anggota` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(20) DEFAULT 'Umum',
  `Tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`Id_anggota`, `Nama`, `Jurusan`, `Tgl_daftar`) VALUES
('A001', 'Nofiya Millatina', 'Teknologi Informasi', '2022-07-15'),
('A002', 'Zita Tsani Tsuraya', 'Gizi', '2022-10-26'),
('A003', 'Hartika Andriana', 'Pariwisata', '2022-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `Id_buku` varchar(10) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `Penerbit` varchar(50) DEFAULT NULL,
  `Tahun_terbit` int(11) DEFAULT NULL CHECK (`Tahun_terbit` between 1900 and 2025),
  `Id_penerbit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`Id_buku`, `Judul`, `Penerbit`, `Tahun_terbit`, `Id_penerbit`) VALUES
('B001', 'Bumi', 'Gramedia', 2014, 'P001'),
('B002', 'Bulan', 'Gramedia', 2015, 'P001'),
('B003', 'Bumi Manusia', 'Hasta Mitra', 1980, 'P002'),
('B004', 'Laskar pelangi', 'Bentang Pustaka', 2005, 'P003'),
('B005', 'Laut Bercerita', 'Gramedia', 2017, 'P001');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `Id_peminjaman` int(11) NOT NULL,
  `Id_anggota` varchar(10) DEFAULT NULL,
  `Id_buku` varchar(10) DEFAULT NULL,
  `Tgl_pinjam` date NOT NULL,
  `Tgl_kembali` date DEFAULT NULL,
  `Denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`Id_peminjaman`, `Id_anggota`, `Id_buku`, `Tgl_pinjam`, `Tgl_kembali`, `Denda`) VALUES
(1, 'A001', 'B001', '2025-01-10', '2025-01-17', 0),
(2, 'A002', 'B003', '2025-01-12', '2025-01-18', 0),
(3, 'A003', 'B004', '2025-01-13', NULL, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `Id_penerbit` varchar(10) NOT NULL,
  `Nama_penerbit` varchar(30) NOT NULL,
  `Alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`Id_penerbit`, `Nama_penerbit`, `Alamat`) VALUES
('P001', 'Gramedia', 'Jakarta'),
('P002', 'Hasta Mitra', 'Jakarta'),
('P003', 'Bentang Pustaka', 'Yogyakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`Id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Id_buku`),
  ADD KEY `Id_penerbit` (`Id_penerbit`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`Id_peminjaman`),
  ADD KEY `Id_anggota` (`Id_anggota`),
  ADD KEY `Id_buku` (`Id_buku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`Id_penerbit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `Id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`Id_penerbit`) REFERENCES `penerbit` (`Id_penerbit`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`Id_anggota`) REFERENCES `anggota` (`Id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`Id_buku`) REFERENCES `buku` (`Id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
