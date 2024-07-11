-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2024 at 02:38 PM
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
(1, '2024-06-30', 12, 26, 2, NULL, '2024-06-29 15:41:42'),
(2, '2024-06-30', 14, 26, 2, NULL, '2024-06-29 15:41:42'),
(3, '2024-06-30', 15, 35, 2, NULL, '2024-06-29 15:41:42'),
(4, '2024-06-27', 15, 35, 0, NULL, NULL),
(5, '2024-07-02', 12, 12, 2, NULL, NULL),
(6, '2024-07-02', 8, 2, 0, NULL, NULL),
(7, '2024-07-08', 9, 99, 1, NULL, '2024-07-03 11:35:23'),
(8, '2024-07-10', 14, 60, 1, NULL, '2024-07-03 11:35:23'),
(9, '2024-07-11', 15, 30, 1, NULL, '2024-07-03 11:35:23'),
(10, '2024-07-19', 15, 2, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 1, '2024-06-28', 'rejected', 'Personnal Account', 'ryjyjjjjjjjjjjjjjjjjjj', '2024-07-03', 'complaint rejected due to blocked account', NULL, NULL),
(3, 1, '2024-06-28', 'pending', 'Other', 'dfggggggggggggggg', NULL, NULL, NULL, NULL),
(4, 1, '2024-06-28', 'pending', 'Scheduling', 'gegegerrrrr', NULL, NULL, NULL, NULL),
(5, 1, '2024-06-28', 'pending', 'Scheduling', 'egergergrgrgr', NULL, NULL, NULL, NULL),
(6, 1, '2024-06-28', 'pending', 'Scheduling', 'rgrgrgrg(\'tgergerg', NULL, NULL, NULL, NULL),
(7, 2, '2024-06-29', 'pending', 'Personnal Account', 'i have a problem with my personnal account', NULL, NULL, NULL, NULL);

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
(1, 1, 1, '2024-06-29', 'accepted', '1', NULL, NULL, NULL, NULL),
(2, 1, 2, '2024-06-29', 'accepted', '1', NULL, NULL, NULL, NULL),
(3, 1, 3, '2024-06-29', 'pending', '2', NULL, NULL, NULL, NULL),
(4, 2, 1, '2024-06-29', 'accepted', '1', NULL, NULL, NULL, NULL),
(5, 2, 2, '2024-06-29', 'accepted', '1', NULL, NULL, NULL, NULL),
(6, 2, 3, '2024-06-29', 'accepted', '1', NULL, NULL, NULL, NULL),
(7, 1, 9, '2024-07-03', 'accepted', '1', NULL, NULL, NULL, NULL),
(8, 1, 7, '2024-07-03', 'accepted', '1', NULL, NULL, NULL, NULL),
(9, 1, 8, '2024-07-03', 'pending', '2', NULL, NULL, NULL, NULL);

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
('DcgasHrifb7UKq8kdvqtVOsi4hVJ05kGlZIZ4cAM', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOEh1Tzlib21ia04zOFdYZFJUMU9Bc3pBVVRJZE5rdWJ2U2ZsbVNvcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1720010160);

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
  `requests_accepted` int(11) DEFAULT 0,
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `identifier`, `nom`, `email`, `email_verified_at`, `password`, `phonenumber`, `requests_accepted`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '211JMT9999', 'Yassine Bouaita', 'yassine@gmail.com', NULL, '$2y$12$Pzf3vIy1TaoKQds8y64O7.QoJBZPQ0l8XlAe1Gsjlf4GNZiKuI0kq', '+216 54821678', 0, 'Professor', NULL, '2024-06-28 20:50:10', '2024-06-28 20:50:10'),
(2, '211JMT9999', 'Omar ferchichi', 'ya@gmail.com', NULL, '$2y$12$.kg.SuK889/s3uoLbFJZ/.DaWS5/SeX0LZWZtyWtpgXsY.08Jo5su', '+216 54821678', 0, 'Professor', NULL, '2024-06-28 22:50:41', '2024-06-28 22:50:41'),
(3, '123', 'admin from pyqt', 'admin@gmail.com', NULL, '123', '24', 0, 'administrator', NULL, NULL, NULL),
(4, 'a', 'a', 'a', NULL, 'a', 'a', 0, 'administrator', NULL, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reclamations`
--
ALTER TABLE `reclamations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
