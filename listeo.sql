-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2017 at 04:59 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `listeo`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `blog_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `blog_description` text COLLATE utf8_bin,
  `blockquote` text COLLATE utf8_bin,
  `featured_image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `banner_image` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `allow_comment` int(11) DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `uid`, `blog_title`, `blog_description`, `blockquote`, `featured_image`, `banner_image`, `allow_comment`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 6, 'blog title', 'yuugiuhki', NULL, 'uploads/blogs/featured/1031516328.png', 'uploads/banner/blogs/1091464096.png', 1, 1, 0, '2017-09-10 05:34:54', '2017-09-11 00:08:52'),
(2, 6, 'blog title', 'yuugiuhki', NULL, 'uploads/blogs/featured/1084956076.png', 'uploads/banner/blogs/1380300731.png', 1, 1, 0, '2017-09-10 05:39:15', '2017-09-11 00:08:55'),
(3, 6, 'asdfasdf', 'asdfasdf', NULL, 'uploads/blogs/featured/1065625306.png', 'uploads/blogs/banner/1110195400.png', 1, 1, 0, '2017-09-10 05:49:07', '2017-09-10 23:19:07'),
(4, 6, 'aaaaaaaaaaaaaaaa', 'asdadsasdfadsgads', NULL, 'uploads/blogs/featured/1022582513.png', 'uploads/blogs/banner/1138232326.png', 1, 1, 0, '2017-09-10 06:22:33', '2017-09-11 00:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_comments`
--

CREATE TABLE `blog_post_comments` (
  `id` int(11) NOT NULL,
  `bp_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `blog_post_comments`
--

INSERT INTO `blog_post_comments` (`id`, `bp_id`, `uid`, `name`, `email`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'laks', 'laks@gmail.com', 'sadfjklasdflkjasldf\r\nasdfkjasldfjlkasdf', 1, '0000-00-00 00:00:00', '2017-09-10 23:28:01'),
(2, 1, 6, 'laks', 'laks@gmail.com', 'sadfjklasdflkjasldf\r\nasdfkjasldfjlkasdf', 1, '0000-00-00 00:00:00', '2017-09-10 23:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_comments_replies`
--

CREATE TABLE `blog_post_comments_replies` (
  `id` int(11) NOT NULL,
  `blog_post_cmt_id` int(11) NOT NULL,
  `uid_from` int(11) NOT NULL,
  `uid_to` int(11) NOT NULL,
  `comments` text COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` int(11) NOT NULL,
  `business_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `category` int(11) NOT NULL,
  `keywords` text COLLATE utf8_bin,
  `address` text COLLATE utf8_bin,
  `city` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `facebook_link` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `twitter_link` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `googleplus_link` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `business_name`, `category`, `keywords`, `address`, `city`, `state`, `country`, `zipcode`, `latitude`, `longitude`, `description`, `phone`, `website`, `email`, `facebook_link`, `twitter_link`, `googleplus_link`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(7, 'SUPERMAN BUSINESS', 3, 'asd', 'assdfASDASD', 1, 2, NULL, 'asdf', '12.9229153', '80.1274558', 'asdasdasdasd\r\nasdasdasdasdasdasdasd\r\nasdasasdasdasd', '1231231231111', 'https://github.com/sarancruzer/listeo-dev', 'sarancruzer@gmail.com', '', '', '', 1, 0, '2017-08-16 17:57:00', '2017-08-31 00:42:52'),
(33, 'Tom''s Restaurant', 3, 'hotels', '964 School Street, New York', 1, 2, NULL, '111111sdsw', '43.0827864', '-74.261427', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text eversss since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '999431830ss', 'https://github.com/sarancruzer/listeo-dev', 'sarancruzer@gmail.com', '', '', '', 1, 0, '2017-08-25 11:22:00', '2017-09-09 17:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `listings_amenities`
--

CREATE TABLE `listings_amenities` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `amenities` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listings_amenities`
--

INSERT INTO `listings_amenities` (`id`, `listing_id`, `amenities`) VALUES
(750, 33, 1),
(751, 33, 2),
(752, 33, 5),
(753, 33, 6);

-- --------------------------------------------------------

--
-- Table structure for table `listings_bookmarks`
--

CREATE TABLE `listings_bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `listing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `listings_gallery`
--

CREATE TABLE `listings_gallery` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `image_path` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listings_gallery`
--

INSERT INTO `listings_gallery` (`id`, `listing_id`, `image_path`) VALUES
(68, 33, 'uploads/gallery/1326059908.png'),
(73, 33, 'uploads/gallery/1107832898.png'),
(75, 33, 'uploads/gallery/1153212380.png'),
(76, 7, 'uploads/gallery/1007368572.png'),
(77, 7, 'uploads/gallery/1301014176.png'),
(79, 7, 'uploads/gallery/1099312544.png'),
(80, 7, 'uploads/gallery/1000381568.png');

-- --------------------------------------------------------

--
-- Table structure for table `listings_opening_hours`
--

CREATE TABLE `listings_opening_hours` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `weekdays_id` int(11) NOT NULL,
  `opening_time` int(11) NOT NULL,
  `closing_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listings_opening_hours`
--

INSERT INTO `listings_opening_hours` (`id`, `listing_id`, `weekdays_id`, `opening_time`, `closing_time`) VALUES
(268, 33, 1, 4, 17),
(269, 33, 2, 2, 22),
(270, 33, 3, 2, 21),
(271, 33, 4, 2, 23),
(272, 33, 5, 4, 24),
(273, 33, 6, 1, 21),
(274, 33, 7, 4, 22);

-- --------------------------------------------------------

--
-- Table structure for table `listings_reviews`
--

CREATE TABLE `listings_reviews` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `review` text COLLATE utf8_bin NOT NULL,
  `star_rating` varchar(10) COLLATE utf8_bin NOT NULL,
  `img_path` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `is_deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listings_reviews`
--

INSERT INTO `listings_reviews` (`id`, `uid`, `listing_id`, `email`, `review`, `star_rating`, `img_path`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 2, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 00:30:56'),
(2, 1, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 01:11:01'),
(3, 1, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 01:16:06'),
(4, 2, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 00:30:43'),
(5, 3, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 00:55:34'),
(6, 3, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 00:55:37'),
(7, 3, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 00:55:39'),
(8, 4, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 00:55:41'),
(9, 1, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 01:11:01'),
(10, 1, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 01:16:06'),
(11, 1, 7, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 01:11:01'),
(12, 1, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 01:16:06'),
(13, 1, 7, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:43', '2017-08-31 01:11:01'),
(14, 1, 33, 'chris@scotch.io', 'Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus', '4', '', 1, 0, '2017-08-31 00:30:31', '2017-08-31 01:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `listing_pricing_category`
--

CREATE TABLE `listing_pricing_category` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `category_name` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listing_pricing_category`
--

INSERT INTO `listing_pricing_category` (`id`, `listing_id`, `category_name`) VALUES
(55, 33, 'pizza');

-- --------------------------------------------------------

--
-- Table structure for table `listing_pricing_services`
--

CREATE TABLE `listing_pricing_services` (
  `id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `listing_pricing_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  `price` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `listing_pricing_services`
--

INSERT INTO `listing_pricing_services` (`id`, `listing_id`, `listing_pricing_id`, `title`, `description`, `price`) VALUES
(49, 33, 55, 'single ', 'aslkdjfl', '1234');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_amenities`
--

CREATE TABLE `m_amenities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_amenities`
--

INSERT INTO `m_amenities` (`id`, `name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Elevator in building', 'true', 1, '2017-07-30 16:28:43', '2017-09-09 17:47:54'),
(2, 'Friendly workspace', 'true', 1, '2017-07-30 16:28:43', '2017-09-09 17:48:01'),
(3, 'Instant Book', 'true', 1, '2017-07-30 00:00:00', '2017-09-09 17:48:01'),
(4, 'Wireless Internet', 'true', 1, '2017-07-30 16:30:51', '2017-09-09 17:48:01'),
(5, 'Free parking on premises', 'true', 1, '2017-07-30 16:31:11', '2017-09-09 17:48:01'),
(6, 'Free parking on street', 'true', 1, '2017-07-30 16:31:25', '2017-09-09 17:48:01'),
(9, 'Smoking allowed', 'true', 1, '2017-07-30 16:31:11', '2017-09-09 17:48:01'),
(10, 'Events', 'true', 1, '2017-07-30 16:31:25', '2017-09-09 17:48:01'),
(11, 'asdfasdf', NULL, 1, NULL, '2017-09-10 23:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `m_category`
--

CREATE TABLE `m_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_category`
--

INSERT INTO `m_category` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Eat & Drink', 1, NULL, '2017-08-25 12:11:10'),
(2, 'Shops', 1, NULL, '2017-08-25 12:11:19'),
(3, 'Hotels', 1, NULL, '2017-08-25 12:11:24'),
(4, 'Restaurants', 1, NULL, '2017-08-25 12:11:29'),
(5, 'Fitness', 1, NULL, '2017-08-25 12:11:38'),
(6, 'Events', 1, NULL, '2017-08-25 12:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `m_city`
--

CREATE TABLE `m_city` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_city`
--

INSERT INTO `m_city` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New York', 1, '2017-08-03 01:18:18', '2017-08-25 12:08:47'),
(2, 'Los Angeles', 1, '2017-08-03 01:18:29', '2017-08-25 12:09:00'),
(3, 'Chicago', 1, '2017-08-03 01:18:18', '2017-08-25 12:09:21'),
(4, 'Houston', 1, '2017-08-03 01:18:29', '2017-08-25 12:09:27'),
(5, 'Phoenix', 1, '2017-08-03 01:18:18', '2017-08-25 12:09:34'),
(6, 'San Diego', 1, '2017-08-03 01:18:29', '2017-08-25 12:09:40'),
(7, 'Austin', 1, '2017-08-03 01:18:18', '2017-08-25 12:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `m_state`
--

CREATE TABLE `m_state` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_state`
--

INSERT INTO `m_state` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tamilnadu', 1, NULL, '2017-07-31 02:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `m_time`
--

CREATE TABLE `m_time` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `short_name` time DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_time`
--

INSERT INTO `m_time` (`id`, `name`, `short_name`, `status`, `created_at`, `updated_at`) VALUES
(1, '1 AM', '01:00:00', 1, NULL, '2017-08-20 17:22:10'),
(2, '2 AM', '02:00:00', 1, NULL, '2017-08-20 17:22:17'),
(3, '3 AM', '03:00:00', 1, NULL, '2017-08-20 17:44:08'),
(4, '4 AM', '04:00:00', 1, NULL, '2017-08-20 17:44:13'),
(5, '5 AM', '05:00:00', 1, NULL, '2017-08-20 17:44:17'),
(6, '6 AM', '06:00:00', 1, NULL, '2017-08-20 17:44:23'),
(7, '7 AM', '07:00:00', 1, NULL, '2017-08-20 17:44:29'),
(8, '8 AM', '08:00:00', 1, NULL, '2017-08-20 17:44:33'),
(9, '9 AM', '09:00:00', 1, NULL, '2017-08-20 17:44:37'),
(10, '10 AM', '10:00:00', 1, NULL, '2017-08-20 17:44:42'),
(11, '11 AM', '11:00:00', 1, NULL, '2017-08-20 17:44:49'),
(12, '12 AM', '12:00:00', 1, NULL, '2017-08-20 17:53:24'),
(13, '1 PM', '13:00:00', 1, NULL, '2017-08-20 17:53:31'),
(14, '2 PM', '14:00:00', 1, NULL, '2017-08-20 17:43:18'),
(15, '3 PM', '15:00:00', 1, NULL, '2017-08-20 17:23:24'),
(16, '4 PM', '16:00:00', 1, NULL, '2017-08-20 17:43:52'),
(17, '5 PM', '17:00:00', 1, NULL, '2017-08-20 17:43:46'),
(18, '6 PM', '18:00:00', 1, NULL, '2017-08-20 17:36:33'),
(19, '7 PM', '19:00:00', 1, NULL, '2017-08-20 17:39:52'),
(20, '8 PM', '20:00:00', 1, NULL, '2017-08-20 17:39:57'),
(21, '9 PM', '21:00:00', 1, NULL, '2017-08-20 17:40:01'),
(22, '10 PM', '22:00:00', 1, NULL, '2017-08-20 17:40:06'),
(23, '11 PM', '23:00:00', 1, NULL, '2017-08-20 17:43:34'),
(24, '12 PM', '23:00:00', 1, NULL, '2017-08-20 17:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `m_weekdays`
--

CREATE TABLE `m_weekdays` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `short_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `m_weekdays`
--

INSERT INTO `m_weekdays` (`id`, `name`, `short_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Monday', 'Mon', 1, NULL, '2017-08-20 17:14:59'),
(2, 'Tuesday', 'Tue', 1, NULL, '2017-08-20 17:14:59'),
(3, 'Wednesday', 'Wed', 1, NULL, '2017-08-20 17:14:59'),
(4, 'Thursday', 'Thu', 1, NULL, '2017-08-20 17:14:59'),
(5, 'Friday', 'Fri', 1, NULL, '2017-08-20 17:14:59'),
(6, 'Saturday', 'Sat', 1, NULL, '2017-08-20 17:14:59'),
(7, 'Sunday', 'Sun', 1, NULL, '2017-08-20 17:15:00');

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
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `twitter_link` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus_link` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `user_type`, `password`, `mobile`, `notes`, `twitter_link`, `facebook_link`, `googleplus_link`, `remember_token`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'admin@admin.com', NULL, 'admin', '$2y$10$QGWiJrgjM5jR14XWq.JI0uPPBPqT6R0P4p0dEyYtE8JC3LCPC0PXy', NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-11 02:09:46', '2016-11-24 08:10:17', '2017-09-10 20:39:46'),
(2, 'Chris Sevilleja', 'chris@scotch.io', NULL, 'viewers', '$2y$10$JWIPOlbU7kctIOy92AXVNuiwRwiLY0hdFufXzNaSMwCtKo4sBgqD6', NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-10 08:59:14', '2016-11-24 08:10:17', '2017-09-10 03:29:14'),
(3, 'Holly Lloyd', 'holly@scotch.io', NULL, 'viewers', '$2y$10$BCzqYN.QiuEjWczWA7FtquT0JQJUavPbpQ6nDozQSKCF1qbbQTFkO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-24 08:10:17', '2016-11-24 08:10:17'),
(4, 'Adnan Kukic', 'adnan@scotch.io', NULL, 'viewers', '$2y$10$vhGD7novc8qSYb0MfE2RTeaxBrnqQfFCen.p18ByvLdIWCL6orwBC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2016-11-24 08:10:18', '2016-11-24 08:10:18'),
(5, 'alagar', 'alagarsai88@yahoo.com', NULL, 'viewers', '$2y$10$e3EJpYBWfCJLLcEsetC4DO22Rqbf6kOO06vr0oBLFnWxGxOjWYi7a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'laks', 'laks@gmail.com', NULL, 'viewers', '$2y$10$JitlwMYlTq3HPvLtMFqvPuc2aNwuoxgzk9sZAV4TCkeuQ0c/b7D5u', NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-10 17:29:48', NULL, '2017-09-10 11:59:48');

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `notes` text COLLATE utf8_bin,
  `twitter_link` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `facebook_link` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `googleplus_link` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post_comments_replies`
--
ALTER TABLE `blog_post_comments_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings_amenities`
--
ALTER TABLE `listings_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings_bookmarks`
--
ALTER TABLE `listings_bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings_gallery`
--
ALTER TABLE `listings_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings_opening_hours`
--
ALTER TABLE `listings_opening_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings_reviews`
--
ALTER TABLE `listings_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_pricing_category`
--
ALTER TABLE `listing_pricing_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing_pricing_services`
--
ALTER TABLE `listing_pricing_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_amenities`
--
ALTER TABLE `m_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_category`
--
ALTER TABLE `m_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_city`
--
ALTER TABLE `m_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_state`
--
ALTER TABLE `m_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_time`
--
ALTER TABLE `m_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_weekdays`
--
ALTER TABLE `m_weekdays`
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
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `blog_post_comments_replies`
--
ALTER TABLE `blog_post_comments_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `listings_amenities`
--
ALTER TABLE `listings_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=754;
--
-- AUTO_INCREMENT for table `listings_bookmarks`
--
ALTER TABLE `listings_bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `listings_gallery`
--
ALTER TABLE `listings_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `listings_opening_hours`
--
ALTER TABLE `listings_opening_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;
--
-- AUTO_INCREMENT for table `listings_reviews`
--
ALTER TABLE `listings_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `listing_pricing_category`
--
ALTER TABLE `listing_pricing_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `listing_pricing_services`
--
ALTER TABLE `listing_pricing_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `m_amenities`
--
ALTER TABLE `m_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `m_category`
--
ALTER TABLE `m_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `m_city`
--
ALTER TABLE `m_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `m_state`
--
ALTER TABLE `m_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_time`
--
ALTER TABLE `m_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `m_weekdays`
--
ALTER TABLE `m_weekdays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
