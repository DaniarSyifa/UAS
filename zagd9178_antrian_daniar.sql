-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 09 Jul 2022 pada 15.57
-- Versi server: 10.3.35-MariaDB-cll-lve
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zagd9178_antrian_daniar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '$2y$10$Y/sPp9HR6PxRGUclp.kutOgCYivMEJWzi4EJKG9rAKhel5PcOybl6', 'admin'),
(3, 'daniar', '$2y$10$wJoiCCScRWdGeZfnav6z4eLcsL9S98tz36XTIL9MLfOXZDwiAq.Ta', 'Daniar Syifa Fauziah Arum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `antrian`
--

CREATE TABLE `antrian` (
  `id_antrian` int(11) NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `kode_antrian` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `waktu_panggil` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `created_at` date NOT NULL,
  `pelayanan_id` int(11) NOT NULL,
  `loket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `antrian`
--

INSERT INTO `antrian` (`id_antrian`, `no_antrian`, `kode_antrian`, `status`, `waktu_panggil`, `waktu_selesai`, `created_at`, `pelayanan_id`, `loket_id`) VALUES
(96, 1, 'CS-1', 2, '2022-07-09 10:35:33', '2022-07-09 10:36:32', '2022-07-09', 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `loket`
--

CREATE TABLE `loket` (
  `id_loket` int(11) NOT NULL,
  `nama_loket` varchar(50) NOT NULL,
  `pelayanan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `loket`
--

INSERT INTO `loket` (`id_loket`, `nama_loket`, `pelayanan_id`) VALUES
(5, 'Loket 1', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelayanan`
--

CREATE TABLE `pelayanan` (
  `id_pelayanan` int(11) NOT NULL,
  `kode_pelayanan` varchar(2) NOT NULL,
  `nama_pelayanan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelayanan`
--

INSERT INTO `pelayanan` (`id_pelayanan`, `kode_pelayanan`, `nama_pelayanan`) VALUES
(5, 'CS', 'Customer Service');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id_antrian`),
  ADD KEY `pelayanan_id` (`pelayanan_id`),
  ADD KEY `loket_id` (`loket_id`);

--
-- Indeks untuk tabel `loket`
--
ALTER TABLE `loket`
  ADD PRIMARY KEY (`id_loket`),
  ADD KEY `pelayanan_id` (`pelayanan_id`);

--
-- Indeks untuk tabel `pelayanan`
--
ALTER TABLE `pelayanan`
  ADD PRIMARY KEY (`id_pelayanan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id_antrian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT untuk tabel `loket`
--
ALTER TABLE `loket`
  MODIFY `id_loket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pelayanan`
--
ALTER TABLE `pelayanan`
  MODIFY `id_pelayanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`loket_id`) REFERENCES `loket` (`id_loket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antrian_ibfk_2` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id_pelayanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `loket`
--
ALTER TABLE `loket`
  ADD CONSTRAINT `loket_ibfk_1` FOREIGN KEY (`pelayanan_id`) REFERENCES `pelayanan` (`id_pelayanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
