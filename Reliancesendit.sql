-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2021 at 07:40 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sendit`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_proof_documents`
--

CREATE TABLE IF NOT EXISTS `address_proof_documents` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Document_Name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Sort_Order` int(2) NOT NULL,
  `Active` int(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Document_Name` (`Document_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_data`
--

CREATE TABLE IF NOT EXISTS `admin_login_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `Role` int(11) NOT NULL,
  `StaffID` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL DEFAULT 'logo.png',
  `PhoneNo` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `loginDate` date NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `isStaff` tinyint(1) NOT NULL DEFAULT '0',
  `isOffice` tinyint(1) NOT NULL DEFAULT '0',
  `isVerified` tinyint(1) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `D_Date` date NOT NULL,
  `D_Time` time NOT NULL,
  `D_User` varchar(200) NOT NULL,
  `D_IP` varchar(200) NOT NULL,
  `Reference_Code` varchar(200) DEFAULT NULL,
  `AppInstallation_Date` date NOT NULL,
  `AppInstallation_Time` time NOT NULL,
  `FirebaseToken` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `User` varchar(200) NOT NULL,
  `Time` time NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `admin_login_data`
--

INSERT INTO `admin_login_data` (`ID`, `FirstName`, `LastName`, `Role`, `StaffID`, `Email`, `Photo`, `PhoneNo`, `Password`, `loginDate`, `isAdmin`, `isStaff`, `isOffice`, `isVerified`, `isDeleted`, `D_Date`, `D_Time`, `D_User`, `D_IP`, `Reference_Code`, `AppInstallation_Date`, `AppInstallation_Time`, `FirebaseToken`, `Date`, `User`, `Time`, `IP`) VALUES
(2, 'Admin', '123', 0, 'ADMIN123', 'admin@hmail.com', 'logo.png', '9999999999', '123456', '2019-10-26', 1, 0, 0, 1, 0, '0000-00-00', '00:00:00', '', '', NULL, '0000-00-00', '00:00:00', '', '0000-00-00', '', '00:00:00', ''),
(7, 'Parag', 'Deka', 2, 'Parag241', 'parag.moni44@gmsil.com', 'artboard.png', '7002608241', '123456', '0000-00-00', 0, 0, 1, 0, 0, '0000-00-00', '00:00:00', '', '', NULL, '0000-00-00', '00:00:00', '', '2020-02-18', 'ADMIN123', '17:11:41', '47.29.140.135');

-- --------------------------------------------------------

--
-- Table structure for table `app_importance_type`
--

CREATE TABLE IF NOT EXISTS `app_importance_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Importance_Type` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Importance_Type` (`Importance_Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_importance_type_driver`
--

CREATE TABLE IF NOT EXISTS `app_importance_type_driver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Importance_Type` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Importance_Type` (`Importance_Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--

CREATE TABLE IF NOT EXISTS `app_version` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Version` varchar(255) NOT NULL,
  `Importance` tinyint(4) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `app_version`
--

INSERT INTO `app_version` (`ID`, `Version`, `Importance`, `Date`, `Time`, `User`, `IP`) VALUES
(1, '3', 1, '2018-03-14', '15:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_version_driver`
--

CREATE TABLE IF NOT EXISTS `app_version_driver` (
  `ID` int(20) NOT NULL AUTO_INCREMENT,
  `Version` varchar(255) NOT NULL,
  `Importance` tinyint(4) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `back_office_users`
--

CREATE TABLE IF NOT EXISTS `back_office_users` (
  `User_ID` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Phone` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `User_Level` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Created_By` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE IF NOT EXISTS `banks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bank` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Sort_Order` int(3) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Bank` (`Bank`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
  `Bill_No` int(11) NOT NULL AUTO_INCREMENT,
  `Bill_Date` date NOT NULL,
  `Payment_Mode` int(11) NOT NULL,
  `Transaction_Number` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Ride` int(11) NOT NULL,
  `Minimum_Fare` int(11) NOT NULL,
  `Ride_Fare` int(11) NOT NULL,
  `Total_Fare` int(11) NOT NULL,
  `Promo_Code` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  `Discount_Amount` int(11) DEFAULT NULL,
  `Total_After_Discount` int(11) NOT NULL,
  `Tax_IDs` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Total_Tax_Amount` int(11) NOT NULL,
  `Gross_Amount` int(11) NOT NULL,
  `Hellocab_Share_On_Ride` int(11) NOT NULL,
  `Owner_Share_On_Ride` int(11) NOT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Bill_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_payment_mode`
--

CREATE TABLE IF NOT EXISTS `bill_payment_mode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mode` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Mode` (`Mode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `book_ride`
--

CREATE TABLE IF NOT EXISTS `book_ride` (
  `ID` int(200) NOT NULL AUTO_INCREMENT,
  `Is_Running` tinyint(1) NOT NULL DEFAULT '0',
  `No_of_Seats` int(11) NOT NULL DEFAULT '0',
  `OTP` int(11) NOT NULL COMMENT 'Auto Generated',
  `IDDelivery` int(11) NOT NULL,
  `Unique_Ride_Code` varchar(255) NOT NULL COMMENT 'Auto Generated',
  `User_ID` int(11) NOT NULL,
  `Driver_ID` varchar(110) DEFAULT NULL,
  `Vehicle_ID` varchar(110) DEFAULT NULL,
  `uMobile` varchar(200) DEFAULT NULL,
  `From_Address` varchar(200) NOT NULL,
  `From_area` varchar(200) NOT NULL,
  `To_Address` varchar(500) NOT NULL,
  `From_Latitude` float(10,6) NOT NULL,
  `From_Longitude` float(10,6) NOT NULL,
  `To_Latitude` float(10,6) NOT NULL,
  `To_Longitude` float(10,6) NOT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Booking_Time` time DEFAULT NULL,
  `Driver_Accepted_Date` date DEFAULT NULL,
  `Driver_Accepted_Time` time DEFAULT NULL,
  `ETR` varchar(200) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `Start_time` time DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `End_time` time DEFAULT NULL,
  `Map_Snapshot` varchar(255) DEFAULT NULL,
  `Distance_Travel` float(10,2) DEFAULT NULL,
  `Cost` float(10,2) DEFAULT NULL,
  `pCost` float(10,2) NOT NULL DEFAULT '0.00',
  `User_Rating_By_Driver` float(10,1) DEFAULT '0.0',
  `Driver_Rating_By_User` float(10,1) DEFAULT '0.0',
  `User_Review` varchar(255) DEFAULT NULL,
  `Driver_Review` varchar(255) DEFAULT NULL,
  `is_Ride_Later` tinyint(1) NOT NULL DEFAULT '0',
  `Is_Roudtrip` tinyint(1) NOT NULL DEFAULT '0',
  `Return_date` date DEFAULT NULL,
  `Return_time` time DEFAULT NULL,
  `PaymentMode` int(11) NOT NULL,
  `PaymentVerified` int(11) NOT NULL DEFAULT '0',
  `Is_Paid` tinyint(1) NOT NULL DEFAULT '0',
  `Ride_Cancelled_by` tinyint(1) DEFAULT '0',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `book_ride`
--

INSERT INTO `book_ride` (`ID`, `Is_Running`, `No_of_Seats`, `OTP`, `IDDelivery`, `Unique_Ride_Code`, `User_ID`, `Driver_ID`, `Vehicle_ID`, `uMobile`, `From_Address`, `From_area`, `To_Address`, `From_Latitude`, `From_Longitude`, `To_Latitude`, `To_Longitude`, `Booking_Date`, `Booking_Time`, `Driver_Accepted_Date`, `Driver_Accepted_Time`, `ETR`, `Start_Date`, `Start_time`, `End_Date`, `End_time`, `Map_Snapshot`, `Distance_Travel`, `Cost`, `pCost`, `User_Rating_By_Driver`, `Driver_Rating_By_User`, `User_Review`, `Driver_Review`, `is_Ride_Later`, `Is_Roudtrip`, `Return_date`, `Return_time`, `PaymentMode`, `PaymentVerified`, `Is_Paid`, `Ride_Cancelled_by`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 0, 0, 104567, 1, '17789361066020bd6c4ec409.35771872', 24, '25', '1', NULL, 'House No: 19|Unnamed Road, Ghoramara Pathar, Assam 782105, India', '', '', 26.256063, 92.334335, 0.000000, 0.000000, '2021-02-08', '06:26:00', NULL, NULL, '02-17-202111:45AM', '2021-02-08', '08:15:00', '2021-02-08', '08:16:00', NULL, 104.00, 149.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 1, 0, '2021-02-08', '06:26:00', '24', 'fe80::54b8:2ff:fe0d:aeeb%wlan0'),
(2, 0, 0, 122941, 2, '10463574066020d95161d0e0.99075925', 24, '14', '1', NULL, 'House No: 19|Unnamed Road, Ghoramara Pathar, Assam 782105, India', '', '', 26.256063, 92.334335, 0.000000, 0.000000, '2021-02-08', '08:25:00', NULL, NULL, '02-16-202101:02 PM', '2021-02-08', '08:38:00', '2021-02-08', '08:43:00', NULL, 104.00, 149.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 1, 0, '2021-02-08', '08:25:00', '24', 'fe80::54b8:2ff:fe0d:aeeb%wlan0'),
(3, 0, 0, 998868, 3, '87911215060774245aa2ad6.57033010', 22, '14', '1', NULL, 'House No: 29C Troupant Ave| Magaliessig| Sandton| 2191| South Africa', '', '', -26.035549, 28.019859, 0.000000, 0.000000, '2021-04-14', '21:28:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 13410.94, 154.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 3, 0, 0, 0, '2021-04-14', '21:28:00', '22', 'fe80::b619:8d2a:1e6a:39df%wlan0'),
(5, 0, 0, 542740, 5, '16197772836086cb080a8d83.24404192', 24, NULL, NULL, NULL, 'House No: Krishnachura Path, Ganesh Nagar, Basistha, Guwahati, Meghalaya 781029, India', '', '', 26.092890, 91.794823, 0.000000, 0.000000, '2021-04-26', '16:15:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 37.16, 1202.00, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 1, '2021-04-26', '16:15:00', '24', 'fe80::54b8:2ff:fe0d:aeeb%wlan0'),
(7, 0, 0, 589796, 7, '53503003560c262647db503.90061429', 24, NULL, NULL, NULL, 'Optional(&quot;Basisthachal Path||Basisthachal Path|781028&quot;)', '', '', 26.096359, 91.794868, 0.000000, 0.000000, '2021-06-10', '21:05:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 24.83, 469.13, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 2, 0, 0, 1, '2021-06-10', '21:05:00', '24', '1'),
(9, 0, 0, 997612, 9, '102438465860c2643f6e0678.11010452', 24, NULL, NULL, NULL, 'Optional(&quot;Basisthachal Path||Basisthachal Path|781028&quot;)', '', '', 26.096359, 91.794868, 0.000000, 0.000000, '2021-06-10', '21:13:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 24.83, 204.13, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 1, '2021-06-10', '21:13:00', '24', '1'),
(10, 0, 0, 175843, 10, '190822519260c3529eedcbd5.41425295', 24, NULL, NULL, NULL, 'Optional(&quot;Basisthachal Path||Basisthachal Path|781028&quot;)', '', '', 26.096558, 91.795059, 0.000000, 0.000000, '2021-06-11', '14:10:00', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 24.85, 222.23, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 0, 1, '2021-06-11', '14:10:00', '24', '1'),
(12, 0, 0, 327168, 12, '96809482260c354f106ff30.43084467', 24, '14', '1', NULL, 'Optional(&quot;Latakata, Guwahati, Meghalaya 781029, India||Nilkantha Path|793102&quot;)', '', '', 26.093185, 91.796654, 0.000000, 0.000000, '2021-06-11', '14:20:00', NULL, NULL, '06-21-202107:00 PM', NULL, NULL, '2021-06-11', '14:39:41', NULL, 25.00, 229.23, 0.00, 0.0, 0.0, NULL, NULL, 0, 0, NULL, NULL, 1, 0, 1, 0, '2021-06-11', '14:20:00', '24', '1');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `CanteenCategory`
--

CREATE TABLE IF NOT EXISTS `CanteenCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `CanteenCategory`
--

INSERT INTO `CanteenCategory` (`ID`, `Category`, `Photo`, `Date`, `Time`) VALUES
(1, 'Bakery and Baking', 'http://139.59.38.160/sendit/Dashboard/images/bnb.png', '0000-00-00', '00:00:00'),
(2, 'Butchery ', 'http://139.59.38.160/sendit/Dashboard/images/but.png', '0000-00-00', '00:00:00'),
(3, 'Fruit and veg', 'http://139.59.38.160/sendit/Dashboard/images/fnv.png', '0000-00-00', '00:00:00'),
(4, 'General', 'http://139.59.38.160/sendit/Dashboard/images/0000618_canned-fruit-and-desserts_600.jpeg', '2020-10-27', '06:35:01'),
(5, 'Miscellaneous', 'http://139.59.38.160/sendit/Dashboard/images/pexels-ovan-57750.jpg', '2020-10-27', '10:42:04'),
(6, 'Convenience stores', 'http://139.59.38.160/sendit/Dashboard/images/cs.png', '0000-00-00', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `canteen_AD`
--

CREATE TABLE IF NOT EXISTS `canteen_AD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `canteen_AD`
--

INSERT INTO `canteen_AD` (`ID`, `Title`, `Description`, `Photo`, `isActive`, `User`, `Date`, `Time`) VALUES
(66, '', '', '214.png', 0, 'ADMIN123', '2020-10-26', '06:06:46'),
(69, 'Test for SendIt', 'This is a test 8 Jan 2021', '828.png', 1, 'admin123', '2021-01-08', '10:31:26');

-- --------------------------------------------------------

--
-- Table structure for table `canteen_review`
--

CREATE TABLE IF NOT EXISTS `canteen_review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CanteenID` int(11) NOT NULL,
  `Review` varchar(200) NOT NULL,
  `Rating` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `checks`
--

CREATE TABLE IF NOT EXISTS `checks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `Filepath` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `checks`
--

INSERT INTO `checks` (`ID`, `UserID`, `BookingID`, `Filepath`, `Date`, `Time`) VALUES
(1, 24, 17, 'IMG-20200622-WA0000.jpg', '2020-06-23', '13:09:43'),
(2, 24, 17, 'IMG-20200622-WA0000.jpg', '2020-06-23', '13:09:47'),
(3, 24, 18, 'Screenshot_20200623-014741_Covered-19.jpg', '2020-06-23', '13:14:21'),
(4, 24, 18, 'Screenshot_20200623-014741_Covered-19.jpg', '2020-06-23', '13:14:31'),
(5, 23, 23, 'Screenshot 2020-05-27 at 12.37.34.png', '2020-06-25', '09:28:21'),
(6, 23, 23, 'Screenshot 2020-05-27 at 12.37.34.png', '2020-06-25', '09:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE IF NOT EXISTS `clusters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE IF NOT EXISTS `contactus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDUser` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Messages` mediumtext NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`ID`, `IDUser`, `Email`, `Messages`, `Date`, `Time`) VALUES
(1, '2', 'p@g.com', 'test', '2020-06-10', '11:56:00'),
(2, '2', 'k@g.com', 'test', '2020-06-10', '12:03:00'),
(3, '24', 'p@g.con', 'hhhsjjs', '2020-06-16', '10:17:00'),
(4, '23', 'mhdptl@gmail.com', 'just wanted to know if youll deliver to PE', '2020-06-20', '20:33:00'),
(5, '7002508241', '', 'hhggh', '2020-06-21', '23:31:00'),
(6, '798715465', 'mhdptl@gmail.com', 'do you deliver to Marlboro Gardens', '2020-06-25', '09:24:00'),
(7, '7002608241', 'p@g.com', 'test for message go to mail', '2020-06-29', '19:42:00'),
(8, '7002608241', 'p@g.com', 'test for message go to mail', '2020-06-29', '19:43:00'),
(9, '7002608241', 'p@g.com', 'mail test', '2020-06-29', '19:46:00'),
(10, '7002608241', 'parag@gmail.com', 'test for mail', '2020-06-29', '19:48:00'),
(11, '7002608241', 'parag@gmail.com', '2ttghzjjjs', '2020-06-29', '19:51:00'),
(12, '7002608241', 'p@g.com', 'hdhjjjs', '2020-06-29', '19:54:00'),
(13, '9999999999', 'p@g.com', 'hshhhsnhd', '2020-06-29', '20:01:00'),
(14, '999998666', 'ggggyy@ggh.com', 'gghhhhjud', '2020-06-29', '20:02:00'),
(15, '24', '', 'hi', '2020-09-04', '21:17:00'),
(16, '24', '', 'hi', '2020-09-04', '21:19:00'),
(17, '24', '', 'hi', '2020-09-04', '21:23:00'),
(18, '24', '', 'hi', '2020-09-04', '21:23:00'),
(19, '24', '', 'hi', '2020-09-04', '21:23:00'),
(20, '24', '', 'hello', '2020-09-04', '21:49:00'),
(21, '24', 'p@g.com', 'hello', '2020-09-04', '21:50:00'),
(22, '24', 'p@g.com', 'hello', '2020-09-04', '21:51:00'),
(23, '24', 'p@g.com', 'hello', '2020-09-04', '21:52:00'),
(24, '7002608241', 'p@g.com', 'hhdjd', '2020-10-14', '22:05:00'),
(25, '7002608241', 'p@g.com', 'hello', '2020-10-26', '07:04:00'),
(26, '7002608241', 'parag gmail.com', 'hello', '2020-11-05', '07:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE IF NOT EXISTS `courier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OTP` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DriverID` int(11) NOT NULL,
  `PickDate` date NOT NULL,
  `PickUp` varchar(200) NOT NULL,
  `DropOff` varchar(200) NOT NULL,
  `Comment` text NOT NULL,
  `pLat` float(10,6) NOT NULL,
  `pLong` float(10,6) NOT NULL,
  `dLat` float(10,6) NOT NULL,
  `dLong` float(10,6) NOT NULL,
  `Type` varchar(200) NOT NULL,
  `Weight` varchar(200) NOT NULL,
  `Status` int(11) NOT NULL,
  `Price` float(10,2) NOT NULL,
  `Message` text NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`ID`, `OTP`, `UserID`, `DriverID`, `PickDate`, `PickUp`, `DropOff`, `Comment`, `pLat`, `pLong`, `dLat`, `dLong`, `Type`, `Weight`, `Status`, `Price`, `Message`, `Date`, `Time`, `User`, `IP`) VALUES
(11, 289444, 24, 0, '0000-00-00', 'Indian Ocean', 'Gorakhpur', 'ggg', 0.000000, 91.795074, 26.760555, 83.373169, 'Heavy Items', 'Greater than 2 KG', 1, 200.00, 'test iOS', '2021-01-07', '00:47:33', '', '47.29.129.90'),
(12, 392206, 32, 0, '2021-01-13', '7 Yamuna St', '16 Corlett Dr', 'a', -26.210131, 28.015450, -26.134769, 28.051319, 'Heavy Items', 'Greater than 2 KG', 1, 75.00, '', '2021-01-26', '19:50:45', '', '105.225.146.16'),
(13, 440500, 32, 0, '2021-01-15', '7 Yamuna St', '16 Corlett Dr', 'a', -26.210131, 28.015450, -26.134769, 28.051319, 'Heavy Items', 'Greater than 2 KG', 1, 55.00, '', '2021-01-26', '19:52:08', '', '105.225.146.16'),
(16, 486467, 24, 0, '2021-01-18', 'Unnamed Road, Latakata, Guwahati, Meghalaya 781022, India', 'Dr RP Rd, GMC Ward Number 44, Swaraj Nagar, Ganeshguri, Guwahati, Assam 781006, India', 'test 6', 26.092350, 91.796623, 26.149908, 91.785187, 'Document', 'Less than 2 KG', 1, 650.00, '', '2021-01-26', '19:53:12', '', '105.225.146.16'),
(18, 705696, 32, 0, '2021-01-13', '7 Yamuna St', '16 Corlett Dr', 'a', -26.210131, 28.015450, -26.134769, 28.051319, 'Heavy Items', 'Greater than 2 KG', 1, 750.00, 'A', '2021-01-26', '19:51:41', '', '105.225.146.16'),
(19, 364877, 32, 0, '2021-01-13', '7 Yamuna St', '16 Corlett Dr', 'a', -26.210131, 28.015450, -26.134769, 28.051319, 'Heavy Items', 'Greater than 2 KG', 1, 75.00, '', '2021-01-26', '19:41:54', '', '105.225.146.16'),
(20, 334027, 32, 0, '2021-01-13', '7 Yamuna St', '16 Corlett Dr', 'a', -26.210131, 28.015450, -26.134769, 28.051319, 'Heavy Items', 'Greater than 2 KG', 1, 75.00, '', '2021-01-13', '04:52:48', '', '47.29.81.92');

-- --------------------------------------------------------

--
-- Table structure for table `current_locations`
--

CREATE TABLE IF NOT EXISTS `current_locations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mobile` varchar(255) NOT NULL,
  `Lattitude` varchar(255) NOT NULL,
  `Longitude` varchar(255) NOT NULL,
  `Tracking_Type` varchar(11) DEFAULT NULL COMMENT 'OnRide, NoRide, Offline',
  `Date_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `current_locations_user_on_ride`
--

CREATE TABLE IF NOT EXISTS `current_locations_user_on_ride` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Latitude` float(10,6) NOT NULL,
  `Longitude` float(10,6) NOT NULL,
  `SOS` tinyint(1) NOT NULL DEFAULT '0',
  `Tracking_Type` varchar(200) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `delievered`
--

CREATE TABLE IF NOT EXISTS `delievered` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `DriverID` int(11) NOT NULL DEFAULT '0',
  `Delivered` int(11) NOT NULL,
  `Acceptmessage` mediumtext NOT NULL,
  `Acceptdate` date NOT NULL,
  `Accepttime` time NOT NULL,
  `Confirmmessage` mediumtext NOT NULL,
  `Confirmdate` date NOT NULL,
  `Confirmtime` time NOT NULL,
  `Driveradddate` date NOT NULL,
  `Driveraddtime` time NOT NULL,
  `onthewaymessage` mediumtext NOT NULL,
  `onthewaydate` date NOT NULL,
  `onthewaytime` time NOT NULL,
  `Reason` mediumtext NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `delievered`
--

INSERT INTO `delievered` (`ID`, `OrderID`, `DriverID`, `Delivered`, `Acceptmessage`, `Acceptdate`, `Accepttime`, `Confirmmessage`, `Confirmdate`, `Confirmtime`, `Driveradddate`, `Driveraddtime`, `onthewaymessage`, `onthewaydate`, `onthewaytime`, `Reason`, `Date`, `Time`) VALUES
(1, 104567, 25, 5, '', '2021-02-08', '07:01:05', '', '0000-00-00', '00:00:00', '2021-02-08', '08:15:32', '', '2021-02-08', '08:15:44', '', '2021-02-08', '06:26:00'),
(2, 122941, 14, 5, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '2021-02-08', '08:32:57', '', '2021-02-08', '08:38:29', '', '2021-02-08', '08:25:00'),
(3, 998868, 14, 3, '', '2021-04-14', '21:32:46', '', '0000-00-00', '00:00:00', '2021-04-14', '21:35:05', '', '0000-00-00', '00:00:00', '', '2021-04-14', '21:28:00'),
(4, 649673, 0, 6, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-04-26', '16:04:00'),
(5, 542740, 0, 7, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', 'hello', '2021-04-26', '16:15:00'),
(6, 955432, 0, 6, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-06-10', '20:52:00'),
(7, 589796, 0, 7, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', 'test', '2021-06-10', '21:05:00'),
(8, 528894, 0, 6, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-06-10', '21:12:00'),
(9, 997612, 0, 7, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', 'test', '2021-06-10', '21:13:00'),
(10, 175843, 0, 7, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', 'test', '2021-06-11', '14:10:00'),
(11, 472920, 0, 6, '', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '0000-00-00', '00:00:00', '', '0000-00-00', '00:00:00', '', '2021-06-11', '14:11:00'),
(12, 327168, 14, 5, '', '2021-06-11', '14:20:13', '', '0000-00-00', '00:00:00', '2021-06-11', '14:30:15', '', '2021-06-11', '14:39:25', '', '2021-06-11', '14:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `dinner_booking`
--

CREATE TABLE IF NOT EXISTS `dinner_booking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CanteenID` int(11) NOT NULL,
  `No_of_persons` int(11) NOT NULL,
  `Booking_Date` date NOT NULL,
  `Booking_time` time NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `driver_details`
--

CREATE TABLE IF NOT EXISTS `driver_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Driver_OTP` int(11) DEFAULT NULL,
  `Owner_ID` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Phone_No` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Identification_Mark` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT 'profile_image.png',
  `Address` varchar(500) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pin` varchar(255) DEFAULT NULL,
  `Pancard_No` varchar(255) DEFAULT NULL,
  `Pancard_Photo` varchar(255) DEFAULT NULL,
  `Addressproof_Document` int(11) NOT NULL,
  `Addressproof_No` varchar(50) DEFAULT NULL,
  `Addressproof_Photo` varchar(255) DEFAULT NULL,
  `Driving_License_No` varchar(255) DEFAULT NULL,
  `Driving_License_Photo` varchar(255) DEFAULT NULL,
  `Valid_month` varchar(20) NOT NULL,
  `Valid_year` varchar(20) NOT NULL,
  `Aadhar_Card_No` varchar(255) DEFAULT NULL,
  `Aadhar_Card_Photo` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_No` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_Photo` varchar(255) DEFAULT NULL,
  `Bank_Name` int(11) DEFAULT NULL,
  `Branch_Name` varchar(255) DEFAULT NULL,
  `Bank_Account_Number` varchar(255) DEFAULT NULL,
  `IFSC_Code` varchar(50) DEFAULT NULL,
  `Verified_By` varchar(255) NOT NULL,
  `Verified_Date` date NOT NULL,
  `Verified_Remarks` varchar(255) DEFAULT NULL,
  `Rating` float(10,1) DEFAULT '0.0',
  `Is_Blocked` tinyint(1) NOT NULL DEFAULT '0',
  `App_Install_Date` date NOT NULL,
  `App_Install_Time` time NOT NULL,
  `Firebase_Token` varchar(255) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Phone_No` (`Phone_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eTez_AD`
--

CREATE TABLE IF NOT EXISTS `eTez_AD` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Photo` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `eTez_AD`
--

INSERT INTO `eTez_AD` (`ID`, `Photo`) VALUES
(1, '1.png'),
(2, '1.png'),
(3, '1.png');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` int(11) NOT NULL,
  `FAQ_Topic_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Description` longtext COLLATE latin1_general_ci,
  `Sort_Order` int(2) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Meta_Tag_Keywords` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Meta_Tag_Description` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Facebook_OG_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Twitter_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Google_Analytics` longtext COLLATE latin1_general_ci,
  `Custom_Code` longtext COLLATE latin1_general_ci,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `publish` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE IF NOT EXISTS `faq_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Parent` int(11) DEFAULT NULL,
  `FAQ_Category` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Description` text COLLATE latin1_general_ci,
  `Sort_Order` int(4) NOT NULL,
  `Publish` int(1) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FAQ_Category` (`FAQ_Category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE IF NOT EXISTS `foods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDCanteen` int(11) NOT NULL,
  `IDMenu` int(11) NOT NULL DEFAULT '0',
  `IDSubmenu` int(11) NOT NULL DEFAULT '0',
  `IDSubsubmenu` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(200) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Weight` float(10,2) NOT NULL,
  `Unit` int(11) NOT NULL DEFAULT '100',
  `Description` mediumtext NOT NULL,
  `MRP` float(10,2) NOT NULL,
  `JalpanPrice` float(10,2) NOT NULL,
  `Discount` float(10,2) NOT NULL DEFAULT '0.00',
  `Photo` varchar(200) NOT NULL,
  `isOutOfStock` tinyint(4) NOT NULL DEFAULT '0',
  `Recomended` tinyint(1) NOT NULL DEFAULT '0',
  `Popular` tinyint(1) NOT NULL DEFAULT '0',
  `Rating` float(10,2) NOT NULL DEFAULT '0.00',
  `Available` tinyint(1) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1838 ;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`ID`, `IDCanteen`, `IDMenu`, `IDSubmenu`, `IDSubsubmenu`, `Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`, `isOutOfStock`, `Recomended`, `Popular`, `Rating`, `Available`, `User`, `Date`, `Time`) VALUES
(1, 1, 13, 0, 0, '3/4 White Bread', 0.00, 99, '', 0.00, 0.00, 0.00, 'http://139.59.38.160/sendit/Dashboard/products/5862ee767d90850fc3ce2909.png', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(2, 1, 13, 0, 0, 'Brioche Bread', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(3, 1, 13, 0, 0, 'Brown Bread', 0.00, 100, '', 0.00, 16.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(4, 1, 13, 0, 0, 'Chocolate Chip Bread', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(5, 1, 13, 0, 0, 'Cocktail Crispy Rolls', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(6, 1, 13, 0, 0, 'Cocktail Long Rolls', 0.00, 100, '', 0.00, 24.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(7, 1, 13, 0, 0, 'Cocktail Portugeese Rolls', 0.00, 100, '', 0.00, 14.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(8, 1, 13, 0, 0, 'Cocktail Round Rolls', 0.00, 100, '', 0.00, 24.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(9, 1, 13, 0, 0, 'Colour Buns (with seeds)', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(10, 1, 13, 0, 0, 'Colour Hot dog Rolls (with seeds)', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(11, 1, 13, 0, 0, 'Crispy Rolls', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(12, 1, 13, 0, 0, 'French Bread', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(13, 1, 13, 0, 0, 'Garlic Bread in a Foil', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(14, 1, 13, 0, 0, 'Garlic Rolls', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(15, 1, 13, 0, 0, '(New) Garlic Bread', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(16, 1, 13, 0, 0, '(New) Cheezzy Garlic Bread', 0.00, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(17, 1, 13, 0, 0, 'Hot Dog Rolls', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(18, 1, 13, 0, 0, 'Kittie Bread', 0.00, 100, '', 0.00, 20.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(19, 1, 13, 0, 0, 'Kittie Rolls', 0.00, 100, '', 0.00, 20.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(20, 1, 13, 0, 0, 'Knotted Cocktail rolls', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(21, 1, 13, 0, 0, 'Milk Loaf Bread', 0.00, 100, '', 0.00, 20.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(22, 1, 13, 0, 0, 'Millie Bread', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(23, 1, 13, 0, 0, 'Miltiseed Bread (Health Bread)', 0.00, 100, '', 0.00, 37.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(24, 1, 13, 0, 0, 'Miniture Bread', 0.00, 100, '', 0.00, 8.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(25, 1, 13, 0, 0, 'Naan (Sliced/Unsliced)', 0.00, 100, '', 0.00, 16.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(26, 1, 13, 0, 0, 'Naan Rolls', 0.00, 100, '', 0.00, 16.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(27, 1, 13, 0, 0, 'Pitta Bread', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(28, 1, 13, 0, 0, 'Round Rolls', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(29, 1, 13, 0, 0, 'White Bread', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(30, 1, 14, 0, 0, '26 No. 1 - Multi seed loaf', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(31, 1, 14, 0, 0, '27 No. 2 - Kittkie Bread', 0.00, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(32, 1, 14, 0, 0, '28 No. 3 - Milk loaf', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(33, 1, 14, 0, 0, '29 No. 4 - Cocktail Knotted (6)', 0.00, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(34, 1, 14, 0, 0, '30 No. 5 - Cocktail Round Rolls (8)', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(35, 1, 14, 0, 0, '31 No. 6 - Naan', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(36, 1, 14, 0, 0, '32 No. 7 - Naan Rolls (6)', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(37, 1, 14, 0, 0, '33 No. 8 - Brioche', 0.00, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(38, 1, 14, 0, 0, '34 No. 9 - Portugese Rolls (6)', 0.00, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(39, 1, 14, 0, 0, '35 Frozen Bagels (6)', 0.00, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(40, 1, 15, 0, 0, '36 Banofee Crossaints', 0.00, 100, '', 0.00, 19.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(41, 1, 15, 0, 0, '37 Chocolate Cupcakes', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(42, 1, 15, 0, 0, '38 Chocolate Doughnuts', 0.00, 100, '', 0.00, 39.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(43, 1, 15, 0, 0, '39 Chocolate Horeshoes', 0.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(44, 1, 15, 0, 0, '40 Cinnamon Danish', 0.00, 100, '', 0.00, 14.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(45, 1, 15, 0, 0, '41 Coconut Kooksister', 0.00, 100, '', 0.00, 10.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(46, 1, 15, 0, 0, '42 Cream Doughnuts', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(47, 1, 15, 0, 0, '43 Custard & Fresh Cream Doughnuts', 0.00, 100, '', 0.00, 16.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(48, 1, 15, 0, 0, 'Coconut Fresh Cream Doughnuts', 0.00, 100, '', 0.00, 16.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(49, 1, 15, 0, 0, 'Strawberry Fresh Cream Doughnuts', 0.00, 100, '', 0.00, 18.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(50, 1, 15, 0, 0, '44 Custard Danish', 0.00, 100, '', 0.00, 16.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(51, 1, 15, 0, 0, '45 Fresh Cream Strawberry Crossaints', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(52, 1, 15, 0, 0, '46 Jam Flower Tarts', 0.00, 100, '', 0.00, 68.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(53, 1, 15, 0, 0, '47 Jam Tarts (Turn over)', 0.00, 100, '', 0.00, 58.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(54, 1, 15, 0, 0, '48 Lemon Poppy Muffins', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(55, 1, 15, 0, 0, '49 Pastry Cream Doughnuts', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(56, 1, 15, 0, 0, '50 Pecan Nut Danish', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(57, 1, 15, 0, 0, '51 Pecan Nut Horeshoes', 0.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(58, 1, 15, 0, 0, '52 Plain Butter Crossaints', 0.00, 100, '', 0.00, 12.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(59, 1, 15, 0, 0, '53 Plain Horeshoes', 0.00, 100, '', 0.00, 72.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(60, 1, 15, 0, 0, '54 Plain Kooksister', 0.00, 100, '', 0.00, 8.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(61, 1, 15, 0, 0, '55 Sugar Twist', 0.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(62, 1, 15, 0, 0, '56 Vanilla Cupcakes', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(63, 1, 16, 0, 0, '57 Jam Swissroll', 0.00, 92, '', 0.00, 47.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(64, 1, 16, 0, 0, '58 Strawberry & Fresh Cream Swissroll', 0.00, 95, '', 0.00, 57.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(65, 1, 16, 0, 0, '59 Red Cake Fresh Cream Swissroll', 0.00, 100, '', 0.00, 67.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(66, 1, 16, 0, 0, '60 Mini Rainbow Swissroll', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(67, 1, 16, 0, 0, '61 Rainbow Swissroll', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(68, 1, 16, 0, 0, '62 Mini Fresh Cream Swissroll', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(69, 1, 16, 0, 0, '63 Mini Red Cake Fresh Cream Swissroll', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(70, 1, 17, 0, 0, 'Mini Assorted Sweet Meats', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(71, 1, 17, 0, 0, '65 Mini Indvidual Sweet Meats', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(72, 1, 17, 0, 0, '68 Chocolate Eclairs', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(73, 1, 17, 0, 0, '73 Banana Caramel Fresh Cream Eclairs', 0.00, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(74, 1, 18, 0, 0, '74 Barnoffee Tarts', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(75, 1, 18, 0, 0, '75 Barone - rings', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(76, 1, 18, 0, 0, '76 Cheese Cake - rings', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(77, 1, 18, 0, 0, '77 Chocolate Mousse - rings', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(78, 1, 18, 0, 0, '78 Fruit Cups', 0.00, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(79, 1, 18, 0, 0, '79 Meduim Milktarts', 0.00, 100, '', 0.00, 10.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(80, 1, 18, 0, 0, '80 Mini Peppermint Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(81, 1, 18, 0, 0, '81 Mini Flake Cake Log', 0.00, 100, '', 0.00, 19.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(82, 1, 18, 0, 0, '82 Mini Barone Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(83, 1, 18, 0, 0, '83 Mini Choc Mousse Garanach Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(84, 1, 18, 0, 0, '84 Mini Chocolate Sauce Cake Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(85, 1, 18, 0, 0, '85 Mini Custard & Fresh Cream Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(86, 1, 18, 0, 0, '86 Mini Milklybar Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(87, 1, 18, 0, 0, '87 Mini Milktarts', 0.00, 100, '', 0.00, 7.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(88, 1, 18, 0, 0, '88 Mini Red Cake Fresh Cream Log', 0.00, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(89, 1, 18, 0, 0, '89 Mini Waffer Log', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(90, 1, 18, 0, 0, '90 Mixed Red Cake & Chocolate Lamington', 0.00, 100, '', 0.00, 47.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(91, 1, 18, 0, 0, '91 Red Velvet - ring', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(92, 1, 18, 0, 0, '92 Tiramisu - ring', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(93, 1, 18, 0, 0, '93 Peppermint - ring', 0.00, 100, '', 0.00, 17.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(94, 1, 19, 0, 0, '94 6 Rainbow Velvet Cake', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(95, 1, 19, 0, 0, '95 6 Round Barone Cake', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(96, 1, 19, 0, 0, '96 6 Round Milkybar Cake', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(97, 1, 19, 0, 0, '97 6 Round Red Velvet Cake', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(98, 1, 19, 0, 0, '98 8 Round Chocolate Mousse Garanach', 0.00, 100, '', 0.00, 200.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(99, 1, 19, 0, 0, '99 Banana Caramel & Fresh Cream Log', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(100, 1, 19, 0, 0, '100 Barone Loaf', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(101, 1, 19, 0, 0, '101 Cheese Cake Loaf', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(102, 1, 19, 0, 0, '102 Cherry Medira', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(103, 1, 19, 0, 0, '103 Chocolate Black Forest Cake', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(104, 1, 19, 0, 0, '104 Chocolate Gananach Loaf', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(105, 1, 19, 0, 0, '105 Flake Cake Loaf', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(106, 1, 19, 0, 0, '106 Milkly Bar Loaf', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(107, 1, 19, 0, 0, '107 Milktart (Large)', 0.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(108, 1, 19, 0, 0, '108 Plain Medira', 0.00, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(109, 1, 19, 0, 0, '109 Red Cake Fresh Cream Loaf', 0.00, 100, '', 0.00, 57.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(110, 1, 19, 0, 0, '110 Vanilla Strawberry Fresh Cream Cake', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(111, 1, 20, 0, 0, '111 1kg Chevro', 0.00, 100, '', 0.00, 155.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(112, 1, 20, 0, 0, '112 500g Chevro', 0.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(113, 1, 20, 0, 0, '113 250g Chevro', 0.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(114, 1, 20, 0, 0, '114 Assorted Rusks', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(115, 1, 20, 0, 0, '115 Ghatia', 0.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(116, 1, 20, 0, 0, '116 Ghee White Roti', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(117, 1, 20, 0, 0, '117 Health Roti Brown (small)', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(118, 1, 20, 0, 0, '118 Health Roti White (small)', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(119, 1, 20, 0, 0, '119 Murku', 0.00, 100, '', 0.00, 0.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(120, 1, 20, 0, 0, '120 Purr mix', 0.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(121, 1, 20, 0, 0, '121 Sew (Plain)', 0.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(122, 1, 20, 0, 0, '122 Sew Nuts', 0.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(123, 1, 20, 0, 0, '123 Haseena Pure Butter Biscuits - Peppermint', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(124, 1, 20, 0, 0, '124 Haseena Pure Butter Biscuits - Milkybar', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(125, 1, 20, 0, 0, '125 Haseena Pure Butter Biscuits - Coconut', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(126, 1, 20, 0, 0, '126 Haseena Pure Butter Biscuits - Short Bread', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(127, 1, 20, 0, 0, '127 Haseena Pure Butter Biscuits - Royal Creams', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(128, 1, 20, 0, 0, '128 Haseena Pure Butter Biscuits - Romany Creams', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(129, 1, 20, 0, 0, '129 Haseena Pure Butter Biscuits - Pecan Nut', 0.00, 100, '', 0.00, 0.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(130, 1, 20, 0, 0, '130 Haseena Pure Butter Biscuits - Custard', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(131, 1, 20, 0, 0, '131 Haseena Pure Butter Biscuits - Vanilla Choc', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(132, 1, 20, 0, 0, '132 Haseena Pure Butter Biscuits - Coconut Choc', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(133, 1, 21, 0, 0, '133 Chicken Samoosas', 0.00, 99, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(134, 1, 21, 0, 0, '134 Mexican Chicken Strips', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(135, 1, 21, 0, 0, '135 Portuguese Chicken Strips', 0.00, 99, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(136, 1, 21, 0, 0, '136 Zinger Chicken Strips (Mild, meduim, Hot)', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(137, 1, 21, 0, 0, '137 Massimo''s Big Pizza Base', 0.00, 100, '', 0.00, 31.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(138, 1, 21, 0, 0, '138 Massimo''s Meduim Pizza Base', 0.00, 100, '', 0.00, 28.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(139, 1, 21, 0, 0, '139 Massimo''s 12cm Cheese Pizza Base', 0.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(140, 1, 21, 0, 0, '140 Massimo''s Cocktail Pizza Bases 20''s', 0.00, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(141, 1, 21, 0, 0, '70 Pistachio Petit Fours', 0.00, 100, '', 0.00, 0.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(142, 1, 21, 0, 0, '71 Red Velvet Petit Fours', 0.00, 100, '', 0.00, 0.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(143, 1, 21, 0, 0, '72 Salted Caramel Éclairs', 0.00, 100, '', 0.00, 0.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(144, 2, 1, 0, 0, 'Pastrami', 1.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(145, 2, 1, 0, 0, 'Cooked Corned Beef', 1.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(146, 2, 1, 0, 0, 'breakfast beef (FETTI)', 1.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(147, 2, 1, 0, 0, 'roast beef (whole sale price)', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(148, 2, 1, 0, 0, 'Smoked Beef (whole sale price)', 1.00, 100, '', 0.00, 154.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(149, 2, 1, 0, 0, 'SMOKE CHICKEN WHOLE/SLICED', 1.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(150, 2, 2, 0, 0, 'Pressed Beef loaf', 1.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(151, 2, 2, 0, 0, 'Mushroom Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(152, 2, 2, 0, 0, 'Pepper Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(153, 2, 2, 0, 0, 'Paprika Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(154, 2, 2, 0, 0, 'Chilli Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(155, 2, 2, 0, 0, 'Cheese Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(156, 2, 2, 0, 0, 'Meat Loaf ', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(157, 2, 2, 0, 0, 'Beef Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(158, 2, 2, 0, 0, 'Chicken Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(159, 2, 2, 0, 0, 'Pressed Chicken Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(160, 2, 2, 0, 0, 'Achaar Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(161, 2, 2, 0, 0, 'Dhaniyah Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(162, 2, 2, 0, 0, 'Salami Montana Loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(163, 2, 2, 0, 0, 'olive loaf', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(164, 2, 3, 0, 0, 'Mutton Sausages (Spicy)', 1.00, 100, '', 0.00, 108.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(165, 2, 3, 0, 0, 'special Beef Sausages', 1.00, 100, '', 0.00, 108.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(166, 2, 3, 0, 0, 'Chicken Sausages', 1.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(167, 2, 3, 0, 0, 'Salt & Pepper Sausages', 1.00, 100, '', 0.00, 108.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(168, 2, 3, 0, 0, 'DHANIYA SAUSAGES', 1.00, 100, '', 0.00, 108.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(169, 2, 3, 0, 0, 'BOMBAY SAUSAGES', 1.00, 100, '', 0.00, 108.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(170, 2, 3, 0, 0, 'Spiced Wors', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(171, 2, 3, 0, 0, 'Salt & Pepper Wors', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(172, 2, 3, 0, 0, 'Traditional Wors beef', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(173, 2, 3, 0, 0, 'traditional wors mutton', 1.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(174, 2, 3, 0, 0, 'Mutton Lollies', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(175, 2, 3, 0, 0, 'Chicken Lollies', 1.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(176, 2, 3, 0, 0, 'Mutton Fingers', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(177, 2, 3, 0, 0, 'Chicken Fingers', 1.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(178, 2, 3, 0, 0, 'Hollywood Chops', 1.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(179, 2, 3, 0, 0, 'Mutton Burgers (Spicy) 100g', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(180, 2, 3, 0, 0, 'Salt & Pepper Burgers 100g', 1.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(181, 2, 3, 0, 0, 'chicken burgers 100g', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(182, 2, 3, 0, 0, 'breakfast sausages', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(183, 2, 3, 0, 0, 'cocktail sausages', 1.00, 100, '', 0.00, 108.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(184, 2, 3, 0, 0, 'chicken skewer kebabs', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(185, 2, 3, 0, 0, 'juicy mutton viennas', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(186, 2, 3, 0, 0, 'cocktail viennas', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(187, 2, 3, 0, 0, 'smoked viennas', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(188, 2, 3, 0, 0, 'mutton russian', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(189, 2, 3, 0, 0, 'plain viennas', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(190, 2, 3, 0, 0, 'cheese russians', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(191, 2, 3, 0, 0, 'cheese kassegrill', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(192, 2, 3, 0, 0, 'frankfurters', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(193, 2, 3, 0, 0, 'pre-coocked wors', 1.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(194, 2, 3, 0, 0, 'crumbed chicken pattis (3kg box)', 3.00, 100, '', 0.00, 169.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(195, 2, 3, 0, 0, 'crumbed chicken breast (3KG BOX)', 3.00, 100, '', 0.00, 71.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(196, 2, 3, 0, 0, 'chicken chimoosa (3 kg box)', 3.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(197, 2, 3, 0, 0, 'chicken nuggets (3 kg box)', 3.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(198, 2, 3, 0, 0, 'chicken strips', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(199, 2, 3, 0, 0, 'chicken kieves', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(200, 2, 3, 0, 0, 'beef olive', 1.00, 100, '', 0.00, 93.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(201, 2, 3, 0, 0, 'mutton seesh kabab', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(202, 2, 3, 0, 0, 'chicken seesh kabab', 1.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(203, 2, 3, 0, 0, 'nadia''s kabab mutton', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(204, 2, 3, 0, 0, 'plain garlic polony 450g', 0.45, 100, '', 0.00, 33.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(205, 2, 3, 0, 0, 'mutton garlic polony 450G', 0.45, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(206, 2, 3, 0, 0, 'chicken polony 450g', 0.45, 100, '', 0.00, 33.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(207, 2, 3, 0, 0, 'HOMEMADE GARLIC POLONY 450GR', 0.45, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(208, 2, 3, 0, 0, 'CHILLI SALAMI 450GR', 0.45, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(209, 2, 3, 0, 0, 'PAPRIKA SALAMI 450GR', 0.45, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(210, 2, 3, 0, 0, 'HOT AND SPICY SALAMI 450GR', 0.45, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(211, 2, 3, 0, 0, 'PLAIN SALAMI 450GR', 0.45, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(212, 2, 3, 0, 0, 'french polony 1kg', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(213, 2, 3, 0, 0, 'chicken french 1kg', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(214, 2, 8, 0, 0, 'marinated chops', 1.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(215, 2, 8, 0, 0, 'marinated spare ribs sliced', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(216, 2, 8, 0, 0, 'marinated spare ribs whole', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(217, 2, 8, 0, 0, 'marinated t bone', 1.00, 100, '', 0.00, 126.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(218, 2, 8, 0, 0, 'marinated topside steak', 1.00, 100, '', 0.00, 115.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(219, 2, 8, 0, 0, 'marinated rump steak', 1.00, 100, '', 0.00, 137.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(220, 2, 8, 0, 0, 'marinated sirloin steak', 1.00, 100, '', 0.00, 126.51, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(221, 2, 8, 0, 0, 'marinated silverside / minut steak', 1.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(222, 2, 8, 0, 0, 'marinated rump sosaties', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(223, 2, 8, 0, 0, 'marinated beef stir fry', 1.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(224, 2, 8, 0, 0, 'marinated chicken stir fry', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(225, 2, 8, 0, 0, 'marinated chicken fillet', 1.00, 100, '', 0.00, 87.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(226, 2, 8, 0, 0, 'marinated chicken drumsticks', 1.00, 100, '', 0.00, 76.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(227, 2, 8, 0, 0, 'marinated chicken sosaties', 1.00, 100, '', 0.00, 87.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(228, 2, 8, 0, 0, 'marinated skinless chickens (whole)', 1.00, 100, '', 0.00, 60.49, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(229, 2, 9, 0, 0, 'lamb chops', 1.00, 100, '', 0.00, 159.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(230, 2, 9, 0, 0, 'curry mutton (shoulder)', 1.00, 100, '', 0.00, 137.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(231, 2, 9, 0, 0, 'leg of lamb bone on whole or cubed', 1.00, 100, '', 0.00, 159.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(232, 2, 9, 0, 0, 'spare ribs', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(233, 2, 9, 0, 0, 'deboned lamb leg cubed/whole', 1.00, 100, '', 0.00, 196.90, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(234, 2, 9, 0, 0, 'MUTTON MINCE', 1.00, 100, '', 0.00, 121.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(235, 2, 10, 0, 0, 'forquarter', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(236, 2, 10, 0, 0, 'stewing beef', 1.00, 100, '', 0.00, 93.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(237, 2, 10, 0, 0, 't bone steak', 1.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(238, 2, 10, 0, 0, 't bone steak with fillet', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(239, 2, 10, 0, 0, 'fillet steak whole', 1.00, 100, '', 0.00, 242.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(240, 2, 10, 0, 0, 'rump steak whole', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(241, 2, 10, 0, 0, 'topside steak whole', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(242, 2, 10, 0, 0, 'sirloin steak whole', 1.00, 100, '', 0.00, 137.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(243, 2, 10, 0, 0, 'silver side steak whole', 1.00, 100, '', 0.00, 137.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(244, 2, 10, 0, 0, 'goulash steak', 1.00, 100, '', 0.00, 104.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(245, 2, 10, 0, 0, ' Sirloin Sliced', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(246, 2, 10, 0, 0, 'Rump sliced', 1.00, 100, '', 0.00, 132.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(247, 2, 10, 0, 0, 'Topside Sliced', 1.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(248, 2, 10, 0, 0, 'Fillet Sliced', 1.00, 100, '', 0.00, 253.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(249, 2, 10, 0, 0, 'brisket', 1.00, 100, '', 0.00, 93.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(250, 2, 10, 0, 0, 'short ribs', 1.00, 100, '', 0.00, 93.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(251, 2, 10, 0, 0, 'beef shin', 1.00, 100, '', 0.00, 93.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(252, 2, 10, 0, 0, 'beef liver', 1.00, 100, '', 0.00, 54.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(253, 2, 10, 0, 0, 'STEAK MINCE', 1.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(254, 2, 10, 0, 0, 'BEEF MINCE', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(255, 2, 10, 0, 0, 'RIB EYE ', 1.00, 100, '', 0.00, 176.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(256, 2, 11, 0, 0, 'whole chicken skinless', 1.00, 99, '', 0.00, 60.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(257, 2, 11, 0, 0, 'whole chicken skinon', 1.00, 99, '', 0.00, 49.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(258, 2, 11, 0, 0, 'drumsticks skinon', 5.00, 100, '', 0.00, 71.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(259, 2, 11, 0, 0, 'chicken thighs skinon', 5.00, 100, '', 0.00, 60.49, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(260, 2, 11, 0, 0, 'chicken leg quarters skinon', 5.00, 100, '', 0.00, 54.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(261, 2, 11, 0, 0, 'chicken wings skinon', 5.00, 100, '', 0.00, 54.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(262, 2, 11, 0, 0, 'chicken liver', 1.00, 100, '', 0.00, 43.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(263, 2, 11, 0, 0, 'chicken gizzards', 1.00, 100, '', 0.00, 43.99, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(264, 2, 11, 0, 0, 'chicken fillets', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(265, 2, 11, 0, 0, 'drumsticks skinless', 1.00, 100, '', 0.00, 82.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(266, 3, 22, 0, 0, 'ALMONDS CARAMEL', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(267, 3, 22, 0, 0, 'ALMONDS FLAKED', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(268, 3, 22, 0, 0, 'ALMONDS BROWN FLAKED', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(269, 3, 22, 0, 0, 'ALMONDS NIBBED', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(270, 3, 22, 0, 0, 'ALMONDS GROUND', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(271, 3, 22, 0, 0, 'ALMONDS SLIVERED', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(272, 3, 22, 0, 0, 'ALMONDS BLANCHED', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(273, 3, 22, 0, 0, 'ALMONDS HONEY', 0.50, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(274, 3, 22, 0, 0, 'ALMONDS PINK & WHITE', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(275, 3, 22, 0, 0, 'ALMONDS NATURAL', 0.50, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(276, 3, 22, 0, 0, 'ALMONDS CSSR Catering Grade', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(277, 3, 22, 0, 0, 'ALMONDS ROASTED', 0.50, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(278, 3, 22, 0, 0, 'BRAZIL NUTS', 0.50, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(279, 3, 22, 0, 0, 'CARAMEL MIXED NUTS', 0.50, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(280, 3, 22, 0, 0, 'CARAMEL PEANUTS', 0.50, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(281, 3, 22, 0, 0, 'CASHEW (PLAIN/SALTED/PERI)', 0.50, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(282, 3, 22, 0, 0, 'CASHEW JUMBO (PLAIN/SALTED/PERI)', 0.50, 100, '', 0.00, 170.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(283, 3, 22, 0, 0, 'CHEVRO SNAX MIX', 0.50, 100, '', 0.00, 52.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(284, 3, 22, 0, 0, 'CASHEW PIECES', 0.50, 100, '', 0.00, 98.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(285, 3, 22, 0, 0, 'CHIC PEAS', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(286, 3, 22, 0, 0, 'COCONUT DESSICATED', 0.50, 100, '', 0.00, 42.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(287, 3, 22, 0, 0, 'COCONUT SHREDDS', 0.50, 100, '', 0.00, 58.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(288, 3, 22, 0, 0, 'HAWAIAN MIX', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(289, 3, 22, 0, 0, 'HAZEL NUTS', 0.50, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(290, 3, 22, 0, 0, 'HAZEL NUTS BLANCHED', 0.50, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(291, 3, 22, 0, 0, 'INSHELL PECANS', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(292, 3, 22, 0, 0, 'INSHELL MIX NUTS', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(293, 3, 22, 0, 0, 'INSHELL WALNUTS', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(294, 3, 22, 0, 0, 'JUNGLE MIX', 0.50, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(295, 3, 22, 0, 0, 'MACADAMIA', 0.50, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(296, 3, 22, 0, 0, 'MIXED NUTS ECONOMIX RAW', 0.50, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(297, 3, 22, 0, 0, 'MIXED NUTS ROASTED', 0.50, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(298, 3, 22, 0, 0, 'PEANUT NIBS', 0.50, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(299, 3, 22, 0, 0, 'PEANUTS GIANT PERI', 0.50, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(300, 3, 22, 0, 0, 'PEANUTS GIANT SALTED', 0.50, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(301, 3, 22, 0, 0, 'PEANUTS GIANT REDSKIN RAW', 0.50, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(302, 3, 22, 0, 0, 'PEANUTS GIANT REDSKIN SALTED', 0.50, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(303, 3, 22, 0, 0, 'PEANUTS MULTICOLOR CANDY', 0.50, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(304, 3, 22, 0, 0, 'PEANUTS PERI/SALTED', 0.50, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(305, 3, 22, 0, 0, 'PEANUTS REDSKIN RAW', 0.50, 100, '', 0.00, 20.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(306, 3, 22, 0, 0, 'PEANUTS REDSKIN SALTED', 0.50, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(307, 3, 22, 0, 0, 'PEANUTS & RAISINS', 0.50, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(308, 3, 22, 0, 0, 'PECAN NUTS', 0.50, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(309, 3, 22, 0, 0, 'PISTACHIO WHITE', 0.50, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(310, 3, 22, 0, 0, 'PISTACHIO GREEN', 0.50, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(311, 3, 22, 0, 0, 'WALNUTS', 0.50, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(312, 3, 22, 0, 0, 'ALMONDS CARAMEL', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(313, 3, 22, 0, 0, 'ALMONDS FLAKED', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(314, 3, 22, 0, 0, 'ALMONDS BROWN FLAKED', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(315, 3, 22, 0, 0, 'ALMONDS NIBBED', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(316, 3, 22, 0, 0, 'ALMONDS GROUND', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(317, 3, 22, 0, 0, 'ALMONDS SLIVERED', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(318, 3, 22, 0, 0, 'ALMONDS BLANCHED', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(319, 3, 22, 0, 0, 'ALMONDS HONEY', 1.00, 100, '', 0.00, 250.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(320, 3, 22, 0, 0, 'ALMONDS PINK & WHITE', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(321, 3, 22, 0, 0, 'ALMONDS NATURAL', 1.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(322, 3, 22, 0, 0, 'ALMONDS CSSR Catering Grade', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(323, 3, 22, 0, 0, 'ALMONDS ROASTED', 1.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(324, 3, 22, 0, 0, 'BRAZIL NUTS', 1.00, 100, '', 0.00, 300.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(325, 3, 22, 0, 0, 'CARAMEL MIXED NUTS', 1.00, 100, '', 0.00, 240.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(326, 3, 22, 0, 0, 'CARAMEL PEANUTS', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(327, 3, 22, 0, 0, 'CASHEW (PLAIN/SALTED/PERI)', 1.00, 100, '', 0.00, 260.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(328, 3, 22, 0, 0, 'CASHEW JUMBO (PLAIN/SALTED/PERI)', 1.00, 100, '', 0.00, 340.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(329, 3, 22, 0, 0, 'CHEVRO SNAX MIX', 1.00, 100, '', 0.00, 104.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(330, 3, 22, 0, 0, 'CASHEW PIECES', 1.00, 100, '', 0.00, 196.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(331, 3, 22, 0, 0, 'CHIC PEAS', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(332, 3, 22, 0, 0, 'COCONUT DESSICATED', 1.00, 100, '', 0.00, 84.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(333, 3, 22, 0, 0, 'COCONUT SHREDDS', 1.00, 100, '', 0.00, 116.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(334, 3, 22, 0, 0, 'HAWAIAN MIX', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(335, 3, 22, 0, 0, 'HAZEL NUTS', 1.00, 100, '', 0.00, 240.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(336, 3, 22, 0, 0, 'HAZEL NUTS BLANCHED', 1.00, 100, '', 0.00, 260.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(337, 3, 22, 0, 0, 'INSHELL PECANS', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(338, 3, 22, 0, 0, 'INSHELL MIX NUTS', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(339, 3, 22, 0, 0, 'INSHELL WALNUTS', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(340, 3, 22, 0, 0, 'JUNGLE MIX', 1.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(341, 3, 22, 0, 0, 'MACADAMIA', 1.00, 100, '', 0.00, 270.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(342, 3, 22, 0, 0, 'MIXED NUTS ECONOMIX RAW', 1.00, 100, '', 0.00, 210.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(343, 3, 22, 0, 0, 'MIXED NUTS ROASTED', 1.00, 100, '', 0.00, 210.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(344, 3, 22, 0, 0, 'PEANUT NIBS', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(345, 3, 22, 0, 0, 'PEANUTS GIANT PERI', 1.00, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(346, 3, 22, 0, 0, 'PEANUTS GIANT SALTED', 1.00, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(347, 3, 22, 0, 0, 'PEANUTS GIANT REDSKIN RAW', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(348, 3, 22, 0, 0, 'PEANUTS GIANT REDSKIN SALTED', 1.00, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(349, 3, 22, 0, 0, 'PEANUTS MULTICOLOR CANDY', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(350, 3, 22, 0, 0, 'PEANUTS PERI/SALTED', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(351, 3, 22, 0, 0, 'PEANUTS REDSKIN RAW', 1.00, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(352, 3, 22, 0, 0, 'PEANUTS REDSKIN SALTED', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(353, 3, 22, 0, 0, 'PEANUTS & RAISINS', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(354, 3, 22, 0, 0, 'PECAN NUTS', 1.00, 100, '', 0.00, 240.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(355, 3, 22, 0, 0, 'PISTACHIO WHITE', 1.00, 100, '', 0.00, 290.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(356, 3, 22, 0, 0, 'PISTACHIO GREEN', 1.00, 100, '', 0.00, 440.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(357, 3, 22, 0, 0, 'WALNUTS', 1.00, 100, '', 0.00, 240.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(358, 3, 23, 0, 0, 'DATES PITTED', 0.50, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(359, 3, 23, 0, 0, 'DRIED APPLES', 0.50, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(360, 3, 23, 0, 0, 'DRIED APRICOTS TURKISH', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(361, 3, 23, 0, 0, 'DRIED BANANA', 0.50, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(362, 3, 23, 0, 0, 'DRIED BANANA CHIPS', 0.50, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(363, 3, 23, 0, 0, 'DRIED CAKE MIX', 0.50, 100, '', 0.00, 38.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(364, 3, 23, 0, 0, 'DRIED CURRANTS', 0.50, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(365, 3, 23, 0, 0, 'DRIED CRANBERRIES', 0.50, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(366, 3, 23, 0, 0, 'DRIED FIGS', 0.50, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(367, 3, 23, 0, 0, 'DRIED FRUIT & NUT MEDLEY', 0.50, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(368, 3, 23, 0, 0, 'DRIED FRUIT SALAD', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(369, 3, 23, 0, 0, 'DRIED GUAVA', 0.50, 100, '', 0.00, 78.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(370, 3, 23, 0, 0, 'DRIED MANGO', 0.50, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(371, 3, 23, 0, 0, 'DRIED MDF SUGAR CUBES/LOLLIES', 0.50, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(372, 3, 23, 0, 0, 'DRIED MEBOS SUGAR CHIPS', 0.50, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(373, 3, 23, 0, 0, 'DRIED MEBOS ROUND', 0.50, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(374, 3, 23, 0, 0, 'DRIED MIXED PEEL', 0.50, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(375, 3, 23, 0, 0, 'DRIED PEACHES CAPE YELLOW', 0.50, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(376, 3, 23, 0, 0, 'DRIED PEARS', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(377, 3, 23, 0, 0, 'DRIED PRUNES', 0.50, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(378, 3, 23, 0, 0, 'DRIED PRUNE PITTED (NO PIPS)', 0.50, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(379, 3, 23, 0, 0, 'DRIED RAISINS SEEDLESS', 0.50, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(380, 3, 23, 0, 0, 'DRIED RAISINS HANEPOORT', 0.50, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(381, 3, 23, 0, 0, 'DRIED SULTANA GOLDEN', 0.50, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(382, 3, 23, 0, 0, 'DRIED GLAZED FRUIT ASS MIX', 0.50, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(383, 3, 23, 0, 0, 'DRIED GLAZED CHERRIES', 0.50, 100, '', 0.00, 82.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(384, 3, 23, 0, 0, 'DRIED NECTARINES', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(385, 3, 23, 0, 0, 'FRUIT SQUARES DICED', 0.50, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(386, 3, 23, 0, 0, 'FRUIT FLAKES', 0.50, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(387, 3, 23, 0, 0, 'FRUIT MUNCH', 0.50, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(388, 3, 24, 0, 0, 'SEEDS PAPITAS GREEN PUMPKIN', 0.50, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00');
INSERT INTO `foods` (`ID`, `IDCanteen`, `IDMenu`, `IDSubmenu`, `IDSubsubmenu`, `Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`, `isOutOfStock`, `Recomended`, `Popular`, `Rating`, `Available`, `User`, `Date`, `Time`) VALUES
(389, 3, 24, 0, 0, 'SEEDS LINSEEDS', 0.50, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(390, 3, 24, 0, 0, 'SEEDS POPCORN', 0.50, 100, '', 0.00, 15.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(391, 3, 24, 0, 0, 'SEEDS SESAME', 0.50, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(392, 3, 24, 0, 0, 'SEEDS SUNFLOWER', 0.50, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(393, 3, 24, 0, 0, 'SEEDS MIXED', 0.50, 100, '', 0.00, 48.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(394, 3, 24, 0, 0, 'SEEDS POPPY', 0.50, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(395, 3, 24, 0, 0, 'SEEDS CHIA', 0.50, 100, '', 0.00, 52.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(396, 3, 23, 0, 0, 'DATES PITTED', 1.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(397, 3, 23, 0, 0, 'DRIED APPLES', 1.00, 100, '', 0.00, 250.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(398, 3, 23, 0, 0, 'DRIED APRICOTS TURKISH', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(399, 3, 23, 0, 0, 'DRIED BANANA', 1.00, 100, '', 0.00, 190.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(400, 3, 23, 0, 0, 'DRIED BANANA CHIPS', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(401, 3, 23, 0, 0, 'DRIED CAKE MIX', 1.00, 100, '', 0.00, 76.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(402, 3, 23, 0, 0, 'DRIED CURRANTS', 1.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(403, 3, 23, 0, 0, 'DRIED CRANBERRIES', 1.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(404, 3, 23, 0, 0, 'DRIED FIGS', 1.00, 100, '', 0.00, 170.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(405, 3, 23, 0, 0, 'DRIED FRUIT & NUT MEDLEY', 1.00, 100, '', 0.00, 170.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(406, 3, 23, 0, 0, 'DRIED FRUIT SALAD', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(407, 3, 23, 0, 0, 'DRIED GUAVA', 1.00, 100, '', 0.00, 156.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(408, 3, 23, 0, 0, 'DRIED MANGO', 1.00, 100, '', 0.00, 240.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(409, 3, 23, 0, 0, 'DRIED MDF SUGAR CUBES/LOLLIES', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(410, 3, 23, 0, 0, 'DRIED MEBOS SUGAR CHIPS', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(411, 3, 23, 0, 0, 'DRIED MEBOS ROUND', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(412, 3, 23, 0, 0, 'DRIED MIXED PEEL', 1.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(413, 3, 23, 0, 0, 'DRIED PEACHES CAPE YELLOW', 1.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(414, 3, 23, 0, 0, 'DRIED PEARS', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(415, 3, 23, 0, 0, 'DRIED PRUNES', 1.00, 100, '', 0.00, 90.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(416, 3, 23, 0, 0, 'DRIED PRUNE PITTED (NO PIPS)', 1.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(417, 3, 23, 0, 0, 'DRIED RAISINS SEEDLESS', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(418, 3, 23, 0, 0, 'DRIED RAISINS HANEPOORT', 1.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(419, 3, 23, 0, 0, 'DRIED SULTANA GOLDEN', 1.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(420, 3, 23, 0, 0, 'DRIED GLAZED FRUIT ASS MIX', 1.00, 100, '', 0.00, 250.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(421, 3, 23, 0, 0, 'DRIED GLAZED CHERRIES', 1.00, 100, '', 0.00, 164.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(422, 3, 23, 0, 0, 'DRIED NECTARINES', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(423, 3, 23, 0, 0, 'FRUIT SQUARES DICED', 1.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(424, 3, 23, 0, 0, 'FRUIT FLAKES', 1.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(425, 3, 23, 0, 0, 'FRUIT MUNCH', 1.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(426, 3, 24, 0, 0, 'SEEDS PAPITAS GREEN PUMPKIN', 1.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(427, 3, 24, 0, 0, 'SEEDS LINSEEDS', 1.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(428, 3, 24, 0, 0, 'SEEDS POPCORN', 1.00, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(429, 3, 24, 0, 0, 'SEEDS SESAME', 1.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(430, 3, 24, 0, 0, 'SEEDS SUNFLOWER', 1.00, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(431, 3, 24, 0, 0, 'SEEDS MIXED', 1.00, 100, '', 0.00, 96.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(432, 3, 24, 0, 0, 'SEEDS POPPY', 1.00, 100, '', 0.00, 170.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(433, 3, 24, 0, 0, 'SEEDS CHIA', 1.00, 100, '', 0.00, 104.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(434, 3, 28, 0, 0, 'Safron', 0.01, 100, '', 0.00, 475.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(435, 3, 25, 0, 0, 'BILTONG TRADITIONAL STICKS', 0.15, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(436, 3, 25, 0, 0, 'BILTONG PERI STICKS', 0.15, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(437, 3, 25, 0, 0, 'BILTONG MILD PERI STICKS', 0.15, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(438, 3, 25, 0, 0, 'BILTONG TRADITIONAL CRISP', 0.15, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(439, 3, 25, 0, 0, 'BILTONG PERI CRISP', 0.15, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(440, 3, 26, 0, 0, 'ALMONDS BLANCHED', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(441, 3, 26, 0, 0, 'ALMONDS SLIVERED', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(442, 3, 26, 0, 0, 'ALMONDS NIBBED', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(443, 3, 26, 0, 0, 'ALMONDS GROUND', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(444, 3, 26, 0, 0, 'ALMONDS ROASTED', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(445, 3, 26, 0, 0, 'ALMONDS FLAKED', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(446, 3, 26, 0, 0, 'ALMONDS HONEY', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(447, 3, 26, 0, 0, 'ALMONDS CARAMEL', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(448, 3, 26, 0, 0, 'ALMONDS BBQ', 0.20, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(449, 3, 26, 0, 0, 'BRAZIL NUTS', 0.20, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(450, 3, 26, 0, 0, 'CASHEWS PLAIN', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(451, 3, 26, 0, 0, 'CASHEWS SALTED', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(452, 3, 26, 0, 0, 'CASHEWS PERI', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(453, 3, 26, 0, 0, 'CORN (BBQ/CHUTNEY/CHILLI)', 0.20, 100, '', 0.00, 20.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(454, 3, 26, 0, 0, 'CORN JUMBO (BBQ)', 0.20, 100, '', 0.00, 33.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(455, 3, 26, 0, 0, 'HAZEL NUTS', 0.20, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(456, 3, 26, 0, 0, 'MACADAMIA (PLAIN/ROASTED)', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(457, 3, 26, 0, 0, 'PISTACHIO WHITE', 0.20, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(458, 3, 26, 0, 0, 'PECAN NUTS', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(459, 3, 26, 0, 0, 'RICE CRACKERS', 0.20, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(460, 3, 26, 0, 0, 'WALNUTS', 0.20, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(461, 3, 26, 0, 0, 'DRIED APPLE RINGS', 0.20, 100, '', 0.00, 50.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(462, 3, 26, 0, 0, 'DRIED MANGO', 0.20, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(463, 3, 26, 0, 0, 'SALLY WILLIAMS ALL', 0.20, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(464, 3, 26, 0, 0, 'JAPANESE RICE CRACKERS', 0.25, 100, '', 0.00, 25.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(465, 3, 26, 0, 0, 'INSHELL PEANUTS (Monkey Nuts)', 0.25, 100, '', 0.00, 20.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(466, 3, 26, 0, 0, 'PINE KERNALS', 0.25, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(467, 3, 26, 0, 0, 'PISTACHIO GREEN Slivered', 0.25, 100, '', 0.00, 200.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(468, 3, 26, 0, 0, 'PISTACHIO GROUND', 0.25, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(469, 3, 26, 0, 0, 'PISTACHIO GREEN', 0.25, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(470, 3, 26, 0, 0, 'SAFARI MEBOS ROUND', 0.25, 100, '', 0.00, 37.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(471, 3, 26, 0, 0, 'SAFARI MDF CUBES', 0.25, 100, '', 0.00, 30.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(472, 3, 26, 0, 0, 'DRIED GLAZED GINGER', 0.25, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(473, 3, 26, 0, 0, 'DRIED TOMATOES', 0.30, 100, '', 0.00, 48.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(474, 3, 26, 0, 0, 'ROASTED PUMPKIN SEED', 0.30, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(475, 3, 26, 0, 0, 'WASABI NUTS', 0.30, 100, '', 0.00, 36.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(476, 3, 27, 0, 0, 'CHOC ALMONDS', 0.40, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(477, 3, 27, 0, 0, 'CHOC HAZELS', 0.40, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(478, 3, 27, 0, 0, 'CHOC RAISINS', 0.40, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(479, 3, 27, 0, 0, 'CHOC PEANUTS', 0.40, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(480, 3, 27, 0, 0, 'CHOC SHORTBREAD', 0.40, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(481, 4, 29, 0, 0, 'LEG OF LAMB ', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(482, 4, 10, 0, 0, 'BEEF LIVER ', 0.00, 100, '', 0.00, 38.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(483, 4, 10, 0, 0, 'POLONY PIZZA ', 0.00, 100, '', 0.00, 40.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(484, 4, 10, 0, 0, 'OX HEART ', 0.00, 100, '', 0.00, 45.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(485, 4, 10, 0, 0, 'CLEAN BEEF TRIPE', 0.00, 100, '', 0.00, 47.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(486, 4, 10, 0, 0, 'RUMP BONES ', 0.00, 100, '', 0.00, 48.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(487, 4, 10, 0, 0, 'OX TONGUE ', 0.00, 100, '', 0.00, 60.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(488, 4, 10, 0, 0, 'OX TRIPE ', 0.00, 100, '', 0.00, 61.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(489, 4, 10, 0, 0, 'UNCOOCKED SKIN ON WINGS', 0.00, 100, '', 0.00, 64.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(490, 4, 10, 0, 0, 'MASALA PATTIES (BEEF)', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(491, 4, 10, 0, 0, 'MILD PATTIES BEEF', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(492, 4, 10, 0, 0, 'CLEAN SHEEP TRIPE', 0.00, 100, '', 0.00, 70.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(493, 4, 10, 0, 0, 'BEEF RAHERS MILD', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(494, 4, 10, 0, 0, 'HAWAAIAN SOSATIES', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(495, 4, 10, 0, 0, 'BEEF OLIVES ', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(496, 4, 10, 0, 0, 'MILD BEEF SAUSAGE', 0.00, 100, '', 0.00, 75.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(497, 4, 10, 0, 0, 'BEEF COCTAIL VIENNAS', 0.00, 100, '', 0.00, 77.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(498, 4, 10, 0, 0, 'TUSSER KEBAABS ', 0.00, 100, '', 0.00, 78.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(499, 4, 10, 0, 0, 'BEEF KEBABS ', 0.00, 100, '', 0.00, 80.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(500, 4, 10, 0, 0, 'CHUCK ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(501, 4, 10, 0, 0, 'CHILLIE WORS VERY HOT (BEEF)', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(502, 4, 10, 0, 0, 'MASALA PATTIES BEEF', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(503, 4, 10, 0, 0, 'BEEF SHIN ', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(504, 4, 10, 0, 0, 'BEEF MILD PATTIES', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(505, 4, 10, 0, 0, 'VIENNAS STIR FRY ', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(506, 4, 10, 0, 0, 'CUBED RUMP STEAK ', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(507, 4, 10, 0, 0, 'KASSEGRILLE ROLL BEEF', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(508, 4, 10, 0, 0, 'ORIGINAL BEEF KEBABS', 0.00, 100, '', 0.00, 86.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(509, 4, 10, 0, 0, 'BEEF RUSSIANS ', 0.00, 100, '', 0.00, 88.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(510, 4, 10, 0, 0, 'KHANS ORIGINAL POLONY BEEF', 0.00, 100, '', 0.00, 88.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(511, 4, 10, 0, 0, 'MASALA COCTAIL SAUSAGE', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(512, 4, 10, 0, 0, 'S/P CUT WORS BEEF', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(513, 4, 10, 0, 0, 'BEEF GARLIC ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(514, 4, 10, 0, 0, 'BEEF HOT ONE ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(515, 4, 10, 0, 0, 'MASALA WORS (BEEF)', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(516, 4, 10, 0, 0, 'WORS (BEEF) MILD', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(517, 4, 10, 0, 0, 'GREEN MASALA POLONY BEEF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(518, 4, 10, 0, 0, 'PRESSED BEEF ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(519, 4, 10, 0, 0, 'SAUSAGE PIE FILLING (BEEF)', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(520, 4, 10, 0, 0, 'SPOTTED LOAF ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(521, 4, 10, 0, 0, 'OLIVE LOAF (BEEF)', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(522, 4, 10, 0, 0, 'BREAKFAST VIENNAS MILD (BEEF)', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(523, 4, 10, 0, 0, 'PIZZALONI (BEEF)', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(524, 4, 10, 0, 0, 'SAUSAGE MIXTURE BEEF MASALA', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(525, 4, 10, 0, 0, 'BEEF SALAMI PAPRIKA', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(526, 4, 10, 0, 0, 'FARMSTYLE WORS (BEEF)', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(527, 4, 10, 0, 0, 'BEEF VIENNAS ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(528, 4, 10, 0, 0, 'BRISKET ', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(529, 4, 10, 0, 0, 'ORIGINAL KEBAB BEEF', 0.00, 100, '', 0.00, 95.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(530, 4, 10, 0, 0, 'BEEF OLIVE ', 0.00, 100, '', 0.00, 98.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(531, 4, 10, 0, 0, 'CHEESE OLIVES ', 0.00, 100, '', 0.00, 98.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(532, 4, 10, 0, 0, 'BEEF SHAMI KEBABS', 0.00, 100, '', 0.00, 98.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(533, 4, 10, 0, 0, 'TRADITIONAL POLONY', 0.00, 100, '', 0.00, 98.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(534, 4, 10, 0, 0, 'TEXAN BRISKET', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(535, 4, 10, 0, 0, 'COCKTAIL VIENNAS BEEF', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(536, 4, 10, 0, 0, 'OX TAIL ', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(537, 4, 10, 0, 0, 'CLUB STEAK BBQ BASTING', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(538, 4, 10, 0, 0, 'FRANKFURTERS ', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(539, 4, 10, 0, 0, 'CHUCK MILD SPICE', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(540, 4, 10, 0, 0, 'SPICY BRISKET', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(541, 4, 10, 0, 0, 'TEXAN CHUCK', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(542, 4, 10, 0, 0, 'CUT BEEF WORS', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(543, 4, 10, 0, 0, 'STICKY BEEF RIBS', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(544, 4, 10, 0, 0, 'STEWING BEEF ', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(545, 4, 10, 0, 0, 'CHEESE PATTIES (BEEF)', 0.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(546, 4, 10, 0, 0, 'COOKED WORS (BEEF)', 0.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(547, 4, 10, 0, 0, 'CHILLIE SAUSAGES XXHOT', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(548, 4, 10, 0, 0, 'BEEF LOLLIES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(549, 4, 10, 0, 0, 'BEEF MASALA SAUSAGES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(550, 4, 10, 0, 0, 'SMOKED RUSSIANS (BEEF)', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(551, 4, 10, 0, 0, 'COCTAIL SAUSAGE BEEF', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(552, 4, 10, 0, 0, 'BEEF MILD LOLLIES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(553, 4, 10, 0, 0, 'SMOKED COCTAIL RUSSIANS', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(554, 4, 10, 0, 0, 'COCKTAIL RUSSIANS ', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(555, 4, 10, 0, 0, 'BEEF SAUSAGES MILD', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(556, 4, 10, 0, 0, 'SWEET CHILLI BEEF SAUSAGE', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(557, 4, 10, 0, 0, 'BEEF RASHERS ', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(558, 4, 10, 0, 0, 'TEXAN STEAK ', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(559, 4, 10, 0, 0, 'GOURMET BURGERS', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(560, 4, 10, 0, 0, 'COCTAIL VEINNAS BEEF', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(561, 4, 10, 0, 0, 'TEXAN STEAK ', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(562, 4, 10, 0, 0, 'TEXAN CLUB STEAK', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(563, 4, 10, 0, 0, 'TEXAN BEEF RASHERS', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(564, 4, 10, 0, 0, 'COCKTAIL (BEEF) KASSEGRILLE', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(565, 4, 10, 0, 0, 'KHAN''S ORIGINAL SAUSAGES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(566, 4, 10, 0, 0, 'KHAN''S JUICY CLUB STEAK', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(567, 4, 10, 0, 0, 'STEAK SOSATIES ', 0.00, 100, '', 0.00, 115.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(568, 4, 10, 0, 0, 'STEAK MINCE ', 0.00, 100, '', 0.00, 115.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(569, 4, 10, 0, 0, 'T-BONE ', 0.00, 100, '', 0.00, 115.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(570, 4, 10, 0, 0, 'CLUB STEAK ', 0.00, 100, '', 0.00, 115.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(571, 4, 10, 0, 0, 'MARINATED T-BONE', 0.00, 100, '', 0.00, 115.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(572, 4, 10, 0, 0, 'UNCOOKED SALT MEAT', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(573, 4, 10, 0, 0, 'SILVER SIDE ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(574, 4, 10, 0, 0, 'WAGYU GOURMET BURGERS', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(575, 4, 10, 0, 0, 'PREMIX SAVOURY FILLING', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(576, 4, 10, 0, 0, 'SHORT RIBS ', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(577, 4, 10, 0, 0, 'TOP SIDE STEAK', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(578, 4, 10, 0, 0, 'MARINATED TOPSIDE', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(579, 4, 10, 0, 0, 'KASSEGRILLE (BEEF)', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(580, 4, 10, 0, 0, 'BREAKFAST T/BONE', 0.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(581, 4, 10, 0, 0, 'SIRLOIN ', 0.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(582, 4, 10, 0, 0, 'BEEF STROGONOFF ', 0.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(583, 4, 10, 0, 0, 'CUBED STEAK FOR PIES', 0.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(584, 4, 10, 0, 0, 'MINUTE STEAK ', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(585, 4, 10, 0, 0, 'MARINATED MINUTE STEAK', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(586, 4, 10, 0, 0, 'TEXAN MINUTE STEAK', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(587, 4, 10, 0, 0, 'TEXAN SIRLOIN', 0.00, 100, '', 0.00, 138.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(588, 4, 10, 0, 0, 'SPECIAL MINCE (BEEF)', 0.00, 100, '', 0.00, 138.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(589, 4, 10, 0, 0, 'KHAN''S JUICY RUMP', 0.00, 100, '', 0.00, 138.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(590, 4, 10, 0, 0, 'BEEF MACON SWISS', 0.00, 100, '', 0.00, 139.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(591, 4, 10, 0, 0, 'MARINATED BRAAI PACK', 0.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(592, 4, 10, 0, 0, 'RUMP STEAK ', 0.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(593, 4, 10, 0, 0, 'FLANK ', 0.00, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(594, 4, 10, 0, 0, 'RUMP STEAK ', 0.00, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(595, 4, 10, 0, 0, 'MARINATED RUMP STEAK', 0.00, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(596, 4, 10, 0, 0, 'CROWN ROAST ', 0.00, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(597, 4, 10, 0, 0, 'T-BONE WITH FILLET', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(598, 4, 10, 0, 0, 'MATURED RUMP STEAK', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(599, 4, 10, 0, 0, 'MATURED T-BONE', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(600, 4, 10, 0, 0, 'PICANIA ', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(601, 4, 10, 0, 0, 'TOMAHAWK STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(602, 4, 10, 0, 0, 'BONELESS T-BONE', 0.00, 100, '', 0.00, 168.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(603, 4, 10, 0, 0, 'ROLLED BEEF ', 0.00, 100, '', 0.00, 168.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(604, 4, 10, 0, 0, '2 X MATURED SIRLOIN', 0.00, 100, '', 0.00, 168.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(605, 4, 10, 0, 0, 'RIB-EYE STEAK', 0.00, 100, '', 0.00, 168.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(606, 4, 10, 0, 0, 'TEXAN BONELESS T-BONE', 0.00, 100, '', 0.00, 168.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(607, 4, 10, 0, 0, 'SALT MEAT ', 0.00, 100, '', 0.00, 195.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(608, 4, 10, 0, 0, 'PASTRAMI ', 0.00, 100, '', 0.00, 195.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(609, 4, 10, 0, 0, '5 KG CHICKEN FILLET', 0.00, 100, '', 0.00, 200.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(610, 4, 10, 0, 0, 'MACON BREAKFAST BEEF', 0.00, 100, '', 0.00, 207.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(611, 4, 10, 0, 0, 'FILLET STEAK ROULADE', 0.00, 100, '', 0.00, 220.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(612, 4, 10, 0, 0, 'SHIRAZO BREAKFAST BEEF', 0.00, 100, '', 0.00, 225.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(613, 4, 10, 0, 0, 'SMOKED BEEF', 0.00, 100, '', 0.00, 250.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(614, 4, 10, 0, 0, 'FILLET STEAK ', 0.00, 100, '', 0.00, 265.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(615, 4, 10, 0, 0, 'B B Q SPICE BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(616, 4, 10, 0, 0, 'BILTONG WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(617, 4, 10, 0, 0, 'BABY BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(618, 4, 10, 0, 0, 'B B Q SNAP STIX BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(619, 4, 10, 0, 0, 'CABANOSSI ', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(620, 4, 10, 0, 0, 'BULLS EYE BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(621, 4, 10, 0, 0, 'WAGU STEAK ', 0.00, 100, '', 0.00, 850.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(622, 4, 25, 0, 0, 'SMOKEY C HBITE', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(623, 4, 25, 0, 0, 'MIXED WE TBILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(624, 4, 25, 0, 0, 'SALT & PEPPER BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(625, 4, 25, 0, 0, 'PERI PERI BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(626, 4, 25, 0, 0, 'PERI PERI WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(627, 4, 25, 0, 0, 'GREEN CHILLI BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(628, 4, 25, 0, 0, 'WET MASALA BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(629, 4, 25, 0, 0, 'TRADITIONAL SNAP STIX', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(630, 4, 25, 0, 0, 'DRY WORS ', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(631, 4, 25, 0, 0, 'BBQ SPICY BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(632, 4, 25, 0, 0, 'MIXED BILTONG STIX', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(633, 4, 25, 0, 0, 'SWEET CHILLI SNAP BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(634, 4, 25, 0, 0, 'MASALA BILTONG ', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(635, 4, 25, 0, 0, 'SMOKEY CHILLI BITE', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(636, 4, 25, 0, 0, 'EXTRA HOT CHILLI BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(637, 4, 25, 0, 0, 'CHICKEN BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(638, 4, 25, 0, 0, 'BBQ SAUCE BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(639, 4, 25, 0, 0, 'MIXED BILTONG HOT', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(640, 4, 25, 0, 0, 'MIXED WET BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(641, 4, 25, 0, 0, 'STICKY BEEF BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(642, 4, 25, 0, 0, 'BBQ WAFERS BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(643, 4, 25, 0, 0, 'PERI PERI WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(644, 4, 25, 0, 0, 'SWEET CHILLI WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(645, 4, 25, 0, 0, 'GREEN CHILLI WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(646, 4, 25, 0, 0, 'BABY WAFERS ', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(647, 4, 25, 0, 0, 'BBQ WAFERS BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(648, 4, 25, 0, 0, 'PERI PERI WAFERS BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(649, 4, 25, 0, 0, 'SALT & PEPPER WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(650, 4, 25, 0, 0, 'SWEET CHILLI WAFERS', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(651, 4, 25, 0, 0, 'CHILLI BILTONG', 0.00, 100, '', 0.00, 350.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(652, 4, 25, 0, 0, 'SMOKED B B Q BILTONG', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(653, 4, 25, 0, 0, 'SALT&PEPPER LAMB BILTONG', 0.00, 100, '', 0.00, 450.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(654, 4, 11, 0, 0, 'CHIEF''S CHOICE ASSORTED SAUCES', 0.00, 100, '', 0.00, 30.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(655, 4, 11, 0, 0, 'CHIEF''S CHOICE ASSORTED SAUCES', 0.00, 100, '', 0.00, 30.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(656, 4, 11, 0, 0, 'CHICKEN SPRING ROLL ', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(657, 4, 11, 0, 0, 'CHICKEN SPRING ROLL ', 0.00, 100, '', 0.00, 45.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(658, 4, 11, 0, 0, 'CHICKEN SQUARES ', 0.00, 100, '', 0.00, 46.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(659, 4, 11, 0, 0, 'CHICKEN SQUARES ', 0.00, 100, '', 0.00, 46.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(660, 4, 11, 0, 0, 'CHICKEN CUTLETS ', 0.00, 100, '', 0.00, 46.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(661, 4, 11, 0, 0, 'CHICKEN CUTLETS ', 0.00, 100, '', 0.00, 46.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(662, 4, 11, 0, 0, 'CHICKEN MINI SUBS', 0.00, 100, '', 0.00, 48.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(663, 4, 11, 0, 0, 'CHICKEN MINI SUBS', 0.00, 100, '', 0.00, 48.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(664, 4, 11, 0, 0, 'TIKKA NUGGETS ', 0.00, 100, '', 0.00, 52.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(665, 4, 11, 0, 0, 'TIKKA NUGGETS ', 0.00, 100, '', 0.00, 52.50, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(666, 4, 11, 0, 0, 'TIKKA LEG QUARTERS (UNCOOKED)', 0.00, 100, '', 0.00, 52.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(667, 4, 11, 0, 0, 'TIKKA LEG QUARTERS (UNCOOKED)', 0.00, 100, '', 0.00, 52.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(668, 4, 11, 0, 0, 'CHICKEN GIBLETS ', 0.00, 100, '', 0.00, 54.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(669, 4, 11, 0, 0, 'CHICKEN LIVERS ', 0.00, 100, '', 0.00, 54.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(670, 4, 11, 0, 0, 'CHICKEN GIBLETS ', 0.00, 100, '', 0.00, 54.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(671, 4, 11, 0, 0, 'CHICKEN LIVERS ', 0.00, 100, '', 0.00, 54.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(672, 4, 11, 0, 0, 'FREE RANGE WINGS', 0.00, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(673, 4, 11, 0, 0, 'FREE RANGE WINGS', 0.00, 100, '', 0.00, 55.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(674, 4, 11, 0, 0, 'TIKKA WHOLE CHICKEN', 0.00, 100, '', 0.00, 56.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(675, 4, 11, 0, 0, 'TIKKA WHOLE CHICKEN', 0.00, 100, '', 0.00, 56.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(676, 4, 11, 0, 0, 'CHICKEN MINCE ', 0.00, 100, '', 0.00, 58.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(677, 4, 11, 0, 0, 'CHICKEN ROULADE ', 0.00, 100, '', 0.00, 58.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(678, 4, 11, 0, 0, 'CHICKEN MINCE ', 0.00, 100, '', 0.00, 58.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(679, 4, 11, 0, 0, 'CHICKEN ROULADE ', 0.00, 100, '', 0.00, 58.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(680, 4, 11, 0, 0, 'TIKKA CHICKEN', 0.00, 100, '', 0.00, 59.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(681, 4, 11, 0, 0, 'TIKKA DRUMSTICK HEAT & EAT', 0.00, 100, '', 0.00, 59.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(682, 4, 11, 0, 0, 'CHICKEN WINGS', 0.00, 100, '', 0.00, 59.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(683, 4, 11, 0, 0, 'TIKKA CHICKEN', 0.00, 100, '', 0.00, 59.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(684, 4, 11, 0, 0, 'TIKKA DRUMSTICK HEAT & EAT', 0.00, 100, '', 0.00, 59.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(685, 4, 11, 0, 0, 'CHICKEN WINGS', 0.00, 100, '', 0.00, 59.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(686, 4, 11, 0, 0, 'SKIN OFF CHICKEN', 0.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(687, 4, 11, 0, 0, 'SKIN OFF CHICKEN', 0.00, 100, '', 0.00, 60.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(688, 4, 11, 0, 0, 'TIKKA THIGHS', 0.00, 100, '', 0.00, 60.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(689, 4, 11, 0, 0, 'TIKKA THIGHS', 0.00, 100, '', 0.00, 60.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(690, 4, 11, 0, 0, 'CRUM CHIC LOINS', 0.00, 99, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(691, 4, 11, 0, 0, 'CRUMB LOLLIES ', 0.00, 99, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(692, 4, 11, 0, 0, 'TIKKA CHEEZELA NUGGETS', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(693, 4, 11, 0, 0, 'FREE RANGE LEG QUATERS', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(694, 4, 11, 0, 0, 'CRUM CHIC LOINS', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(695, 4, 11, 0, 0, 'CRUMB LOLLIES ', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(696, 4, 11, 0, 0, 'TIKKA CHEEZELA NUGGETS', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(697, 4, 11, 0, 0, 'FREE RANGE LEG QUATERS', 0.00, 100, '', 0.00, 65.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(698, 4, 11, 0, 0, 'CHICKEN THIGHS ', 0.00, 100, '', 0.00, 65.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(699, 4, 11, 0, 0, 'CHICKEN THIGHS ', 0.00, 100, '', 0.00, 65.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(700, 4, 11, 0, 0, 'TIKKA SPATCH. 80% COOKED', 0.00, 100, '', 0.00, 66.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(701, 4, 11, 0, 0, 'TIKKA SPATCH. 80% COOKED', 0.00, 100, '', 0.00, 66.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(702, 4, 11, 0, 0, 'PORTUGUESE CHICKEN', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(703, 4, 11, 0, 0, 'TIKKA BREAST HEAT & EAT', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(704, 4, 11, 0, 0, 'FRESH CHICKEN FILLET', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(705, 4, 11, 0, 0, 'FREE RANGE WHOLE CHICKEN', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(706, 4, 11, 0, 0, 'PORTUGUESE CHICKEN', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(707, 4, 11, 0, 0, 'TIKKA BREAST HEAT & EAT', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(708, 4, 11, 0, 0, 'FRESH CHICKEN FILLET', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(709, 4, 11, 0, 0, 'FREE RANGE WHOLE CHICKEN', 0.00, 100, '', 0.00, 69.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(710, 4, 11, 0, 0, 'PORTUGUESE 1/2 CHICKEN', 0.00, 100, '', 0.00, 72.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(711, 4, 11, 0, 0, 'CRUMBED CHICK CHEESE BURGERS', 0.00, 100, '', 0.00, 72.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(712, 4, 11, 0, 0, 'PORTUGUESE 1/2 CHICKEN', 0.00, 100, '', 0.00, 72.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(713, 4, 11, 0, 0, 'CRUMBED CHICK CHEESE BURGERS', 0.00, 100, '', 0.00, 72.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(714, 4, 11, 0, 0, 'PORTUGUESE DRUMSTICKS', 0.00, 100, '', 0.00, 73.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(715, 4, 11, 0, 0, 'PORTUGUESE DRUMSTICKS', 0.00, 100, '', 0.00, 73.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(716, 4, 11, 0, 0, 'SKINLESS HOT WINGS', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(717, 4, 11, 0, 0, 'CHICKEN STIR FRY ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(718, 4, 11, 0, 0, 'CHICK-A-LA-KING ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(719, 4, 11, 0, 0, 'CHIC STROGONOFF ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(720, 4, 11, 0, 0, 'PORTUGUESE CHICK. FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(721, 4, 11, 0, 0, 'TIKKA CHICKEN FILLET (MILD)', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(722, 4, 11, 0, 0, 'CRUMBED CHICK BURGERS', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(723, 4, 11, 0, 0, 'THIGHS&DRUMSTICKS ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(724, 4, 11, 0, 0, 'LEMON&HERB CHICK.FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(725, 4, 11, 0, 0, 'CLEAN CUT WASHED ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(726, 4, 11, 0, 0, 'PORTUGUESE 1/4 LEG&THIGH', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(727, 4, 11, 0, 0, 'MEXICAN CHICKEN FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(728, 4, 11, 0, 0, 'TANDOORI CHICKEN FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(729, 4, 11, 0, 0, '100% CHICKEN CRUMED BURGER', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(730, 4, 11, 0, 0, '100% CHICKEN NUGGETS', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(731, 4, 11, 0, 0, 'CREAMY LEMON & HERB CHICKEN FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(732, 4, 11, 0, 0, 'SKINLESS HOT WINGS', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(733, 4, 11, 0, 0, 'CHICKEN STIR FRY ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(734, 4, 11, 0, 0, 'CHICK-A-LA-KING ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(735, 4, 11, 0, 0, 'CHIC STROGONOFF ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(736, 4, 11, 0, 0, 'PORTUGUESE CHICK. FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(737, 4, 11, 0, 0, 'TIKKA CHICKEN FILLET (MILD)', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(738, 4, 11, 0, 0, 'CRUMBED CHICK BURGERS', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(739, 4, 11, 0, 0, 'THIGHS&DRUMSTICKS ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(740, 4, 11, 0, 0, 'LEMON&HERB CHICK.FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(741, 4, 11, 0, 0, 'CLEAN CUT WASHED ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(742, 4, 11, 0, 0, 'PORTUGUESE 1/4 LEG&THIGH', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(743, 4, 11, 0, 0, 'MEXICAN CHICKEN FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(744, 4, 11, 0, 0, 'TANDOORI CHICKEN FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(745, 4, 11, 0, 0, '100% CHICKEN CRUMED BURGER', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(746, 4, 11, 0, 0, '100% CHICKEN NUGGETS', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(747, 4, 11, 0, 0, 'CREAMY LEMON & HERB CHICKEN FILLET', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(748, 4, 11, 0, 0, 'FRESH CHICKEN SKIN ON', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(749, 4, 11, 0, 0, 'KHAN''S ORIGINAL CHICKEN KABAABS', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(750, 4, 11, 0, 0, 'SKIN ON HOT WINGS', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(751, 4, 11, 0, 0, 'PERI PERI CHIC SOSATIES', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(752, 4, 11, 0, 0, 'TIKKA LEGS HEAT & EAT', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(753, 4, 11, 0, 0, 'TIKKA LEG 1/4s 80% COOKED', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(754, 4, 11, 0, 0, 'FRESH CHICKEN SKIN ON', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(755, 4, 11, 0, 0, 'KHAN''S ORIGINAL CHICKEN KABAABS', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(756, 4, 11, 0, 0, 'SKIN ON HOT WINGS', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(757, 4, 11, 0, 0, 'PERI PERI CHIC SOSATIES', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(758, 4, 11, 0, 0, 'TIKKA LEGS HEAT & EAT', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(759, 4, 11, 0, 0, 'TIKKA LEG 1/4s 80% COOKED', 0.00, 100, '', 0.00, 75.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(760, 4, 11, 0, 0, 'FREE RANGE DRUMSTICKS', 0.00, 100, '', 0.00, 76.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(761, 4, 11, 0, 0, 'FREE RANGE DRUMSTICKS', 0.00, 100, '', 0.00, 76.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(762, 4, 11, 0, 0, 'FREE RANGE C/CLEAN CHICKENS', 0.00, 100, '', 0.00, 77.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(763, 4, 11, 0, 0, 'FREE RANGE C/CLEAN CHICKENS', 0.00, 100, '', 0.00, 77.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(764, 4, 11, 0, 0, 'CHILLI CHEESE PATTIES ', 0.00, 100, '', 0.00, 79.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(765, 4, 11, 0, 0, 'BATTERED NUGGETS ', 0.00, 100, '', 0.00, 79.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(766, 4, 11, 0, 0, 'CHICKEN TEMPURA BURGERS', 0.00, 100, '', 0.00, 79.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(767, 4, 11, 0, 0, 'CHILLI CHEESE PATTIES ', 0.00, 100, '', 0.00, 79.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(768, 4, 11, 0, 0, 'BATTERED NUGGETS ', 0.00, 100, '', 0.00, 79.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(769, 4, 11, 0, 0, 'CHICKEN TEMPURA BURGERS', 0.00, 100, '', 0.00, 79.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(770, 4, 11, 0, 0, 'FREE RANGE CHICKEN FILLET', 0.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(771, 4, 11, 0, 0, 'FREE RANGE CHICKEN FILLET', 0.00, 100, '', 0.00, 80.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(772, 4, 11, 0, 0, '100% CHICKEN SCHNIITZEL', 0.00, 100, '', 0.00, 80.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(773, 4, 11, 0, 0, '100% CHICKEN SCHNIITZEL', 0.00, 100, '', 0.00, 80.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(774, 4, 11, 0, 0, 'CHICKEN VIENNAS', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(775, 4, 11, 0, 0, 'CHICKEN BOTTI ', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(776, 4, 11, 0, 0, 'BUTTER CHICKEN ', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(777, 4, 11, 0, 0, 'SAUCY ROST CHICKEN', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(778, 4, 11, 0, 0, 'SAUCY ROST CHICKEN', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(779, 4, 11, 0, 0, 'CHICKEN VIENNAS', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(780, 4, 11, 0, 0, 'CHICKEN BOTTI ', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(781, 4, 11, 0, 0, 'BUTTER CHICKEN ', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(782, 4, 11, 0, 0, 'SAUCY ROST CHICKEN', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00');
INSERT INTO `foods` (`ID`, `IDCanteen`, `IDMenu`, `IDSubmenu`, `IDSubsubmenu`, `Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`, `isOutOfStock`, `Recomended`, `Popular`, `Rating`, `Available`, `User`, `Date`, `Time`) VALUES
(783, 4, 11, 0, 0, 'SAUCY ROST CHICKEN', 0.00, 100, '', 0.00, 82.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(784, 4, 11, 0, 0, 'COCTAIL SAUSAGE', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(785, 4, 11, 0, 0, 'CHIC''O''POP''S ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(786, 4, 11, 0, 0, 'COCTAIL SAUSAGE', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(787, 4, 11, 0, 0, 'CHIC''O''POP''S ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(788, 4, 11, 0, 0, 'CHILLI CHEESE PATTIES', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(789, 4, 11, 0, 0, 'CHILLI CHEESE PATTIES', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(790, 4, 11, 0, 0, 'CHIC NUGGETS ', 0.00, 100, '', 0.00, 85.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(791, 4, 11, 0, 0, 'CHIC NUGGETS ', 0.00, 100, '', 0.00, 85.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(792, 4, 11, 0, 0, 'MIXED GOLDI CHICKEN 2KG', 0.00, 100, '', 0.00, 86.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(793, 4, 11, 0, 0, 'MIXED GOLDI CHICKEN 2KG', 0.00, 100, '', 0.00, 86.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(794, 4, 11, 0, 0, 'SPICY CHICKEN BURGER', 0.00, 100, '', 0.00, 86.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(795, 4, 11, 0, 0, 'SPICY CHICKEN BURGER', 0.00, 100, '', 0.00, 86.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(796, 4, 11, 0, 0, 'CHICKEN PATTIES', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(797, 4, 11, 0, 0, 'CHICKEN CHEESY STEAKLET', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(798, 4, 11, 0, 0, 'CHICKEN CHEESY SCHNITZEL', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(799, 4, 11, 0, 0, 'CHICKEN PATTIES', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(800, 4, 11, 0, 0, 'CHICKEN CHEESY STEAKLET', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(801, 4, 11, 0, 0, 'CHICKEN CHEESY SCHNITZEL', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(802, 4, 11, 0, 0, 'BABY CHICKENS ', 0.00, 100, '', 0.00, 92.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(803, 4, 11, 0, 0, 'BABY CHICKENS ', 0.00, 100, '', 0.00, 92.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(804, 4, 11, 0, 0, 'SPICY CHICK SCHNITZELS', 0.00, 100, '', 0.00, 92.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(805, 4, 11, 0, 0, 'SPICY CHICK SCHNITZELS', 0.00, 100, '', 0.00, 92.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(806, 4, 11, 0, 0, 'CHICKEN POLONY ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(807, 4, 11, 0, 0, 'CHICKEN MEAT LOAF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(808, 4, 11, 0, 0, 'CHIC STRIPS ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(809, 4, 11, 0, 0, 'CHICKEN FRENCH LOAF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(810, 4, 11, 0, 0, 'CHICKEN POPS ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(811, 4, 11, 0, 0, 'CHICKEN CHILLI LOAF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(812, 4, 11, 0, 0, 'CHICKEN PAPRIKA', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(813, 4, 11, 0, 0, 'CHICKEN POLONY ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(814, 4, 11, 0, 0, 'CHICKEN MEAT LOAF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(815, 4, 11, 0, 0, 'CHIC STRIPS ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(816, 4, 11, 0, 0, 'CHICKEN FRENCH LOAF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(817, 4, 11, 0, 0, 'CHICKEN POPS ', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(818, 4, 11, 0, 0, 'CHICKEN CHILLI LOAF', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(819, 4, 11, 0, 0, 'CHICKEN PAPRIKA', 0.00, 100, '', 0.00, 94.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(820, 4, 11, 0, 0, 'ASSORTED LOAFS ', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(821, 4, 11, 0, 0, 'ASSORTED LOAFS ', 0.00, 100, '', 0.00, 95.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(822, 4, 11, 0, 0, 'CHICKEN SHAMI KEBABS', 0.00, 100, '', 0.00, 95.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(823, 4, 11, 0, 0, 'CHICKEN SHAMI KEBABS', 0.00, 100, '', 0.00, 95.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(824, 4, 11, 0, 0, 'CHICKEN CHEESY NUGGETS', 0.00, 100, '', 0.00, 96.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(825, 4, 11, 0, 0, 'CHICKEN CHEESY NUGGETS', 0.00, 100, '', 0.00, 96.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(826, 4, 11, 0, 0, 'SPICY CHUCK', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(827, 4, 11, 0, 0, 'CHICKEN CHEESY STRIPS', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(828, 4, 11, 0, 0, 'SPICY CHUCK', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(829, 4, 11, 0, 0, 'CHICKEN CHEESY STRIPS', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(830, 4, 11, 0, 0, 'CHICKEN SCHNITZEL', 0.00, 100, '', 0.00, 100.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(831, 4, 11, 0, 0, 'CHICKEN SCHNITZEL', 0.00, 100, '', 0.00, 100.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(832, 4, 11, 0, 0, 'SPICY CHICKEN STRIPS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(833, 4, 11, 0, 0, 'SPICY POPS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(834, 4, 11, 0, 0, 'CRUMBED CHICKEN PICES', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(835, 4, 11, 0, 0, 'MOZAMBICAN CHICKEN FILLET', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(836, 4, 11, 0, 0, 'MOZAMBICAN 1/4 LEG&THIGHS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(837, 4, 11, 0, 0, 'TANDOORI 1/4 LEG&THIGHS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(838, 4, 11, 0, 0, 'TANDOORI CHICKEN FILLET', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(839, 4, 11, 0, 0, 'SPICY CHICKEN STRIPS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(840, 4, 11, 0, 0, 'SPICY POPS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(841, 4, 11, 0, 0, 'CRUMBED CHICKEN PICES', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(842, 4, 11, 0, 0, 'MOZAMBICAN CHICKEN FILLET', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(843, 4, 11, 0, 0, 'MOZAMBICAN 1/4 LEG&THIGHS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(844, 4, 11, 0, 0, 'TANDOORI 1/4 LEG&THIGHS', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(845, 4, 11, 0, 0, 'TANDOORI CHICKEN FILLET', 0.00, 100, '', 0.00, 101.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(846, 4, 11, 0, 0, 'CHICKEN SAUSAGES ', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(847, 4, 11, 0, 0, 'CHICKEN SAUSAGES ', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(848, 4, 11, 0, 0, 'CHICKEN LOLLIES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(849, 4, 11, 0, 0, 'CHICKEN LOLLIES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(850, 4, 11, 0, 0, 'CRUMBED HOT WINGS', 0.00, 100, '', 0.00, 113.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(851, 4, 11, 0, 0, 'CRUMBED WINGS ', 0.00, 100, '', 0.00, 113.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(852, 4, 11, 0, 0, 'CRUMBED HOT WINGS', 0.00, 100, '', 0.00, 113.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(853, 4, 11, 0, 0, 'CRUMBED WINGS ', 0.00, 100, '', 0.00, 113.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(854, 4, 11, 0, 0, 'CORNISH ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(855, 4, 11, 0, 0, 'CORNISH ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(856, 4, 11, 0, 0, 'CHICKEN PASTRAMI', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(857, 4, 11, 0, 0, 'CHICKEN PASTRAMI', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(858, 4, 11, 0, 0, 'FREE RANGE FILLET', 0.00, 100, '', 0.00, 127.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(859, 4, 11, 0, 0, 'FREE RANGE FILLET', 0.00, 100, '', 0.00, 127.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(860, 4, 11, 0, 0, 'BOX CHICKEN FILLET ', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(861, 4, 11, 0, 0, 'BOX CHICKEN FILLET ', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(862, 4, 11, 0, 0, 'AAA GRADE LAMB', 0.00, 100, '', 0.00, 138.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(863, 4, 11, 0, 0, 'AAA GRADE LAMB', 0.00, 100, '', 0.00, 138.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(864, 4, 11, 0, 0, 'CHILLI CHEESE NUGGET', 0.00, 100, '', 0.00, 216.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(865, 4, 11, 0, 0, 'CHILLI CHEESE NUGGET', 0.00, 100, '', 0.00, 216.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(866, 4, 11, 0, 0, '5kg INDIVIDUALLY PACKED', 0.00, 100, '', 0.00, 230.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(867, 4, 11, 0, 0, '5kg INDIVIDUALLY PACKED', 0.00, 100, '', 0.00, 230.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(868, 4, 11, 0, 0, '5KG CHICKEN FILLET LAYER PACK', 0.00, 100, '', 0.00, 285.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(869, 4, 11, 0, 0, '5KG LAYER PACK CHICK. FILLET', 0.00, 100, '', 0.00, 285.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(870, 4, 11, 0, 0, '5KG CHICKEN FILLET LAYER PACK', 0.00, 100, '', 0.00, 285.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(871, 4, 11, 0, 0, '5KG LAYER PACK CHICK. FILLET', 0.00, 100, '', 0.00, 285.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(872, 4, 11, 0, 0, 'INDIVIDUALLY WRAPPED FILLET', 0.00, 100, '', 0.00, 315.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(873, 4, 11, 0, 0, 'INDIVIDUALLY WRAPPED FILLET', 0.00, 100, '', 0.00, 315.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(874, 4, 30, 0, 0, 'GAME POLONY ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(875, 4, 30, 0, 0, 'GAME SAUSAGE', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(876, 4, 30, 0, 0, 'GAME WORS', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(877, 4, 30, 0, 0, 'GAME POLONY ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(878, 4, 30, 0, 0, 'GAME SAUSAGE', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(879, 4, 30, 0, 0, 'GAME WORS', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(880, 4, 30, 0, 0, 'GAME ORIGINAL KEBABS', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(881, 4, 30, 0, 0, 'GAME ORIGINAL KEBABS', 0.00, 100, '', 0.00, 85.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(882, 4, 30, 0, 0, 'GAME KEBAB', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(883, 4, 30, 0, 0, 'GAME PATTIES', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(884, 4, 30, 0, 0, 'GAME KEBAB', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(885, 4, 30, 0, 0, 'GAME PATTIES', 0.00, 100, '', 0.00, 89.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(886, 4, 30, 0, 0, 'GAME SWEET CHILLI SAUSAGE', 0.00, 100, '', 0.00, 98.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(887, 4, 30, 0, 0, 'GAME SWEET CHILLI SAUSAGE', 0.00, 100, '', 0.00, 98.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(888, 4, 30, 0, 0, 'KHANS ORIGINAL KEBAAB GAME', 0.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(889, 4, 30, 0, 0, 'KHANS ORIGINAL KEBAAB GAME', 0.00, 100, '', 0.00, 99.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(890, 4, 30, 0, 0, 'IMPALA CURRY', 0.00, 100, '', 0.00, 109.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(891, 4, 30, 0, 0, 'IMPALA CURRY', 0.00, 100, '', 0.00, 109.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(892, 4, 30, 0, 0, 'SPRING BUCK CHOPS', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(893, 4, 30, 0, 0, 'SPRING BUCK CHOPS', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(894, 4, 30, 0, 0, 'STEAK STRIPS', 0.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(895, 4, 30, 0, 0, 'STEAK STRIPS', 0.00, 100, '', 0.00, 130.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(896, 4, 30, 0, 0, 'IMPALA CHOPS', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(897, 4, 30, 0, 0, 'IMPALA LEG CHOPS', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(898, 4, 30, 0, 0, 'IMPALA STEAK', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(899, 4, 30, 0, 0, 'IMPALA CHOPS', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(900, 4, 30, 0, 0, 'IMPALA LEG CHOPS', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(901, 4, 30, 0, 0, 'IMPALA STEAK', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(902, 4, 30, 0, 0, 'ELAND TOPSIDE', 0.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(903, 4, 30, 0, 0, 'ELAND TOPSIDE', 0.00, 100, '', 0.00, 140.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(904, 4, 30, 0, 0, 'GAME RUMP STEAK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(905, 4, 30, 0, 0, 'KUDU TOP SDIE', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(906, 4, 30, 0, 0, 'ELAND RUMP STEAK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(907, 4, 30, 0, 0, 'ELAND SIRLOIN', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(908, 4, 30, 0, 0, 'KUDU THICKFLANK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(909, 4, 30, 0, 0, 'GAME SIRLOIN STEAK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(910, 4, 30, 0, 0, 'GAME RUMP STEAK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(911, 4, 30, 0, 0, 'KUDU TOP SDIE', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(912, 4, 30, 0, 0, 'ELAND RUMP STEAK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(913, 4, 30, 0, 0, 'ELAND SIRLOIN', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(914, 4, 30, 0, 0, 'KUDU THICKFLANK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(915, 4, 30, 0, 0, 'GAME SIRLOIN STEAK', 0.00, 100, '', 0.00, 160.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(916, 4, 30, 0, 0, 'GAME TOPSIDE STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(917, 4, 30, 0, 0, 'GAME MINUTE STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(918, 4, 30, 0, 0, 'GAME TOP SIDE STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(919, 4, 30, 0, 0, 'GAME TOPSIDE STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(920, 4, 30, 0, 0, 'GAME MINUTE STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(921, 4, 30, 0, 0, 'GAME TOP SIDE STEAK', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(922, 4, 30, 0, 0, 'IMPALA FILLET STEAK', 0.00, 100, '', 0.00, 230.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(923, 4, 30, 0, 0, 'IMPALA FILLET STEAK', 0.00, 100, '', 0.00, 230.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(924, 4, 30, 0, 0, 'ELAND FILLET STEAK', 0.00, 100, '', 0.00, 255.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(925, 4, 30, 0, 0, 'ELAND FILLET STEAK', 0.00, 100, '', 0.00, 255.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(926, 4, 30, 0, 0, 'GAME FILLET STEAK', 0.00, 100, '', 0.00, 288.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(927, 4, 30, 0, 0, 'GAME FILLET STEAK', 0.00, 100, '', 0.00, 288.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(928, 4, 30, 0, 0, 'GAME BILTONG ', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(929, 4, 30, 0, 0, 'GAME SWEET CHILLI BILTONG', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(930, 4, 30, 0, 0, 'GAME DRY WORS', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(931, 4, 30, 0, 0, 'GAME BBQ BILTONG', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(932, 4, 30, 0, 0, 'GAME BILTONG ', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(933, 4, 30, 0, 0, 'GAME SWEET CHILLI BILTONG', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(934, 4, 30, 0, 0, 'GAME DRY WORS', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(935, 4, 30, 0, 0, 'GAME BBQ BILTONG', 0.00, 100, '', 0.00, 375.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(936, 4, 29, 0, 0, 'MUTTON PIECES ', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(937, 4, 29, 0, 0, 'MUTTON PIECES ', 0.00, 100, '', 0.00, 35.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(938, 4, 29, 0, 0, 'SHEEP LIVER ', 0.00, 100, '', 0.00, 38.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(939, 4, 29, 0, 0, 'SHEEP LIVER ', 0.00, 100, '', 0.00, 38.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(940, 4, 29, 0, 0, 'SHEEP TROTTERS ', 0.00, 100, '', 0.00, 46.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(941, 4, 29, 0, 0, 'SHEEP TROTTERS ', 0.00, 100, '', 0.00, 46.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(942, 4, 29, 0, 0, 'CHEESE MUTT LOLLIES ', 0.00, 100, '', 0.00, 56.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(943, 4, 29, 0, 0, 'CHEESE MUTT LOLLIES ', 0.00, 100, '', 0.00, 56.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(944, 4, 29, 0, 0, 'SHEEP TRIPE ', 0.00, 100, '', 0.00, 65.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(945, 4, 29, 0, 0, 'SHEEP TRIPE ', 0.00, 100, '', 0.00, 65.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(946, 4, 29, 0, 0, 'MUTTON SAUSAGE ROLL', 0.00, 100, '', 0.00, 67.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(947, 4, 29, 0, 0, 'MUTTON SAUSAGE ROLL', 0.00, 100, '', 0.00, 67.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(948, 4, 29, 0, 0, 'MUTTON LOAF ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(949, 4, 29, 0, 0, 'MUTTON LOAF ', 0.00, 100, '', 0.00, 74.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(950, 4, 29, 0, 0, 'SAUSAGE FILLING LAMB', 0.00, 100, '', 0.00, 78.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(951, 4, 29, 0, 0, 'SAUSAGE FILLING LAMB', 0.00, 100, '', 0.00, 78.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(952, 4, 29, 0, 0, 'MINI BURGER LAMB', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(953, 4, 29, 0, 0, 'CHILLIE SAUSAGE ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(954, 4, 29, 0, 0, 'MINI BURGER LAMB', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(955, 4, 29, 0, 0, 'CHILLIE SAUSAGE ', 0.00, 100, '', 0.00, 84.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(956, 4, 29, 0, 0, 'COCTAIL MUTTON SAUSAGES', 0.00, 100, '', 0.00, 86.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(957, 4, 29, 0, 0, 'COCTAIL MUTTON SAUSAGES', 0.00, 100, '', 0.00, 86.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(958, 4, 29, 0, 0, 'ORIGINAL KEBAB MUTTON ', 0.00, 100, '', 0.00, 92.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(959, 4, 29, 0, 0, 'ORIGINAL KEBAB MUTTON ', 0.00, 100, '', 0.00, 92.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(960, 4, 29, 0, 0, 'SAUSAGE PIE FILLING (LAMB)', 0.00, 100, '', 0.00, 98.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(961, 4, 29, 0, 0, 'SAUSAGE PIE FILLING (LAMB)', 0.00, 100, '', 0.00, 98.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(962, 4, 29, 0, 0, 'MUTT. ORIGINAL KEBAABS', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(963, 4, 29, 0, 0, 'GREEN CHILLI MUTTON (WORS)', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(964, 4, 29, 0, 0, 'MUTT. ORIGINAL KEBAABS', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(965, 4, 29, 0, 0, 'GREEN CHILLI MUTTON (WORS)', 0.00, 100, '', 0.00, 99.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(966, 4, 29, 0, 0, 'LAMB MASALA WORS', 0.00, 100, '', 0.00, 102.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(967, 4, 29, 0, 0, 'LAMB MASALA WORS', 0.00, 100, '', 0.00, 102.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(968, 4, 29, 0, 0, 'ATCHAAR LOAF MUTTON', 0.00, 100, '', 0.00, 104.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(969, 4, 29, 0, 0, 'MUTTON GARLIC ', 0.00, 100, '', 0.00, 104.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(970, 4, 29, 0, 0, 'ATCHAAR LOAF MUTTON', 0.00, 100, '', 0.00, 104.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(971, 4, 29, 0, 0, 'MUTTON GARLIC ', 0.00, 100, '', 0.00, 104.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(972, 4, 29, 0, 0, 'FRENCH LOAF ', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(973, 4, 29, 0, 0, 'MINI FRENCH (MUTTON)', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(974, 4, 29, 0, 0, 'CHILLI LOAF (MUTTON)', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(975, 4, 29, 0, 0, 'FRENCH LOAF (MUTTON)', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(976, 4, 29, 0, 0, 'MINI FRENCH (MUTTON)', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(977, 4, 29, 0, 0, 'CHILLI LOAF (MUTTON)', 0.00, 100, '', 0.00, 105.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(978, 4, 29, 0, 0, 'MUTT SALAMI ', 0.00, 100, '', 0.00, 107.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(979, 4, 29, 0, 0, 'MUTT SALAMI ', 0.00, 100, '', 0.00, 107.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(980, 4, 29, 0, 0, 'LAMB COCkTAIL Sausage ', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(981, 4, 29, 0, 0, 'LAMB MASALA SAUSAGES', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(982, 4, 29, 0, 0, 'SAUSAGE MIXTURE LAMB MASALA', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(983, 4, 29, 0, 0, 'COCTAIL MUTT. VIENNAS', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(984, 4, 29, 0, 0, 'LAMB ORIGINAL SAUSAGES', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(985, 4, 29, 0, 0, 'LAMB COCTAIL SAUSAGE', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(986, 4, 29, 0, 0, 'LAMB MASALA SAUSAGES', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(987, 4, 29, 0, 0, 'SAUSAGE MIXTURE LAMB MASALA', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(988, 4, 29, 0, 0, 'COCTAIL MUTT. VIENNAS', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(989, 4, 29, 0, 0, 'LAMB ORIGINAL SAUSAGES', 0.00, 100, '', 0.00, 108.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(990, 4, 29, 0, 0, 'HOLLYWOOD Chops ', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(991, 4, 29, 0, 0, 'LAMB SHAMI KEBABS', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(992, 4, 29, 0, 0, 'LAMB WORS MILD', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(993, 4, 29, 0, 0, 'X-HOT LAMB SAUSAGES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(994, 4, 29, 0, 0, 'MUTTON PATTIES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(995, 4, 29, 0, 0, 'HOLLYWOOD CHOPS MUTT.', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(996, 4, 29, 0, 0, 'LAMB SHAMI KEBABS', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(997, 4, 29, 0, 0, 'LAMB WORS MILD', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(998, 4, 29, 0, 0, 'X-HOT LAMB SAUSAGES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(999, 4, 29, 0, 0, 'MUTTON PATTIES', 0.00, 100, '', 0.00, 110.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1000, 4, 29, 0, 0, 'MUTTON VIENNAS ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1001, 4, 29, 0, 0, 'SWEET CHILLIE LAMB SAUSAGE', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1002, 4, 29, 0, 0, 'MUTTON LOLLIES', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1003, 4, 29, 0, 0, 'MUT RUSSIANS ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1004, 4, 29, 0, 0, 'MILD LAMB SAUSAGES', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1005, 4, 29, 0, 0, 'LAMB MASALA SAUSAGES', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1006, 4, 29, 0, 0, 'COCKTAIL MUTT VIENNAS', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1007, 4, 29, 0, 0, 'MUTTON VIENNAS ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1008, 4, 29, 0, 0, 'SWEET CHILLIE LAMB SAUSAGE', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1009, 4, 29, 0, 0, 'MUTTON LOLLIES', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1010, 4, 29, 0, 0, 'MUT RUSSIANS ', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1011, 4, 29, 0, 0, 'MILD LAMB SAUSAGES', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1012, 4, 29, 0, 0, 'LAMB MASALA SAUSAGES', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1013, 4, 29, 0, 0, 'COCKTAIL MUTT VIENNAS', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1014, 4, 29, 0, 0, 'LEG MUTTON ', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1015, 4, 29, 0, 0, 'LEG MUTTON ', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1016, 4, 29, 0, 0, 'LAMB SHOULDER FOR ROST', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1017, 4, 29, 0, 0, 'LAMB SHOULDER FOR ROST', 0.00, 100, '', 0.00, 135.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1018, 4, 29, 0, 0, 'LAMB CURRY ', 0.00, 100, '', 0.00, 138.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1019, 4, 29, 0, 0, 'KASSEGRILLE (MUTTON)', 0.00, 100, '', 0.00, 138.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1020, 4, 29, 0, 0, 'LAMB CURRY ', 0.00, 100, '', 0.00, 138.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1021, 4, 29, 0, 0, 'KASSEGRILLE (MUTTON)', 0.00, 100, '', 0.00, 138.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1022, 4, 29, 0, 0, 'AAA GRADE KAROO LAMB', 0.00, 100, '', 0.00, 138.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1023, 4, 29, 0, 0, 'AAA GRADE KAROO LAMB', 0.00, 100, '', 0.00, 138.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1024, 4, 29, 0, 0, 'TEXAN LAMB RIBS', 0.00, 100, '', 0.00, 139.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1025, 4, 29, 0, 0, 'JUICY LAMB SPARE RIBS', 0.00, 100, '', 0.00, 139.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1026, 4, 29, 0, 0, 'TEXAN LAMB RIBS', 0.00, 100, '', 0.00, 139.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1027, 4, 29, 0, 0, 'JUICY LAMB SPARE RIBS', 0.00, 100, '', 0.00, 139.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1028, 4, 29, 0, 0, 'LAMB SPARE RIBS', 0.00, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1029, 4, 29, 0, 0, 'LAMB SPARE RIBS', 0.00, 100, '', 0.00, 145.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1030, 4, 29, 0, 0, 'BIRYAANI LAMB ', 0.00, 100, '', 0.00, 148.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1031, 4, 29, 0, 0, 'BIRYAANI LAMB ', 0.00, 100, '', 0.00, 148.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1032, 4, 29, 0, 0, 'SHIN (LAMB) ', 0.00, 100, '', 0.00, 148.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1033, 4, 29, 0, 0, 'LAMB TEXAN ', 0.00, 100, '', 0.00, 148.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1034, 4, 29, 0, 0, 'TEXAN LAMB RASHERS', 0.00, 100, '', 0.00, 148.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1035, 4, 29, 0, 0, 'SHIN (LAMB) ', 0.00, 100, '', 0.00, 148.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1036, 4, 29, 0, 0, 'LAMB TEXAN ', 0.00, 100, '', 0.00, 148.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1037, 4, 29, 0, 0, 'TEXAN LAMB RASHERS', 0.00, 100, '', 0.00, 148.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1038, 4, 29, 0, 0, 'LAMB BBQ SPARE RIBS', 0.00, 100, '', 0.00, 149.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1039, 4, 29, 0, 0, 'LAMB BBQ SPARE RIBS', 0.00, 100, '', 0.00, 149.95, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1040, 4, 29, 0, 0, 'SELECTED CUT LEG MUTTON', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1041, 4, 29, 0, 0, 'SELECTED CUT LEG MUTTON', 0.00, 100, '', 0.00, 150.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1042, 4, 29, 0, 0, 'LAMB RASHERS ', 0.00, 100, '', 0.00, 155.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1043, 4, 29, 0, 0, 'LAMB RASHERS ', 0.00, 100, '', 0.00, 155.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1044, 4, 29, 0, 0, 'LEG ROAST ', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1045, 4, 29, 0, 0, 'RIAZO LAMB RINGS', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1046, 4, 29, 0, 0, 'TEXAN LAMB RINGS', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1047, 4, 29, 0, 0, 'SAUCY LAMB SHANKS', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1048, 4, 29, 0, 0, 'LEG ROAST ', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1049, 4, 29, 0, 0, 'RIAZO LAMB RINGS', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1050, 4, 29, 0, 0, 'TEXAN LAMB RINGS', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1051, 4, 29, 0, 0, 'SAUCY LAMB SHANKS', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1052, 4, 29, 0, 0, 'LEG MIDDLE ', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1053, 4, 29, 0, 0, 'LAMB SHANK ROAST', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1054, 4, 29, 0, 0, 'ROLLED LAMB ', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1055, 4, 29, 0, 0, 'LEG OF LAMB ', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1056, 4, 29, 0, 0, 'LEG MIDDLE CUT', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1057, 4, 29, 0, 0, 'LAMB SHANK ROAST', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1058, 4, 29, 0, 0, 'ROLLED LAMB ', 0.00, 100, '', 0.00, 175.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1059, 4, 29, 0, 0, 'LAMB CHOPS ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1060, 4, 29, 0, 0, 'LAMB LEG MINCE ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1061, 4, 29, 0, 0, 'BREAKFAST CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1062, 4, 29, 0, 0, 'MARINATED CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1063, 4, 29, 0, 0, 'SALT&PEPPER CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1064, 4, 29, 0, 0, 'TEXAN CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1065, 4, 29, 0, 0, 'KHAN''S RIAZO CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1066, 4, 29, 0, 0, 'MARINATED CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1067, 4, 29, 0, 0, 'KHAN''S JOES CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1068, 4, 29, 0, 0, 'BBQ BASTING CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1069, 4, 29, 0, 0, 'PORTUGUESE CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1070, 4, 29, 0, 0, 'LAMB RACK ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1071, 4, 29, 0, 0, 'SPECIAL MUTT MINCE 1GRND', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1072, 4, 29, 0, 0, 'BRAAI CHOPS ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1073, 4, 29, 0, 0, 'SALT PEPPER CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1074, 4, 29, 0, 0, 'D-- BONED LEG ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1075, 4, 29, 0, 0, 'TEXAN CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1076, 4, 29, 0, 0, 'MAR-BREAKFAST CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1077, 4, 29, 0, 0, 'LAMB CHOPS ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1078, 4, 29, 0, 0, 'LAMB LEG MINCE ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1079, 4, 29, 0, 0, 'BREAKFAST CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1080, 4, 29, 0, 0, 'MARINATED CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1081, 4, 29, 0, 0, 'SALT&PEPPER CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1082, 4, 29, 0, 0, 'TEXAN CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1083, 4, 29, 0, 0, 'KHAN''S RIAZO CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1084, 4, 29, 0, 0, 'MARINATED CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1085, 4, 29, 0, 0, 'KHAN''S JOES CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1086, 4, 29, 0, 0, 'BBQ BASTING CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1087, 4, 29, 0, 0, 'PORTUGUESE CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1088, 4, 29, 0, 0, 'LAMB RACK ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1089, 4, 29, 0, 0, 'SPECIAL MUTT MINCE 1GRND', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1090, 4, 29, 0, 0, 'BRAAI CHOPS ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1091, 4, 29, 0, 0, 'SALT PEPPER CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1092, 4, 29, 0, 0, 'D-- BONED LEG ', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1093, 4, 29, 0, 0, 'TEXAN CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1094, 4, 29, 0, 0, 'MAR-BREAKFAST CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1095, 4, 29, 0, 0, 'MACON (LAMB)', 0.00, 100, '', 0.00, 195.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1096, 4, 29, 0, 0, 'MACON (LAMB)', 0.00, 100, '', 0.00, 195.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1097, 4, 29, 0, 0, 'LAMB MACON SWISS STYLE', 0.00, 100, '', 0.00, 215.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1098, 4, 29, 0, 0, 'LAMB MACON SWISS STYLE', 0.00, 100, '', 0.00, 215.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1099, 4, 29, 0, 0, 'LAMB MACON ', 0.00, 100, '', 0.00, 235.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1100, 4, 29, 0, 0, 'LAMB MACON ', 0.00, 100, '', 0.00, 235.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1101, 4, 29, 0, 0, 'LAMB SALT MEAT', 0.00, 100, '', 0.00, 275.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1102, 4, 29, 0, 0, 'LAMB SALT MEAT', 0.00, 100, '', 0.00, 275.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1103, 4, 29, 0, 0, 'SHEEP BRAINS ', 0.00, 100, '', 0.00, 310.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1104, 4, 29, 0, 0, 'SHEEP BRAINS ', 0.00, 100, '', 0.00, 310.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1105, 4, 29, 0, 0, 'LAMB MACON BITES', 0.00, 100, '', 0.00, 395.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1106, 4, 29, 0, 0, 'LAMB MACON BITES', 0.00, 100, '', 0.00, 395.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1107, 5, 8, 0, 0, 'Chops', 0.00, 100, '', 0.00, 170.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1108, 5, 8, 0, 0, 'Spare Ribs', 0.00, 100, '', 0.00, 165.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1109, 5, 8, 0, 0, 'Tbone steak', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1110, 5, 8, 0, 0, 'Minute Steak', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1111, 5, 8, 0, 0, 'Kebabs', 0.00, 100, '', 0.00, 120.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1112, 5, 8, 0, 0, 'Hot wings', 0.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1113, 5, 8, 0, 0, 'Portuguese Fillet ', 0.00, 100, '', 0.00, 100.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1114, 5, 8, 0, 0, 'Sausages', 0.00, 100, '', 0.00, 125.00, 0.00, '', 0, 0, 0, 0.00, 1, '', '0000-00-00', '00:00:00'),
(1151, 1, 13, 0, 0, 'TEST123', 0.00, 0, 'TEST1', 110.00, 0.00, 10.00, 'http://139.59.38.160/sendit/Dashboard/products/0da6478b8aa1c63ff08a8135ce0e73df-snowflake-frozen-cold-svg-by-vexels.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2021-03-30', '12:16:29'),
(1152, 1, 12, 0, 0, 'TEST', 0.00, 0, '111', 1111.00, 1110.00, 0.00, 'http://139.59.38.160/sendit/Dashboard/products/8801d9948d54c7ce01bd20108fd64741.png', 0, 0, 0, 0.00, 1, 'ADMIN123', '2021-04-06', '22:50:34'),
(1321, 10, 1, 0, 0, 'CHICKEN CHEESY BITES', 0.00, 100, '', 0.00, 95.00, 0.00, 'image216.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1322, 10, 1, 0, 0, 'CHICKEN CHEESY BURGER', 0.00, 100, '', 0.00, 80.01, 0.00, 'image217.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1323, 10, 1, 0, 0, 'CHICKEN CHEESY SCHNITZELS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image218.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1324, 10, 1, 0, 0, 'CHICKEN CHEESY STRIPS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image219.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1325, 10, 1, 0, 0, 'CHICKEN CHIMOOSA', 0.00, 100, '', 0.00, 85.00, 0.00, 'image220.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1326, 10, 1, 0, 0, 'CHICKEN SCHNITZELS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image221.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1327, 10, 1, 0, 0, 'CHILLI CHEESE BITES', 0.00, 100, '', 0.00, 220.00, 0.00, 'image222.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1328, 10, 1, 0, 0, 'CRUMB CHICKEN BREAST', 0.00, 100, '', 0.00, 95.00, 0.00, 'image223.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1329, 10, 1, 0, 0, 'CRUMP CHICKEN NUGGET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image224.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1330, 10, 1, 0, 0, 'CRUMP CHICKEN PATTY', 0.00, 100, '', 0.00, 99.00, 0.00, 'image225.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1331, 10, 1, 0, 0, 'CRUMP CHICKEN POPS', 0.00, 100, '', 0.00, 110.00, 0.00, 'image226.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1332, 10, 1, 0, 0, 'CRUMP CHICKEN STRIPS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image227.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1333, 10, 1, 0, 0, 'CRUMPED CHIC D/STICKS', 0.00, 100, '', 0.00, 90.00, 0.00, 'image228.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1334, 10, 1, 0, 0, 'CRUMPED CHICKEN SLIDERS', 0.00, 100, '', 0.00, 80.01, 0.00, 'image229.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1335, 10, 1, 0, 0, 'CRUMPED WINGS', 0.00, 100, '', 0.00, 110.00, 0.00, 'image230.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1336, 10, 1, 0, 0, 'FATIMA S BUTTER PASTRY', 0.00, 100, '', 0.00, 125.01, 0.00, 'image231.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1337, 10, 1, 0, 0, 'FATIMA S CHAPATTI', 0.00, 100, '', 0.00, 34.99, 0.00, 'image232.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1338, 10, 1, 0, 0, 'FATIMA S PATHA', 0.00, 100, '', 0.00, 30.00, 0.00, 'image233.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1339, 10, 1, 0, 0, 'FATIMA S PATHA PIES', 0.00, 100, '', 0.00, 45.00, 0.00, 'image234.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1340, 10, 1, 0, 0, 'FATIMA S PATHA SPRING ROLL', 0.00, 100, '', 0.00, 38.00, 0.00, 'image235.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1341, 10, 1, 0, 0, 'FATIMA S PITTA BREAD', 0.00, 100, '', 0.00, 40.00, 0.00, 'image236.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1342, 10, 1, 0, 0, 'FATIMA S PUFF PARATHA', 0.00, 100, '', 0.00, 34.99, 0.00, 'image237.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1343, 10, 1, 0, 0, 'FATIMA S PUFF PARATHA S/O', 0.00, 100, '', 0.00, 34.99, 0.00, 'image238.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1344, 10, 1, 0, 0, 'FATIMA S PUFF PASTRY 1Kg', 0.00, 100, '', 0.00, 38.00, 0.00, 'image239.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1345, 10, 1, 0, 0, 'FATIMA S PUFF PASTRY 3Kg ', 0.00, 100, '', 0.00, 90.00, 0.00, 'image240.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1346, 10, 1, 0, 0, 'FATIMA S PUFF PASTRY SLICES', 0.00, 100, '', 0.00, 40.00, 0.00, 'image241.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1347, 10, 1, 0, 0, 'FATIMA S PUR 500g', 0.00, 100, '', 0.00, 40.00, 0.00, 'image242.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1348, 10, 1, 0, 0, 'FATIMA S PUREE', 0.00, 100, '', 0.00, 18.00, 0.00, 'image243.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1349, 10, 1, 0, 0, 'FATIMA S SAMOOSA 1Kg', 0.00, 100, '', 0.00, 80.01, 0.00, 'image244.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1350, 10, 1, 0, 0, 'FATIMA S SPRING ROLL PASTRY 50 S', 0.00, 100, '', 0.00, 50.00, 0.00, 'image245.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1351, 10, 1, 0, 0, 'FATIMA S VOLUVENT', 0.00, 100, '', 0.00, 40.00, 0.00, 'image246.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1352, 10, 1, 0, 0, 'ABAABEEL PATHA', 0.00, 100, '', 0.00, 25.22, 0.00, 'image247.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1353, 10, 1, 0, 0, 'ANISA PATHA', 0.00, 100, '', 0.00, 60.00, 0.00, 'image248.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1354, 10, 1, 0, 0, 'ANISA PATHA TRAY', 0.00, 100, '', 0.00, 65.00, 0.00, 'image249.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1355, 10, 1, 0, 0, 'GARLIC BUTTER NAAN', 0.00, 100, '', 0.00, 34.99, 0.00, 'image250.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1356, 10, 1, 0, 0, 'GHALWAH PAR BAKED COCKTAIL ROTIS', 0.00, 100, '', 0.00, 30.00, 0.00, 'image251.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1357, 10, 1, 0, 0, 'GHALWAH PAR BAKED ROTI S', 0.00, 100, '', 0.00, 40.00, 0.00, 'image252.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1358, 10, 1, 0, 0, 'HOME MADE PITA BREAD', 0.00, 100, '', 0.00, 34.99, 0.00, 'image253.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1359, 10, 1, 0, 0, 'MASSIMO COCKTAIL BASES', 0.00, 100, '', 0.00, 30.27, 0.00, 'image254.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1360, 10, 1, 0, 0, 'MASSIMO PIZZA BASE 2s', 0.00, 100, '', 0.00, 30.00, 0.00, 'image255.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1361, 10, 1, 0, 0, 'MASSIMO PIZZA BASE 3s', 0.00, 100, '', 0.00, 25.00, 0.00, 'image256.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1362, 10, 1, 0, 0, 'MASSIMO TORTILLA WRAPS', 0.00, 100, '', 0.00, 30.00, 0.00, 'image257.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1363, 10, 1, 0, 0, 'MCCAIN ALOO TIKKI', 0.00, 100, '', 0.00, 60.00, 0.00, 'image258.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1364, 10, 1, 0, 0, 'MCCAIN FRY CHIPS', 0.00, 100, '', 0.00, 30.27, 0.00, 'image259.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1365, 10, 1, 0, 0, 'MCCAIN MASALA FRIES', 0.00, 100, '', 0.00, 25.00, 0.00, 'image260.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1366, 10, 1, 0, 0, 'MCCAIN ONION RINGS', 0.00, 100, '', 0.00, 165.00, 0.00, 'image261.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1367, 10, 1, 0, 0, 'MCCAIN SMILES', 0.00, 100, '', 0.00, 105.00, 0.00, 'image262.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1368, 10, 1, 0, 0, 'MCCAIN CHILLI GARLIC POTATO BITES', 0.00, 100, '', 0.00, 34.99, 0.00, 'image263.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1369, 10, 1, 0, 0, 'MCCAIN HASH BROWN 1.2Kg', 0.00, 100, '', 0.00, 115.00, 0.00, 'image264.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1370, 10, 1, 0, 0, 'MCCAINPOTATO CHEESE SHOTZ', 0.00, 100, '', 0.00, 45.00, 0.00, 'image265.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1371, 10, 1, 0, 0, 'MC AMERICAN FRIES 2.5 Kg', 0.00, 100, '', 0.00, 86.25, 0.00, 'image266.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1372, 10, 1, 0, 0, 'MC FRENCH FRIES 2.5 Kg', 0.00, 100, '', 0.00, 86.25, 0.00, 'image267.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04');
INSERT INTO `foods` (`ID`, `IDCanteen`, `IDMenu`, `IDSubmenu`, `IDSubsubmenu`, `Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`, `isOutOfStock`, `Recomended`, `Popular`, `Rating`, `Available`, `User`, `Date`, `Time`) VALUES
(1373, 10, 1, 0, 0, 'HALDIRAMS ALOO KULCHA', 0.00, 100, '', 0.00, 48.00, 0.00, 'image268.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1374, 10, 1, 0, 0, 'HALDIRAMS ALOO PARATHA', 0.00, 100, '', 0.00, 48.00, 0.00, 'image269.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1375, 10, 1, 0, 0, 'HALDIRAMS CHILLI GARLIC NAAN', 0.00, 100, '', 0.00, 48.00, 0.00, 'image270.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1376, 10, 1, 0, 0, 'HALDIRAMS PANEER KULCHA', 0.00, 100, '', 0.00, 48.00, 0.00, 'image271.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1377, 10, 1, 0, 0, 'HALDIRAMS PANEER PARATHA', 0.00, 100, '', 0.00, 60.00, 0.00, 'image272.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1378, 10, 1, 0, 0, 'HALDIRAMS PHULKA ROTI', 0.00, 100, '', 0.00, 40.00, 0.00, 'image273.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1379, 10, 1, 0, 0, 'HALDIRAMS TANDOORIGARLIC NAAN', 0.00, 100, '', 0.00, 48.00, 0.00, 'image274.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1380, 10, 1, 0, 0, 'HALDIRAMS TANDOORI PLAIN NAAN', 0.00, 100, '', 0.00, 48.00, 0.00, 'image275.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1381, 10, 1, 0, 0, 'HM COCKTAIL PITTA BREAD', 0.00, 100, '', 0.00, 25.22, 0.00, 'image276.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1382, 10, 1, 0, 0, 'HM COCKTAIL TORTILLA WRAPS', 0.00, 100, '', 0.00, 15.13, 0.00, 'image277.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1383, 10, 1, 0, 0, 'HM FOODS ROTI', 0.00, 100, '', 0.00, 25.22, 0.00, 'image278.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1384, 10, 1, 0, 0, 'HM FOODS SAMOOSA PUR', 0.00, 100, '', 0.00, 60.52, 0.00, 'image279.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1385, 10, 1, 0, 0, 'HM PITZA CO COCKTAIL PIZZA BASES', 0.00, 100, '', 0.00, 25.22, 0.00, 'image280.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1386, 10, 1, 0, 0, 'HM PUFF PASTRY 1Kg SHEET', 0.00, 100, '', 0.00, 40.35, 0.00, 'image281.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1387, 10, 1, 0, 0, 'HM READY ROLLED PUFF PASTRY 3Kg ', 0.00, 100, '', 0.00, 99.00, 0.00, 'image282.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1388, 10, 1, 0, 0, 'HM TORTILLA BROWN', 0.00, 100, '', 0.00, 25.00, 0.00, 'image283.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1389, 10, 1, 0, 0, 'HM REGULAR PIZZA BASES', 0.00, 100, '', 0.00, 25.22, 0.00, 'image284.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1390, 10, 1, 0, 0, 'HM TORTILLA WRAP', 0.00, 100, '', 0.00, 25.22, 0.00, 'image285.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1391, 10, 1, 0, 0, 'CHEESE LEVASH', 0.00, 100, '', 0.00, 35.00, 0.00, 'image286.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1392, 10, 1, 0, 0, 'CHEESE ROLO S', 0.00, 100, '', 0.00, 30.00, 0.00, 'image287.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1393, 10, 1, 0, 0, 'CHEESE SAMOOSA', 0.00, 100, '', 0.00, 45.00, 0.00, 'image288.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1394, 10, 1, 0, 0, 'CHICK/CHEESE LEVASH', 0.00, 100, '', 0.00, 40.00, 0.00, 'image289.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1395, 10, 1, 0, 0, 'CHICKEN & CHEESE ROLO S', 0.00, 100, '', 0.00, 30.00, 0.00, 'image290.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1396, 10, 1, 0, 0, 'CHCKEN FARMAAS', 0.00, 100, '', 0.00, 30.00, 0.00, 'image291.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1397, 10, 1, 0, 0, 'CHICKEN KACHORI', 0.00, 100, '', 0.00, 45.00, 0.00, 'image292.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1398, 10, 1, 0, 0, 'CHICKEN PARATHA', 0.00, 100, '', 0.00, 45.00, 0.00, 'image293.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1399, 10, 1, 0, 0, 'CHICKEN PIES', 0.00, 100, '', 0.00, 60.00, 0.00, 'image294.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1400, 10, 1, 0, 0, 'CHICKEN SAMOOSA', 0.00, 100, '', 0.00, 45.00, 0.00, 'image295.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1401, 10, 1, 0, 0, 'CHICKEN ZINGERS', 0.00, 100, '', 0.00, 40.00, 0.00, 'image296.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1402, 10, 1, 0, 0, 'CHICKEN/VEG SPRING ROLLS', 0.00, 100, '', 0.00, 48.00, 0.00, 'image297.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1403, 10, 1, 0, 0, 'CRB. CHICKEN MOONS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image298.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1404, 10, 1, 0, 0, 'CRB. STEAK MOONS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image299.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1405, 10, 1, 0, 0, 'CRUMOOSA', 0.00, 100, '', 0.00, 55.00, 0.00, 'image300.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1406, 10, 1, 0, 0, 'JALEPINO SAMOOSA S', 0.00, 100, '', 0.00, 48.00, 0.00, 'image301.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1407, 10, 1, 0, 0, 'KEEMA PARATHA', 0.00, 100, '', 0.00, 45.00, 0.00, 'image302.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1408, 10, 1, 0, 0, 'MINCE FARMAAS', 0.00, 100, '', 0.00, 30.00, 0.00, 'image303.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1409, 10, 1, 0, 0, 'MUTTON SAMOOSAS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image304.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1410, 10, 1, 0, 0, 'POLONY & CHEESE SAMOOSAS', 0.00, 100, '', 0.00, 40.00, 0.00, 'image305.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1411, 10, 1, 0, 0, 'POTATO FARMAAS', 0.00, 100, '', 0.00, 30.00, 0.00, 'image306.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1412, 10, 1, 0, 0, 'POTATO LEVASH', 0.00, 100, '', 0.00, 35.00, 0.00, 'image307.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '12:59:04'),
(1413, 10, 2, 0, 0, 'BAKE IT YOURSELF BUTTER COOKIE', 0.00, 100, '', 0.00, 40.00, 0.00, 'image287.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1414, 10, 2, 0, 0, 'BAKE IT YOURSELF CARROT CAKE MIX', 0.00, 100, '', 0.00, 60.00, 0.00, 'image288.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1415, 10, 2, 0, 0, 'BAKE IT YOURSELF CHOC CHIP COOKIE', 0.00, 100, '', 0.00, 40.00, 0.00, 'image289.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1416, 10, 2, 0, 0, 'BAKE IT YOURSELF CHOCOLATE ICING', 0.00, 100, '', 0.00, 38.00, 0.00, 'image290.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1417, 10, 2, 0, 0, 'BAKE IT YOURSELF CHOCOLATE MIX', 0.00, 100, '', 0.00, 45.00, 0.00, 'image291.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1418, 10, 2, 0, 0, 'BAKE IT YOURSLEF CREAM CHEESE', 0.00, 100, '', 0.00, 38.00, 0.00, 'image292.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1419, 10, 2, 0, 0, 'BAKE IT YOURSEL GINGER COOKIE', 0.00, 100, '', 0.00, 40.00, 0.00, 'image293.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1420, 10, 2, 0, 0, 'BAKE IT  YOURSELF OAT CRUNCH COOKIE', 0.00, 100, '', 0.00, 40.00, 0.00, 'image294.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1421, 10, 2, 0, 0, 'BAKE IT YOURSELF RAINBOW COOKIE', 0.00, 100, '', 0.00, 40.00, 0.00, 'image295.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1422, 10, 2, 0, 0, 'BAKE IT YOURSELF RED VELVET MIX', 0.00, 100, '', 0.00, 60.00, 0.00, 'image296.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1423, 10, 2, 0, 0, 'BAKE IT YOURSELF VANILLA ICING', 0.00, 100, '', 0.00, 38.00, 0.00, 'image297.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1424, 10, 2, 0, 0, 'BAKE IT YOURSELF VANILLA MIX', 0.00, 100, '', 0.00, 45.00, 0.00, 'image298.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1425, 10, 2, 0, 0, 'BETTY CROCKER DARK CHOCOLATE CAKE MIX', 0.00, 100, '', 0.00, 65.00, 0.00, 'image299.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1426, 10, 2, 0, 0, 'BETTY CROCKER MILKCHOCOLATE CAKE MIX', 0.00, 100, '', 0.00, 65.00, 0.00, 'image300.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1427, 10, 2, 0, 0, 'BETTY CROCKER VANILLA CAKE MIX', 0.00, 100, '', 0.00, 65.00, 0.00, 'image301.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1428, 10, 2, 0, 0, 'BETTY CROCKER WHIPPING CREAM MIX', 0.00, 100, '', 0.00, 25.00, 0.00, 'image302.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1429, 10, 2, 0, 0, 'BETTY CROCKER WHITE CAKE MIX', 0.00, 100, '', 0.00, 65.00, 0.00, 'image303.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1430, 10, 2, 0, 0, 'GO WITH THE DOH ASTROS', 0.00, 100, '', 0.00, 34.99, 0.00, 'image304.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1431, 10, 2, 0, 0, 'GO WITH THE DOH CHOC CHIP', 0.00, 100, '', 0.00, 34.99, 0.00, 'image305.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1432, 10, 2, 0, 0, 'GO WITH THE DOH SMARTIES', 0.00, 100, '', 0.00, 34.99, 0.00, 'image306.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1433, 10, 2, 0, 0, 'ALMOND ROCCA', 0.00, 100, '', 0.00, 90.00, 0.00, 'image307.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1434, 10, 2, 0, 0, 'BISCUITS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image308.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1435, 10, 2, 0, 0, 'BLISS CHOC CHIP COOKIES', 0.00, 100, '', 0.00, 115.00, 0.00, 'image309.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1436, 10, 2, 0, 0, 'BLISS CHOC LONG', 0.00, 100, '', 0.00, 115.00, 0.00, 'image310.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1437, 10, 2, 0, 0, 'BLISS COFFEE PECAN', 0.00, 100, '', 0.00, 115.00, 0.00, 'image311.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1438, 10, 2, 0, 0, 'BLISS FLAKE', 0.00, 100, '', 0.00, 170.00, 0.00, 'image312.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1439, 10, 2, 0, 0, 'BLISS MIX TUB', 0.00, 100, '', 0.00, 170.00, 0.00, 'image313.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1440, 10, 2, 0, 0, 'BLISS MOCHA', 0.00, 100, '', 0.00, 170.00, 0.00, 'image314.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1441, 10, 2, 0, 0, 'BLISS NAAN KHATAI', 0.00, 100, '', 0.00, 115.00, 0.00, 'image315.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1442, 10, 2, 0, 0, 'BLISS PECAN SHORT BREAD', 0.00, 100, '', 0.00, 115.00, 0.00, 'image316.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1443, 10, 2, 0, 0, 'FANCY BICUIT BIG BOX', 0.00, 100, '', 0.00, 230.00, 0.00, 'image317.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1444, 10, 2, 0, 0, 'FANCY BISCUIT SMALL BOX', 0.00, 100, '', 0.00, 130.00, 0.00, 'image318.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1445, 10, 2, 0, 0, 'FARMER COOKIES DOUBLE CHOC', 0.00, 100, '', 0.00, 23.21, 0.00, 'image319.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1446, 10, 2, 0, 0, 'FRESH BISCUIT COCONUT', 0.00, 100, '', 0.00, 135.00, 0.00, 'image320.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1447, 10, 2, 0, 0, 'FRESH BICUIT GINGER', 0.00, 100, '', 0.00, 135.00, 0.00, 'image321.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1448, 10, 2, 0, 0, 'FRESH BISCUIT PEANUT & RAISINS', 0.00, 100, '', 0.00, 135.00, 0.00, 'image322.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1449, 10, 2, 0, 0, 'FRESH BICUIT SHORT BREAD', 0.00, 100, '', 0.00, 135.00, 0.00, 'image323.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1450, 10, 2, 0, 0, 'FRESH BISCUIT CHOC CHP', 0.00, 100, '', 0.00, 135.00, 0.00, 'image324.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1451, 10, 2, 0, 0, 'HOMEMADE BISCUIT BON BON ', 0.00, 100, '', 0.00, 65.00, 0.00, 'image325.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1452, 10, 2, 0, 0, 'HOMEMADE FANCY BISCUITS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image326.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1453, 10, 2, 0, 0, 'HORSESHOE BISCUITS', 0.00, 100, '', 0.00, 48.00, 0.00, 'image327.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1454, 10, 2, 0, 0, 'LUXURY RUSK', 0.00, 100, '', 0.00, 45.00, 0.00, 'image328.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1455, 10, 2, 0, 0, 'PARLIAMENT LIGHT & CRISPY RUSK', 0.00, 100, '', 0.00, 25.00, 0.00, 'image329.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1456, 10, 2, 0, 0, 'PARLIAMENT MILK RUSK', 0.00, 100, '', 0.00, 25.00, 0.00, 'image330.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1457, 10, 2, 0, 0, 'RUSK ADDICTION', 0.00, 100, '', 0.00, 45.39, 0.00, 'image331.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1458, 10, 2, 0, 0, 'BRITANNIA RUSK', 0.00, 100, '', 0.00, 25.22, 0.00, 'image332.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1459, 10, 2, 0, 0, 'WACKY WAFFLES', 0.00, 100, '', 0.00, 85.00, 0.00, 'image333.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1460, 10, 2, 0, 0, 'FOREST FAIRIES ALMOND ROCHA MINI', 0.00, 100, '', 0.00, 34.99, 0.00, 'image334.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1461, 10, 2, 0, 0, 'FOREST FAIRIES ASSORTED GIFT BOX', 0.00, 100, '', 0.00, 65.00, 0.00, 'image335.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1462, 10, 2, 0, 0, 'FOREST FAIRIES ASSORTED SWEET', 0.00, 100, '', 0.00, 280.00, 0.00, 'image336.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1463, 10, 2, 0, 0, 'FOREST FAIRIES BRAZIL NUT CARAMELS', 0.00, 100, '', 0.00, 199.00, 0.00, 'image337.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1464, 10, 2, 0, 0, 'FOREST FAIRIES BRAZIL NUT MINI', 0.00, 100, '', 0.00, 34.99, 0.00, 'image338.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1465, 10, 2, 0, 0, 'FOREST FAIRIES CARAMEL BON BON', 0.00, 100, '', 0.00, 250.00, 0.00, 'image339.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1466, 10, 2, 0, 0, 'FOREST FAIRIES CARAMEL PEANUT BUTTER & CHOCOLATE', 0.00, 100, '', 0.00, 16.00, 0.00, 'image340.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1467, 10, 2, 0, 0, 'FOREST FAIRIES CASHEW BRITTLE SUGAR FREE', 0.00, 100, '', 0.00, 30.00, 0.00, 'image341.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1468, 10, 2, 0, 0, 'FOREST FAIRIES CHOC COCONUT NOUGAT', 0.00, 100, '', 0.00, 230.00, 0.00, 'image342.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1469, 10, 2, 0, 0, 'FOREST FAIRIES CHOC NOUGAT', 0.00, 100, '', 0.00, 260.00, 0.00, 'image343.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1470, 10, 2, 0, 0, 'FOREST FAIRIES CHOC ROASTED EXOTIC NUTS', 0.00, 100, '', 0.00, 16.00, 0.00, 'image344.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1471, 10, 2, 0, 0, 'FOREST FAIRIES COCONUT ICE', 0.00, 100, '', 0.00, 211.84, 0.00, 'image345.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1472, 10, 2, 0, 0, 'FOREST FAIRIES COCONUT ICE SLAB', 0.00, 100, '', 0.00, 10.01, 0.00, 'image346.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1473, 10, 2, 0, 0, 'FOREST FAIRIES COCONUT WHEELS', 0.00, 100, '', 0.00, 295.00, 0.00, 'image347.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1474, 10, 2, 0, 0, 'FOREST FAIRIES COCONUT WHEELS MINI', 0.00, 100, '', 0.00, 34.99, 0.00, 'image348.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1475, 10, 2, 0, 0, 'FOREST FAIRIES CRANBERRY & MACADAMIA NOUGAT', 0.00, 100, '', 0.00, 16.00, 0.00, 'image349.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1476, 10, 2, 0, 0, 'FOREST  FAIRIES HONEY PEANUT BRITTLE', 0.00, 100, '', 0.00, 10.01, 0.00, 'image350.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1477, 10, 2, 0, 0, 'FOREST FAIRIES HOT CHOCOLATE', 0.00, 100, '', 0.00, 34.99, 0.00, 'image351.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1478, 10, 2, 0, 0, 'FOREST FAIRIES LIQUORICE TOFFEE', 0.00, 100, '', 0.00, 211.84, 0.00, 'image352.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1479, 10, 2, 0, 0, 'FOREST FAIRIES MACADAMIA NOUGAT', 0.00, 100, '', 0.00, 16.00, 0.00, 'image353.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1480, 10, 2, 0, 0, 'FOREST FAIRIES MARSHMELLOW SUGAR FREE', 0.00, 100, '', 0.00, 25.00, 0.00, 'image354.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1481, 10, 2, 0, 0, 'FOREST FAIRIES NOUGAT BON BON', 0.00, 100, '', 0.00, 250.00, 0.00, 'image355.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1482, 10, 2, 0, 0, 'FOREST FAIRIES NOUGAT CARAMEL PIN WHEELS MINI', 0.00, 100, '', 0.00, 34.99, 0.00, 'image356.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1483, 10, 2, 0, 0, 'FOREST FAIRIES NOUGAT CARAMEL PINWHEELS', 0.00, 100, '', 0.00, 195.01, 0.00, 'image357.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1484, 10, 2, 0, 0, 'FOREST FAIRIES NOUGAT MELLOW BON BON', 0.00, 100, '', 0.00, 250.00, 0.00, 'image358.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1485, 10, 2, 0, 0, 'FOREST FAIRIES NOUGAT POP', 0.00, 100, '', 0.00, 15.00, 0.00, 'image359.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1486, 10, 2, 0, 0, 'FOREST FAIRIES PEANUT BRITTLE', 0.00, 100, '', 0.00, 211.84, 0.00, 'image360.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1487, 10, 2, 0, 0, 'FOREST FAIRIES PEANUT BRITTLE SUGAR FREE', 0.00, 100, '', 0.00, 30.00, 0.00, 'image361.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1488, 10, 2, 0, 0, 'FOREST FAIRIES PECAN NUT CLUSTER', 0.00, 100, '', 0.00, 211.84, 0.00, 'image362.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1489, 10, 2, 0, 0, 'FOREST FAIRIES PEANUT CLUSTER', 0.00, 100, '', 0.00, 16.00, 0.00, 'image363.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1490, 10, 2, 0, 0, 'FOREST FAIRIES PISTACHIO & ROSE TURKISH DELIGHT', 0.00, 100, '', 0.00, 16.00, 0.00, 'image364.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1491, 10, 2, 0, 0, 'FOREST FAIRIES ROCKY ROAD', 0.00, 100, '', 0.00, 15.00, 0.00, 'image365.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1492, 10, 2, 0, 0, 'FOREST FAIRIES SOFT TOFFEE', 0.00, 100, '', 0.00, 211.84, 0.00, 'image366.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1493, 10, 2, 0, 0, 'SIMPLY DELISH LIME/GREENGAGE JELLY', 0.00, 100, '', 0.00, 15.00, 0.00, 'image367.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1494, 10, 2, 0, 0, 'SIMPLY DELISH PINEAPPLE JELLY', 0.00, 100, '', 0.00, 15.00, 0.00, 'image368.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1495, 10, 2, 0, 0, 'SIMPLY DELISH RUSPBERRY SUGAR FREE JELLY', 0.00, 100, '', 0.00, 15.00, 0.00, 'image369.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1496, 10, 2, 0, 0, 'SIMPLY DELISH RUSPBERRY JELLY', 0.00, 100, '', 0.00, 15.00, 0.00, 'image370.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1497, 10, 2, 0, 0, 'SIMPLY DELISHSTRAWBERRY JELLY', 0.00, 100, '', 0.00, 15.00, 0.00, 'image371.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1498, 10, 2, 0, 0, 'SIMPLY DELISH STRAWBERRY SUGAR FREE', 0.00, 100, '', 0.00, 15.00, 0.00, 'image372.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1499, 10, 2, 0, 0, 'SALLY WILLIAMS ALMOND NOUGAT 150g', 0.00, 100, '', 0.00, 80.01, 0.00, 'image373.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1500, 10, 2, 0, 0, 'SALLY WILLIAMS ALMOND NOUGAT 50g', 0.00, 100, '', 0.00, 15.00, 0.00, 'image374.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1501, 10, 2, 0, 0, 'SALLY WILLIAMS CHOCOLATE NOUGAT', 0.00, 100, '', 0.00, 120.00, 0.00, 'image375.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1502, 10, 2, 0, 0, 'SALLY WILLIAMS CRANBERRY & ALMOND', 0.00, 100, '', 0.00, 75.00, 0.00, 'image376.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1503, 10, 2, 0, 0, 'SALLY WILLIAMS ELD MUBARAK BOX', 0.00, 100, '', 0.00, 70.00, 0.00, 'image377.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1504, 10, 2, 0, 0, 'SALLY WILLIAMS ELD MUBARAK CELEBRATE', 0.00, 100, '', 0.00, 99.00, 0.00, 'image378.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:06:12'),
(1505, 10, 9, 0, 0, 'LAMB BREAKFAST MACON', 0.00, 100, '', 0.00, 115.00, 0.00, 'image141.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1506, 10, 9, 0, 0, 'LAMB CHEESE CHILLI LOAF', 0.00, 100, '', 0.00, 110.00, 0.00, 'image142', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1507, 10, 9, 0, 0, 'LAMP CHILLI LOAF', 0.00, 100, '', 0.00, 105.00, 0.00, 'image143', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1508, 10, 9, 0, 0, 'LAMP CHILLI SALT MEAT', 0.00, 100, '', 0.00, 230.00, 0.00, 'image144', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1509, 10, 9, 0, 0, 'LAMB MACON', 0.00, 100, '', 0.00, 190.00, 0.00, 'image145', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1510, 10, 9, 0, 0, 'LAMB SALT MEAT', 0.00, 100, '', 0.00, 230.00, 0.00, 'image146', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1511, 10, 9, 0, 0, 'PRESSED LAMB LOAF', 0.00, 100, '', 0.00, 120.00, 0.00, 'image147', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1512, 10, 9, 0, 0, 'LAMB GARLIC POLONY', 0.00, 100, '', 0.00, 60.00, 0.00, 'image148', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1513, 10, 9, 0, 0, 'LAMB GARLIC POLONY SLICED', 0.00, 100, '', 0.00, 65.00, 0.00, 'image149', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1514, 10, 9, 0, 0, 'LAMB GARLIC POLONY SMALL', 0.00, 100, '', 0.00, 34.99, 0.00, 'image150', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1515, 10, 9, 0, 0, 'KAROO SAUSAGES', 0.00, 100, '', 0.00, 115.00, 0.00, 'image151', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1516, 10, 9, 0, 0, 'LAMB CHILLI SAUSAGES', 0.00, 100, '', 0.00, 118.00, 0.00, 'image152', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1517, 10, 9, 0, 0, 'LAMB COCKTAIL S & P SAUSAGES', 0.00, 100, '', 0.00, 118.00, 0.00, 'image153', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1518, 10, 9, 0, 0, 'LAMB COCKTAIL SAUSAGES', 0.00, 100, '', 0.00, 118.00, 0.00, 'image154', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1519, 10, 9, 0, 0, 'LAMB S & P SAUSAGES', 0.00, 100, '', 0.00, 118.00, 0.00, 'image155', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1520, 10, 9, 0, 0, 'LAMB SAUSAGES', 0.00, 100, '', 0.00, 11.40, 0.00, 'image156', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1521, 10, 9, 0, 0, 'LAMB CHILLI WORS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image157', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1522, 10, 9, 0, 0, 'LAMB GAAR WORS', 0.00, 100, '', 0.00, 105.00, 0.00, 'image158', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1523, 10, 9, 0, 0, 'LAMB WORS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image159', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1524, 10, 9, 0, 0, 'MILD LAMB WORS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image160', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1525, 10, 9, 0, 0, 'LAMB COCKTAIL VIENNA', 0.00, 100, '', 0.00, 100.00, 0.00, 'image161', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1526, 10, 9, 0, 0, 'SPICY LAMB VIENNA', 0.00, 100, '', 0.00, 100.00, 0.00, 'image162', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1527, 10, 9, 0, 0, 'LAMB RUSSIANS', 0.00, 100, '', 0.00, 90.00, 0.00, 'image163', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1528, 10, 9, 0, 0, 'PAKI MUTTON KEBAAB', 0.00, 100, '', 0.00, 118.00, 0.00, 'image164', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1529, 10, 9, 0, 0, 'LAMB KEBAAB MIX', 0.00, 100, '', 0.00, 120.00, 0.00, 'image165', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1530, 10, 9, 0, 0, 'LAMB ORIENTAL KEBAABS', 0.00, 100, '', 0.00, 118.00, 0.00, 'image166', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1531, 10, 9, 0, 0, 'LAMB CHEESE PATTY', 0.00, 100, '', 0.00, 122.00, 0.00, 'image167', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1532, 10, 9, 0, 0, 'LAMB PATTY', 0.00, 100, '', 0.00, 118.00, 0.00, 'image168', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1533, 10, 9, 0, 0, 'LAMB SPICY JUMBO WHOPPER', 0.00, 100, '', 0.00, 118.00, 0.00, 'image169', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1534, 10, 9, 0, 0, 'MILD JUMBO WHOPPER', 0.00, 100, '', 0.00, 105.00, 0.00, 'image170', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1535, 10, 9, 0, 0, 'HOLLYWOOD CHOPS', 0.00, 100, '', 0.00, 110.00, 0.00, 'image171', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1536, 10, 9, 0, 0, 'LAMB LEG', 0.00, 100, '', 0.00, 180.00, 0.00, 'image172', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1537, 10, 9, 0, 0, 'LOIN CHOPS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image173', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1538, 10, 9, 0, 0, 'RIB CHOPS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image174', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1539, 10, 9, 0, 0, 'LAMB CURRY', 0.00, 100, '', 0.00, 145.00, 0.00, 'image175', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1540, 10, 9, 0, 0, 'SHOULDER CHOPS', 0.00, 100, '', 0.00, 170.00, 0.00, 'image176', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1541, 10, 9, 0, 0, 'SPARE RIBS', 0.00, 100, '', 0.00, 110.00, 0.00, 'image177', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1542, 10, 9, 0, 0, 'LEG CHOPS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image178', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1543, 10, 9, 0, 0, 'LEG FOR ROAST', 0.00, 100, '', 0.00, 180.00, 0.00, 'image179', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1544, 10, 9, 0, 0, 'LAMB MINCE', 0.00, 100, '', 0.00, 110.00, 0.00, 'image180', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1545, 10, 9, 0, 0, 'KAROO LAMB', 0.00, 100, '', 0.00, 139.00, 0.00, 'image181', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1546, 10, 9, 0, 0, 'FRENCH CUT CHOPS', 0.00, 100, '', 0.00, 189.00, 0.00, 'image182', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1547, 10, 9, 0, 0, 'LAMB ROLOS', 0.00, 100, '', 0.00, 105.00, 0.00, 'image183', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1548, 10, 9, 0, 0, 'BREAKFAST CHOPS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image184', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1549, 10, 9, 0, 0, 'LAMB CUTLETS', 0.00, 100, '', 0.00, 190.00, 0.00, 'image185', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1550, 10, 9, 0, 0, 'ROLLED SHOULDER', 0.00, 100, '', 0.00, 165.00, 0.00, 'image186', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1551, 10, 9, 0, 0, 'DEBONED LEG', 0.00, 100, '', 0.00, 195.00, 0.00, 'image187', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1552, 10, 9, 0, 0, 'LAMB NECK', 0.00, 100, '', 0.00, 140.00, 0.00, 'image188', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1553, 10, 9, 0, 0, 'MUTTON BONES', 0.00, 100, '', 0.00, 25.00, 0.00, 'image189', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1554, 10, 9, 0, 0, 'SHEEP TRIPE', 0.00, 100, '', 0.00, 75.00, 0.00, 'image190', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1555, 10, 9, 0, 0, 'LAMB KNUCKLES', 0.00, 100, '', 0.00, 30.00, 0.00, 'image191', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1556, 10, 9, 0, 0, 'LAMB KIDNEY', 0.00, 100, '', 0.00, 68.00, 0.00, 'image192', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1557, 10, 9, 0, 0, 'SHEEP TROTTERS', 0.00, 100, '', 0.00, 34.00, 0.00, 'image193', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1558, 10, 9, 0, 0, 'SHEEP LIVER', 0.00, 100, '', 0.00, 75.00, 0.00, 'image194', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1559, 10, 9, 0, 0, 'BBQ CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image195', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1560, 10, 9, 0, 0, 'PEPPER CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image196', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1561, 10, 9, 0, 0, 'PERI PERI CHOPS', 0.00, 100, '', 0.00, 175.00, 0.00, 'image197', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1562, 10, 9, 0, 0, 'S/P MINUTE CHOPS', 0.00, 100, '', 0.00, 175.00, 0.00, 'image198', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1563, 10, 9, 0, 0, 'TEXICANO CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image199', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1564, 10, 9, 0, 0, 'CAJUN CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image200', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1565, 10, 9, 0, 0, 'FMB ORIGINAL BRAAI CHOPS', 0.00, 100, '', 0.00, 175.00, 0.00, 'image201', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1566, 10, 9, 0, 0, 'FORSMAYS Og MINUTE CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image202', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1567, 10, 9, 0, 0, 'FORSMAYS Og RIB & LOIN CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image203', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1568, 10, 9, 0, 0, 'MARINATED CHUMP CHOPS', 0.00, 100, '', 0.00, 185.00, 0.00, 'image204', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1569, 10, 9, 0, 0, 'MARINATED S/P CHOPS', 0.00, 100, '', 0.00, 175.00, 0.00, 'image205', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1570, 10, 9, 0, 0, 'MARINATED SHANKS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image206', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1571, 10, 9, 0, 0, 'FINGER BLITZIN BBQ RIBS', 0.00, 100, '', 0.00, 149.99, 0.00, 'image207', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1572, 10, 9, 0, 0, 'BBQ LAMB RIBS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image208', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1573, 10, 9, 0, 0, 'MARINATED LAMB RIBS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image209', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1574, 10, 9, 0, 0, 'PRE-COOKED MARINATED LAMB RIBS', 0.00, 100, '', 0.00, 140.00, 0.00, 'image210', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1575, 10, 9, 0, 0, 'MARINATED MINUTE LAMB RIBS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image211', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1576, 10, 9, 0, 0, 'MARINATED LEG ROAST', 0.00, 100, '', 0.00, 185.00, 0.00, 'image212', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1577, 10, 9, 0, 0, 'MARINATED LAMB ROLL', 0.00, 100, '', 0.00, 170.00, 0.00, 'image213', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1578, 10, 9, 0, 0, 'LAMB KARAHI', 0.00, 100, '', 0.00, 149.99, 0.00, 'image214', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1579, 10, 9, 0, 0, 'LAMB SOSATIE', 0.00, 100, '', 0.00, 195.00, 0.00, 'image215', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1580, 10, 9, 0, 0, 'MARINATED DEBONED LEG', 0.00, 100, '', 0.00, 220.00, 0.00, 'image216', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:23:38'),
(1581, 10, 11, 0, 0, 'CHICKEN BURGER', 0.00, 100, '', 0.00, 90.00, 0.00, 'image182.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1582, 10, 11, 0, 0, 'CHICKEN CHEESE PATTY', 0.00, 100, '', 0.00, 95.00, 0.00, 'image183.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1583, 10, 11, 0, 0, 'CHICKEN MINI BURGER', 0.00, 100, '', 0.00, 85.00, 0.00, 'image184.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1584, 10, 11, 0, 0, 'CHICKEN PATTY 80g 36 Pcs', 0.00, 100, '', 0.00, 165.00, 0.00, 'image185.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1585, 10, 11, 0, 0, 'CHICKEN WHOPPER BURGER', 0.00, 100, '', 0.00, 90.00, 0.00, 'image186.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1586, 10, 11, 0, 0, 'PAKI CHICKEN KEBAAB', 0.00, 100, '', 0.00, 95.00, 0.00, 'image187.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1587, 10, 11, 0, 0, 'CHICKEN KEBAAB MIX', 0.00, 100, '', 0.00, 85.00, 0.00, 'image188.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1588, 10, 11, 0, 0, 'CHICKEN ORIENTAL KEBAAB', 0.00, 100, '', 0.00, 90.00, 0.00, 'image189.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1589, 10, 11, 0, 0, 'CHICKEN LOLLIES', 0.00, 100, '', 0.00, 95.00, 0.00, 'image190.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1590, 10, 11, 0, 0, 'FRESH CHICKEN FILLET', 0.00, 100, '', 0.00, 70.00, 0.00, 'image191.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1591, 10, 11, 0, 0, 'FRESH CHICKEN FILLET BULK', 0.00, 100, '', 0.00, 65.00, 0.00, 'image192.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1592, 10, 11, 0, 0, 'CUBE CHICKEN FILLET', 0.00, 100, '', 0.00, 79.99, 0.00, 'image193.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1593, 10, 11, 0, 0, 'BULK CHICKEN FILLET 10_1', 0.00, 100, '', 0.00, 400.00, 0.00, 'image194.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1594, 10, 11, 0, 0, 'CHICKEN FILLET PIE CUBE 2Kg', 0.00, 100, '', 0.00, 120.00, 0.00, 'image195.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1595, 10, 11, 0, 0, 'CHICKEN STIR FRY', 0.00, 100, '', 0.00, 85.00, 0.00, 'image196.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1596, 10, 11, 0, 0, 'CHICKEN GIBLETS', 0.00, 100, '', 0.00, 55.00, 0.00, 'image197.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1597, 10, 11, 0, 0, 'CHICKEN LIVER', 0.00, 100, '', 0.00, 55.00, 0.00, 'image198.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1598, 10, 11, 0, 0, 'CHICKEN NECKS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image199.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1599, 10, 11, 0, 0, 'CHICKEN MINCE', 0.00, 100, '', 0.00, 55.00, 0.00, 'image200.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1600, 10, 11, 0, 0, 'CHICKEN MINCE 2KG', 0.00, 100, '', 0.00, 100.00, 0.00, 'image201.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1601, 10, 11, 0, 0, 'CLEAN & WASH BABY CHICKEN', 0.00, 100, '', 0.00, 60.00, 0.00, 'image202.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1602, 10, 11, 0, 0, 'CUT CLEAN & WASH', 0.00, 100, '', 0.00, 65.00, 0.00, 'image203.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1603, 10, 11, 0, 0, 'WHOLE CHICKEN SKIN ON', 0.00, 100, '', 0.00, 45.00, 0.00, 'image204.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1604, 10, 11, 0, 0, 'IND WRAPPED CHICKEN FILLET 5Kg', 0.00, 100, '', 0.00, 345.00, 0.00, 'image205.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1605, 10, 11, 0, 0, 'FRESH CHICKEN DRUM STICKS', 0.00, 100, '', 0.00, 65.00, 0.00, 'image206.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1606, 10, 11, 0, 0, 'FRESH CHICKEN THIGHS', 0.00, 100, '', 0.00, 65.00, 0.00, 'image207.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1607, 10, 11, 0, 0, 'FRESH CHICKEN WINGS', 0.00, 100, '', 0.00, 70.00, 0.00, 'image208.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1608, 10, 11, 0, 0, 'FRESH CHICKEN DRUM STICK & THIGH', 0.00, 100, '', 0.00, 65.00, 0.00, 'image209.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1609, 10, 11, 0, 0, 'FRESH SKINLESS CHICKEN', 0.00, 100, '', 0.00, 49.99, 0.00, 'image210.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1610, 10, 11, 0, 0, 'FRESH SKINLESS CHICKEN WINGS', 0.00, 100, '', 0.00, 75.00, 0.00, 'image211.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1611, 10, 11, 0, 0, 'BUTTER ROTISSERIE CHICKEN', 0.00, 100, '', 0.00, 89.99, 0.00, 'image212.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1612, 10, 11, 0, 0, 'BUTTER ROTISSERIE CHICKEN FILLET', 0.00, 100, '', 0.00, 99.99, 0.00, 'image213.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1613, 10, 11, 0, 0, 'BUTTER ROTISSERIE FLATTIES', 0.00, 100, '', 0.00, 75.00, 0.00, 'image214.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1614, 10, 11, 0, 0, 'BUTTER ROTISSERIE HOT WINGS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image215.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1615, 10, 11, 0, 0, 'ROTISSERIE CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image216.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1616, 10, 11, 0, 0, 'ROTISSERIE CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image217.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1617, 10, 11, 0, 0, 'AFGHANI CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image218.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1618, 10, 11, 0, 0, 'BBQ CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image219.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1619, 10, 11, 0, 0, 'CHICKEN FILLET TIKKA', 0.00, 100, '', 0.00, 85.00, 0.00, 'image220.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1620, 10, 11, 0, 0, 'HONEY & MUSTARD CHICKEN FILLET', 0.00, 100, '', 0.00, 80.00, 0.00, 'image221.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1621, 10, 11, 0, 0, 'LAZIZ CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image222.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1622, 10, 11, 0, 0, 'LEMON & HERB CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image223.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1623, 10, 11, 0, 0, 'MARINATED PERRI PERI CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image224.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1624, 10, 11, 0, 0, 'MEXICAN CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image225.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1625, 10, 11, 0, 0, 'PEPPER CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image226.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1626, 10, 11, 0, 0, 'PORTOGUESE PERI PERI FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image227.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1627, 10, 11, 0, 0, 'PREGO CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image228.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1628, 10, 11, 0, 0, 'RED TAMARIND CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image229.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1629, 10, 11, 0, 0, 'TANDOORI CHICKEN FILLET', 0.00, 100, '', 0.00, 85.00, 0.00, 'image230.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1630, 10, 11, 0, 0, 'SMOKED CHICKEN FILLET', 0.00, 100, '', 0.00, 125.00, 0.00, 'image231.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1631, 10, 11, 0, 0, 'BUTTER CHICKEN', 0.00, 100, '', 0.00, 110.00, 0.00, 'image232.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1632, 10, 11, 0, 0, 'CHICKEN KARAHI BOTI', 0.00, 100, '', 0.00, 85.00, 0.00, 'image233.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1633, 10, 11, 0, 0, 'TANDOORI BOTI', 0.00, 100, '', 0.00, 89.99, 0.00, 'image234.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1634, 10, 11, 0, 0, 'CHICKEN SOSSATIES', 0.00, 100, '', 0.00, 89.99, 0.00, 'image235.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1635, 10, 11, 0, 0, 'CHICKEN SPREAD', 0.00, 100, '', 0.00, 120.00, 0.00, 'image236.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1636, 10, 11, 0, 0, 'CHICKEN ROULADE', 0.00, 100, '', 0.00, 70.00, 0.00, 'image237.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1637, 10, 11, 0, 0, 'CHICKEN TIKKA', 0.00, 100, '', 0.00, 79.99, 0.00, 'image238.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1638, 10, 11, 0, 0, 'MASALA CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image239.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1639, 10, 11, 0, 0, 'PEPPER CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image240.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1640, 10, 11, 0, 0, 'PERI PERI CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image241.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1641, 10, 11, 0, 0, 'TANDOORI CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image242.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1642, 10, 11, 0, 0, 'FLATTIE S', 0.00, 100, '', 0.00, 79.99, 0.00, 'image243.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1643, 10, 11, 0, 0, 'KARAHI CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image244.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1644, 10, 11, 0, 0, 'MARINATED SKIN ON CHICKEN', 0.00, 100, '', 0.00, 70.00, 0.00, 'image245.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1645, 10, 11, 0, 0, 'MARINATED BABY CHICKEN', 0.00, 100, '', 0.00, 79.99, 0.00, 'image246.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1646, 10, 11, 0, 0, 'HOT WINGS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image247.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1647, 10, 11, 0, 0, 'MARINATED WINGS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image248.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1648, 10, 11, 0, 0, 'PRE COOCKED BUFFALO WINGS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image249.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1649, 10, 11, 0, 0, 'HONEY & MUSTARD D/STICKS', 0.00, 100, '', 0.00, 75.00, 0.00, 'image250.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1650, 10, 11, 0, 0, 'STICKY WINGS', 0.00, 100, '', 0.00, 80.01, 0.00, 'image251.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1651, 10, 11, 0, 0, 'BUFFFALO WINGS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image252.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1652, 10, 11, 0, 0, 'MARINATED CHICKEN D/STICKS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image253.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1653, 10, 11, 0, 0, 'JALEPINO CHICKEN FILLET STRIPS', 0.00, 100, '', 0.00, 85.00, 0.00, 'image254.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1654, 10, 11, 0, 0, 'CHICKEN CHILLI LOAF', 0.00, 100, '', 0.00, 85.00, 0.00, 'image255.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1655, 10, 11, 0, 0, 'CHICKEN OLIVE LOAF', 0.00, 100, '', 0.00, 85.00, 0.00, 'image256.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1656, 10, 11, 0, 0, 'CHICKEN PAPRIKA LOAF', 0.00, 100, '', 0.00, 85.00, 0.00, 'image257.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1657, 10, 11, 0, 0, 'CHICKEN PRESSED LOAF', 0.00, 100, '', 0.00, 85.00, 0.00, 'image258.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1658, 10, 11, 0, 0, 'SMOKED CHICKEN POLONY', 0.00, 100, '', 0.00, 85.00, 0.00, 'image259.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1659, 10, 11, 0, 0, 'SMOKED PRESSED BEEF', 0.00, 100, '', 0.00, 99.00, 0.00, 'image260.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1660, 10, 11, 0, 0, 'SPICY CHICKEN LOAF', 0.00, 100, '', 0.00, 85.00, 0.00, 'image261.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1661, 10, 11, 0, 0, 'CHICKEN CHEESE RUSSIANS', 0.00, 100, '', 0.00, 80.00, 0.00, 'image262.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1662, 10, 11, 0, 0, 'CHICKEN COCKTAIL RUSSIANS', 0.00, 100, '', 0.00, 75.00, 0.00, 'image263.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1663, 10, 11, 0, 0, 'CHICKEN RUSSIANS', 0.00, 100, '', 0.00, 75.00, 0.00, 'image264.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1664, 10, 11, 0, 0, 'CATERING CHICKEN SAUSAGES 2Kg', 0.00, 100, '', 0.00, 115.00, 0.00, 'image265.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1665, 10, 11, 0, 0, 'CHICKEN COCKTAIL SAUSAGES', 0.00, 100, '', 0.00, 97.00, 0.00, 'image266.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1666, 10, 11, 0, 0, 'CHICKEN COCKTAIL SAUSAGES S & P', 0.00, 100, '', 0.00, 97.00, 0.00, 'image267.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1667, 10, 11, 0, 0, 'CHICKEN SAUSAGES', 0.00, 100, '', 0.00, 97.00, 0.00, 'image268.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1668, 10, 11, 0, 0, 'CHICKEN WORS', 0.00, 100, '', 0.00, 80.00, 0.00, 'image269.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1669, 10, 11, 0, 0, 'CHICKEN COCKTAIL VIENNA', 0.00, 100, '', 0.00, 80.00, 0.00, 'image270.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1670, 10, 11, 0, 0, 'TASTY CHICKEN VIENNA', 0.00, 100, '', 0.00, 80.00, 0.00, 'image271.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1671, 10, 11, 0, 0, 'CHICKEN MASALA BILTONG', 0.00, 100, '', 0.00, 250.00, 0.00, 'image272.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1672, 10, 11, 0, 0, 'CHICKEN S/P BILTONG', 0.00, 100, '', 0.00, 250.00, 0.00, 'image273.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:37:14'),
(1673, 10, 35, 0, 0, 'ANGUS BAVETTE STEAK', 0.00, 100, '', 0.00, 220.00, 0.00, 'image002.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1674, 10, 35, 0, 0, 'ANGUS FILLET STEAK', 0.00, 100, '', 0.00, 740.00, 0.00, 'image003.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1675, 10, 35, 0, 0, 'ANGUS GOURMET BEEF BURGER', 0.00, 100, '', 0.00, 140.00, 0.00, 'image004.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1676, 10, 35, 0, 0, 'ANGUS RIBEYE STEAK', 0.00, 100, '', 0.00, 699.00, 0.00, 'image005.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1677, 10, 35, 0, 0, 'ANGUS RUMP STEAK', 0.00, 100, '', 0.00, 430.00, 0.00, 'image006.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1678, 10, 35, 0, 0, 'ANGUS SIRLOIN STEAK', 0.00, 100, '', 0.00, 499.00, 0.00, 'image007.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1679, 10, 35, 0, 0, 'WAGYU BAVETTE STEAK', 0.00, 100, '', 0.00, 670.00, 0.00, 'image008.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1680, 10, 35, 0, 0, 'WAGYU DENVER STEAK', 0.00, 100, '', 0.00, 450.00, 0.00, 'image009.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1681, 10, 35, 0, 0, 'WAGYU FILLET STEAK', 0.00, 100, '', 0.00, 1450.00, 0.00, 'image010.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1682, 10, 35, 0, 0, 'WAGYU FLANK STEAK', 0.00, 100, '', 0.00, 650.00, 0.00, 'image011.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1683, 10, 35, 0, 0, 'WAGYU FLAT IRON STEAK', 0.00, 100, '', 0.00, 650.00, 0.00, 'image012.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1684, 10, 35, 0, 0, 'WAGYU RIBEYE', 0.00, 100, '', 0.00, 820.00, 0.00, 'image013.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1685, 10, 35, 0, 0, 'WAGYU RUMP STEAK', 0.00, 100, '', 0.00, 270.00, 0.00, 'image014.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1686, 10, 35, 0, 0, 'WAGYU SIRLOIN', 0.00, 100, '', 0.00, 990.00, 0.00, 'image015.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1687, 10, 35, 0, 0, 'BEEF BURGER', 0.00, 100, '', 0.00, 95.00, 0.00, 'image016.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1688, 10, 35, 0, 0, 'BEEF CHEESE PATTY', 0.00, 100, '', 0.00, 99.99, 0.00, 'image017.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1689, 10, 35, 0, 0, 'BEEF SPICY JUMBO WHOPPER', 0.00, 100, '', 0.00, 105.00, 0.00, 'image018.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1690, 10, 35, 0, 0, 'STETSON CHEESE', 0.00, 100, '', 0.00, 99.99, 0.00, 'image019.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1691, 10, 35, 0, 0, 'STETSON PEPPER', 0.00, 100, '', 0.00, 95.00, 0.00, 'image020.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1692, 10, 35, 0, 0, 'WHOPPER BURGER', 0.00, 100, '', 0.00, 90.00, 0.00, 'image021.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1693, 10, 35, 0, 0, 'DHANIYA BRAAI BURGER', 0.00, 100, '', 0.00, 99.99, 0.00, 'image022.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1694, 10, 35, 0, 0, 'PAKISTANI BEEF KEBAAB', 0.00, 100, '', 0.00, 105.00, 0.00, 'image023.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1695, 10, 35, 0, 0, 'BEEF KOFTA KEBABS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image024.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1696, 10, 35, 0, 0, 'BEEF LOLLIES', 0.00, 100, '', 0.00, 105.00, 0.00, 'image025.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1697, 10, 35, 0, 0, 'BEEF OLIVES', 0.00, 100, '', 0.00, 115.00, 0.00, 'image026.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1698, 10, 35, 0, 0, 'MILD LOLLIES', 0.00, 100, '', 0.00, 105.00, 0.00, 'image027.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1699, 10, 35, 0, 0, 'CATER KEBAAB MILD', 0.00, 100, '', 0.00, 85.00, 0.00, 'image028.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1700, 10, 35, 0, 0, 'BEEF ACHAAR LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image029.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1701, 10, 35, 0, 0, 'BEEF CHEESE LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image030.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1702, 10, 35, 0, 0, 'BEEF CHILLI LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image031.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1703, 10, 35, 0, 0, 'BEEF CHILLI SALT MEAT', 0.00, 100, '', 0.00, 205.00, 0.00, 'image032.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1704, 10, 35, 0, 0, 'BEEF MACON', 0.00, 100, '', 0.00, 165.00, 0.00, 'image033.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1705, 10, 35, 0, 0, 'BEEF MUSHROOM LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image034.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1706, 10, 35, 0, 0, 'BEEF PAPRIKA LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image035.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1707, 10, 35, 0, 0, 'BEEF PASTRAMI', 0.00, 100, '', 0.00, 205.00, 0.00, 'image036.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1708, 10, 35, 0, 0, 'BEEF PRESSED LOAF', 0.00, 100, '', 0.00, 105.00, 0.00, 'image037.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1709, 10, 35, 0, 0, 'BEEF SALAMI LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image038.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1710, 10, 35, 0, 0, 'BEEF SALT MEAT', 0.00, 100, '', 0.00, 205.00, 0.00, 'image039.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1711, 10, 35, 0, 0, 'BEEF SP. FRENCH LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image040.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1712, 10, 35, 0, 0, 'BREAKFAST BEEF', 0.00, 100, '', 0.00, 205.00, 0.00, 'image041.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1713, 10, 35, 0, 0, 'PEPPERONI LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image042.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1714, 10, 35, 0, 0, 'CHILLI CHEESE LOAF', 0.00, 100, '', 0.00, 105.00, 0.00, 'image043.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1715, 10, 35, 0, 0, 'CHORIZO BEEF POLONY', 0.00, 100, '', 0.00, 95.00, 0.00, 'image044.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1716, 10, 35, 0, 0, 'MEAT LOAF', 0.00, 100, '', 0.00, 105.00, 0.00, 'image045.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1717, 10, 35, 0, 0, 'SMOKED BEEF', 0.00, 100, '', 0.00, 225.00, 0.00, 'image046.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1718, 10, 35, 0, 0, 'SMOKED MACON', 0.00, 100, '', 0.00, 165.00, 0.00, 'image047.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1719, 10, 35, 0, 0, 'SPICY MEAT LOAF', 0.00, 100, '', 0.00, 105.00, 0.00, 'image048.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1720, 10, 35, 0, 0, 'UNCOOKED SALT MEAT', 0.00, 100, '', 0.00, 120.00, 0.00, 'image049.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1721, 10, 35, 0, 0, 'BEEF GAAR WORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image050.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1722, 10, 35, 0, 0, 'BOSVELD BOEREWORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image051.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1723, 10, 35, 0, 0, 'BRAAI WORS', 0.00, 100, '', 0.00, 69.00, 0.00, 'image052.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42');
INSERT INTO `foods` (`ID`, `IDCanteen`, `IDMenu`, `IDSubmenu`, `IDSubsubmenu`, `Name`, `Weight`, `Unit`, `Description`, `MRP`, `JalpanPrice`, `Discount`, `Photo`, `isOutOfStock`, `Recomended`, `Popular`, `Rating`, `Available`, `User`, `Date`, `Time`) VALUES
(1724, 10, 35, 0, 0, 'EXTRA HOT WORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image053.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1725, 10, 35, 0, 0, 'KAROO BOEREWORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image054.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1726, 10, 35, 0, 0, 'PRE-COOKED WORS', 0.00, 100, '', 0.00, 99.99, 0.00, 'image055.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1727, 10, 35, 0, 0, 'SALT/PEPPER WORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image056.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1728, 10, 35, 0, 0, 'SPICY WORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image057.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1729, 10, 35, 0, 0, 'TWISTED WORS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image058.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1730, 10, 35, 0, 0, 'BEEF BANGERS', 0.00, 100, '', 0.00, 90.00, 0.00, 'image059.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1731, 10, 35, 0, 0, 'BEEF CHILLI SAUCE', 0.00, 100, '', 0.00, 99.99, 0.00, 'image060.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1732, 10, 35, 0, 0, 'BEEF COCKTAIL SAUSAGES', 0.00, 100, '', 0.00, 99.99, 0.00, 'image061.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1733, 10, 35, 0, 0, 'BEEF S & P COCKTAIL SAUSAGES', 0.00, 100, '', 0.00, 99.99, 0.00, 'image062.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1734, 10, 35, 0, 0, 'BEEF S/P SAUSAGES', 0.00, 100, '', 0.00, 99.99, 0.00, 'image063.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1735, 10, 35, 0, 0, 'BEEF SAUSAGE', 0.00, 100, '', 0.00, 99.99, 0.00, 'image064.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1736, 10, 35, 0, 0, 'DHANIYA BEEF SAUSAGE', 0.00, 100, '', 0.00, 99.99, 0.00, 'image065.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1737, 10, 35, 0, 0, 'BEEF COCKTAIL VIENNAS', 0.00, 100, '', 0.00, 75.00, 0.00, 'image066.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1738, 10, 35, 0, 0, 'BEEF VIENNAS', 0.00, 100, '', 0.00, 75.00, 0.00, 'image067.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1739, 10, 35, 0, 0, 'CATERING VIENNAS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image068.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1740, 10, 35, 0, 0, 'CHEESY HOT DOGS', 0.00, 100, '', 0.00, 95.00, 0.00, 'image069.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1741, 10, 35, 0, 0, 'SPICY BEEF VIENNAS', 0.00, 100, '', 0.00, 83.00, 0.00, 'image070.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1742, 10, 35, 0, 0, 'BEEF COCKTAIL RUSSIANS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image071.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1743, 10, 35, 0, 0, 'BEEF KAAS GRILLE ', 0.00, 100, '', 0.00, 85.00, 0.00, 'image072.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1744, 10, 35, 0, 0, 'BEEF RUSSIANS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image073.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1745, 10, 35, 0, 0, 'SMOKED KAAS GRILL', 0.00, 100, '', 0.00, 89.99, 0.00, 'image074.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1746, 10, 35, 0, 0, 'SMOKED RUSSIANS', 0.00, 100, '', 0.00, 85.00, 0.00, 'image075.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1747, 10, 35, 0, 0, 'SPICY BEEF RUSSIANS', 0.00, 100, '', 0.00, 79.99, 0.00, 'image076.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1748, 10, 35, 0, 0, 'BARBEQUE SIRLOIN', 0.00, 100, '', 0.00, 145.00, 0.00, 'image077.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1749, 10, 35, 0, 0, 'BBQ CLUB STEAK', 0.00, 100, '', 0.00, 145.00, 0.00, 'image078.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1750, 10, 35, 0, 0, 'ESPETADA', 0.00, 100, '', 0.00, 135.00, 0.00, 'image079.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1751, 10, 35, 0, 0, 'FILLET IN A MINUTE', 0.00, 100, '', 0.00, 265.00, 0.00, 'image080.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1752, 10, 35, 0, 0, 'MARINATED BLADE STEAK', 0.00, 100, '', 0.00, 110.00, 0.00, 'image081.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1753, 10, 35, 0, 0, 'MARINATED BRISKET', 0.00, 100, '', 0.00, 110.00, 0.00, 'image082.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1754, 10, 35, 0, 0, 'MARINATED BURGER STEAK', 0.00, 100, '', 0.00, 125.00, 0.00, 'image083.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1755, 10, 35, 0, 0, 'MARINATED CHUCK', 0.00, 100, '', 0.00, 110.00, 0.00, 'image084.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1756, 10, 35, 0, 0, 'MARINATED MINUTE STEAK', 0.00, 100, '', 0.00, 125.01, 0.00, 'image085.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1757, 10, 35, 0, 0, 'MARINATED RUMP STEAK', 0.00, 100, '', 0.00, 140.00, 0.00, 'image086.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1758, 10, 35, 0, 0, 'MARINATED STEAK', 0.00, 100, '', 0.00, 125.01, 0.00, 'image087.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1759, 10, 35, 0, 0, 'MARINATED T.BONE', 0.00, 100, '', 0.00, 115.00, 0.00, 'image088.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1760, 10, 35, 0, 0, 'SALT & PEPPER MINUTE T.BONE', 0.00, 100, '', 0.00, 115.00, 0.00, 'image089.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1761, 10, 35, 0, 0, 'OSSAMA STEAK', 0.00, 100, '', 0.00, 125.01, 0.00, 'image090.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1762, 10, 35, 0, 0, 'PEPPER SIRLOIN', 0.00, 100, '', 0.00, 145.00, 0.00, 'image091.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1763, 10, 35, 0, 0, 'PICANHA STEAK', 0.00, 100, '', 0.00, 145.00, 0.00, 'image092.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1764, 10, 35, 0, 0, 'PORTOGUESE PERI-PERI STEAK', 0.00, 100, '', 0.00, 125.01, 0.00, 'image093.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1765, 10, 35, 0, 0, 'PREGO STEAK', 0.00, 100, '', 0.00, 125.01, 0.00, 'image094.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1766, 10, 35, 0, 0, 'BBQ DIKK RIBS', 0.00, 100, '', 0.00, 115.00, 0.00, 'image095.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1767, 10, 35, 0, 0, 'MARINATED MINUTE BEEF RIBS', 0.00, 100, '', 0.00, 105.00, 0.00, 'image096.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1768, 10, 35, 0, 0, 'MARINATED BEEF RIBS', 0.00, 100, '', 0.00, 105.00, 0.00, 'image097.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1769, 10, 35, 0, 0, 'MATURED PRIME RIBS', 0.00, 100, '', 0.00, 120.00, 0.00, 'image098.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1770, 10, 35, 0, 0, 'ROAST BEEF', 0.00, 100, '', 0.00, 171.48, 0.00, 'image099.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1771, 10, 35, 0, 0, 'SHORT RIBS', 0.00, 100, '', 0.00, 90.00, 0.00, 'image100.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1772, 10, 35, 0, 0, 'PRE COOKED RIB RACK', 0.00, 100, '', 0.00, 155.00, 0.00, 'image101.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1773, 10, 35, 0, 0, 'SMOKEY JOE RIBS', 0.00, 100, '', 0.00, 155.00, 0.00, 'image102.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1774, 10, 35, 0, 0, 'SPICY MINUTE T.BONE', 0.00, 100, '', 0.00, 115.00, 0.00, 'image103.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1775, 10, 35, 0, 0, 'VIENNA STIR FRY', 0.00, 100, '', 0.00, 80.00, 0.00, 'image104.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1776, 10, 35, 0, 0, 'BEEF STIR FRY', 0.00, 100, '', 0.00, 130.00, 0.00, 'image105.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1777, 10, 35, 0, 0, 'BEEF SOSATIE', 0.00, 100, '', 0.00, 128.00, 0.00, 'image106.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1778, 10, 35, 0, 0, 'TOPSIDE STEAK', 0.00, 100, '', 0.00, 115.00, 0.00, 'image107.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1779, 10, 35, 0, 0, 'TENDERISED STEAK', 0.00, 100, '', 0.00, 115.00, 0.00, 'image108.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1780, 10, 35, 0, 0, 'RUMP STEAK', 0.00, 100, '', 0.00, 130.00, 0.00, 'image109.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1781, 10, 35, 0, 0, 'FILLET STEAK', 0.00, 100, '', 0.00, 250.00, 0.00, 'image110.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1782, 10, 35, 0, 0, 'STEWING BEEF', 0.00, 100, '', 0.00, 85.00, 0.00, 'image111.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1783, 10, 35, 0, 0, 'BONELESS BEEF', 0.00, 100, '', 0.00, 90.00, 0.00, 'image112.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1784, 10, 35, 0, 0, 'CHUCK', 0.00, 100, '', 0.00, 95.00, 0.00, 'image113.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1785, 10, 35, 0, 0, 'BRISKET', 0.00, 100, '', 0.00, 95.00, 0.00, 'image114.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1786, 10, 35, 0, 0, 'BEEF SHIN', 0.00, 100, '', 0.00, 95.00, 0.00, 'image115.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1787, 10, 35, 0, 0, 'STEAK MINCE', 0.00, 100, '', 0.00, 99.00, 0.00, 'image116.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1788, 10, 35, 0, 0, 'BEEF MINCE', 0.00, 100, '', 0.00, 75.00, 0.00, 'image117.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1789, 10, 35, 0, 0, 'T.BONE STEAK', 0.00, 100, '', 0.00, 99.00, 0.00, 'image118.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1790, 10, 35, 0, 0, 'MINUTE STEAK', 0.00, 100, '', 0.00, 110.00, 0.00, 'image119.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1791, 10, 35, 0, 0, 'CUBE RUMP', 0.00, 100, '', 0.00, 135.00, 0.00, 'image120.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1792, 10, 35, 0, 0, 'DRY AGED TOMAHAWK', 0.00, 100, '', 0.00, 300.00, 0.00, 'image121.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1793, 10, 35, 0, 0, 'CUBE STEAK', 0.00, 100, '', 0.00, 125.00, 0.00, 'image122.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1794, 10, 35, 0, 0, 'BREAKFAST T.BONE', 0.00, 100, '', 0.00, 105.00, 0.00, 'image123.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1795, 10, 35, 0, 0, 'BLADE STEAK', 0.00, 100, '', 0.00, 95.00, 0.00, 'image124.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1796, 10, 35, 0, 0, 'DRY AGED FILLETED T.BONE', 0.00, 100, '', 0.00, 299.00, 0.00, 'image125.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1797, 10, 35, 0, 0, 'MATURE RUMP STEAK', 0.00, 100, '', 0.00, 130.00, 0.00, 'image126.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1798, 10, 35, 0, 0, 'BEEF RIB EYE', 0.00, 100, '', 0.00, 230.00, 0.00, 'image127.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1799, 10, 35, 0, 0, 'FILLET STEAK STRIPS', 0.00, 100, '', 0.00, 290.00, 0.00, 'image128.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1800, 10, 35, 0, 0, 'SILVERSIDE STEAK', 0.00, 100, '', 0.00, 115.00, 0.00, 'image129.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1801, 10, 35, 0, 0, 'SIRLOIN STEAK', 0.00, 100, '', 0.00, 130.00, 0.00, 'image130.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1802, 10, 35, 0, 0, 'TOMAHAWK STEAK', 0.00, 100, '', 0.00, 149.00, 0.00, 'image131.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1803, 10, 35, 0, 0, 'FILLET MIGNON', 0.00, 100, '', 0.00, 250.00, 0.00, 'image132.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1804, 10, 35, 0, 0, 'FILLET T.BONE', 0.00, 100, '', 0.00, 135.00, 0.00, 'image133.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1805, 10, 35, 0, 0, 'EYE PC STEAK', 0.00, 100, '', 0.00, 110.00, 0.00, 'image134.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1806, 10, 35, 0, 0, 'CATERING WORS', 0.00, 100, '', 0.00, 69.00, 0.00, 'image135.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1807, 10, 35, 0, 0, 'CATERING WORS 21 PCS', 0.00, 100, '', 0.00, 170.00, 0.00, 'image136.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1808, 10, 35, 0, 0, 'CAFƒ FRENCH', 0.00, 100, '', 0.00, 60.00, 0.00, 'image137.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1809, 10, 35, 0, 0, 'BEEF PATTE 100g 30 PCS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image138.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1810, 10, 35, 0, 0, 'WHOPPER 120g 24 Pcs', 0.00, 100, '', 0.00, 200.00, 0.00, 'image139.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1811, 10, 35, 0, 0, 'WHOPPER 150g 20 Pcs', 0.00, 100, '', 0.00, 210.00, 0.00, 'image140.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1812, 10, 35, 0, 0, 'STEAK 2Kg', 0.00, 100, '', 0.00, 180.00, 0.00, 'image141.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1813, 10, 35, 0, 0, 'PIE CUBE STEAKS 2Kg', 0.00, 100, '', 0.00, 195.00, 0.00, 'image142.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1814, 10, 35, 0, 0, 'CATERING BEEF SAUSAGES 2Kg', 0.00, 100, '', 0.00, 125.00, 0.00, 'image143.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1815, 10, 35, 0, 0, 'CATERING RUSSIANS', 0.00, 100, '', 0.00, 180.00, 0.00, 'image144.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1816, 10, 35, 0, 0, 'BEEF MINCE 2Kg FROZEN', 0.00, 100, '', 0.00, 140.00, 0.00, 'image145.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1817, 10, 35, 0, 0, 'BEEF KIDNEYS', 0.00, 100, '', 0.00, 45.00, 0.00, 'image146.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1818, 10, 35, 0, 0, 'MARROW BONES', 0.00, 100, '', 0.00, 15.00, 0.00, 'image147.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1819, 10, 35, 0, 0, 'COW HEEL', 0.00, 100, '', 0.00, 25.00, 0.00, 'image148.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1820, 10, 35, 0, 0, 'OX LIVER BEEF', 0.00, 100, '', 0.00, 40.00, 0.00, 'image149.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1821, 10, 35, 0, 0, 'OX TAIL', 0.00, 100, '', 0.00, 150.00, 0.00, 'image150.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1822, 10, 35, 0, 0, 'OX TRIPE ', 0.00, 100, '', 0.00, 115.00, 0.00, 'image151.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1823, 10, 35, 0, 0, 'PICKLED TONGUE', 0.00, 100, '', 0.00, 79.00, 0.00, 'image152.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1824, 10, 35, 0, 0, 'MEATY BONES', 0.00, 100, '', 0.00, 40.00, 0.00, 'image153.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1825, 10, 35, 0, 0, 'DRY WORS', 0.00, 100, '', 0.00, 399.00, 0.00, 'image154.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1826, 10, 35, 0, 0, 'MACON BITES', 0.00, 100, '', 0.00, 399.00, 0.00, 'image155.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1827, 10, 35, 0, 0, 'SAUCY BBQ  BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image156.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1828, 10, 35, 0, 0, 'SAUCY & HOT BBQ BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image157.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1829, 10, 35, 0, 0, 'SAFARI BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image158.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1830, 10, 35, 0, 0, 'SAFARI CHILLI BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image159.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1831, 10, 35, 0, 0, 'SALT & PEPPER BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image160.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1832, 10, 35, 0, 0, 'SALT & VINEGAR BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image161.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1833, 10, 35, 0, 0, 'MASALA BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image162.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1834, 10, 35, 0, 0, 'HOT PERIPERI BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image163.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1835, 10, 35, 0, 0, 'MILD PERIPERI BILTONG', 0.00, 100, '', 0.00, 399.00, 0.00, 'image164.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1836, 10, 35, 0, 0, 'WAGYU SAFARI BILTONG', 0.00, 100, '', 0.00, 499.00, 0.00, 'image165.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42'),
(1837, 10, 35, 0, 0, 'BEEF OLIVE LOAF', 0.00, 100, '', 0.00, 95.00, 0.00, 'image166.png', 0, 0, 0, 0.00, 1, '', '2021-06-06', '13:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `food_review`
--

CREATE TABLE IF NOT EXISTS `food_review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `Review` varchar(200) NOT NULL,
  `Rating` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hellocab_elite_plans`
--

CREATE TABLE IF NOT EXISTS `hellocab_elite_plans` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Plan_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Amount` int(4) NOT NULL,
  `Validity_in_Days` int(3) NOT NULL,
  `Description` longtext COLLATE latin1_general_ci,
  `Sort_Order` int(2) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Meta_Tag_Keywords` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Meta_Tag_Description` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Facebook_OG_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Twitter_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Google_Analytics` longtext COLLATE latin1_general_ci,
  `Custom_Code` longtext COLLATE latin1_general_ci,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `publish` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Parent` int(11) DEFAULT NULL,
  `Link_Name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Page_Content` longtext COLLATE latin1_general_ci,
  `Sort_Order` int(2) NOT NULL,
  `Title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Meta_Tag_Keywords` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Meta_Tag_Description` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Facebook_OG_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Twitter_Tag` varchar(2000) COLLATE latin1_general_ci DEFAULT NULL,
  `Google_Analytics` longtext COLLATE latin1_general_ci,
  `Custom_Code` longtext COLLATE latin1_general_ci,
  `UD1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD4` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UD5` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `publish` varchar(1) COLLATE latin1_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(30) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE IF NOT EXISTS `menu_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Specification` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL,
  `Colors` varchar(200) NOT NULL DEFAULT '000000',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `User` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`ID`, `Category`, `Name`, `Photo`, `Specification`, `Description`, `Colors`, `isActive`, `User`, `Date`, `Time`) VALUES
(1, 2, 'Savouries', 'http://139.59.38.160/sendit/Dashboard/Menu/p-heart-shape-kit-kat-cake-1-kg--110237-m.jpg', 'Savouries', '', '#f44336', 1, 'admin123', '2021-05-26', '22:40:36'),
(2, 2, 'Treats', 'http://139.59.38.160/Meat/Dashboard/Menu/raw-fresh-lamb-meat-ribs-seasonings-wooden-cutting-board_75517-372-2.jpg', 'Treats', '', '#4caf50', 1, 'admin123', '2021-05-26', '22:50:36'),
(3, 2, 'Polony', 'http://139.59.38.160/sendit/Dashboard/Menu/fresh-apple-250x250.jpg', 'Polony', '', '#ff5722', 1, 'admin123', '2021-05-26', '22:07:59'),
(8, 2, 'Marinated Meat', 'http://139.59.38.160/sendit/Dashboard/Menu/unnamed.jpg', 'Saving you more', 'All Promo Products', '#ffeb3b', 1, 'admin123', '2020-10-20', '17:32:50'),
(9, 2, 'Lamb', 'http://139.59.38.160/sendit/Dashboard/Menu/orange_PNG805.png', 'Lamb', '', '#FFFFFF', 1, 'admin123', '2021-06-06', '09:47:38'),
(10, 2, 'BEEF', 'http://139.59.38.160/sendit/Dashboard/Menu/unnamed-5.png', 'FRESH BEEF', '', '#FFFFFF', 1, '15:13:12', '2021-07-09', '00:00:00'),
(11, 2, 'Chicken', 'http://139.59.38.160/sendit/Dashboard/Menu/chicken.jpg', 'Fresh', '', '#FFFFFF', 1, 'ADMIN123', '2020-10-17', '09:25:34'),
(12, 1, 'Misc', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(13, 1, 'Bread and Rolls', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(14, 1, 'NM Bake-at-Home Breads', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(15, 1, 'Pastries, Danish and Cupcakes', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(16, 1, 'Swissrolls', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(17, 1, 'Individual Treats', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(18, 1, 'Mini Cake and Desserts', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(19, 1, 'Large Cakes and Loafs', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(20, 1, 'Genral Products', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(21, 1, 'Savory Products Frozen', '', 'Test', 'Random stuff goes here', '#FFFFFF', 1, 'admin123', '2020-10-27', '14:13:37'),
(22, 3, 'Nuts', '', '', '', '000000', 1, '', '0000-00-00', '00:00:00'),
(23, 3, 'Dry Fruit', '', '', '', '000000', 1, '', '0000-00-00', '00:00:00'),
(24, 3, 'Seeds', '', '', '', '000000', 1, '', '0000-00-00', '00:00:00'),
(26, 3, 'Snack Packs', '', '', '', '000000', 1, '', '0000-00-00', '00:00:00'),
(27, 3, 'Chocolate', '', '', '', '000000', 1, '', '0000-00-00', '00:00:00'),
(28, 3, 'Safron', '', '', '', '000000', 1, '', '0000-00-00', '00:00:00'),
(29, 2, 'Mutton', '', 'Fresh', '', '#FFFFFF', 0, '21:21:39', '2020-10-12', '00:00:00'),
(30, 2, 'Game', '', 'Some test category for meat', 'Contact us for all your Quality Lamb, Goat and Cattle. \r\nNo Compromise on Quality. Full Services Available including Meat Express Signature Service...Delivery to your Door', '#4caf50', 1, 'ADMIN123', '2020-10-26', '06:09:52'),
(31, 2, 'Angus', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Angus Beef', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:48:15'),
(32, 2, 'Wagyu', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Wagyu', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:48:51'),
(33, 2, 'BURGERS/ PATTIES', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'BURGERS/ PATTIES', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:49:30'),
(34, 2, 'Kebabs', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Kebabs', '', '#FFFFFF', 1, 'admin123', '2021-05-26', '22:06:53'),
(36, 2, 'Beef Loafs', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Beef Loafs', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:51:20'),
(37, 2, 'Wors', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Wors', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:51:56'),
(38, 2, 'Sausage', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Sausage', '', '#FFFFFF', 1, 'admin123', '2021-05-26', '22:05:21'),
(39, 2, 'Beef Vienna', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Beef Vienna', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:53:34'),
(40, 2, 'Russian', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Russian', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:53:45'),
(41, 2, 'Ribs', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Ribs', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:54:27'),
(42, 2, 'Stir Fry', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Stir Fry', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:54:57'),
(43, 2, 'Steak', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Steak', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:55:16'),
(44, 2, 'Beef Meats', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Beef Meats', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:55:53'),
(45, 2, 'Mince', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Mince', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:56:14'),
(46, 2, 'Catering Wors', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Catering Wors', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:57:01'),
(47, 2, 'Catering Meats', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Catering Meats', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:57:30'),
(48, 2, 'PICKLET TONGUE', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'PICKLET TONGUE', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:57:57'),
(49, 2, 'MEATY BONES', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'MEATY BONES', '', '#FFFFFF', 1, 'admin123', '2021-05-14', '18:58:18'),
(51, 2, 'Marinated/ Braai Products', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Marinated &amp; Braai products', '', '#FFFFFF', 1, 'admin123', '2021-07-09', '18:45:14'),
(52, 4, 'Heat &amp; Eat Savoury', 'http://139.59.38.160/sendit/Dashboard/Menu/', 'Ready Made Savouries', '', '#FFFFFF', 1, 'admin123', '2021-07-09', '18:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Email_Description` text COLLATE latin1_general_ci NOT NULL,
  `Send_SMS` int(1) NOT NULL,
  `SMS_Text` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Send_To` int(11) NOT NULL,
  `Place_Filter` int(11) DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderimages`
--

CREATE TABLE IF NOT EXISTS `orderimages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OTP` int(11) NOT NULL,
  `IDUser` int(11) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `Image1` varchar(200) NOT NULL,
  `DeliveryDate` date NOT NULL,
  `Image2` varchar(200) NOT NULL,
  `Image3` varchar(200) NOT NULL,
  `Image4` varchar(200) NOT NULL,
  `From_address` varchar(200) NOT NULL,
  `From_latitude` float(10,6) NOT NULL,
  `From_longitude` float(10,6) NOT NULL,
  `isDelivered` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orderimages`
--

INSERT INTO `orderimages` (`ID`, `OTP`, `IDUser`, `Message`, `Image1`, `DeliveryDate`, `Image2`, `Image3`, `Image4`, `From_address`, `From_latitude`, `From_longitude`, `isDelivered`, `Date`, `Time`) VALUES
(1, 170208, 24, '', 'http://139.59.38.160/sendit/Dashboard/orders/1611253800.jpg', '2021-01-20', '', '', '', 'Basisthachal Path', 26.096741, 91.794380, 1, '2021-01-22', '11:15:00'),
(2, 194036, 24, '', 'http://139.59.38.160/sendit/Dashboard/orders/1611426600.jpg', '2021-01-22', '', '', '', 'Basisthachal Path', 26.096725, 91.794388, 1, '2021-01-24', '19:41:42'),
(3, 855757, 24, 'tesy', 'http://139.59.38.160/sendit/Dashboard/orders/IMG_20210502_23053511.jpg', '2021-05-12', '', '', '', 'Personal line ( jawan accommodation 151 base hospital, Basistha, Guwahati, Meghalaya 781029, India', 26.098818, 91.793297, 0, '2021-05-02', '19:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `owner_details`
--

CREATE TABLE IF NOT EXISTS `owner_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_OTP` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Phone_No` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Country` int(11) DEFAULT NULL,
  `State` int(11) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pin` varchar(255) DEFAULT NULL,
  `Pancard_No` varchar(255) DEFAULT NULL,
  `Pancard_Photo` varchar(255) DEFAULT NULL,
  `Addressproof_Document` int(11) NOT NULL,
  `Addressproof_No` varchar(50) DEFAULT NULL,
  `Addressproof_Photo` varchar(255) DEFAULT NULL,
  `Aadhar_Card_No` varchar(255) DEFAULT NULL,
  `Aadhar_Card_Photo` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_No` varchar(255) DEFAULT NULL,
  `Cancel_Cheque_Photo` varchar(255) DEFAULT NULL,
  `Bank_Name` int(11) NOT NULL,
  `Branch_Name` varchar(255) NOT NULL,
  `Bank_Account_Number` varchar(255) NOT NULL,
  `IFSC_Code` varchar(50) NOT NULL,
  `Verified_By` varchar(200) NOT NULL,
  `Verified_Date` date NOT NULL,
  `Verified_Remarks` varchar(255) DEFAULT NULL,
  `App_Install_Date` date DEFAULT NULL,
  `App_Install_Time` time DEFAULT NULL,
  `Firebase_Token` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PackagingType`
--

CREATE TABLE IF NOT EXISTS `PackagingType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `platters`
--

CREATE TABLE IF NOT EXISTS `platters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE IF NOT EXISTS `promo_codes` (
  `Promo_Code` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `Promo_Type` int(11) NOT NULL,
  `Discount_Type` int(11) NOT NULL,
  `Discount_Value` int(3) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Drop_Location` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `App_Invitation` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `Applicable_Place` int(11) DEFAULT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`Promo_Code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes_type`
--

CREATE TABLE IF NOT EXISTS `promo_codes_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `promo_discount_type`
--

CREATE TABLE IF NOT EXISTS `promo_discount_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `push_message`
--

CREATE TABLE IF NOT EXISTS `push_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffID` int(11) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `push_message`
--

INSERT INTO `push_message` (`ID`, `StaffID`, `Message`, `Photo`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 0, 'With Image', '05o7gccdot511.png', '2020-10-19', '15:28:32', 'ADMIN123', '47.29.188.113'),
(2, 0, 'This is a test message 20102020 2030', '', '2020-10-20', '20:29:52', 'Admin123', '41.13.22.218'),
(3, 0, 'Test image 20102020 2030', 'woohoo.jpg', '2020-10-20', '20:30:40', 'Admin123', '41.13.22.218');

-- --------------------------------------------------------

--
-- Table structure for table `rating_remarks`
--

CREATE TABLE IF NOT EXISTS `rating_remarks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rating_limit` int(11) NOT NULL COMMENT '1 for low rating,2 for high rating',
  `Rating_comments` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reason_cancel`
--

CREATE TABLE IF NOT EXISTS `reason_cancel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(200) NOT NULL,
  `second` varchar(200) NOT NULL,
  `third` varchar(200) NOT NULL,
  `fourth` varchar(200) NOT NULL,
  `fifth` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recharge_point`
--

CREATE TABLE IF NOT EXISTS `recharge_point` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Phone_No` varchar(20) NOT NULL,
  `Latitude` float(10,6) NOT NULL,
  `Longitude` float(10,6) NOT NULL,
  `Verified_by` varchar(200) NOT NULL,
  `Verified_remarks` varchar(200) NOT NULL,
  `Verified_date` date NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting_defaults`
--

CREATE TABLE IF NOT EXISTS `setting_defaults` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Discounts` float(10,2) NOT NULL,
  `MinimumOrderPrice` int(11) NOT NULL COMMENT 'Service shutdown',
  `MinimumOrderWeight` int(11) NOT NULL COMMENT 'on ride track driver and user',
  `MinimumDistance` int(11) NOT NULL,
  `MaximumDistance` int(11) NOT NULL COMMENT 'on ride track the user',
  `StartTime` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `EndTime` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `FreeDistance` int(11) NOT NULL,
  `PricePerKM` int(11) NOT NULL,
  `CancellationCharge` float(10,2) NOT NULL,
  `FacebookPage` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `InstagramPage` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `YoutubePlaylis` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `WhatsApp` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(200) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `setting_defaults`
--

INSERT INTO `setting_defaults` (`ID`, `Discounts`, `MinimumOrderPrice`, `MinimumOrderWeight`, `MinimumDistance`, `MaximumDistance`, `StartTime`, `EndTime`, `FreeDistance`, `PricePerKM`, `CancellationCharge`, `FacebookPage`, `InstagramPage`, `YoutubePlaylis`, `WhatsApp`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 12.00, 200, 2, 3, 20, '09:44 AM', '08:44 PM', 0, 0, 50.00, '', '', '', '0', '2020-06-02', '11:44:54', 'ADMIN123', '157.42.231.61'),
(2, 12.00, 200, 2, 3, 20, '09:44 AM', '08:44 PM', 3, 5, 50.00, '', '', '', '0', '2020-06-02', '11:48:39', 'ADMIN123', '157.42.231.61'),
(3, 12.00, 200, 2, 3, 0, '09:44 AM', '08:44 PM', 3, 5, 50.00, '', '', '', '0', '2020-06-05', '20:05:43', '', '47.29.245.170'),
(4, 12.00, 200, 2, 3, 0, '09:44 AM', '08:44 PM', 3, 5, 50.00, '', '', '', '2147483647', '2020-06-18', '10:44:19', 'ADMIN123', '157.42.241.188'),
(5, 12.00, 200, 2, 3, 0, '09:44 AM', '08:44 PM', 3, 5, 50.00, '', '', '', '917002608241', '2020-06-18', '10:44:57', 'ADMIN123', '157.42.241.188'),
(6, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, '', '', '', '27798715465', '2020-06-19', '22:35:51', 'Admin123', '102.182.107.248'),
(7, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/MeatExpress/', '', '', '27798715465', '2020-06-29', '22:10:26', 'ADMIN123', '223.176.12.57'),
(8, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/MeatExpress/', 'https://www.instagram.com/meatexpress/', '', '27798715465', '2020-06-29', '22:12:50', 'ADMIN123', '223.176.12.57'),
(9, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/visitsouthafrica/', 'https://www.instagram.com/southafrica/?hl=en', '', '270827865662', '2020-10-13', '21:02:59', 'ADMIN123', '47.29.161.61'),
(10, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/visitsouthafrica/', 'https://www.instagram.com/sendit_delivery/', '', '270827865662', '2020-10-26', '23:48:47', 'admin123', '102.182.167.98'),
(11, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '270827865662', '2020-10-26', '23:49:51', 'admin123', '102.182.167.98'),
(12, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '27762718212', '2021-01-09', '21:01:44', 'admin123', '102.182.167.98'),
(13, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '27762178212', '2021-01-09', '21:02:41', 'admin123', '102.182.167.98'),
(14, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '27762178212', '2021-01-09', '21:17:46', 'admin123', '41.13.10.13'),
(15, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '277621782120', '2021-01-10', '13:25:52', 'ADMIN123', '47.29.190.145'),
(16, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '917002608241', '2021-01-10', '13:27:32', 'ADMIN123', '47.29.190.145'),
(17, 12.00, 200, 2, 3, 0, '', '', 3, 5, 50.00, 'https://www.facebook.com/Senditdeliverysa', 'https://www.instagram.com/sendit_delivery/', '', '27827865662', '2021-01-21', '19:44:19', 'admin123', '102.182.167.98');

-- --------------------------------------------------------

--
-- Table structure for table `setting_operational_places`
--

CREATE TABLE IF NOT EXISTS `setting_operational_places` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Place` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Lattitude` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Longitude` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Remark` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes_driver`
--

CREATE TABLE IF NOT EXISTS `sms_codes_driver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Driver_Name` varchar(200) NOT NULL,
  `Phone_No` varchar(100) NOT NULL,
  `Driver_OTP` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes_owner`
--

CREATE TABLE IF NOT EXISTS `sms_codes_owner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner_Name` varchar(200) NOT NULL,
  `Phone_No` varchar(100) NOT NULL,
  `Owner_OTP` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_codes_user`
--

CREATE TABLE IF NOT EXISTS `sms_codes_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Phone_no` varchar(100) NOT NULL,
  `User_OTP` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `User_Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `splashtext`
--

CREATE TABLE IF NOT EXISTS `splashtext` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MainText` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `splashtext`
--

INSERT INTO `splashtext` (`ID`, `MainText`) VALUES
(1, 'Eat Healthy Look Healthy Feel Healthy'),
(2, 'Giving your Hunger a new Option.'),
(3, 'A Moments of Delivered on Time.'),
(4, 'Place an order on our app, enjoy the food on your lap.');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store_order`
--

CREATE TABLE IF NOT EXISTS `store_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `CanteenID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `NoofItems` int(11) NOT NULL,
  `DriverID` int(11) NOT NULL,
  `isOntheWay` int(11) NOT NULL,
  `onthewayDate` date NOT NULL,
  `onthewayTime` time NOT NULL,
  `receipt` varchar(200) NOT NULL,
  `message` varchar(200) NOT NULL,
  `reachDate` date NOT NULL,
  `reachTime` time NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `store_order`
--

INSERT INTO `store_order` (`ID`, `UserID`, `OrderID`, `CanteenID`, `FoodID`, `NoofItems`, `DriverID`, `isOntheWay`, `onthewayDate`, `onthewayTime`, `receipt`, `message`, `reachDate`, `reachTime`, `Date`, `Time`) VALUES
(1, 24, 104567, 1, 64, 1, 25, 4, '2021-02-08', '07:57:17', 'IMG_20210208_11281411.jpg', 'tedt', '2021-02-08', '07:58:13', '2021-02-08', '06:26:00'),
(2, 24, 104567, 1, 63, 1, 25, 4, '2021-02-08', '07:57:17', 'IMG_20210208_11281411.jpg', 'tedt', '2021-02-08', '07:58:13', '2021-02-08', '06:26:00'),
(3, 24, 122941, 1, 64, 1, 25, 4, '2021-02-08', '08:31:21', 'IMG_20210208_12023611.jpg', 'test2', '2021-02-08', '08:32:35', '2021-02-08', '08:25:00'),
(4, 24, 122941, 1, 63, 1, 25, 4, '2021-02-08', '08:31:21', 'IMG_20210208_12023611.jpg', 'test2', '2021-02-08', '08:32:35', '2021-02-08', '08:25:00'),
(5, 22, 998868, 2, 256, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-04-14', '21:28:00'),
(6, 22, 998868, 2, 257, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-04-14', '21:28:00'),
(9, 24, 542740, 1, 63, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-04-26', '16:15:00'),
(10, 24, 542740, 1, 1152, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-04-26', '16:15:00'),
(17, 24, 589796, 10, 1322, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-10', '21:05:00'),
(18, 24, 589796, 10, 1323, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-10', '21:05:00'),
(19, 24, 589796, 4, 481, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-10', '21:05:00'),
(22, 24, 997612, 3, 388, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-10', '21:13:00'),
(23, 24, 997612, 3, 389, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-10', '21:13:00'),
(24, 24, 997612, 3, 390, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-10', '21:13:00'),
(25, 24, 175843, 4, 482, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-11', '14:10:00'),
(26, 24, 175843, 4, 483, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-11', '14:10:00'),
(27, 24, 175843, 4, 484, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-11', '14:10:00'),
(30, 24, 327168, 4, 690, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-11', '14:20:00'),
(31, 24, 327168, 4, 691, 1, 0, 0, '0000-00-00', '00:00:00', '', '', '0000-00-00', '00:00:00', '2021-06-11', '14:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE IF NOT EXISTS `submenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDSecondCategory` int(11) NOT NULL,
  `Category` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Specification` varchar(200) NOT NULL,
  `Description` mediumtext NOT NULL,
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subsubmenu`
--

CREATE TABLE IF NOT EXISTS `subsubmenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDPrimaryCategory` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_definations`
--

CREATE TABLE IF NOT EXISTS `tax_definations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tax_Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Tax_Percentage` float NOT NULL,
  `Applicable` int(1) NOT NULL,
  `Sort_Order` int(3) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `user` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tez_Canteen`
--

CREATE TABLE IF NOT EXISTS `tez_Canteen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Category` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Phone_No` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Aboutus` mediumtext NOT NULL,
  `Address` varchar(200) NOT NULL,
  `State` varchar(200) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Pin_No` mediumint(11) NOT NULL,
  `Latitude` float(10,6) NOT NULL,
  `Longitude` float(10,6) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Open_time` time NOT NULL DEFAULT '08:00:00',
  `Close_time` time NOT NULL DEFAULT '06:00:00',
  `Minimum_orders` int(11) NOT NULL DEFAULT '200',
  `Minimum_time` int(11) NOT NULL DEFAULT '45',
  `Discount` float(10,2) NOT NULL,
  `Rating` float(10,2) NOT NULL DEFAULT '5.00',
  `TotalRating` int(11) NOT NULL,
  `Popular` int(11) NOT NULL,
  `NewSeller` int(11) NOT NULL DEFAULT '1',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tez_Canteen`
--

INSERT INTO `tez_Canteen` (`ID`, `Category`, `Name`, `Phone_No`, `Email`, `Aboutus`, `Address`, `State`, `City`, `Pin_No`, `Latitude`, `Longitude`, `Photo`, `Open_time`, `Close_time`, `Minimum_orders`, `Minimum_time`, `Discount`, `Rating`, `TotalRating`, `Popular`, `NewSeller`, `isActive`, `Date`, `Time`) VALUES
(1, 1, 'Salehs Bakery', '27823787178', '', 'Closed on Mondays', '89 Central Road | Fordsburg  JohannesburgSouth Africa', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/Salehs.jfif', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 0, 1, 1, '2021-06-30', '12:35:00'),
(2, 2, 'United Butchery', '0852727826', '', '', '2129 Mark Street', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/united.webp', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 1, 1, 1, '2021-06-30', '12:46:00'),
(3, 4, 'Ciscos', '0852727828', '', '', '2129 Mark Street', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/logociscos.png', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 1, 1, 1, '2021-06-30', '12:43:00'),
(4, 2, 'Khan''s Meat', '0852727829', '', '', '2129 Mark Street', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/khans2.png', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 1, 1, 1, '2021-06-30', '12:41:00'),
(5, 2, 'Wadee''s Braai', '0852727827', '', '', '2129 Mark Street', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/wadees.jpg', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 0, 1, 1, '2021-06-30', '12:47:00'),
(6, 0, 'SENDIT', '0852727827', 'test@gmail.com', 'Good', '2129 Mark Street', 'Limpopo', '', 708, 26.090950, 91.546768, 'http://139.59.38.160/sendit/Dashboard/images/187401415a5004f96313448e14dd432e.png', '00:00:00', '00:00:00', 200, 30, 0.00, 5.00, 0, 0, 1, 1, '2020-10-11', '23:07:00'),
(7, 6, 'SENDIT6', '123', 'abc@xyz.com', 'sdfhsjkflmsd,fsd', '132 asd', 'a', '', 1, 1.000000, 1.000000, 'http://139.59.38.160/sendit/Dashboard/images/pexels-kei-scampa-3070071.jpg', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 0, 1, 1, '2020-10-17', '00:09:00'),
(8, 2, 'Safi Meat', '0828332334', '', 'Generate Lorem Ipsum placeholder text for use in your graphic, print and web ... In seeing a sample of lorem ipsum', '1595  Dickens St', 'Kempton Park', '', 1628, 25.747900, 28.229300, 'http://139.59.38.160/sendit/Dashboard/images/images-7.png', '09:00:00', '08:00:00', 200, 45, 0.00, 5.00, 0, 0, 1, 1, '2020-10-26', '06:02:00'),
(9, 6, 'SENDIT7', '9090909090', '', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 'Ganehs nagar', 'Guwahati', '', 7810, -26.358055, 27.398056, '', '09:00:00', '07:00:00', 200, 45, 0.00, 5.00, 0, 0, 1, 1, '2020-10-27', '06:53:00'),
(10, 2, 'Forsmay', '0784585523', '', '', '24 Crown Rd, Fordsburg, Johannesburg, 2092', 'Gauteng', '', 2092, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/4E7EC7AC-E77A-4BF7-9EA2-A7462275AD8F.jpeg', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 0, 1, 1, '2020-11-01', '10:38:00'),
(12, 1, 'Salehs Bakery', '0711781203', '', 'Closed on Mondays', '89 Central Road | Fordsburg  JohannesburgSouth Africa', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/Salehs.jfif', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 0, 1, 1, '2021-06-30', '12:37:00'),
(13, 4, 'Hafsa Savouries', '0762178212', 'zthokan@gmail.com', 'Hafsa''s Homemade Savouries', '7 yamuna street', '', '', 0, 0.000000, 0.000000, 'http://139.59.38.160/sendit/Dashboard/images/49889_logo.jpg', '00:00:00', '00:00:00', 200, 0, 0.00, 5.00, 0, 0, 1, 1, '2021-07-09', '15:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `update_user_order`
--

CREATE TABLE IF NOT EXISTS `update_user_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Gross` float(10,2) NOT NULL,
  `Discount` float(10,2) NOT NULL,
  `Packaging` float(10,2) NOT NULL,
  `Delievery` float(10,2) NOT NULL,
  `Total` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `update_user_order`
--

INSERT INTO `update_user_order` (`ID`, `UserID`, `OrderID`, `Gross`, `Discount`, `Packaging`, `Delievery`, `Total`, `Date`, `Time`) VALUES
(1, 24, 104567, 149.00, 0.00, 0.00, 0.00, 149.00, '2021-02-08', '06:26:00'),
(2, 24, 122941, 149.00, 0.00, 0.00, 0.00, 149.00, '2021-02-08', '08:25:00'),
(3, 22, 998868, 154.00, 0.00, 0.00, 0.00, 154.00, '2021-04-14', '21:28:00'),
(5, 24, 542740, 1202.00, 0.00, 0.00, 0.00, 1202.00, '2021-04-26', '16:15:00'),
(7, 24, 589796, 469.13, 0.00, 0.00, 0.00, 469.13, '2021-06-10', '21:05:00'),
(9, 24, 997612, 204.13, 0.00, 0.00, 0.00, 204.13, '2021-06-10', '21:13:00'),
(10, 24, 175843, 222.23, 0.00, 0.00, 0.00, 222.23, '2021-06-11', '14:10:00'),
(12, 24, 327168, 229.23, 0.00, 0.00, 0.00, 229.23, '2021-06-11', '14:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `userlevelpermissions`
--

CREATE TABLE IF NOT EXISTS `userlevelpermissions` (
  `userlevelid` int(11) NOT NULL,
  `tablename` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`userlevelid`,`tablename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

CREATE TABLE IF NOT EXISTS `userlevels` (
  `userlevelid` int(11) NOT NULL,
  `userlevelname` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`userlevelid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_emergency_contacts`
--

CREATE TABLE IF NOT EXISTS `users_emergency_contacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Contact_Name` varchar(255) NOT NULL,
  `Contact_Phone_No` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(200) NOT NULL,
  `Photo` varchar(255) DEFAULT 'profile_image.png',
  `Phone_No` varchar(20) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `Address` varchar(500) DEFAULT NULL,
  `Country` varchar(200) DEFAULT 'South Africa',
  `State` varchar(200) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Pin` varchar(255) DEFAULT NULL,
  `Latitude` float(10,6) DEFAULT NULL,
  `Longitude` float(10,6) DEFAULT NULL,
  `Favorite_Home_Address` varchar(255) DEFAULT NULL,
  `Favourite_Work_Address` varchar(255) DEFAULT NULL,
  `Favourite_Other_Address` varchar(255) DEFAULT NULL,
  `isHome` int(11) NOT NULL DEFAULT '0',
  `HomeAddress` varchar(200) NOT NULL,
  `HomeHouseNo` varchar(200) NOT NULL,
  `HomeLandMark` varchar(200) NOT NULL,
  `HomeZip` varchar(200) NOT NULL,
  `isWork` tinyint(4) NOT NULL DEFAULT '0',
  `WorkAddress` varchar(200) NOT NULL,
  `WorkHouseNo` varchar(20) NOT NULL,
  `WorkLandMark` varchar(200) NOT NULL,
  `WorkZip` varchar(200) NOT NULL,
  `Rating` float(10,1) DEFAULT '0.0',
  `Is_Blocked` tinyint(1) NOT NULL DEFAULT '0',
  `Charge` int(11) NOT NULL DEFAULT '0',
  `Reference_Code` varchar(255) DEFAULT NULL,
  `User_Referrence_Code` varchar(20) DEFAULT NULL,
  `Firebase_Token` varchar(255) DEFAULT NULL,
  `Logout` tinyint(4) NOT NULL DEFAULT '0',
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`ID`, `Name`, `Email`, `Password`, `Photo`, `Phone_No`, `role`, `Address`, `Country`, `State`, `City`, `Pin`, `Latitude`, `Longitude`, `Favorite_Home_Address`, `Favourite_Work_Address`, `Favourite_Other_Address`, `isHome`, `HomeAddress`, `HomeHouseNo`, `HomeLandMark`, `HomeZip`, `isWork`, `WorkAddress`, `WorkHouseNo`, `WorkLandMark`, `WorkZip`, `Rating`, `Is_Blocked`, `Charge`, `Reference_Code`, `User_Referrence_Code`, `Firebase_Token`, `Logout`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 'TEST PERSON1', 'test@gmail.com', '', 'profile_image.png', 'XXXXXXXXXXX', 1, NULL, 'Assam', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL),
(16, 'TEST1', '', '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '0827865662', 1, '', 'South Africa', 'Gauteng', 'Johannesburg', '', 0.000000, 0.000000, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'cpEVRs7DSh2rzijuSRmfMA:APA91bG8HN7hgoLPTzDbSP9UbNFjh_2q29J1bnwYtAHyg1PtM5o0xbtEWbl4A8O-fxXDDpJ8Uy_mWZP1lp6ysoyBPgs2pZHeKffiRRuDYyGnRvn36nnocJDnuYYGTxiUfMU1GSL2pSAL', 0, '2020-10-17', '00:12:00', NULL, NULL),
(22, 'NABEELA1', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '0737869821', 1, NULL, 'South Africa', 'India', NULL, NULL, NULL, NULL, 'House No: 29C Troupant Ave, Magaliessig, Sandton, 2191, South Africa', 'House No: 29C Troupant Ave| Magaliessig| Sandton| 2191| South Africa', NULL, 0, '', '', '', '', 0, 'House No: | 29C Troupant Ave, Magaliessig, Sandton, 2191, South Africa| | | 2191', '', '', '2191', 0.0, 0, 0, NULL, NULL, 'cprFd-25RZipZ6NSOkos5a:APA91bG5GBc42gGFAQv-fDOYbWQgn2ERQMjqIs13o66MExmwTMK3Dz9-0tSko472ySUVFQZSFJIpAUNaXCwh3K2iNpjh9erTlbfp-DUHm8jDDlPP1ZOQw47X3uZ7h1v7yCUK0-FAmPxa', 0, '2020-06-14', '22:40:00', NULL, NULL),
(14, 'TEST2', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Driver.png', '7002608243', 2, 'Test1', 'South Africa', 'Test1', 'Test1', '781029', NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'dUG-WgGjTvCCRFBRtjADDZ:APA91bGqd3a69VF8ngl5wbQJNFA-ICm_ODXmvZrNQYlbCoPsoEPICATofAkvaUxjSLE1wUC7_bOc93HoT9FSXe1XXcF6j0W6WQ6nM7qPHaWKDIiEGSICCcO6IWBqZemPFBlZG5GQ2Cit', 0, '2020-06-13', '11:56:00', 'ADMIN123', '47.29.202.35'),
(18, 'PARAG', '', '7c222fb2927d828af22f592134e8932480637c0d', 'IMG_20200612_181119.jpg', '7002986817', 1, 'Ganesh nagar', 'South Africa', 'India', 'Guwahati', '781029', 0.000000, 0.000000, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'eZLNKUq6Tr-cEez1ovTYYC:APA91bHHztlmiFAMEI3aqy-Sye4EOaS3VG0V_9Kvv1-EhhGuaTteK0sipDVkkHJ35T_VErD-EDdgx1w79T_ZN9d0fOAQf4lMdStyVQqScSDwGBGptxv4BhFdShVN68C2KVkrMicmLoBK', 1, '2020-06-12', '18:11:00', NULL, NULL),
(24, 'TEST One two', 'p@g.com', '7c222fb2927d828af22f592134e8932480637c0d', 'IMG_20201105_150212.jpg', '7002608241', 1, 'Ganesh nagar', 'South Africa', 'Kamrup', 'guwahati', '78102930', 0.000000, 0.000000, 'Optional(&quot;Latakata, Guwahati, Meghalaya 781029, India||Nilkantha Path|793102&quot;)', 'House No: 19|123| Ghoramara Pathar| Assam 782105| India', 'House No: 19|Area: 1600|Landmark: Amphitheatre ParkwayTown: Mountain View|Pin: 94043', 0, '', '', '', '', 0, 'House No: null| Bishnu Path, à¤—à¤£à¥‡à¤¶ à¤¨à¤—à¤°, à¤²à¤Ÿà¤•à¤¤à¤¾, Guwahati, à¤®à¥‡à¤˜à¤¾à¤²à¤¯ 781029, India| | Bishnu Path| 781029', 'null', 'Bishnu Path', '781029', 0.0, 0, 0, NULL, NULL, 'dmzSvTGSQbycTyUzebIv-9:APA91bG5J81kNlNrgPa8we-QerH4ekiwYa05100xT-MFlZYiRPK-rjUUZEv4hYuG1GaBm46AJViD2XZ4TMg_RK_dw9RDkMvMFZrb-7G7jJeUxgEl03YPdiW66jVpc8rqIJq1iK4xBn6o', 0, '2020-11-05', '11:32:00', NULL, NULL),
(23, 'MPATEL', NULL, '52f578d11e955d355a8968a1ca4f3babc1280219', 'Profile.png', '0798715465', 1, NULL, 'South Africa', 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, 'House No: | 8 Chestnut Cres, Marlboro Gardens, Sandton, 2063, South Africa| | | 2063', '', '', '2063', 0.0, 0, 0, NULL, NULL, 'fgHciCBWQP-1RP68zE8QJy:APA91bHCquOuuddfLv_G-C5OHjJV64TytUDgy420_JjUO5jXE_phz2ZQq9VIseBkPJvh1B1sj8UbKKHHNN0DFcZ3mlJpO_h4xU0ZD4S0Ed6KtCGGc5i-V0g9gj5TepEDvNegfvqPYCoo', 0, '2020-06-15', '11:08:00', NULL, NULL),
(25, 'PARAG', '', '7c222fb2927d828af22f592134e8932480637c0d', '1599244200.jpg', '7002608242', 3, 'Ganesh nagar', 'South Africa', 'Kamrup', 'guwahati', '7810', 0.000000, 0.000000, 'Optional(&quot;1 Stockton St||1 Stockton St|781029&quot;)', NULL, NULL, 0, '', '', '', '', 0, 'House No: 1600| 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA| | Amphitheatre Parkway| 94043', '1600', 'Amphitheatre Parkway', '94043', 0.0, 0, 0, NULL, NULL, 'cy-w8DTTRzqYGNxiJ5UzDL:APA91bG7oPCrElerZbIRCBQRZoGwt35XqOQFehVSJTyTKm7X6JL_pMKfmyf4Eat2I05LZDNpiQwIy9ZCw74R8sf5VefFMI_3DGVIENnViix7sn2HDZ7g2bosgEIoUmyRBeL-tNmEzqN3', 0, '2020-09-04', '21:03:00', NULL, NULL),
(26, 'TEST 5', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'chkokko-v-neck-solid-tshirt-men.jpg', '9898989898', 2, 'Test address', 'South Africa', 'test', 'Test', '1678', NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'dzqu3OuISqiikDsImAsfnd:APA91bE9nRuT4HBjiyKhe9TAFonUBWpw-EL3nvDhec1oXtFY_qyS7KsKim3Dlfo1lp-oBQHHz_QrTApNJQhEpRF--8RauNrmY-HzgrHhjvCrtEmYZNhlH5CNKtTeOmlTY3F3uNosx47V', 0, '2020-10-26', '06:03:00', 'ADMIN123', '47.29.173.202'),
(33, 'GABRU', NULL, '34d7641579879191e9b9043d86814f295f284a7b', 'Profile.png', '0829405040', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'fGnBipr6ScKOwSYBwdsX7N:APA91bGeaZmV6WsLFwxehkhQW6TMontUcYiEBgVfptA9WXlPIH6g8cfDWbzU7F9qrXdbcuqPOEhxI0kHSHHmKZyEqjBEGQftwmfY1C1z4BOF_V4th5sXKVuEaveQRPVXnDf4gZMyVAw7', 0, '2021-02-04', '19:34:00', NULL, NULL),
(27, 'TEST6', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'T1.jpeg', '8787878787', 2, 'Ganesh Nagar', 'South Africa', 'Basistha', 'Guwahati', '781029', NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-10-27', '05:57:00', 'ADMIN123', '223.176.2.183'),
(28, 'KAASHIF', NULL, '112bb791304791ddcf692e29fd5cf149b35fea37', 'Profile.png', '0762567623', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-11-02', '13:19:00', NULL, NULL),
(29, 'PARAG', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '8761932203', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'dpeTNEHOS3SfI24HRQjT6C:APA91bFmCNbCY_L-mmSP7L9YyRz7Pzer8f9dL6NILvWUkGmrmY0DrwTR5ppp3hbBlgYOsWBY8u36Hr1ERd14_hgmHbpAJcWYmp_w-v1Il17B_IEMWzfG3p8N9JyG-zH3wBFRerh3IHiQ', 1, '2020-11-18', '08:03:00', NULL, NULL),
(30, 'ppp', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '1234567890', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-12-17', '06:59:00', NULL, NULL),
(31, 'Parag', NULL, '7c222fb2927d828af22f592134e8932480637c0d', 'Profile.png', '2523633695', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2020-12-17', '07:04:00', NULL, NULL),
(32, 'zahed', NULL, '478ef448686b26cf96b6835afc00905f9375fd53', 'Profile.png', '0762178212', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, 'Optional(&quot;Gauteng||Johannesburg|2092&quot;)', NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, 'fCsXqzqfRZy4FjdRAZsG3x:APA91bEwxnNVqOTR5thm45eD6Ie95qryASd21t5kXMzGTOm8_AovT4ZHA0nSrApk30s0ljRqHQk1SmQXuoZ6kESAE-xSUrpo4XF7aESTHl5TM6Se6PBP8TRFI-vgufDj3Tkc2cflOQ8c', 1, '2020-12-24', '10:20:00', NULL, NULL),
(34, 'aaron goodin', NULL, '780d25f6828580083e3a5725d4ccb80cd99374b6', 'Profile.png', '6787513647', 1, NULL, 'South Africa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', 0, '', '', '', '', 0.0, 0, 0, NULL, NULL, NULL, 0, '2021-03-11', '11:42:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_daily_rates`
--

CREATE TABLE IF NOT EXISTS `vehicle_daily_rates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_of_Rate` date NOT NULL,
  `Vehicle_Type` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `Minimum_Fare` int(11) NOT NULL,
  `00-01_hr` int(11) NOT NULL,
  `01-02_hr` int(11) NOT NULL,
  `02-03_hr` int(11) NOT NULL,
  `03-04_hr` int(11) NOT NULL,
  `04-05_hr` int(11) NOT NULL,
  `05-06_hr` int(11) NOT NULL,
  `06-07_hr` int(11) NOT NULL,
  `07-08_hr` int(11) NOT NULL,
  `08-09_hr` int(11) NOT NULL,
  `09-10_hr` int(11) NOT NULL,
  `10-11_hr` int(11) NOT NULL,
  `11-12_hr` int(11) NOT NULL,
  `12-13_hr` int(11) NOT NULL,
  `13-14_hr` int(11) NOT NULL,
  `14-15_hr` int(11) NOT NULL,
  `15-16_hr` int(11) NOT NULL,
  `16-17_hr` int(11) NOT NULL,
  `17-18_hr` int(11) NOT NULL,
  `18-19_hr` int(11) NOT NULL,
  `19-20_hr` int(11) NOT NULL,
  `20-21_hr` int(11) NOT NULL,
  `21-22_hr` int(11) NOT NULL,
  `22-23_hr` int(11) NOT NULL,
  `23-00_hr` int(11) NOT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_detail`
--

CREATE TABLE IF NOT EXISTS `vehicle_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Minimum_Balance_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Total_balance` float(10,2) NOT NULL DEFAULT '500.00',
  `Type` tinyint(4) NOT NULL DEFAULT '0',
  `Driver_ID` int(11) DEFAULT NULL,
  `Vehicle_No` varchar(255) NOT NULL,
  `Vehicle_Photo_1` varchar(255) DEFAULT 'vehicle.png',
  `Vehicle_Photo_2` varchar(255) DEFAULT NULL,
  `Registration_Certificate_No` varchar(255) DEFAULT NULL,
  `Registration_Certificate_Photo` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vehicle_detail`
--

INSERT INTO `vehicle_detail` (`ID`, `Minimum_Balance_Status`, `Total_balance`, `Type`, `Driver_ID`, `Vehicle_No`, `Vehicle_Photo_1`, `Vehicle_Photo_2`, `Registration_Certificate_No`, `Registration_Certificate_Photo`, `Date`, `Time`, `User`, `IP`) VALUES
(1, 0, 500.00, 0, NULL, 'AX09BA1234', 'vehicle.png', NULL, 'ASBGGBVFFBVVB', NULL, NULL, NULL, NULL, NULL),
(2, 0, 500.00, 0, NULL, 'AX10MB5678', 'vehicle.png', NULL, 'ASBGGBVFFBVVB', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_manufacturer`
--

CREATE TABLE IF NOT EXISTS `vehicle_manufacturer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Company` varchar(255) NOT NULL,
  `Date` varchar(255) NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Vehicle_Company` (`Vehicle_Company`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_models`
--

CREATE TABLE IF NOT EXISTS `vehicle_models` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Company` int(11) NOT NULL,
  `Vehicle_Model` varchar(200) NOT NULL,
  `Vehicle_Type` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Vehicle_Model` (`Vehicle_Model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle_Percentage_Master`
--

CREATE TABLE IF NOT EXISTS `Vehicle_Percentage_Master` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_ID` int(11) NOT NULL,
  `Hellocab_Percentage_On_Ride` int(11) NOT NULL,
  `Owner_Percentage_On_Ride` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(255) NOT NULL,
  `IP` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_recharged`
--

CREATE TABLE IF NOT EXISTS `vehicle_recharged` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_ID` int(11) NOT NULL,
  `Rechargepoint_ID` int(11) NOT NULL,
  `Ammount` float(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `User` varchar(200) NOT NULL,
  `IP` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type_rate_master`
--

CREATE TABLE IF NOT EXISTS `vehicle_type_rate_master` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Vehicle_Security_Deposit` int(11) NOT NULL,
  `Vehicle_Minimum_Balance` int(11) NOT NULL,
  `Minimum_Fare` int(11) NOT NULL,
  `00-01_hr` int(11) NOT NULL,
  `01-02_hr` int(11) NOT NULL,
  `02-03_hr` int(11) NOT NULL,
  `03-04_hr` int(11) NOT NULL,
  `04-05_hr` int(11) NOT NULL,
  `05-06_hr` int(11) NOT NULL,
  `06-07_hr` int(11) NOT NULL,
  `07-08_hr` int(11) NOT NULL,
  `08-09_hr` int(11) NOT NULL,
  `09-10_hr` int(11) NOT NULL,
  `10-11_hr` int(11) NOT NULL,
  `11-12_hr` int(11) NOT NULL,
  `12-13_hr` int(11) NOT NULL,
  `13-14_hr` int(11) NOT NULL,
  `14-15_hr` int(11) NOT NULL,
  `15-16_hr` int(11) NOT NULL,
  `16-17_hr` int(11) NOT NULL,
  `17-18_hr` int(11) NOT NULL,
  `18-19_hr` int(11) NOT NULL,
  `19-20_hr` int(11) NOT NULL,
  `20-21_hr` int(11) NOT NULL,
  `21-22_hr` int(11) NOT NULL,
  `22-23_hr` int(11) NOT NULL,
  `23-00_hr` int(11) NOT NULL,
  `Remarks` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Time` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_User` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `Last_Modified_IP` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Vehicle_Type` (`Vehicle_Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visited_Canteen`
--

CREATE TABLE IF NOT EXISTS `visited_Canteen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Canteen_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
