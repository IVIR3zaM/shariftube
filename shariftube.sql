-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2015 at 09:15 AM
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
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dates` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `created_at`) VALUES
(1, 'تکمیل شدن شریف تیوب', 'وبسایت شریف تیوب با پشتیبانی ار یوتیوب و ویمئو افتتاح خواهد شد.\r\nبا تشکر از همراهی شما', '2015-10-30 05:57:26');

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
  KEY `user_Id` (`user_Id`),
  KEY `dates` (`created_at`)
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
  `uri` varchar(255) NOT NULL,
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
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `locked_at` (`locked_at`),
  KEY `dates` (`deleted_at`,`modified_at`,`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 1, 1, '9504e6a8dea62733b965a1598d7e19f7.3gp', '3gp', 'Mitsubishi Galant 0 - 200 KM/H', 866804, '', 'https://r17---sn-vgqsen7y.googlevideo.com/videoplayback?itag=17&expire=1446037739&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9406511%2C9408710%2C9414737%2C9414764%2C9415415%2C9416126%2C9417707%2C9419445%2C9420282%2C9420929%2C9421543%2C9421825%2C9422350%2C9423356&source=youtube&mime=video%2F3gpp&lmt=1390815741552449&mt=1446016059&mv=m&ms=au&mm=31&mn=sn-vgqsen7y&dur=83.406&id=34844245907f8986&upn=9oqZH0Q-RX0&key=yt6&ip=107.182.226.169&ipbits=0&signature=24E055F43877E82BE58F1E906EB2C15B40AC5C69.106BC6831725DDCAE1CD85C04675FBBA11FC628E&sver=3&requiressl=yes&pl=25&nh=IgpwZjAxLm9yZDM1Kg03Mi4xNC4yMDQuMTY5&initcwndbps=75000', '144p', 'No', 866804, 'Success', '2015-10-28 07:20:07', '0000-00-00 00:00:00', '2015-10-28 13:05:30', '2015-10-28 07:13:04'),
