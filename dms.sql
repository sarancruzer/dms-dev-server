-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 04, 2017 at 05:33 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_client_type`
--

INSERT INTO `m_client_type` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'asdfasdfsdfsdf', 'aSDFSA', 1, '2017-10-19 13:01:10', '2017-10-19 13:01:10'),
(2, 'sdfASDF', 'sdfRRRR', 1, '2017-10-19 13:01:17', '2017-10-19 13:01:29'),
(3, 'asdfasdfsdfsdfasdf', 'WERWER', 1, '2017-10-19 13:06:04', '2017-10-19 13:06:04'),
(4, 'sadfsadf', 'sadf', 1, '2017-10-19 14:08:02', '2017-10-19 14:10:17'),
(5, 'sad', 'asdf', 1, '2017-10-19 14:37:05', '2017-10-19 14:37:05'),
(6, 'sdf', 'sdf', 1, '2017-10-19 14:37:41', '2017-10-19 14:37:41'),
(7, 'asdfasdf', 'aSDFsadf', 1, '2017-10-19 14:38:00', '2017-10-19 14:38:00'),
(8, 'SAfsdf', 'sdfsdf', 1, '2017-10-19 14:38:33', '2017-10-19 14:38:33'),
(9, 'asdfasdff', 'asdfsadf', 1, '2017-10-19 14:44:20', '2017-10-19 14:44:20'),
(10, 'sdfASdfAASD', 'AAAfasdf', 1, '2017-10-28 11:27:22', '2017-10-28 11:27:22'),
(11, 'sfsd', 'dgsd', 1, '2017-10-28 14:07:07', '2017-10-28 14:07:07'),
(12, 'fghfgh', 'fgdfg', 1, '2017-10-28 14:11:07', '2017-10-28 14:11:07'),
(13, 'asdasd', 'asdasd', 1, '2017-10-28 15:23:41', '2017-10-28 15:23:41'),
(14, 'https://github.com', 'sdf', 1, '2017-10-31 12:00:05', '2017-10-31 12:00:05'),
(15, 'https://github.comd', 'sdfsdf', 1, '2017-10-31 12:01:57', '2017-10-31 12:01:57'),
(16, 'sdfadsfg', 'sdfsdf', 1, '2017-10-31 12:03:13', '2017-10-31 12:06:49'),
(17, 'GGG', 'aSDasd', 1, '2017-10-31 12:11:06', '2017-10-31 12:11:18'),
(18, 'sdFhtreee', 'SDF', 1, '2017-10-31 12:11:52', '2017-10-31 12:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `m_modules`
--

CREATE TABLE `m_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `m_modules`
--

