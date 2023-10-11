-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2023 at 03:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniworld`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders_table`
--

CREATE TABLE `orders_table` (
  `sno` int(20) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_table`
--

INSERT INTO `orders_table` (`sno`, `order_id`, `user_id`, `order_date`) VALUES
(1, 'bb1a4be8-dcca-490f-b03a-92ed680ce709', 310893, '2023-10-10 13:44:10'),
(2, 'fe889375-ed3d-48b3-b2cf-cce096bcf109', 310894, '2023-10-10 13:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `order_items_table`
--

CREATE TABLE `order_items_table` (
  `sno` int(11) NOT NULL,
  `order_item_id` int(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `quantity` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items_table`
--

INSERT INTO `order_items_table` (`sno`, `order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 2564, 'bb1a4be8-dcca-490f-b03a-92ed680ce709', '112233403384', 2),
(2, 2565, 'fe889375-ed3d-48b3-b2cf-cce096bcf109', '112233403382', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_table`
--

CREATE TABLE `products_table` (
  `sno` int(10) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `stock_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_table`
--

INSERT INTO `products_table` (`sno`, `product_id`, `product_name`, `price`, `stock_quantity`) VALUES
(1, '112233403384', '44 mm Easy Pulling Lid with Wad', 250, 5),
(2, '112233403382', '24mm Scew Top White Lotion Pump', 450, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users_table`
--

CREATE TABLE `users_table` (
  `sno` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `registration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_table`
--

INSERT INTO `users_table` (`sno`, `user_id`, `username`, `email`, `registration_date`) VALUES
(1, 310893, 'Praveen@123', 'raveenkumar7272@gmail.com', '2023-10-10 13:30:34'),
(2, 310894, 'anandmishra', 'anandkrmishra@gmail.com', '2023-10-09 13:30:34'),
(3, 310895, 'test1', 'test@gmail.com', '2023-10-09 14:09:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders_table`
--
ALTER TABLE `orders_table`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `order_items_table`
--
ALTER TABLE `order_items_table`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `products_table`
--
ALTER TABLE `products_table`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders_table`
--
ALTER TABLE `orders_table`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items_table`
--
ALTER TABLE `order_items_table`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products_table`
--
ALTER TABLE `products_table`
  MODIFY `sno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_table`
--
ALTER TABLE `users_table`
  MODIFY `sno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
