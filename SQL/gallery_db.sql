-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 05:07 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gallery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `photo_id`, `author`, `body`) VALUES
(2, 17, 'Test User', 'An awesome car'),
(3, 18, 'Utsav', 'This is a comment is made by me.');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(255) NOT NULL,
  `alternate_text` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `title`, `caption`, `description`, `filename`, `alternate_text`, `type`, `size`) VALUES
(17, 'Car 1', 'Caption 1', 'This is description for Car 1.                                                                ', '_large_image_1.jpg', 'Alternate text 1', 'image/jpeg', 479843),
(18, 'Car 2', 'Caption 2', 'This is description for Car 2.', '_large_image_2.jpg', 'Car 2', 'image/jpeg', 309568),
(19, 'Car 3', 'Caption 3', 'This is description for Car 3.', '_large_image_3.jpg', '', 'image/jpeg', 165053),
(20, 'Car 4', 'Caption 4', 'This is description for Car 4.', '_large_image_4.jpg', '', 'image/jpeg', 554659),
(21, 'Car 5', 'Caption 5', 'This is description for Car 5.', 'images-2.jpg', '', 'image/jpeg', 18578),
(22, 'Car 6', 'Caption 6', 'This is description for Car 6.', 'images-6.jpg', '', 'image/jpeg', 21886),
(23, 'Car 7', 'Caption 7', 'This is description for Car 7.', 'images-9.jpg', '', 'image/jpeg', 21108),
(24, '', '', '', 'images-12.jpg', '', 'image/jpeg', 18540),
(25, '', '', '', 'images-13 copy.jpg', '', 'image/jpeg', 22082),
(27, '', '', '', 'images-14 copy.jpg', '', 'image/jpeg', 21992),
(31, '', '', '', 'images-16 copy.jpg', '', 'image/jpeg', 21133),
(33, '', '', '', 'images-17 copy.jpg', '', 'image/jpeg', 22792),
(39, '', '', '', 'images-20 copy.jpg', '', 'image/jpeg', 22942),
(41, '', '', '', 'images-21 copy.jpg', '', 'image/jpeg', 19957),
(43, '', '', '', 'images-22 copy.jpg', '', 'image/jpeg', 21133),
(44, '', '', '', 'images-23 copy.jpg', '', 'image/jpeg', 22792),
(45, '', '', '', 'images-22.jpg', '', 'image/jpeg', 21133),
(46, '', '', '', 'images-23.jpg', '', 'image/jpeg', 22792),
(47, '', '', '', 'images-24 copy.jpg', '', 'image/jpeg', 29850),
(49, '', '', '', 'images-25 copy.jpg', '', 'image/jpeg', 19363),
(51, '', '', '', 'images-26 copy.jpg', '', 'image/jpeg', 21802),
(52, '', '', '', 'images-26.jpg', '', 'image/jpeg', 21802),
(53, '', '', '', 'images-27 copy.jpg', '', 'image/jpeg', 17662),
(54, '', '', '', 'images-27.jpg', '', 'image/jpeg', 17662),
(55, '', '', '', 'images-28 copy.jpg', '', 'image/jpeg', 17662),
(57, '', '', '', 'images-29 copy.jpg', '', 'image/jpeg', 25493),
(58, '', '', '', 'images-29.jpg', '', 'image/jpeg', 25493),
(59, '', '', '', 'images-30.jpg', '', 'image/jpeg', 20257),
(60, '', '', '', 'images-30 copy.jpg', '', 'image/jpeg', 20257),
(61, '', '', '', 'images-31 copy.jpg', '', 'image/jpeg', 20928),
(62, '', '', '', 'images-31.jpg', '', 'image/jpeg', 20928),
(63, '', '', '', 'images-32 copy.jpg', '', 'image/jpeg', 22772),
(64, '', '', '', 'images-32.jpg', '', 'image/jpeg', 22772),
(65, '', '', '', 'images-33 copy.jpg', '', 'image/jpeg', 16855),
(66, '', '', '', 'images-33.jpg', '', 'image/jpeg', 16855),
(67, '', '', '', 'images-34 copy.jpg', '', 'image/jpeg', 23587),
(68, '', '', '', 'images-34.jpg', '', 'image/jpeg', 23587),
(69, '', '', '', 'images-35 copy.jpg', '', 'image/jpeg', 23672),
(70, '', '', '', 'images-35.jpg', '', 'image/jpeg', 23672),
(71, '', '', '', 'images-36 copy.jpg', '', 'image/jpeg', 21672),
(72, '', '', '', 'images-36.jpg', '', 'image/jpeg', 21672),
(73, '', '', '', 'images-37 copy.jpg', '', 'image/jpeg', 20381),
(74, '', '', '', 'images-37.jpg', '', 'image/jpeg', 20381),
(75, '', '', '', 'images-38 copy.jpg', '', 'image/jpeg', 21857),
(76, '', '', '', 'images-38.jpg', '', 'image/jpeg', 21857),
(77, '', '', '', 'images-39 copy.jpg', '', 'image/jpeg', 24969),
(78, '', '', '', 'images-39.jpg', '', 'image/jpeg', 24969),
(79, '', '', '', 'images-40 copy.jpg', '', 'image/jpeg', 24385),
(80, '', '', '', 'images-40.jpg', '', 'image/jpeg', 24385),
(81, '', '', '', 'images-41 copy.jpg', '', 'image/jpeg', 16296),
(82, '', '', '', 'images-41.jpg', '', 'image/jpeg', 16296),
(83, '', '', '', 'images-42 copy.jpg', '', 'image/jpeg', 22401),
(84, '', '', '', 'images-42.jpg', '', 'image/jpeg', 22401),
(85, '', '', '', 'images-43 copy.jpg', '', 'image/jpeg', 27955),
(87, '', '', '', 'images-44 copy.jpg', '', 'image/jpeg', 29486),
(89, '', '', '', 'images-50 copy.jpg', '', 'image/jpeg', 21652);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `user_image`) VALUES
(3, 'admin', '1234', 'Utsav', 'Joshi', 'images-12.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo_id` (`photo_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
