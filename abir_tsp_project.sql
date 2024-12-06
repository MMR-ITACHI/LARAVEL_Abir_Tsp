-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2024 at 10:08 PM
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
-- Database: `abir_tsp_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'M.M.R Aabir', 'admin@gmail.com', '$2y$10$sWSnWHPcL9u7wZIOmtfws.7PpYKOFpxhgOxB/L/RtGBHC7.C52fBy', NULL, '2024-12-02 11:41:27', '2024-12-02 11:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `branch_email` varchar(255) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `photo` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branch_name`, `branch_email`, `admin_id`, `number`, `address`, `status`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Savar Courier Point', 'savar@gmail.com', 1, '01971324923', 'Savar', 'active', NULL, NULL, '2024-12-02 11:41:27', '2024-12-03 11:17:20'),
(2, 'Dhaka Courier Point', 'dhakacourier@gmail.com', 1, '01638149944', 'Purana Paltan,Dhaka', 'active', 'images/20241206204048.jpg', NULL, '2024-12-06 14:40:48', '2024-12-06 14:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `owner_name`, `phone`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'American Health Center', 'Dr. Mujibul Haque', '01971452133', 'images/nophoto.jpg', 'active', '2024-12-02 11:41:27', '2024-12-02 11:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

CREATE TABLE `costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `costs`
--

INSERT INTO `costs` (`id`, `unit_id`, `cost`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 5000, 'active', NULL, '2024-12-02 11:41:27', '2024-12-04 10:29:18'),
(2, 2, 5000, 'active', NULL, '2024-12-04 10:06:45', '2024-12-04 10:06:45'),
(3, 3, 4500, 'active', NULL, '2024-12-04 10:29:37', '2024-12-04 10:29:37'),
(4, 4, 1000, 'active', NULL, '2024-12-04 10:29:50', '2024-12-04 10:29:50'),
(5, 5, 5000, 'active', NULL, '2024-12-04 10:30:02', '2024-12-04 10:30:02'),
(6, 6, 250, 'active', NULL, '2024-12-04 10:30:19', '2024-12-04 10:30:19'),
(8, 7, 450, 'active', NULL, '2024-12-05 09:16:09', '2024-12-05 09:16:09'),
(9, 8, 200, 'active', NULL, '2024-12-05 09:17:41', '2024-12-05 09:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `courierdetails`
--

CREATE TABLE `courierdetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_type` enum('Individual','Company') NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `sender_name` varchar(50) NOT NULL,
  `sender_email` varchar(50) NOT NULL,
  `sender_phone` varchar(15) NOT NULL,
  `sender_address` varchar(50) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `receiver_email` varchar(50) NOT NULL,
  `receiver_phone` varchar(50) NOT NULL,
  `receiver_address` varchar(50) NOT NULL,
  `status` enum('Processing','On the way','Out of Delivery','Delivered') DEFAULT 'Processing',
  `item_description` varchar(250) NOT NULL,
  `tracking_id` varchar(255) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `payment_type` enum('Sender Payment','Receiver Payment') NOT NULL DEFAULT 'Sender Payment',
  `payment_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courierdetails`
--

INSERT INTO `courierdetails` (`id`, `sender_type`, `company_name`, `sender_name`, `sender_email`, `sender_phone`, `sender_address`, `receiver_name`, `receiver_email`, `receiver_phone`, `receiver_address`, `status`, `item_description`, `tracking_id`, `unit_name`, `cost`, `quantity`, `total_cost`, `comment`, `grand_total`, `payment_type`, `payment_amount`, `created_at`, `updated_at`) VALUES
(1, 'Individual', 'yujbfy', 'MOSTAFIZUR RAHMAN', 'abirm6133@gmail.com', '01971324922', '58/1,SOUTH RAJASHON\r\nSAVAR,DHAKA', 'MD FAZLUL HAQUE', 'mostafizurrahmanabir4444@gmail.com', '01971324922', '58/1,SOUTH RAJASHON\r\nSAVAR,DHAKA', NULL, 'tygfdcx', 'P123vbjdnv', '6', '500', 1, 500, 'kjgtdilh', 0, 'Sender Payment', 500, '2024-12-06 13:58:13', '2024-12-06 13:58:13'),
(2, 'Individual', 'yujbfy', 'MOSTAFIZUR RAHMAN', 'abirm6133@gmail.com', '01971324922', '58/1,SOUTH RAJASHON\r\nSAVAR,DHAKA', 'MD FAZLUL HAQUE', 'mostafizurrahmanabir4444@gmail.com', '01971324922', '58/1,SOUTH RAJASHON\r\nSAVAR,DHAKA', NULL, 'tygfdcx', 'P123vbjdnv', '6', '500', 1, 500, 'kjgtdilh', 0, 'Sender Payment', 500, '2024-12-06 14:00:45', '2024-12-06 14:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `branch_id` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `password`, `phone`, `branch_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Itachi Uchiha', 'employee1@gmail.com', '$2y$10$a5e2hKbDcV6tw/5R2FYOmejstMTTlEWkCzYvOVKIIXrTf9J5HifDW', '01236542155', '1', 'active', NULL, '2024-12-04 09:10:04', '2024-12-04 09:10:04');

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
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `photo` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `name`, `email`, `password`, `branch_id`, `number`, `status`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'M.M.R Shisui', 'manager@gmail.com', '$2y$10$V6ihpTP3qumNtf4D2op3cuZk753Ou8LJiM3YnbhL.dA8xJm0y.SKO', 1, '01971324922', 'active', 'images/20241206204324.jpg', NULL, '2024-12-02 11:41:27', '2024-12-06 14:43:24'),
(2, 'Minato Namikaze', 'manager1@gmail.com', '$2y$10$GxMbyBfQNs4UTw7ZmYk.fOqyhUUdvhi6TeEdpp/4hqKHhyS6ID48S', 2, '01736815328', 'active', 'images/20241206204302.jpg', NULL, '2024-12-06 14:42:33', '2024-12-06 14:43:02');

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
(97, '2024_11_29_165610_create_staffs_table', 2),
(98, '2024_11_30_160823_create_staffs_table', 3),
(99, '2024_11_30_164636_create_staffs_table', 4),
(100, '2024_11_30_165716_create_employees_table', 5),
(103, '2024_12_01_125144_create_costs_table', 8),
(104, '2024_12_01_125740_create_costs_table', 9),
(106, '2024_12_02_114332_create_companys_table', 11),
(119, '2014_10_12_000000_create_users_table', 12),
(120, '2014_10_12_100000_create_password_reset_tokens_table', 12),
(121, '2019_08_19_000000_create_failed_jobs_table', 12),
(122, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(123, '2024_11_21_142022_create_admins_table', 12),
(124, '2024_11_21_163117_create_managers_table', 12),
(125, '2024_11_22_064103_create_branches_table', 12),
(126, '2024_11_30_174404_create_employees_table', 12),
(127, '2024_12_01_120350_create_units_table', 12),
(128, '2024_12_01_150503_create_costs_table', 12),
(129, '2024_12_02_120038_create_companies_table', 12),
(130, '2024_12_04_110343_create_courierdetails_table', 13),
(131, '2024_12_04_114111_create_courierdetails_table', 14),
(132, '2024_12_04_154746_create_courierdetails_table', 15),
(133, '2024_12_06_175647_create_courierdetails_table', 16),
(134, '2024_12_06_194207_create_courierdetails_table', 17),
(135, '2024_12_06_195641_create_courierdetails_table', 18);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Box 1Kg', 'active', NULL, '2024-12-04 10:04:43', '2024-12-04 10:04:43'),
(2, 'By-Cycle', 'active', NULL, '2024-12-04 10:04:55', '2024-12-04 10:04:55'),
(3, 'Fridge', 'active', NULL, '2024-12-04 10:05:11', '2024-12-04 10:05:11'),
(4, 'Mobille', 'active', NULL, '2024-12-04 10:05:28', '2024-12-04 10:05:28'),
(5, 'Motor-Cycle', 'active', NULL, '2024-12-04 10:05:49', '2024-12-04 10:05:49'),
(6, 'Paper 1Kg', 'active', NULL, '2024-12-04 10:06:03', '2024-12-04 10:06:03'),
(7, 'Paper 500Gm', 'active', NULL, '2024-12-04 10:06:26', '2024-12-04 10:06:26'),
(8, 'Oil Box', 'active', NULL, '2024-12-05 09:17:25', '2024-12-05 09:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_branch_email_unique` (`branch_email`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courierdetails`
--
ALTER TABLE `courierdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `managers_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `costs`
--
ALTER TABLE `costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `courierdetails`
--
ALTER TABLE `courierdetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
