-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 07, 2015 at 04:33 PM
-- Server version: 5.6.12
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shariftube`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `created_at`) VALUES
(1, 'راه اندازی پشتیبانی از Vimeo', 'به استحضار می رساند از این پس از ویدئو های سایت Vimeo نیز پشتیبانی می شود.', '2015-11-05 18:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_logins`
--

CREATE TABLE `failed_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` char(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `website_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` enum('flv','mp4','webm','3gp') NOT NULL,
  `label` varchar(255) NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `uri` varchar(255) NOT NULL,
  `link` varchar(2048) NOT NULL,
  `quality` enum('144p','240p','270p','360p','480p','720p','1080p','2160p','3072p','4320p') NOT NULL,
  `is_3d` enum('No','Yes') NOT NULL DEFAULT 'No',
  `fetched` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('Waiting','InProgress','Transferring','Failed','Success') NOT NULL DEFAULT 'Waiting',
  `locked_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 2, 1, 'ef837a29db3aa7f40420a02648c13989.3gp', '3gp', 'Maz Jobrani - Persian Cat (from Axis of Evil)', 2689838, 'https://www.youtube.com/watch?v=WwHOBJoASsM', 'https://r5---sn-5hnedner.googlevideo.com/videoplayback?nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&requiressl=yes&ipbits=0&mime=video%2F3gpp&pl=19&expire=1446753597&mm=31&initcwndbps=1077500&ip=176.9.235.198&key=yt6&mn=sn-5hnedner&signature=7E24CBF84C73393ECE51E553B32BBD75A9F47CBC.0A7A64FC018F9CD43E2445900F9D92B6BF8D5EDA&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=m&mt=1446731889&ms=au&id=o-ABVwGKIo6DNWZF6XuCUZen5UYjsNY7M8YKqGCZJoKISU&lmt=1386394021755606&source=youtube&sver=3&dur=261.131&fexp=9406994%2C9408710%2C9414733%2C9414764%2C9416126%2C9417097%2C9417683%2C9417707%2C9418017%2C9418959%2C9419444%2C9421111%2C9421461%2C9421620%2C9422352%2C9422596%2C9422618%2C9422676%2C9423510%2C9423663%2C9423739%2C9423789&itag=17&upn=Na4zu3xKcbA', '144p', 'No', 2689838, 'Success', '2015-11-05 19:00:08', '0000-00-00 00:00:00', '2015-11-05 19:09:07', '2015-11-05 19:00:04'),
(2, 2, 2, 1, '23657f221a29b727222f43de6b8357c5.webm', 'webm', 'Let''s play Counter Strike GO#2 (کانتر استریک) [Farsi] [HD]', 33087804, 'http://www.youtube.com/watch?v=1WvTscvh08Q', 'https://r4---sn-5hnedn7s.googlevideo.com/videoplayback?ip=176.9.235.198&itag=43&lmt=1395681835631798&requiressl=yes&id=o-AI5xh1FbyHkQ108VfZr5I4jgGxt1UfKvQiXbfYsp8JNm&source=youtube&dur=0.000&fexp=9405349%2C9408710%2C9413011%2C9413121%2C9414764%2C9415414%2C9415516%2C9416126%2C9417299%2C9417683%2C9417707%2C9418401%2C9419444%2C9420652%2C9421026%2C9421463%2C9422596%2C9422618%2C9423420%2C9423510%2C9423663%2C9423789&key=yt6&mn=sn-5hnedn7s&mm=31&mv=m&pl=19&mt=1446740043&ms=au&signature=74C0D17F5E0C9D4AA2A516EACF5957F30E9B51B3.C9D8C932FE2EA998B1475F51F95FC5FCE94B6B27&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&mime=video%2Fwebm&upn=3bzvGjZ074U&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&initcwndbps=2116250&ipbits=0&ratebypass=yes&expire=1446761706', '360p', 'No', 33087804, 'Success', '2015-11-05 21:15:19', '0000-00-00 00:00:00', '2015-11-05 21:17:00', '2015-11-05 21:15:17'),
(3, 2, 2, 1, '2334027fbe6345cf1984a7483a46a89a.mp4', 'mp4', 'Leonard Cohen - Dance Me to the End of Love', 65812211, 'https://www.youtube.com/watch?v=5_j4f0HiEh0', 'https://r1---sn-5hne6n7e.googlevideo.com/videoplayback?id=o-ALywv0U6TZVgRewv_N7FJDZeJYON0wXGcGsagTBqTgxN&signature=3D3AFCBED706AF00DA181B6386BD05C029DD6634.C64E36859B22CF52454AE52CBF4B76EB5032A748&ms=au&upn=tiSrbGxnujc&mv=u&mt=1446756002&pl=24&expire=1446777751&mn=sn-5hne6n7e&mm=31&ip=176.9.235.198&requiressl=yes&source=youtube&ipbits=0&lmt=1394298941702773&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418200%2C9418999%2C9421025%2C9422342%2C9422381%2C9422565%2C9422596%2C9422618%2C9422967%2C9423662%2C9423790&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&dur=387.123&ratebypass=yes&sver=3&itag=22&key=yt6&mime=video%2Fmp4', '720p', 'No', 65812211, 'Success', '2015-11-06 01:42:39', '0000-00-00 00:00:00', '2015-11-06 01:46:11', '2015-11-06 01:42:36'),
(4, 1, 2, 1, '02143fab2f791820393ad8a085ee90e8.mp4', 'mp4', '‫شهاب عباسی : دربی ما تراختوره‬‎', 3301312, 'http://www.youtube.com/watch?v=CU0K_51zoN8', 'https://r19---sn-5hne6n7d.googlevideo.com/videoplayback?lmt=1333794541320255&itag=18&fexp=9407538%2C9408710%2C9414764%2C9415387%2C9416126%2C9417203%2C9417683%2C9417707%2C9419838%2C9420540%2C9421409%2C9421734%2C9422596%2C9422618%2C9422753%2C9423294%2C9423510%2C9423662%2C9423790&ipbits=0&upn=7FWFdQ3rZRQ&ratebypass=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&source=youtube&signature=B1E98027E3A3F9F8B5B863B309B0F7273CE9D753.9555948903BE4D834E4B80073AA05DFC4F657509&key=yt6&sver=3&expire=1446824111&mime=video%2Fmp4&id=o-AOEAEYdBaqlCOrUrtgxyEjjKxxD04EyxME9B_-MM3NF-&dur=69.729&mt=1446802123&pl=24&mv=u&ms=au&requiressl=yes&mm=31&ip=176.9.235.198&mn=sn-5hne6n7d&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire', '360p', 'No', 3301312, 'Success', '2015-11-06 19:51:01', '0000-00-00 00:00:00', '2015-11-06 19:51:35', '2015-11-06 14:35:23'),
(5, 1, 3, 1, 'c74b80e0a17b8392dc26f6594dbbccb3.mp4', 'mp4', 'Maz Jobrani', 14171127, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ADDWCgn9kbNgAZAmnKF-dkg3TSBfR2UsD69zsGOCx6zH&upn=VB2DupXQZNg&mn=sn-5hne6n7d&mm=31&source=youtube&ms=au&fexp=9407052%2C9407473%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418400%2C9421341%2C9422596%2C9422618%2C9422910%2C9423470%2C9423509%2C9423662%2C9423789&mv=u&mt=1446811238&dur=319.599&ipbits=0&sver=3&key=yt6&itag=18&mime=video%2Fmp4&signature=2BAF8CB203F6193BF825F3EF7E96415161704CF8.D366841D27F6F90670DF80CF9521B7235FD70F02&lmt=1394254337309290&expire=1446832996&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ratebypass=yes&requiressl=yes&pl=24', '360p', 'No', 14171127, 'Success', '2015-11-06 20:33:23', '0000-00-00 00:00:00', '2015-11-06 20:34:14', '2015-11-06 20:33:22'),
(6, 1, 2, 1, 'b304d3303e04bb70794b3f35a5dd985d.mp4', 'mp4', 'Maz Jobrani', 14171127, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ADDWCgn9kbNgAZAmnKF-dkg3TSBfR2UsD69zsGOCx6zH&upn=VB2DupXQZNg&mn=sn-5hne6n7d&mm=31&source=youtube&ms=au&fexp=9407052%2C9407473%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418400%2C9421341%2C9422596%2C9422618%2C9422910%2C9423470%2C9423509%2C9423662%2C9423789&mv=u&mt=1446811238&dur=319.599&ipbits=0&sver=3&key=yt6&itag=18&mime=video%2Fmp4&signature=2BAF8CB203F6193BF825F3EF7E96415161704CF8.D366841D27F6F90670DF80CF9521B7235FD70F02&lmt=1394254337309290&expire=1446832996&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ratebypass=yes&requiressl=yes&pl=24', '360p', 'No', 14171127, 'Success', '2015-11-06 20:45:25', '0000-00-00 00:00:00', '2015-11-06 20:46:37', '2015-11-06 20:45:25'),
(7, 2, 3, 1, '0312e61ba21d8f57e1f2b10048a7ff83.webm', 'webm', 'Leonard Cohen - 1968 BBC Broadcasts', 271532178, 'https://www.youtube.com/watch?v=PkU72NJBtr4', 'https://r7---sn-5hne6nez.googlevideo.com/videoplayback?ms=au&mt=1446818260&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198&requiressl=yes&fexp=9406444%2C9407642%2C9408490%2C9408710%2C9412927%2C9413128%2C9414764%2C9416126%2C9416837%2C9417203%2C9417683%2C9417707%2C9419445%2C9420453%2C9422596%2C9422618%2C9422673%2C9422797%2C9423231%2C9423290%2C9423488%2C9423662%2C9423714%2C9423791&id=o-ADDKNvD7G6h3qQClRooU23kwj6TkNdxEbvshUg7V9xYF&pl=24&mm=31&mn=sn-5hne6nez&source=youtube&upn=E-Tu0sNT1Ag&lmt=1432522953585309&mime=video%2Fwebm&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=8B79F170F0D7220D5CD77B12D4BBDC3FAC1493E3.1BBBE6BF069ED16BACFB89C9E9EB62D7B792362F&itag=43&ratebypass=yes&expire=1446840274&sver=3&ipbits=0&dur=0.000', '360p', 'No', 271532178, 'Success', '2015-11-06 14:04:51', '0000-00-00 00:00:00', '2015-11-06 14:15:06', '2015-11-06 14:04:47'),
(8, 4, 3, 1, '46dec160b294982da31bbe4f4fe8f588.mp4', 'mp4', 'UIkit web framework #4: Building a one pager website.', 52503840, 'http://www.youtube.com/watch?v=AY1_hiboFg0', 'https://r6---sn-5hne6n7s.googlevideo.com/videoplayback?signature=99A3505EFACF23808BAAE1BFF32F2DC1049F3413.13CB5562B2DCEFB9B20732B5DAC72058BCA18DE3&requiressl=yes&ipbits=0&sver=3&id=o-ANRQFCaPUFnBazwN2UsykIs8UxGBR8JIgm_T7OIoSAkr&fexp=9408505%2C9408710%2C9409205%2C9414703%2C9414764%2C9415822%2C9416126%2C9416778%2C9417353%2C9417683%2C9417707%2C9419487%2C9420453%2C9420482%2C9421605%2C9421764%2C9422397%2C9422596%2C9422618%2C9423643%2C9423662%2C9423793&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ip=176.9.235.198&key=yt6&lmt=1441173723728754&dur=433.748&ratebypass=yes&source=youtube&pl=24&mime=video%2Fmp4&expire=1446841182&mn=sn-5hne6n7s&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=kd8nRwoLYcc&ms=au&itag=22&mv=u&mt=1446819525', '720p', 'No', 52503840, 'Success', '2015-11-06 14:21:39', '0000-00-00 00:00:00', '2015-11-06 14:24:03', '2015-11-06 14:21:38'),
(9, 2, 3, 1, 'd4c94ee59ab357ef0803e9fd39164fee.webm', 'webm', '‫فردا تو می‌آیی/ هوشمند عقیلی‬‎', 21590345, 'http://www.youtube.com/watch?v=QL6_yQHGoUQ', 'https://r2---sn-5hne6nel.googlevideo.com/videoplayback?gcr=de&mime=video%2Fwebm&pl=24&itag=43&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9407707%2C9408376%2C9408710%2C9409207%2C9410706%2C9414732%2C9414764%2C9416126%2C9417683%2C9417707%2C9419838%2C9420453%2C9421710%2C9421745%2C9422456%2C9422483%2C9422555%2C9422596%2C9422618%2C9422951%2C9423291%2C9423510%2C9423662%2C9423792&sparams=dur%2Cgcr%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&upn=44icgfVR_74&signature=7B953A8993AB279AC8A4140911E3199B00AF7579.9617FFC2A51F558C4885E834330DD638754183F9&sver=3&key=yt6&ip=176.9.235.198&lmt=1395503047842970&dur=0.000&expire=1446855748&source=youtube&id=o-AJMVS8s4rHxVmFsM2jOcaJofSgPIqhi6s39IeWyAFxVB&ratebypass=yes&mm=31&mn=sn-5hne6nel&mt=1446833806&mv=u&ms=au&requiressl=yes', '360p', 'No', 21590345, 'Success', '2015-11-06 18:22:45', '0000-00-00 00:00:00', '2015-11-06 18:23:54', '2015-11-06 18:22:44'),
(10, 2, 3, 1, '2eeeefc1c7517cd2a1182871384cbe67.webm', 'webm', 'Ritual De Amor (Desire)-live Yanni Voices-Ender Thomas', 30014334, 'https://www.youtube.com/watch?v=MrdjnstXi2A', 'https://r13---sn-5hne6n7k.googlevideo.com/videoplayback?source=youtube&signature=7E9BF47F62E2CB69504575A66DC8B8C329ED48F3.689F4E95923180BCE9A4422C29C82C9677298713&mv=u&mt=1446834280&ms=au&fexp=9408509%2C9408710%2C9408891%2C9413317%2C9414764%2C9416126%2C9417353%2C9417683%2C9417707%2C9418751%2C9418899%2C9420453%2C9421173%2C9422141%2C9422596%2C9422618%2C9422675%2C9423488%2C9423513%2C9423662%2C9423793&pl=24&mn=sn-5hne6n7k&mm=31&ip=176.9.235.198&dur=0.000&requiressl=yes&id=o-AIDGWZB1pZ74w0SWlzFuh4fUZFa-pDl15L7Ee2FaOaOt&ratebypass=yes&key=yt6&itag=43&mime=video%2Fwebm&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446856339&ipbits=0&sver=3&lmt=1298510914499500&upn=U-lOyDSkBYI', '360p', 'No', 30014334, 'Success', '2015-11-06 18:32:37', '0000-00-00 00:00:00', '2015-11-06 18:34:18', '2015-11-06 18:32:36'),
(11, 2, 3, 1, 'aec65e2207fcfcb88a7bf229f75ca1ae.mp4', 'mp4', 'Ebi & Shadmehr - Ye Dokhtar OFFICIAL VIDEO HD', 64898727, 'https://www.youtube.com/watch?v=_-pqp8kA64Y', 'https://r1---sn-5hne6n7l.googlevideo.com/videoplayback?ms=au&mv=u&mt=1446834954&requiressl=yes&ratebypass=yes&mn=sn-5hne6n7l&mm=31&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421018%2C9421409%2C9422596%2C9422618%2C9423662&mime=video%2Fmp4&pl=24&itag=22&upn=5pIvWnXoqug&signature=BA72C65EB06A86C7397C268D0007B2F05C3ECEDD.8E3B3935E6C33CE554A52E3FD9655AF9C7D69C2D&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&id=o-AJuzJe5j3HfP8k9yN_fhcV0bzRStNkq0bcVRAdR_ln3_&sver=3&expire=1446856755&dur=327.587&lmt=1429608164412149&key=yt6&ip=176.9.235.198', '720p', 'No', 64898727, 'Success', '2015-11-06 18:39:34', '0000-00-00 00:00:00', '2015-11-06 18:42:11', '2015-11-06 18:39:31'),
(12, 2, 3, 1, '965395ef827b107248ca1d3b379ea632.mp4', 'mp4', 'Shadmehr Aghili - Entekhab OFFICIAL VIDEO HD', 59772572, 'https://www.youtube.com/watch?v=T3pBOfMjQIw', 'https://r3---sn-5hne6n7l.googlevideo.com/videoplayback?mn=sn-5hne6n7l&pl=24&mm=31&requiressl=yes&dur=258.739&id=o-AEhb6TMeIg2MOHNPwctmSAuM1YCj93_ut1TWXv3F8wZm&mv=u&itag=22&mt=1446834954&fexp=9408086%2C9408710%2C9412526%2C9414764%2C9416126%2C9417683%2C9417690%2C9417707%2C9418204%2C9418999%2C9419445%2C9420453%2C9420539%2C9421166%2C9421252%2C9421712%2C9422300%2C9422506%2C9422596%2C9422618%2C9422994%2C9423431%2C9423662%2C9423791&ms=au&source=youtube&ip=176.9.235.198&sver=3&lmt=1431937295931931&expire=1446856972&ipbits=0&ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=04F4063CBF643B857738DD54F1E1BA3517550EC4.65CF44F446888E6ADC7EADA983C2816380C2971C&key=yt6&mime=video%2Fmp4&upn=I-bLnN0hjH8', '720p', 'No', 59772572, 'Success', '2015-11-06 18:43:01', '0000-00-00 00:00:00', '2015-11-06 18:45:39', '2015-11-06 18:42:59'),
(13, 2, 3, 1, '0d7fa914914d78e7789fe17ad617f1dd.mp4', 'mp4', '‫شادمهر عقیلی عادت‬‎', 11068186, 'https://www.youtube.com/watch?v=GM3_gTeKx-U', 'https://r1---sn-5hne6nl7.googlevideo.com/videoplayback?mn=sn-5hne6nl7&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=XwKPbxqq_rc&itag=18&ms=au&mv=u&mt=1446834954&pl=24&mime=video%2Fmp4&expire=1446857087&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&key=yt6&lmt=1407718623294659&dur=253.352&source=youtube&ratebypass=yes&signature=8A89B7B3F028D189F933638838084B866802C359.D0CC631B089ACB5270AB52148B5DE8A8680920DA&requiressl=yes&ipbits=0&ip=176.9.235.198&sver=3&id=o-AAx5v5550wrcKBPj-OYKe3qsce5UnYyqoLpBB0DQFWCX&fexp=9407478%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662', '360p', 'No', 11068186, 'Success', '2015-11-06 18:45:04', '0000-00-00 00:00:00', '2015-11-06 18:46:25', '2015-11-06 18:45:03'),
(14, 2, 3, 1, '7f15ca2e6e85e5b57689de1843925c02.webm', 'webm', 'Shadmehr Aghili Adat شادمهر عادت', 24165664, 'https://www.youtube.com/watch?v=Q5kdb8xZxhE', 'https://r3---sn-5hne6ner.googlevideo.com/videoplayback?fexp=9406819%2C9408710%2C9412777%2C9414764%2C9416126%2C9417683%2C9417707%2C9418204%2C9418997%2C9419444%2C9420175%2C9420453%2C9420481%2C9421252%2C9421931%2C9421944%2C9422567%2C9422596%2C9422618%2C9423315%2C9423472%2C9423489%2C9423510%2C9423662%2C9423790%2C9424114&sver=3&id=o-ADYn-FF0LpleH-AP-f3x-IYq_hqNLk_HdDFjVSiGK5HO&requiressl=yes&ipbits=0&signature=4EC409447D8473E7D4577AD543089189BDFE16F4.0DAB1BC84B6451F5B17132AE2ABA00D6CB000EAC&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=cp_p8jWKkrk&mv=m&mt=1446835716&ms=au&itag=43&initcwndbps=353750&mn=sn-5hne6ner&mm=31&expire=1446857428&pl=24&mime=video%2Fwebm&key=yt6&dur=0.000&ratebypass=yes&source=youtube&lmt=1392375607514656&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ip=176.9.235.198', '360p', 'No', 24165664, 'Success', '2015-11-06 18:50:43', '0000-00-00 00:00:00', '2015-11-06 18:52:06', '2015-11-06 18:50:39'),
(15, 2, 3, 1, 'e5a1753659c937ec57b26e3a7cbc032d.webm', 'webm', 'What is love - Jim Carrey', 12976156, 'https://www.youtube.com/watch?v=3ATggIrOjkY', 'https://r3---sn-5hne6nl7.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1353764964694837&pcm2=no&dur=0.000&signature=5C7232377D014691B234ABB5B47FAE1A3C18CC78.C66265F461AAA389DBCBABD016B6C79506D8EC1D&sver=3&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&ratebypass=yes&ipbits=0&upn=4kiocd1s6n8&key=yt6&fexp=9407051%2C9407156%2C9408710%2C9414764%2C9415327%2C9416126%2C9417683%2C9417707%2C9418203%2C9420453%2C9421354%2C9422151%2C9422482%2C9422596%2C9422618%2C9423291%2C9423662%2C9423667%2C9423793%2C9423939%2C9423992&itag=43&mm=31&source=youtube&pl=24&mn=sn-5hne6nl7&requiressl=yes&mime=video%2Fwebm&ip=176.9.235.198&expire=1446857950&id=o-AEFCz3LRRGwxCIKWhXoptePtJi3iWvFF1xa5ePc6Evag&ms=au&mt=1446836105&mv=u', '360p', 'No', 12976156, 'Success', '2015-11-06 18:59:40', '0000-00-00 00:00:00', '2015-11-06 19:00:24', '2015-11-06 18:59:37'),
(16, 2, 3, 1, '3fedb4114efcf26e4a6cdf8c3daa48dd.webm', 'webm', '‫بهترین های داریوش ٢‬‎', 129307690, 'https://www.youtube.com/watch?v=S7uF9XdsLfU', 'https://r11---sn-5hne6nes.googlevideo.com/videoplayback?sver=3&requiressl=yes&ratebypass=yes&itag=43&lmt=1404084833820293&dur=0.000&expire=1446858098&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9408507%2C9408710%2C9409205%2C9412927%2C9414764%2C9415515%2C9416126%2C9416495%2C9416984%2C9417206%2C9417683%2C9417707%2C9418355%2C9418400%2C9420453%2C9421708%2C9422562%2C9422596%2C9422618%2C9423299%2C9423429%2C9423493%2C9423509%2C9423662%2C9423789&mime=video%2Fwebm&key=yt6&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mm=31&mn=sn-5hne6nes&id=o-APg4OsoJD8nYleBs9_FpAXgqnOPsr-6__ko96Jf88M35&mt=1446836105&mv=u&ms=au&source=youtube&signature=7790598540459F2A2FCD9711F40ABB19C0D1CD26.445FF22CBC87A6E4E6D178AF03C6258B99F51EA0&ip=176.9.235.198&pl=24&ipbits=0&upn=hXC0Wp8lxvQ', '360p', 'No', 129307690, 'Success', '2015-11-06 19:01:49', '0000-00-00 00:00:00', '2015-11-06 19:06:32', '2015-11-06 19:01:46'),
(17, 2, 3, 1, 'f80ca8030e89043a41d737a8fa68e28c.webm', 'webm', 'P1-Enghelab 57-Revayati Digar', 35704150, 'http://www.youtube.com/watch?v=tbBC8S7h3Oc', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?requiressl=yes&itag=43&fexp=9408710%2C9412538%2C9414702%2C9414764%2C9416126%2C9417055%2C9417683%2C9417707%2C9418400%2C9420453%2C9421411%2C9422596%2C9422618%2C9423429%2C9423510%2C9423662%2C9423790%2C9423859&ip=176.9.235.198&ms=au&mv=u&mt=1446836725&source=youtube&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ACXbfGEKFBmgzMf8m34AaO73p11b91SwZhBgDPw82Ps0&signature=7BEBA0D21910EFC9D7B4C15970B88AA84706A8DE.AB4F25438197ED393C0BE4991B40B25D3F18EEC4&mime=video%2Fwebm&upn=LI8Yt9Lcd7E&dur=0.000&ratebypass=yes&expire=1446858795&lmt=1328622924874267&pl=24&ipbits=0&mn=sn-5hne6n7s&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mm=31&key=yt6', '360p', 'No', 35704150, 'Success', '2015-11-06 19:13:28', '0000-00-00 00:00:00', '2015-11-06 19:15:11', '2015-11-06 19:13:26'),
(18, 2, 3, 1, '2da90f453e7a9de5b352dcb80505d9b9.webm', 'webm', 'Falcão | The Best Player of World Futsal | Skills & Goals & Tricks ᴴᴰ', 20737425, 'https://www.youtube.com/watch?v=k9MlN2xxDyI', 'https://r1---sn-5hne6n7e.googlevideo.com/videoplayback?signature=06D827E139EC97A246A849FA864226378A7B6423.D7F6D9BA3AF3BCA1EC40711D9A41503D1C473480&source=youtube&ratebypass=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&upn=g0hX9Qs_PmI&ipbits=0&fexp=9407181%2C9408710%2C9410706%2C9414764%2C9415822%2C9416126%2C9416481%2C9417683%2C9417707%2C9418201%2C9418204%2C9420017%2C9420453%2C9421167%2C9421584%2C9422382%2C9422484%2C9422596%2C9422618%2C9422675%2C9423662%2C9423789&lmt=1396350685736536&mn=sn-5hne6n7e&mm=31&ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&mv=u&mt=1446849937&ms=au&requiressl=yes&mime=video%2Fwebm&dur=0.000&id=o-AMHiJogabcsZTYv4qHw3veiSZmBDRg31PxtYgXOTd2SV&itag=43&expire=1446872158&sver=3&key=yt6', '360p', 'No', 20737425, 'Success', '2015-11-06 22:56:11', '0000-00-00 00:00:00', '2015-11-06 23:20:59', '2015-11-06 22:56:09'),
(19, 4, 2, 1, '40e0d1d876932d68eccebdf62fd5333e.mp4', 'mp4', 'Mobile GUI Element Design in Adobe Photoshop CC (Part 1)', 51007944, 'http://www.youtube.com/watch?v=xPY3gcAJzLk', 'https://r1---sn-5hne6n7r.googlevideo.com/videoplayback?ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=22&ipbits=0&requiressl=yes&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mm=31&mn=sn-5hne6n7r&dur=743.224&id=o-AGWCtBuu3jt2_4qhiKrCkhwSvVTsJX84jz8EYpHb1w6o&key=yt6&ip=176.9.235.198&lmt=1416576349705832&fexp=9408710%2C9409208%2C9414764%2C9415821%2C9416126%2C9417683%2C9417707%2C9417741%2C9418997%2C9419039%2C9420453%2C9420932%2C9421085%2C9421743%2C9422342%2C9422482%2C9422596%2C9422618%2C9423510%2C9423662%2C9423792%2C9423954&source=youtube&mv=u&ms=au&mt=1446875529&pl=24&sver=3&expire=1446897583&signature=0F38136068F693237AB312B11DCEAF63AA442381.DBB503D597D7B2143AF4E95CE870DE17A59C75E0&upn=0F94m3J7QM0&mime=video%2Fmp4', '720p', 'No', 51007944, 'Success', '2015-11-07 05:59:56', '0000-00-00 00:00:00', '2015-11-07 06:02:13', '2015-11-07 05:59:55'),
(20, 4, 3, 1, '12d9ce6cdf84599e8e6eee7e2d84e617.webm', 'webm', 'How to Draw the Human Figure - Mannequin Basics', 39210472, 'https://www.youtube.com/watch?v=W3yBGkdH_gA', 'https://r13---sn-5hne6nee.googlevideo.com/videoplayback?nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=43&lmt=1397795051003182&key=yt6&ratebypass=yes&upn=_Xpf3Z49piw&signature=1FED1D9B2D155C49EFAFA24798DA0B47CF35DAD5.B23DFCCEBFC218630B243329A08C77519BFD639E&ms=au&mv=u&mt=1446875529&requiressl=yes&ip=176.9.235.198&ipbits=0&pl=24&mime=video%2Fwebm&id=o-AHxOkmeKtcVQIZf9_vnO4Nrcq2NZNfifFr3Z58PKITNC&mn=sn-5hne6nee&mm=31&expire=1446897727&sver=3&fexp=9408710%2C9414764%2C9416126%2C9416555%2C9417683%2C9417707%2C9418016%2C9419444%2C9419549%2C9420453%2C9420771%2C9421931%2C9422287%2C9422596%2C9422618%2C9422847%2C9422902%2C9423509%2C9423662%2C9423708%2C9423791&dur=0.000', '360p', 'No', 39210472, 'Transferring', '2015-11-07 11:18:02', '0000-00-00 00:00:00', '2015-11-07 11:18:18', '2015-11-07 06:02:26'),
(21, 4, 2, 1, '3e99e6351c2e3d2b1a3e104e2aa37a0a.flv', 'flv', 'How to Draw the Figure from the Imagination - Part 1 - Fine Art-Tips.', 28639458, 'https://www.youtube.com/watch?v=2WJxFgAzWR4', 'https://r2---sn-5hne6n76.googlevideo.com/videoplayback?mt=1446875529&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=5&upn=0v9rxeVM2z4&ip=176.9.235.198&lmt=1384775007857002&expire=1446897735&ipbits=0&mm=31&mn=sn-5hne6n76&dur=666.201&id=o-AEuARbU0owffksjoZJ68HLRXAex5hKfvn_Hcp6KKjJiB&sver=3&source=youtube&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mime=video%2Fx-flv&key=yt6&requiressl=yes&ms=au&fexp=9408710%2C9414764%2C9416126%2C9416838%2C9417345%2C9417683%2C9417707%2C9418811%2C9420141%2C9420453%2C9421944%2C9422596%2C9422618%2C9423177%2C9423347%2C9423429%2C9423509%2C9423662%2C9423739%2C9423793%2C9423991&signature=95A5473EC61083E25061FF8DA15C4746B602D4B4.187759D028FB2611738E5B8F1E39AD16715E9465&pl=24', '240p', 'No', 28639458, 'Transferring', '2015-11-07 11:18:02', '0000-00-00 00:00:00', '2015-11-07 11:18:21', '2015-11-07 06:02:40'),
(22, 4, 3, 1, '115093a414a3c21005977589230776fa.3gp', '3gp', 'How to Draw the Human Figure - Mannequin Basics', 24635926, 'https://www.youtube.com/watch?v=W3yBGkdH_gA', 'https://r13---sn-5hne6nee.googlevideo.com/videoplayback?ms=au&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&mv=u&source=youtube&lmt=1397794659337863&requiressl=yes&ip=176.9.235.198&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&mime=video%2F3gpp&id=o-AHxOkmeKtcVQIZf9_vnO4Nrcq2NZNfifFr3Z58PKITNC&mn=sn-5hne6nee&mm=31&itag=36&mt=1446875529&sver=3&key=yt6&fexp=9408710%2C9414764%2C9416126%2C9416555%2C9417683%2C9417707%2C9418016%2C9419444%2C9419549%2C9420453%2C9420771%2C9421931%2C9422287%2C9422596%2C9422618%2C9422847%2C9422902%2C9423509%2C9423662%2C9423708%2C9423791&expire=1446897727&dur=1321.401&upn=_Xpf3Z49piw&signature=6D441F6C12334034C2FCF74B882B73A9D8A7F647.D1F604CAA159186A7880FF5E2A156DC2A21A9985', '240p', 'No', 24635926, 'Success', '2015-11-07 06:05:35', '0000-00-00 00:00:00', '2015-11-07 06:06:31', '2015-11-07 06:05:32'),
(23, 4, 2, 1, '503957646fa79e4eb8584904a330a8d2.3gp', '3gp', 'How to Draw the Figure from the Imagination - Part 1 - Fine Art-Tips.', 6810129, 'https://www.youtube.com/watch?v=2WJxFgAzWR4', 'https://r2---sn-5hne6n76.googlevideo.com/videoplayback?mt=1446875529&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=17&upn=0v9rxeVM2z4&ip=176.9.235.198&lmt=1384775275094572&expire=1446897735&ipbits=0&mm=31&mn=sn-5hne6n76&dur=666.553&id=o-AEuARbU0owffksjoZJ68HLRXAex5hKfvn_Hcp6KKjJiB&sver=3&source=youtube&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mime=video%2F3gpp&key=yt6&requiressl=yes&ms=au&fexp=9408710%2C9414764%2C9416126%2C9416838%2C9417345%2C9417683%2C9417707%2C9418811%2C9420141%2C9420453%2C9421944%2C9422596%2C9422618%2C9423177%2C9423347%2C9423429%2C9423509%2C9423662%2C9423739%2C9423793%2C9423991&signature=8B5F9C7EFEEDEC71E975841F0B7B4A76D87C6C30.30DF478C93FEA1BD643BE78614526E120EE3FFD3&pl=24', '144p', 'No', 6810129, 'Transferring', '2015-11-07 11:18:02', '0000-00-00 00:00:00', '2015-11-07 11:18:09', '2015-11-07 06:06:01'),
(24, 2, 3, 1, '831bc9756c37cb65f6286edb014ba689.mp4', 'mp4', 'Yanni - Rainmaker', 14608991, 'https://www.youtube.com/watch?v=RvJH_POzxmc', 'https://r6---sn-5hne6ne7.googlevideo.com/videoplayback?ipbits=0&requiressl=yes&mime=video%2Fmp4&ratebypass=yes&lmt=1429591901638785&expire=1446899568&mn=sn-5hne6ne7&mm=31&ip=176.9.235.198&pl=24&dur=325.032&mv=u&mt=1446877645&ms=au&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9407053%2C9408210%2C9408710%2C9412539%2C9414733%2C9414764%2C9416074%2C9416126%2C9416355%2C9417683%2C9417707%2C9417827%2C9420453%2C9421745%2C9422299%2C9422596%2C9422618%2C9423194%2C9423662%2C9423793%2C9423851%2C9424058&id=o-AEs-gnLumtv3GBU47it5zbnAvHAt0czoLD8TKP7ObXTP&sver=3&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=09845D88B38E8BAB88E6BD067A44E9BFBDAFB49F.464FF1F4487C16A1B688A86AD9D4C0C3314174DB&source=youtube&upn=v_qVtn_kPVE', '360p', 'No', 14608991, 'Success', '2015-11-07 06:32:57', '0000-00-00 00:00:00', '2015-11-07 06:33:40', '2015-11-07 06:32:55'),
(25, 4, 2, 1, '9faf581ccd3a976bc7248fcc99fa9a31.webm', 'webm', 'Real Time Drawing Tutorial: Female Body', 20434940, 'https://www.youtube.com/watch?v=gTHK8TctyCs', 'https://r16---sn-5hne6nee.googlevideo.com/videoplayback?signature=B96683BBB1ED7F03A08777888C710E797F30F794.039C716E0BDB1FF4C3EBFE47A60E2179D4D015C3&ratebypass=yes&fexp=9408710%2C9414733%2C9414764%2C9416126%2C9416673%2C9417683%2C9417707%2C9418401%2C9419038%2C9419444%2C9420016%2C9420453%2C9421252%2C9421339%2C9422140%2C9422578%2C9422596%2C9422618%2C9423202%2C9423471%2C9423662%2C9423667%2C9423792%2C9424115&requiressl=yes&mime=video%2Fwebm&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sver=3&ipbits=0&dur=0.000&expire=1446900752&lmt=1347514266250986&pl=24&itag=43&upn=YQsXh1YCS3w&source=youtube&id=o-AIhh5i9J59xxsV2wXvOwM3qmuJ1dNz4cjAqZsuqGAr4U&mm=31&mn=sn-5hne6nee&ip=176.9.235.198&ms=au&mt=1446878967&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u', '360p', 'No', 20434940, 'Success', '2015-11-07 06:52:37', '0000-00-00 00:00:00', '2015-11-07 06:53:50', '2015-11-07 06:52:37'),
(26, 2, 1, 1, 'eac1a224afec842fc5b439a4f501dc7f.webm', 'webm', 'DJ EBLIS  #11 EBI گلچین بهترین آهنگهای ابی', 57511985, 'https://www.youtube.com/watch?v=uF4Ls-CHmc0', 'https://r3---sn-5hne6n7e.googlevideo.com/videoplayback?source=youtube&requiressl=yes&lmt=1438067546796443&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&mv=u&upn=VyAKr_vo8Ng&mt=1446879490&ms=au&signature=70D926ADDED323C018D6EFD8C00533A5BF55D847.BF0351C0BA16A65A982A106E594F11363C852D03&id=o-AN02r17qN_IBVApMjIXR3JBsLGfv9zVzV7T6TuqODqk9&mn=sn-5hne6n7e&ip=176.9.235.198&mm=31&expire=1446901296&pl=24&mime=video%2Fwebm&key=yt6&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&itag=43&fexp=9408710%2C9414764%2C9415868%2C9416126%2C9416554%2C9417683%2C9417707%2C9417817%2C9418999%2C9420453%2C9421647%2C9422346%2C9422520%2C9422540%2C9422596%2C9422618%2C9422752%2C9423662%2C9423789%2C9424019%2C9424060&sver=3&ratebypass=yes&dur=0.000', '360p', 'No', 57511985, 'Success', '2015-11-07 11:18:02', '0000-00-00 00:00:00', '2015-11-07 11:19:04', '2015-11-07 07:01:41'),
(27, 4, 3, 1, 'c5c69abc5fab9ae9a5fd5a0ec2649144.webm', 'webm', 'How To Draw A Female Face: Step By Step', 43368894, 'https://www.youtube.com/watch?v=7kKJW8ZLcew', 'https://r20---sn-5hne6nee.googlevideo.com/videoplayback?fexp=9407194%2C9408501%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421254%2C9421979%2C9422372%2C9422540%2C9422542%2C9422596%2C9422618%2C9422796%2C9423662%2C9423792&ratebypass=yes&signature=1D6540C518F0A3735B99C761FCB0498CF9560738.D9C94DF76B97AA4CAF77DAE7340E3435B065B640&requiressl=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&key=yt6&mime=video%2Fwebm&dur=0.000&ipbits=0&sver=3&expire=1446904872&lmt=1383654132736740&pl=24&itag=43&source=youtube&upn=0QyDB_DREs8&mn=sn-5hne6nee&mm=31&id=o-AO-HV8tYvhXR4wFKIOx4a1cxdg6UCtXbvmlwgu4-kuPV&ip=176.9.235.198&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1446883134&ms=au', '360p', 'No', 43368894, 'Transferring', '2015-11-07 08:01:23', '0000-00-00 00:00:00', '2015-11-07 08:01:40', '2015-11-07 08:01:20'),
(28, 4, 2, 1, '6493e8f7b173296c4443ed1269e55812.mp4', 'mp4', 'How To Draw A Female Face: Step By Step', 36397504, 'https://www.youtube.com/watch?v=7kKJW8ZLcew', 'https://r20---sn-5hne6nee.googlevideo.com/videoplayback?fexp=9407194%2C9408501%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421254%2C9421979%2C9422372%2C9422540%2C9422542%2C9422596%2C9422618%2C9422796%2C9423662%2C9423792&ratebypass=yes&signature=78F73BFD59540B7FEC20FFC6B1FB2F14256B6154.D2C93B0D020FD0C005D60F9DB275F3332993A4E6&requiressl=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&dur=778.704&ipbits=0&sver=3&expire=1446904872&lmt=1398423044285927&pl=24&itag=18&source=youtube&upn=0QyDB_DREs8&mn=sn-5hne6nee&mm=31&id=o-AO-HV8tYvhXR4wFKIOx4a1cxdg6UCtXbvmlwgu4-kuPV&ip=176.9.235.198&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1446883134&ms=au', '360p', 'No', 36397504, 'Success', '2015-11-07 08:01:26', '0000-00-00 00:00:00', '2015-11-07 09:45:24', '2015-11-07 08:01:24'),
(29, 1, 1, 1, 'f975c8dbaab1efec65ea9c880a5e15bc.mp4', 'mp4', 'Maz Jobrani: Ein Saudi, ein Inder und ein Iraner treffen sich in einer Bar in Katar …', 24451336, 'https://www.youtube.com/watch?v=9kxL9Cf46VM', 'https://r19---sn-5hne6n7k.googlevideo.com/videoplayback?ratebypass=yes&signature=89035CED596FFD8638E8CB0F672405E9CBB8DEB4.A684F3EF3E1ABBF59C1E0C3991F534B1CCE0A453&fexp=9407116%2C9408013%2C9408211%2C9408504%2C9408710%2C9409246%2C9413139%2C9414764%2C9415426%2C9416126%2C9416984%2C9417683%2C9417707%2C9419445%2C9420239%2C9420453%2C9420771%2C9421254%2C9422397%2C9422596%2C9422618%2C9422948%2C9423294%2C9423429%2C9423662%2C9423667%2C9423791%2C9423959%2C9423991&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&source=youtube&pl=24&mime=video%2Fmp4&lmt=1394274361364003&sver=3&expire=1446910522&upn=eXU1HXWSZjk&id=o-ACv-7VHLzZ2zl-C5MFzkZC9JGFEvVlzslZ5RQRfqm4ob&mn=sn-5hne6n7k&ipbits=0&mm=31&requiressl=yes&ms=au&mv=u&dur=431.821&mt=1446888377&ip=176.9.235.198', '360p', 'No', 24451336, 'Success', '2015-11-07 09:35:34', '0000-00-00 00:00:00', '2015-11-07 10:10:36', '2015-11-07 09:35:34'),
(30, 1, 3, 1, 'fe0d0c472354e7f229aa0d598c005fa6.3gp', '3gp', 'Maz Jobrani: Ein Saudi, ein Inder und ein Iraner treffen sich in einer Bar in Katar …', 4426116, 'https://www.youtube.com/watch?v=9kxL9Cf46VM', 'https://r19---sn-5hne6n7k.googlevideo.com/videoplayback?upn=FU3IAdSVNKI&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446913476&lmt=1394274489496664&itag=17&mime=video%2F3gpp&dur=432.169&id=o-AKdBMdSzYtIgecVM1sYSJGukMQjYZPHTaaKLvxmFp9Hj&ms=au&mt=1446891457&pl=24&mv=u&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sver=3&fexp=9407745%2C9408710%2C9414764%2C9415792%2C9416126%2C9417353%2C9417683%2C9417707%2C9418185%2C9418438%2C9418749%2C9420453%2C9422540%2C9422596%2C9422618%2C9422779%2C9422908%2C9423510%2C9423662%2C9423790%2C9424038%2C9424114&signature=9CE6DFDCBBC3BEFBBF1C368ECC9E10E909CEA31A.9F767044B54111B068569F56B8F39FAA59F3A18C&ipbits=0&ip=176.9.235.198&key=yt6&mm=31&source=youtube&mn=sn-5hne6n7k', '144p', 'No', 4426116, 'Failed', '2015-11-07 10:28:20', '0000-00-00 00:00:00', '2015-11-07 10:28:32', '2015-11-07 10:24:52'),
(31, 1, 1, 1, 'eb0cdc90d8b7b248777c836d40a18a57.3gp', '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?requiressl=yes&ms=au&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&itag=17&pl=24&mt=1446892511&dur=114.660&id=o-AD0GWUzE6XjT3d71EbWM2lacTxfhiLuKekiCSBKB6D2z&mime=video%2F3gpp&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=JZFkJjhFGd4&signature=84B92873640E531E310626E7417C11A02566BB7F.ABF9A34B6CEDA4A9EEDE91E837E205AE505454DC&ip=176.9.235.198&mm=31&fexp=9408710%2C9412776%2C9414764%2C9416126%2C9416557%2C9416838%2C9417683%2C9417707%2C9420453%2C9421523%2C9421686%2C9421932%2C9422342%2C9422596%2C9422618%2C9422857%2C9423662%2C9423791&sver=3&mn=sn-5hne6n7s&key=yt6&lmt=1431268025409631&source=youtube&ipbits=0&expire=1446914460', '144p', 'No', 1158879, 'Success', '2015-11-07 10:41:31', '0000-00-00 00:00:00', '2015-11-07 10:42:21', '2015-11-07 10:41:11'),
(32, 1, 1, 1, 'ffcf985cd9d2e6657354870ff1581c1b.3gp', '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&source=youtube&pcm2=yes&signature=7FE4B60231F019FF712ACB53FD99D5BE9AE88D1C.112106AD6AE41BC37CB6889BF0E23E1998D96A9F&upn=qQgqffOaVmI&itag=17&key=yt6&lmt=1431268025409631&ipbits=0&id=o-AHUKmRts89kye-DpzT6FCfBK1E6ErDuHgZUCub9-H1Bc&mime=video%2F3gpp&pl=24&mm=31&mn=sn-5hne6n7s&ms=au&mt=1446893953&mv=u&ip=176.9.235.198&fexp=9407157%2C9408710%2C9414764%2C9414929%2C9416126%2C9416557%2C9417683%2C9417707%2C9418045%2C9420017%2C9420453%2C9420924%2C9421461%2C9421550%2C9422542%2C9422596%2C9422618%2C9423510%2C9423662%2C9423790&requiressl=yes&dur=114.660&expire=1446915764&sver=3', '144p', 'No', 1158879, 'Success', '2015-11-07 11:02:50', '0000-00-00 00:00:00', '2015-11-07 11:03:02', '2015-11-07 11:02:49'),
(33, 1, 1, 1, '8a175045876bb34f2828ff08896f9c70.mp4', 'mp4', 'One Crazy Muslim, One Crazy White Guy', 70350735, 'http://www.youtube.com/watch?v=GoGVg_jZa0Y', 'https://r1---sn-5hne6nes.googlevideo.com/videoplayback?expire=1446915864&mime=video%2Fmp4&pl=24&upn=dtfNLYj1518&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&itag=22&mt=1446893953&mv=u&mm=31&mn=sn-5hne6nes&id=o-ACA3sKSGb8EgQc73uK73cJqvCsgwmmJwQaM9wc5m7AHq&sver=3&fexp=9408502%2C9408710%2C9414764%2C9416126%2C9416985%2C9417683%2C9417703%2C9417707%2C9418204%2C9419470%2C9420453%2C9420539%2C9420891%2C9421247%2C9421410%2C9421823%2C9422346%2C9422596%2C9422618%2C9422900%2C9423509%2C9423631%2C9423662%2C9423789&signature=6887360FC8F6BB0264A1D1C5B5819B329403C3C9.914BBAECDF6CB090218DB54C9AAF2897EE5E4C9D&ipbits=0&requiressl=yes&key=yt6&lmt=1418655606121655&ratebypass=yes&source=youtube&dur=304.227&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ip=176.9.235.198', '720p', 'No', 70350735, 'Success', '2015-11-07 11:18:02', '0000-00-00 00:00:00', '2015-11-07 11:19:04', '2015-11-07 11:04:41'),
(34, 1, 1, 1, '1690a7e32298326b6a1d5fc804daa43b.webm', 'webm', 'Maz Jobrani: Hast du den über den Iran-Americaner gehört?', 57425315, 'https://www.youtube.com/watch?v=RmXiItk49Gw', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?ms=au&mv=u&mt=1446898604&lmt=1298564140575804&dur=0.000&mn=sn-5hne6n7s&mm=31&fexp=9408710%2C9412914%2C9414764%2C9415555%2C9416126%2C9417222%2C9417368%2C9417683%2C9417707%2C9418199%2C9420453%2C9420539%2C9420716%2C9421167%2C9422330%2C9422380%2C9422596%2C9422618%2C9422868%2C9423662%2C9423790%2C9423950&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446920452&itag=43&mime=video%2Fwebm&source=youtube&pl=24&requiressl=yes&sver=3&signature=8B5A7FA5155B88483DD97692FD3D26D00EACB14C.49A4E53338DD71BBC2C18195D7F781523AD24D31&ratebypass=yes&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&upn=3d84MG5FWaU&id=o-AJqYBonJ63NoOQAuWQt7znGX4phYJugfU8M6gokHHZbJ&ipbits=0&ip=176.9.235.198&key=yt6', '360p', 'No', 57425315, 'Success', '2015-11-07 12:21:07', '0000-00-00 00:00:00', '2015-11-07 12:21:33', '2015-11-07 12:21:01'),
(35, 4, 1, 1, 'efd3865d6496d5f6e99e04ec0aa939e7.mp4', 'mp4', 'Philips Ambilight TV στην IFA 2015', 35747637, 'https://www.youtube.com/watch?v=xRfoVzRCLAk', 'https://r17---sn-5hne6nel.googlevideo.com/videoplayback?mn=sn-5hne6nel&ip=176.9.235.198&mm=31&expire=1446920919&pl=24&mv=u&upn=EGrwyWmdOXw&mt=1446899191&ms=au&signature=B8751A6FFA4FFA0A2DD90BFBF029C6D3ED07F731.9921F1A3EC1E7E183046B47C97C4ED5CB91F16CA&id=o-AGiCjSABAUqZfirv3OJO6voRykh6BWOMCQagnRmRy7gN&lmt=1441795004432225&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&source=youtube&requiressl=yes&sver=3&ratebypass=yes&itag=22&dur=120.743&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9407169%2C9407538%2C9408710%2C9413278%2C9414764%2C9416126%2C9417683%2C9417707%2C9418401%2C9419838%2C9420453%2C9421174%2C9421645%2C9421913%2C9422596%2C9422618%2C9422996%2C9423341%2C9423421%2C9423662%2C9423667%2C9423789%2C9424064&mime=video%2Fmp4&key=yt6', '720p', 'No', 35747637, 'Success', '2015-11-07 12:29:38', '0000-00-00 00:00:00', '2015-11-07 12:29:54', '2015-11-07 12:29:35'),
(36, 4, 1, 1, 'd635c400df6538d7b0be2f0bfc961546.webm', 'webm', 'Hello Adel lyrics', 4788554, 'https://www.youtube.com/watch?v=vcxMt6V6ZDs', 'https://r18---sn-5hne6nel.googlevideo.com/videoplayback?ms=au&itag=43&mt=1446899191&mv=u&upn=ztoiafB_nDk&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mm=31&mn=sn-5hne6nel&id=o-AGr9XmTnr80I87z3ljRfbkBcBl--IKCsYjLJxlzsBQO5&sver=3&fexp=9408710%2C9410705%2C9414764%2C9416126%2C9416985%2C9417206%2C9417683%2C9417707%2C9419445%2C9419838%2C9420453%2C9421508%2C9421584%2C9421931%2C9422360%2C9422596%2C9422618%2C9423170%2C9423509%2C9423662%2C9423714%2C9423792&signature=593BE15308510AB27BDCBC0A5F4BA2DD6DB5C7F9.0E80A567FC85348DDDFC4F60FA9890379204368C&ip=176.9.235.198&requiressl=yes&lmt=1445692842398178&ratebypass=yes&source=youtube&dur=0.000&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ipbits=0&expire=1446921283&mime=video%2Fwebm&pl=24', '360p', 'No', 4788554, 'Success', '2015-11-07 12:34:53', '0000-00-00 00:00:00', '2015-11-07 12:35:00', '2015-11-07 12:34:51'),
(37, 4, 1, 1, '060e7884e12869a9b4eb96ca87fd1cc6.mp4', 'mp4', 'Hello Adel lyrics', 5633227, 'https://www.youtube.com/watch?v=vcxMt6V6ZDs', 'https://r18---sn-5hne6nel.googlevideo.com/videoplayback?ms=au&itag=18&mt=1446899191&mv=u&upn=ztoiafB_nDk&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mm=31&mn=sn-5hne6nel&id=o-AGr9XmTnr80I87z3ljRfbkBcBl--IKCsYjLJxlzsBQO5&sver=3&fexp=9408710%2C9410705%2C9414764%2C9416126%2C9416985%2C9417206%2C9417683%2C9417707%2C9419445%2C9419838%2C9420453%2C9421508%2C9421584%2C9421931%2C9422360%2C9422596%2C9422618%2C9423170%2C9423509%2C9423662%2C9423714%2C9423792&signature=5B52DFBBD15F9285EE58221B1FA32F6E900663A2.CB2C6B3A2222BA7886DE1AB1017E4CB8DD96CC1F&ip=176.9.235.198&requiressl=yes&lmt=1445932923681044&ratebypass=yes&source=youtube&dur=231.456&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ipbits=0&expire=1446921283&mime=video%2Fmp4&pl=24', '360p', 'No', 5633227, 'Success', '2015-11-07 12:35:20', '0000-00-00 00:00:00', '2015-11-07 12:35:25', '2015-11-07 12:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_id` int(10) UNSIGNED DEFAULT NULL,
  `percentage` tinyint(3) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `quota` bigint(20) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `label`, `quota`, `price`, `status`) VALUES
