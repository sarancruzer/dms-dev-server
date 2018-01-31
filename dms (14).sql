-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2018 at 09:03 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 5.6.33-1+ubuntu16.04.1+deb.sury.org+1

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
(89, 3, 54, 1, '500'),
(90, 3, 54, 2, '100'),
(91, 2, 55, 2, '500'),
(92, 1, 56, 1, '100'),
(93, 1, 56, 2, '100');

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
(54, 3, 1, '2018-01-30 20:52:44', '2018-01-30 20:52:44', 1),
(55, 2, 2, '2018-01-30 20:53:41', '2018-01-30 20:53:41', 1),
(56, 1, 1, '2018-01-30 20:53:53', '2018-01-30 20:53:53', 1);

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
  `is_configured` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_building_class`
--

INSERT INTO `m_building_class` (`id`, `project_type_id`, `name`, `short_code`, `status`, `is_configured`, `created_at`, `updated_at`) VALUES
(1, 1, 'buildingclass1', 'bc1', 1, 1, '2017-12-08 17:00:34', '2018-01-19 19:34:09'),
(2, 1, 'asdasd', '2345', 1, 1, '2017-12-08 17:11:14', '2018-01-20 17:58:08');

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
(4, 2, 1, 'mani', 'kandan', 'testing', 4, '234234234', 'asdfadsf', '', '', '', '2017-12-13 11:39:13', '2018-01-26 18:28:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_items`
--

CREATE TABLE `m_items` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `db_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_items`
--

