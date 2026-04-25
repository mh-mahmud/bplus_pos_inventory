-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2018 at 01:18 PM
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
(1, 22, 20, 6, 6, 7, '1', 'Musak', 'VAT Reg', '11', '18011065912', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 1, 42, NULL, 'purchase_code', 'envato_username', '3.0.2.22', 0, 1, 0, '');

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
(25, '16', 'TAT3', 1, '550.0000', '550.0000', '10.0000', '27b7b9995fd987e445cde2d1c48b1a42.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(26, '17', 'TAT4', 1, '650.0000', '650.0000', '10.0000', '66bfc5eeb33995d995dae359b2a6a871.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(27, '18', 'TAT5', 1, '750.0000', '750.0000', '10.0000', '08465c2316f3f5ca4a6b697a3d39c5bc.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(28, '19', 'TAT6', 1, '850.0000', '850.0000', '10.0000', 'f6a85ef1cafc4d6d26674edda568d13f.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(29, '20', 'TAT7', 1, '950.0000', '950.0000', '10.0000', '1bd3beb40b5e266a8f82b61e88387087.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(30, '21', 'TAT8', 1, '1050.0000', '1050.0000', '10.0000', '0d63dfabbedc1d61c635dd8f8ebdfcea.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(31, '22', 'TAT9', 1, '1150.0000', '1150.0000', '10.0000', '82de2d5a3fd3b0aa241b1a6bc7ee3862.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(32, '23', 'TAT10', 1, '1250.0000', '1250.0000', '10.0000', '7ae573b7fd182cf2af48e67df572908e.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(33, '24', 'TAT11', 1, '1350.0000', '1350.0000', '10.0000', 'bb7621f60873a3e3c24a9508dfa30736.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(34, '25', 'TAT12', 1, '1450.0000', '1450.0000', '10.0000', '6fbdc44c3e7accc9f79ad1c7a3eb636b.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(35, '26', 'TAT13', 1, '1550.0000', '1550.0000', '10.0000', '35907f53c964c5324682c96fdcd8dd94.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(36, '27', 'TAT14', 1, '1650.0000', '1650.0000', '10.0000', '398abaf8e4c0b3311cad5338586a402c.png', 6, NULL, '', '', '', '', '', '', '500.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(37, '28', 'TAT15', 1, '1750.0000', '1750.0000', '10.0000', '96a22c23f34bf73c007da52aee2441a7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(38, '29', 'TAT16', 1, '1850.0000', '1850.0000', '1.0000', '438c13400fe9a450d9049038b223f362.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(39, '30', 'TAT17', 1, '1950.0000', '1950.0000', '1.0000', '8f72b17b9de1df72c35482a684967ff0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(40, '31', 'TAT18', 1, '2050.0000', '2050.0000', '1.0000', 'f74a4a933dbbd4cf3ed0f394c4ec939f.png', 6, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(41, '32', 'TAT19', 1, '2150.0000', '2150.0000', '1.0000', 'fea091e5e9d2f97077e3598874ca5c06.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(42, '33', 'TAT20', 1, '2250.0000', '2250.0000', '1.0000', 'fac91d8aff0b422e50169f2a1faa6733.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(43, '34', 'TAT21', 1, '2350.0000', '2350.0000', '0.0000', 'de1ce95c0b5ad2059b590b58de117227.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(44, '35', 'TAT22', 1, '2450.0000', '2450.0000', '1.0000', 'e16b225b290719a6652b72c4cfcfade3.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(45, '36', 'TAT23', 1, '2550.0000', '2550.0000', '1.0000', 'b14c825e5fe1f0ed5c3dc00efa91c1bb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(46, '37', 'TAT24', 1, '2650.0000', '2650.0000', '1.0000', '32be26d4529e6b0a81205f984a3ea00f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0),
(47, '38', 'TAT25', 1, '2750.0000', '2750.0000', '1.0000', '0870c72daeea861b7f8ce9d93933c848.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(48, '39', 'TAT26', 1, '2850.0000', '2850.0000', '1.0000', 'b1d3186632ae25ac12187606a1a2e796.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0),
(49, '40', 'TAT27', 1, '2950.0000', '2950.0000', '1.0000', 'afd26e8cf8b9d4702e3cf7f9a73223fb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(50, '41', 'TAT28', 1, '3050.0000', '3050.0000', '1.0000', 'd98d9a454511e31d02d29e41878f5745.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(51, '42', 'TAT29', 1, '3150.0000', '3150.0000', '1.0000', '6917bef5f647c8ebc5389821e811dc7e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(52, '311', 'TAT298', 1, '30050.0000', '30050.0000', '1.0000', 'c472a0abac381fca11a530866a597b90.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(53, '43', 'TAT30', 1, '3250.0000', '3250.0000', '1.0000', 'ed4a1809a5e6724f06bf25ee194f695f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(54, '310', 'TAT297', 1, '29950.0000', '29950.0000', '1.0000', 'ba86660c1a13b60752d26c458fc125ea.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(55, '44', 'TAT31', 1, '3350.0000', '3350.0000', '1.0000', '05db5c6b215a02a95dee27ce454b765c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(56, '45', 'TAT32', 1, '3450.0000', '3450.0000', '1.0000', 'd868b67b249e19171b20ecc74abd6034.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0),
(57, '309', 'TAT296', 1, '29850.0000', '29850.0000', '1.0000', '3e50dafa1818c9783eaad0a84e42ada1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(58, '46', 'TAT33', 1, '3550.0000', '3550.0000', '1.0000', '7d8aed7970c09090c12cc7066d7435db.png', 6, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(59, '47', 'TAT34', 1, '3650.0000', '3650.0000', '0.0000', '7b3db778ebc0e78879286a2518b110fa.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(60, '48', 'TAT35', 1, '3750.0000', '3750.0000', '0.0000', '50204ccb65c35dee3a50013d49240bda.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(61, '308', 'TAT295', 1, '29750.0000', '29750.0000', '1.0000', '67f47bf7865e2d45403b354f54d4b6ad.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(62, '307', 'TAT294', 1, '29650.0000', '29650.0000', '1.0000', '4cc21829dc1dfb3e521d4b71e70ed723.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(63, '49', 'TAT36', 1, '3850.0000', '3850.0000', '1.0000', 'd7f3b062f0f9f8bf93d35a93e4df38a7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(64, '306', 'TAT293', 1, '29550.0000', '29550.0000', '1.0000', '01fbe03aefa7e64ae60ba8a98b97d164.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(65, '305', 'TAT292', 1, '29450.0000', '29450.0000', '1.0000', '31f8384d05c325e73379fce67832c6df.png', 10, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(66, '50', 'TAT37', 1, '3950.0000', '3950.0000', '1.0000', 'c2487a37ae8067512a821e0343e8a9ae.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(67, '304', 'TAT291', 1, '29350.0000', '29350.0000', '1.0000', '6aaf18cd0fc726cc8dee07d3e9845c4e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(68, '51', 'TAT38', 1, '4050.0000', '4050.0000', '1.0000', '6822d9b3d7d777000916d3efd0bac474.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(69, '303', 'TAT290', 1, '29250.0000', '29250.0000', '1.0000', 'f6d6cecdaf5a8445cb13c9dac22b4c41.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(70, '52', 'TAT39', 1, '4150.0000', '4150.0000', '1.0000', '0e58449320a8358b93c8710aa9c88ff7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(71, '302', 'TAT289', 1, '29150.0000', '29150.0000', '1.0000', 'adb11e3b164252c92ea05b87d7f39569.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(72, '53', 'TAT40', 1, '4250.0000', '4250.0000', '1.0000', 'c8fffae698fdae9c3b74ca6937e5d1a7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(73, '54', 'TAT41', 1, '4350.0000', '4350.0000', '1.0000', '88d04ccf09adf3f18c3cda40734da537.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(74, '301', 'TAT288', 1, '29050.0000', '29050.0000', '1.0000', '9a527160f1565e822e9f88db43af80e2.png', 10, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(75, '55', 'TAT42', 1, '4450.0000', '4450.0000', '1.0000', '861502570714925d4b725617548ced8e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(76, '300', 'TAT287', 1, '28950.0000', '28950.0000', '1.0000', '304e2dcdf639fdd148dfb3eb60fe4ea1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(77, '56', 'TAT43', 1, '4550.0000', '4550.0000', '1.0000', '4b48e251430cae984e935c06674e28b3.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0),
(78, '57', 'TAT44', 1, '4650.0000', '4650.0000', '1.0000', '1ad0c3c43fb5a1e1223e5b84c82ee16e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(79, '299', 'TAT286', 1, '28850.0000', '28850.0000', '1.0000', '9f1d0c82b893ad2047a5b0175153ba72.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(80, '58', 'TAT45', 1, '4750.0000', '4750.0000', '1.0000', '59bffc7dd2b00157402ea4e07ede4b1e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(81, '59', 'TAT46', 1, '4850.0000', '4850.0000', '1.0000', 'cda11b070dfa9abbb5c1a6f82b2384d0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(82, '298', 'TAT285', 1, '28750.0000', '28750.0000', '1.0000', 'd41ba085133e2172bfbf3eca50e3f138.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(83, '60', 'TAT47', 1, '4950.0000', '4950.0000', '1.0000', '1e27a85119d84d19519596bd2be462aa.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(84, '61', 'TAT48', 1, '5050.0000', '5050.0000', '1.0000', '579beb5d3e9c2ce48a54be85269be210.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(85, '62', 'TAT49', 1, '5150.0000', '5150.0000', '1.0000', '229b4f7c139e79014e2196d692762c79.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(86, '63', 'TAT50', 1, '5250.0000', '5250.0000', '0.0000', '18d624b8460425ea5da98dc990d744c5.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(87, '64', 'TAT51', 1, '5350.0000', '5350.0000', '1.0000', 'aaee9cf6961e1232c28fbdbfd2f4c0a7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(88, '65', 'TAT52', 1, '5450.0000', '5450.0000', '1.0000', 'd166a8896e05a7e7309a64a61d5cf6f9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(89, '66', 'TAT53', 1, '5550.0000', '5550.0000', '1.0000', '8c5bed26ceab590e3fb52e910d023b0e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(90, '67', 'TAT54', 1, '5650.0000', '5650.0000', '1.0000', '7b2d90dcd679e07d46bc57a819a49138.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(91, '297', 'TAT284', 1, '28650.0000', '28650.0000', '1.0000', '2e5e0b499165fe61b4b8e8ce79ef7d8b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(92, '68', 'TAT55', 1, '5750.0000', '5750.0000', '1.0000', '8fc6aa8e2c1d0cf4004b57d60b3eb5c2.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(93, '69', 'TAT56', 1, '5850.0000', '5850.0000', '1.0000', 'dfd74685f674a89ae81faf6212011c37.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(94, '70', 'TAT57', 1, '5950.0000', '5950.0000', '1.0000', 'cda520d08e8a51b22c57b8f14ff0360d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(95, '71', 'TAT58', 1, '6050.0000', '6050.0000', '1.0000', 'bc9570bfe36be87f7b6ebaba19e6a7c8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(96, '296', 'TAT283', 1, '28550.0000', '28550.0000', '1.0000', '45372aef3abbbdecd032534182b45aa0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(97, '72', 'TAT59', 1, '6150.0000', '6150.0000', '1.0000', '9d85bfd391cc4425ed7d2144597cd5f9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(98, '73', 'TAT60', 1, '6250.0000', '6250.0000', '1.0000', '59d35ebaf62986cc85777f79fae0ae1b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(99, '74', 'TAT61', 1, '6350.0000', '6350.0000', '1.0000', '552ce22acf401b332629130ffb608cc4.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(100, '75', 'TAT62', 1, '6450.0000', '6450.0000', '1.0000', 'ac4b8c486cca3c6183a0fe69934fbfe6.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(101, '76', 'TAT63', 1, '6550.0000', '6550.0000', '1.0000', 'a6c46baa423a637adf02bc4d998a7c23.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(102, '77', 'TAT64', 1, '6650.0000', '6650.0000', '1.0000', '49e361e524dfd3e7ff56a75a35ebfbe4.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(103, '78', 'TAT65', 1, '6750.0000', '6750.0000', '1.0000', 'c8e8dde176d1296f9b316bb9bece9332.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(104, '79', 'TAT66', 1, '6850.0000', '6850.0000', '0.0000', '8cef0bcb98f91bd04c8820b45b2774a3.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(105, '80', 'TAT67', 1, '6950.0000', '6950.0000', '1.0000', 'ae1d997e2fafd516f8243a0c7302464f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(106, '81', 'TAT68', 1, '7050.0000', '7050.0000', '1.0000', 'f1873a4bfcaa2f50776016e6cdef206e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(107, '295', 'TAT282', 1, '28450.0000', '28450.0000', '1.0000', 'dfe1b2a345732945162c73f211f71764.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(108, '82', 'TAT69', 1, '7150.0000', '7150.0000', '1.0000', '5dae6b0e9210d648c0eef0ae5d404349.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(109, '294', 'TAT281', 1, '28350.0000', '28350.0000', '1.0000', 'f05f19b4ddfc1a348121ba69e95b6bee.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(110, '293', 'TAT280', 1, '28250.0000', '28250.0000', '1.0000', 'f8d4a8f36a8a984934f416e3f70314ea.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(111, '83', 'TAT70', 1, '7250.0000', '7250.0000', '1.0000', 'edfea0b59ace54145669e85b4f511b0f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(112, '292', 'TAT279', 1, '28150.0000', '28150.0000', '1.0000', 'c7d9e1a89927c269e97058dfa0ccb94c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(113, '84', 'TAT71', 1, '7350.0000', '7350.0000', '1.0000', '795eef3e817f48118eb7546021e44dee.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(114, '291', 'TAT278', 1, '28050.0000', '28050.0000', '1.0000', '673c7ed1ac5de3e9ce358bd29e1454aa.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(115, '85', 'TAT72', 1, '7450.0000', '7450.0000', '1.0000', 'fa71ece1c2f7f06c5c142bdfe8c4b9ea.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(116, '290', 'TAT277', 1, '27950.0000', '27950.0000', '1.0000', '4129dfdc6cc6a6dff1cb39cde5006907.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(117, '86', 'TAT73', 1, '7550.0000', '7550.0000', '1.0000', 'b4aa513d95efcc7765d874c9819d7821.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(118, '87', 'TAT74', 1, '7650.0000', '7650.0000', '1.0000', 'a9ecb396ed15cff12f416f9c79878ed1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(119, '88', 'TAT75', 1, '7750.0000', '7750.0000', '1.0000', '980634fa0cdf40739fd4e1f84f151044.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(120, '89', 'TAT76', 1, '7850.0000', '7850.0000', '1.0000', '544543c3bf369ec204ac0b1d4511e0b0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(121, '90', 'TAT77', 1, '7950.0000', '7950.0000', '1.0000', 'dac20868728cdde6b6ee78922550e30d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(122, '91', 'TAT78', 1, '8050.0000', '8050.0000', '1.0000', '889fe5e0ab74bcad3bf9918c1c6cdbd8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(123, '92', 'TAT79', 1, '8150.0000', '8150.0000', '1.0000', '70446a17955060ae785e0adbe4505d5b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(124, '93', 'TAT80', 1, '8250.0000', '8250.0000', '1.0000', 'ff628a56a277d0afad6662476ab3a206.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(125, '94', 'TAT81', 1, '8350.0000', '8350.0000', '1.0000', '80a88444917b1fd3f37bb7381643dd7d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(126, '95', 'TAT82', 1, '8450.0000', '8450.0000', '1.0000', '71581291b0e312c3aa228edc9937400c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(127, '96', 'TAT83', 1, '8550.0000', '8550.0000', '1.0000', '8437b832acc3a64e501ba14e0dce15ff.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(128, '289', 'TAT276', 1, '27850.0000', '27850.0000', '1.0000', '4cab76fb06926300c508f113a0e02b1b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(129, '97', 'TAT84', 1, '8650.0000', '8650.0000', '1.0000', '84d644d52a8cd8e08c4d99fe93744929.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(130, '98', 'TAT85', 1, '8750.0000', '8750.0000', '1.0000', '8cc595bae01b17d65d1468e2edef1867.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(131, '288', 'TAT275', 1, '27750.0000', '27750.0000', '1.0000', '16e02c80b41f15d3b32eea327a541c26.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(132, '99', 'TAT86', 1, '8850.0000', '8850.0000', '1.0000', 'a77d5e3d2897cb9a088ca20b83599813.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(133, '287', 'TAT274', 1, '27650.0000', '27650.0000', '1.0000', 'a2e7ea5a237e085e6f2061a5ba2c0121.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(134, '100', 'TAT87', 1, '8950.0000', '8950.0000', '1.0000', 'ae34332d6b32e787f444e41d9df54742.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(135, '286', 'TAT273', 1, '27550.0000', '27550.0000', '1.0000', 'b2779b0e5869dd2254df71837f6856d8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(136, '285', 'TAT272', 1, '27450.0000', '27450.0000', '1.0000', 'a189908fac946ea9c10505e3520c506d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(137, '101', 'TAT88', 1, '9050.0000', '9050.0000', '1.0000', 'd584b38c505e8fbc6d49c55019f180a0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(138, '284', 'TAT271', 1, '27350.0000', '27350.0000', '1.0000', '469fd5b2a14c507766892e3261d05b69.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(139, '283', 'TAT270', 1, '27250.0000', '27250.0000', '1.0000', '294b9b51cc19bc7e30b96ab97a7191c0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(140, '282', 'TAT269', 1, '27150.0000', '27150.0000', '1.0000', '6db2ae7f5a411cbf51420fe3aac589ea.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(141, '102', 'TAT89', 1, '9150.0000', '9150.0000', '1.0000', '58e4270649ab2011fc10f4411ab2a7cc.png', 6, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(142, '281', 'TAT268', 1, '27050.0000', '27050.0000', '1.0000', '32f5a5d275d35e03f66c6cd332a8cd9f.png', 6, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(143, '280', 'TAT267', 1, '26950.0000', '26950.0000', '1.0000', '22ab1c945541ec77a0f4b312fee646af.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(144, '279', 'TAT266', 1, '26850.0000', '26850.0000', '1.0000', 'd7ecdb03ea9d472eb49b23d2cd1511b8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(145, '103', 'TAT90', 1, '9250.0000', '9250.0000', '1.0000', '3dc811f949ba71d5fe1c905a4794b10a.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(146, '104', 'TAT91', 1, '9350.0000', '9350.0000', '1.0000', 'd428e69bd59456b866af75859fe90e70.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(147, '105', 'TAT92', 1, '9450.0000', '9450.0000', '1.0000', '59e3a7a8568b80bcb0fec1ede69a9933.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(148, '106', 'TAT93', 1, '9550.0000', '9550.0000', '1.0000', 'f8b1b2ca83ec5ad3a26842cf5ef0909d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(149, '107', 'TAT94', 1, '9650.0000', '9650.0000', '1.0000', 'd6879974641595eb76193bb41f9f9ff3.png', 6, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(150, '108', 'TAT95', 1, '9750.0000', '9750.0000', '1.0000', '9b9b000ee6d30592592dc1b29404567a.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(151, '109', 'TAT96', 1, '9850.0000', '9850.0000', '1.0000', '2459b31a21dede08aefe3309a6d6c392.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(152, '110', 'TAT97', 1, '9950.0000', '9950.0000', '1.0000', '04e6bc0a747163df9a7e985fc934f606.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(153, '111', 'TAT98', 1, '10050.0000', '10050.0000', '1.0000', '1174d289b37e7eb5cb8ef875281c55e9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(154, '278', 'TAT265', 1, '26750.0000', '26750.0000', '1.0000', '04aaed774fc714cee0206d7a425b8749.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(155, '277', 'TAT264', 1, '26650.0000', '26650.0000', '1.0000', '2807c0365b775b43f53a1939af4791cc.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(156, '112', 'TAT99', 1, '10150.0000', '10150.0000', '1.0000', '4a1ee3a074d5fad4488b04a96656d9b9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(157, '276', 'TAT263', 1, '26550.0000', '26550.0000', '1.0000', 'dc90f7243cd353820f478cbc51b4a9f8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(158, '113', 'TAT100', 1, '10250.0000', '10250.0000', '1.0000', 'ec8bc2d570902c571a65e6cda08f1eba.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(159, '275', 'TAT262', 1, '26450.0000', '26450.0000', '1.0000', 'd5da8c33fba9cd3996119b0f3c2df8f4.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(160, '114', 'TAT101', 1, '10350.0000', '10350.0000', '1.0000', '48cf1662de0086bc89698b231bc4cbd9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(161, '274', 'TAT261', 1, '26350.0000', '26350.0000', '1.0000', 'cde48ae68bf580e2c8fcb467a08a5e23.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(162, '115', 'TAT102', 1, '10450.0000', '10450.0000', '1.0000', '0d5380f70ce945d4dfe40589f0e761eb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(163, '273', 'TAT260', 1, '26250.0000', '26250.0000', '1.0000', '319bc23b745a139f924133a36c7f2236.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`) VALUES
(164, '272', 'TAT259', 1, '26150.0000', '26150.0000', '1.0000', 'ae8dec44f435413158db4d805422c5e1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(165, '271', 'TAT258', 1, '26050.0000', '26050.0000', '1.0000', 'bedb6f0b5991ea793c99973fad45bb5b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(166, '270', 'TAT257', 1, '25950.0000', '25950.0000', '1.0000', '10f8043b4ad7982791bf12582ed452a4.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(167, '269', 'TAT256', 1, '25850.0000', '25850.0000', '1.0000', '90d1a8dab4110ce47e448a3524b8bdbf.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(168, '116', 'TAT103', 1, '10550.0000', '10550.0000', '1.0000', 'c4f58553b81afcb4ce0cc8708197774c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(169, '268', 'TAT255', 1, '25750.0000', '25750.0000', '1.0000', '56ffb7b7af81ddb46e1a8e26ffc98e2c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(170, '117', 'TAT104', 1, '10650.0000', '10650.0000', '1.0000', '75cf00dd1fa2bda04205d9e2be937cf2.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(171, '267', 'TAT254', 1, '25650.0000', '25650.0000', '1.0000', '8e552f7c5cd802bb32e8531ce5014d1c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(172, '118', 'TAT105', 1, '10750.0000', '10750.0000', '1.0000', '397dc509af19cf9a38823026fb6d9630.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(173, '266', 'TAT253', 1, '25550.0000', '25550.0000', '1.0000', '2d20e9aea7c02da67d7144216cce521f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(174, '119', 'TAT106', 1, '10850.0000', '10850.0000', '1.0000', '76396b0ff351f26529b5833f83ad159f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(175, '265', 'TAT252', 1, '25450.0000', '25450.0000', '1.0000', '12d07426820831ccbe5953fb7895e0a9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(176, '264', 'TAT251', 1, '25350.0000', '25350.0000', '1.0000', 'a4534209e0cf337a196a8955761a9e34.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(177, '263', 'TAT250', 1, '25250.0000', '25250.0000', '1.0000', '40112597f6fdf4af01c128108ca091eb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(178, '262', 'TAT249', 1, '25150.0000', '25150.0000', '1.0000', '85b61573875df8ab6515175b56ee24e9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(179, '120', 'TAT107', 1, '10950.0000', '10950.0000', '1.0000', 'b79c5d43095d8de5f54c7ca075036e69.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(180, '261', 'TAT248', 1, '25050.0000', '25050.0000', '1.0000', '631bf0c7b113a5209e9aaf426d7fba03.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(181, '121', 'TAT108', 1, '11050.0000', '11050.0000', '1.0000', 'b3b95fa472f5c381cd2161d69ea17484.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(182, '260', 'TAT247', 1, '24950.0000', '24950.0000', '1.0000', '894d0611114381126904a61657feb7b8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(183, '122', 'TAT109', 1, '11150.0000', '11150.0000', '1.0000', '48d39d4aa2b882ce45be0751dd609c72.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(184, '259', 'TAT246', 1, '24850.0000', '24850.0000', '1.0000', 'b75adaa44d84e14cc4b005541f76ae24.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(185, '258', 'TAT245', 1, '24750.0000', '24750.0000', '1.0000', '5b56bbf50dc060f678b5693f385f300b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(186, '123', 'TAT110', 1, '11250.0000', '11250.0000', '1.0000', 'fae8b273f8938d8c7f254ba4c5894653.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(187, '257', 'TAT244', 1, '24650.0000', '24650.0000', '1.0000', '5d1c6c87767d0530d4389d7731309b49.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(188, '256', 'TAT243', 1, '24550.0000', '24550.0000', '1.0000', 'b48b29fc9fcdffa45377ea2e45052ac7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(189, '255', 'TAT242', 1, '24450.0000', '24450.0000', '1.0000', '53704f18609b1b223ee096da63464736.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(190, '254', 'TAT241', 1, '24350.0000', '24350.0000', '1.0000', '1ce738128c6c481048d5c264d8b50c76.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(191, '124', 'TAT111', 1, '11350.0000', '11350.0000', '1.0000', '8a1b71f31e8bab4a3adaa314c0736ead.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(192, '125', 'TAT112', 1, '11450.0000', '11450.0000', '1.0000', '45e6c886def73f3399f22313b1cee275.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(193, '253', 'TAT240', 1, '24250.0000', '24250.0000', '1.0000', 'ff4200e963ef59bf269ca1faddf6d8e7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(194, '252', 'TAT239', 1, '24150.0000', '24150.0000', '1.0000', 'e940d3837c261060411bf155514b8662.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(195, '126', 'TAT113', 1, '11550.0000', '11550.0000', '1.0000', '4589dc328ef4a24762cc4fc523ff652a.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(196, '251', 'TAT238', 1, '24050.0000', '24050.0000', '1.0000', '35abec16039cf7a992693cd4b53bbbe6.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(197, '127', 'TAT114', 1, '11650.0000', '11650.0000', '1.0000', '66518e06e129bfcd83fb221f426bf118.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(198, '250', 'TAT237', 1, '23950.0000', '23950.0000', '1.0000', '5d6ea2634eeb8206b4dafa8d216affad.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(199, '128', 'TAT115', 1, '11750.0000', '11750.0000', '1.0000', '2ff48d42e7a0ce9320f912282e2e22eb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(200, '129', 'TAT116', 1, '11850.0000', '11850.0000', '1.0000', '6a0d3682e9e67b4d82c219777c7f6692.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(201, '130', 'TAT117', 1, '11950.0000', '11950.0000', '1.0000', 'be4236af4bc84c064c1ea1fb6c574ad1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(202, '131', 'TAT118', 1, '12050.0000', '12050.0000', '1.0000', '7c9ddb0d9a8b20ee88d358d4fae88041.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(203, '249', 'TAT236', 1, '23850.0000', '23850.0000', '1.0000', '5791686c3991ec7d2a03f6ec82770802.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(204, '132', 'TAT119', 1, '12150.0000', '12150.0000', '1.0000', '725df10741dde1edf216b2b92426e1ee.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(205, '248', 'TAT235', 1, '23750.0000', '23750.0000', '1.0000', 'a9acb288cb41b4f42a5941f4fc6a67ac.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(206, '133', 'TAT120', 1, '12250.0000', '12250.0000', '1.0000', '1a58824f2cf5b0edecc6ec7dde3d4c3f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(207, '247', 'TAT234', 1, '23650.0000', '23650.0000', '1.0000', 'baff0695465b4c99b444dcebf3586ee5.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(208, '134', 'TAT121', 1, '12350.0000', '12350.0000', '1.0000', '5d49e23da945332d9b18338e7972dd20.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(209, '246', 'TAT233', 1, '23550.0000', '23550.0000', '1.0000', 'bce4f38384a95b76bd69b8226154e778.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(210, '245', 'TAT232', 1, '23450.0000', '23450.0000', '1.0000', 'b115f044460078cb7d8d8da44adcf747.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(211, '244', 'TAT231', 1, '23350.0000', '23350.0000', '1.0000', '8b4b9c485abe23c79aeeea8a87977dd5.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(212, '135', 'TAT122', 1, '12450.0000', '12450.0000', '1.0000', '23cd83647527204b0f167c191672f1ad.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(213, '243', 'TAT230', 1, '23250.0000', '23250.0000', '1.0000', '2278108d9707fb64b9aa236b86e24db5.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(214, '242', 'TAT229', 1, '23150.0000', '23150.0000', '1.0000', '9ab530dfa0a1314339da32d808682990.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(215, '136', 'TAT123', 1, '12550.0000', '12550.0000', '1.0000', '8129fee736ac7a220ab5c60f7afd547e.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(216, '241', 'TAT228', 1, '23050.0000', '23050.0000', '1.0000', 'f38d388bc0a232c09933b9e17822fecb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(217, '137', 'TAT124', 1, '12650.0000', '12650.0000', '1.0000', '1e7155057ab4816a2bc906ff604b925d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(218, '240', 'TAT227', 1, '22950.0000', '22950.0000', '1.0000', 'bb52da56d9a6f734244e8b272af3dce1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(219, '138', 'TAT125', 1, '12750.0000', '12750.0000', '1.0000', '1c62a75af8abe1d5f2c85b6134224970.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(220, '239', 'TAT226', 1, '22850.0000', '22850.0000', '1.0000', '1f98216d159983f4b5a3857de610ae22.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(221, '238', 'TAT225', 1, '22750.0000', '22750.0000', '1.0000', '3404b3415f87b4bb4104e436e0ca177c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(222, '139', 'TAT126', 1, '12850.0000', '12850.0000', '1.0000', '40e0f6b40de5fad2108c9de9758350fd.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(223, '237', 'TAT224', 1, '22650.0000', '22650.0000', '1.0000', 'bfcf92931a7a469ab538bb078d06e61b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(224, '140', 'TAT127', 1, '12950.0000', '12950.0000', '1.0000', '2f9aa5de211568eb4c495a1a192e8e60.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(225, '236', 'TAT223', 1, '22550.0000', '22550.0000', '1.0000', '7d59d76fa4edd784a3f1c777d655e639.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(226, '141', 'TAT128', 1, '13050.0000', '13050.0000', '1.0000', 'b2db3e6ba617d2c96a37868c40e53b02.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(227, '235', 'TAT222', 1, '22450.0000', '22450.0000', '1.0000', '556f01147c5418edae09a3510e7e5c58.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(228, '234', 'TAT221', 1, '22350.0000', '22350.0000', '1.0000', 'fdf7dd5464841e4bf7e5b66e93945777.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(229, '142', 'TAT129', 1, '13150.0000', '13150.0000', '1.0000', '33e7137f812e9afbc40ad32cd4a65448.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(230, '233', 'TAT220', 1, '22250.0000', '22250.0000', '1.0000', 'fe970be5f4a3e16e7bfb4af19827cdca.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(231, '143', 'TAT130', 1, '13250.0000', '13250.0000', '1.0000', 'd566732cac18e1633cbef5f6e2ef5c33.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(232, '232', 'TAT219', 1, '22150.0000', '22150.0000', '1.0000', 'a1480a8ef1e5203332af50ca68ef2b16.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(233, '144', 'TAT131', 1, '13350.0000', '13350.0000', '1.0000', 'a8b8121cadb3318840bc5e79cbca7b40.png', 10, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(234, '231', 'TAT218', 1, '22050.0000', '22050.0000', '1.0000', '37cf8c81382da6ae8844f40434b9ee68.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(235, '230', 'TAT217', 1, '21950.0000', '21950.0000', '1.0000', 'cc7d19edf61c3d826a7eedf562df648d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(236, '145', 'TAT132', 1, '13450.0000', '13450.0000', '1.0000', '5461027de5f328595864fc1fab46acf3.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(237, '229', 'TAT216', 1, '21850.0000', '21850.0000', '1.0000', '8c74dd1f9c4b391ff92f49af1e5b8e34.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(238, '228', 'TAT215', 1, '21750.0000', '21750.0000', '1.0000', 'edb9acdbf0c645352a47358465dccce4.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(239, '146', 'TAT133', 1, '13550.0000', '13550.0000', '1.0000', '0dbd6212a92b91f3deb1fce9122675dc.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(240, '227', 'TAT214', 1, '21650.0000', '21650.0000', '1.0000', '7f442a866720b7f76e40a72257c254d0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(241, '147', 'TAT134', 1, '13650.0000', '13650.0000', '1.0000', 'c7872300c0f43cd5d60611c086fcac5f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(242, '226', 'TAT213', 1, '21550.0000', '21550.0000', '1.0000', 'a0fe663a5f4269b637367778ed7aac43.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(243, '148', 'TAT135', 1, '13750.0000', '13750.0000', '1.0000', '7d4d6d60d0b047c9d0f7fa0b87dd6d29.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(244, '225', 'TAT212', 1, '21450.0000', '21450.0000', '1.0000', '7151ae8022da7969c8154dbb47cdcffd.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(245, '149', 'TAT136', 1, '13850.0000', '13850.0000', '1.0000', '882f89d7af3e3f207ce458c26338ebce.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(246, '224', 'TAT211', 1, '21350.0000', '21350.0000', '1.0000', '8137e3b2faa1d83022f22dea8a0686d9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(247, '150', 'TAT137', 1, '13950.0000', '13950.0000', '1.0000', '3efe5bb6b3c08b39107c9267d495b421.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(248, '223', 'TAT210', 1, '21250.0000', '21250.0000', '1.0000', '4fee88c883cbfec655ddf31ef6b99846.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(249, '222', 'TAT209', 1, '21150.0000', '21150.0000', '1.0000', 'd7c83b30a4f3b069ec355ccc6ac15b68.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(250, '151', 'TAT138', 1, '14050.0000', '14050.0000', '1.0000', '63a0d33920d29c4d85f9fad707363d9f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(251, '221', 'TAT208', 1, '21050.0000', '21050.0000', '1.0000', 'f2c02ac55397b56ae829ed976c49eed8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(252, '152', 'TAT139', 1, '14150.0000', '14150.0000', '1.0000', '5a47bb02353ffd291d839d8414a8f8ab.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(253, '220', 'TAT207', 1, '20950.0000', '20950.0000', '1.0000', 'fc742f7e498143a13129c3b6b5f28cea.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(254, '153', 'TAT140', 1, '14250.0000', '14250.0000', '1.0000', 'be4b6dd7ac7fc609336fc8686e1cdf68.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(255, '219', 'TAT206', 1, '20850.0000', '20850.0000', '1.0000', '5eeb97c3b7f9a898dfacfe2f90efca08.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(256, '154', 'TAT141', 1, '14350.0000', '14350.0000', '1.0000', 'f4ea0db56a59b0010e570f1964365ed2.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(257, '218', 'TAT205', 1, '20750.0000', '20750.0000', '1.0000', '318e073c9e0ceec57015b368423eee7c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(258, '155', 'TAT142', 1, '14450.0000', '14450.0000', '1.0000', 'c1592434084423836115467e692c30a7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(259, '217', 'TAT204', 1, '20650.0000', '20650.0000', '1.0000', '7ee53b5e9ff5bbeaa589ef6e6d5e0472.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(260, '216', 'TAT203', 1, '20550.0000', '20550.0000', '1.0000', '31d7fe10c0746b064b1e1cc474c49484.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(261, '156', 'TAT143', 1, '14550.0000', '14550.0000', '1.0000', '6b680195201c8249f5de7e2c6f12ff7a.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(262, '215', 'TAT202', 1, '20450.0000', '20450.0000', '1.0000', 'a97fb4d20bc0d5f64bd873f2039bce05.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(263, '157', 'TAT144', 1, '14650.0000', '14650.0000', '1.0000', 'c2f6578c7bd75043d5210018bb815513.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(264, '214', 'TAT201', 1, '20350.0000', '20350.0000', '1.0000', '648e308ac51669870e7ee6ea6b04e55f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(265, '158', 'TAT145', 1, '14750.0000', '14750.0000', '1.0000', '5435d09069858992349f6ec67d5703cd.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(266, '213', 'TAT200', 1, '20250.0000', '20250.0000', '1.0000', '096876e4210f9aedeb6479d7b2096c9d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(267, '159', 'TAT146', 1, '14850.0000', '14850.0000', '1.0000', 'fb40b08c3e2ca07d7d606fed4a0316c8.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(268, '160', 'TAT147', 1, '14950.0000', '14950.0000', '1.0000', '381060ba30a19bcb21985b72df7ce188.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(269, '161', 'TAT148', 1, '15050.0000', '15050.0000', '1.0000', 'e1c63ff3b2298679057155f5eb561c42.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(270, '211', 'TAT198', 1, '20050.0000', '20050.0000', '1.0000', '07387032a3b6636849d43fb11e30d784.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(271, '162', 'TAT149', 1, '15150.0000', '15150.0000', '1.0000', '1b9fbdf0764b720431fe9f04964f65e1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(272, '210', 'TAT197', 1, '19950.0000', '19950.0000', '1.0000', '52df1b347352d2851cc02389610c9ec7.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(273, '163', 'TAT150', 1, '15250.0000', '15250.0000', '1.0000', '38a90d97f63901350fb76a7acd27cf5d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(274, '209', 'TAT196', 1, '19850.0000', '19850.0000', '1.0000', '81b17daf8704e158fcfca95428cfb9ab.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(275, '208', 'TAT195', 1, '19750.0000', '19750.0000', '1.0000', '8f99eca5fbfbada0a25dc957bf9a3542.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(276, '164', 'TAT151', 1, '15350.0000', '15350.0000', '1.0000', '9b058ff825d280b4da59614e03336c63.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(277, '165', 'TAT152', 1, '15450.0000', '15450.0000', '1.0000', 'c97475cd023cfe2cc083304bc1a23456.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(278, '207', 'TAT194', 1, '19650.0000', '19650.0000', '1.0000', 'd1cafa4fa33420a961093e4636f3276d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(279, '166', 'TAT153', 1, '15550.0000', '15550.0000', '1.0000', 'a9b4d78211b547222aad501b88e2a6f2.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(280, '206', 'TAT193', 1, '19550.0000', '19550.0000', '1.0000', '39d74154b1cd61f655484569038e01bd.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(281, '205', 'TAT192', 1, '19450.0000', '19450.0000', '1.0000', '9c6b9de84cacbcf59ea86f61cf372fde.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(282, '167', 'TAT154', 1, '15650.0000', '15650.0000', '1.0000', 'c667feff3066dc13788495df5b61f963.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(283, '204', 'TAT191', 1, '19350.0000', '19350.0000', '1.0000', '388083f24cb05594ea267a9724adc6e3.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(284, '168', 'TAT155', 1, '15750.0000', '15750.0000', '1.0000', 'efe1e9011b4a1ca9c74eb5b8ad8740d2.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(285, '203', 'TAT190', 1, '19250.0000', '19250.0000', '1.0000', '0c9980d58c0a21180e22c6f58262f222.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(286, '169', 'TAT156', 1, '15850.0000', '15850.0000', '1.0000', '15baa5afc156b560e8ad69837c0da5cb.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(287, '202', 'TAT189', 1, '19150.0000', '19150.0000', '1.0000', 'd5c1b04eb4784ae47d166c89752988d1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(288, '170', 'TAT157', 1, '15950.0000', '15950.0000', '1.0000', '01a765c8d83585334396b35abd593d54.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(289, '201', 'TAT188', 1, '19050.0000', '19050.0000', '1.0000', '7aa82770b39ac4c0b2f19791143df540.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(290, '171', 'TAT158', 1, '16050.0000', '16050.0000', '1.0000', 'f22d2f358dfaedbd5891718e15b38f33.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(291, '200', 'TAT187', 1, '18950.0000', '18950.0000', '1.0000', '3006e2e4f693a2217861b959190b0974.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(292, '199', 'TAT186', 1, '18850.0000', '18850.0000', '1.0000', '978ab9a39c9cce684bdc5a5003fb00ab.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(293, '198', 'TAT185', 1, '18750.0000', '18750.0000', '1.0000', 'e758e4a5b95aca588b86b411bcbe20b5.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(294, '172', 'TAT159', 1, '16150.0000', '16150.0000', '1.0000', '2c3f5081e3f95571dc381abd0778414c.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(295, '197', 'TAT184', 1, '18650.0000', '18650.0000', '1.0000', '9bac7c453c3745115957e500cab46263.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(296, '196', 'TAT183', 1, '18550.0000', '18550.0000', '1.0000', 'e3e094abbfba551641f021dd9cd5259b.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(297, '195', 'TAT182', 1, '18450.0000', '18450.0000', '1.0000', 'cdf26586c98cc6f65aa0d61dc6717c1a.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(298, '173', 'TAT160', 1, '16250.0000', '16250.0000', '1.0000', 'f16384d678191c071afa202b79a8ffcc.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(299, '194', 'TAT181', 1, '18350.0000', '18350.0000', '1.0000', 'd250e8f7f74af0c8d52b94912a763fe9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(300, '174', 'TAT161', 1, '16350.0000', '16350.0000', '1.0000', '13fcab1d50590beef5afb22cbf17e6a5.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(301, '193', 'TAT180', 1, '18250.0000', '18250.0000', '1.0000', 'd94e7d87a492bcaada6a3c0ea025163d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(302, '175', 'TAT162', 1, '16450.0000', '16450.0000', '1.0000', '436e3cb6db8cbbbc27434e5f8292f5ee.png', 6, NULL, '', '', '', '', '', '', NULL, NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(303, '192', 'TAT179', 1, '18150.0000', '18150.0000', '1.0000', 'cb4ed868c15653694e1b80277397a84a.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(304, '191', 'TAT178', 1, '18050.0000', '18050.0000', '1.0000', '14eb85a4f4acf3048d5277d514dfb17d.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(305, '190', 'TAT177', 1, '17950.0000', '17950.0000', '1.0000', '76747d40e584e93a6d5a7e25b7542a80.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(306, '176', 'TAT163', 1, '16550.0000', '16550.0000', '1.0000', '924734050fd060819736d871c2964d2f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(307, '189', 'TAT176', 1, '17850.0000', '17850.0000', '1.0000', '1a0d2e126ac1a3b50344d93d8e7e51d9.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(308, '188', 'TAT175', 1, '17750.0000', '17750.0000', '1.0000', '2caa54ce05735832ea2deb727eb36a8f.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(309, '177', 'TAT164', 1, '16650.0000', '16650.0000', '1.0000', 'd5da34ca03894aae9b5c1a888870b556.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(310, '187', 'TAT174', 1, '17650.0000', '17650.0000', '1.0000', '80a562d7a37b122a088a9cd8318dcfa1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(311, '178', 'TAT165', 1, '16750.0000', '16750.0000', '1.0000', '1d587a095dbb5de48382895cdc9b71c1.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(312, '186', 'TAT173', 1, '17550.0000', '17550.0000', '1.0000', '5a2e35ac9ee4cc22c4d8154d473862bf.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(313, '185', 'TAT172', 1, '17450.0000', '17450.0000', '1.0000', '91979c6c39e46cd4b8bc1113547ab459.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(314, '179', 'TAT166', 1, '16850.0000', '16850.0000', '1.0000', '515f821003d6c31396eaaf5efe35c900.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1),
(315, '184', 'TAT171', 1, '17350.0000', '17350.0000', '1.0000', '3a6e30a79f179e0b3d16712415932979.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(316, '183', 'TAT170', 1, '17250.0000', '17250.0000', '1.0000', 'f6860aacd80dc57deecafd0c88928c69.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`) VALUES
(317, '180', 'TAT167', 1, '16950.0000', '16950.0000', '1.0000', 'cffc35bd27721b12e94391dc9a6b0ab6.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(318, '182', 'TAT169', 1, '17150.0000', '17150.0000', '1.0000', 'd3d58959a5de867c607bda24c2706de0.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(319, '181', 'TAT168', 1, '17050.0000', '17050.0000', '1.0000', '9e3018339aa1cfe1d5506851330d2249.png', 6, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(320, '312', 'LUNGI1', 1, '300.0000', '300.0000', '1.0000', '2637cc97f506d3d4184eeaab9a445786.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(321, '313', 'LUNGI2', 1, '350.0000', '350.0000', '1.0000', '5e4b06f6dd0ba5fbe22efe0574ce7352.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(322, '314', 'LUNGI3', 1, '400.0000', '400.0000', '1.0000', '1d34cc930916642aa5d0dbda0b2cf9ea.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(323, '315', 'LUNGI4', 1, '450.0000', '450.0000', '1.0000', '24b273447c2a34b164796e1e9e71cafc.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(324, '316', 'LUNGI5', 1, '500.0000', '500.0000', '1.0000', '971332dde3e910edd2de5b4fe5878d04.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(325, '317', 'LUNGI6', 1, '550.0000', '550.0000', '1.0000', '0b90e35fda2be8d48f2487833a0338fe.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(326, '318', 'LUNGI7', 1, '600.0000', '600.0000', '1.0000', '289b7fbfd5d8eb0e8309d214257aa6a8.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(327, '319', 'LUNGI8', 1, '650.0000', '650.0000', '1.0000', '4d29c2e017254b210b8a8af2d19cc08a.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(328, '320', 'LUNGI9', 1, '700.0000', '700.0000', '1.0000', '8e0d061dc686b5f02de35985844398b9.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(329, '321', 'LUNGI10', 1, '750.0000', '750.0000', '1.0000', 'cbcdd998416becd068db84b83eb8c8f8.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(330, '322', 'LUNGI11', 1, '800.0000', '800.0000', '1.0000', 'bd9d83fea38bc1373afcf9a1a69328a3.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(331, '323', 'LUNGI12', 1, '850.0000', '850.0000', '1.0000', '1311ca7edff7dc5e00c5bca1b09ddcbc.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(332, '324', 'LUNGI13', 1, '900.0000', '900.0000', '1.0000', 'a773cfcf3aa061d1459bcf1c6d9b2dd2.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(333, '325', 'LUNGI14', 1, '950.0000', '950.0000', '1.0000', 'd13f10f85e3c6d17b139658aa351cc1d.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(334, '326', 'LUNGI15', 1, '1000.0000', '1000.0000', '1.0000', '1905efa9d1596b6f45fd2c204ecc95cd.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(335, '327', 'LUNGI16', 1, '1050.0000', '1050.0000', '1.0000', '4340f196a80590cd3fa19df459cef73d.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(336, '328', 'LUNGI17', 1, '1100.0000', '1100.0000', '1.0000', '68f331ac89fba9aa32b092d9a4e51fcc.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(337, '329', 'LUNGI18', 1, '1150.0000', '1150.0000', '1.0000', '3a1ce248b44ef5ccdc04f21d0ad3a3e5.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(338, '330', 'LUNGI19', 1, '1200.0000', '1200.0000', '1.0000', '12f60614b94439a5753f7a97b5a69bce.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(339, '331', 'LUNGI20', 1, '1250.0000', '1250.0000', '1.0000', '7acdfecd6c72e86e929d6b1a7a9152b5.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(340, '332', 'LUNGI21', 1, '1300.0000', '1300.0000', '1.0000', '67acabb11c6110a2a5a73fc6861fc454.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(341, '333', 'LUNGI22', 1, '1350.0000', '1350.0000', '1.0000', '9af3a0f66c1c436762a64154896a25c2.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(342, '334', 'LUNGI23', 1, '1400.0000', '1400.0000', '1.0000', '956bbd63e1c567fa341d2d2c345a15a0.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(343, '335', 'LUNGI24', 1, '1450.0000', '1450.0000', '1.0000', 'cf93b5265071cb1be45d57bcde32a95c.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(344, '336', 'LUNGI25', 1, '1500.0000', '1500.0000', '1.0000', 'f2d06f34f1f969d4a484e472f4d3b3cc.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(345, '337', 'LUNGI26', 1, '1550.0000', '1550.0000', '1.0000', '01e95db6ba84f88c0ab85355de52ca63.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(346, '338', 'LUNGI27', 1, '1600.0000', '1600.0000', '1.0000', 'cd7892cf5856082e86766551b85e1d56.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(347, '339', 'LUNGI28', 1, '1650.0000', '1650.0000', '1.0000', '41fe13c9ac754ce74b6e9a5674cb8f13.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(348, '340', 'LUNGI29', 1, '1700.0000', '1700.0000', '1.0000', 'c270d07532e7a068310da5dd45702684.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(349, '341', 'LUNGI30', 1, '1750.0000', '1750.0000', '1.0000', '8ac447782bb23033e0408f1c7a54a850.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(350, '342', 'LUNGI31', 1, '1800.0000', '1800.0000', '1.0000', 'dc0d0c4f66ee5ee5fb8f52ca26ccbd4d.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(351, '343', 'LUNGI32', 1, '1850.0000', '1850.0000', '1.0000', '61651888092cb0db03f2eacf6dbbea2b.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(352, '344', 'LUNGI33', 1, '1900.0000', '1900.0000', '1.0000', 'b7d758cee35d1abfba20361a62bfb04a.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(353, '345', 'LUNGI34', 1, '1950.0000', '1950.0000', '1.0000', '2caf585ee0f69c071b701e244ce27375.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(354, '346', 'LUNGI35', 1, '2000.0000', '2000.0000', '1.0000', '21577c0cfa21ff2182911f35b7755839.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1),
(355, '347', 'LUNGI36', 1, '2050.0000', '2050.0000', '1.0000', 'c8b685ec192a536a45082e4d5cd04b36.png', 7, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1);

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
(25, 25, '987a5134add09cdd1c30870d55b1db16.png'),
(26, 26, '5612601db65e5de7757ca3b5c3c46638.png'),
(27, 27, 'e079cec2031c54a21ab65126c561f8a4.png'),
(28, 28, '35961e6092f34ef419055fcf97c1f1d6.png'),
(29, 29, 'd43d3074e28c7e8499597bbbb7f12cbd.png'),
(30, 30, '835700d9c20d6cb63125e30401f41a77.png'),
(31, 31, 'bfa3935e796c33fe43ae06283794290b.png'),
(32, 32, '8d31bbe9b3df204bfacf20aa950c6be0.png'),
(33, 33, 'e7a6f78d2ae20a60384f54ee4dccdbac.png'),
(34, 34, '105b23d00508b788c503201564b4f00a.png'),
(35, 35, '88806666c494831ee18b8eb9154a2bf9.png'),
(36, 36, 'f02dd23af82e811777fb12711048d3c0.png'),
(37, 37, '40655630592b4fa49d9bc242a9c04df3.png'),
(38, 38, 'a661be2e0614aa18a9ce1ca7dc93193c.png'),
(39, 39, '87f39a15d4ad6b09bf1623a40539b4b0.png'),
(40, 41, 'db4edfacd370dbf932d81d25833387e5.png'),
(41, 42, '462494ace6bca3b0bea3cf7155cfdf19.png'),
(42, 43, 'a19dd3a14208a419514b31c19b33182a.png'),
(43, 44, '1034b5988fdfbe58050914ff6f4143c5.png'),
(44, 45, 'a211169ee787f8d00e7e647d5a7d9989.png'),
(45, 46, 'f85b49637b9b564e2324765fe517d0b1.png'),
(46, 47, '748976338fc18df4a2984be8837f6aff.png'),
(47, 48, '0efdc428cd7f9b14e554cdabfe65f8ee.png'),
(48, 49, 'd4d4516c24554cc8e0675c1a02004981.png'),
(49, 50, '1d23c04e7f09f387f3cd1232e86c985a.png'),
(50, 51, 'c2b8a96c909d2768bbff833747deef51.png'),
(51, 52, '24cbc080e833fc028af3be19c17b88b4.png'),
(52, 53, '2ba56ac2839eb938438aa33a7f7c9345.png'),
(53, 54, '64aa0e313337aa942769df46dc50538b.png'),
(54, 55, '0707eb36a844722e518ecac7c76390a7.png'),
(55, 40, '8005e42dd8c27194dab7acb68010909a.png'),
(56, 56, '74bc5e9eb6d8f319838af20f97be81cc.png'),
(57, 57, '6b71ecd6a06e0415a9f598273494d89c.png'),
(58, 59, '9195f8126b46f9c7e8adb1b2dc3a0f35.png'),
(59, 60, '31402ced22de5fc32cf84c9404070819.png'),
(60, 61, '261365cbf3f5a110a1af59215ba589d4.png'),
(61, 62, '8d336cf0be9553c676f71cb7454b15e5.png'),
(62, 63, '9095bb4173d1b61425156e9f7f8da31f.png'),
(63, 64, '6bcbe77d28eb45344e65cefb10a4e70a.png'),
(64, 65, '05aebc46197479229ba455298a2c5bcc.png'),
(65, 66, '625a5fcf135310eab5c8eb661b325122.png'),
(66, 67, '03660cb93076c1e7e34e49d67f926d94.png'),
(67, 68, '65e6d58e4beac4e9ce2c33710eb58516.png'),
(68, 69, '0734c6f1138192fc4301e7cccc189625.png'),
(69, 70, '6fc85de418e8f045c36aa64529efda8f.png'),
(70, 71, '353a9f15152067635dc1a8fc23588eaf.png'),
(71, 72, '8cdc4d03a1d8dc159aaec080193f05d2.png'),
(72, 73, '03c6ae52a2390e8f247ac25056547b7a.png'),
(73, 74, '014f1f871adfd453cb0d3054730808ec.png'),
(74, 75, '3be38eea27ceb6aea4f11b4ffab5bc84.png'),
(75, 76, '3aeb5467ab2a1febde24f445dec4fa27.png'),
(76, 77, '43918dc6997c774820ea40bce37ebbc7.png'),
(77, 78, '24e3d72961631ccca44b48f61895cf3b.png'),
(78, 79, '0f167a03d4f1b8392d8736d5769e1ab4.png'),
(79, 80, 'b566056593ec1e4b772278fc4214e8dd.png'),
(80, 81, '7c08ac501fd8eebc49f6a6e0144894ec.png'),
(81, 82, '0cb155914f1bde32e975c90ffc97bf6f.png'),
(82, 83, '9f63cfa1f458daa59d3840de1d901e25.png'),
(83, 84, '39b804af697a491a52d6f99b47fb73c4.png'),
(84, 85, '005d601bd5e0949d35f8d128029ca45e.png'),
(85, 86, '38a9cea84667d2a5bfd73eb502d742e4.png'),
(86, 87, '4d75f044abc44c8fa7a2aec6f75f2ecc.png'),
(87, 88, '6f906e53e4ef266210bef3941205fb20.png'),
(88, 89, '16f0bebd2c4677a38fe1e04658e71113.png'),
(89, 90, 'fbc36c22cf4efac786ff9bbb3f4c4f5a.png'),
(90, 91, '879958eab7b70c0a333bab51acf393b5.png'),
(91, 92, '8a913cf6e7839e1d9a5c26511b509260.png'),
(92, 93, '30e37823d09d2e93469936d19f64ecec.png'),
(93, 94, 'a6c6d73c540e83951572d2730be0d834.png'),
(94, 95, 'ed70bc066dbeb0aa97e3e0ac32444402.png'),
(95, 96, 'da450532365c9643f9c7ae03e4fafc83.png'),
(96, 97, 'fee3d90f78d7e1685e606ea65382252e.png'),
(97, 98, 'fdf503df710f03d6bfc162bd03e0a6bc.png'),
(98, 99, 'e099beef52aa28aa37e3d4993261cc41.png'),
(99, 100, '7cfdb2c32c4f4110705759bc0cac2edd.png'),
(100, 101, '25258376a70ae556e07ea86ce525f570.png'),
(101, 102, 'cc7233a675587aa735de17e7e247588f.png'),
(102, 103, 'b54fc07b564e4fc8eaf4a9e81b01e4f3.png'),
(103, 104, 'f88204c3356a9de63155ddeef738521e.png'),
(104, 105, 'b20131c013733864b45b2aba606f45a8.png'),
(105, 106, '46fdac351cd84d34e2e80fcaeeffd62a.png'),
(106, 107, '8e9725a773f19458d8cdcd4ee4cfd49b.png'),
(107, 108, '2f65ed46c0bec1bccf5aa7e07c887f24.png'),
(108, 109, '9a60006120daafa8b931d99143cccd84.png'),
(109, 110, 'a4eefa500b70e8816411b73cf0d97258.png'),
(110, 111, '72dda53ce434970367deac6dc585a82c.png'),
(111, 112, 'dc90544c933276065032405bc91512c4.png'),
(112, 113, 'dd340536061a21e123c932956c7a43b9.png'),
(113, 114, '3bd2b4155ca8e01f971073239dd77b0c.png'),
(114, 115, '477456f6eb26b21394547895cd6d5985.png'),
(115, 116, 'b486da6d8b80856c17bf626a9183ca6c.png'),
(116, 117, '1b1b977ba7ff5ffa0269163a6227ea29.png'),
(117, 118, 'c26b8bd3d070724d77e948861bbd5117.png'),
(118, 119, '640df2801c1f2e4f592430334bf5b115.png'),
(119, 120, 'af3b2680cca977819339cb45b50181ab.png'),
(120, 121, 'a18b9d6c25c61a812486938dd16ca109.png'),
(121, 122, '590bd5027d1eedde4a58f2ea703e600a.png'),
(122, 123, '6d39258445fb70249fd22754994882e5.png'),
(123, 124, '7e1aa75b33ce3d500c82d400aeb118c6.png'),
(124, 125, '0a96eec11c4eb48c8feb8b6f7dcbc52e.png'),
(125, 126, 'c3ef55926b87dd5eb72b90a53250109e.png'),
(126, 127, '241d0fa5e1682c328c11afcb65be5144.png'),
(127, 128, '51f933745789b90a1940d69eb82c0169.png'),
(128, 129, 'b2641dc50d64689c18d0defe0af02817.png'),
(129, 130, '6ae1beb998d95e787477b7c89565689f.png'),
(130, 131, '17972a882a020bf9e145b8ca705a5fe4.png'),
(131, 132, '25d0e01f8aa3407bd8e94b9a5e9346d4.png'),
(132, 133, '29d02636696563fbde5d2ca9be05f893.png'),
(133, 134, 'cb5597356df0e51f5ab2168c46b8197b.png'),
(134, 135, '75eefa8dd3ee39981aba98d4086578c1.png'),
(135, 136, '6367e0388197251fc5a393daad12e6f4.png'),
(136, 137, 'bd63dfbe7ff28628d3a60c6976687b70.png'),
(137, 138, '4e0381805a2866f5241985aa78d2e604.png'),
(138, 139, 'bd1c6489c4572b7a000a414cd32f22ee.png'),
(139, 140, '1d315271c593a7662e7275bce532450b.png'),
(140, 141, 'e3e86195b76fd9a410982ef8a6466355.png'),
(141, 143, 'f6f67c7843ff5ed7cb4f1f9ac1d09a15.png'),
(142, 144, '282c15081daf9b9db1b16a57453142c2.png'),
(143, 145, '0b863eb6071fb15f036a260d18674a71.png'),
(144, 146, '87a6c49518e62e9580eda2e649c73e41.png'),
(145, 147, '6f3818b5eceedd8e5a4829e8815bf4a2.png'),
(146, 148, '4ea6dcd6faf4cbc7d97cd63cbd2e1348.png'),
(147, 149, 'd644cc51025b0f912c36d9afbc7bae91.png'),
(148, 150, '7483c4ba62e81de4072afd5716460434.png'),
(149, 151, '4d1f06992b3866d7977f80b2cb518c7d.png'),
(150, 152, 'b2da0f08ef2ea993b9e1e89cc87f4c3a.png'),
(151, 153, '6af0b8b651077cdcd8c3a01ee2ba1ce7.png'),
(152, 154, 'e91544bfe1ac1958dacbaed5a853e507.png'),
(153, 155, 'd3da876d96d435bd10c4662d0d655ac7.png'),
(154, 156, '334a368194c6276a72a48361d1c0ce34.png'),
(155, 157, '70be5ccccba1c8a0fdd7ce4e12d82646.png'),
(156, 158, 'c82963fa2c9e9396579daf8de6a59b79.png'),
(157, 159, 'cfb5ea595d9c822d8f9676433233536a.png'),
(158, 160, '8397a25b3c52de562bd193025daa00bd.png'),
(159, 161, 'eb38f54040e15ad0c0e44c34de4923a3.png'),
(160, 162, '132dcf00ca740f3dd6b83b5cdc6d3e4a.png'),
(161, 163, '4a31f4407995ed6caba746845e246830.png'),
(162, 164, 'aab51a17f36f2f10b0540e3f588a9859.png'),
(163, 165, '39a0b62045a610ea9e6cb70b4e8655b2.png'),
(164, 166, '7a26c127d31ba56b7b301f77f32a63e1.png'),
(165, 167, 'd51d0dc3c7317103c98e704d89bb401a.png'),
(166, 168, '614ff5d0099f92df3f6849647595852a.png'),
(167, 169, '3c2f762743549775b0909ed2b50a4038.png'),
(168, 170, '650dc4ac4b3d4d5aa840541382d28ea9.png'),
(169, 171, 'aa4721b97c1de568f4ecf538ffb8b6df.png'),
(170, 172, 'ea802e71845862e51496737c91457120.png'),
(171, 173, 'e09d112a0000dc052edf23f0e920c482.png'),
(172, 174, '2200e3016db5a28480691a3173185976.png'),
(173, 175, 'e3d44f82b10c0b8fec3b578127c149bc.png'),
(174, 176, '5335e9fc5d157619519277624b917f33.png'),
(175, 177, 'ebb85b33a098b7129e85491d7069aa13.png'),
(176, 178, 'c73b20be5ddb9c801f1c5accd11bba9c.png'),
(177, 179, '3988d8bdfec5a924e9771b52236c049b.png'),
(178, 180, 'e7d7d576e6b15c7afe6d75a626e9e9e8.png'),
(179, 181, '48c33f1a5ac2cd1e582d7b000115c1ee.png'),
(180, 182, '9f07c2b92db19a0c97314c838a70a74d.png'),
(181, 183, 'a519cd37d6cf3d050c57869bf33f258d.png'),
(182, 184, '5b1a66d593d152e1ac29a8d715bf5660.png'),
(183, 185, '1472cbd275053c6ceb90e800be15e1ed.png'),
(184, 186, '54060d47633b64aac7d75f8d5603227a.png'),
(185, 187, 'a9f47721fe345244a56d0cdec2f22130.png'),
(186, 188, 'f11a136b2f26148dfa059fae899fb596.png'),
(187, 189, '7fe24abe4538721c923990b0fe6262e7.png'),
(188, 190, '244a352ff2c2d0467ba64dd4d8687ecb.png'),
(189, 191, '849999346ddf29817a9cf0b98a952c80.png'),
(190, 192, 'c981dcf57b002d094bac191ff545f554.png'),
(191, 193, '3d540a2b4670a636b2541aa0835551a0.png'),
(192, 194, '869b7a3bf9944f2ad9f3db754569b805.png'),
(193, 195, '802def0e92a2cc4ffcaa97235049b954.png'),
(194, 196, 'e1886f098c63d1342fa33c282e2ece08.png'),
(195, 197, 'bd6695eb824c2d7997c26a6cc04941f0.png'),
(196, 198, 'e0cf39f057ee14118553d1094a815fbb.png'),
(197, 199, '88e1df520b743b549cbddbcd4f712da2.png'),
(198, 200, 'c2acb941a88387b40fd7dadc5fbc1009.png'),
(199, 201, 'bdbe05c1df7ac03307f4b429a0971b6c.png'),
(200, 202, '77f1d965e699d4ca3e016d80e75f4ddc.png'),
(201, 203, '519c54f5f5fc28fadde5cd6c20721a01.png'),
(202, 204, '1a86f7a9da07ea5d85c6e407260b91b9.png'),
(203, 205, 'd586a12ce4b705ae49022e4c49a2d6c9.png'),
(204, 206, 'fa55b4e25560f92e953d9b9b2f8c5a22.png'),
(205, 207, 'd8137955bc5d92147a22529a7469b967.png'),
(206, 208, '1e0b6d8d3ea610d5c2da5804a723ec3a.png'),
(207, 209, '28f53760623ee41a06a7fb41f065ae7f.png'),
(208, 210, 'a315ec617e303209183dfe4307706f8c.png'),
(209, 211, 'ff457e4942489bec8aa5c897a9ace3a6.png'),
(210, 212, '21d3f55f69eb2c1656783d06cda4720b.png'),
(211, 213, '9dac319e5061ae8d02b428e4edbf8259.png'),
(212, 214, '58a4bd05b6fc0741fc1e01a71fd662cf.png'),
(213, 215, 'fdadce341b306155e2e2d3f218652784.png'),
(214, 216, '7b456f789591b48c8486cba11a4d1e91.png'),
(215, 217, 'f462d98500ccbd7f21aae7ee8ea2f982.png'),
(216, 218, 'a1307cdd8e6ee3bb30f54ceca73bd61a.png'),
(217, 219, 'bbd08e6507bd573dc16fec5926861871.png'),
(218, 220, '634aa205e55d4ee0a141bc1aee52e7eb.png'),
(219, 221, '1efe42cfa04bbe5098b414efc292642d.png'),
(220, 222, 'a0df81eafe7843927e681f1c33c4f261.png'),
(221, 223, '73a0a3467ee788b2a664c5d09b6875cc.png'),
(222, 224, 'bacfc0106cba6ba3199a225e01fae8ec.png'),
(223, 225, 'ba291723bab35bf8057d4f31ffaf8269.png'),
(224, 226, '5534fabd71ab42db099d9b0326bb0668.png'),
(225, 227, '0db1ed82a8dddc42e666c2e2f569127c.png'),
(226, 228, '203f47ca8ced725f3c3699397638597e.png'),
(227, 229, '509a59827c907a87199456bbbd175e10.png'),
(228, 230, 'ba69f989f78b19d8adf35582f3572fcb.png'),
(229, 231, '8482cdca096ece45f2645e5408e240e3.png'),
(230, 232, '0eb976d64e4b7b803da155894e2cfc35.png'),
(231, 233, '0a5edcdd42553d3a4e0d7502d5d85894.png'),
(232, 234, '8ddf58d9b6d4516bbcd27eeabf5ab121.png'),
(233, 235, '4c761b521d5a6e17e197247e9f15eb79.png'),
(234, 236, '9890c18bde46e7abc45d7ce2c0f1b325.png'),
(235, 237, '508c48c5b99c60b59cdc80e984beae2a.png'),
(236, 238, 'a71e5b04ea31d25be6dd087356819f6e.png'),
(237, 239, 'd3e0426ae260d1ffbf583643c5948440.png'),
(238, 240, 'f8967bd01ac8dbdf31922847b1169c22.png'),
(239, 241, '82e1018cb48789424e484cfff5c7c425.png'),
(240, 242, 'b45ede2aed58605316610d64cc4a3ebe.png'),
(241, 243, 'a34dc54760d02dbb3d728db49117a707.png'),
(242, 244, 'c2088c12e033f300e0be4ae877b5ddcb.png'),
(243, 245, '3c812901ec4a2034726537c9d6dc6a0e.png'),
(244, 246, '0a4c6c5d6421984bf1f402a6ff27cf42.png'),
(245, 247, 'c6fbd7b9a3af916249c824a3b5c05548.png'),
(246, 248, 'fa0b2ba0ef4a47b4d42d479a0eb78b9b.png'),
(247, 249, 'ba320dabd77421514b013150934e61c3.png'),
(248, 250, 'be1f558776ce07b0179edd25e8d14362.png'),
(249, 251, '84b869dcea6cee82a56539712e39c945.png'),
(250, 252, '8c09aa0ad9e844911f792a7033a19f6b.png'),
(251, 253, '69c4ada32c2bda13c24b10317a48b1ec.png'),
(252, 254, '5c0f9acb2b83de21f0eb53f7031dae2d.png'),
(253, 255, 'd768b0c309d2d1724e3214a497d321fa.png'),
(254, 256, '53d2d18c1ba0ced9132dc1f6b9eb0a3a.png'),
(255, 257, 'e563853d57bb75a7c85baed4f1904666.png'),
(256, 258, 'e84e62e7d588d83be9f8ffb0c434a24a.png'),
(257, 259, '68c0f601c32a6a81da51f9ce56a63526.png'),
(258, 260, 'a04ee2438e840d124f23168356ff3e06.png'),
(259, 261, 'da6a1c2dab0c8ed61ba4c18d4267279c.png'),
(260, 262, '0bb495ad10f061fe0637aa4d27859942.png'),
(261, 263, 'c1571ffa6235a9ac447c6a8bda13a1f7.png'),
(262, 264, 'c1612d9df26521fe2a7e22e98032361f.png'),
(263, 265, '3852be5e34f8b2d04889d99e5fa82427.png'),
(264, 266, '9994aea6a5f542de37037756522cf164.png'),
(265, 267, 'ee628c90af75163f4ab957c4f6b7171a.png'),
(266, 268, 'b77e14537fb44a9e2061212d56860766.png'),
(267, 269, 'f33e8c4ce4565e4205dbd73998bd6ea5.png'),
(268, 270, '67de65725674fb9f000ba01d142b2198.png'),
(269, 271, 'dfc97463f1b01a65b0cbff593208e4a2.png'),
(270, 272, 'a007f82bfb7c9b2229cc32732c94f30b.png'),
(271, 273, '94a42c5a025d354e3caa3bf2d523ad5e.png'),
(272, 274, '350b8ae6a3562c784524f4c33b76c76b.png'),
(273, 275, '6084335e3f2692c25859e4baa73b07b3.png'),
(274, 276, 'f42c62851e24c8d730d0c684200cd128.png'),
(275, 277, '3a28a622d9a1b77f52dc3b876b2f9cb0.png'),
(276, 278, '6620e6ed138a75764bdb5bab80657b92.png'),
(277, 279, 'eb8bfc51aa4376b778ed1159a6a531fc.png'),
(278, 280, 'efa383cd6e755421824be22d8a5cc83c.png'),
(279, 281, 'fda97fe59721cfbba54de2005963142e.png'),
(280, 282, 'ee23435359e7986f6f24a84a2b25a7fc.png'),
(281, 283, '3aca2215a0cff4b6815b6be7e6b7412c.png'),
(282, 284, '03629c39381c789ab52eaa3cc8ad1133.png'),
(283, 285, '414e4a68df1bfb19fce6797bff7c6ea3.png'),
(284, 286, '7f382ee33c91756118c6bccb5e6c03fc.png'),
(285, 287, '4accec49311ccca04d0d013e7a6e4526.png'),
(286, 288, 'd2447d6c04f499a7559c87b6e438b630.png'),
(287, 289, 'a8e60b3800a86302cb7798e48af9dd40.png'),
(288, 290, '52226274c0e95d963fd5416ebc0a2f99.png'),
(289, 291, 'ab02cf53ccc81ce94a48e11882abd7c3.png'),
(290, 292, '69f42fd03b157a25276beb15ffdc1bfd.png'),
(291, 293, '792b79942a619ce379515ca2bba1c112.png'),
(292, 294, 'd98f99fd95b6b5cc7afad3cf3d44b2ba.png'),
(293, 295, '4e15b7861e1eb7440be954e72b67fc57.png'),
(294, 296, '4b7cddb0251b3a9b1425aac78a93ccc3.png'),
(295, 297, 'cb020259f72d83040f5fbf1a018f33f8.png'),
(296, 298, 'f155dee8c6c4a2558ac96948146da3b7.png'),
(297, 299, 'e5977f0abe0b31661490a277f6001424.png'),
(298, 300, '8d6b4a0961d218678961ca92affb46c7.png'),
(299, 301, '5c8609228d4cca3c1b6dcc99f5b771e1.png'),
(300, 303, '947d91e8aa8abf50b180af6c0b46c198.png'),
(301, 304, 'dbd1f0276a7e563cc50884b4a13ea5d4.png'),
(302, 305, '7f3acd1f0e0a6f8668f5a099c8c6b6be.png'),
(303, 306, '2cc0f8d19e7a1689838441d92df9a24c.png'),
(304, 307, 'e04f5692d1f929f9fc8d24e5cf330b5e.png'),
(305, 308, '9d9395d88d48a68680a876890fd788fd.png'),
(306, 309, '652bd9aedebf679b3a8b49a232d53e81.png'),
(307, 310, '9b8f59ba2a7d225b4664d1a9acc19a75.png'),
(308, 311, '3058d32088539aff49a5d21e3ac3644a.png'),
(309, 312, 'b91f958db9f9d5ca3d411fab58cf11bf.png'),
(310, 313, '36f55e3fd6c7945cbcc637032c381f79.png'),
(311, 314, 'a2876d40c9d4991803ee0b163e31d38d.png'),
(312, 315, '81e4dbfd07c309317ceab98823c61224.png'),
(313, 316, 'a0577a585c760ef65cd2e4ef3a811758.png'),
(314, 317, '30dcecb99987804c255ef0ffd77c6f5b.png'),
(315, 318, 'ce9803d33565e5b11188af5d3b3ed10c.png'),
(316, 319, 'c04fbcadfc01e3e18f13ac9002d260de.png'),
(317, 302, 'e8f056af44baee0f4ba393849ca7884c.png'),
(318, 142, '88c6297a1a739db20b25043e93481103.png'),
(319, 58, 'f376b10b5dc7b16f4d18b41f6c329e7d.png'),
(320, 320, 'e73798cd9c69a9429be14fa4ada72e2d.png'),
(321, 321, '7f3ecc6e66ff30ab5d428a7cc0667ac9.png'),
(322, 322, '2d211e2460dddf8658c0801cf10dd8dc.png'),
(323, 323, '178c2244e1ac5d284052501a904338b2.png'),
(324, 324, 'e8f0a8ead49abcf0246cd2465f1c6124.png'),
(325, 325, 'b10d65e001762bffa6e08e48ce635766.png'),
(326, 326, 'e0aed59bc2b63faec85ea6b220474ea4.png'),
(327, 327, '7ce6001956a8040c7c0026f2ce41862e.png'),
(328, 328, '93479b7cf806c42e100bc9d65e6e8786.png'),
(329, 329, '49a1663ee09666ceb473322426ca6b47.png'),
(330, 330, 'd72c8e7a6c8e69cd1078738055abd37d.png'),
(331, 331, 'cb5ab11d6f128879176e80637b663e49.png'),
(332, 332, '0b75bcc0f4a4b002582820b0e9e9325c.png'),
(333, 333, '8e2edcf6ebb33753d99b9a459b079ce3.png'),
(334, 334, 'b02f06630017bdc3dbce009a5cad2cb0.png'),
(335, 335, 'aa9fc1c66003caaa4f7541504ba53303.png'),
(336, 336, '41768b00ee6df8d262eb6ada422c5491.png'),
(337, 337, 'c20293e4c90df4d66a8765985ec9181e.png'),
(338, 338, '48e51deff22af1128cceb27e989939c4.png'),
(339, 339, '3995bff5162824ebbd9c95cad6e3650d.png'),
(340, 340, '15eabe7833d7729946c6dcfded2f03aa.png'),
(341, 341, '438bbf57600366ed63e1beb1dcae6449.png'),
(342, 342, 'd0824bc465b05760405876855ec9c092.png'),
(343, 343, '1eb29b3c21fff264c1333d1694ec57ff.png'),
(344, 344, '31f9f4634bedff1e56a058086ed9eee7.png'),
(345, 345, '5bd3d9f567ae261db46e1de07abe587a.png'),
(346, 346, 'e76497fb5f96c290c7f8162f2625689c.png'),
(347, 347, '56f108309a942a041a162bab7555570c.png'),
(348, 348, '80965ccbab82d37df72acc327fe06fef.png'),
(349, 349, '24b5a51c79a4979781c2f2c111fa1af7.png'),
(350, 350, '1708b9f99c29d57040a735ffb7f1d13f.png'),
(351, 351, '18cc9f844b2326e18b9f5ffdad813f29.png'),
(352, 352, '0e843d94f4c63caf2da2076379cf041d.png'),
(353, 353, '779bf14c4fa2f67247249910241f4790.png'),
(354, 354, 'f11eede6565fcc49e31fa84a51a6c2b7.png'),
(355, 355, '8a622271f31df8e04fb68a47eac24bfa.png');

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
(16, NULL, NULL, 25, '16', 'TAT3', NULL, '550.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '275000.0000', '500.0000', '2018-01-28', 'received', '550.0000', '550.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(17, NULL, NULL, 26, '17', 'TAT4', NULL, '650.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '325000.0000', '500.0000', '2018-01-29', 'received', '650.0000', '650.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(18, NULL, NULL, 27, '18', 'TAT5', NULL, '750.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '375000.0000', '500.0000', '2018-01-29', 'received', '750.0000', '750.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(19, NULL, NULL, 28, '19', 'TAT6', NULL, '850.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '425000.0000', '500.0000', '2018-01-29', 'received', '850.0000', '850.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(20, NULL, NULL, 29, '20', 'TAT7', NULL, '950.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '475000.0000', '500.0000', '2018-01-29', 'received', '950.0000', '950.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(21, NULL, NULL, 30, '21', 'TAT8', NULL, '1050.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '525000.0000', '500.0000', '2018-01-29', 'received', '1050.0000', '1050.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(22, NULL, NULL, 31, '22', 'TAT9', NULL, '1150.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '575000.0000', '500.0000', '2018-01-29', 'received', '1150.0000', '1150.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(23, NULL, NULL, 32, '23', 'TAT10', NULL, '1250.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '625000.0000', '500.0000', '2018-01-29', 'received', '1250.0000', '1250.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(24, NULL, NULL, 33, '24', 'TAT11', NULL, '1350.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '675000.0000', '500.0000', '2018-01-29', 'received', '1350.0000', '1350.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(25, NULL, NULL, 34, '25', 'TAT12', NULL, '1450.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '725000.0000', '500.0000', '2018-01-29', 'received', '1450.0000', '1450.0000', NULL, NULL, NULL, NULL, NULL, '0.0000'),
(26, NULL, NULL, 36, '27', 'TAT14', NULL, '1650.0000', '500.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '825000.0000', '500.0000', '2018-01-29', 'received', '1650.0000', '1650.0000', NULL, NULL, NULL, NULL, NULL, '0.0000');

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
('00a36555ba3901487a67c1fbe2475bec5dc02c1d', '192.168.1.106', 1517227552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232373430363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('00bd11e7f584df5cab3f5989f6bd43c17c5a902e', '192.168.1.100', 1517229286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383937363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('06c574509995cfb768d4a13cd2db3c4a13c59a22', '192.168.1.100', 1517230231, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232393933353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('0d15ee1363325421e6c3c7cb80d461415fc511f3', '192.168.1.100', 1517229923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232393631333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1ef677b29118cc261d2b641b880a1b28c719b2b4', '192.168.1.100', 1517228969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383635363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('29a4f8dbd3d596c0384658534dbe3c88b3d7b913', '192.168.1.106', 1517306984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330363638393b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2a41a2e25baa5a217b6548fc7fb81fa7bc1510ba', '192.168.1.106', 1517309522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330393435333b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373330393339323b),
('2a65f629e84156008aaac092eae649f7ad070479', '192.168.1.106', 1517228091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232373736393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2d20379e8b539473b55424658f99e441341112eb', '192.168.1.100', 1517228326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383031353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2e97189be0c0d7212b8649ee449b26ca330f9bd8', '192.168.1.106', 1517231430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233313131353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('329938c8893813f8847bef96132a775c18f780f5', '192.168.1.106', 1517231786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233313737363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('36669bc16dcbdfe0aa92dc813fa807fd531b20bd', '192.168.1.106', 1517305742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330353432353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('3c489dae2257b7ab6d44baa6844a55c4e5deaa73', '192.168.1.106', 1517230411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233303038373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('42fc2d8e56b34712fd32b3e60b0d5c9f71344bcc', '192.168.1.106', 1517231020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233303734393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('440471c09ac2b4397f646e0cb5eca978ab9c1c87', '192.168.1.106', 1517306056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330353735363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a32363a2250726f64756374207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('4853dc73fd70f9c564447aec29c383852c756a07', '192.168.1.100', 1517230837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233303534313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('50f12e98fa30cdf6bf924dfd395043150860a833', '192.168.1.106', 1517229654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232393339393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('52310d4ed4007f6670ea32b21072ef4fe679f0ec', '192.168.1.106', 1517225187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232343938313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5394ff8ae92ef2523627fcf4e25658a7b921210d', '192.168.1.106', 1517228701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383430333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('575ddb41d780b28925c54c9bb262f2b470ae438f', '192.168.1.106', 1517228386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383130313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('586d7b21f96d1a0b0d71614677d2cba55ec42281', '192.168.1.106', 1517229389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232393036373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('631ea768975ffb42f1de69b0983a6816d91f71f0', '192.168.1.106', 1517223926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232333632343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('661a782ffdf39110c8ea51f5ba9659e5fe862940', '192.168.1.100', 1517224754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232343537303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('6aa57f37f70fb1c319d3f1dfd2a7d8b685b639e5', '192.168.1.100', 1517228003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232373639303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7021f1090f3afdfd75ea6dee5289e10d6a8504ea', '192.168.1.106', 1517229054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383731343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7a3a574831319336444894c654dcf436a2b6c246', '192.168.1.106', 1517230005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232393730383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('84a33d7a9eeb317af312a9cb29cdaa2537d14525', '192.168.1.106', 1517305404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330353131373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8892b5658778632852f46bc818f95a7da3c8e5d5', '192.168.1.106', 1517224269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232333932393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('8d9de5f3e0396401000a6b0d94744e38854a095d', '192.168.1.106', 1517308453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330383331323b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('92b374d9b83bfef6f640163848c896a50e8d51da', '192.168.1.100', 1517224423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232343139383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('944e007239103b6a4063164fa54eebd3c9fa78d0', '192.168.1.106', 1517306358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330363035373b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('953e63cad2d139b55c8f0ee4698f5d27e4b8bab3', '192.168.1.106', 1517223619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232333332323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9b89c9f8983f81afe7b9272837a2b3ea1bc7f1b6', '192.168.1.100', 1517227297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232363939313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a341d6e221da426f04e9dc212a6b032a2402d3c0', '192.168.1.106', 1517306674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330363337363b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a7da7e7fbe3f9bda9020d5015fc664d4375dd133', '192.168.1.106', 1517307236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330363939353b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a829d12a697270536c8da881b8b60c5e901c1b33', '192.168.1.100', 1517226982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232363638323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('aa9a98acbff5d6cdb13d93573313ada385ee5c9e', '192.168.1.106', 1517230737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233303433373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ac991b2603313b6000d9edee0843c369cdaad5a8', '192.168.1.100', 1517227603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232373330373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b0ce201ec24e244226e909e5b3450ed990d33c16', '192.168.1.106', 1517309392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330393134343b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323137373637223b6c6173745f69707c733a31333a223139322e3136382e312e313036223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313531373330393339323b),
('b1939d45bb9f6c151e8cc8c6ec4600939b573a43', '192.168.1.106', 1517227387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232373039393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b88fc1500c7ef9d038135eeaa0b14aaf4f7772b6', '192.168.1.100', 1517228649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232383333333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c63869187aebfaffedae7707f8a0cfd8e3070a39', '192.168.1.100', 1517231679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233313136393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cbf8a9e1568197f8ce6df550f59f06b33d85ed61', '192.168.1.100', 1517224186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232333839323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d41e974a18f2bdb6b4c67dba212155febbcd6064', '192.168.1.106', 1517227086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232363734373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d6c6f0345f7db6fed1a02383650b72f8a0db15ba', '192.168.1.106', 1517231733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233313434343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dca4bdcc08ee37f6cdb85536921b913405791e6d', '::1', 1517304989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373330343938383b7265717565737465645f706167657c733a303a22223b),
('de71d786e35045135eb2b27b8d58df6a56e190e0', '192.168.1.100', 1517229605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232393330353b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('e00985a7f67b5e3286072639a572c153342770d1', '192.168.1.100', 1517231779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233313638323b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('e2ccfd6b00fc9e8d0d7ed1b3210d4df7317b5671', '192.168.1.106', 1517224970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232343633363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eb2977b5da8d57b9cf5f79042858a11a7b671bca', '192.168.1.106', 1517226734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232363433303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fc1a91d8a837ac34f71ed775ce90c9c5ed9862e4', '192.168.1.100', 1517230533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233303233383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('fd7b8ba415a9d087fbfed5f6b32dc194fd379513', '192.168.1.106', 1517224436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373232343330363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323133373037223b6c6173745f69707c733a31333a223139322e3136382e312e313030223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ffb113fc00260f54029b51cb5fca6680f94c85fb', '192.168.1.100', 1517231163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531373233303834383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a353a226f776e6572223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a31383a2261646d696e40636f6465706c616e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353137323132353534223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2265633861613439613763303132653964323638373362663462363936306461362e706e67223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);

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

--
-- Dumping data for table `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2018-01-30 10:47:00', '', 1, 'full', '653bd37b1d4236788f723791bdb1410e.csv', NULL, '', '', '', '', NULL, 16, 16, NULL, NULL, NULL, 1, NULL, NULL, NULL);

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
(1, 0x3139322e3136382e312e313036, 0x0000, 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'admin@codeplan.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1517305127, 1, 'Owner', 'Owner', 'B+PLUS LTD.', '01911584080', 'ec8aa49a7c012e9d26873bf4b6960da6.png', 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
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
(23, 1, NULL, 0x3a3a31, 'owner', '2018-01-28 07:06:54'),
(24, 1, NULL, 0x3a3a31, 'owner', '2018-01-29 07:55:54'),
(25, 1, NULL, 0x3139322e3136382e312e313030, 'owner', '2018-01-29 08:15:08'),
(26, 1, NULL, 0x3139322e3136382e312e313036, 'owner', '2018-01-29 09:22:47'),
(27, 1, NULL, 0x3139322e3136382e312e313036, 'owner', '2018-01-30 09:38:48');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
