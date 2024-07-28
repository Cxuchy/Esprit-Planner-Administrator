-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2024 at 08:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `espritexamplanner`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_26_132949_create_requests_table', 1),
(5, '2024_06_26_133344_create_passageexams_table', 1),
(6, '2024_06_26_133547_create_reclamations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `passageexams`
--

CREATE TABLE `passageexams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `datepassage` date NOT NULL,
  `heurepassage` int(11) NOT NULL,
  `nbprof_required` int(11) NOT NULL,
  `nbprof_enrolled` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `passageexams`
--

INSERT INTO `passageexams` (`id`, `datepassage`, `heurepassage`, `nbprof_required`, `nbprof_enrolled`, `created_at`, `updated_at`) VALUES
(72, '2024-07-18', 12, 11, 2, NULL, '2024-07-17 11:05:25'),
(73, '2024-07-12', 12, 11, 0, NULL, '2024-07-11 11:00:04'),
(74, '2024-07-11', 13, 11, 2, NULL, '2024-07-17 11:05:25'),
(75, '2024-07-16', 6, 55, 5, NULL, '2024-07-17 11:05:25'),
(76, '2024-07-11', 10, 55, 6, NULL, '2024-07-17 11:05:25'),
(77, '2024-08-16', 11, 55, 14, NULL, '2024-07-27 17:01:47'),
(78, '2024-09-10', 11, 55, 10, NULL, '2024-07-27 17:01:47'),
(79, '2024-09-09', 11, 55, 11, NULL, '2024-07-27 17:01:47'),
(80, '2024-08-31', 8, 55, 7, NULL, '2024-07-20 12:12:52'),
(81, '2024-08-16', 15, 55, 13, NULL, '2024-07-27 17:01:47'),
(82, '2024-08-29', 16, 55, 12, NULL, '2024-07-27 17:01:47'),
(83, '2024-08-28', 13, 55, 13, NULL, '2024-07-27 17:01:47'),
(84, '2024-08-07', 15, 55, 14, NULL, '2024-07-27 17:01:47'),
(85, '2024-09-09', 13, 55, 11, NULL, '2024-07-27 17:01:47'),
(86, '2024-10-21', 17, 55, 11, NULL, '2024-07-27 17:01:47'),
(87, '2024-11-06', 17, 55, 10, NULL, '2024-07-27 17:01:47'),
(88, '2024-12-17', 17, 55, 3, NULL, '2024-07-12 00:40:10'),
(89, '2024-12-06', 18, 55, 9, NULL, '2024-07-27 12:13:33'),
(90, '2024-12-19', 18, 55, 1, NULL, '2024-07-11 11:00:05'),
(91, '2024-12-06', 18, 55, 5, NULL, '2024-07-21 20:37:01'),
(92, '2024-07-03', 8, 22, 4, NULL, '2024-07-20 12:12:52'),
(93, '2024-07-13', 14, 11, 2, NULL, '2024-07-12 00:40:10'),
(94, '2024-07-13', 11, 0, 1, NULL, NULL),
(95, '2024-07-20', 14, 22, 5, NULL, '2024-07-20 12:12:52'),
(96, '2024-07-18', 9, 33, 1, NULL, '2024-07-17 11:05:25'),
(97, '2024-08-03', 12, 11, 2, NULL, '2024-07-20 12:12:52'),
(98, '2024-08-22', 11, 11, -1, NULL, '2024-07-27 17:01:47'),
(99, '2024-08-21', 11, 11, -1, NULL, '2024-07-27 17:01:47'),
(100, '2024-08-29', 11, 11, -1, NULL, '2024-07-27 17:01:47'),
(101, '2024-08-26', 11, 11, -1, NULL, '2024-07-27 17:01:47'),
(102, '2024-07-19', 11, 55, 0, NULL, '2024-07-18 13:26:04'),
(103, '2024-07-27', 9, 22, 2, NULL, NULL),
(104, '2024-11-20', 9, 22, -1, NULL, '2024-07-27 17:01:47'),
(105, '2024-11-21', 9, 22, 0, NULL, '2024-07-27 17:01:47'),
(106, '2024-11-06', 9, 22, -1, NULL, '2024-07-27 17:01:47'),
(107, '2024-11-06', 11, 22, 0, NULL, '2024-07-27 17:01:47'),
(108, '2024-11-23', 14, 26, 0, NULL, NULL),
(109, '2024-11-18', 13, 12, -1, NULL, '2024-07-27 17:01:47'),
(110, '2024-09-01', 11, 33, 1, NULL, '2024-07-27 17:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('yassine@gmail.com', '$2y$12$bzhDqVyBUXIBuR6NheSM/.ANRl7.xfCHIFl/eN.yy/S1MJi7snSLi', '2024-07-27 00:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `reclamations`
--

CREATE TABLE `reclamations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` bigint(20) UNSIGNED NOT NULL,
  `submissionDate` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `submitMessage` varchar(255) NOT NULL,
  `resolutionDate` date DEFAULT NULL,
  `resolutionMessage` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reclamations`
--

INSERT INTO `reclamations` (`id`, `userid`, `submissionDate`, `status`, `type`, `submitMessage`, `resolutionDate`, `resolutionMessage`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-06-28', 'accepted', 'Scheduling', '111111111111111', '2024-06-05', 'problem solved', NULL, NULL),
(7, 2, '2024-06-29', 'accepted', 'Personnal Account', 'i have a problem with my personnal account', '2024-07-14', 'hththth', NULL, NULL),
(8, 1, '2024-07-08', 'accepted', 'Personnal Account', 'grfgsfgdsdfgd', '2024-07-14', 'testpro', NULL, NULL),
(9, 1, '2024-07-13', 'rejected', 'Personnal Account', 'myaccount is disabled', '2024-07-14', 'everything works fine ', NULL, NULL),
(10, 1, '2024-07-13', 'pending', 'Scheduling', 'rtjdyyyyyyyyyyy', '2024-07-14', 'cdzzzzzzzzzzzzzzzzzzzzzzzz', NULL, NULL),
(11, 1, '2024-07-14', 'accepted', 'Scheduling', 'problem rfdgsgrgggggggggggggggggggggggggggggggggrgzrfrs', '2024-07-14', 'problem solveddddddddddddddddddddd', NULL, NULL),
(12, 6, '2024-07-15', 'accepted', 'Scheduling', '3andi mochkla sahni', '2024-07-15', 'jawek behi ', NULL, NULL),
(13, 7, '2024-07-17', 'accepted', 'Scheduling', 'reclamation', '2024-07-17', 'probleme resolue', NULL, NULL),
(14, 8, '2024-07-18', 'pending', 'Personnal Account', 'hhdfghdfghdft', NULL, NULL, NULL, NULL),
(15, 8, '2024-07-18', 'pending', 'Scheduling', 'jfygthsdhstd', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` bigint(20) UNSIGNED NOT NULL,
  `passageexamid` bigint(20) UNSIGNED NOT NULL,
  `requestDate` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `responseDate` date DEFAULT NULL,
  `responseMessage` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `userid`, `passageexamid`, `requestDate`, `status`, `type`, `responseDate`, `responseMessage`, `created_at`, `updated_at`) VALUES
(472, 6, 72, '2024-07-15', 'rejected', '1', NULL, NULL, NULL, NULL),
(473, 6, 74, '2024-07-15', 'rejected', '1', NULL, NULL, NULL, NULL),
(474, 6, 92, '2024-07-15', 'accepted', '1', NULL, NULL, NULL, NULL),
(475, 6, 95, '2024-07-15', 'accepted', '1', NULL, NULL, NULL, NULL),
(476, 6, 84, '2024-07-15', 'accepted', '1', NULL, NULL, NULL, NULL),
(477, 6, 99, '2024-07-15', 'rejected', '1', NULL, NULL, NULL, NULL),
(478, 6, 77, '2024-07-15', 'accepted', '1', NULL, NULL, NULL, NULL),
(479, 6, 83, '2024-07-15', 'accepted', '1', NULL, NULL, NULL, NULL),
(480, 6, 100, '2024-07-15', 'rejected', '1', NULL, NULL, NULL, NULL),
(481, 6, 82, '2024-07-15', 'accepted', '1', NULL, NULL, NULL, NULL),
(482, 6, 76, '2024-07-15', 'accepted', '2', NULL, NULL, NULL, NULL),
(483, 6, 75, '2024-07-15', 'accepted', '2', NULL, NULL, NULL, NULL),
(484, 6, 96, '2024-07-15', 'rejected', '2', NULL, NULL, NULL, NULL),
(485, 6, 97, '2024-07-15', 'rejected', '2', NULL, NULL, NULL, NULL),
(486, 6, 81, '2024-07-15', 'rejected', '2', NULL, NULL, NULL, NULL),
(487, 6, 98, '2024-07-15', 'rejected', '2', NULL, NULL, NULL, NULL),
(488, 6, 101, '2024-07-15', 'rejected', '2', NULL, NULL, NULL, NULL),
(489, 6, 80, '2024-07-15', 'rejected', '2', NULL, NULL, NULL, NULL),
(490, 6, 79, '2024-07-15', 'accepted', '2', NULL, NULL, NULL, NULL),
(491, 6, 85, '2024-07-15', 'accepted', '2', NULL, NULL, NULL, NULL),
(512, 7, 72, '2024-07-17', 'rejected', '1', NULL, NULL, NULL, NULL),
(513, 7, 76, '2024-07-17', 'accepted', '1', NULL, NULL, NULL, NULL),
(514, 7, 74, '2024-07-17', 'rejected', '1', NULL, NULL, NULL, NULL),
(515, 7, 75, '2024-07-17', 'accepted', '1', NULL, NULL, NULL, NULL),
(516, 7, 92, '2024-07-17', 'rejected', '1', NULL, NULL, NULL, NULL),
(517, 7, 96, '2024-07-17', 'accepted', '1', NULL, NULL, NULL, NULL),
(518, 7, 95, '2024-07-17', 'accepted', '1', NULL, NULL, NULL, NULL),
(519, 7, 97, '2024-07-17', 'rejected', '1', NULL, NULL, NULL, NULL),
(520, 7, 84, '2024-07-17', 'accepted', '1', NULL, NULL, NULL, NULL),
(521, 7, 81, '2024-07-17', 'accepted', '1', NULL, NULL, NULL, NULL),
(522, 7, 99, '2024-07-17', 'rejected', '2', NULL, NULL, NULL, NULL),
(523, 7, 98, '2024-07-17', 'rejected', '2', NULL, NULL, NULL, NULL),
(524, 7, 77, '2024-07-17', 'rejected', '2', NULL, NULL, NULL, NULL),
(525, 7, 101, '2024-07-17', 'rejected', '2', NULL, NULL, NULL, NULL),
(526, 7, 83, '2024-07-17', 'accepted', '2', NULL, NULL, NULL, NULL),
(527, 7, 100, '2024-07-17', 'rejected', '2', NULL, NULL, NULL, NULL),
(528, 7, 82, '2024-07-17', 'rejected', '2', NULL, NULL, NULL, NULL),
(529, 7, 80, '2024-07-17', 'accepted', '2', NULL, NULL, NULL, NULL),
(530, 7, 79, '2024-07-17', 'accepted', '2', NULL, NULL, NULL, NULL),
(531, 7, 85, '2024-07-17', 'accepted', '2', NULL, NULL, NULL, NULL),
(572, 1, 92, '2024-07-20', 'accepted', '1', NULL, NULL, NULL, NULL),
(573, 1, 95, '2024-07-20', 'accepted', '1', NULL, NULL, NULL, NULL),
(574, 1, 97, '2024-07-20', 'rejected', '1', NULL, NULL, NULL, NULL),
(575, 1, 84, '2024-07-20', 'accepted', '1', NULL, NULL, NULL, NULL),
(576, 1, 77, '2024-07-20', 'accepted', '1', NULL, NULL, NULL, NULL),
(577, 1, 81, '2024-07-20', 'accepted', '1', NULL, NULL, NULL, NULL),
(578, 1, 99, '2024-07-20', 'rejected', '1', NULL, NULL, NULL, NULL),
(579, 1, 98, '2024-07-20', 'rejected', '1', NULL, NULL, NULL, NULL),
(580, 1, 101, '2024-07-20', 'rejected', '1', NULL, NULL, NULL, NULL),
(581, 1, 83, '2024-07-20', 'accepted', '1', NULL, NULL, NULL, NULL),
(582, 1, 100, '2024-07-20', 'rejected', '2', NULL, NULL, NULL, NULL),
(583, 1, 82, '2024-07-20', 'rejected', '2', NULL, NULL, NULL, NULL),
(584, 1, 80, '2024-07-20', 'rejected', '2', NULL, NULL, NULL, NULL),
(585, 1, 79, '2024-07-20', 'rejected', '2', NULL, NULL, NULL, NULL),
(586, 1, 85, '2024-07-20', 'rejected', '2', NULL, NULL, NULL, NULL),
(587, 1, 78, '2024-07-20', 'accepted', '2', NULL, NULL, NULL, NULL),
(588, 1, 86, '2024-07-20', 'accepted', '2', NULL, NULL, NULL, NULL),
(589, 1, 87, '2024-07-20', 'accepted', '2', NULL, NULL, NULL, NULL),
(590, 1, 91, '2024-07-20', 'accepted', '2', NULL, NULL, NULL, NULL),
(591, 1, 89, '2024-07-20', 'rejected', '2', NULL, NULL, NULL, NULL),
(592, 9, 84, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(593, 9, 81, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(594, 9, 98, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(595, 9, 101, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(596, 9, 83, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(597, 9, 100, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(598, 9, 82, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(599, 9, 79, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(600, 9, 85, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(601, 9, 78, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(602, 9, 77, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(603, 9, 99, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(604, 9, 86, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(605, 9, 106, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(606, 9, 107, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(607, 9, 87, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(608, 9, 109, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(609, 9, 104, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(610, 9, 105, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(611, 9, 89, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(652, 10, 84, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(653, 10, 77, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(654, 10, 81, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(655, 10, 99, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(656, 10, 107, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(657, 10, 87, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(658, 10, 109, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(659, 10, 104, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(660, 10, 105, '2024-07-21', 'rejected', '1', NULL, NULL, NULL, NULL),
(661, 10, 89, '2024-07-21', 'accepted', '1', NULL, NULL, NULL, NULL),
(662, 10, 98, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(663, 10, 101, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(664, 10, 83, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(665, 10, 100, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(666, 10, 82, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(667, 10, 79, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(668, 10, 85, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(669, 10, 78, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(670, 10, 86, '2024-07-21', 'accepted', '2', NULL, NULL, NULL, NULL),
(671, 10, 106, '2024-07-21', 'rejected', '2', NULL, NULL, NULL, NULL),
(672, 11, 84, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(673, 11, 77, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(674, 11, 81, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(675, 11, 99, '2024-07-22', 'rejected', '1', NULL, NULL, NULL, NULL),
(676, 11, 98, '2024-07-22', 'rejected', '1', NULL, NULL, NULL, NULL),
(677, 11, 101, '2024-07-22', 'rejected', '1', NULL, NULL, NULL, NULL),
(678, 11, 83, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(679, 11, 100, '2024-07-22', 'rejected', '1', NULL, NULL, NULL, NULL),
(680, 11, 82, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(681, 11, 79, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(682, 11, 85, '2024-07-22', 'accepted', '2', NULL, NULL, NULL, NULL),
(683, 11, 78, '2024-07-22', 'rejected', '2', NULL, NULL, NULL, NULL),
(684, 11, 86, '2024-07-22', 'accepted', '2', NULL, NULL, NULL, NULL),
(685, 11, 106, '2024-07-22', 'rejected', '2', NULL, NULL, NULL, NULL),
(686, 11, 107, '2024-07-22', 'rejected', '2', NULL, NULL, NULL, NULL),
(687, 11, 87, '2024-07-22', 'accepted', '2', NULL, NULL, NULL, NULL),
(688, 11, 109, '2024-07-22', 'rejected', '2', NULL, NULL, NULL, NULL),
(689, 11, 104, '2024-07-22', 'rejected', '2', NULL, NULL, NULL, NULL),
(690, 11, 105, '2024-07-22', 'rejected', '2', NULL, NULL, NULL, NULL),
(691, 11, 89, '2024-07-22', 'accepted', '2', NULL, NULL, NULL, NULL),
(692, 11, 94, '2024-07-22', 'accepted', '1', NULL, NULL, NULL, NULL),
(693, 13, 84, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(694, 13, 77, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(695, 13, 81, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(696, 13, 99, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(697, 13, 98, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(698, 13, 101, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(699, 13, 83, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(700, 13, 100, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(701, 13, 82, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(702, 13, 110, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(703, 13, 79, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(704, 13, 85, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(705, 13, 78, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(706, 13, 86, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(707, 13, 106, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(708, 13, 107, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(709, 13, 87, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(710, 13, 109, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(711, 13, 104, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(712, 13, 89, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(713, 13, 97, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(714, 13, 103, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(715, 14, 84, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(716, 14, 77, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(717, 14, 81, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(718, 14, 110, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(719, 14, 79, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(720, 14, 85, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(721, 14, 78, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(722, 14, 107, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(723, 14, 87, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(724, 14, 109, '2024-07-27', 'rejected', '1', NULL, NULL, NULL, NULL),
(725, 14, 99, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(726, 14, 98, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(727, 14, 101, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(728, 14, 83, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(729, 14, 100, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(730, 14, 82, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(731, 14, 86, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(732, 14, 106, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(733, 14, 104, '2024-07-27', 'rejected', '2', NULL, NULL, NULL, NULL),
(734, 14, 105, '2024-07-27', 'accepted', '2', NULL, NULL, NULL, NULL),
(735, 14, 80, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL),
(736, 14, 95, '2024-07-27', 'accepted', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('sjZWz6waGabVmBUnGgAzTEr0mbjD0Q3Q526bYkIq', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVTYwak82YWVpalJZU3pZRzBPYXpmQlowellQWThzeWRjNWZkMUtPaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9maWxlIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7fQ==', 1722106100);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `unlock_exams` int(11) NOT NULL DEFAULT 0,
  `saturdays_supervisions` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `unlock_exams`, `saturdays_supervisions`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `hasplanning` int(11) DEFAULT 0,
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `identifier`, `nom`, `email`, `email_verified_at`, `password`, `phonenumber`, `hasplanning`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '211JMT9999', 'Yassine Bouaita', 'yassine@gmail.com', NULL, '$2y$12$Pzf3vIy1TaoKQds8y64O7.QoJBZPQ0l8XlAe1Gsjlf4GNZiKuI0kq', '+216 54821678', 1, 'Professor', NULL, '2024-06-28 20:50:10', '2024-07-20 12:12:52'),
(2, '211JMT9999', 'Omar ferchichi', 'amine.bouaita@huawei.com', NULL, '$2y$12$.kg.SuK889/s3uoLbFJZ/.DaWS5/SeX0LZWZtyWtpgXsY.08Jo5su', '+216 54821678', 0, 'Professor', NULL, '2024-06-28 22:50:41', '2024-07-11 11:00:04'),
(3, '123', 'admin from pyqt', 'admin@gmail.com', NULL, '123', '24', 0, 'administrator', NULL, NULL, NULL),
(4, 'a', 'a', 'a', NULL, 'a', 'a', 0, 'administrator', NULL, NULL, NULL),
(5, 'wadi3', 'amine bouaita', 'amine@gmail.com', NULL, '$2y$12$Ya8ZAJmfgIM8aq8obDQkt.zMfAvKzS05pNYgYpjQVTkslnFXyCMg2', '+216 54821678', 0, 'Professor', NULL, '2024-07-08 13:50:00', '2024-07-08 13:50:00'),
(6, '211JMT9999', 'yassine Bouaita', 'bouaita.yassine@esprit.tn', NULL, '$2y$12$vDCZjLX18851fne8kJtfnOCnzBXK/FLgfetA0BJvodhzSDe5K3d3O', '+216 54821678', 1, 'Professor', 'Mh3RSgkiN27tDohJQPWEKmzM5R8ENTa3j26iz5gCIcDfzzV5Ds9jobjBwEWz', '2024-07-14 22:40:17', '2024-07-27 11:00:42'),
(7, '211JMT9999', 'Emira msekni', 'prof@gmail.com', NULL, '$2y$12$T1bGXTg/dsyE4K.Nl7CyJu9ProYLM9w7GYb8mtX7ynFnEpCsQuj6C', '+21624821257', 1, 'Professor', NULL, '2024-07-17 10:18:49', '2024-07-17 11:05:25'),
(8, 'aaaaa', 'Mariem Trabelsi', 'a@gmail.com', NULL, '$2y$12$YiWj/aRcnvjA67yzeU4tQuHc.7kyMUzdqzT0UBHctjkMXt1YDJ9eu', '+216 54821678', 0, 'Professor', NULL, '2024-07-18 12:59:17', '2024-07-18 13:00:06'),
(9, 'aaaaa', 'ahmed kacem', 'ahmed@gmail.com', NULL, '$2y$12$v4HOJScxavXi1Uks7qj6LuOG9qy/GuD17lWLIshuXc9gYIc3/Co.a', '+216 54821678', 1, 'Professor', NULL, '2024-07-21 20:32:33', '2024-07-21 20:33:05'),
(10, '1234', 'retyhberyt', 'aa@gmail.com', NULL, '$2y$12$3g8k8Z08UYKsGdMNG9/V8eAkTt05lhtpAv7yA0tqxVbxZNZGeVcia', '+21624821257', 1, 'Professor', NULL, '2024-07-21 20:34:18', '2024-07-21 20:41:11'),
(11, '211JMT9999', 'kacem emir', 'kacem@gmail.com', NULL, '$2y$12$gaJpHFwj76F5CAlgK/2nHeUahUCg6WP0cYHmUmJPTWdy6OnPSbhvm', '+216 54821678', 1, 'Professor', NULL, '2024-07-22 08:11:40', '2024-07-22 08:12:15'),
(12, 'aaaaa', 'dsdfvsrgzg', 'st@gmail.com', NULL, '$2y$12$eRtZM624kAWp71I9aQ8KWOd7BI3UtfbnmOnCBW1Ub5MNUMQL3VyLa', '11441548', 0, 'Student', NULL, '2024-07-22 08:38:02', '2024-07-22 08:38:02'),
(13, '2JJMY19078', 'kais mezni', 'kais@yopmail.com', NULL, '$2y$12$q16TmnncixYvMi2fXaIRbeuqJKgIjWYODB5a3wMVnlSroaYq7w38a', '25 987 277', 1, 'Professor', NULL, '2024-07-27 12:12:45', '2024-07-27 12:13:33'),
(14, '211JMT9999', 'thsththdth', 'k@yopmail.com', NULL, '$2y$12$NZSxMKxxOflDdWGWSWQl9eB5suJPg4eU41/rrnGvyxjBG9i4m6kgO', 'ddhdhdthd', 1, 'Professor', NULL, '2024-07-27 16:22:56', '2024-07-27 17:01:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passageexams`
--
ALTER TABLE `passageexams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `reclamations`
--
ALTER TABLE `reclamations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reclamations_userid_foreign` (`userid`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requests_userid_foreign` (`userid`),
  ADD KEY `passageexamid_id_foreign` (`passageexamid`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `passageexams`
--
ALTER TABLE `passageexams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `reclamations`
--
ALTER TABLE `reclamations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=737;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reclamations`
--
ALTER TABLE `reclamations`
  ADD CONSTRAINT `reclamations_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `passageexamid_id_foreign` FOREIGN KEY (`passageexamid`) REFERENCES `passageexams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `requests_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
