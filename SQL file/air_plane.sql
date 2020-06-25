
create database Air;
use Air;
create user 'user1' identified by 'youcode';
grant all on *.* to 'user1';

/*select * from client where CONCAT(id,nom,prenom) LIKE '%k%';
*/
select DISTINCT(flyingTo) from flights_list;
select DISTINCT flyingFrom from flights_list;
drop table reservation ;
drop table flights_list ;

    -- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2020 at 09:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `air`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `email` varchar(350) NOT NULL,
  `password` varchar(350) NOT NULL,
  `picture` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Id`, `admin_name`, `email`, `password`, `picture`, `status`) VALUES
(1, 'albus dambldur', 'dumb@gmail.com', 'de4667d1f44423b565b07a7bb14790fc', 'admin_uploads/dumbledore.jpg', 'admin'),
(2, 'snap', 'snap@gmail.com', '7afe399f1415b137d0962f82662fa9d4', 'admin_uploads/download.jpg', 'admin'),
(3, 'mohammed', 'mo@gmail.com', 'de4667d1f44423b565b07a7bb14790fc', 'admin_uploads/Annotation 2020-06-12 155930.png', 'admin'),
(4, 'admin', 'admin@gmail.com', '$2y$10$HVx.AkB2xwebbFgGUaVxzOMxBJuRNYN5nU9X0w7qAzI0hU3frtWVG', 'admin_uploads/download.jpg', 'admin'),
(6, 'mohammed', 'melhachimi514@gmail.com', '$2y$10$m5/NN1WGCJCevLBWNq2KvuVkRTRGXX1OsPvad56NZMdTlvsVexL5G', 'admin_uploads/download.jpg', 'admin'),
(7, 'maryem', 'maryem@gmail.com', '$2y$10$zrKqC5Y7n59iB54OREQLPuRtLCSdAEWdCnuwbSnUhaQp7q0RCQ.qu', 'admin_uploads/geni.jpg', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `flights_list`
--

CREATE TABLE `flights_list` (
  `id` int(11) NOT NULL,
  `flyingFrom` varchar(100) DEFAULT NULL,
  `flyingTo` varchar(100) DEFAULT NULL,
  `departingDate` date DEFAULT curdate(),
  `returningDate` date DEFAULT NULL,
  `seats` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flights_list`
--

