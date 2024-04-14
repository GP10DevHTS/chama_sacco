-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2023 at 12:16 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chama`
--
create Database chama;
use chama;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `profilepic` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fname`, `lname`, `address`, `profilepic`, `contact`, `dob`, `username`, `email`, `password`, `creationdate`, `updationdate`) VALUES
(1, 'admin', 'admin', 'my address', 'istockphoto-77931645-170667a.jpg', '712345678', '', 'admin', 'igella@gmail.com', 'd6ca3fd0c3a3b462ff2b83436dda495e', '2019-11-14 17:36:19', '2023-01-08 11:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE `credit` (
  `id` int(11) NOT NULL,
  `mid` int(12) NOT NULL,
  `amount` float NOT NULL,
  `balance` float NOT NULL,
  `refno` varchar(50) NOT NULL,
  `source` varchar(30) NOT NULL,
  `credit_date` date NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credit`
--

INSERT INTO `credit` (`id`, `mid`, `amount`, `balance`, `refno`, `source`, `credit_date`, `status`) VALUES
(1, 11, 1600, 100, 'erff', 'total savings', '2022-06-17', 1),
(4, 12, 666, 222, 'ess', 'payments', '2022-06-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `debit`
--

CREATE TABLE `debit` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `refno` varchar(40) NOT NULL,
  `source` varchar(40) NOT NULL,
  `debit_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `debit`
--

INSERT INTO `debit` (`id`, `mid`, `amount`, `refno`, `source`, `debit_date`, `status`) VALUES
(1, 4, 1111, 'daada', 'payments', '2022-06-17 11:22:01', 1),
(3, 6, 300, 'dfs', 'total savings', '2022-06-19 10:50:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `investment`
--

CREATE TABLE `investment` (
  `id` int(11) NOT NULL,
  `details` varchar(10000) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `refno` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `investment`
--

INSERT INTO `investment` (`id`, `details`, `amount`, `date`, `refno`) VALUES
(3, 'aaaaaaaaaaaaaaaaad', 2904, '2022-07-20', 'ddddd');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `type` varchar(40) NOT NULL,
  `due_date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `refno`, `userid`, `amount`, `type`, `due_date`, `status`, `created_date`) VALUES
(21, 'hyrffhgg', 20, 600, '6', '2022-07-29', 0, '2022-07-20 04:50:54'),
(22, 'nbbg', 10, 800, '6', '2022-07-20', 0, '2022-07-20 05:20:01'),
(23, '', 20, 300, '6', NULL, 3, '2022-07-20 05:24:57'),
(24, '', 20, 300, '6', NULL, 1, '2022-07-20 05:25:37'),
(25, '', 20, 800, '6', NULL, 1, '2022-07-20 05:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `pay_date` date NOT NULL DEFAULT current_timestamp(),
  `balance` float NOT NULL,
  `pay_type` varchar(30) NOT NULL,
  `refno` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `userid`, `amount`, `pay_date`, `balance`, `pay_type`, `refno`, `status`) VALUES
(11, 20, 1000, '2022-07-20', 0, 'contributions', 'dDsA', 0),
(12, 20, 1000, '2022-07-20', 0, 'Shares', 'dDsA', 1),
(13, 20, 1000, '2022-07-20', 0, 'contributions', 'tffgggg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `terms` varchar(10000) NOT NULL,
  `creationdate` date NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `type`, `terms`, `creationdate`, `status`) VALUES
(6, 'Emergency Loan', 'Payment Within 12 weeks after loan credited to client', '2022-07-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `pay_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `created_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `userid`, `username`, `refno`, `amount`, `pay_date`, `status`, `created_date`) VALUES
(67, 20, 'felo felo', 'css', 200, '2022-07-20 06:13:06', 0, '2022-07-20'),
(71, 20, 'felo felo', 'hjhjftfhgf', 600, '2022-07-20 06:26:42', 1, '2022-07-20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(255) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `kin` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `status` int(2) DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `profilepic` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `username`, `dob`, `address`, `kin`, `password`, `contact`, `status`, `creationdate`, `updationdate`, `profilepic`) VALUES
(20, 'Test', 'Test', 'doryn@gmail.com', 'test', '12/14/2022', '148-Kericho', 'hghghgtr', 'd6ca3fd0c3a3b462ff2b83436dda495e', '712345678', 1, '2022-06-20 13:53:46', '2023-01-08 11:15:39', 'istockphoto-77931645-170667a.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debit`
--
ALTER TABLE `debit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investment`
--
ALTER TABLE `investment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credit`
--
ALTER TABLE `credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `debit`
--
ALTER TABLE `debit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `investment`
--
ALTER TABLE `investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
