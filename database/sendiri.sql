-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2021 at 05:55 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larashop`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `slug`, `description`, `author`, `publisher`, `cover`, `price`, `views`, `stock`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Coba add baru', 'coba-add-baru', 'Ini deskripsi mauuuu', 'Miuun Patul', 'CV Sentosa Babar', 'book-covers/DQa7jlrR5oUhQvcvc45lq6QHFAAngRMon6iwqVQK.png', 120000.00, 0, 49, 'PUBLISH', 1, NULL, NULL, '2021-01-02 16:06:58', '2021-01-03 07:21:46', NULL),
(2, 'Coba kalo drapt', 'coba-kalo-drapt', 'deskripsi draptnya', 'Anna belle', 'PT Bel bel', 'book-covers/xUNNzccT9dUkwwvik4FTdDAP5tqldNvhMDYm3bcQ.jpeg', 150000.00, 0, 12, 'DRAFT', 1, NULL, NULL, '2021-01-02 16:07:39', '2021-01-04 07:08:39', NULL),
(3, 'Terbaru UPDATED', 'terbaru-coy-we-we-we', 'Des', 'Bekekekeke Author', 'Ini naa Publishernya', 'book-covers/UqPq7qWjGEMjPMVOZkaA6QA604U78zbQNIeOLHQj.png', 135000.00, 0, 1000, 'PUBLISH', 1, 1, NULL, '2021-01-03 04:57:58', '2021-01-04 07:08:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_category`
--

