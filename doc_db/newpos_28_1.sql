-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2018 at 03:25 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`) VALUES
(1, 'B+PLUS', 'B PLUS', '8e966b1427b29d7b6352af7b69b1d5a2.png');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`) VALUES
(4, 'B.P', 'B.P', '72a2b790421e016c949882f204335c69.png', 0),
(5, '3PCS', '3PCS', '5b6acfabd438f17463c384ca9931f665.png', 0),
(6, 'TAT', 'TAT', 'fc5ca437f1fc17c8b5c59a8f44508e17.jpg', 0),
(7, 'LUNGI', 'LUNGI', 'c07235e80f36aeee75b1e791dba37dc9.png', 0),
(8, 'S.P', 'S.P', '605cc7f935b648a48b9467044211b2d4.png', 0),
(9, 'V.I.P', 'V.I.P', '4e8ec7cde81952fe7581738a4668b887.png', 0),
(10, 'T.Z', 'T.Z', '2428aa1b4ed82ce4ee45f7d97bfc2f97.png', 0),
(11, 'T.X', 'T.X', '9828898777a72795b0a8b0268b33f130.png', 0),
(12, 'A.M', 'A.M', 'e3272b6759f16af7a45783505487715c.png', 0),
(13, '3EX', '3EX', '0073aa2d233e4ef75573aa86d80fac28.png', 0),
(14, '3EXA', '3EXA', '68933dc5e417cbe5a4fe488361e7b6e7.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'Take Away', 'Take Away', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(4, 4, 'supplier', NULL, NULL, 'Sumon', 'AGRI KITCHEN', '', 'Mirpur Dhaka', 'dh', '', '', '', '01234567890', 'info@codeplan.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(6, 3, 'customer', 4, 'New Customer (+10)', 'In House', 'In House', '', 'Mirpur ', 'Dhaka', 'Mirpur', '1216', 'Bangladesh', '12456789', 'custommer@codeplan.com', '', '', '', '1535239096', '', '', NULL, 0, 'logo.png', 0, NULL, 1, 'Default'),
(7, NULL, 'biller', NULL, NULL, 'Forhad', 'B+PLUS LTD.', '98766535634', 'MASCOT PLAZA', 'DHAKA', 'UTTARA', '', 'Bangladesh', '01853161166', 'forhad@gmail.com', '', '', '', '', '', '', '', 0, 'logo8.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2017-03-25', 1, 1, 1, 1, '0.0000', '300.0000', '300.0000', '450.0000', '450.0000', '23.0000', 1, 0, NULL),
(3, '2017-03-25', 1, 3, 3, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '22.0000', 1, 0, NULL),
(4, '2017-03-25', 1, 4, 4, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '21.0000', 1, 0, NULL),
(5, '2017-03-25', 1, 5, 5, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '20.0000', 1, 0, NULL),
(6, '2017-03-25', 1, 6, 6, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '19.0000', 1, 0, NULL),
(7, '2017-03-25', 1, 7, 7, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '18.0000', 1, 0, NULL),
(8, '2017-03-25', 1, 8, 8, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '17.0000', 1, 0, NULL),
(9, '2017-03-25', 1, 9, 9, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '16.0000', 1, 0, NULL),
(10, '2017-03-25', 1, 10, 10, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '15.0000', 1, 0, NULL),
(11, '2017-03-25', 1, 11, 11, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '14.0000', 1, 0, NULL),
(12, '2017-03-25', 1, 12, 12, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '13.0000', 1, 0, NULL),
(13, '2017-03-25', 1, 13, 13, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '12.0000', 1, 0, NULL),
(14, '2017-03-25', 1, 14, 14, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '11.0000', 1, 0, NULL),
(15, '2017-03-25', 1, 15, 15, 1, '1.0000', '300.0000', '300.0000', '450.0000', '450.0000', '10.0000', 1, 0, NULL),
(16, '2017-03-25', 1, 16, 16, 1, '1.0000', '300.0000', '300.0000', '495.0000', '544.5000', '9.0000', 1, 0, NULL),
(17, '2017-03-25', 1, 17, 17, 1, '1.0000', '300.0000', '300.0000', '495.0000', '544.5000', '8.0000', 1, 0, NULL),
(18, '2017-03-25', 1, 18, 18, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '7.0000', 1, 0, NULL),
(19, '2017-03-25', 1, 19, 19, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '6.0000', 1, 0, NULL),
(20, '2017-04-03', 1, 20, 20, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '5.0000', 1, 0, NULL),
(21, '2017-04-08', 1, 21, 21, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '4.0000', 1, 0, NULL),
(22, '2017-04-08', 1, 22, 22, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '3.0000', 1, 0, NULL),
(23, '2017-04-08', 1, 23, 23, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '2.0000', 1, 0, NULL),
(24, '2017-04-08', 1, 24, 24, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '1.0000', 1, 0, NULL),
(25, '2017-04-08', 1, 25, 25, 1, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '0.0000', 1, 0, NULL),
(26, '2017-04-08', 1, 26, 26, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '499.0000', 1, 0, NULL),
(27, '2017-04-08', 1, 27, 27, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '498.0000', 1, 0, NULL),
(28, '2017-04-08', 1, 28, 28, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '497.0000', 1, 0, NULL),
(29, '2017-04-08', 1, 29, 29, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '496.0000', 1, 0, NULL),
(30, '2017-04-08', 1, 30, 30, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '495.0000', 1, 0, NULL),
(31, '2017-04-08', 1, 31, 31, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '494.0000', 1, 0, NULL),
(32, '2017-04-08', 1, 32, 32, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '493.0000', 1, 0, NULL),
(33, '2017-04-08', 1, 33, 33, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '492.0000', 1, 0, NULL),
(34, '2017-04-08', 1, 34, 34, 2, '2.0000', '300.0000', '300.0000', '495.0000', '495.0000', '490.0000', 1, 0, NULL),
(35, '2017-04-08', 1, 35, 35, 2, '3.0000', '300.0000', '300.0000', '495.0000', '495.0000', '487.0000', 1, 0, NULL),
(36, '2017-04-08', 1, 36, 36, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '486.0000', 1, 0, NULL),
(37, '2017-04-08', 1, 37, 37, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '485.0000', 1, 0, NULL),
(38, '2017-04-08', 1, 38, 37, 2, '2.0000', '300.0000', '300.0000', '495.0000', '495.0000', '484.0000', 1, 0, NULL),
(39, '2017-04-08', 1, 39, 38, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '482.0000', 1, 0, NULL),
(40, '2017-04-08', 1, 40, 39, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '481.0000', 1, 0, NULL),
(41, '2017-04-09', 1, 41, 40, 2, '6.0000', '300.0000', '300.0000', '495.0000', '495.0000', '475.0000', 1, 0, NULL),
(42, '2017-04-09', 1, 42, 41, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '474.0000', 1, 0, NULL),
(43, '2017-04-09', 1, 43, 42, 2, '2.0000', '300.0000', '300.0000', '495.0000', '495.0000', '472.0000', 1, 0, NULL),
(44, '2017-04-09', 1, 44, 43, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '471.0000', 1, 0, NULL),
(45, '2017-04-13', 1, 45, 44, 2, '1.0000', '300.0000', '300.0000', '495.0000', '495.0000', '470.0000', 1, 0, NULL),
(46, '2017-04-17', 1, 46, 45, 2, '2.0000', '300.0000', '300.0000', '495.0000', '495.0000', '468.0000', 1, 0, NULL),
(47, '2018-01-28', 1, 47, 1, 4, '0.0000', '721.1538', '750.0000', '800.0000', '800.0000', '498.0000', 1, 0, NULL),
(48, '2018-01-28', 1, 48, 1, 4, '0.0000', '721.1538', '750.0000', '800.0000', '800.0000', '498.0000', 1, 0, NULL),
(49, '2018-01-28', 1, 49, 1, 4, '0.0000', '721.1538', '750.0000', '800.0000', '800.0000', '498.0000', 1, 0, NULL),
(50, '2018-01-28', 1, 50, 1, 4, '0.0000', '721.1538', '750.0000', '800.0000', '800.0000', '498.0000', 1, 0, NULL),
(51, '2018-01-28', 1, 51, 1, 4, '0.0000', '721.1538', '750.0000', '800.0000', '800.0000', '498.0000', 1, 0, NULL),
(52, '2018-01-28', 8, 58, 1, 10, '11.0000', '450.0000', '450.0000', '450.0000', '450.0000', '989.0000', 1, 0, NULL),
(53, '2018-01-28', 7, 59, 1, 9, '9.0000', '350.0000', '350.0000', '350.0000', '350.0000', '991.0000', 1, 0, NULL),
(54, '2018-01-28', 2, 60, 1, 5, '10.0000', '850.0000', '850.0000', '900.0000', '900.0000', '990.0000', 1, 0, NULL),
(55, '2018-01-28', 1, 61, 1, 4, '10.0000', '721.1538', '750.0000', '800.0000', '800.0000', '991.0000', 1, 0, NULL),
(56, '2018-01-28', 1, 62, 2, 4, '9.0000', '721.1538', '750.0000', '800.0000', '800.0000', '982.0000', 1, 0, NULL),
(57, '2018-01-28', 8, 63, 3, 10, '2.0000', '450.0000', '450.0000', '450.0000', '450.0000', '987.0000', 1, 0, NULL),
(58, '2018-01-28', 6, 64, 3, 11, '3.0000', '0.0000', '0.0000', '1600.0000', '1600.0000', '497.0000', 1, 0, NULL),
(59, '2018-01-28', 1, 65, 3, 4, '2.0000', '721.1538', '750.0000', '800.0000', '800.0000', '980.0000', 1, 0, NULL),
(60, '2018-01-28', 5, 66, 4, 8, '2.0000', '1200.0000', '1200.0000', '1200.0000', '1200.0000', '998.0000', 1, 0, NULL),
(61, '2018-01-28', 6, 67, 4, 11, '2.0000', '0.0000', '0.0000', '1600.0000', '1600.0000', '495.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0),
(2, 'ERU', 'EURO', '0.7340', 0),
(3, 'BDT', 'TAKA', '1.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expense_categories`
--

INSERT INTO `sma_expense_categories` (`id`, `code`, `name`) VALUES
(1, 'DAILY', 'DAILY COST'),
(2, 'CONVINCE', 'CONVINCE'),
(3, 'BILASI TEX', 'BILASI TEX');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don''t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 00:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 1, 1, 2, 1, 51, 1, 48, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(2, '2017-03-25 07:49:19', 1, NULL, NULL, 'IPAY/2017/03/0001', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '1000.0000', '550.0000', NULL),
(4, '2017-03-25 09:24:52', 3, NULL, NULL, 'IPAY/2017/03/0003', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 2, NULL, 'received', '', '500.0000', '50.0000', NULL),
(5, '2017-03-25 09:32:51', 4, NULL, NULL, 'IPAY/663685474386', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(6, '2017-03-25 09:33:39', 5, NULL, NULL, 'IPAY/045228579377', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(7, '2017-03-25 10:00:56', 6, NULL, NULL, 'IPAY/856886547966', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(8, '2017-03-25 10:01:10', 7, NULL, NULL, 'IPAY/500923176509', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(9, '2017-03-25 10:01:56', 8, NULL, NULL, 'IPAY/365958503067', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '1000.0000', '550.0000', NULL),
(10, '2017-03-25 10:03:27', 9, NULL, NULL, 'IPAY/187371357332', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '1000.0000', '550.0000', NULL),
(11, '2017-03-25 10:03:48', 10, NULL, NULL, 'IPAY/005039226028', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '1000.0000', '550.0000', NULL),
(12, '2017-03-25 10:04:12', 11, NULL, NULL, 'IPAY/609685273393', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '1000.0000', '550.0000', NULL),
(13, '2017-03-25 10:05:30', 12, NULL, NULL, 'IPAY/556441327716', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(14, '2017-03-25 10:07:35', 13, NULL, NULL, 'IPAY/594744569961', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(15, '2017-03-25 10:10:33', 14, NULL, NULL, 'IPAY/546948815256', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '500.0000', '50.0000', NULL),
(16, '2017-03-25 11:21:45', 15, NULL, NULL, 'IPAY/918996933961', NULL, 'cash', '', '', '', '', '', '', '450.0000', NULL, 1, NULL, 'received', '', '1000.0000', '550.0000', NULL),
(17, '2017-03-25 11:24:30', 16, NULL, NULL, 'IPAY/825919226000', NULL, 'cash', '', '', '', '', '', '', '544.5000', NULL, 1, NULL, 'received', '', '1000.0000', '455.5000', NULL),
(18, '2017-03-25 11:28:04', 17, NULL, NULL, 'IPAY/543579085970', NULL, 'cash', '', '', '', '', '', '', '626.1700', NULL, 1, NULL, 'received', '', '1000.0000', '373.8300', NULL),
(19, '2017-03-25 11:35:16', 18, NULL, NULL, 'IPAY/478707350070', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1500.0000', '930.7500', NULL),
(20, '2017-03-25 11:36:45', 19, NULL, NULL, 'IPAY/694950283366', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(21, '2017-04-03 10:51:45', 20, NULL, NULL, 'IPAY/711238977750', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(22, '2017-04-08 08:15:56', 21, NULL, NULL, 'IPAY/183091367407', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1500.0000', '930.7500', NULL),
(23, '2017-04-08 08:19:03', 22, NULL, NULL, 'IPAY/665108089387', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '6500.0000', '5930.7500', NULL),
(24, '2017-04-08 08:37:05', 23, NULL, NULL, 'IPAY/518747100681', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(25, '2017-04-08 08:42:12', 24, NULL, NULL, 'IPAY/490041185509', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(26, '2017-04-08 09:18:35', 25, NULL, NULL, 'IPAY/776381595822', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(28, '2017-04-08 09:21:51', 26, NULL, NULL, 'IPAY/984461698230', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(29, '2017-04-08 09:22:26', 27, NULL, NULL, 'IPAY/982418420067', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '2000.0000', '1430.7500', NULL),
(30, '2017-04-08 09:24:24', 28, NULL, NULL, 'IPAY/337971632093', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(31, '2017-04-08 09:31:26', 29, NULL, NULL, 'IPAY/238353484852', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '2000.0000', '1430.7500', NULL),
(32, '2017-04-08 09:33:49', 30, NULL, NULL, 'IPAY/569744481005', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '3000.0000', '2430.7500', NULL),
(33, '2017-04-08 10:37:28', 31, NULL, NULL, 'IPAY/550796529044', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1500.0000', '930.7500', NULL),
(34, '2017-04-08 11:46:16', 32, NULL, NULL, 'IPAY/939551688836', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(35, '2017-04-08 12:00:49', 33, NULL, NULL, 'IPAY/141779664412', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(36, '2017-04-08 13:47:45', 34, NULL, NULL, 'IPAY/960872821892', NULL, 'cash', '', '', '', '', '', '', '680.0000', NULL, 1, NULL, 'received', '', '680.0000', '-458.5000', NULL),
(37, '2017-04-08 14:05:41', 35, NULL, NULL, 'IPAY/617594522520', NULL, 'cash', '', '', '', '', '', '', '1707.7500', NULL, 1, NULL, 'received', '', '2000.0000', '292.2500', NULL),
(38, '2017-04-08 14:22:36', 36, NULL, NULL, 'IPAY/696277759436', NULL, 'cash', '', '', '', '', '', '', '50.0000', NULL, 1, NULL, 'received', '', '50.0000', '-519.2500', NULL),
(39, '2017-04-08 15:33:07', 38, NULL, NULL, 'IPAY/895999102366', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(40, '2017-04-08 15:34:53', 39, NULL, NULL, 'IPAY/269166204178', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(41, '2017-04-08 23:16:35', 40, NULL, NULL, 'IPAY/912474904527', NULL, 'cash', '', '', '', '', '', '', '1000.0000', NULL, 1, NULL, 'received', '', '1000.0000', '-2415.5000', NULL),
(42, '2017-04-08 23:18:40', 41, NULL, NULL, 'IPAY/633274711923', NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 1, NULL, 'received', '', '100.0000', '-469.2500', NULL),
(43, '2017-04-08 23:54:41', 42, NULL, NULL, 'IPAY/330423412434', NULL, 'cash', '', '', '', '', '', '', '1000.0000', NULL, 1, NULL, 'received', '', '1000.0000', '-138.5000', NULL),
(44, '2017-04-09 05:37:41', 43, NULL, NULL, 'IPAY/992176235504', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '5000.0000', '4430.7500', NULL),
(45, '2017-04-12 18:09:19', 44, NULL, NULL, 'IPAY/882546490384', NULL, 'cash', '', '', '', '', '', '', '569.2500', NULL, 1, NULL, 'received', '', '1000.0000', '430.7500', NULL),
(46, '2017-04-17 05:11:15', 45, NULL, NULL, 'IPAY/408607188804', NULL, 'cash', '', '', '', '', '', '', '1000.0000', NULL, 1, NULL, 'received', 'sdfvdsgf', '1000.0000', '-138.5000', NULL),
(47, '2018-01-28 06:59:09', 1, NULL, NULL, 'IPAY/604597171601', NULL, 'cash', '', '', '', '', '', '', '4160.0000', NULL, 1, NULL, 'received', '', '4160.0000', '0.0000', NULL),
(49, '2018-01-28 11:54:38', 2, NULL, NULL, 'IPAY/597968413437', NULL, 'cash', '', '', '', '', '', '', '7488.0000', NULL, 1, NULL, 'received', '', '7488.0000', '0.0000', NULL),
(50, '2018-01-28 12:10:07', 4, NULL, NULL, 'IPAY/691117937197', NULL, 'cash', '', '', '', '', '', '', '5824.0000', NULL, 1, NULL, 'received', '', '5824.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2017-03-25 07:45:38', 1, '1000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2017-03-25 09:24:34', 2, '1000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.0.2.22',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`) VALUES
(1, 22, 20, 6, 6, 7, '1', 'Musak', 'VAT Reg', '11', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 1, 42, NULL, 'purchase_code', 'envato_username', '3.0.2.22', 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`) VALUES
(10, '1', 'B.P', 1, '800.0000', '800.0000', '10.0000', '5ff17b67482fc5d1b8f4987e91b22e3f.png', 4, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(11, '2', 'S.P', 1, '900.0000', '900.0000', '10.0000', 'bfc6a776d51a3accc12ee324d46b3289.png', 8, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(12, '3', 'V.I.P', 1, '1000.0000', '1000.0000', '10.0000', '781afa14032f158c7daad761200f6236.png', 9, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(13, '4', 'T.Z', 1, '1100.0000', '1100.0000', '10.0000', 'e1fefac09d0e2f4c2118c3ab2e17a04a.PNG', 10, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(14, '5', 'T.X', 1, '1200.0000', '1200.0000', '10.0000', 'f29b92d66f792015c834c0b38e27bfe8.PNG', 11, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(15, '6', 'A.M', 1, '1600.0000', '1600.0000', '10.0000', '69da238639db87548eba8e7e42f6d38a.png', 12, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(16, '7', '3PCS', 1, '1000.0000', '1000.0000', '10.0000', '9aa0dc623ee887d9802a98b4c1ad4759.png', 5, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(17, '8', '3EX1', 1, '1300.0000', '1300.0000', '10.0000', '2a0f01d195eeda2523cb8b3ae6e4fc58.png', 13, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(18, '9', '3EX2', 1, '1400.0000', '1400.0000', '10.0000', '9dd810a940f8164f40d0c3860afd113c.png', 13, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(19, '10', '3EX3', 1, '1500.0000', '1500.0000', '10.0000', 'a0efbe6b654f0146a9f0fa12ae30844c.png', 13, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(20, '11', '3EX4', 1, '1600.0000', '1600.0000', '10.0000', 'c6348b7b7e92d6d1d6000fcc9661d5f2.png', 13, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(21, '12', '3EXA.1', 1, '2500.0000', '2500.0000', '10.0000', '15ab835bdffa11bb7a94440524fb1d7a.png', 14, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(22, '13', '3EXA.2', 1, '2750.0000', '2750.0000', '10.0000', 'eec59dc239cf646cbc2a4fcdc7a4876b.png', 14, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(23, '14', 'TAT1', 1, '350.0000', '350.0000', '10.0000', '8e0a9a0a5cc4679cc5b74ca35bd747a2.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(24, '15', 'TAT2', 1, '450.0000', '450.0000', '10.0000', '022103546271a57f73b877035e7688a8.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(25, '16', 'TAT3', 1, '550.0000', '550.0000', '10.0000', '27b7b9995fd987e445cde2d1c48b1a42.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(10, 10, '0ad119998908c1426ec5cb8195eb54ca.png'),
(11, 11, '06be2df6418c3336d189c0b5ef993342.png'),
(12, 12, '9e196bf64f79e985a49c7e8d523470be.png'),
(13, 13, 'a62c78f098321eb46f5430b694426d1a.PNG'),
(14, 14, 'fedb244e8a979e1213598cf8851b9efc.PNG'),
(15, 15, '7cd0cc2b59701ca4ce896b8e6850ae24.png'),
(16, 16, '9310f8d7fe4d952ea06e1bba3c8f0bde.png'),
(17, 17, '57398629ffbf1ea92c762dca94e4ef14.png'),
(18, 18, 'd68f195cc3baebe09485d54ecd9a5895.png'),
(19, 19, '5ff3da9c8b1bec6b2962a0050a3cd43e.png'),
(20, 20, '8898371deabc5b7afa5c7012ea8660f5.png'),
(21, 21, '34c46e036eb4b97268f92341f415696a.png'),
(22, 22, 'd43210a33d412c9d46903431142d4e9c.png'),
(23, 23, 'cb09e91df7e30ba1956121dd86ec8c35.png'),
(24, 24, 'cae844e75775836c03aa14996cb4ad9e.png'),
(25, 25, '987a5134add09cdd1c30870d55b1db16.png');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, NULL, NULL, 10, '1', 'B.P', NULL, '800.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '400000.0000', '500.0000', '2018-01-28', 'received', '800.0000', '800.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(2, NULL, NULL, 11, '2', 'S.P', NULL, '900.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '450000.0000', '500.0000', '2018-01-28', 'received', '900.0000', '900.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(3, NULL, NULL, 12, '3', 'V.I.P', NULL, '1000.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '500000.0000', '500.0000', '2018-01-28', 'received', '1000.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(4, NULL, NULL, 13, '4', 'T.Z', NULL, '1100.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '550000.0000', '500.0000', '2018-01-28', 'received', '1100.0000', '1100.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(5, NULL, NULL, 14, '5', 'T.X', NULL, '1200.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '600000.0000', '500.0000', '2018-01-28', 'received', '1200.0000', '1200.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(6, NULL, NULL, 15, '6', 'A.M', NULL, '1600.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '800000.0000', '500.0000', '2018-01-28', 'received', '1600.0000', '1600.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(7, NULL, NULL, 16, '7', '3PCS', NULL, '1000.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '500000.0000', '500.0000', '2018-01-28', 'received', '1000.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(8, NULL, NULL, 17, '8', '3EX1', NULL, '1300.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '650000.0000', '500.0000', '2018-01-28', 'received', '1300.0000', '1300.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(9, NULL, NULL, 18, '9', '3EX2', NULL, '1400.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '700000.0000', '500.0000', '2018-01-28', 'received', '1400.0000', '1400.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(10, NULL, NULL, 19, '10', '3EX3', NULL, '1500.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '750000.0000', '500.0000', '2018-01-28', 'received', '1500.0000', '1500.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(11, NULL, NULL, 20, '11', '3EX4', NULL, '1600.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '800000.0000', '500.0000', '2018-01-28', 'received', '1600.0000', '1600.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(12, NULL, NULL, 21, '12', '3EXA.1', NULL, '2500.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '1250000.0000', '500.0000', '2018-01-28', 'received', '2500.0000', '2500.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(13, NULL, NULL, 22, '13', '3EXA.2', NULL, '2750.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '1375000.0000', '500.0000', '2018-01-28', 'received', '2750.0000', '2750.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(14, NULL, NULL, 23, '14', 'TAT1', NULL, '350.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '175000.0000', '500.0000', '2018-01-28', 'received', '350.0000', '350.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(15, NULL, NULL, 24, '15', 'TAT2', NULL, '450.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '225000.0000', '500.0000', '2018-01-28', 'received', '450.0000', '450.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(16, NULL, NULL, 25, '16', 'TAT3', NULL, '550.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '275000.0000', '500.0000', '2018-01-28', 'received', '550.0000', '550.0000', NULL, NULL, NULL, NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `waiter_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0805008bc83ee0bc0e3d9a3cee55c396c4cc89f0', '::1', 1492028111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032373838393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('0922325a9bef04010d4d772e88729c634298030f', '::1', 1492024608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032343335333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('0a089e8e464c5d0caf1df58b1ac2ec475faaafb6', '::1', 1491665519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636343534383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636353531353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b),
('0a387137599568b21d7b85a64069f911f3afc702', '::1', 1517145391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134343836353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('0e2eb745c642106877094d28f7b85ffe5e4818a8', '::1', 1517087050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038373033363b6964656e746974797c733a363a22666f72686164223b757365726e616d657c733a363a22666f72686164223b656d61696c7c733a31363a22666f7268616440676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303233373932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2235223b77617265686f7573655f69647c733a313a2231223b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2231223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038363733373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031353a32343a3334223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a2247634c3639674d71223b6373726676616c75657c733a32303a2248584f6e6d69444a50455a5359797a72344b5163223b),
('100ba766a6055d39546a86ec2e5805f1466aa019', '::1', 1517141309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134313037333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134303733313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('12ab59915d47557e8c6a44349d3fbe0a3c704edc', '::1', 1491663867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636333831343b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363534393035223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636333836373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('13474690e3a75237c87e1b1bf60411882ec9b150', '::1', 1517144856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134343535383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('14c4cd31ef64053eea7275225af68f8ac89fdf16', '::1', 1491717337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313731373331373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363932323431223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313731363236323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('16d330ffdedac03eba4af315c2a83bd67f01975a', '::1', 1517138538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133383234343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383234343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('177879109afd620ceb63b0b882bae6afbd142bf4', '::1', 1492021431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032313230353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('190c5da65c1f0175724ac9185c04a16f0efe8a26', '::1', 1492022338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032323035313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('1bd15948112e19632740ab354a3753ece2430663', '::1', 1492032893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033323637323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('1bfff53d5731ea731130ff668ed5affbb295db36', '::1', 1517142547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134323339353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134313432333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('1c94666bf8b85efc5ad482aa85601cd70203b135', '::1', 1492026477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032363139353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('2410dd98254374da81f8a2c0336b10307b6a2710', '::1', 1517134665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133343339323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('2b09fe89b9c1ed545c4f334a86d9815139417500', '::1', 1517122717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132323431383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132323731373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('2f6a0fa115d0f88d9fbb50b7d2cbd22101bf4fff', '::1', 1517131550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133313330383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('3078e293588d4fd12b0475fb30811cd4fdf92d3e', '::1', 1491661616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636313436303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636313631363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b72656d6f76655f706f736c737c693a313b),
('3168d8ccd942595f2fb0bc9155b1f21a221bd12b', '::1', 1491718453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313731383435333b),
('316cfe9bf51008865f9d76f9239242a451d7154e', '::1', 1492026860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032363536393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('35babeaa7bf6517a9b31e7d301c957db5c5c1136', '::1', 1517082312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038323136353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038323133313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d637372666b65797c733a383a22335676417471354b223b6373726676616c75657c733a32303a22567758545a6c61376f4539554b476448354f5968223b),
('365158a424f75231af19f9bc9400cf6ca702c4ee', '::1', 1517132501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133323235363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133323333303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('372e0ac71e9ffa99496fa925b408ff43a1ea62db', '::1', 1517085671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038353430393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038343638393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('37c1e1043e96665b3b20bf64247dc8dfb08420de', '::1', 1517148989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134383734373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('389febd6a4e41cbbc0109333964d2703727df131', '::1', 1517086271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038363037363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038363132353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('38b39f306d15d4adadcac57233501604339f5809', '::1', 1517121657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132313635373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132313635373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('3b93de395d68970237a906375db9cfed6868cd66', '::1', 1492035871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033353638383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a33323a22776169746572206e616d652063726561746564207375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('3bfa689331167051ba9400d820e7e5542aadaa9e', '::1', 1491661024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636303831343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636313032343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b),
('3d4eca535a914c1b5ca510f7ba14d3600119c50f', '::1', 1491658669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313635383631313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313635383434303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b),
('3f45fe32c5393d3cbadbbec90c536f7495b8ea1f', '::1', 1517080792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038303637363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932343035383234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('41a640797d980be0cafeb7fb68e1edeced3021f1', '::1', 1517123463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132333230393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('42e2b9b18eb3392b42979e995499bac846c8baaa', '::1', 1517135374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133353337343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('42e3767684e1aa90e79a87793278b3f2b4ff47f1', '::1', 1491658441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313635383139363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313635383434303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22726a4e62457a385556774f684371367859653133223b),
('449500d46646ba1096334573bc701db13c789396', '::1', 1517129239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132383939363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('4517edf86b8fa5fe010f5cafb36c9da73be9a1b6', '::1', 1491662062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636313930393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636323036323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b),
('47c1ca6562e493e3dd86ae1c28c545cb7f514954', '::1', 1517082723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038323638393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038323133313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('4af0e8bb0f91d36d2735c80a86460c28403d4eda', '::1', 1492061317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323036313033353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303332363231223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4dc747072be0830ffc94ee55fde33ec3a65cf68b', '::1', 1492033357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033333039333b7265717565737465645f706167657c733a353a2273616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303230353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('4f1e39ec41c56b0cdb6a7a33bddb9b2ee87af5ca', '::1', 1492026181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032353839313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('525edd0940d7caf7dabd37c77498e43c07dd9dfb', '::1', 1517135781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133353736383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('55c50b318433f4cadeaf020d13216ba82bfe65a5', '::1', 1517085140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038343935303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038343638393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('5d762dc1548b39848d52e34486de501da342f43b', '::1', 1492020890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032303835373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('5eb5797ca2d51859d55c822b13528dc775ab3c6d', '::1', 1517139239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133393233393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383831373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('608b6129196742842a9f4eba47f853d5d6a18e8e', '::1', 1517139490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133393233393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383831373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('6754684c00bc8f260bdcce44c5790b35c6be8333', '::1', 1491693626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639333334363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363630303937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313639333632363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('6b13de4745f2e6af1227e9e7701599fcb196e437', '::1', 1491692522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639323234313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363630303937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313639323532323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('6b1e4940a469449a8c69cb07e5b366f4e00b41e7', '::1', 1492027202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032373230323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('6f28ede92553a688c275a33e4445f52015354157', '::1', 1517121664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132313635373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132313636333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('6f409e1005dd61d6220c57be4ffde3605db049b5', '::1', 1491665693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636353630323b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363534393035223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636353639333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('6f873f7f6ce6e37d6f6ae7df93bd3acb0bbda4c6', '::1', 1491660098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636303037343b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363534393035223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636303039383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('6fefd86a462fee024b5c5dcb209092b3b565f99b', '::1', 1491662239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636323134373b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363534393035223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636323233393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('710cccef200971f6813f184991e2f2d7aa850fd0', '::1', 1492033616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033333431333b7265717565737465645f706167657c733a353a2273616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303230353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7152436bca8e740a0873be701596e201cc77f930', '::1', 1491664201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636343130333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636343230303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b),
('721d31c4789c585d53cfef55b25c70049dff3407', '::1', 1492406105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323430353830393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303631303639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323430363130353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('726b70d7ffff214088ec85c3d10855e56fcced89', '::1', 1517140140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133393932353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134303134303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('7643e482c53611431871dd4b8ed5d208ac4e6be4', '::1', 1517148647, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134383339383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('77f23a1017d192ec552b29228b55679798282305', '::1', 1492034270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033333938353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('78b85d89d4d4bd3c5c533a13bca65c5d975e5117', '::1', 1492063553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323036333535323b),
('78c7fb03cd6a01bcab3a30c98740bf2d9edabb1f', '::1', 1517133405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133333239333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('7a734ae5d802a50b6c175bf7b170a388adf4ef7b', '::1', 1491666552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636363535323b7265717565737465645f706167657c733a333a22706f73223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363534393035223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636363535323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('80c1c9ef9ca6a4bef80d456b69489c1b9cd8d47b', '::1', 1492025059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032353034363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('8671a9ff5cb704047a3cc04dba484766738f4419', '::1', 1491665587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636353538373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636353538373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('8674ee522da8a7d4895c8631d6bc8045efa3eab0', '::1', 1491695681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639353634363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363630303937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313639353638313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('86d63804ed776aba59ee89b031dbd5f998b52f3f', '::1', 1492027152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032363838343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('875dd601a83e80bf37a9e7a22c554ec0ed732fe7', '::1', 1491716263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313731363232373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363932323431223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313731363236323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('896091ce0da5ac92037593f9b17c59028d2eddea', '::1', 1517081498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038313439383b),
('89baf6779d8e130896111f7a6e83bcd7213a0aea', '::1', 1492022458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032323434343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('906e3dfdd9bf3d45de3b16c5e8a6ca8f2efa02dc', '::1', 1517080659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038303336363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932343035383234223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a38363a223c703e54686520696d61676520796f752061726520617474656d7074696e6720746f2075706c6f616420646f65736e27742066697420696e746f2074686520616c6c6f7765642064696d656e73696f6e732e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('92aa7a5745182b31728bf0d67f6b3cb3a0110e39', '::1', 1492032527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033323336383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('953f330502e93acd4dac1b4d768dbe480c3cb111', '::1', 1517134009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133343030393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('97b4db7bd2ffb636e089e7c0c5d973e63abff825', '::1', 1517129385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132393335303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('9da6664f3f658a97e72daf8810bf601dd34f9520', '::1', 1491660304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313635393634313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636303330343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b),
('a1a462407c6c868643eee127d90e2d764cf11258', '::1', 1492032313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033323033353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('a1ad1737d0a3f70bc2c6ddb4b8df348784e79a1b', '::1', 1517133871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133333637363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('a474e566c657f6dae098d535a8b5f24d58bc7ed4', '::1', 1517128357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132383235393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('a4cd66caeec1dd4251d1cd6c9577115e00414b46', '::1', 1517139924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133393632343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383831373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('a8149fddf77736f8e4dd6c31491b0295751a0b5c', '::1', 1517141948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134313730313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134313432333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('a8227b35ea44bda302913eb4cf4ae8f42abe664a', '::1', 1492033887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033333838333b7265717565737465645f706167657c733a353a2273616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303230353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33313a227461626c65206e616d652063726561746564207375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('a984c37e2db3655b2d8f72c8c230da2ba38ff6d6', '::1', 1517122411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132323131353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132323339303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('a9d18524cd09fb05a21732892b2f417550648906', '::1', 1517083961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038333636363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038323133313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('ab0a795082a9dba1df85388b66138e2666cf7eee', '::1', 1491658194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313635373839343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313635383030343b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('abb14064a9f5e7ca74701c9fa5cd42cafb405703', '::1', 1492062034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323036323033343b),
('b12eac748c629e8637b42db86f9b4f430e221b8c', '::1', 1517086751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038363632363b6964656e746974797c733a363a22666f72686164223b757365726e616d657c733a363a22666f72686164223b656d61696c7c733a31363a22666f7268616440676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303233373932223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2235223b77617265686f7573655f69647c733a313a2231223b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2231223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038363733373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031353a32343a3334223b637372666b65797c733a383a226d54354c67503931223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22676a467145386e5a5052374e757462657a594778223b),
('b44918a2d7e298963243adfd87eda93bfd3afee7', '::1', 1492024792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032343635373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('b4a487edfbd020cafbe43b2f9cb33876f1ba1c2c', '::1', 1517128913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132383632353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('b4bd5afc449677f5286fedc1ddd64bdf63ff68a9', '::1', 1492033188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033333030393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('b5ea04667ba97783fa69d88203cb62e7e91c8ae1', '::1', 1492032635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033323630393b7265717565737465645f706167657c733a353a2273616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303230353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b76286e8cda3fa28c610b6156ca562e1a7f81bcd', '::1', 1492020618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032303530313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('b8530405ea71e0099aad6dc96f79bd508b78a5a6', '::1', 1517149297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134393035383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('b90967ac9e9c75984cd4f9b863243bf503b13f0d', '::1', 1491690868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639303834363b7265717565737465645f706167657c733a303a22223b),
('b9a83d3fd062235f016c3d203a2be97d2e1f58c5', '::1', 1491660352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636303334313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636303335323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b72656d6f76655f706f736c737c693a313b),
('b9c11bbe1f489289a6fe61d16a695649c8e222f2', '::1', 1517146489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134363238383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b);
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('be63dc76fb7935140ce66335ccc067befd866b1e', '::1', 1517084069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038333937393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038323133313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('beafe4e9e9092000331c946e81458789331c705b', '::1', 1492023821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032333737323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a363a22726973683031223b757365726e616d657c733a363a22726973683031223b656d61696c7c733a31393a22726973685f656e6772407961686f6f2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343930343333383236223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2235223b77617265686f7573655f69647c733a313a2231223b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2231223b62696c6c65725f69647c733a313a2230223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c2a1b566697d73a53b311b71a04583913151b543', '::1', 1492036144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033353931343b7265717565737465645f706167657c733a353a2273616c6573223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303230353137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224375543878554a3777656a62306f364658345649223b72656d6f76655f706f6c737c733a313a2231223b),
('c458fe6a3ae4f15b44f2fbffb015ebfd406a4866', '::1', 1517146197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134353839333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('c73567c78a4256b4c76d05882f577c4cd84af429', '::1', 1492025739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032353532383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('c79d610998cf30ac2c06bd093f385a5fe2878526', '::1', 1517140555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134303233303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134303534323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('c7f1ae573859f45aebe9f73c5e8798a595f53aec', '::1', 1517138156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133373835393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383132373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('c80dd4701f6cc7491c51f4da951c3a975a3414cb', '::1', 1517140826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134303638343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134303733313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('c88a9137628a91fba925e739c65cf417f9ab2a1f', '::1', 1517145890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134353538393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('c88ad49ba83d20b7e909db806e0bee3886d814e6', '::1', 1492023448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032333232393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('c96a38c09aa64fa055dd127ad0145ee0403e0ace', '::1', 1517148046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134373738323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('cbc657e66271bdbe58db18360b84572c7c57abcc', '::1', 1492035369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033353336393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('cc8362cac7a53961dc7ca7afb0534cf83f826ea7', '::1', 1517138850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133383534393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383831373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('cd6aa52c682bd3a84c1226fab0555e4f8a6ba562', '::1', 1517133270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133323937323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('ce1fc428f295388260e6305625189ca0b7550e68', '::1', 1517121591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132313333353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132313539303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('cf8fb26b829f96481f6e40203e62230c2b49b2a2', '::1', 1517134836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133343732393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133333139353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('d179d94dd7b24c3e70a52c976012de457cb64c7f', '::1', 1492406390, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323430363339303b),
('d43dfa961ba473fffa5a9788df31b523382ad6be', '::1', 1492586248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323538363234373b7265717565737465645f706167657c733a303a22223b),
('d761861a5398fa062f0ef4c0170a18a8a2a13513', '::1', 1517143266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134333035333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134333236333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('d7ec0de7349acd47caf2a49e7596333b2158c584', '::1', 1517131909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133313631313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('d990f553155010cebe2534dcf6dd75424dbe5bf8', '::1', 1491695315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639353032313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363630303937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313639353331353b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('d9ff2357c4a7d63030e484e587ba72a0e3c9e548', '::1', 1517149518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134393531323b7265717565737465645f706167657c733a303a22223b),
('daf5adba46a0b44a93da9b7d373ec462daafee36', '::1', 1491659266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313635393231343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313635393236363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('dc7a112d03f7ef3e64eb3c92a81931bd6a49055b', '::1', 1517148382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134383038343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a2258433668746a53755779644d506f6b715a47307a223b),
('dcc1ad287bc587cfb2146efab0b31b0fadb07b85', '::1', 1517124108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132343038383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('dd178917eb379b194c258fb2605db2aacd8125f5', '::1', 1517084804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038343633343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038343638393b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('de6f50cddbb0a04efd4def2934e0976739d4fa64', '::1', 1517121240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132313032343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dfc3939157347623cc9b8eb63309791d420c5e42', '::1', 1491693013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639323732353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363630303937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313639333031323b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('e02318726d8b1596ca7905dc6c9640430cb342fb', '::1', 1492034396, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033343330313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32363a227461626c652064656c65746564207375636365737366756c6c79223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('e1acbe2d0585523ca0f2dc2c0d432c390573ba85', '::1', 1492028799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032383739393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('e1c3cadbdf29dec43655ca88cb2885b0be59c591', '::1', 1517141692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134313338383b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134313432333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('e2f9b7bb39c6f748f9e42c3c2cf3b6976560d542', '::1', 1517132194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133313934313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133323137363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('e5d45425383e2b302759baf0692737531fb705b0', '::1', 1517085998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038353736313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038353939373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('e61bc09f3f833f5922aa5dec9bac0747a089aac7', '::1', 1491661356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313636313134303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363338363134223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313636313335363b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b757365725f637372667c733a32303a22783566584b34764d464872624c4464556a57736b223b72656d6f76655f706f736c737c693a313b6d6573736167657c733a32373a22504f532053616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('ef0416cc2e67509430548783b812f0f8dadb96ab', '::1', 1491693327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313639333033333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931363630303937223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439313639333332373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('f0d26c04e607c4425522a90477a8e27f8ced2e58', '::1', 1517128154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373132373931373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373132343130383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('f16922cd907f27b29af1b96eb149888d7d64d335', '::1', 1517142931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134323734313b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134313432333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('f416ac7c1b79b5816a5e25d47e5709e4f7ed286a', '::1', 1517144447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134343235303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134343335313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('f5488bb2d9cf4cea81e4e2846b9a9f44c98e481a', '::1', 1492023830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323032333831353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032303536303b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('fc9d11a228eba22e48b3d2c99308108272e8fa58', '::1', 1517139123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373133383932303b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373133383831373b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('fe6cc815c1859899f15a77d9f7645997ebbc75fa', '::1', 1492032023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323033313733333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931373136323336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313439323032343336383b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b72656d6f76655f706f736c737c693a313b),
('feb549cd93e09fb2bd7d98817e37e06c927f9cdb', '::1', 1517142366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373134323037323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137313232393637223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373134313432333b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b),
('ff8cad5daaa35a760c3c831acced52696416d598', '::1', 1517082147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373038313834393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137303831383137223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373038323133313b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30332d32352031333a34353a3338223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`) VALUES
(1, 'logo7.png', 'logo8.png', 'B+PLUS LTD.', 'english', 1, 0, 'BDT', 0, 10, '3.0.2.22', 3, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 0, 1, 0, 1, 0, 'Asia/Dhaka', 800, 800, 60, 60, 1, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 0, 0, 4, 0, 1, 0, 0, 0, '.', ',', 0, 7, 'ahasan', 'b8b759fc-1e5b-4d65-89a3-ee99b1590827', 0, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '', 0, '_', 0, 1, 1, 'POP', 90, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_table`
--

CREATE TABLE `sma_table` (
  `table_id` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `table_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sma_table`
--

INSERT INTO `sma_table` (`table_id`, `table_name`, `table_desc`) VALUES
(5, 'MASCOT DESK', '<p>FORHADUR RAHMAN</p>');

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(3, 'VAT@4%', 'VAT@4%', '4.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'PCS', 'PCS', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3a3a31, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'admin@codeplan.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1517123214, 1, 'Owner', 'Owner', 'B+PLUS LTD.', '01911584080', 'ec8aa49a7c012e9d26873bf4b6960da6.png', 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, 0x3a3a31, 0x3a3a31, 'forhad', 'f2ec99dc25d7aacd765d880df1d1700308e10803', NULL, 'forhad@gmail.com', NULL, NULL, NULL, 'ceedf44580bbb83e04bcf20d4fbc843ae0ac6e33', 1490433794, 1517122987, 1, 'Forhadur', 'Rahman', 'B+PLUS LTD.', '+88 01853161166', NULL, 'male', 5, 1, NULL, NULL, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(15, 1, NULL, 0x3a3a31, 'owner', '2018-01-27 19:13:18'),
(16, 1, NULL, 0x3a3a31, 'owner', '2018-01-27 19:36:57'),
(17, 1, NULL, 0x3a3a31, 'owner', '2018-01-27 19:37:34'),
(18, 2, NULL, 0x3a3a31, 'forhad', '2018-01-27 20:57:41'),
(19, 2, NULL, 0x3a3a31, 'forhad', '2018-01-28 06:30:17'),
(20, 1, NULL, 0x3a3a31, 'owner', '2018-01-28 06:30:29'),
(21, 1, NULL, 0x3a3a31, 'owner', '2018-01-28 07:02:47'),
(22, 2, NULL, 0x3a3a31, 'forhad', '2018-01-28 07:03:07'),
(23, 1, NULL, 0x3a3a31, 'owner', '2018-01-28 07:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_waiter`
--

CREATE TABLE `sma_waiter` (
  `waiter_id` int(11) NOT NULL,
  `waiter_name` varchar(100) NOT NULL,
  `waiter_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sma_waiter`
--

INSERT INTO `sma_waiter` (`waiter_id`, `waiter_name`, `waiter_desc`) VALUES
(1, 'Asif Khan', ''),
(2, 'Amir Uddin', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'MASCOT', 'MASCOT', '<p>Address, City</p>', 'f52a360e9cf8d830e646f52b6ec1c25d.png', '01853161166', 'forhad@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(0, 10, 1, '500.0000', NULL, '800.0000'),
(1, 11, 1, '500.0000', NULL, '900.0000'),
(2, 12, 1, '500.0000', NULL, '1000.0000'),
(3, 13, 1, '500.0000', NULL, '1100.0000'),
(4, 14, 1, '500.0000', NULL, '1200.0000'),
(5, 15, 1, '500.0000', NULL, '1600.0000'),
(6, 16, 1, '500.0000', NULL, '1000.0000'),
(7, 17, 1, '500.0000', NULL, '1300.0000'),
(8, 18, 1, '500.0000', NULL, '1400.0000'),
(9, 19, 1, '500.0000', NULL, '1500.0000'),
(10, 20, 1, '500.0000', NULL, '1600.0000'),
(11, 21, 1, '500.0000', NULL, '2500.0000'),
(12, 22, 1, '500.0000', NULL, '2750.0000'),
(13, 23, 1, '500.0000', NULL, '350.0000'),
(14, 24, 1, '500.0000', NULL, '450.0000'),
(15, 25, 1, '500.0000', NULL, '550.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_table`
--
ALTER TABLE `sma_table`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_waiter`
--
ALTER TABLE `sma_waiter`
  ADD PRIMARY KEY (`waiter_id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_table`
--
ALTER TABLE `sma_table`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
