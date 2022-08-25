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
-- Database: `newsletters`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_activations`
--

CREATE TABLE `admin_activations` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Administrator', 'Administrator', 'administrator@brackets.sk', '$2a$04$aSMLL3TyG0tMF8FXIcKAqOc6J/4oJHDo8ZiOfLpX4fEpNtn6zRUpy', 'aHJBFNjJGTchJZbOGKGjZoenehPGWnN1gc1KfmDQEc17K4uByBN28LKDU5j8', 1, 0, 'en', NULL, '2021-07-29 03:02:36', '2021-07-29 06:15:58', '2021-07-29 06:15:58'),
(2, 'Vivek', 'Verma', 'vivekverma896@gmail.com', '$2y$10$YrycG6T01WcduJ3tD0QdDui1wjXxozRPCEd2kHxg40RqbD7rrCtr.', 'ndHfsILeGIHDGnQlx1aQcJJtzykubmYhzSc7zN9s0IS8vblLqz6uoUGDygng', 1, 0, 'en', NULL, '2021-07-29 03:46:05', '2021-07-29 05:50:16', '2021-07-29 05:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'ron.localhost', 'ron', '2021-07-29 00:45:40', '2021-07-29 00:45:40');

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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1, '2b9222fd-8296-46fa-8f7d-14fe5c65b37b', 'avatar', 'avatar', 'avatar.png', 'image/png', 'media', 'media', 23924, '[]', '[]', '{\"thumb_200\":true,\"thumb_75\":true,\"thumb_150\":true}', '[]', 1, '2021-07-29 03:02:36', '2021-07-29 03:02:39');

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
(16, '2021_07_29_083222_create_translations_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1),
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 2);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(2, 'admin.translation.index', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(3, 'admin.translation.edit', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(4, 'admin.translation.rescan', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(5, 'admin.admin-user.index', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(6, 'admin.admin-user.create', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(7, 'admin.admin-user.edit', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(8, 'admin.admin-user.delete', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(9, 'admin.upload', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35'),
(10, 'admin.admin-user.impersonal-login', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2021-07-29 03:02:35', '2021-07-29 03:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `created_at`, `updated_at`, `data`) VALUES
('foo', '2021-07-29 00:06:31', '2021-07-29 00:06:31', '{\"tenancy_db_name\":\"tenantfoo\"}'),
('nn', '2021-07-29 05:38:34', '2021-07-29 05:38:34', '{\"tenancy_db_name\":\"tenantnn\"}'),
('ron', '2021-07-29 00:45:19', '2021-07-29 00:45:19', '{\"tenancy_db_name\":\"tenantron\"}');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(2, 'brackets/admin-ui', 'admin', 'operation.failed', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(3, 'brackets/admin-ui', 'admin', 'operation.not_allowed', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(4, '*', 'admin', 'admin-user.columns.first_name', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(5, '*', 'admin', 'admin-user.columns.last_name', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(6, '*', 'admin', 'admin-user.columns.email', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(7, '*', 'admin', 'admin-user.columns.password', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(8, '*', 'admin', 'admin-user.columns.password_repeat', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(9, '*', 'admin', 'admin-user.columns.activated', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(10, '*', 'admin', 'admin-user.columns.forbidden', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(11, '*', 'admin', 'admin-user.columns.language', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(12, 'brackets/admin-ui', 'admin', 'forms.select_an_option', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(13, '*', 'admin', 'admin-user.columns.roles', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(14, 'brackets/admin-ui', 'admin', 'forms.select_options', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(15, '*', 'admin', 'admin-user.actions.create', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(16, 'brackets/admin-ui', 'admin', 'btn.save', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(17, '*', 'admin', 'admin-user.actions.edit', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(18, '*', 'admin', 'admin-user.actions.index', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(19, 'brackets/admin-ui', 'admin', 'placeholder.search', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(20, 'brackets/admin-ui', 'admin', 'btn.search', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(21, '*', 'admin', 'admin-user.columns.id', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(22, '*', 'admin', 'admin-user.columns.last_login_at', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(23, 'brackets/admin-ui', 'admin', 'btn.edit', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(24, 'brackets/admin-ui', 'admin', 'btn.delete', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(25, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(26, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(27, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(28, 'brackets/admin-ui', 'admin', 'btn.new', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(29, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(30, 'brackets/admin-auth', 'admin', 'profile_dropdown.profile', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(31, 'brackets/admin-auth', 'admin', 'profile_dropdown.password', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(32, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(33, 'brackets/admin-ui', 'admin', 'sidebar.content', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(34, 'brackets/admin-ui', 'admin', 'sidebar.settings', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(35, '*', 'admin', 'admin-user.actions.edit_password', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(36, '*', 'admin', 'admin-user.actions.edit_profile', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(37, 'brackets/admin-auth', 'admin', 'activation_form.title', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(38, 'brackets/admin-auth', 'admin', 'activation_form.note', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(39, 'brackets/admin-auth', 'admin', 'auth_global.email', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(40, 'brackets/admin-auth', 'admin', 'activation_form.button', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(41, 'brackets/admin-auth', 'admin', 'login.title', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(42, 'brackets/admin-auth', 'admin', 'login.sign_in_text', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(43, 'brackets/admin-auth', 'admin', 'auth_global.password', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(44, 'brackets/admin-auth', 'admin', 'login.button', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(45, 'brackets/admin-auth', 'admin', 'login.forgot_password', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(46, 'brackets/admin-auth', 'admin', 'forgot_password.title', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(47, 'brackets/admin-auth', 'admin', 'forgot_password.note', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(48, 'brackets/admin-auth', 'admin', 'forgot_password.button', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(49, 'brackets/admin-auth', 'admin', 'password_reset.title', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(50, 'brackets/admin-auth', 'admin', 'password_reset.note', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(51, 'brackets/admin-auth', 'admin', 'auth_global.password_confirm', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(52, 'brackets/admin-auth', 'admin', 'password_reset.button', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(53, 'brackets/admin-auth', 'activations', 'email.line', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(54, 'brackets/admin-auth', 'activations', 'email.action', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(55, 'brackets/admin-auth', 'activations', 'email.notRequested', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(56, 'brackets/admin-auth', 'admin', 'activations.activated', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(57, 'brackets/admin-auth', 'admin', 'activations.invalid_request', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(58, 'brackets/admin-auth', 'admin', 'activations.disabled', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(59, 'brackets/admin-auth', 'admin', 'activations.sent', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(60, 'brackets/admin-auth', 'admin', 'passwords.sent', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(61, 'brackets/admin-auth', 'admin', 'passwords.reset', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(62, 'brackets/admin-auth', 'admin', 'passwords.invalid_token', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(63, 'brackets/admin-auth', 'admin', 'passwords.invalid_user', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(64, 'brackets/admin-auth', 'admin', 'passwords.invalid_password', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(65, 'brackets/admin-auth', 'resets', 'email.line', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(66, 'brackets/admin-auth', 'resets', 'email.action', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(67, 'brackets/admin-auth', 'resets', 'email.notRequested', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(68, '*', 'auth', 'failed', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(69, '*', 'auth', 'throttle', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(70, '*', '*', 'Manage access', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(71, '*', '*', 'Translations', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(72, '*', '*', 'Configuration', '[]', NULL, '2021-07-29 03:02:57', '2021-07-29 03:22:59', NULL),
(73, 'brackets/admin-translations', 'admin', 'title', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(74, 'brackets/admin-translations', 'admin', 'index.all_groups', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(75, 'brackets/admin-translations', 'admin', 'index.edit', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(76, 'brackets/admin-translations', 'admin', 'index.default_text', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(77, 'brackets/admin-translations', 'admin', 'index.translation', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(78, 'brackets/admin-translations', 'admin', 'index.translation_for_language', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(79, 'brackets/admin-translations', 'admin', 'import.title', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(80, 'brackets/admin-translations', 'admin', 'import.notice', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(81, 'brackets/admin-translations', 'admin', 'import.upload_file', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(82, 'brackets/admin-translations', 'admin', 'import.choose_file', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(83, 'brackets/admin-translations', 'admin', 'import.language_to_import', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(84, 'brackets/admin-translations', 'admin', 'fields.select_language', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(85, 'brackets/admin-translations', 'admin', 'import.do_not_override', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(86, 'brackets/admin-translations', 'admin', 'import.conflict_notice_we_have_found', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(87, 'brackets/admin-translations', 'admin', 'import.conflict_notice_translations_to_be_imported', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(88, 'brackets/admin-translations', 'admin', 'import.conflict_notice_differ', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(89, 'brackets/admin-translations', 'admin', 'fields.group', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(90, 'brackets/admin-translations', 'admin', 'fields.default', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(91, 'brackets/admin-translations', 'admin', 'fields.current_value', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(92, 'brackets/admin-translations', 'admin', 'fields.imported_value', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(93, 'brackets/admin-translations', 'admin', 'import.sucesfully_notice', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(94, 'brackets/admin-translations', 'admin', 'import.sucesfully_notice_update', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(95, 'brackets/admin-translations', 'admin', 'index.export', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(96, 'brackets/admin-translations', 'admin', 'export.notice', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(97, 'brackets/admin-translations', 'admin', 'export.language_to_export', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(98, 'brackets/admin-translations', 'admin', 'btn.export', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(99, 'brackets/admin-translations', 'admin', 'index.title', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(100, 'brackets/admin-translations', 'admin', 'btn.import', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(101, 'brackets/admin-translations', 'admin', 'btn.re_scan', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(102, 'brackets/admin-translations', 'admin', 'fields.created_at', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(103, 'brackets/admin-translations', 'admin', 'index.no_items', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(104, 'brackets/admin-translations', 'admin', 'index.try_changing_items', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(105, 'brackets/admin-ui', 'admin', 'media_uploader.max_number_of_files', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(106, 'brackets/admin-ui', 'admin', 'media_uploader.max_size_pre_file', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(107, 'brackets/admin-ui', 'admin', 'media_uploader.private_title', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(108, 'brackets/admin-ui', 'admin', 'page_title_suffix', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(109, 'brackets/admin-ui', 'admin', 'footer.powered_by', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL),
(110, '*', '*', 'Close', '[]', NULL, '2021-07-29 03:22:59', '2021-07-29 03:22:59', NULL);

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg_media`
--

CREATE TABLE `wysiwyg_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) UNSIGNED DEFAULT NULL,
  `wysiwygable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD KEY `activations_email_index` (`email`);

--
-- Indexes for table `admin_activations`
--
ALTER TABLE `admin_activations`
  ADD KEY `admin_activations_email_index` (`email`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domains_domain_unique` (`domain`),
  ADD KEY `domains_tenant_id_foreign` (`tenant_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_namespace_index` (`namespace`),
  ADD KEY `translations_group_index` (`group`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `domains`
--
ALTER TABLE `domains`
  ADD CONSTRAINT `domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
