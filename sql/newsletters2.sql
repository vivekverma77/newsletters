-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2021 at 06:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsletters2`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `access_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `access_view` int(11) NOT NULL,
  `access_insert` int(11) NOT NULL,
  `access_update` int(11) NOT NULL,
  `access_delete` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`access_id`, `role_id`, `module_id`, `access_view`, `access_insert`, `access_update`, `access_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2021-08-10 05:39:10', '2021-08-11 07:20:48'),
(2, 1, 2, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(3, 1, 3, 1, 1, 1, 1, '2021-08-10 05:39:10', '2021-08-12 05:55:04'),
(4, 1, 4, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(5, 1, 5, 1, 1, 1, 1, '2021-08-10 05:39:10', '2021-08-12 05:55:08'),
(6, 1, 6, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(7, 2, 1, 1, 1, 1, 0, '2021-08-10 05:39:10', '2021-08-12 05:55:14'),
(8, 2, 2, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(9, 2, 3, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(10, 2, 4, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(11, 2, 5, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(12, 2, 6, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(13, 3, 1, 1, 1, 1, 1, '2021-08-10 05:39:10', NULL),
(14, 3, 2, 1, 1, 1, 1, '2021-08-10 05:39:11', NULL),
(15, 3, 3, 1, 1, 1, 1, '2021-08-10 05:39:11', NULL),
(16, 3, 4, 1, 1, 1, 1, '2021-08-10 05:39:11', NULL),
(17, 3, 5, 1, 1, 1, 1, '2021-08-10 05:39:11', NULL),
(18, 3, 6, 1, 1, 1, 1, '2021-08-10 05:39:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_num` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `province` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `tel`, `address`, `street_num`, `city`, `postcode`, `province`, `country`, `source`, `deleted_at`, `created_at`, `updated_at`) VALUES
(14, 'Vivek', 'Verma', '89622299554', '30', '561', 'Indore', 452010, 'Indian', 'India', NULL, NULL, '2021-08-16 01:13:57', '2021-08-16 01:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `contact_emails`
--

CREATE TABLE `contact_emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_emails`
--

INSERT INTO `contact_emails` (`id`, `contact_id`, `email`, `created_at`, `updated_at`) VALUES
(9, 14, 'vivek@gmail.co', '2021-08-16 01:13:57', '2021-08-16 01:13:57'),
(10, 14, 'abc@gmail.com', '2021-08-16 01:13:57', '2021-08-16 01:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE `domains` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domains`
--

INSERT INTO `domains` (`id`, `domain`, `tenant_id`, `created_at`, `updated_at`) VALUES
(1, 'softgetix.newsletters2.localhost', 'softgetix', '2021-08-10 01:15:24', '2021-08-10 01:15:24'),
(5, 'ankit.newsletters2.localhost', 'ankit', '2021-08-11 08:07:31', '2021-08-11 08:07:31'),
(6, 'anbruch.newsletters2.localhost', 'anbruch', '2021-08-13 08:14:43', '2021-08-13 08:14:43'),
(7, 'test.newsletters2.localhost', 'test', '2021-08-16 00:28:56', '2021-08-16 00:28:56'),
(8, 'test2.newsletters2.localhost', 'test2', '2021-08-16 00:32:25', '2021-08-16 00:32:25'),
(9, 'abxc2.newsletters2.localhost', 'abxc2', '2021-08-16 01:51:02', '2021-08-16 01:51:02'),
(10, 'acxc.newsletters2.localhost', 'acxc', '2021-08-16 01:57:30', '2021-08-16 01:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_15_000010_create_tenants_table', 1),
(5, '2019_09_15_000020_create_domains_table', 1),
(6, '2017_08_24_000000_create_activations_table', 2),
(7, '2017_08_24_000000_create_admin_activations_table', 2),
(8, '2017_08_24_000000_create_admin_password_resets_table', 2),
(9, '2017_08_24_000000_create_admin_users_table', 2),
(10, '2018_07_18_000000_create_wysiwyg_media_table', 2),
(11, '2020_10_21_000000_add_last_login_at_timestamp_to_admin_users_table', 2),
(12, '2021_07_29_073818_create_companies_table', 3),
(13, '2021_07_29_080054_create_media_table', 3),
(14, '2021_07_29_080054_create_permission_tables', 3),
(15, '2021_07_29_080059_fill_default_admin_user_and_permissions', 3),
(16, '2021_07_29_083222_create_translations_table', 4),
(17, '2021_08_03_092722_create_roles_table', 5),
(18, '2021_08_03_093224_add_role_id_to_users', 5),
(19, '2021_08_03_093609_create_roles_table', 6),
(20, '2021_08_04_093224_add_is_super_admin_to_users', 7),
(21, '2021_08_04_093225_add_is_super_admin_to_users', 8),
(22, '2019_09_15_000011_create_tenants_table', 9),
(23, '2019_09_15_000021_create_domains_table', 10),
(24, '2021_08_09_143027_add_email_to_tenants', 11),
(25, '2021_08_09_143028_add_email_to_tenants', 12),
(26, '2021_08_10_093819_create_access_table', 13),
(27, '2021_08_10_093932_create_modules_table', 13),
(28, '2021_08_12_061113_create_contacts_table', 14),
(29, '2021_08_12_062336_create_contact_emails_table', 15),
(30, '2021_08_12_065955_add_foreign_to_users_table', 16),
(31, '2021_08_16_092443_create_newsletters_table', 17),
(32, '2021_08_16_09244_create_newsletters_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_id` int(10) UNSIGNED NOT NULL,
  `module_parent` int(11) DEFAULT NULL,
  `module_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_link` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_icon` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `module_parent`, `module_name`, `module_description`, `module_link`, `module_icon`, `module_order`, `created_at`, `updated_at`) VALUES
(1, NULL, 'users', 'User Access', 'users', NULL, 1, NULL, NULL),
(2, NULL, 'contacts', 'Contacts Access', 'contacts', NULL, 2, NULL, NULL),
(3, NULL, 'terms', 'Terms Access', 'terms', NULL, 3, NULL, NULL),
(4, NULL, 'attributes', 'Attributes Access', 'attributes', NULL, 4, NULL, NULL),
(5, NULL, 'Mailings', 'Mailings Access', 'mailings', NULL, 5, NULL, NULL),
(6, NULL, 'Newsletters', 'Newsletters Access', 'newsletters', NULL, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtracted_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `role_slug`, `created_at`, `updated_at`) VALUES
(1, 'Company administrator', 'company_admin', '2021-08-10 05:26:18', NULL),
(2, 'Contacts manager', 'contacts_manager', '2021-08-10 05:26:18', NULL),
(3, 'Content manager', 'content_manager', '2021-08-10 05:26:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `company_name`, `email`, `created_at`, `updated_at`, `data`) VALUES
('abxc2', 'anbruch', 'cmm@gmail.com', '2021-08-16 01:50:57', '2021-08-16 01:50:57', '{\"tenancy_db_name\":\"tenantabxc2\"}'),
('acxc', 'abcv', 'ac@gmail.com', '2021-08-16 01:57:23', '2021-08-16 01:57:23', '{\"tenancy_db_name\":\"tenantacxc\"}'),
('anbruch', 'anbruch', 'anbruch@gmail.com', '2021-08-13 08:14:36', '2021-08-13 08:14:36', '{\"tenancy_db_name\":\"tenantanbruch\"}'),
('ankit', 'ankit', 'ankit@gmail.com', '2021-08-11 08:07:29', '2021-08-11 08:07:29', '{\"tenancy_db_name\":\"tenantankit\"}'),
('softgetix', 'softgetix', 'softgetix@gmail.com', '2021-08-10 01:15:22', '2021-08-10 01:15:22', '{\"tenancy_db_name\":\"tenantsoftgetix\"}'),
('test', 'test', 'admin@gmail.com', '2021-08-16 00:28:49', '2021-08-16 00:28:49', '{\"tenancy_db_name\":\"tenanttest\"}'),
('test2', 'test2', 'admin2@gmail.com', '2021-08-16 00:32:19', '2021-08-16 00:32:19', '{\"tenancy_db_name\":\"tenanttest2\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_super_admin`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$cQtgG4H2l/FD5qXhQ1Y2ieEHXri8L1v8rPHWbeQHc5XE3Dr6tCvqy', 1, NULL, '2021-08-10 07:10:20', '2021-08-10 07:10:24', 1),
(3, 'Softgetix Ashwini', 'Ashwini@gmail.com', NULL, '$2y$10$C8mePspBl88Su5iubpgQLe6bjshbBSnRp2cEdeRkHtGrqatdiQRn.', 0, NULL, '2021-08-12 00:38:40', '2021-08-12 00:38:40', 2),
(4, 'CC', 'adminCC@gmail.com', NULL, '$2y$10$6mcQDyCu1Fxw7w4lhl4Pbu48r6jsgwL/36hFSkvgnCvOFdjRvGBwy', 0, NULL, '2021-08-12 03:49:32', '2021-08-12 03:49:32', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`access_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_emails`
--
ALTER TABLE `contact_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_emails_contact_id_foreign` (`contact_id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenants_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `access_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact_emails`
--
ALTER TABLE `contact_emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `module_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_emails`
--
ALTER TABLE `contact_emails`
  ADD CONSTRAINT `contact_emails_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
