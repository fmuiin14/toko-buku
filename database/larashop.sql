-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2021 at 09:47 PM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u4446218_larashop`
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
(2, 'How to become great man', 'how-to-become-great-man', 'The book description', 'Noone', 'Nopublisher', 'book-covers/riSvIG5fsoNOCE0OhwIdNh3EewgYuCLAqEPSaV9w.png', 390000.00, 0, 330, 'PUBLISH', 1, 24, NULL, '2018-07-26 07:20:14', '2021-01-07 06:51:48', '2021-01-07 06:51:48'),
(4, 'How to become ninja Developer', 'how-to-become-ninja-developer', 'Descriptions goes here', 'Muhammad Azamuddin', 'Indie Publisher', 'book-covers/2x9OEHtj57kVp9UZe9Av39TBMNphRw8FrEh4Nium.png', 239000.00, 0, 9, 'PUBLISH', 1, NULL, NULL, '2018-10-02 07:06:39', '2018-10-02 08:42:41', NULL);

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
(2, 2, 5, NULL, NULL),
(4, 4, 5, NULL, NULL),
(6, 2, 4, NULL, NULL);

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

--
-- Dumping data for table `book_order`
--

INSERT INTO `book_order` (`id`, `order_id`, `book_id`, `quantity`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 1, '2018-07-26 00:00:00', '2018-07-26 00:00:00');

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
(2, 'Wekeke ek ew kew ew', 'wekeke-ek-ew-kew-ew', 'category_images/n8gfQFT4PD5OzKt7KFJLANMZMPXbvHMpLFCySP3i.png', 1, 24, NULL, NULL, '2018-07-16 04:04:48', '2021-01-05 20:27:26'),
(3, 'Hardware', 'hardware', 'category_images/sCYd3L9ZHPUa7bnTWIjaTDO3RWzCwfBPq5qbQL3h.jpeg', 1, 1, NULL, NULL, '2018-07-23 03:21:00', '2021-01-06 07:37:07'),
(4, 'Ilmiiah', 'ilmiiah', 'category_images/ej14L2H7HLHcvCFGZoT9GwTb2rX9nmEUNyKkEXKZ.jpeg', 1, NULL, NULL, NULL, '2018-07-23 03:21:15', '2021-01-05 20:27:38'),
(5, 'Self Development', 'self-development', 'category_images/nE9xMN84MaKeHyVG1jcwPF1ChOUvaYzGXjSI19Mu.png', 1, NULL, NULL, NULL, '2018-07-26 07:18:50', '2018-07-26 07:18:50'),
(6, 'Business', 'business', 'category_images/vLhVcc7mSOm5WzdxEifRqbj41KAwrxvB4qfEEkRh.png', 1, NULL, NULL, NULL, '2018-07-26 07:21:27', '2018-07-26 07:21:27'),
(7, 'Joseph Mueller', 'incidunt-ut-sint-necessitatibus-aut', '/tmp/f22bc6dd11e9659a530ecdf0b594a542.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:13'),
(8, 'Alize Jacobs', 'voluptatem-aut-explicabo-voluptatum-est', '/tmp/7eeba2afaad844803b7029f670058def.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:18'),
(9, 'Shaniya Collins', 'consequatur-nihil-saepe-facilis-hic', '/tmp/75f3166283222da447dc60d790ba8fec.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:22'),
(10, 'Mrs. Magdalena Graham I', 'necessitatibus-ut-assumenda-et-eligendi-aut', '/tmp/96ec46942ad5c6873f7c3e3bedc031bf.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:26'),
(12, 'Ronny Emmerich', 'quidem-placeat-cum-et-ducimus-culpa', '/tmp/30d7c88ce5ec62b924e5baed6056ff73.jpg', 1, NULL, NULL, '2021-01-06 07:39:51', '2018-08-06 08:29:40', '2021-01-06 07:39:51'),
(13, 'Maximus Cole', 'et-eum-eum-cupiditate', '/tmp/01c1d77b125096c1231390022fe64f42.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2021-01-06 07:37:35'),
(14, 'Rosella Mayert', 'omnis-quis-ut-esse-sapiente-ea', '/tmp/7115ee98fbad181ee81a02e7b5273fa1.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2018-08-06 08:29:40'),
(15, 'Trinity Sawayn', 'dignissimos-facilis-quam-non-fugiat-voluptatibus-inventore-reiciendis', '/tmp/d2d88e81c0661535fd3727813e348507.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2018-08-06 08:29:40'),
(16, 'Delpha Cruickshank', 'soluta-aperiam-sint-vel-voluptatem-hic-ut', '/tmp/9e46dad5b71f00b2013ea311d77ba0a4.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:29:40', '2018-08-06 08:29:40'),
(17, 'Dr. Harvey Walsh Sr.', 'qui-dolor-fuga-tenetur', '/tmp/ede39441f7366073b79cf11aab7f5df0.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(18, 'Andres Douglas Sr.', 'nobis-repellat-vel-voluptate-impedit', '/tmp/0367a691a496b71e08889e98b60b41d6.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(19, 'Dallin Daugherty', 'pariatur-qui-dolorem-corporis-autem', '/tmp/16cc9d8af2d9ca2bddb5fa6fee6a954b.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(20, 'Gerald Bosco', 'tenetur-amet-ducimus-sunt-reiciendis-soluta-eaque-quia-voluptatem', '/tmp/9b05f35d08513a902d34a30187b0aad3.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(21, 'Tiffany Lebsack', 'nesciunt-dignissimos-quam-voluptatem-quaerat-rerum', '/tmp/6b4353696d6a2d3ba7e9342ee4c50c9f.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(22, 'Myra Durgan', 'voluptas-labore-perspiciatis-facilis-tenetur-laudantium-perferendis', '/tmp/1549161129e9392219930177817cfc0e.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(23, 'Laila Brekke', 'possimus-sunt-consequuntur-recusandae-similique-nam', '/tmp/332b4ab741b09504c4d19058ec65aef3.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(24, 'Landen Olson', 'commodi-aut-et-ut-blanditiis', '/tmp/c01fad5a4e7e1281b9d49810692a3a0b.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(25, 'Prof. Coby Lehner Jr.', 'totam-inventore-placeat-accusamus-adipisci-sunt-minima-sed', '/tmp/f01c4d9b11d50a21adf0a6326b8454cd.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(26, 'Guillermo Cummerata', 'doloribus-et-reprehenderit-dignissimos-praesentium-nesciunt-iste-repudiandae', '/tmp/70e45be7923b272e15f4caf767a089ac.jpg', 1, NULL, NULL, NULL, '2018-08-06 08:30:12', '2018-08-06 08:30:12'),
(27, 'Gay Wilkinson', 'repudiandae-maiores-consequatur-consequatur-repudiandae-dolor-facere', 'storage/app/public/category_images/9b69be059332ecdfb0a7f9563c6bb44d.jpg', 1, NULL, NULL, NULL, '2018-08-06 09:14:41', '2018-08-06 09:14:41'),
(28, 'Miss Carmella Bergstrom Jr.', 'autem-laboriosam-et-adipisci-ducimus-rerum-impedit-et-nisi', 'storage/app/public/category_images/018b48cf42f4763f3c1032619b03056e.jpg', 1, NULL, NULL, NULL, '2018-08-06 09:16:05', '2018-08-06 09:16:05');

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
(6, '2018_07_10_115805_penyesuaian_table_users', 2),
(10, '2018_07_16_020754_create_table_categories', 3),
(25, '2018_07_21_203443_create_books_table', 4),
(26, '2018_07_21_204915_create_book_category_table', 5),
(28, '2018_07_25_075101_create_orders_table', 6),
(29, '2018_07_25_082000_create_book_order_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total_price` double(8,2) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUBMIT','PROCESS','FINISH','CANCEL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `invoice_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 390000.00, '201807060001', 'CANCEL', '2018-07-06 00:00:00', '2021-01-04 18:52:36'),
(2, 14, 780000.00, '201807250002', 'PROCESS', '2018-07-26 00:00:00', '2018-10-02 08:50:04');

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
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `roles`, `address`, `phone`, `avatar`, `status`) VALUES
(1, 'Muhammad Azamuddin', 'administrator@larashop.test', '$2y$10$CaHcu3RjHs2Yr1c.hgFOVeM77aJ2soN7JUBLyLyL1NZGMY2UqY3Vq', 'JVPtH8RguhTsoHhlnTi9Iv4sHuQL3vV3pWcz0sOSUqc9DAyXlstgmYaG1NPV', '2018-07-11 02:44:43', '2021-01-06 06:34:10', 'administrator', '[\"ADMIN\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/ISzYK4DDkrU78vhi1PWBMoKHXheCF2dIipNWXbM7.png', 'ACTIVE'),
(7, 'Nadia Nurul Mila', 'nadia@gmail.com', 'bismillah', NULL, '2018-07-13 07:59:30', '2021-01-06 06:36:03', 'nadia', '[\"STAFF\",\"CUSTOMER\"]', 'Jalan Alamat ini jika alamat ini kosong', '083948324323', NULL, 'INACTIVE'),
(11, 'User Enam', 'user6@gmail.com', 'bismillah', NULL, '2018-07-14 02:55:38', '2021-01-06 07:36:08', 'user6', '[\"CUSTOMER\"]', 'asasasasssssssssssaasdasdddddddd', '111111111111', NULL, 'ACTIVE'),
(12, 'Ridwan Mutaffaq', 'ridwan@gmail.com', 'bismillah', NULL, '2018-07-14 05:38:30', '2018-07-14 05:38:30', 'ridwan', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', NULL, 'ACTIVE'),
(14, 'Habib Asagaf', 'habib@gmail.com', 'bismillah', NULL, '2018-07-15 04:09:37', '2021-01-06 06:34:30', 'habib', '[\"ADMIN\",\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', 'avatars/2aVe8GlnhQXoZA6iFYmS4RIOgjbGoz6TbdRO4FQL.png', 'ACTIVE'),
(15, 'Iqbal Kholis', 'iqbal@gmail.com', 'bismillah', NULL, '2018-07-15 04:10:15', '2018-07-15 04:10:15', 'iqbal', '[\"ADMIN\"]', 'Jl Dr Wahidin No 1. Kompleks Kementerian Keuangan. Gedung Djuand\r\nKel Harapan Mulya, Kec Kemayoran', '85781150352', NULL, 'ACTIVE'),
(17, 'User ABC', 'userabc@gmail.com', 'bismillah', NULL, '2018-07-15 10:03:19', '2021-01-05 20:23:38', 'userabc', '[\"STAFF\"]', 'Jalan Harapan Mulya III no 7\r\nKel Harapan Mulya, Kec Kemayoran', '85781107766', NULL, 'INACTIVE'),
(24, 'Fathul Miun', 'fmuiin14@gmail.com', '$2y$10$F.HweXxRA/wva/EBmwR75eLFOg9.iyDUqvBIxPmPodyvmYbw.msk6', NULL, '2020-11-15 01:10:11', '2020-11-18 07:11:25', 'fmuiin14', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Depok, Jawa Barat, Indonesia', '089679590971', 'avatars/O8CxkfGykWh9BGjpHFch5JpGo8Olt9wH1eOyPsIh.jpeg', 'ACTIVE'),
(25, 'costumer', 'costumer@gmail.com', '$2y$10$WDX0rbQ8dMkSse8daXt38O3yHQ4oToWCo6icjyz/QjSSapUOvj3DK', NULL, '2021-01-05 07:43:28', '2021-01-05 07:43:28', 'costumer', '[\"CUSTOMER\"]', 'Ini nama alamat jalan', '08977788712', 'avatars/UYs1dJiYfae98CJwvJ7krsMUz5pQ8ZmAJeuwa53c.jpeg', 'ACTIVE'),
(26, 'Testing Paling baru', 'testingaru@gmail.com', '$2y$10$zkAz.bdrxUuLD5WCVG/fquCXJW//lHlzF/P.6OZYkRzzI0fP5giSu', NULL, '2021-01-05 20:14:21', '2021-01-05 20:14:21', 'fmuiin14@gmail.com', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'Testiung Alamat baru', '08977766713', 'avatars/yMF8WYMkz7xX4EuBskRm8tp2PSrnQN8QRvvQM1e9.png', 'ACTIVE'),
(28, 'Administrator', 'admin@gmail.com', '$2y$10$fLY8qGhPGTftKweywiADfeuX6Ew7NYHHHHlpMnWKnFJAR0qAfkFMG', 'g2snRyFSZeIjWX43YTifux0YhUxxMI0smQ7kEAZbZjnZwVnqn6cmPAGrX8Bn', '2021-01-06 08:32:35', '2021-01-06 08:32:35', 'admin', '[\"ADMIN\",\"STAFF\",\"CUSTOMER\"]', 'admin untuk mengatur segala hal bisa pokoknya kalau admin mah', '081111111111', 'avatars/nX6GDvopSJLNHEZame0a714Lv870KjLJjO9PLWyn.png', 'ACTIVE');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_order`
--
ALTER TABLE `book_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
