-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 13, 2017 at 09:15 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 5.6.32-1+ubuntu16.04.1+deb.sury.org+2

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
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `client_business` text COLLATE utf8_bin NOT NULL,
  `client_company_name` text COLLATE utf8_bin,
  `abn` varchar(10) COLLATE utf8_bin NOT NULL,
  `address1` text COLLATE utf8_bin NOT NULL,
  `address2` text COLLATE utf8_bin,
  `city` varchar(20) COLLATE utf8_bin NOT NULL,
  `state` int(11) NOT NULL,
  `post_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `web_address` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `business_type` int(11) NOT NULL,
  `client_size` int(11) NOT NULL,
  `annual_turnover` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `manage_license` int(11) NOT NULL,
  `notes` text COLLATE utf8_bin,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_business`, `client_company_name`, `abn`, `address1`, `address2`, `city`, `state`, `post_code`, `web_address`, `business_type`, `client_size`, `annual_turnover`, `manage_license`, `notes`, `created_at`, `updated_at`, `status`) VALUES
(1, 'asdf', 'liijasdflj', 'sdklfj', 'adsflaskdfjo', 'asdfasdflkj', 'kadsjfladsjf', 2, 'asdfkj', 'asdfadsf', 1, 2, 'asdfsd', 2, 'asdfdfkljwerkjlkjlad kladsfjkljasldkf jdwf', '2017-12-02 16:53:15', '2017-12-02 16:53:15', 1),
(2, 'Blah Blah', 'OPAT on the Park Pty Ltd', 'Unknown', '1 Turner Street', NULL, 'Abbotsford', 4, '3067', 'Bendigo', 16, 2, '20,000,000', 1, 'Problematic development - possible payment issue!', '2017-12-07 11:48:58', '2017-12-07 11:48:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_project_child`
--

CREATE TABLE `c_project_child` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `c_project_hdr_id` int(11) NOT NULL,
  `building_class_id` int(11) NOT NULL,
  `building_units` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_project_child`
--

INSERT INTO `c_project_child` (`id`, `project_id`, `c_project_hdr_id`, `building_class_id`, `building_units`) VALUES
(31, 3, 18, 1, '55'),
(32, 3, 18, 2, '66'),
(33, 3, 18, 2, '12'),
(34, 1, 19, 1, '10'),
(35, 1, 19, 2, '10'),
(36, 1, 20, 1, '101'),
(37, 1, 20, 2, '102'),
(38, 1, 20, 1, '33');

-- --------------------------------------------------------

--
-- Table structure for table `c_project_hdr`
--

CREATE TABLE `c_project_hdr` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `c_project_hdr`
--

INSERT INTO `c_project_hdr` (`id`, `project_id`, `project_type_id`, `created_at`, `updated_at`, `status`) VALUES
(18, 3, 1, '2017-12-12 17:31:13', '2017-12-12 17:31:13', 1),
(19, 1, 1, '2017-12-12 17:40:50', '2017-12-12 17:40:50', 1),
(20, 1, 2, '2017-12-12 17:40:50', '2017-12-12 17:40:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE `license` (
  `id` int(11) NOT NULL,
  `license_trading_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `company_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `address1` text COLLATE utf8_bin NOT NULL,
  `address2` text COLLATE utf8_bin,
  `city` varchar(20) COLLATE utf8_bin NOT NULL,
  `state` int(11) NOT NULL,
  `territory` int(11) NOT NULL,
  `biz_number` varchar(30) COLLATE utf8_bin NOT NULL,
  `bank_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `account_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `short_code` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `account_number` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `license`
--

INSERT INTO `license` (`id`, `license_trading_name`, `company_name`, `address1`, `address2`, `city`, `state`, `territory`, `biz_number`, `bank_name`, `account_name`, `short_code`, `account_number`, `created_at`, `updated_at`, `status`) VALUES
(1, 'asasdas', 'xcvzxcv', 'szvsdfsdf', NULL, 'asdfasdf', 2, 10, 'sadf', '23423sdfsadf', '234234234', 'sdfRRRR', 'as234234234aas', '2017-12-01 14:59:45', '2017-12-01 15:12:28', 0),
(2, 'asdf', 'asdf', 'asdf', 'asdf', 'asdfasd', 2, 8, '23424', 'asdfsadf', 'asdf', 'sd', '234234234', '2017-12-01 15:12:49', '2017-12-01 15:12:49', 1);

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
  `project_type_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_building_class`
--

INSERT INTO `m_building_class` (`id`, `project_type_id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'buildingclass1', 'bc1', 1, '2017-12-08 17:00:34', '2017-12-08 17:00:34'),
(2, 1, 'asdasd', '2345', 1, '2017-12-08 17:11:14', '2017-12-08 17:13:17');

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

