-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2022 at 04:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chaldal`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `u_id` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `quantity`, `u_id`, `created_at`) VALUES
(15, 50, 2, 'chaldal623620cbb449d_2022_03_19_07_03_27_pm', '2022-03-19 18:28:31'),
(18, 50, 2, 'chaldal6236210ad6744_2022_03_19_07_03_30_pm', '2022-03-19 18:37:26'),
(29, 50, 2, 'chaldal62369f1014f1c_2022_03_20_04_03_12_am', '2022-03-20 17:20:31'),
(40, 115, 1, 'chaldal6239746bef17f_2022_03_22_08_03_03_am', '2022-03-22 07:02:08'),
(41, 128, 1, 'chaldal6239746bef17f_2022_03_22_08_03_03_am', '2022-03-22 07:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `division` varchar(30) NOT NULL,
  `city` varchar(11) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `terms` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `delever_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `first_name`, `last_name`, `email`, `division`, `city`, `zip`, `address`, `terms`, `total`, `discount`, `order_status`, `delever_at`, `created_at`) VALUES
(1, '41234234', 'rqerqwerw', 'qwerqwerqwer', 'Dhaka', 'rqwerqwer', 'werqwer', 'rqwerewq', 1, 156600, 0, 0, NULL, '2022-03-19 20:15:09'),
(2, 'yqrtertqtqertqwert', 'tqetrqert', 'qtqertqe', 'Dhaka', 'tqrterqtq', 'tqwetqertqe', 'tqwetrqtqertqer', 1, 156600, 0, 0, NULL, '2022-03-19 20:17:53'),
(3, 'yqrtertqtqertqwert', 'tqetrqert', 'qtqertqe', 'Dhaka', 'tqrterqtq', 'tqwetqertqe', 'tqwetrqtqertqer', 1, 156600, 0, 0, NULL, '2022-03-19 20:18:40'),
(4, 'Mamun Ar', 'Rashid', 'mamunarrashid.cse@gmail,com', 'Rajshahi', 'Naogaon', '6065', 'Sapahar ,Naogaon,Bangladesh', 1, 56280, 0, 0, NULL, '2022-03-20 01:56:02'),
(5, 'fsdfaf', 'sfasfasd', 'asdfasdfas@gmail.com', 'Rajshahi', 'rqwrqwer', 'rqwerqwer', 'werqrqwer', 1, 99, 0, 0, NULL, '2022-03-22 03:11:46'),
(6, 'fefwerg', 'fsdfaagv', 'afgadgaf', 'Khulna', 'aefqer', 'efgasg', 'gergergasfs', 1, 345676, 0, 0, NULL, '2022-03-22 03:20:26'),
(7, 'asraful', 'khfg', 'asraful@gmail.com', 'Dhaka', 'panthapoth', 'fghj', 'zsdxfghkjlk', 1, 5000, 0, 0, NULL, '2022-03-22 04:00:30'),
(8, 'faysal', ' kljhkgfd', 'faysal@gmail.com', 'Dhaka', 'dhaka', 'kilugyh', ';lktfrzdfgpigyi', 1, 234, 0, 0, NULL, '2022-03-22 04:08:54'),
(9, 'kawsar', ' hossin', 'kawsar@gmail.com', 'Sylhet', 'kljhg', 'dsd', 'dfghjdtrwew', 1, 500, 0, 0, NULL, '2022-03-22 04:10:08'),
(10, 'Onna', 'Aktar', 'onna@gmail.com', 'Dhaka', 'dhaka', 'ilukythg', 'kljhdfgxcgjk', 1, 500, 0, 0, NULL, '2022-03-22 04:20:15'),
(11, 'Tanzila', 'Aktar', 'tanzila@gmai.com', 'Khulna', 'khulna', '1205', 'asdfvbgjh,k.l,k', 1, 5000, 0, 0, NULL, '2022-03-22 15:42:24');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `created_at`) VALUES
(1, 5, 115, 1, '2022-03-22 03:11:46'),
(3, 7, 128, 1, '2022-03-22 04:00:30'),
(4, 8, 129, 1, '2022-03-22 04:08:54'),
(5, 9, 127, 1, '2022-03-22 04:10:08'),
(6, 10, 127, 1, '2022-03-22 04:20:15'),
(7, 11, 130, 1, '2022-03-22 15:42:24');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `created_at`) VALUES
(50, 'hand watch', 'nice hand watch', 200, 'http://localhost/mamun/web-project/assets/img/upload/05_07_41_19_03_22_pm6a2ef6f4d459c7cf297e2e91a4033f0c.jpg', '2022-03-19 16:07:41'),
(97, 'Langa', 'kasmari langa', 56000, 'http://localhost/mamun/web-project/assets/img/upload/01_04_23_19_03_22_pm229a2ddaac9a18a905871737225b6e0a.jpg', '2022-03-19 12:04:23'),
(115, 'Wireless Bluetooth ', 'Wireless Bluetooth Earphone Magnetic Sports Headset', 99, 'http://localhost/mamun/web-project/assets/img/upload/02_09_54_20_03_22_am7b3093b421129250734aca6a7851cb60.jpg', '2022-03-20 01:09:54'),
(124, 'Beauty & Wellness', 'nice', 25000, 'http://localhost/mamun/web-project/assets/img/upload/04_44_16_22_03_22_amb489397c2e74abb73ff6037d2d8f157f.jpg', '2022-03-22 03:44:16'),
(125, 'saree', 'Indian saree', 55000, 'http://localhost/mamun/web-project/assets/img/upload/04_49_48_22_03_22_am8b1c264bef469b49f0f0f3b98b05fde4.jpg', '2022-03-22 03:49:48'),
(126, 'Oppo A16e', 'nice', 57000, 'http://localhost/mamun/web-project/assets/img/upload/04_51_55_22_03_22_amOppo-A16e.jpg', '2022-03-22 03:51:55'),
(127, 'Fuchka', 'testy', 500, 'http://localhost/mamun/web-project/assets/img/upload/04_53_42_22_03_22_amfc2d04a26781e098e1fa411ef179c2c5.jpg', '2022-03-22 03:53:42'),
(128, 'nut', 'Mixed Dry Fruits 15 Items মিক্সড ড্রাই ফ্রুটস ২৫০ গ্রাম', 5000, 'http://localhost/mamun/web-project/assets/img/upload/04_56_00_22_03_22_am46e9bd8ced7aa4e5f0ec646c1ebf9a60.jpg', '2022-03-22 03:56:00'),
(129, 'Roasted Cashew Nuts ', 'Roasted Cashew Nuts Big Size - 500 gm', 234, 'http://localhost/mamun/web-project/assets/img/upload/05_07_29_22_03_22_am49863bfa8a971aa554b02e960bb3097b.png', '2022-03-22 04:07:29'),
(130, 'niqab', 'muslim niqab', 5000, 'http://localhost/mamun/web-project/assets/img/upload/04_37_50_22_03_22_pm5ba8a9d588f7bfab7eafe300406b7c30.jpg', '2022-03-22 15:37:50'),
(132, 'saree', 'sdfvbg', 2345, 'http://localhost/mamun/web-project/assets/img/upload/04_44_50_22_03_22_pmSaree-13.jpg', '2022-03-22 15:44:50'),
(133, 'panjabi', 'sdfvbgb', 5432, 'http://localhost/mamun/web-project/assets/img/upload/04_45_16_22_03_22_pmdownload (2).jpg', '2022-03-22 15:45:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `products_list` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_list` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
