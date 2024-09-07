-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 08, 2024 at 04:17 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

DROP TABLE IF EXISTS `booked`;
CREATE TABLE IF NOT EXISTS `booked` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `ref_no` text COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `SorSL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1= sleeper 2= semi sleeper',
  `qty` int NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `SorSL`, `qty`, `status`, `date_updated`) VALUES
(4, 3, '202310171313', 'zoro', '', 2, 1, '2023-10-17 16:27:09'),
(5, 3, '20231017413', 'enzo', '', 2, 0, '2023-10-17 16:26:30'),
(6, 3, '202310178072', 'steve', '', 2, 1, '2023-10-17 21:21:45'),
(7, 6, '202310183772', 'ashwin', '', 6, 1, '2023-10-18 12:13:57'),
(8, 4, '202310181038', 'cijo', '', 2, 0, '2023-10-18 09:48:26'),
(9, 6, '202310183944', 'antony', '', 2, 1, '2023-10-18 15:25:16'),
(10, 5, '202310186644', 'cijo', '', 4, 0, '2023-10-18 16:02:52'),
(11, 9, '20240113691', 'vasu', '1', 2, 0, '2024-01-13 16:30:49'),
(12, 9, '202401134679', 'ZB REFLEX', '1', 2, 0, '2024-01-13 22:39:01'),
(13, 11, '202401156834', 'navaneeth', '1', 2, 0, '2024-01-15 15:49:21'),
(14, 11, '202401189745', 'unni', '1', 2, 0, '2024-01-18 20:25:42'),
(15, 11, '202402275405', 'unni', '1', 5, 0, '2024-02-27 20:34:27'),
(16, 11, '202402271522', 'unni', '1', 2, 0, '2024-02-27 20:34:56'),
(17, 11, '', 'unni', '1', 4, 1, '2024-03-04 00:13:50'),
(18, 11, '202403013050', 'unni', '1', 4, 0, '2024-03-01 20:40:56'),
(19, 13, '202403011799', 'chennika', '1', 4, 0, '2024-03-01 21:32:48'),
(20, 11, '202403033320', 'docy', '1', 2, 0, '2024-03-03 21:56:47'),
(21, 13, '202403046985', 'unni', '1', 3, 0, '2024-03-04 22:26:29'),
(22, 13, '202403055580', 'sidhan', '1', 2, 0, '2024-03-05 12:55:14'),
(23, 13, '202403052750', 'hussain', '1', 2, 0, '2024-03-05 13:15:58'),
(24, 15, '202403065466', 'sidhan', '1', 5, 0, '2024-03-06 22:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
CREATE TABLE IF NOT EXISTS `bus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `bus_number` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `SorSL` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `SorSL`, `status`, `date_updated`) VALUES
(3, 'Economy', '5001', '', 0, '2023-10-17 16:11:14'),
(4, 'chennika', '6393', '', 0, '2024-01-10 17:50:35'),
(5, 'chennika', '6397', '', 0, '2024-01-10 17:50:36'),
(6, 'super fast', '4717', '', 0, '2024-01-10 17:50:32'),
(7, 'aradhya', '7174', '', 0, '2024-01-10 17:50:37'),
(8, 'minnal', '3241', '', 0, '2024-01-10 17:50:30'),
(9, 'limited stop', '4222', '', 0, '2024-01-10 17:50:31'),
(10, 'chennika', '2', '', 0, '2024-03-06 14:29:39'),
(11, '22chen04', '1', '', 0, '2024-03-06 14:29:36'),
(12, 'aa', '3', '', 0, '2024-03-06 14:29:42'),
(13, 'bb', '444', '', 0, '2024-03-06 14:29:45'),
(14, 'cc', '444', '', 0, '2024-03-06 14:29:48'),
(15, 'chennika', '4257', '', 1, '2024-03-06 14:31:14'),
(16, 'sree murukkan', '1212', '', 1, '2024-03-06 14:31:36'),
(17, 'ambady', '5257', '', 1, '2024-03-06 14:32:03'),
(18, 'komban', '7275', '', 1, '2024-03-06 14:33:39'),
(19, 'oneness', '1212', '', 1, '2024-03-06 15:07:07'),
(20, 'green kerala', '4556', '', 1, '2024-03-06 15:07:24'),
(21, '20 20', '2020', '', 1, '2024-03-06 15:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `busdetails`
--

DROP TABLE IF EXISTS `busdetails`;
CREATE TABLE IF NOT EXISTS `busdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `busno` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rcbook` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `busdetails`
--

INSERT INTO `busdetails` (`id`, `busname`, `busno`, `rcbook`, `status`) VALUES
(9, 'sree murukkan', '1212', 'ka-12-ha-05', 0),
(10, 'oness', '1212', 'kl-asa-45', 0),
(11, '20 20', '20 20', 'kh-45-a-002', 0),
(12, 'chennika', '4257', 'sh-425-s7', 0),
(13, 'green kerala', '4556', 'dh-45-oo-07', 0),
(14, 'ambady', '5257', 'ka-12-ha-04', 0),
(15, 'komban', '7275', 'kl-as-55-45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `driverdetail`
--

DROP TABLE IF EXISTS `driverdetail`;
CREATE TABLE IF NOT EXISTS `driverdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `d_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `d_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `d_license` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bus_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bus_number` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bus_route` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driverdetail`
--

INSERT INTO `driverdetail` (`id`, `d_name`, `d_address`, `d_license`, `bus_name`, `bus_number`, `bus_route`) VALUES
(1, 'arun', '\r\nvilla house,kochi,682505', 'KL19023335544', 'Chennika', 'KLQ2658', 'trichy to ernakulam');

-- --------------------------------------------------------

--
-- Table structure for table `fd`
--

DROP TABLE IF EXISTS `fd`;
CREATE TABLE IF NOT EXISTS `fd` (
  `id` int NOT NULL,
  `quality_score` tinyint NOT NULL COMMENT '0=bad,1=okay,2=good',
  `feedback` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd`
--

INSERT INTO `fd` (`id`, `quality_score`, `feedback`) VALUES
(0, 1, 'very good'),
(0, 1, 'okay i like it'),
(0, 1, 'very good'),
(0, 0, 'verybad'),
(0, 0, 'verybad');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `terminal_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `state` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'Sample Terminal Name', 'Sample City', 'Sample', 0, '2023-10-17 16:17:57'),
(2, 'South Sample Terminal', 'South City', 'Sample', 0, '2023-10-17 16:17:59'),
(3, 'vypin', 'ernakulam', 'puthuvype', 0, '2024-01-14 16:42:06'),
(4, 'thrissur', 'thrissur', 'bus stand', 0, '2024-01-14 16:42:04'),
(5, 'bengaluru', 'chennai', 'bus stand', 0, '2024-01-14 16:41:59'),
(6, 'chennai', 'chenai', 'bus stand', 0, '2024-01-14 16:42:00'),
(7, 'pathanamthitta', 'pathanamthitta', 'bus stand', 0, '2024-01-14 16:42:02'),
(8, 'trichy', 'chennai', 'trichy', 1, '2024-01-14 16:42:55'),
(9, 'madurai', 'chennai', 'madurai', 0, '2024-01-15 21:06:02'),
(10, 'chennai c', 'chennai', 'theni', 0, '2024-01-15 20:34:43'),
(11, 'salem', 'chennai', 'sale', 0, '2024-01-15 22:00:28'),
(12, 'ernakulam', 'ernakulam', 'kochi', 1, '2024-03-05 15:52:17'),
(13, 'Thanjavur', 'Chennai', 'Thrissur', 1, '2024-03-06 14:14:54'),
(14, 'Hyderabad', 'Hyderabad ', 'Bangalore', 1, '2024-03-06 14:15:39'),
(15, 'Kolkata', 'Kolkata', 'Mumbai', 1, '2024-03-06 14:16:19'),
(16, 'delhi', 'delhi', 'delhi', 1, '2024-03-06 15:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

DROP TABLE IF EXISTS `schedule_list`;
CREATE TABLE IF NOT EXISTS `schedule_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bus_id` int NOT NULL,
  `from_location` int NOT NULL,
  `to_location` int NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `availability` int NOT NULL,
  `price` text COLLATE utf8mb4_general_ci NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 3, 1, 1, '2020-09-11 16:00:00', '2020-09-12 02:00:00', 0, 30, '250', '2023-10-17 10:47:42'),
(2, 3, 2, 1, '2020-09-12 02:45:00', '2020-09-12 05:00:00', 0, 30, '250', '2023-10-17 10:47:44'),
(3, 6, 3, 4, '2023-10-19 16:22:00', '2023-10-18 18:00:00', 0, 12, '50', '2024-01-10 12:20:10'),
(4, 7, 4, 5, '2023-10-19 12:00:00', '2023-10-19 13:00:00', 0, 15, '40', '2024-01-10 12:20:12'),
(5, 5, 5, 4, '2023-10-18 09:00:00', '2023-10-18 11:00:00', 0, 15, '40', '2024-01-10 12:20:07'),
(6, 7, 4, 5, '2023-10-19 13:00:00', '2023-10-19 12:00:00', 0, 20, '45', '2024-01-10 12:20:14'),
(7, 9, 3, 6, '2023-10-20 13:00:00', '2023-10-18 15:00:00', 0, 20, '300', '2024-01-10 12:20:16'),
(8, 8, 6, 4, '2023-10-18 14:00:00', '2023-10-18 15:00:00', 0, 26, '200', '2024-01-10 12:20:09'),
(9, 11, 5, 5, '2024-01-11 12:00:00', '2024-01-11 13:00:00', 0, 20, '50', '2024-01-14 11:14:34'),
(10, 10, 6, 5, '2024-01-20 14:00:00', '2024-01-12 13:00:00', 0, 20, '50', '2024-01-14 11:14:36'),
(11, 10, 8, 9, '2024-01-14 18:00:00', '2024-01-14 20:00:00', 0, 20, '300', '2024-03-06 07:49:21'),
(12, 11, 11, 8, '2024-01-15 19:00:00', '2024-01-15 22:00:00', 0, 20, '420', '2024-03-06 08:43:00'),
(13, 13, 9, 10, '2024-01-14 18:00:00', '2024-01-14 21:00:00', 0, 20, '300', '2024-03-06 08:42:56'),
(14, 11, 8, 12, '2024-03-06 15:52:00', '2024-03-07 17:00:00', 0, 5, '20', '2024-03-06 08:43:03'),
(15, 15, 8, 12, '2024-03-06 19:00:00', '2024-03-07 16:00:00', 1, 20, '50', '2024-03-06 09:38:59'),
(16, 15, 12, 8, '2024-03-07 20:00:00', '2024-03-08 17:00:00', 1, 15, '50', '2024-03-06 10:13:33'),
(17, 16, 8, 13, '2024-03-06 20:00:00', '2024-03-08 19:00:00', 1, 20, '65', '2024-03-06 10:14:24'),
(18, 18, 12, 16, '2024-03-06 18:00:00', '2024-03-07 09:00:00', 1, 20, '150', '2024-03-06 10:15:04'),
(19, 19, 14, 16, '2024-03-08 15:45:00', '2024-03-06 21:00:00', 1, 16, '150', '2024-03-06 10:15:45'),
(20, 20, 15, 12, '2024-03-06 12:00:00', '2024-03-06 19:00:00', 1, 10, '135', '2024-03-06 10:16:31'),
(21, 20, 12, 15, '2024-03-08 18:00:00', '2024-03-09 18:00:00', 1, 15, '150', '2024-03-06 10:17:20'),
(22, 21, 16, 13, '2024-03-10 15:49:00', '2024-03-10 11:00:00', 1, 20, '150', '2024-03-06 10:19:44'),
(23, 18, 16, 12, '2024-03-07 15:51:00', '2024-03-06 23:00:00', 1, 20, '175', '2024-03-06 10:21:39'),
(24, 16, 13, 8, '2024-03-07 15:52:00', '2024-03-06 19:00:00', 1, 20, '166', '2024-03-06 10:22:32'),
(25, 20, 14, 16, '2024-03-06 20:00:00', '2024-03-06 14:00:00', 1, 4, '150', '2024-03-06 16:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `name`, `email`, `username`, `password`, `status`) VALUES
(1, 'user', '', 'user', 'user123', 0),
(4, 'anuroop', 'gamingdevilop20@gmail.com', 'anu', '9904fd42e4977d5815b5d5679a935ed5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = admin, 2= user\r\n ',
  `username` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Administrator', 1, 'admin', 'admin123', 1, '2020-09-08 16:42:28'),
(4, 'user', 1, 'user', 'user123', 1, '2024-02-27 21:58:23');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
