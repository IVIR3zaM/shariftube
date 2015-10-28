-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2015 at 09:36 AM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.6.12-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `failed_logins`
--

INSERT INTO `failed_logins` (`id`, `user_Id`, `ip_address`, `created_at`) VALUES
(1, NULL, '127.0.0.1', '2015-10-23 08:28:00'),
(2, NULL, '127.0.0.1', '2015-10-23 08:54:27'),
(3, NULL, '127.0.0.1', '2015-10-23 09:00:07'),
(4, NULL, '192.168.1.122', '2015-10-25 08:02:57'),
(5, NULL, '192.168.1.122', '2015-10-27 14:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `website_id` int(10) unsigned NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` enum('flv','mp4','webm','3gp') NOT NULL,
  `label` varchar(255) NOT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `link` varchar(2048) NOT NULL,
  `quality` enum('144p','240p','270p','360p','480p','720p','1080p','2160p','3072p','4320p') NOT NULL,
  `is_3d` enum('No','Yes') NOT NULL DEFAULT 'No',
  `fetched` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` enum('Waiting','InProgress','Transfering','Failed','Success') NOT NULL DEFAULT 'Waiting',
  `locked_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `server_id` (`server_id`),
  KEY `website_id` (`website_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 1, 1, '134791de2dfef5db4407033615191aea.3gp', '3gp', 'Mitsubishi Lancer EVO X - Destroyers of the system!', 578561, 'https://r3---sn-p5qlsu7d.googlevideo.com/videoplayback?ipbits=0&mime=video%2F3gpp&sparams=dur,expire,id,initcwndbps,ip,ipbits,itag,lmt,mime,mm,mn,ms,mv,nh,pl,requiressl,source,upn&key=cms1&signature=36BC75582269F63C08D8D56BFBC0747D2CD4D0C8.31EF5E0E72F3BE952FCB5D058B574DA949AFAC37&fexp=9408710%2C9414764%2C9416126%2C9417707&lmt=1434320172215471&source=youtube&dur=56.517&requiressl=yes&itag=17&sver=3&upn=gtlnrS7UEFw&expire=1445975509&id=bac519a88bb96118&pl=25&ip=107.182.226.171&redirect_counter=1&req_id=b9177803840f8f9e&cms_redirect=yes&mm=26&mn=sn-p5qlsu7d&ms=tsu&mt=1445954074&mv=m', '144p', 'No', 578560, 'Waiting', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-10-27 14:10:15', '2015-10-27 13:52:16'),
(3, 1, 1, 1, '2035a4dc97e22adf77698709ec27c647.3gp', '3gp', 'Mitsubishi Galant 0 - 200 KM/H', 866804, 'https://r17---sn-ab5l6m7s.googlevideo.com/videoplayback?mn=sn-ab5l6m7s&ip=107.182.226.169&mm=31&sver=3&key=yt6&pl=25&id=34844245907f8986&mime=video%2F3gpp&mv=m&mt=1446007597&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&requiressl=yes&signature=DD0AA2D93475E7436C49F18F36B3FF3C51C2F1AE.671559DB4B993EC9E325DFFE6476B5B853034FAD&itag=17&expire=1446029226&fexp=9408212%2C9408491%2C9408710%2C9409097%2C9409128%2C9409206%2C9414764%2C9416126%2C9416729%2C9417707%2C9418203%2C9419445%2C9419788%2C9419892%2C9420311%2C9421149%2C9421823%2C9423161%2C9423490&upn=rKJYNNPuxnM&nh=EAE&dur=83.406&initcwndbps=396250&source=youtube&lmt=1390815741552449&ipbits=0', '144p', 'No', 866804, 'Transfering', '2015-10-28 04:48:37', '0000-00-00 00:00:00', '2015-10-28 04:48:47', '2015-10-28 04:48:35'),
(6, 1, 1, 1, '0ecc675e94e3f4975a3a431fde30679d.3gp', '3gp', 'Mitsubishi Galant 0 - 200 KM/H', 866804, 'https://r17---sn-ab5l6m7s.googlevideo.com/videoplayback?mn=sn-ab5l6m7s&ip=107.182.226.169&mm=31&sver=3&key=yt6&pl=25&id=34844245907f8986&mime=video%2F3gpp&mv=m&mt=1446007597&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&requiressl=yes&signature=DD0AA2D93475E7436C49F18F36B3FF3C51C2F1AE.671559DB4B993EC9E325DFFE6476B5B853034FAD&itag=17&expire=1446029226&fexp=9408212%2C9408491%2C9408710%2C9409097%2C9409128%2C9409206%2C9414764%2C9416126%2C9416729%2C9417707%2C9418203%2C9419445%2C9419788%2C9419892%2C9420311%2C9421149%2C9421823%2C9423161%2C9423490&upn=rKJYNNPuxnM&nh=EAE&dur=83.406&initcwndbps=396250&source=youtube&lmt=1390815741552449&ipbits=0', '144p', 'No', 866804, 'Transfering', '2015-10-28 04:56:52', '0000-00-00 00:00:00', '2015-10-28 04:57:07', '2015-10-28 04:56:51'),
(7, 1, 1, 1, '7241d90f0cefa66f26cd993693f02694.mp4', 'mp4', 'Mitsubishi Galant 0 - 200 KM/H', 14529618, 'https://r17---sn-ab5l6m7s.googlevideo.com/videoplayback?mn=sn-ab5l6m7s&ip=107.182.226.169&mm=31&sver=3&key=yt6&pl=25&id=34844245907f8986&mime=video%2Fmp4&mv=m&mt=1446007597&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&requiressl=yes&signature=27E56A890536D95AE97EC2182412B249816CC40A.BD6C67858CFE248B8DA9347D16EE72F44C09BBFE&itag=22&expire=1446029226&fexp=9408212%2C9408491%2C9408710%2C9409097%2C9409128%2C9409206%2C9414764%2C9416126%2C9416729%2C9417707%2C9418203%2C9419445%2C9419788%2C9419892%2C9420311%2C9421149%2C9421823%2C9423161%2C9423490&lmt=1417283601982674&nh=EAE&dur=83.104&initcwndbps=396250&source=youtube&upn=rKJYNNPuxnM&ratebypass=yes&ipbits=0', '720p', 'No', 14529618, 'Transfering', '2015-10-28 04:57:34', '0000-00-00 00:00:00', '2015-10-28 04:59:37', '2015-10-28 04:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE IF NOT EXISTS `incomes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  `percentage` tinyint(3) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `purchase_id` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `quota` bigint(20) unsigned NOT NULL,
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
  `user_id` int(10) unsigned DEFAULT NULL,
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
  KEY `package_id` (`package_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE IF NOT EXISTS `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `remember_tokens`
--

INSERT INTO `remember_tokens` (`id`, `user_id`, `token`, `user_agent`, `created_at`) VALUES
(1, 1, '412a0f1c25c19d7da89c8e00b49335fa', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-23 08:25:20'),
(2, 1, 'f2ebe9af4f7b979263b87eb895e84ec2', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-23 08:28:08'),
(3, 2, '6a233e3fdaeec3ca2eb7e2a7eb24776b', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-23 08:48:18'),
(4, 1, '2e8d2ad518583746f4fa1537ba6d7f7f', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-23 09:00:29'),
(5, 1, 'd986f2832c3b846dc5679d65e32cfb9b', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-23 11:07:25'),
(6, 1, '621d174795f2695bc4a651ee94a89842', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-24 05:22:16'),
(7, 1, '94763b439cff357b9a555893fd3ee6d7', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-24 06:15:40'),
(8, 1, 'a01a10408b0e7ba4351592aebb00aac7', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 AlexaToolbar/alxf-2.21', '2015-10-25 05:14:06'),
(9, 1, '552086d58b0a43161364673ea5569856', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 AlexaToolbar/alxf-2.21', '2015-10-25 05:23:31'),
(10, 3, '516671eaafe3ba0e096bd33f013ada09', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-10-25 07:25:00'),
(11, 3, '56c8416fc38ae21ce6828c60b45d521b', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-10-25 08:03:20'),
(12, 3, '15121a6750f812280698000aedec7bd2', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-10-27 14:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `reset_passwords`
--

CREATE TABLE IF NOT EXISTS `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(150) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `port` int(10) unsigned NOT NULL DEFAULT '22',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `quota` bigint(20) unsigned NOT NULL,
  `used` bigint(20) unsigned NOT NULL,
  `remain` bigint(20) unsigned NOT NULL,
  `enable` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `quota` (`quota`,`used`,`remain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `link`, `hostname`, `port`, `username`, `password`, `quota`, `used`, `remain`, `enable`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'http://localhost/files/', 'localhost', 22, 'maghoul', 'BAaQ3VYvYE7PlbRwwbXe3g/0PTQAKRANHd8ch4siISXhakKokvhY4aJuG1EWEwKNBxAtWO0z/ongzqbt75T4KA==', 200000000, 92029978, 107970023, 'Yes', '0000-00-00 00:00:00', '2015-10-28 04:57:33', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `success_logins`
--

INSERT INTO `success_logins` (`id`, `user_id`, `ip_address`, `created_at`) VALUES
(11, 1, '127.0.0.1', '2015-10-23 08:25:20'),
(12, 1, '127.0.0.1', '2015-10-23 08:28:08'),
(13, 2, '127.0.0.1', '2015-10-23 08:48:18'),
(14, 1, '127.0.0.1', '2015-10-23 09:00:29'),
(15, 1, '127.0.0.1', '2015-10-23 11:07:25'),
(16, 1, '127.0.0.1', '2015-10-24 05:22:16'),
(17, 1, '127.0.0.1', '2015-10-24 06:15:40'),
(18, 1, '127.0.0.1', '2015-10-25 05:14:06'),
(19, 1, '127.0.0.1', '2015-10-25 05:23:31'),
(20, 3, '192.168.1.122', '2015-10-25 07:25:00'),
(21, 3, '192.168.1.122', '2015-10-25 08:03:20'),
(22, 3, '192.168.1.122', '2015-10-27 14:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `name` varchar(150) NOT NULL,
  `referral_code` varchar(20) DEFAULT NULL,
  `referral_id` int(10) unsigned DEFAULT NULL,
  `quota` bigint(20) unsigned NOT NULL,
  `used` bigint(20) unsigned NOT NULL,
  `remain` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `referral_code` (`referral_code`),
  KEY `referral_id` (`referral_id`),
  KEY `quota` (`quota`,`used`,`remain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'm.reza.maghool@gmail.com', '$2a$08$MRGRM8Kch4v6RZ9iVQQOrOU9XoElC9bOxb4F9HQ4g9vV7Lf1e/KN.', 'محمدرضا معقول', 'm69', NULL, 104857600, 77698800, 27158800, '0000-00-00 00:00:00', '2015-10-28 04:57:33', '2015-10-23 08:25:20'),
(2, 'mreza.maghoul@gmail.com', '$2a$08$7TNHjDrnbfPU33Vte5XPKeXUzs.5V7MH6g7dV2i5YqpTAsnKj6PxG', 'تکرار من', NULL, 1, 0, 0, 0, '0000-00-00 00:00:00', '2015-10-23 08:48:18', '2015-10-23 08:48:18'),
(3, 'farskid@gmail.com', '$2a$08$yHuEhc2kvmtVsknhkoUuU.4FJh7K4P.cTm81PDgrAxIDDPPMfARNS', 'farzad', NULL, 1, 0, 0, 0, '0000-00-00 00:00:00', '2015-10-25 07:25:00', '2015-10-25 07:25:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `name`, `domains`) VALUES
(1, 'Youtube', 'youtube.com,youtu.be'),
(2, 'Vimeo', 'vimeo.com');

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
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_3` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `files_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `incomes_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `password_changes`
--
ALTER TABLE `password_changes`
  ADD CONSTRAINT `password_changes_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_ibfk_4` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  ADD CONSTRAINT `remember_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `remember_tokens_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  ADD CONSTRAINT `reset_passwords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reset_passwords_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `success_logins`
--
ALTER TABLE `success_logins`
  ADD CONSTRAINT `success_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
