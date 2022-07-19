-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 03:39 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xyronite`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `bizID` int(12) NOT NULL,
  `bizName` varchar(32) NOT NULL DEFAULT 'None Business',
  `bizOwner` int(12) NOT NULL DEFAULT -1,
  `bizExtX` float NOT NULL DEFAULT 0,
  `bizExtY` float NOT NULL DEFAULT 0,
  `bizExtZ` float NOT NULL DEFAULT 0,
  `bizIntX` float NOT NULL DEFAULT 0,
  `bizIntY` float NOT NULL DEFAULT 0,
  `bizIntZ` float NOT NULL DEFAULT 0,
  `bizProduct1` int(5) NOT NULL DEFAULT 0,
  `bizProduct2` int(5) NOT NULL DEFAULT 0,
  `bizProduct3` int(5) NOT NULL DEFAULT 0,
  `bizProduct4` int(5) NOT NULL DEFAULT 0,
  `bizProduct5` int(5) NOT NULL DEFAULT 0,
  `bizProduct6` int(5) NOT NULL DEFAULT 0,
  `bizProduct7` int(5) NOT NULL DEFAULT 0,
  `bizWorld` int(8) NOT NULL DEFAULT 0,
  `bizInterior` int(8) NOT NULL DEFAULT 0,
  `bizPrice` int(8) NOT NULL DEFAULT 0,
  `bizVault` int(8) NOT NULL DEFAULT 0,
  `bizStock` int(8) NOT NULL DEFAULT 0,
  `bizFuel` int(8) NOT NULL DEFAULT 0,
  `bizType` int(6) NOT NULL DEFAULT 0,
  `bizOwnerName` varchar(64) NOT NULL DEFAULT 'None',
  `bizProdName1` varchar(24) NOT NULL DEFAULT 'None',
  `bizProdName2` varchar(24) NOT NULL DEFAULT 'None',
  `bizProdName3` varchar(24) NOT NULL DEFAULT 'None',
  `bizProdName4` varchar(24) NOT NULL DEFAULT 'None',
  `bizProdName5` varchar(24) NOT NULL DEFAULT 'None',
  `bizProdName6` varchar(24) NOT NULL DEFAULT 'None',
  `bizProdName7` varchar(24) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `pID` int(12) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `Health` float NOT NULL DEFAULT 100,
  `Interior` int(8) NOT NULL DEFAULT 0,
  `World` int(8) NOT NULL DEFAULT 0,
  `UCP` varchar(22) NOT NULL,
  `Age` int(5) NOT NULL DEFAULT 0,
  `Origin` varchar(22) NOT NULL DEFAULT 'None',
  `Gender` int(3) NOT NULL DEFAULT 0,
  `Skin` int(4) NOT NULL DEFAULT 0,
  `Energy` int(8) NOT NULL DEFAULT 100,
  `AdminLevel` int(5) NOT NULL DEFAULT 0,
  `InBiz` int(8) NOT NULL DEFAULT 0,
  `Money` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`pID`, `Name`, `PosX`, `PosY`, `PosZ`, `Health`, `Interior`, `World`, `UCP`, `Age`, `Origin`, `Gender`, `Skin`, `Energy`, `AdminLevel`, `InBiz`, `Money`) VALUES
(11, 'Sutrisno_William', 1700.21, -2307.67, 14.5156, 100, 0, 0, 'pen1z', 23, 'Detroit', 1, 240, 90, 7, -1, 150);

-- --------------------------------------------------------

--
-- Table structure for table `dropped`
--

CREATE TABLE `dropped` (
  `ID` int(12) NOT NULL,
  `itemName` varchar(32) DEFAULT NULL,
  `itemModel` int(12) DEFAULT 0,
  `itemX` float DEFAULT 0,
  `itemY` float DEFAULT 0,
  `itemZ` float DEFAULT 0,
  `itemInt` int(12) DEFAULT 0,
  `itemWorld` int(12) DEFAULT 0,
  `itemQuantity` int(12) DEFAULT 0,
  `itemAmmo` int(12) DEFAULT 0,
  `itemWeapon` int(12) DEFAULT 0,
  `itemPlayer` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ID` int(12) DEFAULT 0,
  `invID` int(12) NOT NULL,
  `invItem` varchar(32) DEFAULT NULL,
  `invModel` int(12) DEFAULT 0,
  `invQuantity` int(12) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playerucp`
--

CREATE TABLE `playerucp` (
  `ID` int(12) NOT NULL,
  `UCP` varchar(22) NOT NULL,
  `Password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playerucp`
--

INSERT INTO `playerucp` (`ID`, `UCP`, `Password`) VALUES
(8, 'pen1z', '$2y$12$SnZC7tPO9yiduA7oojwD6u3HulwkjeUb4qLTqO1qCvzxJ8mIDaBOW');

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `ID` int(12) NOT NULL,
  `PosX` float NOT NULL DEFAULT 0,
  `PosY` float NOT NULL DEFAULT 0,
  `PosZ` float NOT NULL DEFAULT 0,
  `SpawnX` float NOT NULL DEFAULT 0,
  `SpawnY` float NOT NULL DEFAULT 0,
  `SpawnZ` float NOT NULL DEFAULT 0,
  `SpawnA` float NOT NULL DEFAULT 0,
  `Vehicle1` int(6) NOT NULL DEFAULT 0,
  `Vehicle2` int(6) NOT NULL DEFAULT 0,
  `Price1` int(6) NOT NULL DEFAULT 0,
  `Price2` int(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehID` int(12) NOT NULL,
  `vehModel` int(6) NOT NULL DEFAULT 0,
  `vehOwner` int(12) NOT NULL DEFAULT 0,
  `vehX` float NOT NULL DEFAULT 0,
  `vehY` float NOT NULL DEFAULT 0,
  `vehZ` float NOT NULL DEFAULT 0,
  `vehA` float NOT NULL DEFAULT 0,
  `vehColor1` int(6) NOT NULL DEFAULT 0,
  `vehColor2` int(6) NOT NULL DEFAULT 0,
  `vehWorld` int(8) NOT NULL DEFAULT 0,
  `vehInterior` int(8) NOT NULL DEFAULT 0,
  `vehFuel` int(8) NOT NULL DEFAULT 0,
  `vehDamage1` int(8) NOT NULL DEFAULT 0,
  `vehDamage2` int(8) NOT NULL DEFAULT 0,
  `vehDamage3` int(8) NOT NULL DEFAULT 0,
  `vehDamage4` int(8) NOT NULL DEFAULT 0,
  `vehHealth` int(11) NOT NULL DEFAULT 1000,
  `vehInsurance` int(8) NOT NULL DEFAULT 0,
  `vehInsuTime` int(12) NOT NULL DEFAULT 0,
  `vehLocked` int(3) NOT NULL DEFAULT 0,
  `vehPlate` varchar(16) NOT NULL DEFAULT 'NONE',
  `vehRental` int(4) NOT NULL DEFAULT -1,
  `vehRentalTime` int(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`bizID`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`pID`);

--
-- Indexes for table `dropped`
--
ALTER TABLE `dropped`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`invID`);

--
-- Indexes for table `playerucp`
--
ALTER TABLE `playerucp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `bizID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `pID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dropped`
--
ALTER TABLE `dropped`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1063;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `invID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1209;

--
-- AUTO_INCREMENT for table `playerucp`
--
ALTER TABLE `playerucp`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rental`
--
ALTER TABLE `rental`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