INSERT INTO `m_items` (`id`, `name`, `short_code`, `db_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aluminium Windows', 'ALW', 'aluminium_windows', 1, '2017-12-13 20:01:21', '2017-12-15 14:20:55'),
(2, 'Aluminium Doors', 'ALD', 'aluminium_doors', 1, '2017-12-13 20:01:21', '2017-12-15 14:21:06'),
(3, 'Curtain Wall', 'ALC', 'curtain_wall', 1, '2017-12-13 20:01:21', '2017-12-15 14:21:16'),
(4, 'Aluminium Louvres', 'ALL', 'aluminium_louvres', 1, '2017-12-13 20:01:21', '2017-12-15 14:21:27'),
(5, 'Kitchens', 'JKT', 'kitchens', 1, '2017-12-15 14:22:35', '2018-01-08 17:24:56'),
(6, 'Kitchenettes', 'JLN', 'kitchenettes', 1, '2017-12-15 14:23:23', '2018-01-08 17:25:04'),
(7, 'Bedrooms', 'JBT', 'bedrooms', 1, '2017-12-15 14:23:23', '2018-01-08 17:25:15'),
(8, 'Laundries', 'STN', 'laundries', 1, '2017-12-15 18:59:46', '2018-01-08 17:25:26'),
(9, 'Bathrooms', 'JOT', 'bathrooms', 1, '2017-12-15 18:59:46', '2018-01-08 17:25:36'),
(10, 'Ensuites', 'JBD', 'ensuites', 1, '2017-12-15 19:06:07', '2018-01-08 17:25:47'),
(11, 'Balconies', 'GLA', 'balconies', 1, '2017-12-15 19:06:07', '2018-01-08 17:24:41'),
(12, 'Powder Rooms/Toilets', 'PRT', 'powder_rooms_toilets', 1, '2017-12-15 19:06:38', '2018-01-10 17:42:32'),
(13, 'Showers', 'SHW', 'showers', 1, '2017-12-15 19:06:38', '2018-01-10 17:42:51'),
(14, 'Storage', 'FLR', 'storage', 1, '2017-12-15 19:06:58', '2018-01-10 17:43:13'),
(15, 'Study', 'JST', 'study', 1, '2017-12-15 19:06:58', '2018-01-10 17:43:31'),
(16, 'Garages', 'GGD', 'garages', 1, '2017-12-15 19:06:58', '2018-01-10 17:44:05'),
(17, 'Other', 'OTH', 'other', 1, '2017-12-15 19:06:58', '2018-01-10 18:02:51'),
(18, 'All Joinery', 'all_joinery', 'all_joinery', 1, '2017-12-15 19:06:58', '2018-01-10 17:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `m_items_supply`
--

CREATE TABLE `m_items_supply` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `db_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_items_supply`
--

INSERT INTO `m_items_supply` (`id`, `name`, `short_code`, `db_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aluminium Louvres', 'ALL', 'aluminium_louvres', 1, '2017-12-13 20:01:21', '2018-01-10 11:01:40'),
(2, 'Aluminium windows/doors', 'ALW, ALD', 'aluminium_windows_doors', 1, '2017-12-13 20:01:21', '2018-01-10 11:01:53'),
(3, 'Appliances', 'JKT,JLN,STN', 'appliances', 1, '2017-12-13 20:01:21', '2018-01-10 11:02:42'),
(4, 'Balustrade', 'GLA', 'balustrade', 1, '2017-12-13 20:01:21', '2018-01-10 11:02:57'),
(5, 'Bedroom', 'JBT', 'bedroom', 1, '2017-12-15 14:22:35', '2018-01-10 11:03:10'),
(6, 'Benchtops', 'JKT,JLN,STN', 'benchtops', 1, '2017-12-15 14:23:23', '2018-01-10 11:03:40'),
(7, 'Bookcase/Mediashelf', 'JST', 'bookcase_mediashelf', 1, '2017-12-15 14:23:23', '2018-01-10 11:03:57'),
(8, 'Curtain Wall', 'ALC', 'curtain_wall', 1, '2017-12-15 18:59:46', '2018-01-10 11:04:06'),
(9, 'Desks', 'JST', 'desks', 1, '2017-12-15 18:59:46', '2018-01-08 20:26:46'),
(10, 'Ensuit/Bathroom', 'JBD,JOT', 'ensuit_bathroom', 1, '2017-12-15 19:06:07', '2018-01-10 11:04:41'),
(11, 'Flooring', 'JKT,JLN,STN,JBD,JOT,JBT, PRT', 'flooring', 1, '2017-12-15 19:06:07', '2018-01-10 11:04:52'),
(12, 'Garage Doors', 'GGD', 'garage_doors', 1, '2017-12-15 19:06:38', '2018-01-10 11:05:06'),
(13, 'Kitchen', 'JKT,JLN', 'kitchen', 1, '2017-12-15 19:06:38', '2018-01-10 11:05:19'),
(14, 'Laundry', 'STN', 'laundry', 1, '2017-12-15 19:06:58', '2018-01-10 11:06:16'),
(15, 'Other', 'OTH', 'other', 1, '2017-12-15 19:06:58', '2018-01-10 11:06:23'),
(16, 'Powder Room/Toilet', 'PRT', 'powder_room_toilet', 1, '2017-12-15 19:06:58', '2018-01-10 11:06:32'),
(17, 'Sanitaryware', 'JKT,JLN,STN,JBD, JOT, PRT', 'sanitaryware', 1, '2018-01-08 14:46:50', '2018-01-10 11:06:42'),
(18, 'Sinks/Tubs/Basins', 'JKT,JLN,STN,JBD, JOT, PRT', 'sinks_tubs_basins', 1, '2018-01-08 14:46:50', '2018-01-10 11:06:50'),
(19, 'Splashbacks', 'JKT,JLN,STN,JBD, JOT', 'splashbacks', 1, '2018-01-08 14:47:39', '2018-01-10 11:06:57'),
(20, 'Study', 'JST', 'study', 1, '2018-01-08 14:48:00', '2018-01-10 11:07:06'),
(21, 'Tapware', 'JKT,JLN,STN,JBD, JOT, PRT', 'tapware', 1, '2018-01-08 14:48:17', '2018-01-10 11:07:15'),
(22, 'Wardrobes', 'JBT', 'wardrobes', 1, '2018-01-08 14:49:28', '2018-01-10 11:07:23');

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
(15, 'Building Class', '/masters/buildingClass', '2017-11-03 12:15:14', '2017-12-08 12:57:36', 1),
(16, 'Project Scope', '/masters/projectScope', '2017-11-03 12:15:14', '2017-12-08 12:57:36', 1);

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
  `building_class_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `price` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_project_scope`
--

INSERT INTO `m_project_scope` (`id`, `building_class_id`, `items_id`, `price`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '50', 1, '2017-12-18 12:28:19', '2017-12-18 20:56:06'),
(4, 1, 2, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(7, 1, 3, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(8, 1, 4, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(9, 1, 5, '50', 1, '2017-12-18 12:28:19', '2017-12-18 20:56:35'),
(10, 1, 6, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(11, 1, 7, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(12, 1, 8, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(13, 1, 9, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(14, 1, 10, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(15, 1, 11, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(16, 2, 12, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:26:44'),
(17, 2, 13, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(18, 2, 14, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:10'),
(19, 2, 15, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(21, 2, 1, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(22, 2, 2, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:10'),
(23, 2, 3, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(24, 2, 4, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:10'),
(25, 2, 5, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(26, 2, 6, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:10'),
(27, 2, 7, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(28, 2, 8, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:10'),
(29, 2, 9, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(30, 2, 10, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:10'),
(31, 2, 11, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:28'),
(32, 2, 12, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:31:00'),
(33, 2, 13, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:58'),
(34, 2, 14, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:30:56'),
(35, 2, 15, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:49'),
(36, 1, 12, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(37, 1, 13, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(38, 1, 14, '780', 1, '2017-12-18 12:51:06', '2017-12-18 17:25:09'),
(39, 1, 15, '33', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(40, 2, 16, '50', 1, '2017-12-18 12:28:19', '2017-12-18 17:30:10'),
(41, 1, 16, '60', 1, '2017-12-18 12:28:19', '2017-12-18 17:25:05'),
(42, 2, 17, '33', 1, '2017-12-18 12:28:19', '2018-01-10 17:48:07'),
(43, 1, 17, '33', 1, '2017-12-18 12:28:19', '2018-01-10 17:48:09'),
(46, 2, 18, '33', 1, '2017-12-18 12:28:19', '2018-01-10 17:48:07'),
(47, 1, 18, '33', 1, '2017-12-18 12:28:19', '2018-01-10 17:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `m_project_scope_new`
--

CREATE TABLE `m_project_scope_new` (
  `id` int(11) NOT NULL,
  `building_class_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `price` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_project_scope_new`
--

INSERT INTO `m_project_scope_new` (`id`, `building_class_id`, `items_id`, `price`, `status`, `created_at`, `updated_at`) VALUES
(84, 1, 1, '0', 1, '2018-01-20 17:02:44', '2018-01-20 17:02:44'),
(85, 1, 2, '0', 1, '2018-01-20 17:02:44', '2018-01-20 17:02:44'),
(86, 1, 3, '0', 1, '2018-01-20 17:02:44', '2018-01-20 17:02:44'),
(87, 1, 4, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(88, 1, 5, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(89, 1, 6, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(90, 1, 7, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(91, 1, 8, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(92, 1, 9, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(93, 1, 10, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(94, 1, 11, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(95, 1, 12, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(96, 1, 13, '100', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(97, 1, 14, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(98, 1, 15, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(99, 1, 16, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(100, 1, 17, '0', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(101, 1, 18, '150', 1, '2018-01-20 17:02:45', '2018-01-20 17:02:45'),
(120, 2, 1, '0', 1, '2018-01-20 17:58:07', '2018-01-20 17:58:07'),
(121, 2, 2, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(122, 2, 3, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(123, 2, 4, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(124, 2, 5, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(125, 2, 6, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(126, 2, 7, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(127, 2, 8, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(128, 2, 9, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(129, 2, 10, '599', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(130, 2, 11, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(131, 2, 12, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(132, 2, 13, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(133, 2, 14, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(134, 2, 15, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(135, 2, 16, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(136, 2, 17, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08'),
(137, 2, 18, '0', 1, '2018-01-20 17:58:08', '2018-01-20 17:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `m_project_status`
--

CREATE TABLE `m_project_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_project_status`
--

INSERT INTO `m_project_status` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'No Client Interest', 'No Client Interest', 1, '2018-01-04 04:09:16', '2018-01-04 04:09:16'),
(2, 'Client Interested', 'Client Interested', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00'),
(3, 'Documentation Rec\'d', 'Documentation Rec\'d', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00'),
(4, 'Estimated Submitted', 'Estimated Submitted', 1, '2018-01-04 04:09:16', '2018-01-04 04:09:16'),
(5, 'RFQ rec\'d', 'RFQ rec\'d', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00'),
(6, 'Quote Submitted', 'Quote Submitted', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00'),
(7, 'Under Negotiation', 'Under Negotiation', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00'),
(8, 'Awarded', 'Awarded', 1, '2018-01-04 04:09:16', '2018-01-04 04:09:16'),
(9, 'Lost', 'Lost', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00'),
(10, 'No Client Response', 'No Client Response', 1, '2018-01-04 04:10:00', '2018-01-04 04:10:00');

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
(15, 1, 15, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1),
(16, 1, 16, 'yes', 'yes', 'yes', 'yes', '2017-11-03 12:23:34', '2017-11-04 12:06:03', 1);

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
-- Table structure for table `m_supply_terms`
--

CREATE TABLE `m_supply_terms` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_supply_terms`
--

INSERT INTO `m_supply_terms` (`id`, `name`, `short_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'EXW', 'EXW', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(2, 'FOB', 'FOB', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(3, 'CIF', 'CIF', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(4, 'DDP', 'DDP', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(5, 'Supply & Install', 'Supply', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21');

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
(1, 'EXW', 'EXW', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(2, 'FOB', 'FOB', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(3, 'CIF', 'CIF', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(4, 'DDP', 'DDP', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21'),
(5, 'Supply & Install', 'Supply', 1, '2018-01-10 18:06:21', '2018-01-10 18:06:21');

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
  `territory` int(11) NOT NULL,
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
  `is_configured` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_name`, `address1`, `address2`, `territory`, `city`, `state`, `post_code`, `client_name`, `project_status`, `description`, `website`, `levels_begin`, `levels_end`, `construction_start`, `construction_duration`, `created_at`, `updated_at`, `is_configured`, `status`) VALUES
(1, 'PROJECT NAMES', 'kjlasdfxdfgdf', 'klasjdf', 1, 'klasdf', 2, 'asdfkj', 1, 1, 'asdf', 'asdf', 'asdf', '2sadf', 'wer', 'GGHHHHHhg', '2017-12-03 23:17:14', '2018-01-30 20:18:13', 1, 1),
(2, 'abcdcefrtttttttt', '45  jjjjjjjjjjjj', '6 Mackillop Drive', 2, 'sydney', 2, '2153', 1, 1, 'builders', 'www.abcd.com', '5', '7', '4t nov', '10 months', '2017-12-07 03:32:30', '2018-01-30 20:48:10', 1, 1),
(3, 'sadf', 'sdf', 'sdf', 1, 'sdf', 5, 's234', 2, 1, 'sadf', 'sdf', 'sdfffa', 'sdf', 'sdf', 'sdf', '2017-12-12 15:57:01', '2018-01-30 20:18:22', 1, 1),
(4, 'sdf', 'sadf', 'asdf', 1, 'asdf', 5, 'asd', 2, 2, 'asdf', 'sdaf', 'sadf', 'sadf', 'asdf', 'asfd', '2017-12-18 22:21:35', '2018-01-30 20:18:22', 0, 1),
(5, 'sdaf', '65465adf', 'asdfasdf', 1, 'asdf', 2, 'asdf', 1, 1, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', '2017-12-19 09:21:10', '2018-01-30 20:18:22', 0, 1),
(6, 'asdf', 'asdf', 'asdf', 1, 'asdf', 2, 'asd', 1, 2, 'asdfasdf', 'asdfawer', 'fd', '21', 'asdf', 'adf', '2017-12-19 09:35:12', '2018-01-30 20:18:22', 0, 1),
(7, 'ASDFASD', 'ASDF', 'ASDF', 4, 'ASDF', 4, 'ASDF', 2, 2, 'SADF', 'asdF', 'ASDF', 'SDF', 'SADF', 'asdFs', '2017-12-19 17:39:46', '2018-01-30 20:18:22', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_additional_info`
--

CREATE TABLE `project_additional_info` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `information` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_additional_info`
--

INSERT INTO `project_additional_info` (`id`, `project_id`, `information`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Buildings insurance – This insurance covers your house in case of a disaster where your house is so badly damaged that it needs to be completely rebuilt. The event which caused the damage must have been completely beyond your control, for example storm or flood damage, a major fire, smoke or explosions, water leakage/burst pipes, subsidence, or third party vandalism or damage etc. Mortgage providers will insist that you take out this cover, as it means they will be able to recover their losses in such events. It is like a type of security or collateral for the loan that they have given to you.', '2017-12-19 16:12:47', '2017-12-19 16:48:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_docs`
--

CREATE TABLE `project_docs` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `arch_ref` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `revision` text COLLATE utf8_unicode_ci NOT NULL,
  `p_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `p_link` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_docs`
--

INSERT INTO `project_docs` (`id`, `project_id`, `arch_ref`, `description`, `revision`, `p_date`, `p_link`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'A-200', 'Generally the definition of what constitutes Buildings and Contents under a home insurance is commonsense and straight forward. Buildings being all domestic buildings within the boundaries of the land, owned by the insured and permanent fixtures and fittings. Contents are portable items, possessions you’d take with you if you move, including carpets and curtains. There are however a few areas which can cause confusion, so here we go', 'Contents are portable items, possessions you’d take with you if you move, including carpets and curtains. There are however a few areas which can cause confusion, so here we go', '2017-12-19 00:00:00', 'https://www.ourproperty.co.uk/guides/building_and_contents_insurance_explained/', '2017-12-19 14:29:58', '2017-12-19 14:29:58', 1),
(2, 5, 'A -101', 'asdf', 'asdf', 'asdf', 'sdaf', '2017-12-19 20:28:20', '2017-12-19 20:28:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_note`
--

CREATE TABLE `project_note` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_note`
--

INSERT INTO `project_note` (`id`, `project_id`, `note`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'The insurance policy wording will give you a definition of Home Buildings and Contents, along with the terms, conditions and exclusions. Insurers usually keep to a plain English format, to make the policy wording easier to understand. Leaving aside complex insurance jargon. If you’re still none the wiser, then any queries should be ironed out in a phone call.', '2017-12-19 16:12:47', '2017-12-19 16:47:55', 1),
(4, 4, 'sdfsdfsdf', '2017-12-30 19:44:47', '2017-12-30 19:44:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_scope`
--

CREATE TABLE `project_scope` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_type_id` int(11) NOT NULL,
  `building_class` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building_class_id` int(11) NOT NULL,
  `building_units` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aluminium_windows` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aluminium_doors` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curtain_wall` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aluminium_louvres` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kitchens` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kitchenettes` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bedrooms` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `laundries` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bathrooms` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ensuites` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balconies` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storage` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `study` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `garages` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aluminium_windows_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `aluminium_doors_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `curtain_wall_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `aluminium_louvres_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kitchens_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `kitchenettes_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `bedrooms_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `laundries_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `bathrooms_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ensuites_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `balconies_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `storage_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `study_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `garages_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `other_price` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_scope`
--

INSERT INTO `project_scope` (`id`, `project_id`, `project_type`, `project_type_id`, `building_class`, `building_class_id`, `building_units`, `aluminium_windows`, `aluminium_doors`, `curtain_wall`, `aluminium_louvres`, `kitchens`, `kitchenettes`, `bedrooms`, `laundries`, `bathrooms`, `ensuites`, `balconies`, `storage`, `study`, `garages`, `other`, `aluminium_windows_price`, `aluminium_doors_price`, `curtain_wall_price`, `aluminium_louvres_price`, `kitchens_price`, `kitchenettes_price`, `bedrooms_price`, `laundries_price`, `bathrooms_price`, `ensuites_price`, `balconies_price`, `storage_price`, `study_price`, `garages_price`, `other_price`, `created_at`, `updated_at`, `status`, `is_deleted`) VALUES
(94, 1, 'project type1', 1, 'buildingclass1', 1, '10', '1', '2', '0', '0', '5', '5', '40', '4', '6', '7', '9', '4', '1', '5', '0', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-18 22:14:22', '2017-12-25 16:27:09', 1, 0),
(95, 1, 'project type1', 1, 'asdasd', 2, '10', '2', '1', '0', '3', '5', '5', '4', '6', '6', '7', '9', '4', '1', '5', '0', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-18 22:14:22', '2017-12-25 16:27:11', 1, 0),
(96, 1, 'project type2', 2, 'buildingclass1', 1, '101', '2', '1', '0', '0', '5', '5', '4', '60', '8', '7', '9', '4', '1', '2', '0', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-18 22:14:22', '2017-12-25 16:27:13', 1, 0),
(97, 1, 'project type2', 2, 'asdasd', 2, '102', '1', '1', '0', '2', '5', '5', '4', '6', '8', '8', '9', '4', '3', '7', '0', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-18 22:14:22', '2017-12-25 16:27:22', 1, 0),
(98, 1, 'project type2', 2, 'buildingclass1', 1, '33', '2', '2', '0', '0', '5', '5', '4', '6', '7', '9', '5', '4', '6', '7', '0', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-18 22:14:22', '2017-12-25 16:27:22', 1, 0),
(104, 5, 'project type1', 1, 'buildingclass1', 1, '100', '0', '0', '0', '0', '5', '5', '5', '5', '5', '5', '5', '0', '250', '10', '0', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-19 09:34:00', '2017-12-25 16:27:22', 1, 0),
(111, 4, 'project type2', 2, 'asdasd', 2, '555', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '22', '33', '44', '0', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-23 17:07:57', '2017-12-25 16:27:22', 1, 0),
(112, 4, 'project type1', 1, 'buildingclass1', 1, '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-23 17:07:57', '2017-12-25 16:27:22', 1, 0),
(113, 7, 'project type1', 1, 'buildingclass1', 1, '23', '0', '0', '0', '0', '0', '10', '10', '20', '0', '0', '0', '0', '0', '0', '', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-30 19:38:38', '2017-12-30 19:38:38', 1, 0),
(114, 7, 'project type1', 1, 'asdasd', 2, '66', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2017-12-30 19:38:39', '2017-12-30 19:38:39', 1, 0),
(117, 2, 'project type1', 1, 'buildingclass1', 1, '102', '4', '7', '7', '7', '4', '7', '4', '7', '4', '7', '4', '7', '4', '7', '4', '50', '780', '33', '780', '50', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2018-01-08 11:07:42', '2018-01-08 11:07:42', 1, 0),
(118, 2, 'project type1', 1, 'asdasd', 2, '33', '4', '7', '7', '7', '4', '7', '4', '7', '4', '7', '4', '7', '15', '7', '4', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '780', '33', '2018-01-08 11:07:43', '2018-01-08 11:07:43', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_scope_child_new`
--

CREATE TABLE `project_scope_child_new` (
  `id` int(11) NOT NULL,
  `ps_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `qty` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_scope_child_new`
--

INSERT INTO `project_scope_child_new` (`id`, `ps_id`, `project_id`, `items_id`, `qty`, `price`) VALUES
(934, 59, 3, 1, '0', NULL),
(935, 59, 3, 2, '0', NULL),
(936, 59, 3, 3, '0', NULL),
(937, 59, 3, 4, '0', NULL),
(938, 59, 3, 5, '5', NULL),
(939, 59, 3, 6, '0', NULL),
(940, 59, 3, 7, '0', NULL),
(941, 59, 3, 8, '0', NULL),
(942, 59, 3, 9, '0', NULL),
(943, 59, 3, 10, '0', NULL),
(944, 59, 3, 11, '0', NULL),
(945, 59, 3, 12, '0', NULL),
(946, 59, 3, 13, '0', NULL),
(947, 59, 3, 14, '0', NULL),
(948, 59, 3, 15, '0', NULL),
(949, 59, 3, 16, '0', NULL),
(950, 59, 3, 17, '0', NULL),
(951, 59, 3, 18, '0', NULL),
(952, 60, 3, 1, '0', NULL),
(953, 60, 3, 2, '0', NULL),
(954, 60, 3, 3, '0', NULL),
(955, 60, 3, 4, '0', NULL),
(956, 60, 3, 5, '0', NULL),
(957, 60, 3, 6, '0', NULL),
(958, 60, 3, 7, '5', NULL),
(959, 60, 3, 8, '0', NULL),
(960, 60, 3, 9, '0', NULL),
(961, 60, 3, 10, '0', NULL),
(962, 60, 3, 11, '0', NULL),
(963, 60, 3, 12, '0', NULL),
(964, 60, 3, 13, '0', NULL),
(965, 60, 3, 14, '0', NULL),
(966, 60, 3, 15, '0', NULL),
(967, 60, 3, 16, '0', NULL),
(968, 60, 3, 17, '500', NULL),
(969, 60, 3, 18, '500', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_scope_new`
--

CREATE TABLE `project_scope_new` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `building_class_id` int(11) NOT NULL,
  `building_units` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_scope_new`
--

INSERT INTO `project_scope_new` (`id`, `project_id`, `project_type_id`, `building_class_id`, `building_units`, `created_at`, `updated_at`, `status`) VALUES
(59, 3, 1, 1, '500', '2018-01-30 20:59:30', '2018-01-30 20:59:30', 1),
(60, 3, 1, 2, '100', '2018-01-30 20:59:31', '2018-01-30 20:59:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_scope_quote`
--

CREATE TABLE `project_scope_quote` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `quote` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_scope_quote`
--

INSERT INTO `project_scope_quote` (`id`, `project_id`, `quote`, `created_at`, `updated_at`, `status`) VALUES
(9, 3, '16915', '2018-01-10 18:03:10', '2018-01-30 20:59:32', 1),
(10, 2, '415', '2018-01-10 18:03:10', '2018-01-10 18:03:10', 1),
(11, 5, '415', '2018-01-10 18:03:10', '2018-01-10 18:03:10', 1);

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
(1, 1, 1, 2, 3, 4, 'asdf', 'asdf', 'asdf', 'asdf', 'asdasdfasdasdfASDFS', '2017-12-13 12:44:30', '2017-12-13 19:55:14', 1),
(2, 4, 1, 2, 3, 4, 'dfg', 'wret', 'dfg', 'dfg', 'dfgsd', '2017-12-19 09:08:19', '2017-12-19 09:08:19', 1),
(3, 6, 1, 2, 3, 4, 'asdas', 'asdsadff', 'asdsafd', 'sadasdf', 'asdfasdd', '2017-12-19 09:37:29', '2017-12-19 09:41:18', 1),
(4, 7, 1, 2, 3, 4, 'sdf', 'sdf', 'saf', 'asdfsdf', 'sdfs', '2017-12-30 19:32:41', '2017-12-30 19:32:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supply_items`
--

CREATE TABLE `supply_items` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `interest_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `estimated_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quoted_date` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supply_status` int(11) NOT NULL,
  `greyout` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supply_items`
--

INSERT INTO `supply_items` (`id`, `project_id`, `items_id`, `interest_id`, `estimated_date`, `quoted_date`, `supply_status`, `greyout`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(2, 3, 2, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(3, 3, 3, '1', '', '', 1, 1, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(4, 3, 4, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(5, 3, 5, '1', '', '', 1, 1, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(6, 3, 6, '1', '', '', 1, 1, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(7, 3, 7, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(8, 3, 8, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(9, 3, 9, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(10, 3, 10, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(11, 3, 11, '1', '', '', 1, 1, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(12, 3, 12, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(13, 3, 13, '1', '', '', 1, 1, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(14, 3, 14, '1', '', '', 1, 0, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(15, 3, 15, '1', '', '', 1, 1, '2018-01-30 20:59:43', '2018-01-30 20:59:43'),
(16, 3, 16, '1', '', '', 1, 0, '2018-01-30 20:59:44', '2018-01-30 20:59:44'),
(17, 3, 17, '1', '', '', 1, 1, '2018-01-30 20:59:44', '2018-01-30 20:59:44'),
(18, 3, 18, '1', '', '', 1, 1, '2018-01-30 20:59:44', '2018-01-30 20:59:44'),
(19, 3, 19, '1', '', '', 1, 1, '2018-01-30 20:59:44', '2018-01-30 20:59:44'),
(20, 3, 20, '1', '', '', 1, 0, '2018-01-30 20:59:44', '2018-01-30 20:59:44'),
(21, 3, 21, '1', '', '', 1, 1, '2018-01-30 20:59:44', '2018-01-30 20:59:44'),
(22, 3, 22, '2', '', '', 1, 1, '2018-01-30 20:59:44', '2018-01-30 20:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `supply_items_terms`
--

CREATE TABLE `supply_items_terms` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `supply_terms_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supply_items_terms`
--

INSERT INTO `supply_items_terms` (`id`, `project_id`, `supply_terms_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, '3', '2018-01-30 20:59:44', '2018-01-30 20:59:44', 1);

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
(3, 'David', 'David', 'david@dms.dev', '', NULL, 1, '$2y$10$qrH07lsBHNLs2uqPTWODcud.YAADJbRQUZK.UBwSqOfOWzd.5OLZq', NULL, '2018-01-30 15:15:03', '2017-10-10 06:56:40', '2018-01-30 09:45:03', 1),
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
-- Indexes for table `m_items`
--
ALTER TABLE `m_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_items_supply`
--
ALTER TABLE `m_items_supply`
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
-- Indexes for table `m_project_scope_new`
--
ALTER TABLE `m_project_scope_new`
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
-- Indexes for table `m_supply_terms`
--
ALTER TABLE `m_supply_terms`
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
-- Indexes for table `project_additional_info`
--
ALTER TABLE `project_additional_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_docs`
--
ALTER TABLE `project_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_note`
--
ALTER TABLE `project_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_scope`
--
ALTER TABLE `project_scope`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_scope_child_new`
--
ALTER TABLE `project_scope_child_new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_scope_new`
--
ALTER TABLE `project_scope_new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_scope_quote`
--
ALTER TABLE `project_scope_quote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_team`
--
ALTER TABLE `project_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supply_items`
--
ALTER TABLE `supply_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supply_items_terms`
--
ALTER TABLE `supply_items_terms`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `c_project_hdr`
--
ALTER TABLE `c_project_hdr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
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
-- AUTO_INCREMENT for table `m_items`
--
ALTER TABLE `m_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `m_items_supply`
--
ALTER TABLE `m_items_supply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `m_job_title`
--
ALTER TABLE `m_job_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `m_modules`
--
ALTER TABLE `m_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `m_product_size`
--
ALTER TABLE `m_product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_project_scope`
--
ALTER TABLE `m_project_scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `m_project_scope_new`
--
ALTER TABLE `m_project_scope_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `m_project_status`
--
ALTER TABLE `m_project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `m_state`
--
ALTER TABLE `m_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `m_supply_terms`
--
ALTER TABLE `m_supply_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_territory`
--
ALTER TABLE `m_territory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `m_title`
--
ALTER TABLE `m_title`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `project_additional_info`
--
ALTER TABLE `project_additional_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project_docs`
--
ALTER TABLE `project_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_note`
--
ALTER TABLE `project_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `project_scope`
--
ALTER TABLE `project_scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `project_scope_child_new`
--
ALTER TABLE `project_scope_child_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=970;
--
-- AUTO_INCREMENT for table `project_scope_new`
--
ALTER TABLE `project_scope_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `project_scope_quote`
--
ALTER TABLE `project_scope_quote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `project_team`
--
ALTER TABLE `project_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `supply_items`
--
ALTER TABLE `supply_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `supply_items_terms`
--
ALTER TABLE `supply_items_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
