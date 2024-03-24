-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Mar 24, 2024 at 11:43 AM
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
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Winsor & Newton'),
(2, 'Golden Artist Colors'),
(3, 'Faber-Castell'),
(4, 'Rembrandt'),
(5, 'Michael Harding'),
(6, 'Derwent');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(160, 1, '::1', 1, 1),
(182, 1, '::1', -1, 1),
(185, 72, '::1', -1, 1),
(186, 74, '::1', -1, 1),
(187, 75, '::1', -1, 1),
(188, 73, '::1', -1, 1),
(189, 2, '::1', 30, 1),
(190, 1, '::1', 30, 1),
(191, 3, '::1', 30, 1),
(192, 16, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Sketches'),
(2, 'Conceptual Arts'),
(3, 'Sculptures'),
(4, 'Painting Art'),
(5, 'Visual Arts'),
(6, 'Oil Painting'),
(7, 'Street arts');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com'),
(6, 'altayyabtravels646@mail.com'),
(7, 'hajeera@gmail.com'),
(8, 'nidith@gmail.com'),
(9, 'asvfsd@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'test test', 'tes1t@gmail.com', 'us', 'testa', 'statement', 550000, 'test', '123456', '12/20', 1, 3500, 1555),
(3, 27, 'Mohammed Thayeeb  Shariff', 'altayyabtravels646@mail.com', 'banglore', 'karnataka', 'karnataka', 560018, 'mohammed thayeeb', '5566 0002 0055 0055', '12/22', 3, 60000, 4),
(4, 27, 'Mohammed Thayeeb  Shariff', 'altayyabtravels646@mail.com', 'banglorefgmnhfmxghmgmghm', 'karnataka', 'ghmghmghm', 560018, 'mohammed thayeeb', '5566 5526 3262 1516', '12/22', 2, 1010, 5),
(5, 28, 'Saba  Shariff', 'akbarmd416@gmail.com', 'banglore', 'karnataka', 'karnataka', 560020, 'saba', '5522 5523 6492 4514', '12/21', 1, 1000, 2),
(6, 29, 'Nidith SS', 'hajeerab93@gmail.com', 'banglore', 'karnataka', 'karnataka', 560020, 'nidith', '5505 6630 8890', '12/22', 4, 8600, 2),
(7, 30, 'Thayeeb Shariff', 'devgenius9211@gmail.com', 'bengaluru', 'madya prade', 'karnataka', 560018, 'mohammed thayeeb', '5567 8890 0987 7780', '12/22', 1, 5000, 5),
(8, 30, 'Thayeeb Shariff', 'devgenius9211@gmail.com', 'bengaluru', 'madya prade', 'karnataka', 560018, 'mohammed thayeeb', '4678 9876 5432 1098', '08/27', 2, 10500, 100),
(9, 30, 'Dev', 'devgenius9211@gmail.com', 'bengaluru', 'madya pradesh', 'karnataka', 560010, 'mohamrgr', '1234432112344321', '12/29', 1, 5500, 98),
(10, 30, 'Thayeeb Shariff', 'devgenius9211@gmail.com', 'bengaluru', 'madya prade', 'karnataka', 560018, 'mohammed thayeeb', '5520 5520 5563 0023', '12/22', 4, 10000, 2),
(11, 30, 'Thayeeb Shariff', 'devgenius9211@gmail.com', 'bengaluru', 'madya prade', 'karnataka', 560018, 'moahmemd thayeeb', '5522 5225 5225 5225', '12/22', 1, 1000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 73, 1, 3500),
(92, 3, 1, 1, 5000),
(93, 3, 3, 1, 30000),
(94, 3, 2, 1, 25000),
(95, 4, 63, 1, 550),
(96, 4, 63, 1, 460),
(97, 5, 5, 1, 1000),
(98, 6, 5, 1, 1000),
(99, 6, 2, 1, 2500),
(100, 6, 4, 1, 3200),
(101, 6, 23, 1, 1900),
(102, 7, 1, 1, 5000),
(103, 8, 1, 1, 5000),
(104, 8, 83, 1, 5500),
(105, 9, 11, 1, 5500),
(106, 10, 1, 1, 5000),
(107, 10, 2, 1, 2500),
(108, 10, 5, 1, 1000),
(109, 10, 9, 1, 1500),
(110, 11, 5, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Sketch', 5000, 'Its a sketch', 'product07_sketch.jpg', 'Sketch Elighted'),
(2, 1, 3, 'beautiful sketch', 2500, 'iphone 5s', 'product0_sketch.jpg', 'Its a sketch'),
(3, 1, 3, 'jawaan sketch', 3000, 'its a sketch', 'product02_sketch.jpg', 'sketch'),
(4, 1, 3, ' Astronaut sketch', 3200, 'its a astronaut sketch', 'product03_sketch.jpg', 'Extraordinary sketches '),
(5, 1, 2, 'Coast Screen print', 1000, 'Prints', 'product01_prints.jpg', 'its a print product'),
(6, 1, 1, 'caitalin prints', 3500, 'Its a print product', 'product02_prints.jpg', 'Prints'),
(7, 1, 1, 'Jungle city', 5000, 'Its a print product', 'product03_prints.jpg', 'Prints'),
(8, 1, 4, 'Mandala Dots', 4000, 'Its a print product', 'product04_prints.jpg', 'Prints'),
(9, 1, 3, 'Royalty', 1500, 'its a conceptual art', 'product01_conceptual.jpg', 'Conceptual Arts'),
(10, 2, 6, 'Portrait concept', 1000, 'its a conceptual art', 'product02_conceptual.jpg', 'conceptual arts'),
(11, 2, 6, 'Modern art Conceptual Beauty', 5500, 'its a conceptual art', 'product03_conceptual.jpg', 'Conceptual Arts'),
(12, 2, 6, 'Abstract Concept Modern Art', 1500, 'Conceptual Art', 'product04_conceptual.jpg', 'Conceptual arts'),
(13, 2, 6, 'Street Art-1', 12000, 'Its a street art', 'Product01_street.jpg', 'Street arts'),
(14, 2, 6, 'Street art -2', 1400, 'Its a street art', 'Product02_street.jpg', 'Streets arts'),
(15, 2, 6, 'Formal Street art -3 ', 1500, 'Its a street art', 'Product03_street.jpg', 'Streets arts'),
(16, 3, 6, 'Royal Sculptures art', 6000, 'Its a Sculptures art', 'Product01_sculptures.jpg', 'Sculptures'),
(17, 3, 6, 'sculptures living', 1600, 'Its a Sculptures art', 'Product02_sculptures.jpg', 'Sculptures art'),
(19, 3, 6, 'Sculptures Revived', 3000, 'Its a Sculptures art', 'Product03_sculptures.jpg', 'Sculptures art'),
(20, 3, 6, 'Tall Man Sculptures art', 2000, 'Its a Sculptures art', 'Product04_sculptures.jpg', 'Sculptures art'),
(21, 3, 6, 'Michelangelo\'s Sculpture: The Ideas of Visionary Art Explained.', 800, 'Its a Sculptures art', 'Product07_sculptures.jpg', 'Sculptures.'),
(23, 4, 6, 'Painting Art -1 ', 1900, 'Its a painting art', 'Product01_painting.jpg', 'Painting art'),
(24, 4, 6, 'Painting art -2', 700, 'Its a painting art', 'Product02_painting.jpg', 'Painting art'),
(25, 4, 6, 'Painting Art - 3', 750, 'Its a painting art', 'Product03_painting.jpg', 'Painting art'),
(27, 4, 6, 'Painting Art - 4', 6900, 'Its a painting art', 'Product04_painting.jpg', 'Painting art'),
(32, 5, 0, 'Book Shelf', 2500, 'book shelf', 'furniture-book-shelf-250x250.jpg', 'book shelf furniture'),
(33, 6, 2, 'Oil Painting of a street city', 35000, 'Oil painting', 'Product01_oil.jpg', 'Oil painting'),
(34, 6, 4, 'Oil painting of a Scenary', 1000, 'Oil painting.', 'Product02_oil.JPG', 'Oil painting'),
(35, 6, 0, 'Oil painting of a lady (Home Decor)', 6000, 'Oil painting.', 'Product03_oil.jpg', 'Oil painting'),
(36, 6, 5, 'Oil painting of a Horse', 1500, 'Oil painting.', 'Product04_oil.JPG', 'Oil painting.'),
(37, 6, 5, 'Oil painting of a Boieesen Art.', 20000, 'Oil painting.', 'Product05_oil.jpg', 'Oil painting.'),
(38, 6, 4, 'Oil painting of a colorful canal', 3500, 'Oil painting', 'Product06_oil.jpg', 'Oil painting.'),
(39, 6, 5, 'Digital Oil painting', 2500, 'Oil painting.', 'Product07_oil.jpg', 'Oil painting'),
(40, 2, 6, 'Human Brain Exploding Knowledge', 3000, 'Its a Conceptual Art', 'product05_conceptual.jpg', 'Conceptual Art'),
(47, 4, 6, 'Expressive Portraits', 650, 'Product painting', 'Product05_painting.jpg', 'Painting Art'),
(48, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(49, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(50, 3, 6, 'Ancient Greek Sculptures', 350, 'Sculptures', 'Product05_sculptures.JPG', 'Sculptures'),
(51, 3, 6, 'Ancient Women Sculptures', 270, 'Sculptures.', 'Product06_sculptures.JPG', 'Conceptual Arts, Sculptures'),
(57, 3, 6, 'Oil Painitngs', 260, 'OIL', 'Product05_oil.JPG', 'Oil Sketches'),
(59, 3, 6, 'Street arts', 855, 'Street', 'Product01_street.jpg', 'Streets'),
(60, 3, 6, 'Conceptual Arts', 150, 'Conceptual Arts', 'Product04_conceptual.jpg', 'Conceptual'),
(61, 3, 6, 'Conceptual Sketches', 215, 'concept', 'Product02_conceptual.JPG', 'Conceptual'),
(62, 3, 6, 'Streets art', 299, 'Streets', 'Product03_street.jpg', 'Streets.'),
(63, 3, 6, 'Temple Sculptures', 550, 'Sculptures.', 'Product11_sculptures.JPG', 'Sculptures'),
(64, 3, 6, 'oil Sketches.', 460, 'Sketches', 'Product02_Oil.JPG', 'Oil Sketches'),
(65, 3, 6, 'Complex bimbo sculptures.', 470, 'sculptures.', 'Product10_sculptures.JPG', 'Sculptures.'),
(66, 3, 6, 'Temple Sculptures.', 480, 'Sculptures.', 'Product11_sculptures.JPG', 'Sculptures'),
(70, 3, 6, 'Head of a Sculpture Depicting a Young Woman.', 399, 'Sculptures.', 'Product08_sculptures.JPG', 'Sculptures.'),
(71, 1, 2, 'Nymph Sketch', 5000, 'Sketches', 'product06_sketch.jpg', 'Sketches.'),
(72, 7, 2, 'Amazing Street Art', 3500, 'Its a Street art', 'Product05_street.jpg', 'Street Arts'),
(73, 7, 2, 'Griffti Street Art', 3500, 'Its a Street Art', 'Product06_street.jpg', 'Street Arts'),
(74, 1, 1, 'Colorful Sketch', 5500, 'Sketches', 'product08_sketch.jpg', 'Sketches.'),
(75, 1, 1, 'City Sketch', 5500, 'Sketches', 'product09_sketch.jpg', 'sketches.'),
(79, 7, 2, 'Street Art Wall Royalty', 2569, 'Its a street art', 'Product07_street.jpg', 'Street Arts'),
(80, 1, 1, 'ytrfdkjsd', 12343, 'sdfhgh', '1542455446_thythtf .jpeg', 'dfgh'),
(81, 4, 6, 'Painting Art - 6', 300, 'Eyes', 'product06_painting.jpg', 'Painting Art'),
(82, 2, 2, 'bib', 100, 'ophioih', '1709295362_a1.jpg', 'thj'),
(83, 5, 0, 'Visual arts', 5500, 'Visaul Art', '1709466144_product0_visual.jpg', 'Visual');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(26, 'test', 'test', 'tes1t@gmail.com', '123456789', '9994949949', 'test', 'testa'),
(27, 'Mohammed Thayeeb ', 'Shariff', 'altayyabtravels646@mail.com', 'thay.2ggg', '7338219832', 'banglore', 'karnataka'),
(28, 'Saba ', 'Shariff', 'akbarmd416@gmail.com', '12345678912', '9341319646', 'banglore', 'karnataka'),
(29, 'Nidith', 'SS', 'hajeerab93@gmail.com', '0987654321', '8085896961', 'banglore', 'karnataka'),
(30, 'Thayeeb', 'Shariff', 'devgenius9211@gmail.com', '2345678912', '9341319646', 'bengaluru', 'madya prade');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'test', 'test', 'tes1t@gmail.com', '123456789', '9994949949', 'test', 'testa'),
(27, 'Mohammed Thayeeb ', 'Shariff', 'altayyabtravels646@mail.com', 'thay.2ggg', '7338219832', 'banglore', 'karnataka'),
(28, 'Saba ', 'Shariff', 'akbarmd416@gmail.com', '12345678912', '9341319646', 'banglore', 'karnataka'),
(29, 'Nidith', 'SS', 'hajeerab93@gmail.com', '0987654321', '8085896961', 'banglore', 'karnataka'),
(30, 'Thayeeb', 'Shariff', 'devgenius9211@gmail.com', '2345678912', '9341319646', 'bengaluru', 'madya prade');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info_backup` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
