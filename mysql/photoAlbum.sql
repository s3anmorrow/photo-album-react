-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 21, 2018 at 09:10 PM
-- Server version: 5.6.38
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sean_clientSideSamples`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblComments`
--

CREATE TABLE `tblComments` (
  `id` int(11) NOT NULL,
  `photoId` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblComments`
--

INSERT INTO `tblComments` (`id`, `photoId`, `comment`, `author`) VALUES
(1, 1, 'For testing purposes of course ;)', 'This is a new comment added here!'),
(2, 1, 'And another comment added!', 'Sean Morrow'),
(3, 3, 'Some comments added to this picture :P', 'Some Guy'),
(4, 3, 'and another comment here', 'another guy'),
(5, 5, 'Take this picture down now!', 'Annonymous'),
(6, 2, 'Josh was here!', 'Some guy'),
(7, 15, 'first posting!', 'testing dude');

-- --------------------------------------------------------

--
-- Table structure for table `tblPhotos`
--

CREATE TABLE `tblPhotos` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `caption` longtext,
  `source` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblPhotos`
--

INSERT INTO `tblPhotos` (`id`, `title`, `caption`, `source`) VALUES
(1, 'On the Beach', 'On the beach on the labour day weekend.  September 2005', '100_1245.jpg'),
(2, 'My Little nephew', 'Clowning around at my cousin\'s wedding reception', 'IMG_0258.jpg'),
(3, 'Bugs bugs bugs', 'Befriending bugs', 'IMG_6085.jpg'),
(4, 'Portage it!', 'Portaging in algonquin park, Ontario, July 2004', 'IMG_6087.jpg'),
(5, 'Dance Moves', 'Showing off the skills from the latest hip hop dance lesson', 'HPIM0259.jpg'),
(6, 'The Cat', 'Get off my damn chair!', 'cat.jpg'),
(7, 'De-weeding the barn', 'Removing the decorative ivy from our newly purchased barn.', 'image6.jpg'),
(10, 'Darcy in the weeds', 'Darcy at age 2', 'image7.jpg'),
(11, 'Lego Star Destroyer', 'Best. Gift. Ever.', 'starDestroyer.jpg'),
(14, 'Darcy at the beach', 'Darcy at the beach', 'image8.jpg'),
(15, 'Web Student Wellness!', 'Web student wellness in 2009', 'wellness01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblPhotosEmpty`
--

CREATE TABLE `tblPhotosEmpty` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `caption` longtext,
  `source` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblComments`
--
ALTER TABLE `tblComments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photoId` (`photoId`);

--
-- Indexes for table `tblPhotos`
--
ALTER TABLE `tblPhotos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblPhotosEmpty`
--
ALTER TABLE `tblPhotosEmpty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblComments`
--
ALTER TABLE `tblComments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblPhotos`
--
ALTER TABLE `tblPhotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblPhotosEmpty`
--
ALTER TABLE `tblPhotosEmpty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblComments`
--
ALTER TABLE `tblComments`
  ADD CONSTRAINT `photo` FOREIGN KEY (`photoId`) REFERENCES `tblPhotos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
