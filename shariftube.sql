-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 15, 2015 at 05:57 PM
-- Server version: 5.5.35
-- PHP Version: 5.4.45-2+deb.sury.org~precise+2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shariftube`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_logins`
--

CREATE TABLE IF NOT EXISTS `failed_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(10) unsigned DEFAULT NULL,
  `ip_address` char(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_Id` (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(10) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `label` varchar(255) NOT NULL,
  `quota` float(10,2) unsigned NOT NULL,
  `link` varchar(1024) NOT NULL,
  `quality` varchar(50) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_Id` (`user_Id`),
  KEY `server_id` (`server_id`),
  KEY `website_id` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `quota` float(10,2) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `password_changes`
--

CREATE TABLE IF NOT EXISTS `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(10) unsigned NOT NULL,
  `ip_address` char(15) NOT NULL,
  `user_agent` varchar(48) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_Id` (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(10) unsigned DEFAULT NULL,
  `package_id` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned NOT NULL,
  `gateway` enum('Payline') NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `params` varchar(1024) NOT NULL,
  `status` enum('Waiting','Paid','Success','Cancelled') NOT NULL DEFAULT 'Waiting',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `user_Id` (`user_Id`),
  KEY `package_id` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE IF NOT EXISTS `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reset_passwords`
--

CREATE TABLE IF NOT EXISTS `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `user_Id` (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `quota` float(10,2) unsigned NOT NULL,
  `used` float(10,2) unsigned NOT NULL,
  `remain` float(10,2) unsigned NOT NULL,
  `enable` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `quota` (`quota`,`used`,`remain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `success_logins`
--

CREATE TABLE IF NOT EXISTS `success_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` char(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `referral_code` varchar(20) DEFAULT NULL,
  `referral_id` int(10) unsigned DEFAULT NULL,
  `quota` float(10,2) unsigned NOT NULL,
  `used` float(10,2) unsigned NOT NULL,
  `remain` float(10,2) unsigned NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `referral_code` (`referral_code`),
  KEY `referral_id` (`referral_id`),
  KEY `quota` (`quota`,`used`,`remain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE IF NOT EXISTS `websites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `domains` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `name`, `domains`) VALUES
(1, 'Youtube', 'youtube.com,youtu.be');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD CONSTRAINT `failed_logins_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_3` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `password_changes`
--
ALTER TABLE `password_changes`
  ADD CONSTRAINT `password_changes_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_ibfk_4` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  ADD CONSTRAINT `remember_tokens_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  ADD CONSTRAINT `reset_passwords_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `success_logins`
--
ALTER TABLE `success_logins`
  ADD CONSTRAINT `success_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
