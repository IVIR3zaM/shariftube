-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2015 at 06:05 PM
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
  `status` enum('Waiting','InProgress','Transferring','Failed','Success') NOT NULL DEFAULT 'Waiting',
  `locked_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `server_id` (`server_id`),
  KEY `website_id` (`website_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 1, 1, '9504e6a8dea62733b965a1598d7e19f7.3gp', '3gp', 'Mitsubishi Galant 0 - 200 KM/H', 866804, 'https://r17---sn-vgqsen7y.googlevideo.com/videoplayback?itag=17&expire=1446037739&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9406511%2C9408710%2C9414737%2C9414764%2C9415415%2C9416126%2C9417707%2C9419445%2C9420282%2C9420929%2C9421543%2C9421825%2C9422350%2C9423356&source=youtube&mime=video%2F3gpp&lmt=1390815741552449&mt=1446016059&mv=m&ms=au&mm=31&mn=sn-vgqsen7y&dur=83.406&id=34844245907f8986&upn=9oqZH0Q-RX0&key=yt6&ip=107.182.226.169&ipbits=0&signature=24E055F43877E82BE58F1E906EB2C15B40AC5C69.106BC6831725DDCAE1CD85C04675FBBA11FC628E&sver=3&requiressl=yes&pl=25&nh=IgpwZjAxLm9yZDM1Kg03Mi4xNC4yMDQuMTY5&initcwndbps=75000', '144p', 'No', 866804, 'Success', '2015-10-28 07:20:07', '0000-00-00 00:00:00', '2015-10-28 13:05:30', '2015-10-28 07:13:04'),
