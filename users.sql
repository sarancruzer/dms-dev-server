-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2018 at 05:36 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` int(11) NOT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wechat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_name`, `title`, `first_name`, `last_name`, `email`, `mobile`, `avatar`, `skype`, `wechat`, `role_id`, `password`, `remember_token`, `last_login`, `created_at`, `updated_at`, `status`) VALUES
(1, 0, '0', 'Saravanan', 'Nandhan', 'sarancruzer@dms.dev', '9597009544', NULL, NULL, NULL, 1, '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2017-12-04 10:30:34', '2017-10-10 06:56:39', '2017-12-04 10:30:34', 1),
(2, 0, '0', 'Suresh', 'Varan', 'suresh@dms.dev', '9895949134', NULL, NULL, NULL, 1, '$2y$10$5bqyMsE21wzeOIyhAypSsuvu4vKgjaIEHlmbTooRisLqDErVsLDuC', NULL, '2017-12-05 00:26:48', '2017-10-10 06:56:39', '2017-12-05 00:26:48', 1),
(3, 0, '0', 'David', 'David', 'david@dms.dev', '', NULL, NULL, NULL, 1, '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2018-02-08 16:24:45', '2017-10-10 06:56:40', '2018-02-08 10:54:45', 1),
(4, 0, '0', 'Chris', 'Sevilleja', 'chris@scotch.io', '', NULL, NULL, NULL, 1, '$2y$10$o2FSLbo13cW2lA4N.9UpOuR9sbJECFGfzolAuVd6W7NWaAl4Vv9QS', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(5, 0, '0', 'Holly', 'Lloyd', 'holly@scotch.io', '', NULL, NULL, NULL, NULL, '$2y$10$9.UilQnDBoN7LhUizQtTI.OHPLsfOB3Hv/tN.1qvfu3HD2/2rbjnK', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(8, 0, '0', 'saravana', 'veg3', 'sarancruzerr@gmail.com', '9597009544', NULL, NULL, NULL, 1, '$2y$10$9GyykrUVC2Nte4DivSHcZeUAkQQPNDbxrplJmoc.dFPKZeXhDysHa', NULL, NULL, NULL, NULL, 1),
(12, 0, '0', 'saravana', 'veg3', 'sarancruzesdfr@gmail.com', '9597009544', NULL, NULL, NULL, 1, '$2y$10$C24mhfNKNq.fz/KvO5kGAerpltZK9blUf71IETOQW4Dz3YWfYXteS', NULL, NULL, NULL, NULL, 1),
(13, 0, '0', 'asdf', 'asdf', 'sarancruzsadfer@gmail.com', '234234', NULL, NULL, NULL, 1, '$2y$10$d3kLZ//24FTvcWqEIGS9/eXjmJllO61Gq1sgGvzfmstbrGRTtWHim', NULL, NULL, NULL, NULL, 1),
(14, 0, '0', 'asdf', 'werwer', 'sarancruzer11s@gmail.com', '234234', NULL, NULL, NULL, 1, '$2y$10$TBut1QHeDNdnQVQx9NmqWerqdzEMJ6fNJqojPdRpVk35v/0P/MbcK', NULL, NULL, NULL, NULL, 1),
(15, 0, '0', 'Martin', 'Vana', 'mvana@sourcecorpvic.com.au', '7499084054', NULL, NULL, NULL, 2, '$2y$10$EwAGYlzI2sZ1wi.YHacvQeZ1BgnW7smEAkvTX1TfbfZY3Y2rFdnYm', NULL, NULL, NULL, NULL, 1),
(16, 2, 'Mrs', 'test ', 'testt', 'test@dms.com', '1523456463', NULL, 'ssss', 'werwerddddsSSSS', 2, '$2y$10$n4aU.AZnG2LCpB1mcgeux.is4jKoXTRz4BLyFzBn7RGBSamUsu.NK', NULL, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