--
-- Dumping data for table `m_client_size`
--

INSERT INTO `m_client_size` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Small', 'Small', 1, '2017-12-02 16:38:20', '2017-12-02 16:38:20'),
(2, 'Medium', 'Medium', 1, '2017-12-02 16:39:00', '2017-12-02 16:39:00'),
(3, 'Large', 'Large', 1, '2017-12-02 16:39:14', '2017-12-02 16:39:14');

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
(14, 'Retailer', 'RTL', 1, '2017-10-31 12:00:05', '2017-12-04 22:13:04'),
(15, 'Home Owner', 'HMO', 1, '2017-10-31 12:01:57', '2017-12-04 22:12:36'),
(16, 'Developer', 'DEV', 1, '2017-10-31 12:03:13', '2017-12-04 22:12:03'),
(17, 'Builder', 'BLD', 1, '2017-10-31 12:11:06', '2017-12-04 22:11:48'),
(18, 'Architect', 'ARCH', 1, '2017-10-31 12:11:52', '2017-12-04 22:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `m_contacts`
--

CREATE TABLE `m_contacts` (
  `id` int(11) NOT NULL,
  `client_name` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `surename` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `job_title` int(11) NOT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `wechat` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `m_contacts`
--

INSERT INTO `m_contacts` (`id`, `client_name`, `title`, `first_name`, `surename`, `salutation`, `job_title`, `mobile`, `email`, `skype`, `wechat`, `notes`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, 'ramanathan', 'p', 'testing', 1, '234234234', 'asdfadsf', '', '', '', '2017-12-13 11:39:13', '2017-12-13 11:39:13', 1),
(2, 1, 1, 'iyappan', 'p', 'testing', 2, '234234234', 'asdfadsf', '', '', '', '2017-12-13 11:39:13', '2017-12-13 11:39:13', 1),
(3, 1, 1, 'sudalai', 'manik', 'testing', 3, '234234234', 'asdfadsf', '', '', '', '2017-12-13 11:39:13', '2017-12-13 11:39:13', 1),
(4, 1, 1, 'mani', 'kandan', 'testing', 4, '234234234', 'asdfadsf', '', '', '', '2017-12-13 11:39:13', '2017-12-13 11:39:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_job_title`
--

CREATE TABLE `m_job_title` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `m_job_title`
--

INSERT INTO `m_job_title` (`id`, `name`, `short_code`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Project Manager', 'PM', '2017-12-13 11:33:16', '2017-12-13 11:33:16', 1),
(2, 'Developer', 'DEV', '2017-12-13 11:33:16', '2017-12-13 11:33:25', 1),
(3, 'Estimator', 'ES', '2017-12-13 11:33:16', '2017-12-13 11:33:16', 1),
(4, 'Site Manager', 'SM', '2017-12-13 11:33:16', '2017-12-13 11:33:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_modules`
--

CREATE TABLE `m_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
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
(11, 'Manage Clients', '/manageClient', '2017-11-03 12:15:14', '2017-12-02 17:13:18', 1),
(12, ' Manage License', '/manageLicense', '2017-11-03 12:15:14', '2017-11-03 12:15:14', 1),
(13, 'Manage Modules', '/manageModules', '2017-11-03 12:15:14', '2017-11-04 12:44:45', 1),
(14, 'Project Type', '/masters/projectType', '2017-11-03 12:15:14', '2017-12-08 12:57:33', 1),
(15, 'Building Class', '/masters/buildingClass', '2017-11-03 12:15:14', '2017-12-08 12:57:36', 1);

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

--
-- Dumping data for table `m_project_scope`
--

INSERT INTO `m_project_scope` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aluminium Windows', 'ALW', 1, '2017-12-13 20:01:21', '2017-12-13 20:01:21'),
(2, 'Aluminium Doors', 'ALD', 1, '2017-12-13 20:01:21', '2017-12-13 20:01:21'),
(3, 'Curtain Wall', 'ALC', 1, '2017-12-13 20:01:21', '2017-12-13 20:01:21'),
(4, 'Aluminium Louvres', 'ALL', 1, '2017-12-13 20:01:21', '2017-12-13 20:01:21');

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

--
-- Dumping data for table `m_project_type`
--

INSERT INTO `m_project_type` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'project type1', 'pt1', 1, '2017-12-08 14:26:57', '2017-12-08 14:26:57'),
(2, 'project type2', 'pt2', 1, '2017-12-08 14:27:15', '2017-12-08 14:27:15');

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
(2, 'Admin', 'Admin', '2017-11-03 12:13:28', '2017-11-04 11:55:27', 1),
(3, 'MANAGER', 'MN', '2017-11-30 11:23:48', '2017-11-30 11:23:48', 1);

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
(13, 1, 13, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1),
(14, 1, 14, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:01', 1),
(15, 1, 15, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1);

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
(2, 'New South Wales', 'NSW', 1, '2017-10-19 12:53:13', '2017-12-04 22:02:04'),
(4, 'Victoria', 'VIC', 1, '2017-10-28 11:10:35', '2017-12-04 22:01:43'),
(5, 'South Australia', 'SA', 1, '2017-12-04 22:02:26', '2017-12-04 22:02:26'),
(6, 'Western Australia', 'WA', 1, '2017-12-04 22:02:57', '2017-12-04 22:02:57'),
(7, 'Tasmania', 'TAS', 1, '2017-12-04 22:03:15', '2017-12-04 22:03:15');

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
(18, 'Western Australia', 'WA', 1, '2017-10-17 15:51:51', '2017-12-04 21:56:52'),
(19, 'Victoria', 'VIC', 1, '2017-10-17 15:53:18', '2017-12-04 21:56:08'),
(20, 'Geelong District VIC', 'V-GEEL', 1, '2017-10-17 15:54:56', '2017-12-04 21:59:52'),
(21, 'new territory', 'nty', 1, '2017-10-28 11:23:29', '2017-10-28 11:23:29'),
(22, 'builder', 'BBB', 1, '2017-12-07 03:35:13', '2017-12-07 03:35:13');

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
(1, 'Mr', 'Mr', 1, '2017-10-28 11:22:41', '2017-12-04 22:03:44'),
(2, 'Mrs', 'Mrs', 1, '2017-12-04 22:03:53', '2017-12-04 22:03:53'),
(3, 'Ms', 'Ms', 1, '2017-12-04 22:04:13', '2017-12-04 22:04:13');

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
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address1` text COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci,
  `city` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `post_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_name` int(11) NOT NULL,
  `project_status` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `website` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `levels_begin` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `levels_end` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `construction_start` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `construction_duration` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_name`, `address1`, `address2`, `city`, `state`, `post_code`, `client_name`, `project_status`, `description`, `website`, `levels_begin`, `levels_end`, `construction_start`, `construction_duration`, `created_at`, `updated_at`, `status`) VALUES
(1, 'PROJECT NAMES', 'kjlasdfxdfgdf', 'klasjdf', 'klasdf', 2, 'asdfkj', 1, 1, 'asdf', 'asdf', 'asdf', '2sadf', 'wer', 'GGHHHHHhg', '2017-12-03 23:17:14', '2017-12-03 23:17:14', 1),
(2, 'abcdcefrtttttttt', '45  jjjjjjjjjjjj', '6 Mackillop Drive', 'sydney', 2, '2153', 1, 1, 'builders', 'www.abcd.com', '5', '7', '4t nov', '10 months', '2017-12-07 03:32:30', '2017-12-07 03:32:30', 1),
(3, 'sadf', 'sdf', 'sdf', 'sdf', 5, 's234', 2, 1, 'sadf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', '2017-12-12 15:57:01', '2017-12-12 15:57:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_team`
--

CREATE TABLE `project_team` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `developer` int(11) NOT NULL,
  `project_manager` int(11) NOT NULL,
  `estimator` int(11) NOT NULL,
  `site_manager` int(11) NOT NULL,
  `architech` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `engineer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `building_surveyor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity_surveyor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `superintendent` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_team`
--

INSERT INTO `project_team` (`id`, `project_id`, `developer`, `project_manager`, `estimator`, `site_manager`, `architech`, `engineer`, `building_surveyor`, `quantity_surveyor`, `superintendent`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, 2, 3, 4, 'asdf', 'asdf', 'asdf', 'asdf', 'asdasdfasdasdfASDFS', '2017-12-13 12:44:30', '2017-12-13 19:55:14', 1);

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
(1, 'Saravanan', 'Nandhan', 'sarancruzer@dms.dev', '9597009544', NULL, 1, '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2017-12-04 10:30:34', '2017-10-10 06:56:39', '2017-12-04 10:30:34', 1),
(2, 'Suresh', 'Varan', 'suresh@dms.dev', '9895949134', NULL, 1, '$2y$10$5bqyMsE21wzeOIyhAypSsuvu4vKgjaIEHlmbTooRisLqDErVsLDuC', NULL, '2017-12-05 00:26:48', '2017-10-10 06:56:39', '2017-12-05 00:26:48', 1),
(3, 'David', 'David', 'david@dms.dev', '', NULL, 1, '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2017-12-13 13:49:46', '2017-10-10 06:56:40', '2017-12-13 08:19:46', 1),
(4, 'Chris', 'Sevilleja', 'chris@scotch.io', '', NULL, 1, '$2y$10$o2FSLbo13cW2lA4N.9UpOuR9sbJECFGfzolAuVd6W7NWaAl4Vv9QS', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(5, 'Holly', 'Lloyd', 'holly@scotch.io', '', NULL, NULL, '$2y$10$9.UilQnDBoN7LhUizQtTI.OHPLsfOB3Hv/tN.1qvfu3HD2/2rbjnK', NULL, NULL, '2017-10-10 06:56:40', '2017-10-10 06:56:40', 1),
(8, 'saravana', 'veg3', 'sarancruzerr@gmail.com', '9597009544', NULL, 1, '$2y$10$9GyykrUVC2Nte4DivSHcZeUAkQQPNDbxrplJmoc.dFPKZeXhDysHa', NULL, NULL, NULL, NULL, 1),
(12, 'saravana', 'veg3', 'sarancruzesdfr@gmail.com', '9597009544', NULL, 1, '$2y$10$C24mhfNKNq.fz/KvO5kGAerpltZK9blUf71IETOQW4Dz3YWfYXteS', NULL, NULL, NULL, NULL, 1),
(13, 'asdf', 'asdf', 'sarancruzsadfer@gmail.com', '234234', NULL, 1, '$2y$10$d3kLZ//24FTvcWqEIGS9/eXjmJllO61Gq1sgGvzfmstbrGRTtWHim', NULL, NULL, NULL, NULL, 1),
(14, 'asdf', 'werwer', 'sarancruzer11s@gmail.com', '234234', NULL, 1, '$2y$10$TBut1QHeDNdnQVQx9NmqWerqdzEMJ6fNJqojPdRpVk35v/0P/MbcK', NULL, NULL, NULL, NULL, 1),
(15, 'Martin', 'Vana', 'mvana@sourcecorpvic.com.au', '7499084054', NULL, 2, '$2y$10$EwAGYlzI2sZ1wi.YHacvQeZ1BgnW7smEAkvTX1TfbfZY3Y2rFdnYm', NULL, NULL, NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_project_child`
--
ALTER TABLE `c_project_child`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_project_hdr`
--
ALTER TABLE `c_project_hdr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license`
--
ALTER TABLE `license`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `m_client_size`
--
ALTER TABLE `m_client_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_client_type`
--
ALTER TABLE `m_client_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_contacts`
--
ALTER TABLE `m_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_job_title`
--
ALTER TABLE `m_job_title`
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
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_team`
--
ALTER TABLE `project_team`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `c_project_child`
--
ALTER TABLE `c_project_child`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `c_project_hdr`
--
ALTER TABLE `c_project_hdr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `license`
--
ALTER TABLE `license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `m_building_class`
--
ALTER TABLE `m_building_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_client_size`
--
ALTER TABLE `m_client_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_client_type`
--
ALTER TABLE `m_client_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `m_contacts`
--
ALTER TABLE `m_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `m_job_title`
--
ALTER TABLE `m_job_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `m_modules`
--
ALTER TABLE `m_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `m_product_size`
--
ALTER TABLE `m_product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_project_scope`
--
ALTER TABLE `m_project_scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `m_project_status`
--
ALTER TABLE `m_project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_project_type`
--
ALTER TABLE `m_project_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_roles`
--
ALTER TABLE `m_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_roles_modules`
--
ALTER TABLE `m_roles_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `m_state`
--
ALTER TABLE `m_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `m_territory`
--
ALTER TABLE `m_territory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `m_title`
--
ALTER TABLE `m_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project_team`
--
ALTER TABLE `project_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
