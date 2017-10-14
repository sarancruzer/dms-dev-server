-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 14, 2017 at 07:45 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 5.6.31-4+ubuntu16.04.1+deb.sury.org+4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2017_10_10_120929_create_states_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_building_class`
--

CREATE TABLE `m_building_class` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_size`
--

CREATE TABLE `m_client_size` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_client_type`
--

CREATE TABLE `m_client_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_product_size`
--

CREATE TABLE `m_product_size` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_project_scope`
--

CREATE TABLE `m_project_scope` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` int(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_project_status`
--

CREATE TABLE `m_project_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_project_type`
--

CREATE TABLE `m_project_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_state`
--

CREATE TABLE `m_state` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(20) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_territory`
--

CREATE TABLE `m_territory` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `short_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_territory`
--

INSERT INTO `m_territory` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(2, 'asdf', 'asdf', 1, '2017-10-14 18:30:46', '2017-10-14 18:30:46'),
(3, 'asdf', 'asdf', 1, '2017-10-14 18:30:46', '2017-10-14 18:30:46'),
(4, 'asdfsadf', 'asdfsfd', 1, '2017-10-14 19:13:21', '2017-10-14 19:13:21'),
(5, 'asdfasdfasdf', 'aSD', 1, '2017-10-14 19:18:21', '2017-10-14 19:18:21'),
(6, 'sadf', 'asdf', 1, '2017-10-14 19:32:29', '2017-10-14 19:32:29'),
(7, 'asfdasd', 'asD', 1, '2017-10-14 19:40:42', '2017-10-14 19:40:42'),
(8, 'Saravanan', 'TTTTT', 1, '2017-10-14 19:40:57', '2017-10-14 19:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `m_title`
--

CREATE TABLE `m_title` (
  `id` int(11) NOT NULL,
  `name` int(20) NOT NULL,
  `short_code` int(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile`, `avatar`, `user_type`, `password`, `remember_token`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'Saravanan', 'Nandhan', 'sarancruzer@dms.dev', '9597009544', NULL, 'admin', '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2017-10-14 14:11:02', '2017-10-10 06:56:39', '2017-10-14 08:41:02'),
(2, 'Admin', 'Admin', 'admin@dms.dev', '9895949134', NULL, 'admin', '$2y$10$5bqyMsE21wzeOIyhAypSsuvu4vKgjaIEHlmbTooRisLqDErVsLDuC', NULL, NULL, '2017-10-10 06:56:39', '2017-10-10 06:56:39'),
(3, 'Ryan', 'Chenkie', 'ryan@dms.dev', '', NULL, 'admin', '$2y$10$KFvJlG/6gv3s1dJBM8wkXOgD3HCrYOt8uL2rsc7QdcAjG0lG1CSru', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40'),
(4, 'Chris', 'Sevilleja', 'chris@scotch.io', '', NULL, 'admin', '$2y$10$o2FSLbo13cW2lA4N.9UpOuR9sbJECFGfzolAuVd6W7NWaAl4Vv9QS', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40'),
(5, 'Holly', 'Lloyd', 'holly@scotch.io', '', NULL, 'admin', '$2y$10$9.UilQnDBoN7LhUizQtTI.OHPLsfOB3Hv/tN.1qvfu3HD2/2rbjnK', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40'),
(6, 'Adnan', 'Kukic', 'adnan@scotch.io', '', NULL, 'admin', '$2y$10$BiYNacDyMoWOZKxIxmjenuiuGcO9a0ELwKmNbYyUBi6Yax5bAZE7m', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_building_class`
--
ALTER TABLE `m_building_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_client_type`
--
ALTER TABLE `m_client_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_product_size`
--
ALTER TABLE `m_product_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_project_scope`
--
ALTER TABLE `m_project_scope`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_project_status`
--
ALTER TABLE `m_project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_project_type`
--
ALTER TABLE `m_project_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_state`
--
ALTER TABLE `m_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_territory`
--
ALTER TABLE `m_territory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_title`
--
ALTER TABLE `m_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `m_building_class`
--
ALTER TABLE `m_building_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_client_type`
--
ALTER TABLE `m_client_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_product_size`
--
ALTER TABLE `m_product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_project_scope`
--
ALTER TABLE `m_project_scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_project_status`
--
ALTER TABLE `m_project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_project_type`
--
ALTER TABLE `m_project_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_state`
--
ALTER TABLE `m_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_territory`
--
ALTER TABLE `m_territory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `m_title`
--
ALTER TABLE `m_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