(1, 'استاندارد', 2147483648, 50000, 'Enable'),
(2, 'اقتصادی', 5368709120, 100000, 'Enable'),
(3, 'حرفه ای', 12884901888, 200000, 'Enable'),
(4, 'تجاری', 37580963840, 500000, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `password_changes`
--

CREATE TABLE `password_changes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` char(15) NOT NULL,
  `user_agent` varchar(1024) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `password_changes`
--

INSERT INTO `password_changes` (`id`, `user_id`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 1, '2.146.201.136', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 12:58:35'),
(2, 1, '2.146.201.136', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 13:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `gateway` enum('Payline') NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `params` varchar(1024) DEFAULT NULL,
  `status` enum('Waiting','Paid','Success','Cancelled') NOT NULL DEFAULT 'Waiting',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `package_id`, `amount`, `gateway`, `key`, `params`, `status`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 1, 50000, 'Payline', '8330027', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-06 16:42:02', '2015-11-06 16:41:43'),
(2, 1, 1, 50000, 'Payline', '8345019', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-07 12:28:03', '2015-11-07 12:27:08');

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE `remember_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` char(32) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `remember_tokens`
--

INSERT INTO `remember_tokens` (`id`, `user_id`, `token`, `user_agent`, `created_at`) VALUES
(1, 1, 'e1ed612c36490462e709b0a401fbbcb4', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:35.0) Gecko/20100101 Firefox/35.0', '2015-11-05 18:47:53'),
(2, 4, '949f172612079d46f845632049e34d49', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2358.0 Safari/537.36', '2015-11-05 19:59:33'),
(3, 4, '84a734384bb61c05682eaccc39ecd29f', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2358.0 Safari/537.36', '2015-11-05 20:01:17'),
(4, 4, 'f2b1f3aa249c5568597dd7287c2cb579', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-05 20:02:35'),
(5, 2, '521dc9f8981bca12846fccb8c968091d', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 20:31:49'),
(6, 2, 'ca48b5437dd66d9e794c72cfdd9de3c9', 'Mozilla/5.0 (Linux; Android 4.4.2; H30-U10 Build/HuaweiH30-U10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-05 20:32:50'),
(7, 2, '6318a795dafca431896fce06a19b3cce', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 21:40:35'),
(8, 7, 'd50042b4942abc56241c676522405c57', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 21:42:58'),
(9, 5, 'baf2aa67cbfa279a010f26f216b7add4', 'Mozilla/5.0 (Android 5.1.1; Mobile; rv:42.0) Gecko/42.0 Firefox/42.0', '2015-11-05 21:44:02'),
(10, 2, '566f2da2a8803432b3c1f279d40021b2', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 21:44:10'),
(11, 5, 'dc224cae94ed11c132fde2a3965ebf9d', 'Mozilla/5.0 (Android 5.1.1; Mobile; rv:42.0) Gecko/42.0 Firefox/42.0', '2015-11-05 21:44:33'),
(12, 2, '48ff581434ed6b23124c2087463d0a36', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 23:10:33'),
(13, 2, 'af2e33a19a718cfa2e44b94946535399', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '2015-11-05 23:13:05'),
(14, 2, '21f1586cf10bf0145919035c1c81cb25', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 23:16:56'),
(15, 7, '9e8b9b8ad4c45588b696a612f7b101c1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-05 23:18:10'),
(16, 1, '8b9c9f61e984ad5286b0bdb4a887b869', 'Mozilla/5.0 (Android; Mobile; rv:40.0) Gecko/40.0 Firefox/40.0', '2015-11-05 23:23:55'),
(17, 8, '9836ebba75b79a6a9ed8e45bc07f0002', 'Mozilla/5.0 (Android; Mobile; rv:40.0) Gecko/40.0 Firefox/40.0', '2015-11-06 00:11:29'),
(18, 2, '7bc5842e74d4d4aa8355af67f65c4ca1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0', '2015-11-06 01:39:52'),
(19, 1, '7390df107232df806794c83c9537588d', 'Mozilla/5.0 (Android; Mobile; rv:40.0) Gecko/40.0 Firefox/40.0', '2015-11-06 14:34:35'),
(20, 7, '992f62318f1e748fd92d169f6152d076', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-06 17:55:01'),
(21, 2, 'd1a6da5d43d2df4fba8118f9e5965043', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-07 05:54:50'),
(22, 4, '7d7657ffa67654a07f5f7c51bbd0bad9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '2015-11-07 05:57:34'),
(23, 1, '3239904a548508d4d778e5d9151b3238', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 06:00:51'),
(24, 1, 'f5de4dcebe2208e99d06501d1f411297', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 09:34:47'),
(25, 2, 'f91e324f55dc891953dc4c07d18cb3da', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-07 09:55:28'),
(26, 7, '6a93f124bcde7b6332ce5a9f6051e558', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-07 10:42:46'),
(27, 1, '67d789d9a56a52124fe43bb8ef4d350b', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 12:20:38'),
(28, 1, '803e7edaced48c721a97b8a336907cef', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 12:28:37'),
(29, 1, '501f584198d29534cd8d8813370ebeb5', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 12:33:50'),
(30, 4, 'c888f526c300b9a3ca93d6e1fea5819d', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 12:58:05'),
(31, 4, '5858b2b675dabdb9b0840c8f8ff5a45e', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 12:58:25'),
(32, 4, '4d7eb585cf7c0b1aa75acc862e985a7a', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 12:58:40'),
(33, 1, 'acb308b2fefc2fe3388eefe77bdd8090', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0 FirePHP/0.7.4 AlexaToolbar/alxf-2.21', '2015-11-07 12:58:57'),
(34, 2, '4e86aa0f56cfa1b10804828be4f39cfd', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '2015-11-07 12:59:01'),
(35, 4, 'b963e25e7649ae5069fd1c5aeb81da16', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 12:59:04'),
(36, 2, 'd0b49c3b61c853c232b1ee527c9f6275', 'Mozilla/5.0 (Linux; Android 4.4.2; H30-U10 Build/HuaweiH30-U10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 12:59:28'),
(37, 1, '55992049ef9226021637794ec9e61eef', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 13:00:14'),
(38, 1, '2e3cdb588f6a800f249a60ca2c29c33c', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 13:00:42'),
(39, 4, '80629cf348ab49e69ea4fe4537b1d367', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '2015-11-07 13:01:24'),
(40, 4, 'bf1f0964d7204c6c4b20ed91f8db3d2f', 'Mozilla/5.0 (Linux; Android 5.0.2; LG-D335 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/34.0.1847.118 Mobile Safari/537.36', '2015-11-07 13:02:17');

-- --------------------------------------------------------

--
-- Table structure for table `reset_passwords`
--

CREATE TABLE `reset_passwords` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` char(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(150) NOT NULL,
  `hostname` varchar(50) NOT NULL,
  `port` int(10) UNSIGNED NOT NULL DEFAULT '22',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `quota` bigint(20) UNSIGNED NOT NULL,
  `used` bigint(20) UNSIGNED NOT NULL,
  `remain` bigint(20) UNSIGNED NOT NULL,
  `enable` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `link`, `hostname`, `port`, `username`, `password`, `quota`, `used`, `remain`, `enable`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'http://de1bs.shariftube.ir/', '176.9.235.198', 49192, 'de1bs', 'JBrQsi3KawTHh/OGfV5328/rj5fAgYbfWfe0AXRm43BHli8FZ8Ni9dVvnuEsRUMTUBL1xaoQ0JUoVcuk3AYZmw==', 42949672960, 258226547, 42691446413, 'Yes', '0000-00-00 00:00:00', '2015-11-07 12:35:15', '2015-11-05 21:00:00'),
(2, 'http://ir1ms.shariftube.ir/', '185.49.87.85', 49192, 'ir1ms', 'I0caVWgGdi6odvctGBEdgIOyKbrER+vIgoCPm7XvtcywUHvZcRo+6W+RT4zOM79dzAPvAvbG7hX1eFcfEApueQ==', 139586437120, 284990321, 139301446799, 'No', '0000-00-00 00:00:00', '2015-11-07 08:01:24', '2015-11-05 21:00:00'),
(3, 'http://ir1bs.shariftube.ir/', '185.49.87.85', 49192, 'ir1bs', 'LoXAkthknCc4AziNiGbpBJzsb91Qkadqhiqnu23OYZuGNigSr69EoJ3uUVS7o7KZ2y+i6m8GSVWkGsjFKr6htw==', 32212254720, 874692793, 31337561927, 'No', '0000-00-00 00:00:00', '2015-11-07 10:24:52', '2015-11-05 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `success_logins`
--

CREATE TABLE `success_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` char(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `success_logins`
--

INSERT INTO `success_logins` (`id`, `user_id`, `ip_address`, `created_at`) VALUES
(1, 1, '151.240.67.116', '2015-11-05 18:47:53'),
(2, 4, '65.49.68.199', '2015-11-05 19:59:33'),
(3, 4, '65.49.68.199', '2015-11-05 20:01:17'),
(4, 4, '5.112.75.149', '2015-11-05 20:02:35'),
(5, 2, '2.146.201.136', '2015-11-05 20:31:49'),
(6, 2, '66.249.81.234', '2015-11-05 20:32:50'),
(7, 2, '2.146.201.136', '2015-11-05 21:40:35'),
(8, 7, '2.146.201.136', '2015-11-05 21:42:58'),
(9, 5, '5.52.211.102', '2015-11-05 21:44:02'),
(10, 2, '2.146.201.136', '2015-11-05 21:44:10'),
(11, 5, '5.52.211.102', '2015-11-05 21:44:33'),
(12, 2, '2.146.201.136', '2015-11-05 23:10:33'),
(13, 2, '2.146.201.136', '2015-11-05 23:13:05'),
(14, 2, '2.146.201.136', '2015-11-05 23:16:56'),
(15, 7, '2.146.201.136', '2015-11-05 23:18:10'),
(16, 1, '151.242.111.160', '2015-11-05 23:23:55'),
(17, 8, '151.242.111.160', '2015-11-06 00:11:29'),
(18, 2, '95.38.224.148', '2015-11-06 01:39:52'),
(19, 1, '151.240.119.133', '2015-11-06 14:34:35'),
(20, 7, '5.78.188.172', '2015-11-06 17:55:01'),
(21, 2, '5.78.188.172', '2015-11-07 05:54:50'),
(22, 4, '5.78.188.172', '2015-11-07 05:57:34'),
(23, 1, '93.114.108.196', '2015-11-07 06:00:51'),
(24, 1, '93.114.108.196', '2015-11-07 09:34:47'),
(25, 2, '89.38.244.167', '2015-11-07 09:55:28'),
(26, 7, '91.99.0.189', '2015-11-07 10:42:46'),
(27, 1, '2.146.201.136', '2015-11-07 12:20:38'),
(28, 1, '2.146.201.136', '2015-11-07 12:28:37'),
(29, 1, '2.146.201.136', '2015-11-07 12:33:50'),
(30, 4, '91.99.0.189', '2015-11-07 12:58:05'),
(31, 4, '91.99.0.189', '2015-11-07 12:58:25'),
(32, 4, '91.99.0.189', '2015-11-07 12:58:40'),
(33, 1, '2.146.201.136', '2015-11-07 12:58:57'),
(34, 2, '91.99.0.189', '2015-11-07 12:59:01'),
(35, 4, '91.99.0.189', '2015-11-07 12:59:04'),
(36, 2, '91.99.0.189', '2015-11-07 12:59:28'),
(37, 1, '91.99.0.189', '2015-11-07 13:00:14'),
(38, 1, '91.99.0.189', '2015-11-07 13:00:42'),
(39, 4, '91.99.0.189', '2015-11-07 13:01:24'),
(40, 4, '91.99.0.189', '2015-11-07 13:02:17');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `status` enum('Open','Answered','Replay','InProgress','Closed') NOT NULL DEFAULT 'Open',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `title`, `status`, `modified_at`, `created_at`) VALUES
(1, 7, 'testgiuguihguio', 'Closed', '2015-11-07 10:43:26', '2015-11-06 17:55:38'),
(2, 7, 'ویدیو ها با سایز ۰', 'Replay', '2015-11-07 12:31:09', '2015-11-07 10:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replays`
--

CREATE TABLE `ticket_replays` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` varchar(1024) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_replays`
--

INSERT INTO `ticket_replays` (`id`, `ticket_id`, `user_id`, `content`, `modified_at`, `created_at`) VALUES
(1, 1, 7, 'llkkljklnklnkllkjhohiljiojiojio', '2015-11-06 17:55:38', '2015-11-06 17:55:38'),
(2, 1, 2, 'اوکی رسیدگی میشه', '2015-11-06 18:05:43', '2015-11-06 18:05:43'),
(3, 1, 7, 'میخوام ببندم', '2015-11-07 10:43:26', '2015-11-07 10:43:26'),
(4, 2, 7, 'بعضی از ویدیو ها در جستجو سایزشون ۰ زده میشه\r\nلطفا چک بشه\r\nلینک نمونه\r\nhttps://www.youtube.com/watch?v=YQHsXMglC9A', '2015-11-07 10:44:51', '2015-11-07 10:44:51'),
(5, 2, 4, 'سیکتیر کاربر گرامی ', '2015-11-07 12:31:09', '2015-11-07 12:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `role` enum('Admin','User') NOT NULL DEFAULT 'User',
  `name` varchar(150) NOT NULL,
  `referral_code` varchar(20) DEFAULT NULL,
  `referral_id` int(10) UNSIGNED DEFAULT NULL,
  `quota` bigint(20) UNSIGNED NOT NULL,
  `used` bigint(20) UNSIGNED NOT NULL,
  `remain` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'm.reza.maghool@gmail.com', '$2a$08$YO8SKtfkAH48EPgah00MB.66DMzUcFYANuKf4epG1CD877tU1zvz6', 'Admin', 'محمدرضا معقول', 'mrz93', NULL, 5368709120, 188878548, 5179830572, '0000-00-00 00:00:00', '2015-11-07 13:02:01', '2015-11-05 21:00:00'),
(2, 'farskid@gmail.com', '$2a$08$4bbl0TOaRg1jMCYOakdJHercz6t76jyzsaFPUhdbjSVX3avXX189m', 'Admin', 'فرزاد یوسف زاده', 'fyz', NULL, 5368709120, 852788418, 4515920702, '0000-00-00 00:00:00', '2015-11-07 13:02:01', '2015-11-05 21:00:00'),
(4, 'ehsanfathian@gmail.com', '$2a$08$2PquSySEPgvT6Nea0WvtqOolReNHq5BXQ31lW6QdKZESBFQq6Udqm', 'Admin', 'ehsan fathian', 'goldpen', NULL, 5368709120, 349178525, 5019530595, '0000-00-00 00:00:00', '2015-11-07 13:02:01', '2015-11-05 19:59:33'),
(5, 'mahdi.ganjie@gmail.com', '$2a$08$DwRLl8FkaNHjjuzx53rNFu/MXTZv2cqTH3wXviVWdR3UnokJ8evmq', 'User', 'مهدی گنجی', 'edmin13', NULL, 5368709120, 0, 5368709120, '0000-00-00 00:00:00', '2015-11-05 21:26:09', '0000-00-00 00:00:00'),
(6, 'shahin.razazi7@gmail.com', '', 'User', 'شاهین رزازی', 'shawn', NULL, 5368709120, 0, 5368709120, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'farzad_yz@live.com', '$2a$08$ceeIi5NCzUDSR97duokmwOQRGDsKQdDRCmWN6tRvdzB8FaRJp6dy6', 'User', 'فرزاد ۲', NULL, 2, 0, 0, 0, '0000-00-00 00:00:00', '2015-11-05 21:42:58', '2015-11-05 21:42:58'),
(8, 'malekimalihe66@gmail.com', '$2a$08$TvgfUJD6r6pOmcnHF1CYJ.vXLXHfgcJ5EfPNXgSULzNlKwUhE193q', 'User', 'ملیحه ملکی', NULL, 1, 0, 0, 0, '0000-00-00 00:00:00', '2015-11-06 00:11:29', '2015-11-06 00:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE `websites` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `domains` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `name`, `domains`) VALUES
(1, 'Youtube', 'youtube.com,youtu.be'),
(2, 'Vimeo', 'vimeo.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dates` (`created_at`);

--
-- Indexes for table `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dates` (`created_at`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `server_id` (`server_id`),
  ADD KEY `website_id` (`website_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `locked_at` (`locked_at`),
  ADD KEY `dates` (`deleted_at`,`modified_at`,`created_at`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `dates` (`deleted_at`,`modified_at`,`created_at`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `price` (`price`);

--
-- Indexes for table `password_changes`
--
ALTER TABLE `password_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dates` (`created_at`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `gateway` (`gateway`),
  ADD KEY `status` (`status`),
  ADD KEY `dates` (`deleted_at`,`modified_at`,`created_at`);

--
-- Indexes for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dates` (`created_at`);

--
-- Indexes for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dates` (`created_at`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quota` (`quota`,`used`,`remain`),
  ADD KEY `dates` (`deleted_at`,`modified_at`,`created_at`),
  ADD KEY `enable` (`enable`);

--
-- Indexes for table `success_logins`
--
ALTER TABLE `success_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `dates` (`created_at`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `dates` (`modified_at`,`created_at`);

--
-- Indexes for table `ticket_replays`
--
ALTER TABLE `ticket_replays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dates` (`modified_at`,`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `referral_id` (`referral_id`),
  ADD KEY `quota` (`quota`,`used`,`remain`),
  ADD KEY `dates` (`deleted_at`,`modified_at`,`created_at`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `domains` (`domains`(255));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `failed_logins`
--
ALTER TABLE `failed_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `password_changes`
--
ALTER TABLE `password_changes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `success_logins`
--
ALTER TABLE `success_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ticket_replays`
--
ALTER TABLE `ticket_replays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD CONSTRAINT `failed_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `password_changes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
