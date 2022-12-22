-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2020 at 01:47 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redis_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE IF NOT EXISTS `mail` (
  `email` varchar(40) NOT NULL,
  `mail_type` varchar(40) NOT NULL,
  KEY `mail_type` (`mail_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`email`, `mail_type`) VALUES
('dang@gmail.com', 'gmail'),
('dang@sis.hust.edu.vn', 'hotmail'),
('test@example.com', 'hotmail'),
('pi@sun.vn', 'hotmail');

-- --------------------------------------------------------

--
-- Table structure for table `mail_company`
--

DROP TABLE IF EXISTS `mail_company`;
CREATE TABLE IF NOT EXISTS `mail_company` (
  `mail_type` varchar(40) NOT NULL,
  `company` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mail_company`
--

INSERT INTO `mail_company` (`mail_type`, `company`) VALUES
('gmail', 'Google'),
('hotmail', 'microsoft');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
('a1b2c3e4', 'test@example.com', '$2y$12$7Mj1fG3bdlpmRcXtZpwimOI4pItCQcj5x2.ZqydPbR5wWlKGVaQVe'),
('1ab', 'dang@gmail.com', '$2y$12$yjjQbc9hAfGQhV7V5p2UD.vR9TLx3lVKMpWKNlXc0MhvhuwtMljGS'),
('2ab', 'pi@sun.vn', '$2y$12$2zD67UVDOyjv8HIS63oKsuDRo6eMgnhvmZPFZNDkeEWYuygiAJyja\r\n');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
