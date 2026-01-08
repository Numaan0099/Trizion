-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2026 at 09:52 AM
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
-- Database: `trizion`
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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-10440ad6b670f7a1a7055ef36a42241e', 'i:2;', 1767862316),
('laravel-cache-10440ad6b670f7a1a7055ef36a42241e:timer', 'i:1767862316;', 1767862316),
('laravel-cache-admin@example.com|127.0.0.1', 'i:1;', 1767853346),
('laravel-cache-admin@example.com|127.0.0.1:timer', 'i:1767853346;', 1767853346),
('laravel-cache-dc44958e29ffba8b810d21377ae366b5', 'i:1;', 1767853346),
('laravel-cache-dc44958e29ffba8b810d21377ae366b5:timer', 'i:1767853346;', 1767853346),
('laravel-cache-illuminate:queue:restart', 'i:1767854503;', 2083214503);

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

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'dd103962-829d-4f56-958f-c43334dd9767', 'database', 'default', '{\"uuid\":\"dd103962-829d-4f56-958f-c43334dd9767\",\"displayName\":\"App\\\\Jobs\\\\StartUserImport\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":300,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\StartUserImport\",\"command\":\"O:24:\\\"App\\\\Jobs\\\\StartUserImport\\\":1:{s:6:\\\"import\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:17:\\\"App\\\\Models\\\\Import\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1767854398,\"delay\":null}', 'TypeError: Cannot assign Laravel\\SerializableClosure\\Serializers\\Native to property Symfony\\Component\\Console\\Input\\InputArgument::$suggestedValues of type Closure|array in D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php:286\nStack trace:\n#0 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(286): ReflectionProperty->setValue(Object(Symfony\\Component\\Console\\Input\\InputArgument), Object(Laravel\\SerializableClosure\\Serializers\\Native))\n#1 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(229): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Symfony\\Component\\Console\\Input\\InputArgument), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#2 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Array, Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#3 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Symfony\\Component\\Console\\Input\\InputDefinition), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#4 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(229): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Symfony\\Component\\Console\\Command\\HelpCommand), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#5 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Array, Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#6 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Console\\Application), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#7 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(229): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Foundation\\Console\\Kernel), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#8 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Array, Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#9 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Foundation\\Application), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#10 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Events\\Dispatcher), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#11 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Database\\MySqlConnection), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#12 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Queue\\DatabaseQueue), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#13 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(283): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#14 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Native.php(125): Laravel\\SerializableClosure\\Serializers\\Native::wrapClosures(Object(App\\Jobs\\StartUserImport), Object(Laravel\\SerializableClosure\\Support\\ClosureScope))\n#15 [internal function]: Laravel\\SerializableClosure\\Serializers\\Native->__serialize()\n#16 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\serializable-closure\\src\\Serializers\\Signed.php(68): serialize(Object(Laravel\\SerializableClosure\\Serializers\\Native))\n#17 [internal function]: Laravel\\SerializableClosure\\Serializers\\Signed->__serialize()\n#18 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\DatabaseBatchRepository.php(333): serialize(Array)\n#19 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\DatabaseBatchRepository.php(106): Illuminate\\Bus\\DatabaseBatchRepository->serialize(Array)\n#20 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\PendingBatch.php(462): Illuminate\\Bus\\DatabaseBatchRepository->store(Object(Illuminate\\Bus\\PendingBatch))\n#21 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\PendingBatch.php(371): Illuminate\\Bus\\PendingBatch->store(Object(Illuminate\\Bus\\DatabaseBatchRepository))\n#22 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\app\\Jobs\\StartUserImport.php(126): Illuminate\\Bus\\PendingBatch->dispatch()\n#23 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\StartUserImport->handle()\n#24 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#29 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\StartUserImport))\n#30 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\StartUserImport))\n#31 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\StartUserImport), false)\n#33 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\StartUserImport))\n#34 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\StartUserImport))\n#35 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#36 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\StartUserImport))\n#37 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#38 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#39 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#40 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#41 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#42 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#43 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#44 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#45 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#46 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#47 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#48 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#49 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#50 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#51 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#55 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#56 D:\\GitHub Projects\\Numaan Project\\Laravel Project\\trizion\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#57 {main}', '2026-01-08 01:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `imported_users`
--

CREATE TABLE `imported_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imported_users`
--