INSERT INTO `m_modules` (`id`, `name`, `url`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Territory', '/masters/territory', '2017-11-03 12:15:14', '2017-11-04 11:50:59', 1),
(2, 'State', '/masters/state', '2017-11-03 12:15:14', '2017-11-03 12:15:58', 1),
(3, 'Title', '/masters/title', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(4, 'Client Type', '/masters/clientType', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(5, 'Client Size', '/masters/clientSize', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(6, ' Manage Users', '/manageUsers', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(7, 'Masters', '/masters', '2017-11-03 12:15:14', '2017-11-04 12:44:45', 1),
(8, ' Manage Roles', '/manageRoles', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(9, 'Manage Modules', '/manageModules', '2017-11-03 12:15:14', '2017-11-04 12:44:45', 1),
(10, ' Role Privilleges', '/rolePrivilleges', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(11, 'Manage Clients', '/manageClients', '2017-11-03 12:15:14', '2017-11-04 12:44:45', 1),
(12, ' Manage License', '/manageLicense', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(13, 'Manage Modules', '/manageModules', '2017-11-03 12:15:14', '2017-11-04 12:44:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_product_size`
--

CREATE TABLE `m_product_size` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `m_roles`
--

CREATE TABLE `m_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `m_roles`
--

INSERT INTO `m_roles` (`id`, `name`, `short_code`, `created_at`, `updated_at`, `status`) VALUES
(1, 'SuperAdmin', 'SuperAdmin', '2017-11-03 12:13:15', '2017-11-04 11:55:23', 1),
(2, 'Admin', 'Admin', '2017-11-03 12:13:28', '2017-11-04 11:55:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_roles_modules`
--

CREATE TABLE `m_roles_modules` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `create_c` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `read_r` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `update_u` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `delete_d` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `m_roles_modules`
--

INSERT INTO `m_roles_modules` (`id`, `role_id`, `module_id`, `create_c`, `read_r`, `update_u`, `delete_d`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:53', 1),
(2, 1, 2, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:55', 1),
(3, 1, 3, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:58', 1),
(4, 1, 4, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:59', 1),
(5, 1, 5, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:01', 1),
(6, 1, 6, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1),
(7, 1, 7, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1),
(8, 1, 8, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:53', 1),
(9, 1, 9, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:55', 1),
(10, 1, 10, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:58', 1),
(11, 1, 11, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:05:59', 1),
(12, 1, 12, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:01', 1),
(13, 1, 13, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_state`
--

CREATE TABLE `m_state` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_state`
--

INSERT INTO `m_state` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(2, 'TAMILNADU', 'TN', 1, '2017-10-19 12:53:13', '2017-10-28 11:10:53'),
(4, 'DELHI', 'DE', 1, '2017-10-28 11:10:35', '2017-10-28 11:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `m_territory`
--

CREATE TABLE `m_territory` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_territory`
--

INSERT INTO `m_territory` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(3, 'asdf', 'asdf', 1, '2017-10-14 18:30:46', '2017-10-14 18:30:46'),
(4, 'asdfsadf', 'asdfsfd', 1, '2017-10-14 19:13:21', '2017-10-14 19:13:21'),
(8, 'SARA-CHECK1', 'AAA', 1, '2017-10-14 19:40:57', '2017-10-17 10:26:15'),
(10, 'IYAPPAN', 'ANNA', 1, '2017-10-17 10:33:18', '2017-10-17 10:33:18'),
(11, 'GGG', 'HH', 1, '2017-10-17 10:41:35', '2017-10-17 10:41:35'),
(12, 'rrrr', 'eEEEE', 1, '2017-10-17 10:42:46', '2017-10-17 10:42:46'),
(13, 'SARA-CHECK5', 'COMP', 1, '2017-10-17 10:47:50', '2017-10-17 10:47:50'),
(14, 'created', 'CR', 1, '2017-10-17 10:49:32', '2017-10-17 10:49:32'),
(15, 'TREAT', 'CHECK', 1, '2017-10-17 10:50:17', '2017-10-17 10:50:17'),
(17, 'ASDF', 'QWER', 1, '2017-10-17 15:03:55', '2017-10-17 15:03:55'),
(18, 'welcome ', 'TOAST', 1, '2017-10-17 15:51:51', '2017-10-17 15:51:51'),
(19, 'welcome 2', 'TOA', 1, '2017-10-17 15:53:18', '2017-10-17 15:53:18'),
(20, 'sadfTR', 'TREEE', 1, '2017-10-17 15:54:56', '2017-10-17 15:54:56'),
(21, 'new territory', 'nty', 1, '2017-10-28 11:23:29', '2017-10-28 11:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `m_title`
--

CREATE TABLE `m_title` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_title`
--

INSERT INTO `m_title` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'new title one', 'ntt', 1, '2017-10-28 11:22:41', '2017-10-28 11:22:55');

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

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile`, `avatar`, `role_id`, `password`, `remember_token`, `last_login`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Saravanan', 'Nandhan', 'sarancruzer@dms.dev', '9597009544', NULL, 1, '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2017-11-04 09:10:08', '2017-10-10 06:56:39', '2017-11-04 03:40:08', 1),
(2, 'Admin', 'Admin', 'admin@dms.dev', '9895949134', NULL, NULL, '$2y$10$5bqyMsE21wzeOIyhAypSsuvu4vKgjaIEHlmbTooRisLqDErVsLDuC', NULL, NULL, '2017-10-10 06:56:39', '2017-10-10 06:56:39', 1),
(3, 'Ryan', 'Chenkie', 'ryan@dms.dev', '', NULL, NULL, '$2y$10$KFvJlG/6gv3s1dJBM8wkXOgD3HCrYOt8uL2rsc7QdcAjG0lG1CSru', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(4, 'Chris', 'Sevilleja', 'chris@scotch.io', '', NULL, NULL, '$2y$10$o2FSLbo13cW2lA4N.9UpOuR9sbJECFGfzolAuVd6W7NWaAl4Vv9QS', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(5, 'Holly', 'Lloyd', 'holly@scotch.io', '', NULL, NULL, '$2y$10$9.UilQnDBoN7LhUizQtTI.OHPLsfOB3Hv/tN.1qvfu3HD2/2rbjnK', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(6, 'Adnan', 'Kukic', 'adnan@scotch.io', '', NULL, NULL, '$2y$10$BiYNacDyMoWOZKxIxmjenuiuGcO9a0ELwKmNbYyUBi6Yax5bAZE7m', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1);

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
-- Indexes for table `m_modules`
--
ALTER TABLE `m_modules`
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
-- Indexes for table `m_roles`
--
ALTER TABLE `m_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_roles_modules`
--
ALTER TABLE `m_roles_modules`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `m_modules`
--
ALTER TABLE `m_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
-- AUTO_INCREMENT for table `m_roles`
--
ALTER TABLE `m_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_roles_modules`
--
ALTER TABLE `m_roles_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `m_state`
--
ALTER TABLE `m_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `m_territory`
--
ALTER TABLE `m_territory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `m_title`
--
ALTER TABLE `m_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
