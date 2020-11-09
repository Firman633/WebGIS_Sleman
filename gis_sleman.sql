-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2020 at 09:15 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gis_sleman`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori_wisata`
--

CREATE TABLE `kategori_wisata` (
  `id_kategori_wisata` int(11) NOT NULL,
  `kd_kategori_wisata` varchar(10) NOT NULL,
  `nm_kategori_wisata` varchar(50) NOT NULL,
  `marker` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_wisata`
--

INSERT INTO `kategori_wisata` (`id_kategori_wisata`, `kd_kategori_wisata`, `nm_kategori_wisata`, `marker`) VALUES
(1, '001', 'PANTAI', ''),
(2, '002', 'PEGUNUNGAN', ''),
(3, '003', 'ALAM BUATAN', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_kecamatan`
--

CREATE TABLE `m_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kd_kecamatan` varchar(15) NOT NULL,
  `nm_kecamatan` varchar(100) NOT NULL,
  `geojson_kecamatan` varchar(30) NOT NULL,
  `warna_kecamatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_kecamatan`
--

INSERT INTO `m_kecamatan` (`id_kecamatan`, `kd_kecamatan`, `nm_kecamatan`, `geojson_kecamatan`, `warna_kecamatan`) VALUES
(1, '34.04.08', 'BERBAH', 'Berbah1.geojson', '#542466'),
(2, '34.04.17', 'CANGKRINGAN', 'Cangkringan.geojson', '#009900'),
(4, '34.04.01', 'GAMPING', 'Gamping.geojson', '#880000'),
(6, '34.04.02', 'GODEAN', 'Godean.geojson', '#11733c'),
(8, '34.04.10', 'KALASAN', 'Kalasan1.geojson', '#2f9d90'),
(9, '34.04.07', 'DEPOK', 'Depok.geojson', '#329bc8'),
(10, '34.04.15', 'TURI', 'Turi.geojson', '#b21010'),
(11, '34.04.05', 'SEYEGAN', 'Seyegan.geojson', '#c2af38'),
(12, '34.04.13', 'SLEMAN', 'Sleman.geojson', '#f00fdd'),
(13, '34.04.03', 'MOYUDAN', 'Moyudan.geojson', '#339484'),
(14, '34.04.16', 'PAKEM', 'Pakem.geojson', '#6b1db9'),
(15, '34.04.14', 'TEMPEL', 'Tempel.geojson', '#17a695'),
(16, '34.04.04', 'MINGGIR', 'Minggir.geojson', '#512f50'),
(17, '34.04.09', 'PRAMBANAN', 'Prambanan.geojson', '#e5c215');

-- --------------------------------------------------------

--
-- Table structure for table `m_wisata`
--

CREATE TABLE `m_wisata` (
  `id_wisata` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `nm_wisata` varchar(100) NOT NULL,
  `lat` float(9,6) NOT NULL,
  `lng` float(9,6) NOT NULL,
  `marker` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_wisata`
--

INSERT INTO `m_wisata` (`id_wisata`, `id_kecamatan`, `lokasi`, `nm_wisata`, `lat`, `lng`, `marker`) VALUES
(3, 17, 'Jl. Raya Solo - Yogyakarta No.16, Kranggan, Bokoharjo, Kec. Prambanan, Kabupaten Sleman, Daerah Isti', 'Candi Prambanan', -7.752021, 110.489281, 'hijau.png');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nm_pengguna` varchar(30) NOT NULL,
  `password` varchar(150) NOT NULL,
  `level` enum('Admin','User') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nm_pengguna`, `password`, `level`) VALUES
(1, 'admin', '$2y$10$lz81TIKls4grbfRrRkDcQO5TGgO1pw2DnmwI7GunubAvlSjnfauz.', 'Admin'),
(2, 'user', '$2y$10$MHQMFit94QNaGxgxu7QxC.x3Zl6001zk7sW3coTdDNSyyLG9dLuJm', 'User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori_wisata`
--
ALTER TABLE `kategori_wisata`
  ADD PRIMARY KEY (`id_kategori_wisata`);

--
-- Indexes for table `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `m_wisata`
--
ALTER TABLE `m_wisata`
  ADD PRIMARY KEY (`id_wisata`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_wisata`
--
ALTER TABLE `kategori_wisata`
  MODIFY `id_kategori_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_kecamatan`
--
ALTER TABLE `m_kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_wisata`
--
ALTER TABLE `m_wisata`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