INSERT INTO `flights_list` (`id`, `flyingFrom`, `flyingTo`, `departingDate`, `returningDate`, `seats`) VALUES
(1, 'marrakech', 'agadir', '2020-06-01', '2020-06-02', '100'),
(2, 'rabat', 'tanger', '2020-06-04', '2020-06-05', '100'),
(3, 'agadir', 'dakhla', '2020-06-17', '2020-06-27', '100'),
(5, 'madrid', 'paris', '2020-06-11', '2020-06-17', '15'),
(7, 'fenzwila', 'paris', '2020-06-11', '2020-06-17', '23');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `FullName` varchar(80) DEFAULT NULL,
  `numeroTel` varchar(50) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `numeroPassport` varchar(50) DEFAULT NULL,
  `departingDate` date DEFAULT curdate(),
  `returningDate` date DEFAULT NULL,
  `Adult` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `travel_class` varchar(25) DEFAULT NULL,
  `price` varchar(80) DEFAULT NULL,
  `id_flight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `FullName`, `numeroTel`, `email`, `numeroPassport`, `departingDate`, `returningDate`, `Adult`, `children`, `travel_class`, `price`, `id_flight`) VALUES
(1, 'mohammed', '656757575845', 'riddle@gmail.com', '130MMM', '2020-05-06', '2020-05-14', 2, 2, 'Bussness Class', '1400 DH', 1),
(2, 'mohammed Elhachimi', '656757575858585', 'riddle@gmail.com', '130MMM', '2020-05-08', '2020-05-09', 2, 3, 'Bussness Class', '1500 DH', 1),
(14, 'mohammed', '656757575858585', 'luna@gmail.com', '130MMM', '2020-05-02', '0000-00-00', 1, 1, 'Bussness Class', '550 DH', 9),
(20, 'mohammed', '656757575858585', 'luna@gmail.com', '130MMM', '2020-05-15', '2020-05-16', 1, 1, 'Econemy Class', '900 DH', 3),
(21, 'mohammed', '656757575858585', 'luna@gmail.com', '130MMM', '2020-05-15', '2020-05-16', 1, 1, 'Econemy Class', '900 DH', 3),
(22, 'mohammed', '656757575858585', 'luna@gmail.com', '130MMM', '2020-05-15', '2020-05-16', 1, 1, 'Econemy Class', '900 DH', 3),
(23, 'mohammed', '656757575858585', 'luna@gmail.com', '130MMM', '2020-05-15', '2020-05-16', 1, 1, 'Econemy Class', '900 DH', 3),
(24, 'mohammed', '656757575858585', 'luna@gmail.com', '130MMM', '2020-05-15', '2020-05-16', 1, 1, 'Econemy Class', '900 DH', 3),
(30, 'mohammed', '656757575845', 'MOHAMMED@1998.com', '130MMM', '2020-05-16', '2020-05-17', 2, 5, 'Bussness Class', '1700 DH', 9),
(34, 'mohammed', '656757575858585', 'MOHAMMED@1998.com', '130MMM', '2020-05-06', '2020-05-16', 1, 3, 'Bussness Class', '1300 DH', 9),
(44, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(45, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(46, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(48, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(49, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(50, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(51, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-18', 4, 3, 'First Class', '2100 DH', 9),
(52, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-07-03', '2020-07-04', 3, 4, 'Bussness Class', '1800 DH', 9),
(53, 'ahmed', '656757575845', 'ahmed@gmail.com', '130MMM', '2020-06-20', '2020-06-20', 6, 7, 'First Class', '2900 DH', 2),
(65, 'mohammed Elhachimi', '90809890809890', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-13', 7, 6, 'First Class', '3000 DH', 2),
(67, 'mohammed', '656757575858585', 'med@gmail.com', '130MMM', '2020-06-13', '2020-06-19', 7, 6, 'Bussness Class', '2800 DH', 5),
(69, 'mohammed', '+212655716260', 'med@gmail.com', '130MMM', '2020-07-10', '2020-07-01', 21, 20, 'First Class', '7200 DH', 2),
(112, 'mohammed', '656757575858585', 'med@gmail.com', '130MMM', '2020-06-24', '2020-07-05', 9, 16, 'First Class', '4400 DH', 5),
(113, 'mohammed', '656757575845', 'med@gmail.com', '130MMM', '2020-06-28', '2020-07-01', 2, 1, 'Bussness Class', '1300 DH', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `useremail` varchar(350) NOT NULL,
  `password` varchar(350) NOT NULL,
  `picture` varchar(350) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `username`, `useremail`, `password`, `picture`, `status`) VALUES
(1, 'medo', 'med@gmail.com', '$2y$10$HVx.AkB2xwebbFgGUaVxzOMxBJuRNYN5nU9X0w7qAzI0hU3frtWVG', 'Annotation 2020-06-12 001145.png', 'user'),
(2, 'laila', 'laila@gmail.com', '$2y$10$umJL.8IFcvCMtSYD/s3rJeLpfFBPBaig3GLjVcK21lUqrQkxVT19G', 'random.jpg', 'user'),
(3, 'said', 'said@gmail.com', '$2y$10$zjZoTHngpZiZdKo8IVNgiehIJmGgEWyW.0EGSA/O9bcUmv0MmcJbi', 'download.jpg', 'user'),
(4, 'hassan', 'hassan@gmail.com', '$2y$10$mr9JVJpqfnTv/RR/bqtyd.hfNLOG6NQcIQv6wGYvq/F6z9lPSxdpe', 'random.jpg', 'user'),
(5, 'mohammed', 'riddle@gmail.com', '$2y$10$H6C/aOyicltuTBCxL0SEvO4cNr0u5fWzOTjRa1jmW7l3JJ44Is1i2', 'download.jpg', 'user'),
(6, 'maryem', 'maryem@gmail.com', '$2y$10$MOg29ArNFDo8XaLfAKBRvOa6CSPAIrpg51WKerpA.bCA840y/Ju82', 'random2.jpg', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `flights_list`
--
ALTER TABLE `flights_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_flight` (`id_flight`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flights_list`
--
ALTER TABLE `flights_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_flight`) REFERENCES `flights_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

    