(2, 1, 1, 1, 'c1a53b3a343e8109f6009756b9d29744.3gp', '3gp', '@MITSUBISHI  GALANT  2.5 V6,24 VALUE(engine sound)', 711223, '', 'https://r2---sn-a8au-naje.googlevideo.com/videoplayback?pl=25&mn=sn-a8au-naje&ipbits=0&mm=31&itag=17&ms=au&initcwndbps=215000&mv=m&dur=74.257&mt=1446017557&id=79a4f8e0a053be0b&fexp=9408710%2C9409126%2C9414764%2C9415327%2C9416126%2C9417205%2C9417224%2C9417707%2C9418896%2C9420311%2C9420772%2C9421252%2C9422342&sparams=cwbhb%2Cdur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpcm2cms%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2F3gpp&requiressl=yes&lmt=1389931014681671&expire=1446039255&signature=DB581FB343DEE3E6871D8D5FA9BECCD5B0436939.60B8B89F31DBDBB2185B562DAF74342611D7522E&cwbhb=yes&ip=107.182.226.169&source=youtube&sver=3&upn=dAg2OWgCG_I&pcm2cms=yes&key=yt6', '144p', 'No', 711223, 'Success', '2015-10-28 07:34:34', '0000-00-00 00:00:00', '2015-10-28 07:34:47', '2015-10-28 07:34:30'),
(4, 1, 1, 1, '695dacf0483f6107b80127f7c1bc19d1.3gp', '3gp', 'The Black Nights Mitsubishi Galant HIN Malang 2014', 2328433, '', 'https://r20---sn-vgqs7ned.googlevideo.com/videoplayback?sver=3&upn=mmQuaXDX44E&expire=1446039492&lmt=1410932031333427&ip=107.182.226.169&requiressl=yes&ms=au&mt=1446017778&mv=m&dur=228.345&id=9ee617bcdd5a5ad4&ipbits=0&mm=31&mn=sn-vgqs7ned&initcwndbps=45000&fexp=9405995%2C9407472%2C9408501%2C9408710%2C9410705%2C9414764%2C9416126%2C9416729%2C9417707%2C9418185%2C9418750%2C9419038%2C9419355%2C9419446%2C9421550%2C9421712%2C9421745%2C9421824%2C9422543&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=17&signature=5664E6E1545537FDA5DEE69480B9CF54A44BD617.CF892425E590F67F03B7BC12E68C8ED9AE570DDC&mime=video%2F3gpp&pl=25&source=youtube&key=yt6&nh=IgpwZjAxLm9yZDM1Kgw2NC44Ni4xMzcuMTc', '144p', 'No', 2328433, 'Transferring', '2015-10-28 07:48:22', '0000-00-00 00:00:00', '2015-10-28 07:48:49', '2015-10-28 07:48:18'),
(5, 1, 1, 1, '26bd0e72dc6f6db888c150fae01c0a30.3gp', '3gp', 'BMW M3 E46 vs Mitsubishi Galant VR-4', 215941, '', 'https://r5---sn-vgqs7nlz.googlevideo.com/videoplayback?requiressl=yes&lmt=1393834613564012&source=youtube&dur=21.733&signature=A1158DE1AB5F91BC05BF7E83270C8518700D6BAD.915368DCDF8E8C521E46D556B9166420348A2C3D&key=yt6&nh=IgpwcjA0Lm9yZDEyKg8xOTkuMjI5LjIzMS4yMzM&fexp=9405963%2C9408710%2C9409207%2C9413142%2C9414764%2C9416126%2C9416985%2C9417630%2C9417707%2C9418201%2C9418401%2C9422289%2C9422904%2C9422920%2C9423224%2C9423588&sver=3&upn=8fmjQ_3aojg&expire=1446040518&itag=17&pl=25&ip=107.182.226.169&ms=au&mt=1446018812&mv=m&id=faf52a3edcd85b37&mm=31&mn=sn-vgqs7nlz&mime=video%2F3gpp&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&initcwndbps=75000', '144p', 'No', 215941, 'Success', '2015-10-28 07:55:58', '0000-00-00 00:00:00', '2015-10-28 07:56:15', '2015-10-28 07:55:54'),
(6, 1, 1, 1, '24bb9e11bdb6a7d0697b1643cca21243.mp4', 'mp4', '&#x202b;کلیپ بشدت خنده دار بامزه ترین راننده تاکسی دنیا&#x202c;&lrm;', 2716527, '', 'https://r5---sn-tt17dn7y.googlevideo.com/videoplayback?ipbits=0&ratebypass=yes&fexp=9407052%2C9408710%2C9409126%2C9412538%2C9413010%2C9413209%2C9414764%2C9415821%2C9416126%2C9416729%2C9417707%2C9418145%2C9419444%2C9420309%2C9420540%2C9421667%2C9421942%2C9422284%2C9422428%2C9422455%2C9422596%2C9422768%2C9423292%2C9423429&upn=if4eprQIjPI&expire=1446163851&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&sver=3&itag=18&mm=31&mn=sn-tt17dn7y&id=o-AAwUt6mI9FBJYrUJ93RsaO9VZMpbGWFN6iRRWIjuC7cU&signature=59B9E000CA1B58184CFADD445801D1465FF39205.D1ABF1F0720C4E6C6C6D54C7F072B713EA7E4D35&key=yt6&ip=184.107.79.131&mt=1446141647&requiressl=yes&pl=22&source=youtube&mv=u&dur=58.955&lmt=1428045361675104&ms=au', '360p', 'No', 0, 'Failed', '2015-10-29 18:11:09', '0000-00-00 00:00:00', '2015-10-29 18:11:11', '2015-10-29 18:11:04'),
(7, 1, 1, 1, '434e66c7c6cbbf6648a142bdd04defea.3gp', '3gp', '&#x202b;کلیپ واقعا زیبای خنده دار ترین روضه خوانی در یک مجلس ترحیم&#x202c;&lrm;', 2443696, '', 'https://r11---sn-tt17dn7r.googlevideo.com/videoplayback?mime=video%2F3gpp&ipbits=0&requiressl=yes&dur=232.571&sver=3&ms=au&mt=1446141647&mv=u&itag=17&mm=31&signature=869003D8DDA10F0E50DCDBA2578CEC60EC6D3419.872F4A4EAF2788736B42395A88F8E93D47AF6432&mn=sn-tt17dn7r&key=yt6&fexp=9407116%2C9408210%2C9408710%2C9409208%2C9413139%2C9414764%2C9414875%2C9416126%2C9417707%2C9418201%2C9418204%2C9418750%2C9419407%2C9421605%2C9422596&id=o-AIUp9pwWmJtgL9_CZKP8jevmx1ZnGuIaFw_aTVpt-iSN&expire=1446163917&ip=184.107.79.131&lmt=1401463252130572&pl=22&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&upn=SB4_BqgDxoU', '144p', 'No', 0, 'Failed', '2015-10-29 18:12:18', '0000-00-00 00:00:00', '2015-10-29 18:12:21', '2015-10-29 18:12:16'),
(8, 1, 1, 1, '7660ddee9b3123a8595450f7e46499fe.3gp', '3gp', '&#x202b;کلیپ واقعا زیبای خنده دار ترین روضه خوانی در یک مجلس ترحیم&#x202c;&lrm;', 2443696, '', 'https://r11---sn-tt17dn7r.googlevideo.com/videoplayback?key=yt6&sver=3&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446169230&lmt=1401463252130572&mt=1446147067&upn=NuF4EZCtTnI&id=o-AKcdh5yH2eyflM9LHwpic4Ti-momcgeSrvAjPSsVYmpL&pl=22&dur=232.571&mime=video%2F3gpp&signature=A52844BD6A3C3EB9C38D3FC2124F6BC4B60D9E42.B51475B97965A88634F176964C4E3B1487680C4D&ms=au&source=youtube&mv=u&ipbits=0&mm=31&mn=sn-tt17dn7r&itag=17&ip=184.107.79.131&fexp=9408212%2C9408710%2C9409128%2C9414764%2C9415435%2C9416126%2C9417581%2C9417707%2C9418401%2C9418902%2C9419444%2C9421102%2C9421264%2C9421460%2C9421470%2C9422115%2C9422151%2C9422596', '144p', 'No', 0, 'Failed', '2015-10-29 19:40:49', '0000-00-00 00:00:00', '2015-10-29 19:40:52', '2015-10-29 19:40:43'),
(9, 1, 1, 1, '1356914176817ce9b1060002193686b4.3gp', '3gp', '&#x202b;کلیپ واقعا زیبای خنده دار ترین روضه خوانی در یک مجلس ترحیم&#x202c;&lrm;', 2443696, '', 'https://r11---sn-tt17dn7r.googlevideo.com/videoplayback?key=yt6&sver=3&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446169230&lmt=1401463252130572&mt=1446147067&upn=NuF4EZCtTnI&id=o-AKcdh5yH2eyflM9LHwpic4Ti-momcgeSrvAjPSsVYmpL&pl=22&dur=232.571&mime=video%2F3gpp&signature=A52844BD6A3C3EB9C38D3FC2124F6BC4B60D9E42.B51475B97965A88634F176964C4E3B1487680C4D&ms=au&source=youtube&mv=u&ipbits=0&mm=31&mn=sn-tt17dn7r&itag=17&ip=184.107.79.131&fexp=9408212%2C9408710%2C9409128%2C9414764%2C9415435%2C9416126%2C9417581%2C9417707%2C9418401%2C9418902%2C9419444%2C9421102%2C9421264%2C9421460%2C9421470%2C9422115%2C9422151%2C9422596', '144p', 'No', 2443696, 'Success', '2015-10-29 19:43:28', '0000-00-00 00:00:00', '2015-10-29 19:49:31', '2015-10-29 19:43:24'),
(10, 1, 1, 1, '324d020092ebb58cc376ea872310a274.3gp', '3gp', 'The most funny and Interesting videos .خنده دار ترین و جالب فیلم ها.', 907095, '', 'https://r9---sn-tt17dnee.googlevideo.com/videoplayback?fexp=9408502%2C9408710%2C9409128%2C9414764%2C9415869%2C9416126%2C9417206%2C9417707%2C9418204%2C9418401%2C9419446%2C9419972%2C9421686%2C9422323%2C9422596&ip=184.107.79.131&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&requiressl=yes&key=yt6&source=youtube&upn=DYP-5uN0I70&lmt=1429647348383292&expire=1446169831&itag=17&mn=sn-tt17dnee&ipbits=0&mm=31&signature=9C83925380A19BC65A3EF942FDD08354DB8F3EC6.763E5535A95B5D85A0CAE83CF874BB7AA7B1F831&ms=au&mime=video%2F3gpp&mv=u&mt=1446147909&pl=22&id=o-AHgr_OtHLRewl5nggAMJtP8fHrJqKpStJQazs1NoKdgO&dur=90.929', '144p', 'No', 907095, 'Transferring', '2015-10-29 19:53:20', '0000-00-00 00:00:00', '2015-10-29 19:54:36', '2015-10-29 19:51:01'),
(11, 1, 1, 1, 'cd45e0132d7f6091a2c1e61f94495350.3gp', '3gp', 'The most funny and Interesting videos .خنده دار ترین و جالب فیلم ها.', 907095, '', 'https://r9---sn-tt17dnee.googlevideo.com/videoplayback?fexp=9408502%2C9408710%2C9409128%2C9414764%2C9415869%2C9416126%2C9417206%2C9417707%2C9418204%2C9418401%2C9419446%2C9419972%2C9421686%2C9422323%2C9422596&ip=184.107.79.131&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&requiressl=yes&key=yt6&source=youtube&upn=DYP-5uN0I70&lmt=1429647348383292&expire=1446169831&itag=17&mn=sn-tt17dnee&ipbits=0&mm=31&signature=9C83925380A19BC65A3EF942FDD08354DB8F3EC6.763E5535A95B5D85A0CAE83CF874BB7AA7B1F831&ms=au&mime=video%2F3gpp&mv=u&mt=1446147909&pl=22&id=o-AHgr_OtHLRewl5nggAMJtP8fHrJqKpStJQazs1NoKdgO&dur=90.929', '144p', 'No', 907095, 'Success', '2015-10-29 19:58:31', '0000-00-00 00:00:00', '2015-10-29 19:59:23', '2015-10-29 19:58:29'),
(12, 1, 1, 1, '103e5ccebfa32b4ba166407af8ad9193.3gp', '3gp', 'Funny Persian Kid بچه های خنده دار فارسی', 1154093, '', 'https://r17---sn-tt17dnee.googlevideo.com/videoplayback?mime=video%2F3gpp&id=o-AHHwxgX7lU0uee0IeKEH9GJGe26aD7fttYuCoePLEn7p&itag=17&expire=1446171174&upn=B_KN_8h0VrA&lmt=1419556133133854&source=youtube&sver=3&ip=184.107.79.131&key=yt6&mn=sn-tt17dnee&mm=31&mv=u&pl=22&mt=1446149365&ms=au&ipbits=0&signature=08B41B9241592FCEAFD23C7140BA7865A4C050E3.8C90DFFD6E6E942535184F3ACADD236EDF20F797&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&fexp=9407116%2C9408710%2C9409205%2C9412913%2C9414764%2C9415436%2C9415942%2C9416126%2C9417707%2C9419355%2C9420434%2C9422121%2C9422596%2C9423419%2C9423569%2C9423591&dur=114.056', '144p', 'No', 1154093, 'Success', '2015-10-29 20:13:53', '0000-00-00 00:00:00', '2015-10-29 20:16:20', '2015-10-29 20:13:33'),
(20, 1, 1, 2, '2a4a2f422fda2d467eb24674510a3ca0.mp4', 'mp4', 'Iran', 5977907, '', 'https://vimeo.com/70734739/download?t=1446182298&v=186577029&s=070ae5fc062573337b9b271bc9ed0fa375341295c74e2cac2ea54a720c4d109f', '270p', 'No', 0, 'Failed', '2015-10-30 05:33:57', '0000-00-00 00:00:00', '2015-10-30 06:05:03', '2015-10-30 06:05:03'),
(21, 1, 1, 2, '264b2878bb2b2892557f4d9e57a6bfa2.mp4', 'mp4', 'به پيشواز بهار &ndash; ايستگاه خنده', 11420162, '', 'https://vimeo.com/122255220/download?t=1446185064&v=346294278&s=8e99ce360de0944b94106bece1419e4db578f716b2676de1b158a5c33829c9a8', '270p', 'No', 0, 'Failed', '2015-10-30 06:09:29', '0000-00-00 00:00:00', '2015-10-30 06:09:35', '2015-10-30 06:04:36'),
(22, 1, 1, 2, '8d3f93ee0e27a002c2745d7dca71eeb4.mp4', 'mp4', 'Novitec Torado Lamborghini Aventador', 8297057, '', 'https://vimeo.com/69088523/download?t=1446185270&v=173364195&s=04ccc3e1b451bfe513281993dbb53ac8ece93b667ca5c532405a327ae030e7b2:agent:Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/534.8 (KHTML, like Gecko) Chrome/7.0.521.0 Safari/534.8', '270p', 'No', 0, 'Failed', '2015-10-30 06:09:30', '0000-00-00 00:00:00', '2015-10-30 06:09:34', '2015-10-30 06:08:33'),
(23, 1, 1, 2, 'ed85b928d38ab2680214a399c4265854.mp4', 'mp4', 'Novitec Torado Lamborghini Aventador', 8297057, '', 'https://vimeo.com/69088523/download?t=1446185532&v=173364195&s=82b5f2203a422d361d670e4efd8429ef0020bb970171b87389265776382db53d:agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Ubuntu/11.10 Chromium/17.0.963.65 Chrome/17.0.963.65 Safari/535.11', '270p', 'No', 2500000, 'Failed', '2015-10-30 06:12:31', '0000-00-00 00:00:00', '2015-10-30 06:13:10', '2015-10-30 06:12:24'),
(24, 1, 1, 2, '3d160b6264228858c0b872c4d4d0a782.mp4', 'mp4', 'Lamborghini Aventador', 21169664, '', 'https://vimeo.com/29884449/download?t=1446185966&v=76155144&s=2b4bd23dc2f576c798b2dc3861d01f12cadc763c1e96594419e8cfa10625d588:agent:Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.3 Safari/532.1', '270p', 'No', 4000000, 'Failed', '2015-10-30 06:19:48', '0000-00-00 00:00:00', '2015-10-30 06:20:47', '2015-10-30 06:19:44'),
(25, 1, 1, 2, '5ed8d67baa18ece6c803fefa6ba23194.mp4', 'mp4', 'John Kim&#039;s Lamborghini Gallardo', 6631481, '', 'https://vimeo.com/50907057/download?t=1446186599&v=133196880&s=ae600c0803ca32b6b807e60acf0d9848c8aefba1ff6a8d4540304fed816f021f:agent:Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.11 Safari/534.16', '270p', 'No', 6631481, 'Transferring', '2015-10-30 06:30:18', '0000-00-00 00:00:00', '2015-10-30 06:31:29', '2015-10-30 06:30:14'),
(26, 1, 1, 2, '3899322f7683ba0e80d55880952f8500.mp4', 'mp4', 'John Kim&#039;s Lamborghini Gallardo', 6631481, '', 'https://vimeo.com/50907057/download?t=1446186907&v=133196880&s=3cdb410c9d3e33702de361d3b387e81f6bc9a350d6b6c3818ab14af869a17274:agent:Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.4 (KHTML, like Gecko) Chrome/4.0.237.0 Safari/532.4 Debian', '270p', 'No', 6631481, 'Success', '2015-10-30 06:37:01', '0000-00-00 00:00:00', '2015-10-30 06:38:18', '2015-10-30 06:35:59'),
(27, 1, 1, 2, 'c4624e6a39acaf2fa802513cfad7e522.mp4', 'mp4', 'John Kim&#039;s Lamborghini Gallardo', 6631481, '', 'https://vimeo.com/50907057/download?t=1446187001&v=133196880&s=eece5db9e51421567272d639fa55f4d7b62364c3d21c6e9ee6c335f50800dc5f:agent:Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/4.0.203.0 Safari/532.0', '270p', 'No', 0, 'Failed', '2015-10-30 06:37:01', '0000-00-00 00:00:00', '2015-10-30 11:46:47', '2015-10-30 06:36:56'),
(28, 1, 1, 2, '2084efef22d3fe32f12bca147d6a69b1.mp4', 'mp4', 'TopGear Lamborghini Hurac&aacute;n', 4514165, '', 'https://vimeo.com/118008757/download?t=1446188976&v=341931940&s=c979d181ebd72c202a46517d194ef773353a94718eebdfd78569bdeefd708bed:agent:Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/3.0.196.0 Safari/532.0', '270p', 'No', 4514165, 'Success', '2015-10-30 07:09:53', '0000-00-00 00:00:00', '2015-10-30 07:10:45', '2015-10-30 07:09:51'),
(29, 1, 1, 2, '23b70e46133849e845d8705329620d1e.mp4', 'mp4', 'Did you know?', 6855387, '', 'https://11-lvl3-pdl.vimeocdn.com/01/2408/4/112044213/308265994.mp4?expires=1446209413&token=0f0525bd28f6820dec854:separator:Mozilla/5.0 (Windows NT 5.1) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.700.3 Safari/534.24:separator:clip_test2=1; vuid=2011273420.130508722', '270p', 'No', 0, 'Failed', '2015-10-30 11:46:41', '0000-00-00 00:00:00', '2015-10-30 11:46:49', '2015-10-30 11:46:31'),
(30, 1, 1, 2, 'f1392750ca75245bbda4c65e93aaf977.mp4', 'mp4', 'Did you know?', 6855387, '', 'https://11-lvl3-pdl.vimeocdn.com/01/2408/4/112044213/308265994.mp4?expires=1446209542&token=01aac675bad4745611184:separator:Mozilla/5.0 (X11; Linux i686) AppleWebKit/534.33 (KHTML, like Gecko) Ubuntu/9.10 Chromium/13.0.752.0 Chrome/13.0.752.0 Safari/534.33:separator:clip_test2=1; vuid=965304086.721238602', '270p', 'No', 6855387, 'Success', '2015-10-30 11:47:36', '0000-00-00 00:00:00', '2015-10-30 11:48:40', '2015-10-30 11:47:33'),
(31, 1, 1, 2, '8384760a4dff1cabc052f9d9a8c400d3.mp4', 'mp4', 'Did you know?', 10437538, '', 'https://10-lvl3-pdl.vimeocdn.com/01/3479/3/92398854/246005189.mp4?expires=1446209455&token=01816cbc7b67dc3105bf5:separator:Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/4.0.206.0 Safari/532.0:separator:clip_test2=1; vuid=469236251.1822799976', '720p', 'No', 10437538, 'Success', '2015-10-30 11:49:20', '0000-00-00 00:00:00', '2015-10-30 11:56:55', '2015-10-30 11:49:16'),
(32, 1, 1, 2, '9f401028fb8913f80eb1e330caef05a6.mp4', 'mp4', 'Did you know?', 2786054, '', 'https://pdlvimeocdn-a.akamaihd.net/69395/645/227356544.mp4?token2=1446210828_54898350fb9bafa36606c311e007535d&aksessionid=49dfba8aeafb6a00:separator:Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.860.0 Safari/535.2:separator:clip_test2=1; vuid=923080657.52895576', '360p', 'No', 2786054, 'Success', '2015-10-30 12:10:37', '0000-00-00 00:00:00', '2015-10-30 12:12:46', '2015-10-30 12:08:59'),
(33, 1, 1, 1, 'eae63127e3ca5d4602c3a3f20fcc5fe8.3gp', '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-p5qlsn7e.googlevideo.com/videoplayback?ipbits=0&upn=NjI_vpZOvMY&key=yt6&fexp=9407169%2C9408136%2C9408505%2C9408710%2C9414764%2C9415872%2C9416126%2C9416359%2C9416494%2C9417707%2C9418204%2C9418356%2C9421764%2C9422285%2C9422596%2C9422991%2C9423040%2C9423166%2C9423290%2C9423430&itag=17&dur=114.660&signature=684C49657D3E8148FFE76EC6D3DAD5C12DD0D4E1.72F275A279537AA8D63E86055F6DEEC8F3F51803&initcwndbps=611250&sver=3&nh=IgpwZjAxLmlhZDI2KgwyMDkuNDguNDIuODU&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1431268025409631&source=youtube&mm=31&mn=sn-p5qlsn7e&pl=25&requiressl=yes&ip=107.182.226.168&mime=video%2F3gpp&expire=1446290508&id=c5b70326fccacd09&ms=au&mt=1446268792&mv=m', '144p', 'No', 1158879, 'Success', '2015-10-31 05:22:02', '0000-00-00 00:00:00', '2015-10-31 05:22:42', '2015-10-31 05:22:00'),
(34, 1, 1, 1, '5089442f751437cc177074a78eb3d165.3gp', '3gp', '600HP Lancer EVO IX Launch Control 0-270km/h', 1014709, 'https://www.youtube.com/watch?v=eI-oAH53f1I', 'https://r8---sn-p5qlsn7s.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwZjAxLmlhZDI2Kgs3Ny42Ny43MS43Nw&source=youtube&upn=9tbeuc6RO9A&signature=0F25597B7FB99F1C21C0597345B5F941A6C687D4.08C9CF1E5B48888E92C8F970816891BF89293850&itag=17&lmt=1411442800566944&key=yt6&ipbits=0&pl=25&mime=video%2F3gpp&id=788fa8007e777f52&mn=sn-p5qlsn7s&mm=31&ms=au&mv=m&mt=1446269214&requiressl=yes&ip=107.182.226.168&initcwndbps=827500&dur=98.034&expire=1446290852&fexp=9406009%2C9408710%2C9412928%2C9413138%2C9414764%2C9416126%2C9416837%2C9417223%2C9417707%2C9418164%2C9418200%2C9418401%2C9419445%2C9421109%2C9421146%2C9421911%2C9422299%2C9422596%2C9423606&sver=3', '144p', 'No', 1014709, 'Success', '2015-10-31 05:28:09', '0000-00-00 00:00:00', '2015-10-31 05:28:47', '2015-10-31 05:28:05');

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
  KEY `purchase_id` (`purchase_id`),
  KEY `dates` (`deleted_at`,`modified_at`,`created_at`)
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
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `price` (`price`)
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
  KEY `user_Id` (`user_Id`),
  KEY `dates` (`created_at`)
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
  KEY `user_id` (`user_id`),
  KEY `gateway` (`gateway`),
  KEY `status` (`status`),
  KEY `dates` (`deleted_at`,`modified_at`,`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `package_id`, `amount`, `gateway`, `key`, `params`, `status`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 1, 1000, 'Payline', '8227715', '', 'Cancelled', '0000-00-00 00:00:00', '2015-10-29 14:28:43', '2015-10-29 14:28:28'),
(2, 1, 1, 1000, 'Payline', '8227724', '8660822', 'Success', '0000-00-00 00:00:00', '2015-10-29 14:29:32', '2015-10-29 14:28:56'),
(3, 1, 1, 1000, 'Payline', '8227764', '', 'Success', '0000-00-00 00:00:00', '2015-10-29 16:13:44', '2015-10-29 14:32:01'),
(4, 1, 1, 1000, 'Payline', '8227790', '8660891', 'Success', '0000-00-00 00:00:00', '2015-10-29 14:34:00', '2015-10-29 14:33:30'),
(5, 1, 1, 1000, 'Payline', '8231717', '', 'Cancelled', '0000-00-00 00:00:00', '2015-10-29 20:18:17', '2015-10-29 20:17:59');

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
  KEY `user_id` (`user_id`),
  KEY `dates` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

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
(13, 1, 'c7b3b79c4cc48e6f84e001c4736d29bd', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-29 14:34:00'),
(14, 1, 'd4a611fba95ccfdc9d83647f71f21d85', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-29 16:33:13'),
(15, 1, '7d7ee7ea08687e899384660cc15ddcbc', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-10-29 16:40:34');

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
  KEY `user_id` (`user_id`),
  KEY `dates` (`created_at`)
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
  KEY `quota` (`quota`,`used`,`remain`),
  KEY `dates` (`deleted_at`,`modified_at`,`created_at`),
  KEY `enable` (`enable`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `link`, `hostname`, `port`, `username`, `password`, `quota`, `used`, `remain`, `enable`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'http://localhost/files/', 'localhost', 22, 'sharif', 'BAaQ3VYvYE7PlbRwwbXe3g/0PTQAKRANHd8ch4siISXhakKokvhY4aJuG1EWEwKNBxAtWO0z/ongzqbt75T4KA==', 2000000000, 114593509, 1885406491, 'Yes', '0000-00-00 00:00:00', '2015-10-31 05:28:05', '0000-00-00 00:00:00');

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
  KEY `user_id` (`user_id`),
  KEY `ip_address` (`ip_address`),
  KEY `dates` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

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
(23, 1, '127.0.0.1', '2015-10-29 14:34:00'),
(24, 1, '127.0.0.1', '2015-10-29 16:33:13'),
(25, 1, '127.0.0.1', '2015-10-29 16:40:34');

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
  KEY `status` (`status`),
  KEY `dates` (`modified_at`,`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `title`, `status`, `modified_at`, `created_at`) VALUES