(2, 1, 1, 1, 'c1a53b3a343e8109f6009756b9d29744.3gp', '3gp', '@MITSUBISHI  GALANT  2.5 V6,24 VALUE(engine sound)', 711223, 'https://r2---sn-a8au-naje.googlevideo.com/videoplayback?pl=25&mn=sn-a8au-naje&ipbits=0&mm=31&itag=17&ms=au&initcwndbps=215000&mv=m&dur=74.257&mt=1446017557&id=79a4f8e0a053be0b&fexp=9408710%2C9409126%2C9414764%2C9415327%2C9416126%2C9417205%2C9417224%2C9417707%2C9418896%2C9420311%2C9420772%2C9421252%2C9422342&sparams=cwbhb%2Cdur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpcm2cms%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2F3gpp&requiressl=yes&lmt=1389931014681671&expire=1446039255&signature=DB581FB343DEE3E6871D8D5FA9BECCD5B0436939.60B8B89F31DBDBB2185B562DAF74342611D7522E&cwbhb=yes&ip=107.182.226.169&source=youtube&sver=3&upn=dAg2OWgCG_I&pcm2cms=yes&key=yt6', '144p', 'No', 711223, 'Success', '2015-10-28 07:34:34', '0000-00-00 00:00:00', '2015-10-28 07:34:47', '2015-10-28 07:34:30'),
(4, 1, 1, 1, '695dacf0483f6107b80127f7c1bc19d1.3gp', '3gp', 'The Black Nights Mitsubishi Galant HIN Malang 2014', 2328433, 'https://r20---sn-vgqs7ned.googlevideo.com/videoplayback?sver=3&upn=mmQuaXDX44E&expire=1446039492&lmt=1410932031333427&ip=107.182.226.169&requiressl=yes&ms=au&mt=1446017778&mv=m&dur=228.345&id=9ee617bcdd5a5ad4&ipbits=0&mm=31&mn=sn-vgqs7ned&initcwndbps=45000&fexp=9405995%2C9407472%2C9408501%2C9408710%2C9410705%2C9414764%2C9416126%2C9416729%2C9417707%2C9418185%2C9418750%2C9419038%2C9419355%2C9419446%2C9421550%2C9421712%2C9421745%2C9421824%2C9422543&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=17&signature=5664E6E1545537FDA5DEE69480B9CF54A44BD617.CF892425E590F67F03B7BC12E68C8ED9AE570DDC&mime=video%2F3gpp&pl=25&source=youtube&key=yt6&nh=IgpwZjAxLm9yZDM1Kgw2NC44Ni4xMzcuMTc', '144p', 'No', 2328433, 'Transferring', '2015-10-28 07:48:22', '0000-00-00 00:00:00', '2015-10-28 07:48:49', '2015-10-28 07:48:18'),
(5, 1, 1, 1, '26bd0e72dc6f6db888c150fae01c0a30.3gp', '3gp', 'BMW M3 E46 vs Mitsubishi Galant VR-4', 215941, 'https://r5---sn-vgqs7nlz.googlevideo.com/videoplayback?requiressl=yes&lmt=1393834613564012&source=youtube&dur=21.733&signature=A1158DE1AB5F91BC05BF7E83270C8518700D6BAD.915368DCDF8E8C521E46D556B9166420348A2C3D&key=yt6&nh=IgpwcjA0Lm9yZDEyKg8xOTkuMjI5LjIzMS4yMzM&fexp=9405963%2C9408710%2C9409207%2C9413142%2C9414764%2C9416126%2C9416985%2C9417630%2C9417707%2C9418201%2C9418401%2C9422289%2C9422904%2C9422920%2C9423224%2C9423588&sver=3&upn=8fmjQ_3aojg&expire=1446040518&itag=17&pl=25&ip=107.182.226.169&ms=au&mt=1446018812&mv=m&id=faf52a3edcd85b37&mm=31&mn=sn-vgqs7nlz&mime=video%2F3gpp&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&initcwndbps=75000', '144p', 'No', 215941, 'Success', '2015-10-28 07:55:58', '0000-00-00 00:00:00', '2015-10-28 07:56:15', '2015-10-28 07:55:54');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `label`, `quota`, `price`, `status`) VALUES
(1, 'تست', 10000000000, 1000, 'Enable');

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
  `params` varchar(1024) DEFAULT NULL,
  `status` enum('Waiting','Paid','Success','Cancelled') NOT NULL DEFAULT 'Waiting',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `package_id` (`package_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `package_id`, `amount`, `gateway`, `key`, `params`, `status`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 1, 1000, 'Payline', '8227715', '', 'Cancelled', '0000-00-00 00:00:00', '2015-10-29 14:28:43', '2015-10-29 14:28:28'),
(2, 1, 1, 1000, 'Payline', '8227724', '8660822', 'Success', '0000-00-00 00:00:00', '2015-10-29 14:29:32', '2015-10-29 14:28:56'),
(3, 1, 1, 1000, 'Payline', '8227764', '', 'Cancelled', '0000-00-00 00:00:00', '2015-10-29 14:32:17', '2015-10-29 14:32:01'),
(4, 1, 1, 1000, 'Payline', '8227790', '8660891', 'Success', '0000-00-00 00:00:00', '2015-10-29 14:34:00', '2015-10-29 14:33:30');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

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
(12, 3, '15121a6750f812280698000aedec7bd2', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-10-27 14:16:13'),
(13, 1, 'c7b3b79c4cc48e6f84e001c4736d29bd', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-29 14:34:00');

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
(1, 'http://localhost/files/', 'localhost', 22, 'sharif', 'BAaQ3VYvYE7PlbRwwbXe3g/0PTQAKRANHd8ch4siISXhakKokvhY4aJuG1EWEwKNBxAtWO0z/ongzqbt75T4KA==', 2000000000, 4122401, 1995877599, 'Yes', '0000-00-00 00:00:00', '2015-10-28 12:57:18', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

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
(22, 3, '192.168.1.122', '2015-10-27 14:16:13'),
(23, 1, '127.0.0.1', '2015-10-29 14:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(150) NOT NULL,
  `status` enum('Open','Answered','Replay','InProgress','Closed') NOT NULL DEFAULT 'Open',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replays`
--

CREATE TABLE IF NOT EXISTS `ticket_replays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `content` varchar(1024) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
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
  `role` enum('Admin','User') NOT NULL DEFAULT 'User',
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

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'm.reza.maghool@gmail.com', '$2a$08$MRGRM8Kch4v6RZ9iVQQOrOU9XoElC9bOxb4F9HQ4g9vV7Lf1e/KN.', 'User', 'محمدرضا معقول', 'm69', NULL, 30485760000, 4122401, 10481637599, '0000-00-00 00:00:00', '2015-10-29 14:34:00', '2015-10-23 08:25:20'),
(2, 'mreza.maghoul@gmail.com', '$2a$08$7TNHjDrnbfPU33Vte5XPKeXUzs.5V7MH6g7dV2i5YqpTAsnKj6PxG', 'User', 'تکرار من', NULL, 1, 0, 0, 0, '0000-00-00 00:00:00', '2015-10-23 08:48:18', '2015-10-23 08:48:18'),
(3, 'farskid@gmail.com', '$2a$08$yHuEhc2kvmtVsknhkoUuU.4FJh7K4P.cTm81PDgrAxIDDPPMfARNS', 'User', 'farzad', NULL, 1, 0, 0, 0, '0000-00-00 00:00:00', '2015-10-25 07:25:00', '2015-10-25 07:25:00');

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

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_replays`
--
ALTER TABLE `ticket_replays`
  ADD CONSTRAINT `ticket_replays_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replays_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