INSERT INTO `book_category` (`id`, `book_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(2, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_order`
--

CREATE TABLE `book_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'berisi nama file image saja tanpa path',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Laravel', 'laravel', 'category_images/snd7c3Lm3ENRlkWBUSgobauA0Xaoo5iEjnXqj8ym.png', 1, NULL, NULL, NULL, '2020-12-30 21:35:01', '2021-01-01 11:07:00'),
(2, 'Bootstrap', 'bootstrap', 'category_images/yRuV7dPOQKhZRWiM8w2VbdodlIFBgjveGl7bnz2L.png', 1, NULL, NULL, NULL, '2020-12-30 21:35:11', '2020-12-30 21:35:11'),
(3, 'Annabelle', 'annabelle', 'category_images/WewSdtDGWiGtOdhyMzwKQmZYfUCpoeK9PlrbtPtg.jpeg', 1, NULL, NULL, NULL, '2020-12-30 21:35:37', '2020-12-30 21:35:37'),
(4, 'Nama Oke ke ke YI', 'nama-oke-ke-ke-yi', 'category_images/bN4MeqAZ28xuVgXympd2JsMwSftaC9wtDkvGPA5g.jpeg', 1, 1, NULL, NULL, '2021-01-01 09:24:11', '2021-01-01 11:06:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(4, '2020_11_15_075557_penyesuaian_table_users', 2),
(5, '2020_12_30_152848_create_table_categories', 3),
(6, '2021_01_02_142545_create_books_table', 4),
(7, '2021_01_02_143116_create_book_category_table', 5),
(8, '2021_01_04_141833_create_orders_table', 6),
(9, '2021_01_04_144812_create_book_order_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` double(8,2) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(1, 'Fathul Miun', 'fmuiin14@gmail.com', NULL, '$2y$10$F.HweXxRA/wva/EBmwR75eLFOg9.iyDUqvBIxPmPodyvmYbw.msk6', NULL, '2020-11-15 01:10:11', '2020-11-18 07:11:25', 'fmuiin14', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Depok, Jawa Barat, Indonesia', '089679590971', 'avatars/O8CxkfGykWh9BGjpHFch5JpGo8Olt9wH1eOyPsIh.jpeg', 'ACTIVE'),
(4, 'Testing Nambah Data', 'nambahdata@gmail.com', NULL, '$2y$10$u6ByOaNXnNshyj09Koev6eklM5dkkJwC1aS9s5Tm77rOuDjd5MpiK', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'nambahdata@gmail.com', '[\"CUSTOMER\"]', 'Testing Nambah Data', '08111111111', 'avatars/aCfb7lfiRUkvRkGKdcTO9ohkbwynTX8KiEONLhUh.jpeg', 'ACTIVE'),
(5, 'Nama Tesss', 'emailtesss@gmail.com', NULL, '$2y$10$OWvofhsVC7tq2NJdB/7F8u49P9qRkPXfGQtjhFuZF6xpXlfkNnwAK', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'namatesss', '[\"ADMIN\",\"STAFF\"]', 'Nambah, Alamatnya ini', '08777777777', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(6, 'Olaf Reynolds', 'gabriella.spencer@anderson.com', NULL, '$2y$10$drBBYO5yA/c9jmR.YU85iOeioyqCBYW9E1MSC4ER1G/bttPTDET22', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'kirlin.fae', '[\"ADMIN\",\"STAFF\"]', '822 Norma Shoals\nAuerchester, CA 77343', '416.341.0393', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(7, 'Kendall Johnson', 'frida.treutel@hotmail.com', NULL, '$2y$10$3HCk41tbNU9V2jLl1VcLYOBPHXLPPBeJzm9yWkQrTJH1dhwq/NpUq', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'roger.heidenreich', '[\"ADMIN\",\"STAFF\"]', '1448 Myrl Land\nNew Huldaport, NJ 96632', '+1-272-590-5489', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(8, 'Dandre Kemmer', 'sporer.oswaldo@kris.com', NULL, '$2y$10$4ZCmJik4iy7P9eoVxxqKaeud6zPSwY/MrEGbmQwPIXTYP9bU/uTsS', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'leslie77', '[\"ADMIN\",\"STAFF\"]', '218 Rosenbaum Square\nSouth Lomaville, IA 20316-6349', '984.283.4183 x1922', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(9, 'Prof. Granville Bruen I', 'lempi.schaefer@gmail.com', NULL, '$2y$10$0YdVRcYtsSFzIGofjkZi9uLRwzrri6iofl7I1E/eOTvHa/jMBtIpy', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'ondricka.saige', '[\"ADMIN\",\"STAFF\"]', '6306 Delmer Drives Suite 166\nSouth Erikhaven, MD 52329-2693', '469-252-4290 x91596', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(10, 'Elroy Hane', 'sunny10@hotmail.com', NULL, '$2y$10$YR3drGJWbnaSBooqd0YQEuwuEH6N8Dh/0c3ekqf01gq9tLgvRt3vy', NULL, '2020-12-25 10:05:28', '2020-12-30 08:25:37', 'leonard.toy', '[\"ADMIN\",\"STAFF\"]', '314 Kayden Shore Apt. 060\r\nPort Hermina, NM 53330', '+1 (572) 520-8616', 'saat-ini-tidak-ada.png', 'INACTIVE'),
(11, 'Dr. Frances Zieme', 'okon.emilio@nader.net', NULL, '$2y$10$RBlv8c1iRBgH4sGM35gUPulkuAKWzM/.U866sIHNHAPzHU86vYAN2', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'thaddeus.lang', '[\"ADMIN\",\"STAFF\"]', '1402 Misty Station Suite 828\nGreenholtburgh, OR 37227-1195', '1-242-836-6966 x05554', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(13, 'Gilberto Eichmann', 'dillon69@yahoo.com', NULL, '$2y$10$DDcCqtf5mW989zVWzWdCNOM0pNHJ6KcErrLKQ0ushBazJpS6KBav.', NULL, '2020-12-25 10:05:28', '2020-12-29 07:54:10', 'romaine91', '[\"ADMIN\",\"STAFF\"]', '4674 Samson Locks Apt. 291\r\nMabelside, LA 37695-6948', '940.864.2079', 'saat-ini-tidak-ada.png', 'INACTIVE'),
(14, 'Elvie Keeling Sr.', 'jane71@wehner.biz', NULL, '$2y$10$rGX27V4y0rXpOkoQj8fdLuNkZks098N2TyRxPInishWbO5UlGHwE.', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'era.cruickshank', '[\"ADMIN\",\"STAFF\"]', '8729 Padberg Ramp\nLake Jayceburgh, AZ 23121', '448.742.3758 x684', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(15, 'Miss Eliza Pouros', 'rreilly@marks.info', NULL, '$2y$10$xHYldwk.ZdeCbey.OT//..XRTVVRz2pjFcjVO4MEmGuq7jx6j1q2i', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'tristin.rodriguez', '[\"ADMIN\",\"STAFF\"]', '85391 Wilkinson Club\nSouth Celestinostad, NV 57225-2558', '+19906620043', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(16, 'Dr. Mae Treutel Jr.', 'cole52@labadie.org', NULL, '$2y$10$xVyZKS7QvCrO4vLCqjG8ruFabwtyd2lutCK5MV4eVFyhy.4yqNJKy', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'luther02', '[\"ADMIN\",\"STAFF\"]', '7670 Nolan Isle\nJewelton, OR 55827-7954', '1-234-591-7141 x164', '', 'ACTIVE'),
(17, 'Justyn Towne', 'kulas.jedediah@gmail.com', NULL, '$2y$10$V4JJCyqlA01xdyorjoneEuO.6ZyJWwdXc2Cua1xkBPSqCaelkA8WC', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'jveum', '[\"ADMIN\",\"STAFF\"]', '58242 Adonis Court Apt. 311\nHassiefort, IL 24401-9984', '376.671.7219 x1939', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(18, 'Tyreek Little PhD', 'jast.kirk@keebler.biz', NULL, '$2y$10$J4Mlc0S1eVsdsTRosgKQaeP4hZJjZe5g1ASJb8Ho5qUcTIzgeVZR.', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'sporer.ronny', '[\"ADMIN\",\"STAFF\"]', '4968 Veum Prairie\nBraedenberg, SD 62460', '+15398369059', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(19, 'Dr. Deborah Nikolaus II', 'hector.boyle@armstrong.org', NULL, '$2y$10$r5RfW9.NJUPpR69pSsRtgefXCkU4vs8SrTMxxBVRLCtK0fz4jaCAW', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'ltromp', '[\"ADMIN\",\"STAFF\"]', '5317 Pacocha Squares Apt. 688\nTaylormouth, AR 98504-4117', '(351) 335-1378', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(20, 'Mrs. Yvette Hudson', 'nbauch@muller.com', NULL, '$2y$10$FzKFJvvR6HT7HlMDKjVjMOHhF6/KWxisEYo5vosXEpFXciodakPrW', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'zaltenwerth', '[\"ADMIN\",\"STAFF\"]', '38825 Wava Shoal Apt. 557\nNorth Dallinstad, LA 97315-6749', '(789) 628-6093', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(21, 'Alan Wolff II', 'hhill@hotmail.com', NULL, '$2y$10$NRvPVUM.0mkYWCRz31JLcOB4UL0ire/QuVRRnQ5UVdQ7IcSDGYOEq', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'heathcote.monte', '[\"ADMIN\",\"STAFF\"]', '3012 Tillman Gardens Apt. 928\nNorth Jadenfurt, TN 33207', '853-625-3146', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(22, 'Julian Williamson', 'weldon.oconner@boyle.net', NULL, '$2y$10$unNSNrWVA1iE/GQVLk9P1OpmgaBAfxEuQiQ9CBVVNKixSHgh4Tzp6', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'dina09', '[\"ADMIN\",\"STAFF\"]', '26214 Paucek Skyway\nLegroston, MA 87915-3001', '514.936.9739', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(23, 'Carolanne Steuber', 'jacques13@mitchell.com', NULL, '$2y$10$hNxoREnPDHU/TP3JnHzGsODW/eQH4IYx2fhxYDOHogYdEo1fF0i3G', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'schultz.noelia', '[\"ADMIN\",\"STAFF\"]', '98173 Price Harbor Suite 860\nRennerborough, SC 64494', '229.705.7220', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(24, 'Anthony Rempel', 'fermin12@hotmail.com', NULL, '$2y$10$iELKZqwRUW7/rxRLcJ/xjORQYetlxk8yN6U9jvfBsGkGlKHNje1vu', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'ogerhold', '[\"ADMIN\",\"STAFF\"]', '767 Dariana Lake\nLilianville, SD 43347', '531-345-8072 x433', 'saat-ini-tidak-ada.png', 'ACTIVE'),
(25, 'Edwin Cormier', 'vmcdermott@barton.com', NULL, '$2y$10$2nA73kUuHLJCpfp/7yjM5.8k9wwNWe2djoaM92Jw6W410M3gCF7TS', NULL, '2020-12-25 10:05:28', '2020-12-25 10:05:28', 'gcorwin', '[\"ADMIN\",\"STAFF\"]', '729 Maya Pines\nLake Grayson, NE 10622', '(350) 841-5358', 'saat-ini-tidak-ada.png', 'ACTIVE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_book_id_foreign` (`book_id`),
  ADD KEY `book_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `book_order`
--
ALTER TABLE `book_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_order_order_id_foreign` (`order_id`),
  ADD KEY `book_order_book_id_foreign` (`book_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_order`
--
ALTER TABLE `book_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `book_order`
--
ALTER TABLE `book_order`
  ADD CONSTRAINT `book_order_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