INSERT INTO `imported_users` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(2, 'Jane Smith', 'jane.smith@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(3, 'Michael Johnson', 'michael.johnson@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(4, 'Emily Brown', 'emily.brown@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(5, 'David Wilson', 'david.wilson@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(6, 'Sarah Davis', 'sarah.davis@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(7, 'Robert Miller', 'robert.miller@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(8, 'Lisa Anderson', 'lisa.anderson@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(9, 'James Taylor', 'james.taylor@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(10, 'Jennifer Thomas', 'jennifer.thomas@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(11, 'William Martinez', 'william.martinez@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(12, 'Mary Garcia', 'mary.garcia@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(13, 'Christopher Rodriguez', 'christopher.rodriguez@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(14, 'Patricia Lee', 'patricia.lee@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(15, 'Daniel White', 'daniel.white@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(16, 'Barbara Harris', 'barbara.harris@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(17, 'Matthew Clark', 'matthew.clark@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(18, 'Susan Lewis', 'susan.lewis@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(19, 'Joseph Walker', 'joseph.walker@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59'),
(20, 'Jessica Hall', 'jessica.hall@example.com', '2026-01-08 01:11:59', '2026-01-08 01:11:59');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `status` enum('pending','processing','completed','failed') NOT NULL DEFAULT 'pending',
  `total_rows` int(11) NOT NULL DEFAULT 0,
  `success_count` int(11) NOT NULL DEFAULT 0,
  `failed_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `file_path`, `status`, `total_rows`, `success_count`, `failed_count`, `created_at`, `updated_at`) VALUES
(1, 'uploads/fIvTqhxKvoCjyw3jRO2bXeJ7L2qZRwXUp23F5obU.csv', 'failed', 0, 0, 0, '2026-01-08 00:53:43', '2026-01-08 00:53:59'),
(2, 'uploads/FuJCm9afvAf3YTF5tp08ZJNPdWTAsESEP2D3UJhI.csv', 'failed', 0, 0, 0, '2026-01-08 00:55:11', '2026-01-08 00:55:12'),
(3, 'uploads/bR1oEqayUmNLXHyscSY2plaDU3zal4RsZzdg5toG.csv', 'failed', 0, 0, 0, '2026-01-08 01:06:50', '2026-01-08 01:06:54'),
(4, 'uploads/Pela7PqxDedupKIeX71AxiXOgV3Br7JvpR00jNs8.csv', 'failed', 20, 0, 0, '2026-01-08 01:09:58', '2026-01-08 01:10:03'),
(5, 'uploads/7TmTfthS9sgNaJv78U5UcxRNmlpphzRyGTOzSVfQ.csv', 'completed', 20, 20, 0, '2026-01-08 01:11:55', '2026-01-08 01:12:05');

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

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a0c9120f-413f-4822-a017-23705f71ee08', 'Import #5', 1, 0, 0, '[]', 'a:1:{s:13:\"allowFailures\";b:1;}', NULL, 1767854518, 1767854519);

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
(4, '2025_08_14_170933_add_two_factor_columns_to_users_table', 1);

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
('h8cVt2yUmmts7E32X3E7JYB059fAXaxWmkFh73SS', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVW5PN1gwTEZwdExWbmZmQmhGelhZNWYzYzF6ZmNxdjlRak5zZDlBRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaW1wb3J0cyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1767862275),
('XPqmjtLqy6jWgwhbafyQ0WjgjUVf18HARRty18K2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS3FIOExTeDJqYmQxcGh2dkVMRmhOcVk0N2RwMGlKYUx2czE2YTdoWSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvaW1wb3J0IjtzOjU6InJvdXRlIjtzOjExOiJpbXBvcnQucGFnZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1767854965);

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
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Numaan', 'numaan0099@gmail.com', NULL, '$2y$12$WbH68D1fkKWePObWFOHNF.kp4dQUhhvR1UNSsqJ/c7m3lW0nnf4Zy', NULL, NULL, NULL, NULL, '2026-01-07 08:53:21', '2026-01-07 08:53:21'),
(2, 'Test', 'test@test.com', NULL, '$2y$12$pxt8f8IHKpxio1jWVNrXb.cHfTV8Ew9aI.x1Fh1i81QuZJjq1xnSC', NULL, NULL, NULL, NULL, '2026-01-08 00:51:44', '2026-01-08 00:51:44');

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
-- Indexes for table `imported_users`
--
ALTER TABLE `imported_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imported_users_email_index` (`email`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `imported_users`
--
ALTER TABLE `imported_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
