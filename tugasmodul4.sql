-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2025 at 03:28 PM
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
-- Database: `tugasmodul4`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `ID_Mahasiswa` int(11) NOT NULL,
  `Nama_Mahasiswa` varchar(40) NOT NULL,
  `Jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`ID_Mahasiswa`, `Nama_Mahasiswa`, `Jurusan`) VALUES
(1, 'Zita Tsani Tsuraya', 'Teknologi Informasi'),
(2, 'Shofa Khoirunnisa Ikhsan', 'Teknologi Informasi'),
(3, 'Hartika Andriana', 'Teknologi Informasi'),
(4, 'Nofiya Millatina', 'Teknologi Informasi'),
(5, 'Husna Amanatul Ula', 'Teknologi Informasi'),
(6, 'Salma Maulida', 'Teknologi Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `ID_MK` int(11) NOT NULL,
  `Nama_MK` varchar(50) NOT NULL,
  `SKS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`ID_MK`, `Nama_MK`, `SKS`) VALUES
(123, 'Paradigma Sistem', 2),
(124, 'Algoritma Pemrograman', 3),
(125, 'Basis Data', 2),
(126, 'Fisika', 2),
(127, 'Kalkulus', 3),
(128, 'Biologi', 2),
(129, 'Aljabar Linier', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `ID_Mahasiswa` int(11) DEFAULT NULL,
  `ID_MK` int(11) DEFAULT NULL,
  `Nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`ID_Mahasiswa`, `ID_MK`, `Nilai`) VALUES
(1, 123, 86),
(1, 126, 87),
(2, 123, 89),
(2, 127, 78),
(2, 128, 86),
(3, 128, 88),
(4, 127, 80),
(4, 125, 87),
(4, 129, 89),
(5, 125, 82),
(5, 126, 85),
(6, 126, 90),
(6, 123, 91);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`ID_Mahasiswa`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`ID_MK`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD KEY `ID_Mahasiswa` (`ID_Mahasiswa`),
  ADD KEY `ID_MK` (`ID_MK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `ID_MK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`ID_Mahasiswa`) REFERENCES `mahasiswa` (`ID_Mahasiswa`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`ID_MK`) REFERENCES `mata_kuliah` (`ID_MK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