(1, 2, 'مشکل ویمئو', 'Replay', '2015-10-30 17:08:49', '2015-10-30 16:04:07');

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
  KEY `user_id` (`user_id`),
  KEY `dates` (`modified_at`,`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ticket_replays`
--

INSERT INTO `ticket_replays` (`id`, `ticket_id`, `user_id`, `content`, `modified_at`, `created_at`) VALUES
(1, 1, 2, 'سلام\r\nتست\r\nتشکر', '2015-10-30 16:04:07', '2015-10-30 16:04:07'),
(2, 1, 1, 'آقا جان این تست شده است\r\nبرو عمویی', '2015-10-30 17:06:45', '2015-10-30 17:06:45'),
(3, 1, 1, 'جواب گرفتی دیگه', '2015-10-30 17:07:49', '2015-10-30 17:07:49'),
(4, 1, 1, 'خوب اینم قسمت پشتیبانی\r\nخسته نباشی برادر', '2015-10-30 17:08:49', '2015-10-30 17:08:49');

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
  KEY `quota` (`quota`,`used`,`remain`),
  KEY `dates` (`deleted_at`,`modified_at`,`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'm.reza.maghool@gmail.com', '$2a$08$j941zyDVtc6XJOhTIvwMDOj/GAbN350yaXyH1f76OdUjWwHw4KVhq', 'Admin', 'محمدرضا معقول', 'm69', NULL, 40485760000, 49564074, 40436195926, '0000-00-00 00:00:00', '2015-10-31 05:28:09', '2015-10-23 08:25:20'),
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
  UNIQUE KEY `name` (`name`),
  KEY `domains` (`domains`(255))
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
