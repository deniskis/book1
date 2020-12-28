-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2020 at 11:12 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id_authora` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id_authora`, `author`) VALUES
(1, 'Roopa Pai'),
(2, 'Dan Brown'),
(3, 'David Nicholls'),
(4, 'Stephenie Meyer'),
(5, 'E. L. James'),
(6, 'Sylvia Day'),
(7, 'Diana Gabaldon'),
(8, 'George Orwell'),
(9, 'Paulo Coelho'),
(10, 'Lois Lowry');

-- --------------------------------------------------------

--
-- Table structure for table `knigi`
--

CREATE TABLE `knigi` (
  `id` int(11) NOT NULL,
  `nazvanie_knigi` varchar(255) NOT NULL,
  `id_zanra` int(11) NOT NULL,
  `id_authora` int(11) NOT NULL,
  `god_vipuska` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `knigi`
--

INSERT INTO `knigi` (`id`, `nazvanie_knigi`, `id_zanra`, `id_authora`, `god_vipuska`) VALUES
(1, 'The Vedas and Upanishads', 1, 1, 2019),
(2, 'Da Vinci Code, The', 2, 2, 2003),
(3, 'Angels and Demons', 2, 2, 2000),
(4, 'One Day', 1, 3, 2009),
(5, 'Breaking Dawn', 3, 4, 2008),
(7, 'Fifty Shades Darker', 4, 5, 2011),
(8, 'Bared to You', 4, 6, 2012),
(9, 'Outlander', 4, 7, 1991),
(10, 'Nineteen Eighty-Four', 1, 8, 1949),
(11, 'The Alchemist', 1, 9, 1988),
(12, 'The Giver', 3, 10, 1993),
(13, 'The Understudy', 3, 3, 2005);

-- --------------------------------------------------------

--
-- Table structure for table `zanr`
--

CREATE TABLE `zanr` (
  `id_zanra` int(11) NOT NULL,
  `zanr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zanr`
--

INSERT INTO `zanr` (`id_zanra`, `zanr`) VALUES
(1, 'Literary fiction'),
(2, 'Crime'),
(3, 'Adult fiction'),
(4, 'Romance'),
(5, 'horror');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_authora`),
  ADD KEY `id_authora` (`id_authora`);

--
-- Indexes for table `knigi`
--
ALTER TABLE `knigi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_authora` (`id_authora`),
  ADD KEY `id_zanra` (`id_zanra`);

--
-- Indexes for table `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`id_zanra`),
  ADD KEY `id_zanra` (`id_zanra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id_authora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `knigi`
--
ALTER TABLE `knigi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `zanr`
--
ALTER TABLE `zanr`
  MODIFY `id_zanra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `knigi`
--
ALTER TABLE `knigi`
  ADD CONSTRAINT `knigi_ibfk_1` FOREIGN KEY (`id_authora`) REFERENCES `author` (`id_authora`) ON UPDATE CASCADE,
  ADD CONSTRAINT `knigi_ibfk_2` FOREIGN KEY (`id_zanra`) REFERENCES `zanr` (`id_zanra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
