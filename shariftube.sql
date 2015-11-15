-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2015 at 02:43 PM
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
(1, 'راه اندازی پشتیبانی از Vimeo', 'به استحضار می رساند از این پس از ویدئو های سایت Vimeo نیز پشتیبانی می شود.', '2015-11-05 18:27:26'),
(2, 'افزودن امکان پخش آنلاین و پیش نمایش ویدئوها', 'ازین پس می توانید ویدئوها را پس از دانلود آنلاین ببینید. همچنین پیش از دانلود، پیش نمایشی از ویدئوها مشاهده نمایید.', '2015-11-08 15:50:30'),
(3, 'افزودن پکیج پایه ۵۱۲ مگابایت', 'بنا به درخواست کاربران محترم پکیج ۵۱۲ مگابایتی با هزینه ۱۵۰۰ تومان به فروشگاه اضافه شد', '2015-11-09 06:23:15'),
(4, 'افزودن برخی از ویدئوهای کاربران', 'قسمت برخی ویدئو های کاربران به سایت اضافه شد. این امکان به کاربران کمک می کند که ویدئوهای پر کاربرد را بدون نیاز به مصرف حجم دانلود کنند.', '2015-11-10 12:45:26'),
(5, 'رفع اختلال در موتور جست و جوی ویدئو', 'متاسفانه موتور جست و جوی ویدئو به دلیل مشکلات فنی به مدت ۲ ساعت در دسترس نبود که با تلاش تیم فنی مشکل رفع گردید', '2015-11-11 09:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` varchar(1024) NOT NULL,
  `status` enum('Waiting','Declined','Approved') NOT NULL DEFAULT 'Waiting',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `status` enum('Waiting','InProgress','Transferring','Failed','Success','Prominent') NOT NULL DEFAULT 'Waiting',
  `locked_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 1, 2, 1, NULL, '3gp', 'Maz Jobrani - Persian Cat (from Axis of Evil)', 2689838, 'https://www.youtube.com/watch?v=WwHOBJoASsM', 'https://r5---sn-5hnedner.googlevideo.com/videoplayback?nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&requiressl=yes&ipbits=0&mime=video%2F3gpp&pl=19&expire=1446753597&mm=31&initcwndbps=1077500&ip=176.9.235.198&key=yt6&mn=sn-5hnedner&signature=7E24CBF84C73393ECE51E553B32BBD75A9F47CBC.0A7A64FC018F9CD43E2445900F9D92B6BF8D5EDA&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=m&mt=1446731889&ms=au&id=o-ABVwGKIo6DNWZF6XuCUZen5UYjsNY7M8YKqGCZJoKISU&lmt=1386394021755606&source=youtube&sver=3&dur=261.131&fexp=9406994%2C9408710%2C9414733%2C9414764%2C9416126%2C9417097%2C9417683%2C9417707%2C9418017%2C9418959%2C9419444%2C9421111%2C9421461%2C9421620%2C9422352%2C9422596%2C9422618%2C9422676%2C9423510%2C9423663%2C9423739%2C9423789&itag=17&upn=Na4zu3xKcbA', '144p', 'No', 2689838, 'Success', '2015-11-05 19:00:08', '2015-11-15 05:43:35', '2015-11-15 05:43:35', '2015-11-05 19:00:04'),
(2, 2, 2, 1, NULL, 'webm', 'Let''s play Counter Strike GO#2 (کانتر استریک) [Farsi] [HD]', 33087804, 'http://www.youtube.com/watch?v=1WvTscvh08Q', 'https://r4---sn-5hnedn7s.googlevideo.com/videoplayback?ip=176.9.235.198&itag=43&lmt=1395681835631798&requiressl=yes&id=o-AI5xh1FbyHkQ108VfZr5I4jgGxt1UfKvQiXbfYsp8JNm&source=youtube&dur=0.000&fexp=9405349%2C9408710%2C9413011%2C9413121%2C9414764%2C9415414%2C9415516%2C9416126%2C9417299%2C9417683%2C9417707%2C9418401%2C9419444%2C9420652%2C9421026%2C9421463%2C9422596%2C9422618%2C9423420%2C9423510%2C9423663%2C9423789&key=yt6&mn=sn-5hnedn7s&mm=31&mv=m&pl=19&mt=1446740043&ms=au&signature=74C0D17F5E0C9D4AA2A516EACF5957F30E9B51B3.C9D8C932FE2EA998B1475F51F95FC5FCE94B6B27&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&mime=video%2Fwebm&upn=3bzvGjZ074U&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&initcwndbps=2116250&ipbits=0&ratebypass=yes&expire=1446761706', '360p', 'No', 33087804, 'Success', '2015-11-05 21:15:19', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-05 21:15:17'),
(3, 2, 2, 1, NULL, 'mp4', 'Leonard Cohen - Dance Me to the End of Love', 65812211, 'https://www.youtube.com/watch?v=5_j4f0HiEh0', 'https://r1---sn-5hne6n7e.googlevideo.com/videoplayback?id=o-ALywv0U6TZVgRewv_N7FJDZeJYON0wXGcGsagTBqTgxN&signature=3D3AFCBED706AF00DA181B6386BD05C029DD6634.C64E36859B22CF52454AE52CBF4B76EB5032A748&ms=au&upn=tiSrbGxnujc&mv=u&mt=1446756002&pl=24&expire=1446777751&mn=sn-5hne6n7e&mm=31&ip=176.9.235.198&requiressl=yes&source=youtube&ipbits=0&lmt=1394298941702773&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418200%2C9418999%2C9421025%2C9422342%2C9422381%2C9422565%2C9422596%2C9422618%2C9422967%2C9423662%2C9423790&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&dur=387.123&ratebypass=yes&sver=3&itag=22&key=yt6&mime=video%2Fmp4', '720p', 'No', 65812211, 'Success', '2015-11-06 01:42:39', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 01:42:36'),
(4, 1, 2, 1, NULL, 'mp4', '‫شهاب عباسی : دربی ما تراختوره‬‎', 3301312, 'http://www.youtube.com/watch?v=CU0K_51zoN8', 'https://r19---sn-5hne6n7d.googlevideo.com/videoplayback?lmt=1333794541320255&itag=18&fexp=9407538%2C9408710%2C9414764%2C9415387%2C9416126%2C9417203%2C9417683%2C9417707%2C9419838%2C9420540%2C9421409%2C9421734%2C9422596%2C9422618%2C9422753%2C9423294%2C9423510%2C9423662%2C9423790&ipbits=0&upn=7FWFdQ3rZRQ&ratebypass=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&source=youtube&signature=B1E98027E3A3F9F8B5B863B309B0F7273CE9D753.9555948903BE4D834E4B80073AA05DFC4F657509&key=yt6&sver=3&expire=1446824111&mime=video%2Fmp4&id=o-AOEAEYdBaqlCOrUrtgxyEjjKxxD04EyxME9B_-MM3NF-&dur=69.729&mt=1446802123&pl=24&mv=u&ms=au&requiressl=yes&mm=31&ip=176.9.235.198&mn=sn-5hne6n7d&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire', '360p', 'No', 3301312, 'Success', '2015-11-06 19:51:01', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 14:35:23'),
(5, 1, 3, 1, NULL, 'mp4', 'Maz Jobrani', 14171127, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ADDWCgn9kbNgAZAmnKF-dkg3TSBfR2UsD69zsGOCx6zH&upn=VB2DupXQZNg&mn=sn-5hne6n7d&mm=31&source=youtube&ms=au&fexp=9407052%2C9407473%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418400%2C9421341%2C9422596%2C9422618%2C9422910%2C9423470%2C9423509%2C9423662%2C9423789&mv=u&mt=1446811238&dur=319.599&ipbits=0&sver=3&key=yt6&itag=18&mime=video%2Fmp4&signature=2BAF8CB203F6193BF825F3EF7E96415161704CF8.D366841D27F6F90670DF80CF9521B7235FD70F02&lmt=1394254337309290&expire=1446832996&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ratebypass=yes&requiressl=yes&pl=24', '360p', 'No', 14171127, 'Success', '2015-11-06 20:33:23', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 20:33:22'),
(6, 1, 2, 1, NULL, 'mp4', 'Maz Jobrani', 14171127, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ADDWCgn9kbNgAZAmnKF-dkg3TSBfR2UsD69zsGOCx6zH&upn=VB2DupXQZNg&mn=sn-5hne6n7d&mm=31&source=youtube&ms=au&fexp=9407052%2C9407473%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418400%2C9421341%2C9422596%2C9422618%2C9422910%2C9423470%2C9423509%2C9423662%2C9423789&mv=u&mt=1446811238&dur=319.599&ipbits=0&sver=3&key=yt6&itag=18&mime=video%2Fmp4&signature=2BAF8CB203F6193BF825F3EF7E96415161704CF8.D366841D27F6F90670DF80CF9521B7235FD70F02&lmt=1394254337309290&expire=1446832996&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ratebypass=yes&requiressl=yes&pl=24', '360p', 'No', 14171127, 'Success', '2015-11-06 20:45:25', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 20:45:25'),
(7, 2, 3, 1, NULL, 'webm', 'Leonard Cohen - 1968 BBC Broadcasts', 271532178, 'https://www.youtube.com/watch?v=PkU72NJBtr4', 'https://r7---sn-5hne6nez.googlevideo.com/videoplayback?ms=au&mt=1446818260&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198&requiressl=yes&fexp=9406444%2C9407642%2C9408490%2C9408710%2C9412927%2C9413128%2C9414764%2C9416126%2C9416837%2C9417203%2C9417683%2C9417707%2C9419445%2C9420453%2C9422596%2C9422618%2C9422673%2C9422797%2C9423231%2C9423290%2C9423488%2C9423662%2C9423714%2C9423791&id=o-ADDKNvD7G6h3qQClRooU23kwj6TkNdxEbvshUg7V9xYF&pl=24&mm=31&mn=sn-5hne6nez&source=youtube&upn=E-Tu0sNT1Ag&lmt=1432522953585309&mime=video%2Fwebm&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=8B79F170F0D7220D5CD77B12D4BBDC3FAC1493E3.1BBBE6BF069ED16BACFB89C9E9EB62D7B792362F&itag=43&ratebypass=yes&expire=1446840274&sver=3&ipbits=0&dur=0.000', '360p', 'No', 271532178, 'Success', '2015-11-06 14:04:51', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 14:04:47'),
(8, 4, 3, 1, NULL, 'mp4', 'UIkit web framework #4: Building a one pager website.', 52503840, 'http://www.youtube.com/watch?v=AY1_hiboFg0', 'https://r6---sn-5hne6n7s.googlevideo.com/videoplayback?signature=99A3505EFACF23808BAAE1BFF32F2DC1049F3413.13CB5562B2DCEFB9B20732B5DAC72058BCA18DE3&requiressl=yes&ipbits=0&sver=3&id=o-ANRQFCaPUFnBazwN2UsykIs8UxGBR8JIgm_T7OIoSAkr&fexp=9408505%2C9408710%2C9409205%2C9414703%2C9414764%2C9415822%2C9416126%2C9416778%2C9417353%2C9417683%2C9417707%2C9419487%2C9420453%2C9420482%2C9421605%2C9421764%2C9422397%2C9422596%2C9422618%2C9423643%2C9423662%2C9423793&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ip=176.9.235.198&key=yt6&lmt=1441173723728754&dur=433.748&ratebypass=yes&source=youtube&pl=24&mime=video%2Fmp4&expire=1446841182&mn=sn-5hne6n7s&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=kd8nRwoLYcc&ms=au&itag=22&mv=u&mt=1446819525', '720p', 'No', 52503840, 'Success', '2015-11-06 14:21:39', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 14:21:38'),
(9, 2, 3, 1, NULL, 'webm', '‫فردا تو می‌آیی/ هوشمند عقیلی‬‎', 21590345, 'http://www.youtube.com/watch?v=QL6_yQHGoUQ', 'https://r2---sn-5hne6nel.googlevideo.com/videoplayback?gcr=de&mime=video%2Fwebm&pl=24&itag=43&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9407707%2C9408376%2C9408710%2C9409207%2C9410706%2C9414732%2C9414764%2C9416126%2C9417683%2C9417707%2C9419838%2C9420453%2C9421710%2C9421745%2C9422456%2C9422483%2C9422555%2C9422596%2C9422618%2C9422951%2C9423291%2C9423510%2C9423662%2C9423792&sparams=dur%2Cgcr%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&upn=44icgfVR_74&signature=7B953A8993AB279AC8A4140911E3199B00AF7579.9617FFC2A51F558C4885E834330DD638754183F9&sver=3&key=yt6&ip=176.9.235.198&lmt=1395503047842970&dur=0.000&expire=1446855748&source=youtube&id=o-AJMVS8s4rHxVmFsM2jOcaJofSgPIqhi6s39IeWyAFxVB&ratebypass=yes&mm=31&mn=sn-5hne6nel&mt=1446833806&mv=u&ms=au&requiressl=yes', '360p', 'No', 21590345, 'Success', '2015-11-06 18:22:45', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:22:44'),
(10, 2, 3, 1, NULL, 'webm', 'Ritual De Amor (Desire)-live Yanni Voices-Ender Thomas', 30014334, 'https://www.youtube.com/watch?v=MrdjnstXi2A', 'https://r13---sn-5hne6n7k.googlevideo.com/videoplayback?source=youtube&signature=7E9BF47F62E2CB69504575A66DC8B8C329ED48F3.689F4E95923180BCE9A4422C29C82C9677298713&mv=u&mt=1446834280&ms=au&fexp=9408509%2C9408710%2C9408891%2C9413317%2C9414764%2C9416126%2C9417353%2C9417683%2C9417707%2C9418751%2C9418899%2C9420453%2C9421173%2C9422141%2C9422596%2C9422618%2C9422675%2C9423488%2C9423513%2C9423662%2C9423793&pl=24&mn=sn-5hne6n7k&mm=31&ip=176.9.235.198&dur=0.000&requiressl=yes&id=o-AIDGWZB1pZ74w0SWlzFuh4fUZFa-pDl15L7Ee2FaOaOt&ratebypass=yes&key=yt6&itag=43&mime=video%2Fwebm&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446856339&ipbits=0&sver=3&lmt=1298510914499500&upn=U-lOyDSkBYI', '360p', 'No', 30014334, 'Success', '2015-11-06 18:32:37', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:32:36'),
(11, 2, 3, 1, NULL, 'mp4', 'Ebi & Shadmehr - Ye Dokhtar OFFICIAL VIDEO HD', 64898727, 'https://www.youtube.com/watch?v=_-pqp8kA64Y', 'https://r1---sn-5hne6n7l.googlevideo.com/videoplayback?ms=au&mv=u&mt=1446834954&requiressl=yes&ratebypass=yes&mn=sn-5hne6n7l&mm=31&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421018%2C9421409%2C9422596%2C9422618%2C9423662&mime=video%2Fmp4&pl=24&itag=22&upn=5pIvWnXoqug&signature=BA72C65EB06A86C7397C268D0007B2F05C3ECEDD.8E3B3935E6C33CE554A52E3FD9655AF9C7D69C2D&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&id=o-AJuzJe5j3HfP8k9yN_fhcV0bzRStNkq0bcVRAdR_ln3_&sver=3&expire=1446856755&dur=327.587&lmt=1429608164412149&key=yt6&ip=176.9.235.198', '720p', 'No', 64898727, 'Success', '2015-11-06 18:39:34', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:39:31'),
(12, 2, 3, 1, NULL, 'mp4', 'Shadmehr Aghili - Entekhab OFFICIAL VIDEO HD', 59772572, 'https://www.youtube.com/watch?v=T3pBOfMjQIw', 'https://r3---sn-5hne6n7l.googlevideo.com/videoplayback?mn=sn-5hne6n7l&pl=24&mm=31&requiressl=yes&dur=258.739&id=o-AEhb6TMeIg2MOHNPwctmSAuM1YCj93_ut1TWXv3F8wZm&mv=u&itag=22&mt=1446834954&fexp=9408086%2C9408710%2C9412526%2C9414764%2C9416126%2C9417683%2C9417690%2C9417707%2C9418204%2C9418999%2C9419445%2C9420453%2C9420539%2C9421166%2C9421252%2C9421712%2C9422300%2C9422506%2C9422596%2C9422618%2C9422994%2C9423431%2C9423662%2C9423791&ms=au&source=youtube&ip=176.9.235.198&sver=3&lmt=1431937295931931&expire=1446856972&ipbits=0&ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=04F4063CBF643B857738DD54F1E1BA3517550EC4.65CF44F446888E6ADC7EADA983C2816380C2971C&key=yt6&mime=video%2Fmp4&upn=I-bLnN0hjH8', '720p', 'No', 59772572, 'Success', '2015-11-06 18:43:01', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:42:59'),
(13, 2, 3, 1, NULL, 'mp4', '‫شادمهر عقیلی عادت‬‎', 11068186, 'https://www.youtube.com/watch?v=GM3_gTeKx-U', 'https://r1---sn-5hne6nl7.googlevideo.com/videoplayback?mn=sn-5hne6nl7&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=XwKPbxqq_rc&itag=18&ms=au&mv=u&mt=1446834954&pl=24&mime=video%2Fmp4&expire=1446857087&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&key=yt6&lmt=1407718623294659&dur=253.352&source=youtube&ratebypass=yes&signature=8A89B7B3F028D189F933638838084B866802C359.D0CC631B089ACB5270AB52148B5DE8A8680920DA&requiressl=yes&ipbits=0&ip=176.9.235.198&sver=3&id=o-AAx5v5550wrcKBPj-OYKe3qsce5UnYyqoLpBB0DQFWCX&fexp=9407478%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662', '360p', 'No', 11068186, 'Success', '2015-11-06 18:45:04', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:45:03'),
(14, 2, 3, 1, NULL, 'webm', 'Shadmehr Aghili Adat شادمهر عادت', 24165664, 'https://www.youtube.com/watch?v=Q5kdb8xZxhE', 'https://r3---sn-5hne6ner.googlevideo.com/videoplayback?fexp=9406819%2C9408710%2C9412777%2C9414764%2C9416126%2C9417683%2C9417707%2C9418204%2C9418997%2C9419444%2C9420175%2C9420453%2C9420481%2C9421252%2C9421931%2C9421944%2C9422567%2C9422596%2C9422618%2C9423315%2C9423472%2C9423489%2C9423510%2C9423662%2C9423790%2C9424114&sver=3&id=o-ADYn-FF0LpleH-AP-f3x-IYq_hqNLk_HdDFjVSiGK5HO&requiressl=yes&ipbits=0&signature=4EC409447D8473E7D4577AD543089189BDFE16F4.0DAB1BC84B6451F5B17132AE2ABA00D6CB000EAC&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=cp_p8jWKkrk&mv=m&mt=1446835716&ms=au&itag=43&initcwndbps=353750&mn=sn-5hne6ner&mm=31&expire=1446857428&pl=24&mime=video%2Fwebm&key=yt6&dur=0.000&ratebypass=yes&source=youtube&lmt=1392375607514656&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ip=176.9.235.198', '360p', 'No', 24165664, 'Success', '2015-11-06 18:50:43', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:50:39'),
(15, 2, 3, 1, NULL, 'webm', 'What is love - Jim Carrey', 12976156, 'https://www.youtube.com/watch?v=3ATggIrOjkY', 'https://r3---sn-5hne6nl7.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1353764964694837&pcm2=no&dur=0.000&signature=5C7232377D014691B234ABB5B47FAE1A3C18CC78.C66265F461AAA389DBCBABD016B6C79506D8EC1D&sver=3&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&ratebypass=yes&ipbits=0&upn=4kiocd1s6n8&key=yt6&fexp=9407051%2C9407156%2C9408710%2C9414764%2C9415327%2C9416126%2C9417683%2C9417707%2C9418203%2C9420453%2C9421354%2C9422151%2C9422482%2C9422596%2C9422618%2C9423291%2C9423662%2C9423667%2C9423793%2C9423939%2C9423992&itag=43&mm=31&source=youtube&pl=24&mn=sn-5hne6nl7&requiressl=yes&mime=video%2Fwebm&ip=176.9.235.198&expire=1446857950&id=o-AEFCz3LRRGwxCIKWhXoptePtJi3iWvFF1xa5ePc6Evag&ms=au&mt=1446836105&mv=u', '360p', 'No', 12976156, 'Success', '2015-11-06 18:59:40', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 18:59:37'),
(16, 2, 3, 1, NULL, 'webm', '‫بهترین های داریوش ٢‬‎', 129307690, 'https://www.youtube.com/watch?v=S7uF9XdsLfU', 'https://r11---sn-5hne6nes.googlevideo.com/videoplayback?sver=3&requiressl=yes&ratebypass=yes&itag=43&lmt=1404084833820293&dur=0.000&expire=1446858098&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9408507%2C9408710%2C9409205%2C9412927%2C9414764%2C9415515%2C9416126%2C9416495%2C9416984%2C9417206%2C9417683%2C9417707%2C9418355%2C9418400%2C9420453%2C9421708%2C9422562%2C9422596%2C9422618%2C9423299%2C9423429%2C9423493%2C9423509%2C9423662%2C9423789&mime=video%2Fwebm&key=yt6&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mm=31&mn=sn-5hne6nes&id=o-APg4OsoJD8nYleBs9_FpAXgqnOPsr-6__ko96Jf88M35&mt=1446836105&mv=u&ms=au&source=youtube&signature=7790598540459F2A2FCD9711F40ABB19C0D1CD26.445FF22CBC87A6E4E6D178AF03C6258B99F51EA0&ip=176.9.235.198&pl=24&ipbits=0&upn=hXC0Wp8lxvQ', '360p', 'No', 129307690, 'Success', '2015-11-06 19:01:49', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 19:01:46'),
(17, 2, 3, 1, NULL, 'webm', 'P1-Enghelab 57-Revayati Digar', 35704150, 'http://www.youtube.com/watch?v=tbBC8S7h3Oc', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?requiressl=yes&itag=43&fexp=9408710%2C9412538%2C9414702%2C9414764%2C9416126%2C9417055%2C9417683%2C9417707%2C9418400%2C9420453%2C9421411%2C9422596%2C9422618%2C9423429%2C9423510%2C9423662%2C9423790%2C9423859&ip=176.9.235.198&ms=au&mv=u&mt=1446836725&source=youtube&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ACXbfGEKFBmgzMf8m34AaO73p11b91SwZhBgDPw82Ps0&signature=7BEBA0D21910EFC9D7B4C15970B88AA84706A8DE.AB4F25438197ED393C0BE4991B40B25D3F18EEC4&mime=video%2Fwebm&upn=LI8Yt9Lcd7E&dur=0.000&ratebypass=yes&expire=1446858795&lmt=1328622924874267&pl=24&ipbits=0&mn=sn-5hne6n7s&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mm=31&key=yt6', '360p', 'No', 35704150, 'Success', '2015-11-06 19:13:28', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 19:13:26'),
(18, 2, 3, 1, NULL, 'webm', 'Falcão | The Best Player of World Futsal | Skills & Goals & Tricks ᴴᴰ', 20737425, 'https://www.youtube.com/watch?v=k9MlN2xxDyI', 'https://r1---sn-5hne6n7e.googlevideo.com/videoplayback?signature=06D827E139EC97A246A849FA864226378A7B6423.D7F6D9BA3AF3BCA1EC40711D9A41503D1C473480&source=youtube&ratebypass=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&upn=g0hX9Qs_PmI&ipbits=0&fexp=9407181%2C9408710%2C9410706%2C9414764%2C9415822%2C9416126%2C9416481%2C9417683%2C9417707%2C9418201%2C9418204%2C9420017%2C9420453%2C9421167%2C9421584%2C9422382%2C9422484%2C9422596%2C9422618%2C9422675%2C9423662%2C9423789&lmt=1396350685736536&mn=sn-5hne6n7e&mm=31&ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&mv=u&mt=1446849937&ms=au&requiressl=yes&mime=video%2Fwebm&dur=0.000&id=o-AMHiJogabcsZTYv4qHw3veiSZmBDRg31PxtYgXOTd2SV&itag=43&expire=1446872158&sver=3&key=yt6', '360p', 'No', 20737425, 'Success', '2015-11-06 22:56:11', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-06 22:56:09'),
(19, 4, 2, 1, NULL, 'mp4', 'Mobile GUI Element Design in Adobe Photoshop CC (Part 1)', 51007944, 'http://www.youtube.com/watch?v=xPY3gcAJzLk', 'https://r1---sn-5hne6n7r.googlevideo.com/videoplayback?ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=22&ipbits=0&requiressl=yes&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mm=31&mn=sn-5hne6n7r&dur=743.224&id=o-AGWCtBuu3jt2_4qhiKrCkhwSvVTsJX84jz8EYpHb1w6o&key=yt6&ip=176.9.235.198&lmt=1416576349705832&fexp=9408710%2C9409208%2C9414764%2C9415821%2C9416126%2C9417683%2C9417707%2C9417741%2C9418997%2C9419039%2C9420453%2C9420932%2C9421085%2C9421743%2C9422342%2C9422482%2C9422596%2C9422618%2C9423510%2C9423662%2C9423792%2C9423954&source=youtube&mv=u&ms=au&mt=1446875529&pl=24&sver=3&expire=1446897583&signature=0F38136068F693237AB312B11DCEAF63AA442381.DBB503D597D7B2143AF4E95CE870DE17A59C75E0&upn=0F94m3J7QM0&mime=video%2Fmp4', '720p', 'No', 51007944, 'Success', '2015-11-07 05:59:56', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 05:59:55'),
(20, 4, 3, 1, NULL, 'webm', 'How to Draw the Human Figure - Mannequin Basics', 39210472, 'https://www.youtube.com/watch?v=W3yBGkdH_gA', 'https://r13---sn-5hne6nee.googlevideo.com/videoplayback?nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=43&lmt=1397795051003182&key=yt6&ratebypass=yes&upn=_Xpf3Z49piw&signature=1FED1D9B2D155C49EFAFA24798DA0B47CF35DAD5.B23DFCCEBFC218630B243329A08C77519BFD639E&ms=au&mv=u&mt=1446875529&requiressl=yes&ip=176.9.235.198&ipbits=0&pl=24&mime=video%2Fwebm&id=o-AHxOkmeKtcVQIZf9_vnO4Nrcq2NZNfifFr3Z58PKITNC&mn=sn-5hne6nee&mm=31&expire=1446897727&sver=3&fexp=9408710%2C9414764%2C9416126%2C9416555%2C9417683%2C9417707%2C9418016%2C9419444%2C9419549%2C9420453%2C9420771%2C9421931%2C9422287%2C9422596%2C9422618%2C9422847%2C9422902%2C9423509%2C9423662%2C9423708%2C9423791&dur=0.000', '360p', 'No', 39210472, 'Success', '2015-11-07 11:18:02', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 06:02:26'),
(21, 4, 2, 1, NULL, 'flv', 'How to Draw the Figure from the Imagination - Part 1 - Fine Art-Tips.', 28639458, 'https://www.youtube.com/watch?v=2WJxFgAzWR4', 'https://r2---sn-5hne6n76.googlevideo.com/videoplayback?mt=1446875529&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=5&upn=0v9rxeVM2z4&ip=176.9.235.198&lmt=1384775007857002&expire=1446897735&ipbits=0&mm=31&mn=sn-5hne6n76&dur=666.201&id=o-AEuARbU0owffksjoZJ68HLRXAex5hKfvn_Hcp6KKjJiB&sver=3&source=youtube&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mime=video%2Fx-flv&key=yt6&requiressl=yes&ms=au&fexp=9408710%2C9414764%2C9416126%2C9416838%2C9417345%2C9417683%2C9417707%2C9418811%2C9420141%2C9420453%2C9421944%2C9422596%2C9422618%2C9423177%2C9423347%2C9423429%2C9423509%2C9423662%2C9423739%2C9423793%2C9423991&signature=95A5473EC61083E25061FF8DA15C4746B602D4B4.187759D028FB2611738E5B8F1E39AD16715E9465&pl=24', '240p', 'No', 28639458, 'Success', '2015-11-07 11:18:02', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 06:02:40'),
(22, 4, 3, 1, NULL, '3gp', 'How to Draw the Human Figure - Mannequin Basics', 24635926, 'https://www.youtube.com/watch?v=W3yBGkdH_gA', 'https://r13---sn-5hne6nee.googlevideo.com/videoplayback?ms=au&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&mv=u&source=youtube&lmt=1397794659337863&requiressl=yes&ip=176.9.235.198&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&mime=video%2F3gpp&id=o-AHxOkmeKtcVQIZf9_vnO4Nrcq2NZNfifFr3Z58PKITNC&mn=sn-5hne6nee&mm=31&itag=36&mt=1446875529&sver=3&key=yt6&fexp=9408710%2C9414764%2C9416126%2C9416555%2C9417683%2C9417707%2C9418016%2C9419444%2C9419549%2C9420453%2C9420771%2C9421931%2C9422287%2C9422596%2C9422618%2C9422847%2C9422902%2C9423509%2C9423662%2C9423708%2C9423791&expire=1446897727&dur=1321.401&upn=_Xpf3Z49piw&signature=6D441F6C12334034C2FCF74B882B73A9D8A7F647.D1F604CAA159186A7880FF5E2A156DC2A21A9985', '240p', 'No', 24635926, 'Success', '2015-11-07 06:05:35', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 06:05:32'),
(23, 4, 2, 1, NULL, '3gp', 'How to Draw the Figure from the Imagination - Part 1 - Fine Art-Tips.', 6810129, 'https://www.youtube.com/watch?v=2WJxFgAzWR4', 'https://r2---sn-5hne6n76.googlevideo.com/videoplayback?mt=1446875529&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=17&upn=0v9rxeVM2z4&ip=176.9.235.198&lmt=1384775275094572&expire=1446897735&ipbits=0&mm=31&mn=sn-5hne6n76&dur=666.553&id=o-AEuARbU0owffksjoZJ68HLRXAex5hKfvn_Hcp6KKjJiB&sver=3&source=youtube&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mime=video%2F3gpp&key=yt6&requiressl=yes&ms=au&fexp=9408710%2C9414764%2C9416126%2C9416838%2C9417345%2C9417683%2C9417707%2C9418811%2C9420141%2C9420453%2C9421944%2C9422596%2C9422618%2C9423177%2C9423347%2C9423429%2C9423509%2C9423662%2C9423739%2C9423793%2C9423991&signature=8B5F9C7EFEEDEC71E975841F0B7B4A76D87C6C30.30DF478C93FEA1BD643BE78614526E120EE3FFD3&pl=24', '144p', 'No', 6810129, 'Success', '2015-11-07 11:18:02', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 06:06:01'),
(24, 2, 3, 1, NULL, 'mp4', 'Yanni - Rainmaker', 14608991, 'https://www.youtube.com/watch?v=RvJH_POzxmc', 'https://r6---sn-5hne6ne7.googlevideo.com/videoplayback?ipbits=0&requiressl=yes&mime=video%2Fmp4&ratebypass=yes&lmt=1429591901638785&expire=1446899568&mn=sn-5hne6ne7&mm=31&ip=176.9.235.198&pl=24&dur=325.032&mv=u&mt=1446877645&ms=au&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9407053%2C9408210%2C9408710%2C9412539%2C9414733%2C9414764%2C9416074%2C9416126%2C9416355%2C9417683%2C9417707%2C9417827%2C9420453%2C9421745%2C9422299%2C9422596%2C9422618%2C9423194%2C9423662%2C9423793%2C9423851%2C9424058&id=o-AEs-gnLumtv3GBU47it5zbnAvHAt0czoLD8TKP7ObXTP&sver=3&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=09845D88B38E8BAB88E6BD067A44E9BFBDAFB49F.464FF1F4487C16A1B688A86AD9D4C0C3314174DB&source=youtube&upn=v_qVtn_kPVE', '360p', 'No', 14608991, 'Success', '2015-11-07 06:32:57', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 06:32:55'),
(25, 4, 2, 1, NULL, 'webm', 'Real Time Drawing Tutorial: Female Body', 20434940, 'https://www.youtube.com/watch?v=gTHK8TctyCs', 'https://r16---sn-5hne6nee.googlevideo.com/videoplayback?signature=B96683BBB1ED7F03A08777888C710E797F30F794.039C716E0BDB1FF4C3EBFE47A60E2179D4D015C3&ratebypass=yes&fexp=9408710%2C9414733%2C9414764%2C9416126%2C9416673%2C9417683%2C9417707%2C9418401%2C9419038%2C9419444%2C9420016%2C9420453%2C9421252%2C9421339%2C9422140%2C9422578%2C9422596%2C9422618%2C9423202%2C9423471%2C9423662%2C9423667%2C9423792%2C9424115&requiressl=yes&mime=video%2Fwebm&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sver=3&ipbits=0&dur=0.000&expire=1446900752&lmt=1347514266250986&pl=24&itag=43&upn=YQsXh1YCS3w&source=youtube&id=o-AIhh5i9J59xxsV2wXvOwM3qmuJ1dNz4cjAqZsuqGAr4U&mm=31&mn=sn-5hne6nee&ip=176.9.235.198&ms=au&mt=1446878967&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u', '360p', 'No', 20434940, 'Success', '2015-11-07 06:52:37', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 06:52:37'),
(26, 2, 1, 1, NULL, 'webm', 'DJ EBLIS  #11 EBI گلچین بهترین آهنگهای ابی', 57511985, 'https://www.youtube.com/watch?v=uF4Ls-CHmc0', 'https://r3---sn-5hne6n7e.googlevideo.com/videoplayback?source=youtube&requiressl=yes&lmt=1438067546796443&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&mv=u&upn=VyAKr_vo8Ng&mt=1446879490&ms=au&signature=70D926ADDED323C018D6EFD8C00533A5BF55D847.BF0351C0BA16A65A982A106E594F11363C852D03&id=o-AN02r17qN_IBVApMjIXR3JBsLGfv9zVzV7T6TuqODqk9&mn=sn-5hne6n7e&ip=176.9.235.198&mm=31&expire=1446901296&pl=24&mime=video%2Fwebm&key=yt6&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&itag=43&fexp=9408710%2C9414764%2C9415868%2C9416126%2C9416554%2C9417683%2C9417707%2C9417817%2C9418999%2C9420453%2C9421647%2C9422346%2C9422520%2C9422540%2C9422596%2C9422618%2C9422752%2C9423662%2C9423789%2C9424019%2C9424060&sver=3&ratebypass=yes&dur=0.000', '360p', 'No', 57511985, 'Success', '2015-11-07 11:18:02', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 07:01:41'),
(27, 4, 3, 1, NULL, 'webm', 'How To Draw A Female Face: Step By Step', 43368894, 'https://www.youtube.com/watch?v=7kKJW8ZLcew', 'https://r20---sn-5hne6nee.googlevideo.com/videoplayback?fexp=9407194%2C9408501%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421254%2C9421979%2C9422372%2C9422540%2C9422542%2C9422596%2C9422618%2C9422796%2C9423662%2C9423792&ratebypass=yes&signature=1D6540C518F0A3735B99C761FCB0498CF9560738.D9C94DF76B97AA4CAF77DAE7340E3435B065B640&requiressl=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&key=yt6&mime=video%2Fwebm&dur=0.000&ipbits=0&sver=3&expire=1446904872&lmt=1383654132736740&pl=24&itag=43&source=youtube&upn=0QyDB_DREs8&mn=sn-5hne6nee&mm=31&id=o-AO-HV8tYvhXR4wFKIOx4a1cxdg6UCtXbvmlwgu4-kuPV&ip=176.9.235.198&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1446883134&ms=au', '360p', 'No', 43368894, 'Success', '2015-11-07 08:01:23', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 08:01:20'),
(28, 4, 2, 1, NULL, 'mp4', 'How To Draw A Female Face: Step By Step', 36397504, 'https://www.youtube.com/watch?v=7kKJW8ZLcew', 'https://r20---sn-5hne6nee.googlevideo.com/videoplayback?fexp=9407194%2C9408501%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421254%2C9421979%2C9422372%2C9422540%2C9422542%2C9422596%2C9422618%2C9422796%2C9423662%2C9423792&ratebypass=yes&signature=78F73BFD59540B7FEC20FFC6B1FB2F14256B6154.D2C93B0D020FD0C005D60F9DB275F3332993A4E6&requiressl=yes&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&dur=778.704&ipbits=0&sver=3&expire=1446904872&lmt=1398423044285927&pl=24&itag=18&source=youtube&upn=0QyDB_DREs8&mn=sn-5hne6nee&mm=31&id=o-AO-HV8tYvhXR4wFKIOx4a1cxdg6UCtXbvmlwgu4-kuPV&ip=176.9.235.198&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1446883134&ms=au', '360p', 'No', 36397504, 'Success', '2015-11-07 08:01:26', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 08:01:24'),
(29, 1, 1, 1, NULL, 'mp4', 'Maz Jobrani: Ein Saudi, ein Inder und ein Iraner treffen sich in einer Bar in Katar …', 24451336, 'https://www.youtube.com/watch?v=9kxL9Cf46VM', 'https://r19---sn-5hne6n7k.googlevideo.com/videoplayback?ratebypass=yes&signature=89035CED596FFD8638E8CB0F672405E9CBB8DEB4.A684F3EF3E1ABBF59C1E0C3991F534B1CCE0A453&fexp=9407116%2C9408013%2C9408211%2C9408504%2C9408710%2C9409246%2C9413139%2C9414764%2C9415426%2C9416126%2C9416984%2C9417683%2C9417707%2C9419445%2C9420239%2C9420453%2C9420771%2C9421254%2C9422397%2C9422596%2C9422618%2C9422948%2C9423294%2C9423429%2C9423662%2C9423667%2C9423791%2C9423959%2C9423991&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&source=youtube&pl=24&mime=video%2Fmp4&lmt=1394274361364003&sver=3&expire=1446910522&upn=eXU1HXWSZjk&id=o-ACv-7VHLzZ2zl-C5MFzkZC9JGFEvVlzslZ5RQRfqm4ob&mn=sn-5hne6n7k&ipbits=0&mm=31&requiressl=yes&ms=au&mv=u&dur=431.821&mt=1446888377&ip=176.9.235.198', '360p', 'No', 24451336, 'Success', '2015-11-07 09:35:34', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 09:35:34'),
(30, 1, 3, 1, NULL, '3gp', 'Maz Jobrani: Ein Saudi, ein Inder und ein Iraner treffen sich in einer Bar in Katar …', 4426116, 'https://www.youtube.com/watch?v=9kxL9Cf46VM', 'https://r19---sn-5hne6n7k.googlevideo.com/videoplayback?upn=FU3IAdSVNKI&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446913476&lmt=1394274489496664&itag=17&mime=video%2F3gpp&dur=432.169&id=o-AKdBMdSzYtIgecVM1sYSJGukMQjYZPHTaaKLvxmFp9Hj&ms=au&mt=1446891457&pl=24&mv=u&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sver=3&fexp=9407745%2C9408710%2C9414764%2C9415792%2C9416126%2C9417353%2C9417683%2C9417707%2C9418185%2C9418438%2C9418749%2C9420453%2C9422540%2C9422596%2C9422618%2C9422779%2C9422908%2C9423510%2C9423662%2C9423790%2C9424038%2C9424114&signature=9CE6DFDCBBC3BEFBBF1C368ECC9E10E909CEA31A.9F767044B54111B068569F56B8F39FAA59F3A18C&ipbits=0&ip=176.9.235.198&key=yt6&mm=31&source=youtube&mn=sn-5hne6n7k', '144p', 'No', 4426116, 'Failed', '2015-11-07 10:28:20', '2015-11-15 05:42:48', '2015-11-15 05:42:49', '2015-11-07 10:24:52'),
(31, 1, 1, 1, NULL, '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?requiressl=yes&ms=au&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&itag=17&pl=24&mt=1446892511&dur=114.660&id=o-AD0GWUzE6XjT3d71EbWM2lacTxfhiLuKekiCSBKB6D2z&mime=video%2F3gpp&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=JZFkJjhFGd4&signature=84B92873640E531E310626E7417C11A02566BB7F.ABF9A34B6CEDA4A9EEDE91E837E205AE505454DC&ip=176.9.235.198&mm=31&fexp=9408710%2C9412776%2C9414764%2C9416126%2C9416557%2C9416838%2C9417683%2C9417707%2C9420453%2C9421523%2C9421686%2C9421932%2C9422342%2C9422596%2C9422618%2C9422857%2C9423662%2C9423791&sver=3&mn=sn-5hne6n7s&key=yt6&lmt=1431268025409631&source=youtube&ipbits=0&expire=1446914460', '144p', 'No', 1158879, 'Success', '2015-11-07 10:41:31', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 10:41:11'),
(32, 1, 1, 1, NULL, '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&source=youtube&pcm2=yes&signature=7FE4B60231F019FF712ACB53FD99D5BE9AE88D1C.112106AD6AE41BC37CB6889BF0E23E1998D96A9F&upn=qQgqffOaVmI&itag=17&key=yt6&lmt=1431268025409631&ipbits=0&id=o-AHUKmRts89kye-DpzT6FCfBK1E6ErDuHgZUCub9-H1Bc&mime=video%2F3gpp&pl=24&mm=31&mn=sn-5hne6n7s&ms=au&mt=1446893953&mv=u&ip=176.9.235.198&fexp=9407157%2C9408710%2C9414764%2C9414929%2C9416126%2C9416557%2C9417683%2C9417707%2C9418045%2C9420017%2C9420453%2C9420924%2C9421461%2C9421550%2C9422542%2C9422596%2C9422618%2C9423510%2C9423662%2C9423790&requiressl=yes&dur=114.660&expire=1446915764&sver=3', '144p', 'No', 1158879, 'Success', '2015-11-07 11:02:50', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 11:02:49'),
(33, 1, 1, 1, NULL, 'mp4', 'One Crazy Muslim, One Crazy White Guy', 70350735, 'http://www.youtube.com/watch?v=GoGVg_jZa0Y', 'https://r1---sn-5hne6nes.googlevideo.com/videoplayback?expire=1446915864&mime=video%2Fmp4&pl=24&upn=dtfNLYj1518&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&itag=22&mt=1446893953&mv=u&mm=31&mn=sn-5hne6nes&id=o-ACA3sKSGb8EgQc73uK73cJqvCsgwmmJwQaM9wc5m7AHq&sver=3&fexp=9408502%2C9408710%2C9414764%2C9416126%2C9416985%2C9417683%2C9417703%2C9417707%2C9418204%2C9419470%2C9420453%2C9420539%2C9420891%2C9421247%2C9421410%2C9421823%2C9422346%2C9422596%2C9422618%2C9422900%2C9423509%2C9423631%2C9423662%2C9423789&signature=6887360FC8F6BB0264A1D1C5B5819B329403C3C9.914BBAECDF6CB090218DB54C9AAF2897EE5E4C9D&ipbits=0&requiressl=yes&key=yt6&lmt=1418655606121655&ratebypass=yes&source=youtube&dur=304.227&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ip=176.9.235.198', '720p', 'No', 70350735, 'Success', '2015-11-07 11:18:02', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 11:04:41'),
(34, 1, 1, 1, NULL, 'webm', 'Maz Jobrani: Hast du den über den Iran-Americaner gehört?', 57425315, 'https://www.youtube.com/watch?v=RmXiItk49Gw', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?ms=au&mv=u&mt=1446898604&lmt=1298564140575804&dur=0.000&mn=sn-5hne6n7s&mm=31&fexp=9408710%2C9412914%2C9414764%2C9415555%2C9416126%2C9417222%2C9417368%2C9417683%2C9417707%2C9418199%2C9420453%2C9420539%2C9420716%2C9421167%2C9422330%2C9422380%2C9422596%2C9422618%2C9422868%2C9423662%2C9423790%2C9423950&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1446920452&itag=43&mime=video%2Fwebm&source=youtube&pl=24&requiressl=yes&sver=3&signature=8B5A7FA5155B88483DD97692FD3D26D00EACB14C.49A4E53338DD71BBC2C18195D7F781523AD24D31&ratebypass=yes&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&upn=3d84MG5FWaU&id=o-AJqYBonJ63NoOQAuWQt7znGX4phYJugfU8M6gokHHZbJ&ipbits=0&ip=176.9.235.198&key=yt6', '360p', 'No', 57425315, 'Success', '2015-11-07 12:21:07', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 12:21:01'),
(35, 4, 1, 1, NULL, 'mp4', 'Philips Ambilight TV στην IFA 2015', 35747637, 'https://www.youtube.com/watch?v=xRfoVzRCLAk', 'https://r17---sn-5hne6nel.googlevideo.com/videoplayback?mn=sn-5hne6nel&ip=176.9.235.198&mm=31&expire=1446920919&pl=24&mv=u&upn=EGrwyWmdOXw&mt=1446899191&ms=au&signature=B8751A6FFA4FFA0A2DD90BFBF029C6D3ED07F731.9921F1A3EC1E7E183046B47C97C4ED5CB91F16CA&id=o-AGiCjSABAUqZfirv3OJO6voRykh6BWOMCQagnRmRy7gN&lmt=1441795004432225&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&source=youtube&requiressl=yes&sver=3&ratebypass=yes&itag=22&dur=120.743&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&fexp=9407169%2C9407538%2C9408710%2C9413278%2C9414764%2C9416126%2C9417683%2C9417707%2C9418401%2C9419838%2C9420453%2C9421174%2C9421645%2C9421913%2C9422596%2C9422618%2C9422996%2C9423341%2C9423421%2C9423662%2C9423667%2C9423789%2C9424064&mime=video%2Fmp4&key=yt6', '720p', 'No', 35747637, 'Success', '2015-11-07 12:29:38', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 12:29:35'),
(36, 4, 1, 1, NULL, 'webm', 'Hello Adel lyrics', 4788554, 'https://www.youtube.com/watch?v=vcxMt6V6ZDs', 'https://r18---sn-5hne6nel.googlevideo.com/videoplayback?ms=au&itag=43&mt=1446899191&mv=u&upn=ztoiafB_nDk&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mm=31&mn=sn-5hne6nel&id=o-AGr9XmTnr80I87z3ljRfbkBcBl--IKCsYjLJxlzsBQO5&sver=3&fexp=9408710%2C9410705%2C9414764%2C9416126%2C9416985%2C9417206%2C9417683%2C9417707%2C9419445%2C9419838%2C9420453%2C9421508%2C9421584%2C9421931%2C9422360%2C9422596%2C9422618%2C9423170%2C9423509%2C9423662%2C9423714%2C9423792&signature=593BE15308510AB27BDCBC0A5F4BA2DD6DB5C7F9.0E80A567FC85348DDDFC4F60FA9890379204368C&ip=176.9.235.198&requiressl=yes&lmt=1445692842398178&ratebypass=yes&source=youtube&dur=0.000&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ipbits=0&expire=1446921283&mime=video%2Fwebm&pl=24', '360p', 'No', 4788554, 'Success', '2015-11-07 12:34:53', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 12:34:51'),
(37, 4, 1, 1, NULL, 'mp4', 'Hello Adel lyrics', 5633227, 'https://www.youtube.com/watch?v=vcxMt6V6ZDs', 'https://r18---sn-5hne6nel.googlevideo.com/videoplayback?ms=au&itag=18&mt=1446899191&mv=u&upn=ztoiafB_nDk&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mm=31&mn=sn-5hne6nel&id=o-AGr9XmTnr80I87z3ljRfbkBcBl--IKCsYjLJxlzsBQO5&sver=3&fexp=9408710%2C9410705%2C9414764%2C9416126%2C9416985%2C9417206%2C9417683%2C9417707%2C9419445%2C9419838%2C9420453%2C9421508%2C9421584%2C9421931%2C9422360%2C9422596%2C9422618%2C9423170%2C9423509%2C9423662%2C9423714%2C9423792&signature=5B52DFBBD15F9285EE58221B1FA32F6E900663A2.CB2C6B3A2222BA7886DE1AB1017E4CB8DD96CC1F&ip=176.9.235.198&requiressl=yes&lmt=1445932923681044&ratebypass=yes&source=youtube&dur=231.456&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ipbits=0&expire=1446921283&mime=video%2Fmp4&pl=24', '360p', 'No', 5633227, 'Success', '2015-11-07 12:35:20', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 12:35:15'),
(38, 4, 1, 1, NULL, 'webm', 'CorelDRAW X6 killer new smear tutorial you have to see to believe', 25892935, 'https://www.youtube.com/watch?v=oVA3ByyG15Y', 'https://r5---sn-5hne6n7l.googlevideo.com/videoplayback?nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&ratebypass=yes&sver=3&requiressl=yes&signature=B688FF013C381695DD84E8663EFF65179242349A.9E378958BBDCAD9582245A3DB02F5B97DDA83F3E&pl=24&source=youtube&mime=video%2Fwebm&expire=1446923041&itag=43&fexp=9408710%2C9414602%2C9414764%2C9414929%2C9416126%2C9417683%2C9417707%2C9418199%2C9420453%2C9421084%2C9421144%2C9421166%2C9421264%2C9422342%2C9422509%2C9422596%2C9422618%2C9422674%2C9422947%2C9423662%2C9423793&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&dur=0.000&mn=sn-5hne6n7l&mm=31&lmt=1332199547829471&ms=au&mv=u&mt=1446901018&ipbits=0&key=yt6&ip=176.9.235.198&upn=MD3C6wQ0lBo&id=o-AL8vKcMOTb1iwLM2AlDJdcPrN537FefGKNv73wo78rw3', '360p', 'No', 25892935, 'Success', '2015-11-07 13:04:12', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 13:04:11'),
(39, 2, 1, 1, NULL, 'mp4', 'Yanni - Rainmaker', 14608991, 'https://www.youtube.com/watch?v=RvJH_POzxmc', 'https://r6---sn-5hne6ne7.googlevideo.com/videoplayback?id=o-ACFWqjEMSxtwprFOhizfxHObWSlfgzVuHaSRz26fh1xA&ms=au&mt=1446903718&mv=u&pl=24&source=youtube&mm=31&mn=sn-5hne6ne7&ratebypass=yes&ip=176.9.235.198&itag=18&upn=eqXhVUcF9AU&dur=325.032&mime=video%2Fmp4&sver=3&signature=0E16B05CBCCEAF4A62100BA59334ED5B92223DB4.7CE6B358FBF66F3BC731753DDF14EC9A0CF58252&expire=1446925861&fexp=9408710%2C9414764%2C9416126%2C9416837%2C9417683%2C9417707%2C9419837%2C9420453%2C9420540%2C9421249%2C9421469%2C9422515%2C9422596%2C9422618%2C9422993%2C9423510%2C9423662%2C9423715%2C9423789%2C9423939&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ipbits=0&requiressl=yes&lmt=1429591901638785&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&key=yt6', '360p', 'No', 14608991, 'Success', '2015-11-07 13:51:09', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 13:51:06'),
(40, 2, 1, 1, NULL, 'mp4', 'David Gilmour & Roger Waters (Pink Floyd) Live 2010 (Palestinian Charity)', 305971268, 'https://www.youtube.com/watch?v=eCq5wtSO-qI', 'https://r1---sn-5hne6n7r.googlevideo.com/videoplayback?id=o-AA-gYo7tB--lMjnng2JkmbvU8ho-nm6TdhCRgA_rE3FF&itag=22&pl=24&ms=au&mt=1446905926&mv=u&ip=176.9.235.198&mm=31&mn=sn-5hne6n7r&ipbits=0&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&source=youtube&dur=1640.768&lmt=1394269098819091&sver=3&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&ratebypass=yes&signature=8E73F9D2F5EA0FB5CA08FAB7830A912670002397.38A64529DDB436858F57B45597A89CF2F6F241F4&mime=video%2Fmp4&key=yt6&upn=NAj0lQ4Nulk&expire=1446927731', '720p', 'No', 305971268, 'Success', '2015-11-07 14:23:13', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 14:23:09'),
(41, 4, 1, 1, NULL, 'mp4', '"The Deepest Place On Earth"  Amazing Full Documentary 2015', 161298135, 'https://www.youtube.com/watch?v=H6HmEXTPAfc', 'https://r6---sn-5hne6ned.googlevideo.com/videoplayback?lmt=1432202294113150&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=30F25D49D3B1C822C1E9DF370705F6837987869B.59A279DEE697DC9BEF9DA8D342362AC3515FB61B&dur=2694.606&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&sver=3&key=yt6&upn=ru_K6yjAXIM&ipbits=0&ratebypass=yes&itag=18&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&ip=176.9.235.198&mime=video%2Fmp4&requiressl=yes&mn=sn-5hne6ned&pl=24&source=youtube&mm=31&mv=u&mt=1446907654&ms=au&id=o-ALbp2RXqmxcpL7aWpX-74tJGbG_JQW2LoDGYcAKSzjvx&expire=1446929845', '360p', 'No', 161298135, 'Success', '2015-11-07 14:57:52', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 14:57:51'),
(42, 9, 1, 1, NULL, 'mp4', 'A Closer Look - Aerospace Engineering', 16947459, 'https://www.youtube.com/watch?v=vCGx-HnvqGA', 'https://r2---sn-5hne6nez.googlevideo.com/videoplayback?ms=au&mt=1446921467&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198&requiressl=yes&fexp=9408710%2C9412777%2C9414764%2C9416126%2C9416838%2C9417223%2C9417683%2C9417707%2C9418204%2C9418750%2C9420453%2C9420718%2C9421250%2C9422596%2C9422618%2C9423510%2C9423662%2C9423790&id=o-AGTnHL0JZSXmDm6Hppeq-JEfp1-ivE87HGCI92ErbnM5&pl=24&mm=31&mn=sn-5hne6nez&source=youtube&upn=_StOvNjpFVI&lmt=1403838829756608&mime=video%2Fmp4&key=yt6&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&signature=5611CC1DD873BF7D68091A2CC65053DE581A6230.57BF9A327AC3A7B2ECBE63CECB5067C41AE3457B&itag=18&ratebypass=yes&expire=1446943228&sver=3&ipbits=0&dur=302.323', '360p', 'No', 16947459, 'Success', '2015-11-07 18:40:35', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 18:40:34'),
(43, 1, 1, 1, NULL, 'mp4', '‫اعتراض های یک پسر جوان در کلاس بازیگری شهاب حسینی، جنجال آفرین شد!‬‎', 46896692, 'https://www.youtube.com/watch?v=P4TYUENNfck', 'https://r13---sn-5hne6n7r.googlevideo.com/videoplayback?nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&requiressl=yes&ratebypass=yes&source=youtube&dur=854.006&pl=24&itag=18&ipbits=0&lmt=1431780028068217&sver=3&expire=1446943796&mime=video%2Fmp4&key=yt6&upn=ULdnb5xNbY4&mm=31&mn=sn-5hne6n7r&mt=1446922069&mv=u&ms=au&signature=D0CC5F0F1C377D309FF2375AF8B77558B71E1436.71BBC3AE01864495BC26846694AB29859F2912EB&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9407187%2C9408710%2C9412776%2C9414764%2C9415982%2C9416126%2C9416984%2C9417683%2C9417690%2C9417707%2C9418999%2C9420453%2C9421913%2C9421932%2C9422150%2C9422596%2C9422618%2C9423347%2C9423662%2C9423793%2C9424061&ip=176.9.235.198&id=o-AHY6nLs2TaKGRxAlUpNZ-U7O4QrMzkL3P_jD3GMiweH0', '360p', 'No', 46896692, 'Success', '2015-11-07 18:50:20', '2015-11-15 05:42:48', '2015-11-15 05:42:48', '2015-11-07 18:50:17'),
(44, 1, 2, 1, '7e820dbf15759c703bbced2c186e5ce7.mp4', 'mp4', 'Mid Air Plane Crash New York City United Airlines vs Trans World Airlines Mid Air Crash', 8196826, 'https://www.youtube.com/watch?v=gYwTtgC-k1Y', 'https://r2---sn-5hne6n7l.googlevideo.com/videoplayback?id=o-AHceh2A14_X7oq5-aXjp33nSqXu1SW9DNAGJPnpvVkyy&mn=sn-5hne6n7l&mm=31&ip=176.9.235.198&signature=59B129CB3F462B8B1110E8D3253C6941D1DE8454.83D3A490F9FDC5596B52E630EA022E2933AB3C07&source=youtube&ms=au&mv=u&mt=1446961646&dur=106.881&lmt=1427897725150421&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&key=yt6&mime=video%2Fmp4&fexp=9406994%2C9408710%2C9413032%2C9414764%2C9416126%2C9417683%2C9417707%2C9418203%2C9418437%2C9419355%2C9419488%2C9420142%2C9420453%2C9420708%2C9422364%2C9422506%2C9422596%2C9422618%2C9422673%2C9422918%2C9423662%2C9423792%2C9424114&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&expire=1446983707&requiressl=yes&sver=3&itag=18&ratebypass=yes&pl=24&upn=QfcVayXzfkM&ipbits=0', '360p', 'No', 8196826, 'Success', '2015-11-08 05:55:21', '0000-00-00 00:00:00', '2015-11-08 05:55:44', '2015-11-08 05:55:18'),
(45, 4, 2, 1, '6dc4c9aed9c82fbf07df52b40b93539d.3gp', '3gp', '2016 The All-New BMW 7 Series vs Mercedes-Benz S-Class || Exterior Interior and Drive', 3226657, 'http://www.youtube.com/watch?v=aR2SrSkSRMw', 'https://r10---sn-5hne6nez.googlevideo.com/videoplayback?signature=695AFA78A26AD0174AD07A12608FC2B751AAED0C.66D1655F9F3741027FF37A519E7DA0162E723129&sver=3&mv=u&pl=24&mt=1446969951&ms=au&id=o-AKJ5uzmO0fmXla0POaADVw8tbRp00n9xe1T6_AI1-aNs&mn=sn-5hne6nez&source=youtube&mm=31&expire=1446991806&ip=176.9.235.198&ipbits=0&itag=17&lmt=1434908423338836&mime=video%2F3gpp&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=U0IBwieeR0A&fexp=9407478%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&dur=312.726&key=yt6', '144p', 'No', 3226657, 'Success', '2015-11-08 08:10:13', '0000-00-00 00:00:00', '2015-11-08 08:10:27', '2015-11-08 08:10:13'),
(46, 2, 2, 1, 'a9238a64ad658de4c15da98fa85a43de.3gp', '3gp', 'Maz Jobrani', 3285830, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?mt=1446988168&lmt=1394254317288335&itag=17&upn=FE9Wz_SWH9I&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&fexp=9405348%2C9407116%2C9408013%2C9408507%2C9408710%2C9414764%2C9416126%2C9416837%2C9417423%2C9417683%2C9417707%2C9418199%2C9420453%2C9420736%2C9421667%2C9422484%2C9422596%2C9422618%2C9423231%2C9423430%2C9423510%2C9423662%2C9423793%2C9423939&signature=BB7195E8D933E10DB92AB8383E5FCB2B575FFCF9.751026BDA5E24CC191CB1C113256BFE5BC0DEA30&source=youtube&mv=u&dur=319.924&ms=au&ip=176.9.235.198&mime=video%2F3gpp&pl=24&ipbits=0&mm=31&mn=sn-5hne6n7d&id=o-AL4N9wk-moE28Wg0AKkcXnTpXqagWjwnxOlBrfFKHzFj&expire=1447009831&key=yt6', '144p', 'No', 3285830, 'Success', '2015-11-08 13:10:39', '0000-00-00 00:00:00', '2015-11-08 13:10:59', '2015-11-08 13:10:36');
INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(47, 2, 2, 1, '7676ac278afe9db26527337834c004b7.mp4', 'mp4', 'Maz Jobrani', 14171127, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?lmt=1394254337309290&upn=FE9Wz_SWH9I&requiressl=yes&sver=3&source=youtube&mime=video%2Fmp4&pl=24&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&expire=1447009831&key=yt6&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ratebypass=yes&fexp=9405348%2C9407116%2C9408013%2C9408507%2C9408710%2C9414764%2C9416126%2C9416837%2C9417423%2C9417683%2C9417707%2C9418199%2C9420453%2C9420736%2C9421667%2C9422484%2C9422596%2C9422618%2C9423231%2C9423430%2C9423510%2C9423662%2C9423793%2C9423939&signature=2264D7F7D05F966CF696D9E25624F98B18A9CC44.42DE8BB0300CF7032AF393D0BCB89A4609031E5A&mt=1446988168&mv=u&dur=319.599&ms=au&ip=176.9.235.198&ipbits=0&mm=31&mn=sn-5hne6n7d&id=o-AL4N9wk-moE28Wg0AKkcXnTpXqagWjwnxOlBrfFKHzFj', '360p', 'No', 14171127, 'Success', '2015-11-08 13:19:24', '0000-00-00 00:00:00', '2015-11-08 13:20:08', '2015-11-08 13:19:18'),
(48, 2, 2, 1, 'b84050334435beeaf78b05d9d8327687.3gp', '3gp', 'Maz Jobrani', 3285830, 'https://www.youtube.com/watch?v=fYlaIxNX01Q', 'https://r16---sn-5hne6n7d.googlevideo.com/videoplayback?upn=Yv5Pnqwvz64&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447012209&sver=3&ipbits=0&signature=33F66DDFA1DF069CF07F0BE5627EB92DD2818FBE.8A2DB6FD75B5D3412E6D0268BB6BDBD79CA8A124&key=yt6&mime=video%2F3gpp&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mn=sn-5hne6n7d&mm=31&fexp=9408710%2C9413277%2C9414764%2C9416126%2C9416555%2C9417683%2C9417707%2C9418183%2C9419892%2C9420453%2C9420482%2C9421167%2C9421647%2C9422512%2C9422596%2C9422618%2C9422674%2C9423341%2C9423429%2C9423468%2C9423606%2C9423662%2C9423789&mt=1446990550&id=o-ADzYHHqo_RcOSYxZVkU5rRwJ0Ozfqyw3ZejsQmJVghy3&mv=u&source=youtube&ms=au&lmt=1394254317288335&ip=176.9.235.198&itag=17&pl=24&dur=319.924', '144p', 'No', 3285830, 'Success', '2015-11-08 13:59:39', '0000-00-00 00:00:00', '2015-11-08 14:00:38', '2015-11-08 13:59:34'),
(49, 1, 2, 1, '37aa22cd4a645b4b21b7f237558feb1a.flv', 'flv', 'Mehran Ghafoorian - جوک گفتن مهران غفوریان  ، آخر خنده', 3464156, 'http://www.youtube.com/watch?v=kbfIT19a4QQ', 'https://r2---sn-5hne6n7z.googlevideo.com/videoplayback?ipbits=0&dur=115.539&key=yt6&sver=3&expire=1447028138&ms=au&itag=5&source=youtube&upn=Fwel6TRVRY0&mm=31&mn=sn-5hne6n7z&id=o-AMnFyvACwy8YkdblznDbxvDwZm4BlGQTU3CEmD_BJMzv&pl=24&fexp=9406990%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&signature=C2802A27498817B038FE38392705CC4D14188CAA.C89015799D0FA8D71B0AF097B6DF549D40938283&ip=176.9.235.198&requiressl=yes&mt=1447006097&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fx-flv&lmt=1388535282328451', '240p', 'No', 3464156, 'Success', '2015-11-08 18:16:34', '0000-00-00 00:00:00', '2015-11-08 18:17:31', '2015-11-08 18:16:30'),
(50, 2, 2, 1, 'cb30ae46bdd62c0d4cd087273cc9ab5e.mp4', 'mp4', '‫ای ساربان - محسن نامجو - مونترال مارچ Mohsen Namjoo - Ey Sareban - 2013‬‎', 48452215, 'http://www.youtube.com/watch?v=WxtnevrizkU', 'https://r11---sn-4g57knk7.googlevideo.com/videoplayback?expire=1447028348&sver=3&dur=263.430&pl=24&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ratebypass=yes&upn=r5--Ym9iN0s&id=o-AB58WpjVMPmNu_uBplYdkYImHF4kORuW1oyjuPoCg-id&initcwndbps=3265000&key=yt6&lmt=1387817706276433&ip=176.9.235.198&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&mv=m&mt=1447006651&source=youtube&requiressl=yes&mime=video%2Fmp4&mn=sn-4g57knk7&mm=31&itag=22&ipbits=0&signature=3F431EE8EF2FE0F1272D6BC49CA792221BBBC256.4A5C27A30E7540F2F2F90CBCE192B668E89A29C5', '720p', 'No', 48452215, 'Success', '2015-11-08 18:20:31', '0000-00-00 00:00:00', '2015-11-08 18:23:04', '2015-11-08 18:20:29'),
(51, 1, 2, 1, 'caa29b71510561fcbbde324642c6c1a1.mp4', 'mp4', 'FUNNY VIDEOS: Funny Cats - Funny Animals - Cat Funny Videos - Smart Cats', 5795634, 'https://www.youtube.com/watch?v=prALrHUJ8Ns', 'https://r6---sn-5hne6n7z.googlevideo.com/videoplayback?expire=1447033655&mime=video%2Fmp4&pl=24&upn=_KTKtcnKjwA&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1447011591&mv=u&ms=au&itag=18&mm=31&mn=sn-5hne6n7z&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&id=o-ABDCS_kEyQKoBL6QMuurAhnQC7kPV63-x8Z-2q2lKnSS&sver=3&ip=176.9.235.198&requiressl=yes&signature=10E28A3E6EBFDCC5FEB4C28064F43544B6EDD592.AF20B66E116708E3417230B28CB757051DF3976A&key=yt6&ipbits=0&ratebypass=yes&source=youtube&dur=106.509&lmt=1434607700772226&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE', '360p', 'No', 5795634, 'Success', '2015-11-08 19:47:53', '0000-00-00 00:00:00', '2015-11-08 19:48:14', '2015-11-08 19:47:53'),
(52, 1, 2, 1, '4e50f86f6dcb65c90ba225380cc5e9a6.mp4', 'mp4', '‫اعتراض های یک پسر جوان در کلاس بازیگری شهاب حسینی، جنجال آفرین شد!‬‎', 46896692, 'https://www.youtube.com/watch?v=P4TYUENNfck', 'https://r13---sn-5hne6n7r.googlevideo.com/videoplayback?lmt=1431780028068217&upn=aFKO99e0sPs&sver=3&source=youtube&ratebypass=yes&mn=sn-5hne6n7r&mm=31&key=yt6&ip=176.9.235.198&signature=55D9B73925DFDBB19691EB129CFB536D927CB555.39A039CCE8A84FFA59162EDA6D6EC4D80F89C6A5&ms=au&ipbits=0&initcwndbps=333750&mv=m&mt=1447012333&requiressl=yes&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&dur=854.006&fexp=9408710%2C9414764%2C9416126%2C9416484%2C9416838%2C9417683%2C9417707%2C9418203%2C9419444%2C9420453%2C9421645%2C9422141%2C9422431%2C9422491%2C9422578%2C9422596%2C9422618%2C9422844%2C9423510%2C9423642%2C9423662%2C9423790&id=o-AP8TTiES2SXw1p4TrHvSkt9Pxe0NVFysP7T5aHHtdnht&itag=18&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&pl=24&mime=video%2Fmp4&expire=1447033996', '360p', 'No', 46896692, 'Success', '2015-11-08 19:53:38', '0000-00-00 00:00:00', '2015-11-08 19:55:00', '2015-11-08 19:53:35'),
(53, 1, 2, 1, '49c7db68f5b958d3a7ff05f53e98f4c9.mp4', 'mp4', 'German Shepherd Facts', 9805481, 'https://www.youtube.com/watch?v=4uWVDE5CkLw', 'https://r4---sn-5hne6n7e.googlevideo.com/videoplayback?ratebypass=yes&expire=1447035460&ipbits=0&dur=134.350&sver=3&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&mime=video%2Fmp4&key=yt6&signature=AC5A520F759450A564704700603F206439C8382A.BF760E05B2191D3E2676BE3072EB189CAA891CA0&source=youtube&upn=lDlutVWW4mo&itag=18&lmt=1429597072579038&initcwndbps=1877500&mt=1447013734&mv=m&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&ip=176.9.235.198&requiressl=yes&fexp=9406714%2C9408710%2C9409246%2C9410705%2C9412859%2C9414764%2C9415416%2C9416126%2C9417009%2C9417683%2C9417707%2C9419446%2C9420175%2C9420453%2C9421170%2C9421378%2C9421685%2C9422484%2C9422541%2C9422596%2C9422618%2C9423662%2C9423793%2C9424115&mm=31&mn=sn-5hne6n7e&id=o-AChjIMt8iwRq2H4vpZZUqQkmdnDVxykmGyZdF83L-Kpx&pl=24', '360p', 'No', 9805481, 'Success', '2015-11-08 20:18:06', '0000-00-00 00:00:00', '2015-11-08 20:18:45', '2015-11-08 20:18:01'),
(54, 1, 2, 1, '6acdec7abe055a435475fcf085ff039b.mp4', 'mp4', 'Maz Jobrani - Persian Cat (from Axis of Evil)', 19123454, 'https://www.youtube.com/watch?v=WwHOBJoASsM', 'https://r1---sn-5hne6n7z.googlevideo.com/videoplayback?fexp=9407015%2C9408710%2C9414764%2C9416126%2C9416837%2C9417380%2C9417683%2C9417707%2C9419446%2C9420453%2C9420570%2C9420718%2C9420772%2C9421212%2C9421353%2C9421744%2C9422140%2C9422151%2C9422596%2C9422618%2C9422847%2C9423510%2C9423662%2C9423790&mime=video%2Fmp4&upn=yG4TyxXHYOc&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&initcwndbps=2940000&signature=240191D66E853A9221356C3DAC84B37D20510B8F.AE9C5CF23A990BDFCA47D2953AD6A44351329D14&pl=24&ratebypass=yes&mt=1447014585&mv=m&ms=au&expire=1447036278&sver=3&source=youtube&requiressl=yes&mm=31&mn=sn-5hne6n7z&ipbits=0&itag=18&id=o-AAhsoRpbhsVcLsURSVCmLpL_ckTrTZiilvn2b2xf_-36&ip=176.9.235.198&key=yt6&lmt=1431936788683728&dur=260.876', '360p', 'No', 19123454, 'Success', '2015-11-08 20:32:15', '0000-00-00 00:00:00', '2015-11-08 20:51:06', '2015-11-08 20:32:09'),
(55, 1, 2, 1, '90b5d201a4a49f6fc53a5ffa4140746a.3gp', '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?dur=114.660&itag=17&pl=24&ip=176.9.235.198&mm=31&mn=sn-5hne6n7s&expire=1447070264&sver=3&id=o-AA7K2f4C7DQV18yh1eK39zbVmvr03KahFnf3ipIPUKKZ&fexp=9408710%2C9409208%2C9410705%2C9414764%2C9416126%2C9417683%2C9417690%2C9417707%2C9418204%2C9420453%2C9420891%2C9421793%2C9421943%2C9422596%2C9422618%2C9423162%2C9423329%2C9423509%2C9423662%2C9423791&signature=899B6632D06232F9952D73B547EFC0C5430A8B74.ACAD0028145FD0C16281F3AC435BE12058F9B64E&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ms=au&mt=1447048598&mv=u&key=yt6&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1431268025409631&mime=video%2F3gpp&requiressl=yes&upn=VwPeuixQXb4&source=youtube', '144p', 'No', 1158879, 'Success', '2015-11-09 05:57:56', '0000-00-00 00:00:00', '2015-11-09 05:58:06', '2015-11-09 05:57:51'),
(56, 1, 2, 1, '88f69ee913506a1fa0a7feccddfe8433.3gp', '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?dur=114.660&itag=17&pl=24&ip=176.9.235.198&mm=31&mn=sn-5hne6n7s&expire=1447070264&sver=3&id=o-AA7K2f4C7DQV18yh1eK39zbVmvr03KahFnf3ipIPUKKZ&fexp=9408710%2C9409208%2C9410705%2C9414764%2C9416126%2C9417683%2C9417690%2C9417707%2C9418204%2C9420453%2C9420891%2C9421793%2C9421943%2C9422596%2C9422618%2C9423162%2C9423329%2C9423509%2C9423662%2C9423791&signature=899B6632D06232F9952D73B547EFC0C5430A8B74.ACAD0028145FD0C16281F3AC435BE12058F9B64E&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ms=au&mt=1447048598&mv=u&key=yt6&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1431268025409631&mime=video%2F3gpp&requiressl=yes&upn=VwPeuixQXb4&source=youtube', '144p', 'No', 1158879, 'Success', '2015-11-09 06:05:17', '0000-00-00 00:00:00', '2015-11-09 06:06:01', '2015-11-09 06:05:13'),
(57, 1, 2, 1, '2dcdab9d1116c4102c697d61935770b0.3gp', '3gp', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 1158879, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?dur=114.660&itag=17&pl=24&ip=176.9.235.198&mm=31&mn=sn-5hne6n7s&expire=1447070264&sver=3&id=o-AA7K2f4C7DQV18yh1eK39zbVmvr03KahFnf3ipIPUKKZ&fexp=9408710%2C9409208%2C9410705%2C9414764%2C9416126%2C9417683%2C9417690%2C9417707%2C9418204%2C9420453%2C9420891%2C9421793%2C9421943%2C9422596%2C9422618%2C9423162%2C9423329%2C9423509%2C9423662%2C9423791&signature=899B6632D06232F9952D73B547EFC0C5430A8B74.ACAD0028145FD0C16281F3AC435BE12058F9B64E&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ms=au&mt=1447048598&mv=u&key=yt6&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1431268025409631&mime=video%2F3gpp&requiressl=yes&upn=VwPeuixQXb4&source=youtube', '144p', 'No', 1158879, 'Success', '2015-11-09 06:10:02', '0000-00-00 00:00:00', '2015-11-09 06:10:12', '2015-11-09 06:10:01'),
(58, 1, 2, 1, '7d04f9e840a84d2c1116ab52b7d04c7c.mp4', 'mp4', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 36330907, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-5hne6n7s.googlevideo.com/videoplayback?itag=22&pl=24&ip=176.9.235.198&mm=31&mn=sn-5hne6n7s&expire=1447070264&id=o-AA7K2f4C7DQV18yh1eK39zbVmvr03KahFnf3ipIPUKKZ&signature=D2F7B3D92C58973382609E91722AA626DA03A8A5.ABAC1D31DFA7AB80A131E540168342EFC289821A&ms=au&mt=1447048598&mv=u&upn=VwPeuixQXb4&key=yt6&mime=video%2Fmp4&dur=114.567&ratebypass=yes&sver=3&fexp=9408710%2C9409208%2C9410705%2C9414764%2C9416126%2C9417683%2C9417690%2C9417707%2C9418204%2C9420453%2C9420891%2C9421793%2C9421943%2C9422596%2C9422618%2C9423162%2C9423329%2C9423509%2C9423662%2C9423791&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1439585510342582&requiressl=yes&source=youtube', '720p', 'No', 36330907, 'Success', '2015-11-09 06:11:11', '0000-00-00 00:00:00', '2015-11-09 06:12:29', '2015-11-09 06:11:08'),
(59, 1, 2, 1, '6fedb6181b0def33d69265b90c3f1beb.flv', 'flv', 'German Shepherd Facts', 5983588, 'https://www.youtube.com/watch?v=4uWVDE5CkLw', 'https://r4---sn-5hne6n7e.googlevideo.com/videoplayback?expire=1447072481&key=yt6&lmt=1419018823412932&requiressl=yes&mime=video%2Fx-flv&mt=1447050486&upn=8J3q8HJcRuM&nh=IgpwcjA0LmFtczE1KgkxMjcuMC4wLjE&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9416984%2C9417683%2C9417707%2C9420310%2C9420453%2C9420716%2C9421665%2C9421742%2C9422124%2C9422150%2C9422596%2C9422618%2C9423411%2C9423431%2C9423662%2C9423790%2C9423939%2C9423991&id=o-ANqkS8ROluLowd1-SvFTSaKMrvWOl4BypG3jJVdDfAvY&ipbits=0&source=youtube&dur=134.348&mv=u&ms=au&itag=5&mm=31&ip=176.9.235.198&sver=3&mn=sn-5hne6n7e&pl=24&signature=3B759DB9035B71180E2E35DE2C109E2EB168C74E.B1E44FDDA34051A9F56F11B66347878B9E1B12D9', '240p', 'No', 5983588, 'Success', '2015-11-09 06:34:50', '0000-00-00 00:00:00', '2015-11-09 06:35:05', '2015-11-09 06:34:46'),
(60, 2, 2, 1, '08f2d4bd79b757b22977c9338dad4b02.mp4', 'mp4', 'Best Of Dariush Eghbali Part 1', 85212503, 'https://www.youtube.com/watch?v=Gu1oNUQggl0', 'https://r16---sn-5hne6nl7.googlevideo.com/videoplayback?dur=5606.132&expire=1447072412&sver=3&fexp=9406994%2C9407538%2C9408710%2C9412878%2C9414764%2C9416126%2C9417683%2C9417707%2C9418164%2C9418204%2C9418642%2C9419837%2C9420453%2C9421249%2C9421733%2C9421978%2C9422571%2C9422596%2C9422618%2C9422856%2C9423430%2C9423510%2C9423662%2C9423740%2C9423789&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmFtczE2KgkxMjcuMC4wLjE&source=youtube&ratebypass=yes&signature=5BCC0BA292C3BD1E05ECA4E1364DFDAF60F237A0.6CC87036CC83F75E01BE3A35B8FDF253C1F899ED&upn=kUZmmaj46So&itag=18&key=yt6&lmt=1431950566303151&ipbits=0&mime=video%2Fmp4&id=o-AFXKSEtoPvf71nUEaQyVcFItjUMAqp6a-ZvdtT73v99n&pl=24&mm=31&mn=sn-5hne6nl7&ms=au&mt=1447050486&mv=u&ip=176.9.235.198&requiressl=yes', '360p', 'No', 85212503, 'Success', '2015-11-09 06:46:11', '0000-00-00 00:00:00', '2015-11-09 06:48:22', '2015-11-09 06:46:06'),
(61, 7, 2, 1, 'f2922e8af21373ac0d326ee0de49a343.flv', 'flv', 'Ultimate Mitsubishi Lancer EVO Sound Compilation', 20733144, 'https://www.youtube.com/watch?v=zVcJfEfuKBQ', 'https://r19---sn-4g57kn6d.googlevideo.com/videoplayback?upn=fcbTiAcUkYc&mime=video%2Fx-flv&mn=sn-4g57kn6d&mm=31&expire=1447080754&id=o-APNLy_EZv8SQIwC1YDGG-L71wNEx5xE2BowuDYJ_FNC2&mv=u&source=youtube&ms=au&key=yt6&ip=176.9.235.198&pl=24&itag=5&dur=464.170&fexp=9408710%2C9414764%2C9416126%2C9416179%2C9416838%2C9417353%2C9417683%2C9417707%2C9418204%2C9420175%2C9420261%2C9420453%2C9420933%2C9420958%2C9421744%2C9421750%2C9422037%2C9422299%2C9422362%2C9422596%2C9422618%2C9423201%2C9423322%2C9423662%2C9423791&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&requiressl=yes&ipbits=0&sver=3&mt=1447058550&lmt=1427649039919789&signature=2231AF9A213EB601FD6CAA1128D27815A66E29BD.7A5B7943B369563136EF0748E93F30713F445D76&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire', '240p', 'No', 20733144, 'Success', '2015-11-09 08:52:43', '0000-00-00 00:00:00', '2015-11-09 08:53:29', '2015-11-09 08:52:42'),
(62, 57, 2, 1, '822cc5359d78da078057a15cb2ae212b.mp4', 'mp4', 'How to Make Violin Strings Vibrate : Violin Concepts', 11350769, 'https://www.youtube.com/watch?v=gHGS4F4Zho8', 'https://r13---sn-4g57kn7d.googlevideo.com/videoplayback?mime=video%2Fmp4&ipbits=0&ratebypass=yes&requiressl=yes&dur=69.497&sver=3&ms=au&mt=1447070862&fexp=9408351%2C9408710%2C9414764%2C9416126%2C9416851%2C9417683%2C9417707%2C9418401%2C9419837%2C9420453%2C9422596%2C9422618%2C9423510%2C9423662%2C9423703%2C9423793&mv=u&itag=22&signature=DDB4AAEED4DE5CB2441553EDC5F409BFBCE8F7D5.D85ED2AEF8B20E4479B1DA72854C0F6CA50BC1E5&mm=31&mn=sn-4g57kn7d&key=yt6&id=o-AO0qBUU-kQp41ydgiknIHQoXjGGVMRyIhqt3k-M3S3kq&expire=1447092742&ip=176.9.235.198&lmt=1391586772944754&pl=24&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=5ZSXq-0QE-0&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '720p', 'No', 11350769, 'Success', '2015-11-09 12:12:37', '0000-00-00 00:00:00', '2015-11-09 12:13:02', '2015-11-09 12:12:34'),
(63, 56, 2, 1, '0b2649add79f98e7af0065781812da09.mp4', 'mp4', 'Tual Pencere By Arash and Arian', 9282185, 'https://www.youtube.com/watch?v=0UNRWfQABhI', 'https://r16---sn-4g57knls.googlevideo.com/videoplayback?key=yt6&upn=8nu-qZfsfvs&expire=1447092991&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ratebypass=yes&itag=18&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fmp4&fexp=9408214%2C9408497%2C9408710%2C9414764%2C9416126%2C9416495%2C9417683%2C9417707%2C9418199%2C9418901%2C9419445%2C9420017%2C9420453%2C9421470%2C9422041%2C9422596%2C9422618%2C9422857%2C9423662%2C9423667%2C9423790%2C9424063&ipbits=0&sver=3&signature=DF38876702509AF41C05C1056F9D6D428B151DDB.9D8097869C26BDBA3E779153FE3D404D88469D7A&requiressl=yes&ms=au&mv=u&source=youtube&pl=24&dur=207.733&mt=1447070862&lmt=1389870948752344&ip=176.9.235.198&id=o-APH5Ulol0yi0ilQYAjB-oBRLyNH6Y7n8R2AtVrVypQrv&mn=sn-4g57knls&mm=31', '360p', 'No', 9282185, 'Success', '2015-11-09 12:17:46', '0000-00-00 00:00:00', '2015-11-09 12:18:09', '2015-11-09 12:17:43'),
(64, 59, 2, 1, '59b2d2ea45dc80dfd4e71dad160f93b9.mp4', 'mp4', 'Largest Offshore Wind Turbine - Vestas V164-7.0 MW', 8275916, 'https://www.youtube.com/watch?v=jH4ro922x2g', 'https://r1---sn-4g57kn6k.googlevideo.com/videoplayback?key=yt6&ip=176.9.235.198&mn=sn-4g57kn6k&mm=31&ms=au&id=o-ADTWTt-vinL25WktPw0jxS84FxWNVM5h7mGBkaCqSqIV&pl=24&mv=u&mt=1447072122&signature=35621BCCB3C4E907B2B8CCB7AAF3FB3646BC2C51.5644EEBF123206EC43478CFB496C2239722ED509&upn=oOU2fx-VyBY&lmt=1390337582409398&ratebypass=yes&sver=3&source=youtube&mime=video%2Fmp4&itag=18&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&expire=1447093816&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&ipbits=0&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&dur=167.648', '360p', 'No', 8275916, 'Success', '2015-11-09 12:30:31', '0000-00-00 00:00:00', '2015-11-09 12:31:18', '2015-11-09 12:30:31'),
(65, 59, 2, 1, 'e386ede87cf8ed29a77f89755e638ee9.mp4', 'mp4', 'Largest Offshore Wind Turbine - Vestas V164-7.0 MW', 8275916, 'https://www.youtube.com/watch?v=jH4ro922x2g', 'https://r1---sn-4g57kn6k.googlevideo.com/videoplayback?key=yt6&ip=176.9.235.198&mn=sn-4g57kn6k&mm=31&ms=au&id=o-ADTWTt-vinL25WktPw0jxS84FxWNVM5h7mGBkaCqSqIV&pl=24&mv=u&mt=1447072122&signature=35621BCCB3C4E907B2B8CCB7AAF3FB3646BC2C51.5644EEBF123206EC43478CFB496C2239722ED509&upn=oOU2fx-VyBY&lmt=1390337582409398&ratebypass=yes&sver=3&source=youtube&mime=video%2Fmp4&itag=18&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&expire=1447093816&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&ipbits=0&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&dur=167.648', '360p', 'No', 8275916, 'Success', '2015-11-09 12:31:46', '0000-00-00 00:00:00', '2015-11-09 12:32:10', '2015-11-09 12:31:44'),
(66, 61, 2, 1, '593b13f97d52ece6aa509c58eb8cc48b.webm', 'webm', '‫خط تولید پودر لاستیک احمدابادی 09128576794‬‎', 15852836, 'https://www.youtube.com/watch?v=LtZlRzSG_h4', 'https://r13---sn-4g57knl6.googlevideo.com/videoplayback?sver=3&id=o-AHrEQY7RtM9hzNlAvIIbWjaYI0q3zPhpsLnYAC2vl7j6&dur=0.000&mm=31&signature=08EEBC26EE383BF6EA3EBA7CB79DB929B89E59C9.C5E7ADA6E2DB3E3E500B4220D6E01B1F81110FC1&ms=au&mt=1447072476&mv=m&ip=176.9.235.198&source=youtube&requiressl=yes&itag=43&sparams=cwbhb%2Cdur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mime=video%2Fwebm&key=yt6&initcwndbps=5578750&ipbits=0&pl=24&mn=sn-4g57knl6&cwbhb=yes&ratebypass=yes&lmt=1378726831596513&fexp=9408710%2C9414764%2C9416126%2C9416838%2C9417224%2C9417683%2C9417707%2C9418203%2C9419444%2C9420453%2C9421662%2C9421931%2C9422401%2C9422521%2C9422596%2C9422618%2C9423246%2C9423629%2C9423662%2C9423792&expire=1447094137&upn=85p6mfrdGOc', '360p', 'No', 15852836, 'Success', '2015-11-09 12:35:49', '0000-00-00 00:00:00', '2015-11-09 12:36:19', '2015-11-09 12:35:45'),
(67, 65, 2, 1, 'b8a2c324ca7c26e787df0a5bf4643bbf.webm', 'webm', 'ISOTEST® Holiday Detectors - Accurate testing of pipe coatings - Slideshow - © ELMED GmbH', 5751556, 'https://www.youtube.com/watch?v=NF45YGrV5NY', 'https://r5---sn-4g57kndl.googlevideo.com/videoplayback?initcwndbps=7156250&id=o-ADoyheibkLGxZT1exem8C9rIfV5J7Dd8RXJc7I6nLDxG&upn=-6S7YkppF-U&lmt=1391524018496794&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9408940%2C9412878%2C9413129%2C9414764%2C9416126%2C9417223%2C9417683%2C9417689%2C9417707%2C9418203%2C9418906%2C9418999%2C9419973%2C9420453%2C9421561%2C9422596%2C9422618%2C9423035%2C9423510%2C9423517%2C9423662%2C9423789&key=yt6&pl=24&dur=0.000&sver=3&expire=1447094391&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ratebypass=yes&itag=43&signature=4F6322585D841436F67543A950F74D75DB444090.822F39E40A8EF47DBD7FAE43C7389D6F77509C14&ipbits=0&mt=1447072707&mv=m&ms=au&source=youtube&mime=video%2Fwebm&requiressl=yes&mm=31&mn=sn-4g57kndl', '360p', 'No', 5751556, 'Success', '2015-11-09 12:40:22', '0000-00-00 00:00:00', '2015-11-09 12:40:40', '2015-11-09 12:40:20'),
(68, 59, 2, 1, '10e536963ece0b76183a052a64b02c06.mp4', 'mp4', 'offshore wind farm and installation vessel animation', 13888612, 'https://www.youtube.com/watch?v=Bw53_Fn35zU', 'https://r12---sn-4g57knk7.googlevideo.com/videoplayback?mt=1447072707&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&lmt=1313040203594928&dur=161.320&ratebypass=yes&source=youtube&mn=sn-4g57knk7&pl=24&mv=m&ipbits=0&ms=au&expire=1447094412&mm=31&id=o-ANiZNpMAafvMw9XnpgrFgnlhVzWaQA9CfwJH7hJZVHsS&upn=3rkpEuZzcyM&itag=18&signature=730A4C3C3EA04E4E7203D1453687F103FACDB177.6D36C3140ACC9449E673C47624A25411B7782241&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&initcwndbps=7156250&requiressl=yes&key=yt6&mime=video%2Fmp4&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '360p', 'No', 13888612, 'Success', '2015-11-09 12:46:49', '0000-00-00 00:00:00', '2015-11-09 12:47:13', '2015-11-09 12:46:48'),
(69, 67, 2, 1, 'ce205c01b17916c7a34783d9702db7d9.mp4', 'mp4', 'Peter Fratzl - Max-Planck-Forschungspreis 2008 (DE)', 8436490, 'http://www.youtube.com/watch?v=9rnVJlAG8mY', 'https://r4---sn-4g57kndy.googlevideo.com/videoplayback?ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1347963954039225&requiressl=yes&source=youtube&dur=163.282&ratebypass=yes&sver=3&fexp=9406821%2C9407745%2C9408710%2C9414764%2C9416126%2C9416838%2C9417206%2C9417683%2C9417707%2C9420453%2C9421584%2C9422340%2C9422400%2C9422596%2C9422618%2C9422845%2C9422904%2C9423510%2C9423662%2C9423791&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&expire=1447094902&pl=24&itag=18&mm=31&ip=176.9.235.198&mn=sn-4g57kndy&id=o-AGn4B-fWtybvHQu5TEFnPP1V-pc30vQBzAI3Rc55Du4d&signature=3EBF79F3D10161A7D2BEBBB8F762CCE4BD6E9BD6.6FDA36E3F0862AF86D5811713041A00754F3E9AB&ms=au&mt=1447073222&upn=wamRUFLMSDw&mv=u', '360p', 'No', 8436490, 'Success', '2015-11-09 12:49:40', '0000-00-00 00:00:00', '2015-11-09 12:50:01', '2015-11-09 12:49:40'),
(70, 71, 2, 1, '6ea2a58d9845551352ed2dd0fbf4b634.3gp', '3gp', 'Burying the Ex - International Trailer (2015) - Ashley Greene Movie', 1273251, 'https://www.youtube.com/watch?v=L8gJbE3LYNs', 'https://r9---sn-4g57kn6d.googlevideo.com/videoplayback?source=youtube&dur=122.787&id=o-AMxQt4GACyZTr7SpYvZ9IwnUycWzJzXTE7jNfgreyT7O&itag=17&lmt=1428344952960461&requiressl=yes&ip=176.9.235.198&signature=C85B17A917284C395CFFDF98046EB00D19682409.914A97A95B8E5D04DB2500A57DE8D68F1F28A7AE&mt=1447073534&mv=m&pl=24&ms=au&mm=31&mn=sn-4g57kn6d&key=yt6&sver=3&mime=video%2F3gpp&expire=1447095173&initcwndbps=6131250&ipbits=0&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9410706%2C9414764%2C9416126%2C9417683%2C9417707%2C9419444%2C9419965%2C9420453%2C9421409%2C9421709%2C9421744%2C9422433%2C9422596%2C9422618%2C9422907%2C9423322%2C9423510%2C9423662%2C9423791%2C9424020&upn=yTji9kbXvJ8', '144p', 'No', 1273251, 'Success', '2015-11-09 12:53:19', '0000-00-00 00:00:00', '2015-11-09 12:53:24', '2015-11-09 12:53:16'),
(71, 4, 2, 1, '16a5a06e4829f50ac9d513edb74925d9.mp4', 'mp4', 'How to Make a Mini Crossbow', 10440990, 'https://www.youtube.com/watch?v=8dIfqEZ3gSI', 'https://r6---sn-4g57knsy.googlevideo.com/videoplayback?mime=video%2Fmp4&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&itag=18&expire=1447095490&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&fexp=9408710%2C9414764%2C9415867%2C9416126%2C9416231%2C9416359%2C9417683%2C9417707%2C9419669%2C9420453%2C9420540%2C9421263%2C9421522%2C9421824%2C9422040%2C9422366%2C9422385%2C9422398%2C9422596%2C9422618%2C9422992%2C9423191%2C9423294%2C9423510%2C9423662%2C9423739%2C9423793&dur=148.863&key=yt6&ip=176.9.235.198&mm=31&mn=sn-4g57knsy&ipbits=0&ms=au&mt=1447073793&pl=24&mv=u&signature=2EE081A34B1CB17F85D01EFD14420E0596AAF1FC.04ADDB8FDDAE3F4EACFF51DF3F4B2D23571761EB&upn=37Nmw0ecIsg&id=o-AFf53gg4euMBZFjjr69SjpJU-KaKHCBTrP1w7mfnDa7q&lmt=1429594403680637&ratebypass=yes&sver=3&source=youtube', '360p', 'No', 10440990, 'Success', '2015-11-09 12:59:29', '0000-00-00 00:00:00', '2015-11-09 12:59:52', '2015-11-09 12:59:25'),
(72, 4, 2, 1, '9a3db6fcaf2ce01e90bec98146556d6e.flv', 'flv', 'DIY Smartphone Projector - How To Make Your Phone Image 15 Times Bigger (Tutorial)', 11730392, 'https://www.youtube.com/watch?v=CIXemjuLMGg', 'https://r2---sn-4g57kndl.googlevideo.com/videoplayback?mv=m&mt=1447074145&ms=au&source=youtube&mime=video%2Fx-flv&requiressl=yes&mn=sn-4g57kndl&mm=31&initcwndbps=5257500&upn=RzqQ56KS6ZY&id=o-AB-a6qTTjYEYnL05pLiOh3GnbSbIHtA6WwOi70fB0RMF&lmt=1433926791502343&ip=176.9.235.198&fexp=9408710%2C9413209%2C9414764%2C9414935%2C9416126%2C9417259%2C9417353%2C9417683%2C9417707%2C9418204%2C9419446%2C9420311%2C9420453%2C9420539%2C9421824%2C9422596%2C9422618%2C9422857%2C9423036%2C9423662%2C9423790%2C9424058%2C9424115&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&expire=1447095798&sver=3&dur=273.215&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&itag=5&key=yt6&signature=2AE3C7D8089E1E79E5C29AD2CBDBBD155BF4C58D.35B87006EDDC4D59BBDC102CA18B17545A7468E6&ipbits=0', '240p', 'No', 11730392, 'Success', '2015-11-09 13:03:26', '0000-00-00 00:00:00', '2015-11-09 13:03:51', '2015-11-09 13:03:24'),
(73, 59, 2, 1, '1fa86bc12953222327d6193fe2e53ce8.mp4', 'mp4', 'offshore wind farm and installation vessel animation', 13888612, 'https://www.youtube.com/watch?v=Bw53_Fn35zU', 'https://r12---sn-4g57knk7.googlevideo.com/videoplayback?mt=1447072707&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&lmt=1313040203594928&dur=161.320&ratebypass=yes&source=youtube&mn=sn-4g57knk7&pl=24&mv=m&ipbits=0&ms=au&expire=1447094412&mm=31&id=o-ANiZNpMAafvMw9XnpgrFgnlhVzWaQA9CfwJH7hJZVHsS&upn=3rkpEuZzcyM&itag=18&signature=730A4C3C3EA04E4E7203D1453687F103FACDB177.6D36C3140ACC9449E673C47624A25411B7782241&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&initcwndbps=7156250&requiressl=yes&key=yt6&mime=video%2Fmp4&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '360p', 'No', 13888612, 'Success', '2015-11-09 13:19:41', '0000-00-00 00:00:00', '2015-11-09 13:20:09', '2015-11-09 13:19:39'),
(74, 4, 2, 1, 'b703861f54d410f5a4541fa5cbaec7f0.flv', 'flv', 'DIY Smartphone Projector - How To Make Your Phone Image 15 Times Bigger (Tutorial)', 11730392, 'https://www.youtube.com/watch?v=CIXemjuLMGg', 'https://r2---sn-4g57kndl.googlevideo.com/videoplayback?mv=m&mt=1447074145&ms=au&source=youtube&mime=video%2Fx-flv&requiressl=yes&mn=sn-4g57kndl&mm=31&initcwndbps=5257500&upn=RzqQ56KS6ZY&id=o-AB-a6qTTjYEYnL05pLiOh3GnbSbIHtA6WwOi70fB0RMF&lmt=1433926791502343&ip=176.9.235.198&fexp=9408710%2C9413209%2C9414764%2C9414935%2C9416126%2C9417259%2C9417353%2C9417683%2C9417707%2C9418204%2C9419446%2C9420311%2C9420453%2C9420539%2C9421824%2C9422596%2C9422618%2C9422857%2C9423036%2C9423662%2C9423790%2C9424058%2C9424115&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&expire=1447095798&sver=3&dur=273.215&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&itag=5&key=yt6&signature=2AE3C7D8089E1E79E5C29AD2CBDBBD155BF4C58D.35B87006EDDC4D59BBDC102CA18B17545A7468E6&ipbits=0', '240p', 'No', 11730392, 'Success', '2015-11-09 13:20:44', '0000-00-00 00:00:00', '2015-11-09 13:21:10', '2015-11-09 13:20:42'),
(75, 77, 2, 1, 'b2950987391464f26e0c96387a11659d.mp4', 'mp4', 'Peak Hydraulic Jar Product Animation', 6695939, 'https://www.youtube.com/watch?v=BdUmCaLj7GI', 'https://r15---sn-4g57kn66.googlevideo.com/videoplayback?signature=94FBCB5A0C350AF0C5A62D2EF97D6B0F5747883C.615A8DE2E3CE9C81B3C9C5263661563737772D23&key=yt6&fexp=9408215%2C9408710%2C9414764%2C9416075%2C9416126%2C9416837%2C9417683%2C9417707%2C9418183%2C9418400%2C9418749%2C9419817%2C9420453%2C9421667%2C9421707%2C9422596%2C9422618%2C9422945%2C9423418%2C9423510%2C9423662%2C9423789%2C9423991&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&requiressl=yes&lmt=1400147103111787&dur=146.053&source=youtube&ratebypass=yes&sver=3&expire=1447097042&upn=3xGPKgYNxPA&itag=18&id=o-AG_K122845q7HYUGhrHsSNOrXl6_hof_59Rv37a_h7tP&mn=sn-4g57kn66&mm=31&pl=24&ip=176.9.235.198&ms=au&mv=u&mt=1447074922&ipbits=0&mime=video%2Fmp4&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire', '360p', 'No', 6695939, 'Success', '2015-11-09 13:29:29', '0000-00-00 00:00:00', '2015-11-09 13:29:48', '2015-11-09 13:29:27'),
(76, 59, 2, 1, '01364d173c04456891e5e9c5149452c3.mp4', 'mp4', 'Installing monopile foundations', 12197567, 'https://www.youtube.com/watch?v=-UQz3CRqRFE', 'https://r9---sn-4g57kn7l.googlevideo.com/videoplayback?signature=5F8B80FC498102B0B1A65F1A6CB3BF36BA4F135A.91658DDE1F43F4130E8FD42D504894ABD5AF84A5&upn=H0Od95l_1Kw&ratebypass=yes&fexp=9405825%2C9408710%2C9409097%2C9409245%2C9410705%2C9414764%2C9416126%2C9416359%2C9417132%2C9417683%2C9417707%2C9418870%2C9418999%2C9419446%2C9419965%2C9420453%2C9420891%2C9421793%2C9422141%2C9422362%2C9422567%2C9422596%2C9422618%2C9423234%2C9423662%2C9423793&key=yt6&lmt=1438846495407744&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&dur=147.121&sver=3&expire=1447097517&mm=31&mn=sn-4g57kn7l&mime=video%2Fmp4&id=o-AH4qfO7PZm_b8_oos19hWf-nwSa_GlzZNumBslaD9nsA&pl=24&ipbits=0&ip=176.9.235.198&requiressl=yes&mt=1447075607&mv=u&ms=au', '360p', 'No', 12197567, 'Success', '2015-11-09 13:32:14', '0000-00-00 00:00:00', '2015-11-09 13:32:46', '2015-11-09 13:32:08'),
(77, 77, 2, 1, '107593bc048f7479c5f32aa4bf460542.mp4', 'mp4', 'alexis texas', 12270296, 'https://www.youtube.com/watch?v=fzfJmGnUlEw', 'https://r9---sn-4g57knls.googlevideo.com/videoplayback?ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&fexp=9408087%2C9408710%2C9414764%2C9416126%2C9416556%2C9417683%2C9417707%2C9418643%2C9420453%2C9420924%2C9421166%2C9422151%2C9422322%2C9422596%2C9422618%2C9422674%2C9422758%2C9423340%2C9423509%2C9423662%2C9423791%2C9423940&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&key=yt6&signature=450748C7DC64B91E59C49E40ABEFF851B13E5826.4B50CCA3424D77A616B6CF644C22B3C1B8B43A71&requiressl=yes&dur=161.192&source=youtube&lmt=1441516653817795&ratebypass=yes&expire=1447097622&upn=zbnStTkFwaI&sver=3&itag=18&mn=sn-4g57knls&mm=31&id=o-AOv7ekD_Usaow5udM3yj6-qJ_Ia6MV-OG8knT3Rq2c7l&ip=176.9.235.198&pl=24&mv=u&mt=1447075607&ms=au', '360p', 'No', 12270296, 'Success', '2015-11-09 13:33:53', '0000-00-00 00:00:00', '2015-11-09 13:34:29', '2015-11-09 13:33:53'),
(78, 59, 2, 1, 'b1aafd0841e4390b72a5863ed3c5601b.mp4', 'mp4', 'Driving of monopile', 8941698, 'https://www.youtube.com/watch?v=l4A7dLkbyYI', 'https://r9---sn-4g57kndy.googlevideo.com/videoplayback?fexp=9406852%2C9408710%2C9414764%2C9416126%2C9417367%2C9417683%2C9417707%2C9418162%2C9418204%2C9420453%2C9420539%2C9420708%2C9420929%2C9421171%2C9422596%2C9422618%2C9423420%2C9423662%2C9423792%2C9423951&itag=18&ratebypass=yes&ipbits=0&key=yt6&upn=QKtD2_gcl4o&sver=3&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&signature=6E63A7ED9CAB0DAFEAFC5E7861C064A69DD0584B.3C7BFDB70A992C74B380EE21050E7E4E0BD700C2&dur=113.870&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1242922547938264&expire=1447097662&mt=1447075607&mv=u&id=o-ABhisj_V2pNIbVV_Qo7w13fB0Id1IrlEOT244a5Tid6D&ms=au&mm=31&source=youtube&pl=24&mn=sn-4g57kndy&mime=video%2Fmp4&ip=176.9.235.198&requiressl=yes', '360p', 'No', 8941698, 'Success', '2015-11-09 13:35:02', '0000-00-00 00:00:00', '2015-11-09 13:35:31', '2015-11-09 13:35:02'),
(79, 59, 2, 1, '354a8a44c23fcf2a0dadd22041fc3706.mp4', 'mp4', 'Driving of monopile', 8941698, 'https://www.youtube.com/watch?v=l4A7dLkbyYI', 'https://r9---sn-4g57kndy.googlevideo.com/videoplayback?fexp=9406852%2C9408710%2C9414764%2C9416126%2C9417367%2C9417683%2C9417707%2C9418162%2C9418204%2C9420453%2C9420539%2C9420708%2C9420929%2C9421171%2C9422596%2C9422618%2C9423420%2C9423662%2C9423792%2C9423951&itag=18&ratebypass=yes&ipbits=0&key=yt6&upn=QKtD2_gcl4o&sver=3&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&signature=6E63A7ED9CAB0DAFEAFC5E7861C064A69DD0584B.3C7BFDB70A992C74B380EE21050E7E4E0BD700C2&dur=113.870&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1242922547938264&expire=1447097662&mt=1447075607&mv=u&id=o-ABhisj_V2pNIbVV_Qo7w13fB0Id1IrlEOT244a5Tid6D&ms=au&mm=31&source=youtube&pl=24&mn=sn-4g57kndy&mime=video%2Fmp4&ip=176.9.235.198&requiressl=yes', '360p', 'No', 8941698, 'Success', '2015-11-09 13:39:47', '0000-00-00 00:00:00', '2015-11-09 13:40:27', '2015-11-09 13:39:45'),
(80, 88, 2, 1, 'ea35ed35af36cabe99f47263e31e019a.flv', 'flv', 'Overview on Deep Water Drilling', 17441114, 'https://www.youtube.com/watch?v=YQtDiX2Dbr0', 'https://r3---sn-4g57knez.googlevideo.com/videoplayback?upn=yiVh-4CUIyE&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&lmt=1386043716131507&mn=sn-4g57knez&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&mm=31&sver=3&dur=471.118&ipbits=0&mime=video%2Fx-flv&key=yt6&ip=176.9.235.198&itag=5&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ms=au&id=o-ABG6JEcHVRcPYdabMuc17TwLHtXJ-KJVo9SivtPhIbcS&pl=24&mv=u&mt=1447076247&expire=1447098014&source=youtube&signature=241DC2E1CD3352F3D85FAD8CB6F7975B6B66491D.55B381C2861CED7156DC5095006A21C4C8BF98D4', '240p', 'No', 17441114, 'Success', '2015-11-09 13:42:02', '0000-00-00 00:00:00', '2015-11-09 13:42:49', '2015-11-09 13:41:57'),
(81, 89, 2, 1, 'bf9e209c979077cf9ca1081ece1c09f4.flv', 'flv', '‫شعر و اجرا  گروس عبدالملکیان.   Butterfly -Mixed‬‎', 3932798, 'https://www.youtube.com/watch?v=23pv91dgxpk', 'https://r11---sn-4g57knle.googlevideo.com/videoplayback?nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&source=youtube&key=yt6&mime=video%2Fx-flv&requiressl=yes&upn=K2LojOwwJEw&fexp=9407477%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&itag=5&pl=24&id=o-AHNdXvui2v3oM6VtJyNXinkk7iTn0UP0SY7aC-TYnDVG&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&mt=1447076247&ms=au&ip=176.9.235.198&lmt=1426042197995065&expire=1447098203&dur=82.651&mn=sn-4g57knle&mm=31&ipbits=0&sver=3&signature=CD002FA174EDDB99851A0A040F094A060FF49F48.6DB62EE6D82BBA5B4AD47CCB940C421D5C8D87DA', '240p', 'No', 3932798, 'Success', '2015-11-09 13:43:47', '0000-00-00 00:00:00', '2015-11-09 13:44:05', '2015-11-09 13:43:41'),
(82, 4, 2, 1, '560094173ee464678e0ad4dc4d17e5dd.mp4', 'mp4', 'Top 10 Best Animal Sex Videos Compilation ✔', 60185641, 'https://www.youtube.com/watch?v=K78pqvFfNfk', 'https://r5---sn-4g57knes.googlevideo.com/videoplayback?lmt=1444194774684473&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&source=youtube&requiressl=yes&mn=sn-4g57knes&ip=176.9.235.198&mm=31&itag=18&pl=24&mv=u&upn=EpTH1iaMolA&mt=1447078730&ms=au&signature=5969E9DF4293B8AE1E1D46730D2A8B4AB3105C21.CBEC2C86CBAD0D5A5D39944CD303EB1B7FC396C3&id=o-AIa7K0BSdxNhd-B3T6BuMVNFZW4MrjxuDKH2P1njBa5l&mime=video%2Fmp4&key=yt6&expire=1447100687&sver=3&ratebypass=yes&dur=846.019&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9407052%2C9408710%2C9414764%2C9416075%2C9416126%2C9416555%2C9417683%2C9417707%2C9417878%2C9418203%2C9420453%2C9421824%2C9421931%2C9422356%2C9422596%2C9422618%2C9423662%2C9423790%2C9423991%2C9424038%2C9424115', '360p', 'No', 60185641, 'Success', '2015-11-09 14:24:57', '0000-00-00 00:00:00', '2015-11-09 14:26:51', '2015-11-09 14:24:55'),
(83, 103, 2, 1, 'b68b0a648bd92193785c38d7947cae58.webm', 'webm', '‫پرویز و پونه - تحکیم رابطه‬‎', 991719, 'https://www.youtube.com/watch?v=Pf6gD5g45Dc', 'https://r1---sn-4g57knlz.googlevideo.com/videoplayback?requiressl=yes&sver=3&ratebypass=yes&itag=43&dur=0.000&lmt=1410335419316069&fexp=9408710%2C9412514%2C9414764%2C9416126%2C9417683%2C9417707%2C9418185%2C9419445%2C9419973%2C9420453%2C9420540%2C9422596%2C9422618%2C9423037%2C9423470%2C9423662%2C9423793%2C9423821%2C9423991%2C9424115&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&expire=1447101341&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&key=yt6&mime=video%2Fwebm&id=o-ADTkq5bbp2K_nTx0nkqhwrNXeK5Z3OSx6vhLhfMJb81y&mn=sn-4g57knlz&mm=31&ms=au&mv=u&mt=1447079412&signature=B5F22E443675676C073FCC9B188262A5AE66A036.DE6F5F058A20760F836CD0C766FB9EE3733E63FB&ip=176.9.235.198&pl=24&upn=6nOay5ZCNDQ&ipbits=0', '360p', 'No', 991719, 'Success', '2015-11-09 14:35:54', '0000-00-00 00:00:00', '2015-11-09 14:36:03', '2015-11-09 14:35:49'),
(84, 102, 2, 1, 'd44441282c7c86c6d67a53931637aa35.mp4', 'mp4', 'TU München - Rutsche', 3388188, 'https://www.youtube.com/watch?v=G-AZvTQIC18', 'https://r9---sn-4g57kn6l.googlevideo.com/videoplayback?pl=24&itag=18&source=youtube&upn=4hoBMXDLzBs&dur=48.390&ipbits=0&sver=3&expire=1447101487&lmt=1393854354122813&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&ratebypass=yes&signature=CBDA3EE72C3DC64786D6DB2CE2C9CC94BE38189A.53DA0094939A761CC5C01498B860FFF90A5772B8&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&mn=sn-4g57kn6l&mm=31&id=o-AHkIaCPZOD1HKtkY3Fm8kFzMBt24sBTBdj9e5b5Ivhmz&ip=176.9.235.198&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1447079412&ms=au', '360p', 'No', 3388188, 'Success', '2015-11-09 14:38:21', '0000-00-00 00:00:00', '2015-11-09 14:38:33', '2015-11-09 14:38:16'),
(85, 102, 2, 1, '3598a2cbbdc2a5d716edd216b55b0200.mp4', 'mp4', 'TU München - Rutsche', 3388188, 'https://www.youtube.com/watch?v=G-AZvTQIC18', 'https://r9---sn-4g57kn6l.googlevideo.com/videoplayback?pl=24&itag=18&source=youtube&upn=4hoBMXDLzBs&dur=48.390&ipbits=0&sver=3&expire=1447101487&lmt=1393854354122813&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&ratebypass=yes&signature=CBDA3EE72C3DC64786D6DB2CE2C9CC94BE38189A.53DA0094939A761CC5C01498B860FFF90A5772B8&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&mn=sn-4g57kn6l&mm=31&id=o-AHkIaCPZOD1HKtkY3Fm8kFzMBt24sBTBdj9e5b5Ivhmz&ip=176.9.235.198&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1447079412&ms=au', '360p', 'No', 3388188, 'Success', '2015-11-09 14:39:54', '0000-00-00 00:00:00', '2015-11-09 14:40:13', '2015-11-09 14:39:49'),
(86, 111, 2, 1, '34876c45c4d7ce3f05b5563fec9bbd33.mp4', 'mp4', 'Pressurized Water Reactor', 15598582, 'https://www.youtube.com/watch?v=MSFgmLW1Crw', 'https://r8---sn-4g57knlz.googlevideo.com/videoplayback?dur=362.927&sver=3&ratebypass=yes&fexp=9408710%2C9414764%2C9414824%2C9416126%2C9417683%2C9417707%2C9418355%2C9419445%2C9420453%2C9420910%2C9420929%2C9421463%2C9421824%2C9422150%2C9422354%2C9422541%2C9422596%2C9422618%2C9422778%2C9423629%2C9423662%2C9423667%2C9423793&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1433056851225482&ipbits=0&expire=1447102416&requiressl=yes&source=youtube&initcwndbps=7047500&mm=31&ip=176.9.235.198&mn=sn-4g57knlz&pl=24&itag=18&signature=2C88409578908BB4A346034398BDA89E553EC484.39085EA891DB8E9124F5ABC8E594B9F6A57F4E1F&id=o-AGAaEOo8F_lVcTFp4ZItQBHpIuMIvLPPDntGNmmk9wfT&mt=1447080705&upn=Rpo4g7OlkUY&mv=m&ms=au&key=yt6&mime=video%2Fmp4', '360p', 'No', 15598582, 'Prominent', '2015-11-09 14:54:27', '0000-00-00 00:00:00', '2015-11-09 14:55:12', '2015-11-09 14:54:25'),
(87, 109, 2, 1, 'e668dc15bf7da516cebabe6732855a92.mp4', 'mp4', 'Organic Chemistry 51B. Lecture 01. Review of Chem 51A.', 388475956, 'https://www.youtube.com/watch?v=knzou-CN2Zc', 'https://r11---sn-4g57kn66.googlevideo.com/videoplayback?nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9408210%2C9408495%2C9408710%2C9408937%2C9414764%2C9415516%2C9416074%2C9416126%2C9417683%2C9417707%2C9418204%2C9419444%2C9419817%2C9420453%2C9422339%2C9422596%2C9422618%2C9422674%2C9422752%2C9423226%2C9423662%2C9423789%2C9424057&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=22&key=yt6&lmt=1391850980291542&ratebypass=yes&signature=01E35237259A945688B6ECCEEAE978FE3333850F.CD0D3FC7F43020EFB26C68ED726F093A94DBD332&upn=mEBfG_KEv8A&ms=au&mt=1447081745&mv=u&ip=176.9.235.198&requiressl=yes&ipbits=0&mime=video%2Fmp4&id=o-APh57_k13C6tPMZQUsEnUbVd5YFW32AUa2hefNMWf5nv&pl=24&mm=31&mn=sn-4g57kn66&expire=1447103584&sver=3&dur=2518.575', '720p', 'No', 388475956, 'Success', '2015-11-09 15:13:13', '0000-00-00 00:00:00', '2015-11-09 15:24:16', '2015-11-09 15:13:11'),
(88, 124, 2, 1, '8a7f59bc3cf1c6aa14b531d958e51798.mp4', 'mp4', 'Xilinx MIPI Video Demonstration System', 6499980, 'https://www.youtube.com/watch?v=oq69AQkUWbU', 'https://r4---sn-4g57knkd.googlevideo.com/videoplayback?mn=sn-4g57knkd&mm=31&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&mv=m&mt=1447082218&ms=au&requiressl=yes&mime=video%2Fmp4&dur=145.403&id=o-AN9OIi7nkGI5rsM0wFJ9k3tWsvGw_JhroGyYM_Fmw8Hj&ipbits=0&fexp=9408710%2C9409206%2C9414764%2C9416126%2C9417683%2C9417707%2C9418183%2C9419445%2C9419887%2C9420175%2C9420453%2C9420539%2C9422150%2C9422510%2C9422596%2C9422618%2C9422909%2C9423319%2C9423662%2C9423790&lmt=1410309134361818&signature=9BD39A0B7FB049C98592E8B7657D7581915B9A86.AF16B36E4C5FFD0BA1292EBACB3A5502079E6154&source=youtube&ratebypass=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&upn=9OuwxMMsASo&initcwndbps=5915000&itag=18&expire=1447103935&sver=3&key=yt6', '360p', 'No', 6499980, 'Success', '2015-11-09 15:19:07', '0000-00-00 00:00:00', '2015-11-09 15:20:20', '2015-11-09 15:19:05'),
(89, 109, 2, 1, 'c02b94a56901e78a35fad7b9776549af.mp4', 'mp4', 'Organic Chemistry 51B. Lecture 01. Review of Chem 51A.', 388475956, 'https://www.youtube.com/watch?v=knzou-CN2Zc', 'https://r11---sn-4g57kn66.googlevideo.com/videoplayback?nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9408210%2C9408495%2C9408710%2C9408937%2C9414764%2C9415516%2C9416074%2C9416126%2C9417683%2C9417707%2C9418204%2C9419444%2C9419817%2C9420453%2C9422339%2C9422596%2C9422618%2C9422674%2C9422752%2C9423226%2C9423662%2C9423789%2C9424057&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=22&key=yt6&lmt=1391850980291542&ratebypass=yes&signature=01E35237259A945688B6ECCEEAE978FE3333850F.CD0D3FC7F43020EFB26C68ED726F093A94DBD332&upn=mEBfG_KEv8A&ms=au&mt=1447081745&mv=u&ip=176.9.235.198&requiressl=yes&ipbits=0&mime=video%2Fmp4&id=o-APh57_k13C6tPMZQUsEnUbVd5YFW32AUa2hefNMWf5nv&pl=24&mm=31&mn=sn-4g57kn66&expire=1447103584&sver=3&dur=2518.575', '720p', 'No', 388475956, 'Prominent', '2015-11-09 15:25:01', '0000-00-00 00:00:00', '2015-11-09 15:35:24', '2015-11-09 15:24:59'),
(90, 141, 2, 1, '99a90a26723bfca81f545f0557a3a106.3gp', '3gp', 'Waterwater reuse in Agriculture 1 - crop irrigation', 2787605, 'http://www.youtube.com/watch?v=OxMHaydZbow', 'https://r18---sn-4g57knsy.googlevideo.com/videoplayback?pl=24&itag=17&dur=389.445&lmt=1332165700820075&key=yt6&ip=176.9.235.198&mime=video%2F3gpp&expire=1447105452&sver=3&fexp=9407641%2C9408710%2C9413123%2C9413128%2C9414764%2C9415822%2C9415948%2C9416126%2C9416916%2C9417683%2C9417707%2C9418438%2C9418642%2C9418999%2C9420453%2C9420926%2C9422503%2C9422540%2C9422596%2C9422618%2C9422844%2C9423420%2C9423662%2C9423667%2C9423792&id=o-AMGlz2NxJ2BPeczLZVOngdLhgbbb_Dr2Je8upru4N_Gz&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&source=youtube&ipbits=0&mn=sn-4g57knsy&mm=31&requiressl=yes&signature=2DEAF34BAF474106127179B022A152F015E89000.241D78AE52BC38D4A4E69F0EDD6DF91BE9B477E5&ms=au&upn=PYU_o3YQJbQ&mv=u&mt=1447083355', '144p', 'No', 2787605, 'Prominent', '2015-11-09 15:44:50', '0000-00-00 00:00:00', '2015-11-09 15:45:02', '2015-11-09 15:44:44'),
(91, 146, 2, 1, '68c206dc8dae90013e887bd3c179c468.webm', 'webm', 'Love (2015) by Gaspar Noé''s - Official Trailer', 6453891, 'https://www.youtube.com/watch?v=bkrxAVMIpps', 'https://r11---sn-4g57knzy.googlevideo.com/videoplayback?sparams=dur%2Cgcr%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&source=youtube&dur=0.000&expire=1447105873&sver=3&ipbits=0&fexp=9408710%2C9414764%2C9415508%2C9416126%2C9416180%2C9417683%2C9417707%2C9418204%2C9418900%2C9419563%2C9419838%2C9420453%2C9421582%2C9422596%2C9422618%2C9422922%2C9423662%2C9423792%2C9423846%2C9424060&gcr=de&pl=24&mime=video%2Fwebm&id=o-ABRq6od7AXBby8LJLYEu42EoOGCtd3feeXzifvmMxgxH&mn=sn-4g57knzy&mm=31&ms=au&mv=u&mt=1447083966&requiressl=yes&ip=176.9.235.198&ratebypass=yes&upn=fAvBTmRHLIw&signature=185FDC5A7F53D5981F2E285E20AE374D6FECFD1C.0270B464E0CD2E92A649A396BE9F4CD7B94BE1A7&itag=43&lmt=1432060312268152&key=yt6', '360p', 'No', 6453891, 'Success', '2015-11-09 15:51:29', '0000-00-00 00:00:00', '2015-11-09 15:51:47', '2015-11-09 15:51:23');
INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(92, 2, 2, 1, '98a83fc772c997c803ad22ba28874e36.mp4', 'mp4', 'Real Madrid vs Manchester City 4-1 All Goals 24-07-2015 HD', 118408695, 'https://www.youtube.com/watch?v=Um_55z1BoxQ', 'https://r2---sn-4g57kn7z.googlevideo.com/videoplayback?mn=sn-4g57kn7z&mm=31&id=o-AKTNfBm_if_DIIIeyPC_o1zzR-LfVUkeaA0InIXJNvq9&ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&mt=1447086274&ms=au&fexp=9405186%2C9406821%2C9408710%2C9414764%2C9416126%2C9417345%2C9417683%2C9417707%2C9418204%2C9419488%2C9420453%2C9420539%2C9421940%2C9422596%2C9422618%2C9423510%2C9423662%2C9423790%2C9423846%2C9424037%2C9424114&ratebypass=yes&signature=AD3D7AE695CD989AC16A8A3982C1CAAFD4D1E409.A668438115F581998152437411B155CAAF7E855C&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&dur=316.070&ipbits=0&sver=3&expire=1447108252&lmt=1440743441319984&pl=24&itag=22&upn=KehQX4HAHhI&source=youtube', '720p', 'No', 118408695, 'Success', '2015-11-09 16:31:08', '0000-00-00 00:00:00', '2015-11-09 16:35:04', '2015-11-09 16:31:05'),
(93, 177, 2, 1, '17d6dcb071927b9bbb8484a027dbd599.mp4', 'mp4', 'Siavash Ghomayshi Ghoroub Live In Concert Antalya 2014', 18847884, 'https://www.youtube.com/watch?v=k0xFeRwC-mI', 'https://r8---sn-4g57kn6r.googlevideo.com/videoplayback?expire=1447109245&requiressl=yes&signature=40EBFD7655FDF773BE0C167FC86D9489129E0EBF.28989FA4F6B85A16D3A24E793924D039D7B5E458&itag=18&dur=240.698&initcwndbps=3782500&source=youtube&mm=31&fexp=9407155%2C9408710%2C9414764%2C9416126%2C9416554%2C9417683%2C9417707%2C9418199%2C9419973%2C9420310%2C9420453%2C9420924%2C9421647%2C9422124%2C9422151%2C9422429%2C9422596%2C9422618%2C9422674%2C9423421%2C9423662%2C9423792&upn=bWGh-NvNJ0M&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ipbits=0&lmt=1396169054426778&ratebypass=yes&sver=3&pl=24&id=o-AGUmshYpAE-dQwNwVc4sjlN2yF5Jl6EwkdMQYzj33NGd&mime=video%2Fmp4&mv=m&mt=1447087561&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&mn=sn-4g57kn6r&ip=176.9.235.198&key=yt6', '360p', 'No', 18847884, 'Success', '2015-11-09 16:51:36', '0000-00-00 00:00:00', '2015-11-09 16:52:20', '2015-11-09 16:51:33'),
(94, 175, 2, 1, '3d84b050e085eadd4d306619c8c44a35.3gp', '3gp', 'Lucy (2014) Making of & Behind the Scenes (Part1/2)', 3608271, 'https://www.youtube.com/watch?v=ZIhaZHBQwKE', 'https://r3---sn-4g57kn7s.googlevideo.com/videoplayback?fexp=9407053%2C9408207%2C9408710%2C9414764%2C9416126%2C9417056%2C9417683%2C9417707%2C9418999%2C9419294%2C9419445%2C9420453%2C9421211%2C9421940%2C9422331%2C9422344%2C9422596%2C9422618%2C9422908%2C9423421%2C9423510%2C9423662%2C9423790&id=o-AEdgPtGUHb0hj2Qfz0IvNIuBI-wZ6jhzSmLYV39wn2Zm&source=youtube&sver=3&dur=352.200&ip=176.9.235.198&key=yt6&mime=video%2F3gpp&itag=17&lmt=1406034620780064&requiressl=yes&mv=u&pl=24&mt=1447087959&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ms=au&ipbits=0&signature=B5EDC79E8FFC98BF5501CF848BCB33BC08B57B5F.6CF90F5F64281C056D2562CA64F8270919619B59&expire=1447109591&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=hs0qXiQ5r2c&mn=sn-4g57kn7s&mm=31', '144p', 'No', 3608271, 'Success', '2015-11-09 16:58:51', '0000-00-00 00:00:00', '2015-11-09 16:59:00', '2015-11-09 16:58:46'),
(95, 175, 2, 1, 'd51625b7eb6525abff4e963e12e40fc3.3gp', '3gp', 'Lucy (2014) Making of & Behind the Scenes (Part1/2)', 3608271, 'https://www.youtube.com/watch?v=ZIhaZHBQwKE', 'https://r3---sn-4g57kn7s.googlevideo.com/videoplayback?fexp=9407053%2C9408207%2C9408710%2C9414764%2C9416126%2C9417056%2C9417683%2C9417707%2C9418999%2C9419294%2C9419445%2C9420453%2C9421211%2C9421940%2C9422331%2C9422344%2C9422596%2C9422618%2C9422908%2C9423421%2C9423510%2C9423662%2C9423790&id=o-AEdgPtGUHb0hj2Qfz0IvNIuBI-wZ6jhzSmLYV39wn2Zm&source=youtube&sver=3&dur=352.200&ip=176.9.235.198&key=yt6&mime=video%2F3gpp&itag=17&lmt=1406034620780064&requiressl=yes&mv=u&pl=24&mt=1447087959&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ms=au&ipbits=0&signature=B5EDC79E8FFC98BF5501CF848BCB33BC08B57B5F.6CF90F5F64281C056D2562CA64F8270919619B59&expire=1447109591&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=hs0qXiQ5r2c&mn=sn-4g57kn7s&mm=31', '144p', 'No', 3608271, 'Success', '2015-11-09 16:59:24', '0000-00-00 00:00:00', '2015-11-09 16:59:39', '2015-11-09 16:59:20'),
(96, 1, 2, 1, '749907bd33e67b367093f4a008ff6d45.mp4', 'mp4', 'Modified Mitsubishi Lancer Evo X // Panda Junction', 9984063, 'https://www.youtube.com/watch?v=xbcDJvzKzQk', 'https://r4---sn-4g57kn66.googlevideo.com/videoplayback?key=yt6&ip=176.9.235.198&lmt=1439585386985713&dur=114.567&itag=18&id=o-ANn6JizY0JgcxCDKzQwc07LqVsFGJ7btwRdKNS4KS4Wm&mime=video%2Fmp4&upn=rR63CiISQsI&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=319FAA5F640EA07FDC4035B1E0395FDB1F406A5B.7997388A70F2308071E960AE002F19982A88E04A&fexp=9405348%2C9408710%2C9409207%2C9414703%2C9414764%2C9416126%2C9416179%2C9416481%2C9417204%2C9417683%2C9417707%2C9419446%2C9420453%2C9421247%2C9421912%2C9422596%2C9422618%2C9422674%2C9423036%2C9423295%2C9423510%2C9423662%2C9423790&source=youtube&pl=24&ratebypass=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&requiressl=yes&mm=31&mn=sn-4g57kn66&ipbits=0&mt=1447098627&mv=u&ms=au&sver=3&expire=1447120749', '360p', 'No', 9984063, 'Success', '2015-11-09 20:00:17', '0000-00-00 00:00:00', '2015-11-09 20:00:41', '2015-11-09 20:00:14'),
(97, 250, 2, 1, 'db2bdbb6681670008e7af57b17584d7a.mp4', 'mp4', 'The Weissenberg Effect', 5094268, 'https://www.youtube.com/watch?v=npZzlgKjs0I', 'https://r1---sn-4g57knkd.googlevideo.com/videoplayback?dur=103.096&mime=video%2Fmp4&itag=18&upn=ZQRdLBrxve4&mm=31&source=youtube&mn=sn-4g57knkd&ratebypass=yes&ip=176.9.235.198&id=o-AOf9CjK83wzBcevaJJvbTIznbOgXXb4Noc1KrJtZhxn2&ms=au&mt=1447103200&pl=24&mv=u&key=yt6&expire=1447125137&lmt=1446009239375669&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ipbits=0&sver=3&requiressl=yes&signature=8DD331530B4012349C7A51437814868FE7E2C494.5916CF6265951EE9CD749E273C50137D62E50A6D&fexp=9407537%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9417740%2C9418201%2C9418866%2C9419039%2C9420453%2C9421247%2C9421931%2C9421979%2C9422596%2C9422618%2C9423662%2C9423791', '360p', 'No', 5094268, 'Prominent', '2015-11-09 21:12:39', '0000-00-00 00:00:00', '2015-11-09 21:12:56', '2015-11-09 21:12:37'),
(98, 250, 2, 1, '350dec4d22b34ca7413370a09dcbaa49.mp4', 'mp4', 'The Barus Effect', 3685720, 'https://www.youtube.com/watch?v=KcNWLIpv8gc', 'https://r16---sn-4g57kndy.googlevideo.com/videoplayback?upn=wrAk78L7W9A&id=o-AKNGRoxQqDM06vvRVMlOlaX7ZBeVEwUSts0kRR6oXIiF&ip=176.9.235.198&key=yt6&ipbits=0&pl=24&signature=AB0D1EB70A77391B2E6DD2AA1D7FEFBE051D19F8.1BD48CD7C5E6671505AE2F60351B49537FE31005&requiressl=yes&sver=3&ratebypass=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9419446%2C9419563%2C9420453%2C9421166%2C9421745%2C9421913%2C9421946%2C9422342%2C9422364%2C9422596%2C9422618%2C9422856%2C9423510%2C9423662%2C9423792%2C9424114&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=18&expire=1447125506&mime=video%2Fmp4&source=youtube&mv=u&mt=1447103871&ms=au&lmt=1388425082689492&mn=sn-4g57kndy&mm=31&dur=78.251', '360p', 'No', 3685720, 'Prominent', '2015-11-09 21:18:54', '0000-00-00 00:00:00', '2015-11-09 21:19:07', '2015-11-09 21:18:50'),
(99, 250, 2, 1, '34cae10631c527eb54dfc43a527ee45d.mp4', 'mp4', 'extrudate swell', 1798902, 'https://www.youtube.com/watch?v=LWNhr2PM5_s', 'https://r16---sn-4g57knz6.googlevideo.com/videoplayback?nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&fexp=9407052%2C9408506%2C9408710%2C9413121%2C9414764%2C9416126%2C9416985%2C9417683%2C9417707%2C9419549%2C9420453%2C9420931%2C9421250%2C9421253%2C9421408%2C9422596%2C9422618%2C9422967%2C9423510%2C9423662%2C9423790%2C9423940%2C9424115&mime=video%2Fmp4&pl=24&source=youtube&upn=vTUdxi5vcOE&expire=1447125504&sver=3&lmt=1442403954719099&mm=31&ipbits=0&mn=sn-4g57knz6&id=o-ADFV6g47rjOng7fJEh-pKyCyFfpm1VG9F3OqzAjzm7vV&requiressl=yes&ip=176.9.235.198&mt=1447103871&dur=40.263&mv=u&ms=au&signature=978798203ED5C7AB5448824A708D681C2F0C2C6C.3893DF05BB80998AE827E672C859EE70E41EAC84&ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=18', '360p', 'No', 1798902, 'Success', '2015-11-09 21:18:57', '0000-00-00 00:00:00', '2015-11-09 21:19:14', '2015-11-09 21:18:55'),
(100, 254, 2, 1, '65467cde67577b029ba08816da4d5912.mp4', 'mp4', 'Stephen Curry Top 10 Plays of 2014-2015 NBA Playoffs!', 17129087, 'https://www.youtube.com/watch?v=-UuTI0-AfQ8', 'https://r17---sn-4g57kn6e.googlevideo.com/videoplayback?pl=24&sver=3&expire=1447126994&dur=185.016&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ratebypass=yes&itag=18&signature=29624DA4716498A03DF53A5FE1C010DA39C13504.9E598E60A49E5183BCD3AB7E6A5607282D49907B&ipbits=0&mv=u&mt=1447104918&ms=au&source=youtube&mime=video%2Fmp4&requiressl=yes&mn=sn-4g57kn6e&mm=31&gcr=de&upn=_JnL1nwU6Rc&id=o-AKRZuHYo5W1yQyJ0mK3mNyhjXtITYDplkgCeHLJMfBix&lmt=1436704744977075&key=yt6&ip=176.9.235.198&fexp=9406984%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&sparams=dur%2Cgcr%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire', '360p', 'No', 17129087, 'Success', '2015-11-09 21:43:31', '0000-00-00 00:00:00', '2015-11-09 21:45:08', '2015-11-09 21:43:29'),
(101, 253, 2, 1, 'e559ee39f22fbd0dfbca72d4ab299b0b.mp4', 'mp4', 'Professor Gerd Faltings', 3251632, 'https://www.youtube.com/watch?v=4jyJma2bPEM', 'https://r16---sn-4g57knzy.googlevideo.com/videoplayback?ipbits=0&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&lmt=1401188791827988&source=youtube&ratebypass=yes&dur=94.760&key=yt6&signature=5C53863A065D6EC130CDC0AD9434BAF08A427802.998391F8875C471B640BDB70EBA86AB5AE405FE8&ip=176.9.235.198&requiressl=yes&id=o-AHkXjBtrdw1-qvaWWNJxUCtSZN4_fjHZL5niQjqaoboQ&sver=3&fexp=9408710%2C9409205%2C9413128%2C9414764%2C9416126%2C9416916%2C9417158%2C9417683%2C9417707%2C9419544%2C9420453%2C9421744%2C9422555%2C9422596%2C9422618%2C9422921%2C9422945%2C9423642%2C9423662%2C9423724%2C9423790%2C9423992&mm=31&mn=sn-4g57knzy&itag=18&ms=au&mt=1447104918&mv=u&upn=XL7M4iYPIac&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&pl=24&expire=1447127048', '360p', 'No', 3251632, 'Success', '2015-11-09 21:44:22', '0000-00-00 00:00:00', '2015-11-09 21:45:31', '2015-11-09 21:44:18'),
(102, 253, 2, 1, '9a40b200220396eb607b1f46e7d1cc63.mp4', 'mp4', 'Professor Gerd Faltings', 3251632, 'https://www.youtube.com/watch?v=4jyJma2bPEM', 'https://r16---sn-4g57knzy.googlevideo.com/videoplayback?ipbits=0&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&lmt=1401188791827988&source=youtube&ratebypass=yes&dur=94.760&key=yt6&signature=5C53863A065D6EC130CDC0AD9434BAF08A427802.998391F8875C471B640BDB70EBA86AB5AE405FE8&ip=176.9.235.198&requiressl=yes&id=o-AHkXjBtrdw1-qvaWWNJxUCtSZN4_fjHZL5niQjqaoboQ&sver=3&fexp=9408710%2C9409205%2C9413128%2C9414764%2C9416126%2C9416916%2C9417158%2C9417683%2C9417707%2C9419544%2C9420453%2C9421744%2C9422555%2C9422596%2C9422618%2C9422921%2C9422945%2C9423642%2C9423662%2C9423724%2C9423790%2C9423992&mm=31&mn=sn-4g57knzy&itag=18&ms=au&mt=1447104918&mv=u&upn=XL7M4iYPIac&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&pl=24&expire=1447127048', '360p', 'No', 3251632, 'Prominent', '2015-11-09 21:46:04', '0000-00-00 00:00:00', '2015-11-09 21:46:42', '2015-11-09 21:46:02'),
(103, 257, 2, 1, '93886a02fb1c3fecc20c805444a42006.webm', 'webm', 'Iran, singing mullah, ملاي خندان و آواز خوان « تقليد آواز شجریان بر منبر »؛', 14247405, 'http://www.youtube.com/watch?v=vBBssluFL2w', 'https://r10---sn-4g57knk7.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fwebm&ipbits=0&ip=176.9.235.198&pl=24&mv=u&mt=1447122542&ms=au&mn=sn-4g57knk7&mm=31&id=o-APGkeDpSYoc8TzUZzWG_nWoMprEYEAE4opwJCBfi1hm1&expire=1447144502&upn=e-rQv0c7VuU&sver=3&itag=43&ratebypass=yes&requiressl=yes&dur=0.000&source=youtube&lmt=1444830911323581&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&signature=44641CC5F4C36F27FA71A15F2DFEAFA1038DF647.2358D3361B27E6DE7BED635C7E09D9C8F31DCED3&key=yt6', '360p', 'No', 14247405, 'Success', '2015-11-10 02:35:35', '0000-00-00 00:00:00', '2015-11-10 02:38:15', '2015-11-10 02:35:31'),
(104, 260, 2, 1, '4f3934dad8a39d19dbaaec012cdfa076.mp4', 'mp4', 'DARPA Director Arati Prabhakar: Long-term view should guide public-sector investments', 20586798, 'https://www.youtube.com/watch?v=2lDBtUQ_3lE', 'https://r5---sn-4g57knkz.googlevideo.com/videoplayback?itag=18&id=o-ADjDDgbUxIJzhy6hApp0eU6p18enOq3aazz9hWAv31Tx&lmt=1370551724929215&dur=453.392&key=yt6&ip=176.9.235.198&sver=3&expire=1447151007&mt=1447129303&mv=u&ms=au&mm=31&mn=sn-4g57knkz&ipbits=0&requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&signature=5A3A3DC1F39F78D32A8543BB243809DF7652B6C5.3CD4F3C5F6B038DACC9B5F9D898FFC46BD0A5331&pl=24&ratebypass=yes&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&upn=YTvqMBoFDps', '360p', 'No', 20586798, 'Prominent', '2015-11-10 04:23:43', '0000-00-00 00:00:00', '2015-11-10 04:24:33', '2015-11-10 04:23:38'),
(105, 260, 2, 1, '8a44468471f01862af15491109f1088e.mp4', 'mp4', 'Regina Dugan: Love and work', 40900071, 'https://www.youtube.com/watch?v=W95u70Iow90', 'https://r20---sn-4g57knkd.googlevideo.com/videoplayback?mt=1447129950&mv=u&pl=24&id=o-AGlElDaOn7Creyo5LOmavBdtEKiYECOEAJ59qRrkCcoC&ms=au&signature=1EDC09EF3ACA3B813146677B8AC883EA69A58710.B831727F98074264D2CF9677B3433D551151E31B&ip=176.9.235.198&key=yt6&mm=31&ipbits=0&mn=sn-4g57knkd&ratebypass=yes&source=youtube&sver=3&upn=SU-TF6-RdiU&lmt=1421849822181275&expire=1447151580&mime=video%2Fmp4&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&itag=18&fexp=9408710%2C9414764%2C9415521%2C9415792%2C9416126%2C9416555%2C9417009%2C9417509%2C9417683%2C9417707%2C9418203%2C9418405%2C9420453%2C9422540%2C9422596%2C9422618%2C9423228%2C9423429%2C9423488%2C9423509%2C9423662%2C9423792%2C9424091&dur=925.593&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes', '360p', 'No', 40900071, 'Success', '2015-11-10 04:33:16', '0000-00-00 00:00:00', '2015-11-10 04:34:40', '2015-11-10 04:33:12'),
(106, 2, 2, 1, '1e17e3267d6f1fe85746494ef8c3f1c3.mp4', 'mp4', '‫فالانژ: امریکا هیچ غلطی نمیتواند بکند !‬‎', 5147711, 'https://www.youtube.com/watch?v=qsbZXm_3EII', 'https://r9---sn-4g57knl7.googlevideo.com/videoplayback?ratebypass=yes&ipbits=0&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&expire=1447152215&fexp=9407472%2C9408498%2C9408710%2C9414764%2C9416126%2C9417157%2C9417683%2C9417707%2C9420054%2C9420453%2C9421168%2C9421249%2C9421526%2C9422571%2C9422596%2C9422618%2C9422676%2C9423662%2C9423667%2C9423789%2C9424298&mm=31&upn=IKqOCj_Eiuc&itag=18&mn=sn-4g57knl7&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=6860568F1A55FEA69D64D2000DB9CB442D889AE1.9779112A3F53F3CFD09DDAE9A701C8F26B6B92B6&key=yt6&ip=176.9.235.198&sver=3&dur=134.861&pl=24&mime=video%2Fmp4&source=youtube&ms=au&id=o-AN4T9TQ4yOXsP1giQGkkaBA8Pg5SbGJ2KsvAueBxTNwb&mv=u&mt=1447130592&lmt=1443083024997275', '360p', 'No', 5147711, 'Success', '2015-11-10 04:43:43', '0000-00-00 00:00:00', '2015-11-10 04:44:00', '2015-11-10 04:43:42'),
(107, 268, 2, 1, '06a8e123a6ee9204ee53c6ce932cf4be.flv', 'flv', '‫دانلود فیلم آموزش کامل و جامع PHP به زبان فارسی-جلسه۱‬‎', 16188529, 'https://www.youtube.com/watch?v=CylzD0Fbrj8', 'https://r20---sn-4g57knkl.googlevideo.com/videoplayback?mv=u&source=youtube&ms=au&lmt=1439936616090015&ip=176.9.235.198&key=yt6&fexp=9408710%2C9414764%2C9415870%2C9416007%2C9416126%2C9417508%2C9417683%2C9417707%2C9418203%2C9420453%2C9421166%2C9421254%2C9421582%2C9422282%2C9422596%2C9422618%2C9423241%2C9423662%2C9423667%2C9423739%2C9423790&mt=1447131669&mn=sn-4g57knkl&upn=R23LDQeWWlI&signature=32FC685755AEFBD389E329CE7E3CF8A80802E844.2F716FAAC1E7C0CA5E64A3941ADE5A64DE1478EB&mm=31&id=o-AGOawNcvuwo_hLocGP_jtlH_QzsvAb9lQcxzhoxP23Qj&mime=video%2Fx-flv&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&requiressl=yes&sver=3&itag=5&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&expire=1447153370&dur=750.837&pl=24', '240p', 'No', 16188529, 'Prominent', '2015-11-10 05:03:52', '0000-00-00 00:00:00', '2015-11-10 05:04:29', '2015-11-10 05:03:47'),
(108, 269, 2, 1, '624663e3ea01bc5d5610ca3a7bcee0df.webm', 'webm', 'zibaye khofteh زیبای خفته', 20039668, 'http://www.youtube.com/watch?v=tHc5vhgbLKo', 'https://r2---sn-4g57knzs.googlevideo.com/videoplayback?requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&dur=0.000&pl=24&initcwndbps=6512500&source=youtube&ratebypass=yes&ip=176.9.235.198&fexp=9407155%2C9408354%2C9408710%2C9413280%2C9414764%2C9415791%2C9416126%2C9416985%2C9417683%2C9417707%2C9417741%2C9418807%2C9419446%2C9420453%2C9420539%2C9421166%2C9421250%2C9422151%2C9422454%2C9422596%2C9422618%2C9423509%2C9423662%2C9423793&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-AN_6N6b4mHjq3EVV_Y8wHWN-Wja2TC0qjSf4VRdhALLf&mn=sn-4g57knzs&mm=31&upn=3EgpZeJubuY&mv=m&mt=1447133075&signature=CA71775F468DBD554DE7A240443DC26A7AB9D11F.4462F79CA0A49EEDF7B3DB484C19E3A53F67934D&ms=au&ipbits=0&sver=3&lmt=1429456115962861&itag=43&expire=1447154751&key=yt6&mime=video%2Fwebm', '360p', 'No', 20039668, 'Success', '2015-11-10 05:28:44', '0000-00-00 00:00:00', '2015-11-10 05:29:19', '2015-11-10 05:28:43'),
(109, 272, 2, 1, 'bedf647be630ab93c480a8e79883d4cf.3gp', '3gp', 'Tia Bajpai HOT SEX Scene from 1920 Evil Returns', 910174, 'https://www.youtube.com/watch?v=KnoOBX3oduw', 'https://r6---sn-4g57kne6.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1439980976214331&signature=4B47C530E27461966209318AA72E0E89B15A482C.7BFF6C9C12A2288541B3001268739468D1F90844&ip=176.9.235.198&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sver=3&source=youtube&mime=video%2F3gpp&mn=sn-4g57kne6&id=o-AHUdYlRmv-134yaidlfd18lzEg6yxHnJkeoEcylTiWNK&ipbits=0&expire=1447155426&mm=31&ms=au&fexp=9406821%2C9408710%2C9412928%2C9414764%2C9415386%2C9416126%2C9416358%2C9417097%2C9417683%2C9417707%2C9419887%2C9420453%2C9420926%2C9421931%2C9422435%2C9422596%2C9422618%2C9423420%2C9423510%2C9423662%2C9423792&pl=24&itag=17&mt=1447133464&dur=89.629&key=yt6&upn=jbkMpOKfkL4&mv=u', '144p', 'No', 910174, 'Success', '2015-11-10 05:37:17', '0000-00-00 00:00:00', '2015-11-10 05:37:24', '2015-11-10 05:37:11'),
(110, 275, 2, 1, 'c0c44052603dba613b6752071fafd749.3gp', '3gp', 'Driving Without Electronic Stability Control - Fifth Gear', 9253484, 'https://www.youtube.com/watch?v=YuUBeJSYg4o', 'https://r16---sn-4g57kn7d.googlevideo.com/videoplayback?upn=rEXTMQwUNrw&mt=1447134009&itag=36&requiressl=yes&fexp=9408710%2C9413123%2C9414764%2C9416126%2C9416484%2C9417203%2C9417683%2C9417707%2C9418162%2C9420453%2C9421210%2C9422283%2C9422454%2C9422596%2C9422618%2C9423347%2C9423428%2C9423662%2C9423666%2C9423667%2C9423791%2C9424020%2C9424378&expire=1447156019&lmt=1423564430832087&ip=176.9.235.198&source=youtube&mn=sn-4g57kn7d&pl=24&mv=u&ipbits=0&ms=au&mm=31&key=yt6&signature=66268BF96FCB060AAD5C8679906A53B4AC2C2C8D.7C69376691CF15F7390A8BCB48E8DAB50D78FC69&mime=video%2F3gpp&dur=324.011&id=o-AKZ3VBYkc4ryahFpNZv43d7_IIznW9mGTo7wLtAjVMGe&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '240p', 'No', 9253484, 'Prominent', '2015-11-10 05:48:14', '0000-00-00 00:00:00', '2015-11-10 05:48:34', '2015-11-10 05:48:11'),
(111, 278, 2, 1, '7648dc8fac562914d4e9ed3a5a407895.3gp', '3gp', 'Intraoperative Brain Mapping- Final Human Physiology Exam Project', 1739640, 'http://www.youtube.com/watch?v=nChzfxrLv7s', 'https://r4---sn-4g57knks.googlevideo.com/videoplayback?dur=223.793&sver=3&expire=1447156976&source=youtube&pl=24&ms=au&mime=video%2F3gpp&mt=1447135149&mv=u&mm=31&mn=sn-4g57knks&requiressl=yes&key=yt6&lmt=1432739611508506&id=o-AP5oD42AhwEo2gyGIahMtTAM30Er5P7AQwu2aBs8DEcT&upn=jB-4mgs8MrY&itag=36&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=19070B00D718560380B8A311CF214B4EA88327C8.4D005DCED5A94503240DB0A9AFE3F0AD6E905AF3&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9407191%2C9408710%2C9414764%2C9415943%2C9416126%2C9416485%2C9417683%2C9417707%2C9417817%2C9418200%2C9418401%2C9420415%2C9420453%2C9422483%2C9422596%2C9422618%2C9423291%2C9423317%2C9423510%2C9423662%2C9423791&ip=176.9.235.198', '240p', 'No', 1739640, 'Prominent', '2015-11-10 06:03:53', '0000-00-00 00:00:00', '2015-11-10 06:04:02', '2015-11-10 06:03:53'),
(112, 280, 2, 1, '1a3ca623c514c63450afd3941bab4634.mp4', 'mp4', 'How To Stop Procrastinating - 7 Important Tips To Overcome Procrastination', 14908641, 'https://www.youtube.com/watch?v=Vq3DXzU9mN8', 'https://r12---sn-4g57kn6e.googlevideo.com/videoplayback?pcm2=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1416974147636968&ipbits=0&source=youtube&expire=1447157114&requiressl=yes&ip=176.9.235.198&mm=31&mn=sn-4g57kn6e&itag=22&pl=24&mt=1447135149&mv=u&upn=bBIEcUbnNm8&ms=au&signature=AF9A84EF896212B7C5A479A925300F6A8C23C437.BC74E672D18A00978553506B9A25D21C22EB138E&id=o-AETGh_fsFQWaLoMqnmP7cEAir7DU5flbs-q0czSidA81&mime=video%2Fmp4&key=yt6&sver=3&ratebypass=yes&dur=405.257&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9407157%2C9408494%2C9408710%2C9414764%2C9416126%2C9417133%2C9417340%2C9417683%2C9417707%2C9418185%2C9418356%2C9418643%2C9419446%2C9420453%2C9420929%2C9421522%2C9421667%2C9421685%2C9422596%2C9422618%2C9423039%2C9423226%2C9423510%2C9423662%2C9423791', '720p', 'No', 14908641, 'Success', '2015-11-10 06:05:26', '0000-00-00 00:00:00', '2015-11-10 06:05:54', '2015-11-10 06:05:22'),
(113, 282, 2, 1, '2f8fe728239c74f32c4e3ad6dd02008b.3gp', '3gp', 'Mercedes Autonomous Driving - S500 Intelligent Drive', 3898226, 'https://www.youtube.com/watch?v=RuVtpG_feWk', 'https://r7---sn-4g57kn6k.googlevideo.com/videoplayback?key=yt6&dur=381.410&fexp=9407190%2C9408710%2C9409206%2C9413128%2C9414764%2C9416008%2C9416126%2C9417683%2C9417707%2C9420453%2C9420708%2C9421976%2C9422596%2C9422618%2C9422945%2C9422968%2C9423421%2C9423509%2C9423662%2C9423790%2C9423952%2C9424299&upn=ps8rVjgoF50&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&expire=1447157990&lmt=1419052580709412&itag=17&ipbits=0&mime=video%2F3gpp&ip=176.9.235.198&mn=sn-4g57kn6k&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&source=youtube&ms=au&id=o-ACX5XsF_qZl7xa0AqtJQmWaPKBZEM85bRvuRZR4kxemf&pl=24&mv=u&mt=1447136210&sver=3&signature=3EBE7E6964BA2A655DCA9353F911FB1111DE3FB1.0C5D4041281A01C66ABEBB0C68F4F4204A5F789F', '144p', 'No', 3898226, 'Success', '2015-11-10 06:20:05', '0000-00-00 00:00:00', '2015-11-10 06:20:17', '2015-11-10 06:20:05'),
(114, 293, 2, 1, '1d1e0b975b3eca2e0b590a77510fe025.3gp', '3gp', 'Parazit 3 گلچین پارازیت جمعه Iran Funny Joke News VoA April 29, 2011', 18378774, 'https://www.youtube.com/watch?v=jBtmWSugqVY', 'https://r7---sn-4g57knk6.googlevideo.com/videoplayback?requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mm=31&mn=sn-4g57knk6&ms=au&mt=1447140092&mv=u&dur=1803.168&key=yt6&sver=3&expire=1447162147&source=youtube&pl=24&ip=176.9.235.198&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=11DDD6F08A1A8A0EA6DC8D07424CDF06CDEA4138.921AEA0E33F1AD2BB3AB58B4FA5910229DE259C7&fexp=9408710%2C9413140%2C9414764%2C9415030%2C9416126%2C9417683%2C9417707%2C9418201%2C9418400%2C9419038%2C9419891%2C9420453%2C9420718%2C9422284%2C9422342%2C9422354%2C9422596%2C9422618%2C9422778%2C9423429%2C9423510%2C9423662%2C9423791&id=o-ALxfbI8mKw4HAZWeWRhvo39j54kwFKsGF1QatEMXievw&upn=9cscSjb8wU0&itag=17&mime=video%2F3gpp&lmt=1387206227804422', '144p', 'No', 18378774, 'Success', '2015-11-10 07:29:27', '0000-00-00 00:00:00', '2015-11-10 07:30:28', '2015-11-10 07:29:23'),
(115, 296, 2, 1, 'ea65fe26c74814fe71163b50db191b45.mp4', 'mp4', 'Excel 2013 Tutorial - Basic Macro', 15337335, 'https://www.youtube.com/watch?v=jZEQJGoIqMM', 'https://r10---sn-4g57knzy.googlevideo.com/videoplayback?signature=34BB53E8294EF33C52345212ABE3BD4C60DD8F59.B354774B891BCC386A529C0BEBB64F68608A3BF8&mt=1447140558&sver=3&requiressl=yes&dur=225.605&pl=24&ip=176.9.235.198&lmt=1429783280841402&ms=au&source=youtube&mv=u&id=o-ALkJtPLhlh_TNz38QEXnQcwKu57NcyEpek4CZprUNFDV&mm=31&mn=sn-4g57knzy&key=yt6&expire=1447162665&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&upn=YjxWAc3vfRg&itag=22&ratebypass=yes&ipbits=0&fexp=9407002%2C9407169%2C9408710%2C9414764%2C9415821%2C9416126%2C9417683%2C9417707%2C9418203%2C9418777%2C9420453%2C9421253%2C9421289%2C9421665%2C9421943%2C9422383%2C9422518%2C9422596%2C9422618%2C9422676%2C9423662%2C9423667%2C9423739%2C9423792%2C9423949&mime=video%2Fmp4', '720p', 'No', 15337335, 'Success', '2015-11-10 07:39:00', '0000-00-00 00:00:00', '2015-11-10 07:39:32', '2015-11-10 07:38:56'),
(116, 279, 2, 1, 'c477f50571e33570d01799c1783a2e1a.webm', 'webm', 'Knee Osteoarthritis and Physiotherapy Management - SingHealth Healthy Living Series', 20067340, 'https://www.youtube.com/watch?v=sN6wwkT7qxs', 'https://r12---sn-4g57kn67.googlevideo.com/videoplayback?dur=0.000&pl=24&ip=176.9.235.198&lmt=1315049523966896&ms=au&source=youtube&mv=u&id=o-AGslnjqIe1dC4r6drkbf3fpfBgtVX2aFnvABCXlsx6Ch&mm=31&mn=sn-4g57kn67&key=yt6&expire=1447164360&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=xnu4DGvebtQ&itag=43&ratebypass=yes&mt=1447142354&ipbits=0&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421018%2C9422596%2C9422618%2C9423662&mime=video%2Fwebm&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&signature=86A3BB937DAF0BA70D87797CC87C086EA3D0DA80.2B2F29BA5C3CCDDA6FE586AD17A47F413F688DCE&sver=3&requiressl=yes', '360p', 'No', 20067340, 'Success', '2015-11-10 08:06:40', '0000-00-00 00:00:00', '2015-11-10 08:07:38', '2015-11-10 08:06:39'),
(117, 302, 2, 1, 'b8f92a42a166e2c21e94b2ae79d14e61.webm', 'webm', 'Surface Pro 4:  Rumors & Speculation (2015)', 15155079, 'https://www.youtube.com/watch?v=z456k6yBeo0', 'https://r5---sn-4g57knke.googlevideo.com/videoplayback?ip=176.9.235.198&key=yt6&mm=31&mn=sn-4g57knke&ipbits=0&ms=au&mt=1447142946&mv=u&pl=24&signature=55EE42BC0D44EF5F1A11B646C36AB01CF049C881.6FC262835EE0D440AFC2B90A95978CD78D3A99BD&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&dur=0.000&mime=video%2Fwebm&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&itag=43&expire=1447164863&id=o-AA0D1JIQ8MzqcI0vXjuxm2Y9Q5icUeBcE3wlXvFmBZmr&upn=gFbSkQ7zj-o&lmt=1414218819113578&ratebypass=yes&sver=3&source=youtube', '360p', 'No', 15155079, 'Success', '2015-11-10 08:16:01', '0000-00-00 00:00:00', '2015-11-10 08:16:34', '2015-11-10 08:15:57'),
(118, 305, 2, 1, 'a55cdc89cc184a4443b91d731a7d36cf.mp4', 'mp4', 'iBT TOEFL Speaking Question 4 (3 Examples)', 15420818, 'https://www.youtube.com/watch?v=t7I5MSX42tg', 'https://r15---sn-4g57knz6.googlevideo.com/videoplayback?mn=sn-4g57knz6&mm=31&expire=1447165435&upn=QwRBt_WGVY8&itag=18&pl=24&mv=m&mt=1447143736&ms=au&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-AJJT3oxAn1Zhf8YgCwiZE3mva0bhQLe4RMuMYmaG64kH&sver=3&ratebypass=yes&initcwndbps=5112500&ipbits=0&key=yt6&lmt=1437204979809231&dur=599.516&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421017%2C9421409%2C9422596%2C9422618%2C9423662&signature=54F5DE9CA12F9C7513E55EAE8B27991020CCC328.32CBAFB46E8042A9ABC371CE08176EBE6000F9A1&source=youtube&mime=video%2Fmp4&requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '360p', 'No', 15420818, 'Prominent', '2015-11-10 08:24:16', '0000-00-00 00:00:00', '2015-11-10 08:24:55', '2015-11-10 08:24:14'),
(119, 309, 2, 1, '9d74bea5a587fd0fe712bdd8d3e5603e.mp4', 'mp4', 'Fereydoon Moshiri  فريدون مشيرى-ريشه در خاك', 14056086, 'https://www.youtube.com/watch?v=AxBCy5bMRiA', 'https://r4---sn-4g57knek.googlevideo.com/videoplayback?nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&signature=C1D2D1691022066123543AFE6363E801B3347AB3.36E333A59D59A3D50ECC64C73C0E72AFE514C781&source=youtube&upn=0YWjSUGu0q0&ratebypass=yes&requiressl=yes&mime=video%2Fmp4&ipbits=0&lmt=1388590943978958&expire=1447167603&ip=176.9.235.198&mm=31&mn=sn-4g57knek&pl=24&mt=1447145789&mv=u&dur=306.573&itag=18&ms=au&fexp=9406985%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-AKZNCbeRq_E0WIrf1gg3ataq5X7ypsW9FrQ_jB-MJhfA&key=yt6&sver=3', '360p', 'No', 14056086, 'Success', '2015-11-10 09:00:20', '0000-00-00 00:00:00', '2015-11-10 09:01:03', '2015-11-10 09:00:15'),
(120, 317, 2, 1, '53bd9d71e7cc7e2684e6410e7e8bda0a.mp4', 'mp4', 'Apostasy in islam - ارتداد در اسلام با پروفسور ریچارد داوکینز و مریم نمازی', 13439057, 'https://www.youtube.com/watch?v=liEWyDqmq3w', 'https://r13---sn-4g57kndy.googlevideo.com/videoplayback?mime=video%2Fmp4&key=yt6&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447176488&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9408710%2C9408941%2C9412857%2C9414764%2C9416075%2C9416126%2C9416903%2C9417683%2C9417707%2C9418802%2C9420238%2C9420453%2C9420539%2C9422342%2C9422596%2C9422618%2C9422904%2C9422995%2C9423662%2C9423667%2C9423793%2C9424078&lmt=1393667422124328&dur=299.653&itag=18&ratebypass=yes&sver=3&requiressl=yes&ip=176.9.235.198&ipbits=0&upn=iGvfFiDVUxI&pl=24&source=youtube&signature=B5CCB0430055E27A947963C618FBF915FD6CEF28.A620DAB4DDC1A9A6A5A9D3ABE6927AA4F577A062&mt=1447154582&mv=u&ms=au&mm=31&mn=sn-4g57kndy&id=o-AJehWkqW4bztChO7I1oVTBl2-AGQsIEuURXWTM4dmW5H', '360p', 'No', 13439057, 'Success', '2015-11-10 11:28:31', '0000-00-00 00:00:00', '2015-11-10 11:29:01', '2015-11-10 11:28:28'),
(121, 319, 2, 1, '538b0d0b6637a5adad54cd6de037f3e5.mp4', 'mp4', 'Rem Koolhaas: Designing the Central Library Structure', 8610418, 'http://www.youtube.com/watch?v=j2j8sz2BwK0', 'https://r12---sn-4g57kn7e.googlevideo.com/videoplayback?signature=6E4F9E686DBB8F12121B3B3E9D24AA12E6782B84.B56DADE212F5B3DD43BFC2FC002500CE482CBBAC&source=youtube&mime=video%2Fmp4&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mn=sn-4g57kn7e&mm=31&upn=wX-FtLzng3Y&mv=m&pl=24&mt=1447155157&ms=au&expire=1447176878&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=18&id=o-ADlMH-noWAUMPLodJpZEG4l3rt8jBK7Z016Jmcxdglu4&sver=3&ratebypass=yes&ipbits=0&initcwndbps=3826250&key=yt6&lmt=1400776856658519&dur=167.833&fexp=9407187%2C9408492%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418400%2C9420453%2C9421085%2C9422140%2C9422352%2C9422432%2C9422479%2C9422596%2C9422618%2C9423162%2C9423200%2C9423510%2C9423625%2C9423662%2C9423793', '360p', 'No', 8610418, 'Success', '2015-11-10 11:35:28', '0000-00-00 00:00:00', '2015-11-10 11:35:52', '2015-11-10 11:35:23'),
(122, 319, 2, 1, '48c3bcf1c19f5ed55977c159ff732d52.mp4', 'mp4', 'CCTV Rem Koolhaas/OMA', 7667498, 'https://www.youtube.com/watch?v=GxmfFkLZku8', 'https://r5---sn-4g57knll.googlevideo.com/videoplayback?mime=video%2Fmp4&key=yt6&upn=XTSgyHv1wKo&expire=1447177175&signature=A7165C03C952C9654BCF00FB38D006AE36B6D6E6.83BFEEBEA2B21B474897934610E9BD18DD862692&sver=3&ratebypass=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&lmt=1408756855673663&dur=188.337&source=youtube&mn=sn-4g57knll&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9417878%2C9418144%2C9418204%2C9418400%2C9420453%2C9421522%2C9421709%2C9421750%2C9422596%2C9422618%2C9423292%2C9423509%2C9423662%2C9423793%2C9424214&ip=176.9.235.198&mm=31&itag=18&ipbits=0&pl=24&id=o-AAIvgPOILRzzV_3JHn8in6OjKkiaKFAg4IMd1L3IVMKm&mt=1447155153&mv=u&ms=au', '360p', 'No', 7667498, 'Success', '2015-11-10 11:41:31', '0000-00-00 00:00:00', '2015-11-10 11:41:56', '2015-11-10 11:41:26'),
(123, 324, 2, 1, '146975e627dc5f3eb10c101df66c4042.3gp', '3gp', 'Titanic Sex Scene', 2778828, 'https://www.youtube.com/watch?v=7QND7DrOYzE', 'https://r7---sn-4g57kn6r.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=36&ip=176.9.235.198&signature=8F15D0C2ADBFF4BDA6752AF5009C232FD7AEA0EF.A0092E4DA4A51C18B6E4F18652ABE5A83695814C&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&requiressl=yes&sver=3&id=o-AND8ukdiwUinPWZ4eTiPAISaO7pYKPlssgzBiBz-Y7-9&expire=1447179854&mime=video%2F3gpp&source=youtube&ipbits=0&lmt=1434169888201789&mm=31&mn=sn-4g57kn6r&ms=au&fexp=9406714%2C9408209%2C9408499%2C9408710%2C9409245%2C9412538%2C9414764%2C9415691%2C9416126%2C9417683%2C9417707%2C9418204%2C9418750%2C9419444%2C9419838%2C9420453%2C9421084%2C9421254%2C9421665%2C9422342%2C9422596%2C9422618%2C9423293%2C9423510%2C9423662%2C9423793&mt=1447157866&pl=24&mv=u&dur=97.802&upn=5fDim_vEgMI&key=yt6', '240p', 'No', 2778828, 'Success', '2015-11-10 12:24:46', '0000-00-00 00:00:00', '2015-11-10 12:25:01', '2015-11-10 12:24:45'),
(124, 324, 2, 1, 'c1bf5cbc745eccd04c552fe8c6b71424.3gp', '3gp', 'Titanic | Kate Winslet Hot Deleted Scene', 830014, 'https://www.youtube.com/watch?v=Q-HLuszK4Es', 'https://r5---sn-4g57kn7z.googlevideo.com/videoplayback?id=o-AFH1Zefq7hQyqvoPzoeBWFGf7wFuuwa-xzcAJc-a4J8l&source=youtube&mime=video%2F3gpp&key=yt6&ip=176.9.235.198&expire=1447180144&itag=17&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&upn=1W_n7Hcpb6Y&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9417877%2C9418811%2C9419445%2C9419838%2C9420453%2C9420928%2C9421253%2C9422540%2C9422596%2C9422618%2C9423230%2C9423510%2C9423662%2C9423723%2C9423789%2C9423939&dur=80.991&mm=31&mn=sn-4g57kn7z&sver=3&requiressl=yes&signature=1362E63C2558638FEB431DECA1E770C4D7FA87FF.4B36F8021C037EF27213A550865D2630E107D2BF&lmt=1408607688231359&ipbits=0&ms=au&mt=1447158369&pl=24&mv=u', '144p', 'No', 830014, 'Success', '2015-11-10 12:29:13', '0000-00-00 00:00:00', '2015-11-10 12:29:20', '2015-11-10 12:29:13'),
(125, 324, 2, 1, '741dda845bcb28ac7ed202d392b2488b.3gp', '3gp', 'Bipasha hot sex scene in bed with John', 1228093, 'https://www.youtube.com/watch?v=qMTFZM6TIE4', 'https://r6---sn-4g57kn7l.googlevideo.com/videoplayback?lmt=1432571800675594&ip=176.9.235.198&expire=1447180286&id=o-AP1PpOukl1aDbhgc3o6jNGJfmuD4--CIYswujy6w8oFp&mn=sn-4g57kn7l&mm=31&signature=9EFBFCF4D6E5F732590F0FC75C55BA0739B7D842.D76A31864056511C7688BE661FF7F583B5892826&itag=17&sver=3&dur=120.558&mv=m&mt=1447158609&ms=au&requiressl=yes&key=yt6&mime=video%2F3gpp&ipbits=0&upn=F75a8HbgJUA&fexp=9406990%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&pl=24&initcwndbps=5481250&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube', '144p', 'No', 1228093, 'Success', '2015-11-10 12:31:34', '0000-00-00 00:00:00', '2015-11-10 12:33:07', '2015-11-10 12:31:30'),
(126, 324, 2, 1, '5ff3e1fa669243d547b33474504d7051.3gp', '3gp', 'angelina Hot sex video', 1619145, 'https://www.youtube.com/watch?v=mO3jD6Qzr68', 'https://r19---sn-4g57knd7.googlevideo.com/videoplayback?mime=video%2F3gpp&key=yt6&upn=lg2dYhAWDN0&expire=1447180860&signature=1A0E772B49EE9E34BD216E4364EE0ADDD3966161.27040A5EB691A5CE22A7B421BBEB24BB2D4B1EF6&sver=3&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&lmt=1391770014903007&dur=156.316&source=youtube&mn=sn-4g57knd7&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9406851%2C9407156%2C9407194%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9419444%2C9420453%2C9420931%2C9421165%2C9422146%2C9422342%2C9422491%2C9422596%2C9422618%2C9423429%2C9423510%2C9423662%2C9423789%2C9424038&ip=176.9.235.198&mm=31&itag=17&pcm2=no&ipbits=0&pl=24&id=o-AI1wpVWpeNw_2on-2ZWn8YDdLWI8IFzOMZhlb_eROoK7&mt=1447159001&mv=u&ms=au', '144p', 'No', 1619145, 'Success', '2015-11-10 12:41:08', '0000-00-00 00:00:00', '2015-11-10 12:41:20', '2015-11-10 12:41:07'),
(127, 71, 2, 1, '8bf67773cb0b6d06c78520f8b07265a8.3gp', '3gp', 'Criss Angel - Panties', 1322548, 'https://www.youtube.com/watch?v=mlMlsS3EMvU', 'https://r7---sn-4g57knd6.googlevideo.com/videoplayback?mt=1447160115&id=o-AAdtKphIYOM8XQ43J69mV48D1eenUfDKP3XL882L66UQ&mn=sn-4g57knd6&mm=31&ms=au&mv=u&pl=24&ipbits=0&ip=176.9.235.198&sver=3&key=yt6&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=B5A8E8D15FBBE28CD4707FA2520A67A081DF968E.39E547D9295951FCE498756CB908C424497E3084&itag=17&source=youtube&upn=0LC4e2XC4Hk&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&expire=1447182261&pcm2=yes&mime=video%2F3gpp&requiressl=yes&fexp=9405267%2C9407157%2C9408214%2C9408710%2C9414764%2C9416126%2C9416985%2C9417683%2C9417707%2C9418200%2C9418204%2C9419444%2C9420175%2C9420453%2C9421340%2C9422328%2C9422596%2C9422618%2C9422673%2C9423328%2C9423509%2C9423662%2C9423792%2C9424055%2C9424266&dur=133.375&lmt=1357512094306952', '144p', 'No', 1322548, 'Success', '2015-11-10 13:04:35', '0000-00-00 00:00:00', '2015-11-10 13:04:46', '2015-11-10 13:04:32'),
(128, 258, 2, 1, '37646d697422f384b39221fecba61c70.mp4', 'mp4', '‫دوره آموزش نرم افزار ASPEN HYSYS 8.6‬‎', 18135181, 'https://www.youtube.com/watch?v=1Wee5UrEU_4', 'https://r13---sn-4g57knld.googlevideo.com/videoplayback?nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&upn=RJh8woZt23I&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&lmt=1445138505122972&ip=176.9.235.198&expire=1447185133&id=o-AKTSf8J0DfoVPE-Hf5i5beJ6difv3isDBqYYaT2v9_Wl&mm=31&mn=sn-4g57knld&fexp=9408710%2C9414764%2C9414902%2C9416126%2C9416557%2C9417158%2C9417683%2C9417707%2C9420453%2C9421353%2C9422140%2C9422401%2C9422596%2C9422618%2C9422673%2C9422778%2C9423241%2C9423493%2C9423662%2C9423667%2C9423791&signature=C949D676AF1362D5CA98A6C799863A8249696D7C.41E15E9C72775547B6D27253734D24B94E0FD8D2&key=yt6&itag=22&mv=u&mt=1447163309&ms=au&sver=3&dur=247.803&requiressl=yes&ratebypass=yes&ipbits=0&mime=video%2Fmp4', '720p', 'No', 18135181, 'Prominent', '2015-11-10 13:52:45', '0000-00-00 00:00:00', '2015-11-10 13:53:55', '2015-11-10 13:52:42'),
(129, 351, 2, 1, '8959082765ba37a868ef5ad76bde0bd6.flv', 'flv', 'IELTS Practice Speaking test 5 Band 8 : 8.5', 14378764, 'https://www.youtube.com/watch?v=XARNs3RcC7E', 'https://r18---sn-4g57kndd.googlevideo.com/videoplayback?upn=ckIiIvtB5u0&mt=1447181348&itag=5&requiressl=yes&fexp=9408710%2C9414764%2C9416126%2C9417133%2C9417204%2C9417655%2C9417683%2C9417707%2C9418182%2C9418203%2C9418749%2C9420453%2C9420482%2C9421931%2C9422596%2C9422618%2C9422968%2C9423190%2C9423418%2C9423510%2C9423662%2C9423789%2C9424266&expire=1447203178&lmt=1394267615643506&ip=176.9.235.198&source=youtube&mn=sn-4g57kndd&pl=24&mv=u&ipbits=0&ms=au&mm=31&key=yt6&signature=CC09B4EB001B08956AC1941722260D28A39BFBBD.6336E5943D8975B90F9ACD601F490D7445877E2A&mime=video%2Fx-flv&dur=731.089&id=o-ALlumda9o1DOGgbUwelcAIgbZTW2HW5VUpbx37ZhqC_m&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '240p', 'No', 14378764, 'Prominent', '2015-11-10 18:53:13', '0000-00-00 00:00:00', '2015-11-10 18:53:50', '2015-11-10 18:53:11'),
(130, 109, 2, 1, '908615959eedd0fa65a9c950ca665604.mp4', 'mp4', 'lesson.avi mooving wall', 174768610, 'https://www.youtube.com/watch?v=yFCBb8TxOFg', 'https://r9---sn-4g57kner.googlevideo.com/videoplayback?itag=22&requiressl=yes&source=youtube&mn=sn-4g57kner&mv=u&mt=1447184845&ms=au&mm=31&signature=B8583B52231562FD540BB1AAE1389147BD7E710A.43A9F6438729C35287880CD5B4636CDD6D1707D7&mime=video%2Fmp4&dur=2707.725&id=o-APRd9i_iUFE2u_zkCOPjbFa3QDLtViN3H6wesPBNxzaK&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=TlP-SH03pSs&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&expire=1447206773&lmt=1386799421248381&ip=176.9.235.198&ratebypass=yes&pl=24&ipbits=0&key=yt6&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '720p', 'No', 174768610, 'Success', '2015-11-10 19:53:11', '0000-00-00 00:00:00', '2015-11-10 19:59:23', '2015-11-10 19:53:05'),
(131, 358, 2, 1, 'bf77be3c87711d98be4261483743d24d.mp4', 'mp4', 'Antonio Esfandiari folds straight flush against Daniel Negreanu', 6533235, 'https://www.youtube.com/watch?v=hqTjYnkIHIA', 'https://r9---sn-4g57knls.googlevideo.com/videoplayback?source=youtube&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ratebypass=yes&pl=24&signature=0A7478095455B7A562CF6F6ED6A64C47FB1C5775.6943B2C0F3E069E8696E33DFD2D61D320864FA2E&expire=1447214731&sver=3&ms=au&mv=u&mt=1447192985&ipbits=0&mn=sn-4g57knls&mm=31&requiressl=yes&id=o-AOlb8rZ8Zrgv_D6YOtVNKQGN_cTkW3llp-Rw8aN6CSeG&itag=18&dur=147.469&lmt=1394253685046499&ip=176.9.235.198&key=yt6&fexp=9408710%2C9414764%2C9415422%2C9416126%2C9417683%2C9417707%2C9418200%2C9418204%2C9418403%2C9419547%2C9420453%2C9421606%2C9421913%2C9422596%2C9422618%2C9423662%2C9423667%2C9423792&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=iWatZuKonSw&mime=video%2Fmp4', '360p', 'No', 6533235, 'Success', '2015-11-10 22:05:43', '0000-00-00 00:00:00', '2015-11-10 22:06:38', '2015-11-10 22:05:39'),
(132, 40, 2, 1, '6861cc5bc7758d9d06d515d26ff8194e.3gp', '3gp', 'Basics of Management Information Systems (MIS)', 4937484, 'https://www.youtube.com/watch?v=593SYDzCUXg', 'https://r3---sn-4g57kn66.googlevideo.com/videoplayback?upn=xlhEpbnUR5g&itag=17&mime=video%2F3gpp&source=youtube&key=yt6&expire=1447240581&fexp=9407187%2C9408710%2C9408938%2C9413279%2C9414764%2C9415942%2C9416126%2C9416555%2C9417581%2C9417683%2C9417707%2C9418201%2C9418203%2C9418401%2C9420453%2C9421252%2C9421353%2C9421552%2C9422596%2C9422618%2C9423510%2C9423662%2C9423793%2C9424207%2C9424372&signature=B1ADF5B7F323EDDAE2C7CDFCDDB394E3EC57DB8F.81A2143E7A52376D7059C8ED68FFE93B44301780&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&ipbits=0&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mm=31&ip=176.9.235.198&sver=3&mn=sn-4g57kn66&mt=1447218877&mv=u&ms=au&lmt=1395838904765745&pl=24&id=o-AHPErL4i_1cHThxXlp4--gvDnPAqVKLHH0HAy0MNL-ip&dur=554.213', '144p', 'No', 4937484, 'Prominent', '2015-11-11 05:16:34', '0000-00-00 00:00:00', '2015-11-11 05:16:57', '2015-11-11 05:16:33'),
(133, 248, 2, 1, '3813292d9f031f9d50532c4590f7b1df.mp4', 'mp4', 'Ingrid and Silvia (Páginas de Menina) - I Honestly Love You', 10883773, 'https://www.youtube.com/watch?v=_BNJH14T97U', 'https://r12---sn-4g57kn76.googlevideo.com/videoplayback?mm=31&mn=sn-4g57kn76&id=o-AFAU7zdVGS4AR5AHabgBOq82F31BmR1S1u3UBwGAxHyy&ip=176.9.235.198&mt=1447221903&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&ms=au&pl=24&itag=18&upn=ZAyMGQRyJ6w&source=youtube&ipbits=0&dur=225.953&sver=3&expire=1447243764&lmt=1398747749753609&ratebypass=yes&fexp=9408710%2C9412840%2C9413208%2C9414764%2C9416126%2C9416231%2C9417683%2C9417707%2C9418751%2C9418865%2C9420453%2C9421167%2C9422540%2C9422596%2C9422618%2C9423177%2C9423510%2C9423662%2C9423793%2C9423992%2C9424127&signature=1CCDD434B5531AB8F8E74C7195C149E4FA5D8159.584F4641FDEFC478FFD30828B96A402E2EB4AEAB&requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fmp4&key=yt6', '360p', 'No', 10883773, 'Success', '2015-11-11 06:09:50', '0000-00-00 00:00:00', '2015-11-11 06:10:16', '2015-11-11 06:09:49'),
(134, 248, 2, 1, '13f94714912332dcbd7c588350862d56.3gp', '3gp', 'páginas de menina', 5181251, 'https://www.youtube.com/watch?v=JvM-k3FL7H8', 'https://r10---sn-4g57kn6l.googlevideo.com/videoplayback?nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mn=sn-4g57kn6l&id=o-AH2OQWknAZe2PIItwucUY0lLkfQm9CkW9sae0fvkhcxw&signature=CA9CDAC81531DE5310A414532DFEA3714EC2DC91.8C248772E95A9AA34B4E6140031F508CE658AF45&mm=31&fexp=9407538%2C9408710%2C9413121%2C9414764%2C9414809%2C9416126%2C9417683%2C9417707%2C9418401%2C9420453%2C9421175%2C9421252%2C9421353%2C9422282%2C9422596%2C9422618%2C9422903%2C9423202%2C9423509%2C9423662%2C9423789%2C9423950&ip=176.9.235.198&mt=1447223045&requiressl=yes&pl=24&source=youtube&mv=u&dur=573.579&lmt=1446507294206089&ms=au&ipbits=0&key=yt6&upn=FrX5WCB_-xQ&expire=1447244985&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2F3gpp&sver=3&itag=17', '144p', 'No', 5181251, 'Success', '2015-11-11 06:30:47', '0000-00-00 00:00:00', '2015-11-11 06:31:04', '2015-11-11 06:30:47'),
(135, 248, 2, 1, '8b17a9e5f7cdab66f5240a01dfcd3d4a.mp4', 'mp4', 'páginas de menina', 27151930, 'https://www.youtube.com/watch?v=JvM-k3FL7H8', 'https://r10---sn-4g57kn6l.googlevideo.com/videoplayback?mime=video%2Fmp4&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&ms=au&mv=u&mt=1447224355&pl=24&ip=176.9.235.198&id=o-AGRZ_rRtaj_5TMctM05QaWdoZyZehedPjGJ2Q8bAuGQR&mn=sn-4g57kn6l&mm=31&itag=18&sver=3&expire=1447246046&upn=Xt0yJvI92WM&ratebypass=yes&lmt=1446507318848631&dur=573.509&source=youtube&requiressl=yes&key=yt6&signature=7E2BBB84AC32B76119B2169909E630AB37C69ACB.1770259A73C4D2A57CCD2DF1245AD96E41BE23EC&fexp=9407187%2C9408375%2C9408710%2C9414764%2C9416126%2C9416481%2C9417097%2C9417683%2C9417707%2C9418201%2C9420453%2C9421175%2C9422324%2C9422596%2C9422618%2C9423509%2C9423662%2C9423789%2C9424363&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '360p', 'No', 27151930, 'Success', '2015-11-11 06:47:39', '0000-00-00 00:00:00', '2015-11-11 06:48:33', '2015-11-11 06:47:36'),
(136, 396, 2, 1, '7401c862944f82c5fe731814aa2ba5b7.mp4', 'mp4', 'HONMAKSAN Motor Yenileme Makinaları (Engine Reconditioning Machine)', 14253300, 'https://www.youtube.com/watch?v=LjedjiHu4h0', 'https://r6---sn-4g57kney.googlevideo.com/videoplayback?fexp=9407187%2C9408710%2C9414764%2C9416126%2C9417011%2C9417683%2C9417707%2C9418356%2C9420453%2C9420931%2C9421932%2C9422041%2C9422436%2C9422555%2C9422596%2C9422618%2C9423201%2C9423328%2C9423662%2C9423667%2C9423792%2C9424078&upn=dV4SwBRLKvQ&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&pl=24&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ratebypass=yes&requiressl=yes&key=yt6&mime=video%2Fmp4&ipbits=0&itag=22&mn=sn-4g57kney&signature=423D99E1D651222C6E0FC8B928F117345B171276.0ADC44296377A758A8EA8D771997B7AA35D07797&mm=31&dur=93.158&sver=3&ms=au&mv=u&mt=1447232160&lmt=1440602475215109&ip=176.9.235.198&expire=1447254066&id=o-AM7ReyGAKdixIw-FMvo1Baf1FbZ1BMPOt_e24MyQ3F0p', '720p', 'No', 14253300, 'Success', '2015-11-11 09:04:56', '0000-00-00 00:00:00', '2015-11-11 09:05:37', '2015-11-11 09:04:50');
INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(137, 398, 2, 1, 'f37b76f4cc221fd189efbb55988ae7f7.3gp', '3gp', 'Glee - Full Brittana Kiss Scene "100" 5x12', 714684, 'https://www.youtube.com/watch?v=gA6ok6BvjeM', 'https://r14---sn-4g57kn6y.googlevideo.com/videoplayback?upn=s_AvOOKA4F8&dur=66.641&ip=176.9.235.198&itag=17&requiressl=yes&lmt=1420932539983189&expire=1447254396&mime=video%2F3gpp&fexp=9408710%2C9414733%2C9414764%2C9416126%2C9417683%2C9417707%2C9417741%2C9418162%2C9420453%2C9421913%2C9422540%2C9422596%2C9422618%2C9422779%2C9423290%2C9423662%2C9423667%2C9423792%2C9424162&mn=sn-4g57kn6y&source=youtube&ipbits=0&pl=24&mv=u&ms=au&mm=31&key=yt6&signature=314DA0A48DCFCC03641FDAC86C29EBB91403D4E7.8B1B206A63A7081819A2DF00EE0FA24D5D0EAE21&id=o-AE_YocXuMHmvIznyazSal5Q_u73f2sNwqZ3fTQjkbh3x&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1447232736&sver=3&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '144p', 'No', 714684, 'Success', '2015-11-11 09:06:53', '0000-00-00 00:00:00', '2015-11-11 09:06:57', '2015-11-11 09:06:47'),
(138, 396, 2, 1, '02436677f08652bd8fa13188dcfb24f6.3gp', '3gp', 'HONMAKSAN ENGINE RECONDITIONING MACHINE HONMAKSAN INDUSTRY CO.', 2326277, 'https://www.youtube.com/watch?v=lC6kc7aNsz4', 'https://r14---sn-4g57kn6y.googlevideo.com/videoplayback?key=yt6&signature=117196763EB3206BCCAAD0E3FA31B5DA111A072B.5403BD865955B867DB6A48F9D839F6286C21518A&id=o-AP1CkMMrJJTDdRAnt1YCm6byPzaAQBHQ-AdeSCxLC5vU&mn=sn-4g57kn6y&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9406984%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&ms=au&mt=1447232160&lmt=1384499552279167&dur=231.319&mm=31&source=youtube&pl=24&requiressl=yes&ip=176.9.235.198&ipbits=0&itag=17&sver=3&mime=video%2F3gpp&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447254062&upn=JSieenY_SC0&mv=u', '144p', 'No', 2326277, 'Prominent', '2015-11-11 09:07:02', '0000-00-00 00:00:00', '2015-11-11 09:07:12', '2015-11-11 09:06:59'),
(139, 396, 2, 1, 'f0b98a6e6933e1395ea07c6435874d40.webm', 'webm', 'GENMOT CRANK', 2427654, 'https://www.youtube.com/watch?v=tMUvvBIPIeE', 'https://r2---sn-4g57kne6.googlevideo.com/videoplayback?expire=1447254995&ratebypass=yes&lmt=1350915757638148&requiressl=yes&mime=video%2Fwebm&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422494%2C9422596%2C9422618%2C9423662&id=o-AInJIw3meNIoERb0sRvJoLmsn5OuMSoXuDaLF6YJ1QgF&ipbits=0&mt=1447233335&dur=0.000&mv=u&ms=au&itag=43&mm=31&ip=176.9.235.198&mn=sn-4g57kne6&pl=24&sver=3&upn=uZuowsxX6Xw&source=youtube&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&signature=A35193D68631C8EDEA1DC9568C9DF3C84FA087A5.6699F18FD7561DCDC2DC899221322C91A532EF4A&key=yt6', '360p', 'No', 2427654, 'Success', '2015-11-11 09:16:47', '0000-00-00 00:00:00', '2015-11-11 09:17:05', '2015-11-11 09:16:45'),
(140, 396, 2, 1, '6bdcaf9389fda2105010a361aa409e5c.3gp', '3gp', 'GENMOT CRANK', 542882, 'https://www.youtube.com/watch?v=tMUvvBIPIeE', 'https://r2---sn-4g57kne6.googlevideo.com/videoplayback?expire=1447254995&sver=3&mt=1447233335&lmt=1394535513555204&requiressl=yes&mime=video%2F3gpp&upn=uZuowsxX6Xw&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422494%2C9422596%2C9422618%2C9423662&id=o-AInJIw3meNIoERb0sRvJoLmsn5OuMSoXuDaLF6YJ1QgF&ipbits=0&source=youtube&dur=51.037&mv=u&ms=au&itag=17&mm=31&ip=176.9.235.198&mn=sn-4g57kne6&pl=24&signature=08C787122B0D97903B959ABEC6E0AFA58398D4F6.6398E11FE6DC462760FBCA9AD732F7E45FF567C4&key=yt6', '144p', 'No', 542882, 'Success', '2015-11-11 09:19:14', '0000-00-00 00:00:00', '2015-11-11 09:19:19', '2015-11-11 09:19:11'),
(141, 2, 2, 1, 'f1aa78d4c232d305734e39984b6c10f4.webm', 'webm', 'Muppet Show - Mahna Mahna...m HD 720p bacco... Original!', 14753607, 'https://www.youtube.com/watch?v=8N_tupPBtWQ', 'https://r13---sn-4g57knzd.googlevideo.com/videoplayback?key=yt6&mime=video%2Fwebm&fexp=9408208%2C9408710%2C9412914%2C9412927%2C9414764%2C9416126%2C9416358%2C9417683%2C9417707%2C9420453%2C9421666%2C9421709%2C9422540%2C9422596%2C9422618%2C9423299%2C9423339%2C9423431%2C9423662%2C9423667%2C9423790%2C9424175&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&dur=0.000&expire=1447260182&ratebypass=yes&sver=3&requiressl=yes&source=youtube&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1365557543065379&id=o-AINCFSi9fJeS9VzZ5G3lctdZI2b4uGqz64ID_nqyDDH5&signature=9312B3AB20C0701842F2C1D4462115E8C216A7A6.B03A4402087B72FF610E30EE9A147B9CDB33C4D6&ms=au&mt=1447238101&upn=YFbIKpFECEM&mv=u&pl=24&itag=43&mm=31&ip=176.9.235.198&mn=sn-4g57knzd', '360p', 'No', 14753607, 'Success', '2015-11-11 10:43:12', '0000-00-00 00:00:00', '2015-11-11 10:43:47', '2015-11-11 10:43:10'),
(142, 346, 2, 2, '07024f9d5f9955bc8a21e566c5945483.mp4', 'mp4', '**Through the Squares | We Love Tits Arts Short Film ( . Y . ) NEW :)))))))))', 10182845, 'https://vimeo.com/125311052', 'https://13-lvl3-pdl.vimeocdn.com/01/62/5/125311052/357808959.mp4?expires=1447263182&token=065da3021234666912dc8:separator:Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.223.4 Safari/532.2:separator:clip_test_v2=0; vuid=227315045.1079252154', '720p', 'No', 10182845, 'Success', '2015-11-11 16:28:50', '0000-00-00 00:00:00', '2015-11-11 16:31:09', '2015-11-11 16:28:44'),
(143, 347, 2, 2, 'a8cee1fb865573f46b956cd45c41a664.mp4', 'mp4', 'Hrvanje u blatu / Mud Wrestling', 18632150, 'https://vimeo.com/43179772', 'https://15-lvl3-pdl.vimeocdn.com/01/3635/1/43179772/100935346.mp4?expires=1447272694&token=051209a73dd5f0cead683:separator:Mozilla/5.0 (Windows; U; Windows NT 5.1; en-CA) AppleWebKit/534.13 (KHTML like Gecko) Chrome/9.0.597.98 Safari/534.13:separator:clip_test_v2=0; vuid=301408192.1555632292', '360p', 'No', 18632150, 'Success', '2015-11-11 19:06:43', '0000-00-00 00:00:00', '2015-11-11 19:23:03', '2015-11-11 19:06:39'),
(144, 2, 2, 1, '66e4fb63561060fc0f1dd356d552ffa9.webm', 'webm', 'Sea Land''s overview', 23455018, 'https://www.youtube.com/watch?v=xEhMkV1tAzY', 'https://r8---sn-4g57kn76.googlevideo.com/videoplayback?mn=sn-4g57kn76&mm=31&upn=Ez8E-S1BK28&signature=15939ADC83D405F6BDCE4DACA720A6874819507B.6952F077BF2F5235D70E2277896CB4C0593E9F68&ms=au&mv=u&mt=1447314764&ip=176.9.235.198&fexp=9408491%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421291%2C9421943%2C9422140%2C9422596%2C9422618%2C9423509%2C9423662%2C9423740%2C9423793%2C9424092%2C9424114%2C9424131%2C9424371&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-AEPBWjFAAPCHpgowCres__pHF9XIvFfrLzgtWEnp7gYd&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&pl=24&dur=0.000&source=youtube&ratebypass=yes&sver=3&lmt=1404379947130367&ipbits=0&itag=43&key=yt6&mime=video%2Fwebm&expire=1447336804', '360p', 'No', 23455018, 'Success', '2015-11-12 08:06:52', '0000-00-00 00:00:00', '2015-11-12 08:13:02', '2015-11-12 08:06:49'),
(145, 487, 2, 1, '0855483f844e2facf6f17e5d3300e885.flv', 'flv', 'PORNO ZONE', 9407254, 'https://www.youtube.com/watch?v=cDZaekC28OA', 'https://r2---sn-4g57kn7d.googlevideo.com/videoplayback?id=o-ALEwEHh7MJr4B5dVrBRuBRrvqIJsOizGtOT5xkzSok1y&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&itag=5&key=yt6&ip=176.9.235.198&dur=207.647&fexp=9407477%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&signature=2FECE8BAE81A95602207B4690738D4C50E4866F5.0DA4D76A76642573B0D9E6F0B3D6EADDEB088632&lmt=1446509668862747&ms=au&mt=1447315365&mv=u&mm=31&sver=3&expire=1447337334&source=youtube&upn=l-od4pmzJk8&requiressl=yes&mime=video%2Fx-flv&pl=24&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mn=sn-4g57kn7d', '240p', 'No', 9407254, 'Success', '2015-11-12 08:09:13', '0000-00-00 00:00:00', '2015-11-12 08:14:47', '2015-11-12 08:09:10'),
(146, 480, 2, 1, '1b6c92bab0f766ff8d4847037e6c1a76.mp4', 'mp4', 'Sea Land''s overview', 18966430, 'https://www.youtube.com/watch?v=xEhMkV1tAzY', 'https://r8---sn-4g57kn76.googlevideo.com/videoplayback?mn=sn-4g57kn76&mm=31&ipbits=0&requiressl=yes&expire=1447337769&sver=3&mv=m&mt=1447316131&ms=au&lmt=1404377812171421&dur=400.335&ip=176.9.235.198&key=yt6&itag=18&id=o-AKXuN1vjaPYTEkqurxQGBViJTgkPcSf8rzpA6Dbc53j9&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&signature=0577BA5D825D3ED50CCE7AF159379D8C7C09F507.3BF5564FFFEBFCFB13318D76FE1C05EB56916808&upn=ZIBuHkn7U2Y&fexp=9407117%2C9408710%2C9414703%2C9414764%2C9416126%2C9417259%2C9417683%2C9417707%2C9418204%2C9420452%2C9421460%2C9422596%2C9422618%2C9423314%2C9423662%2C9423667%2C9423789%2C9423923%2C9424115%2C9424299&pl=24&source=youtube&ratebypass=yes&initcwndbps=6087500&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '360p', 'No', 18966430, 'Success', '2015-11-12 08:17:49', '0000-00-00 00:00:00', '2015-11-12 08:21:36', '2015-11-12 08:17:44'),
(147, 480, 2, 1, 'bf4f9a26421863e5fef8ec12252eeebf.mp4', 'mp4', 'Sodeca News - CAD 3D and Quickfan Projects (EN)', 18245570, 'https://www.youtube.com/watch?v=s2QUJ4Ux4lg', 'https://r11---sn-4g57knzl.googlevideo.com/videoplayback?upn=EiGI5JGItXA&key=yt6&ipbits=0&ratebypass=yes&itag=22&fexp=9407060%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&dur=118.027&signature=11FF19CB320F11CCDA4C444FDBA4872908C684AF.AAE7B5E2CFBBE6294F1C9A47789EA7543D3F5824&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1426926362178093&requiressl=yes&ip=176.9.235.198&mime=video%2Fmp4&source=youtube&mm=31&mn=sn-4g57knzl&pl=24&id=o-ABsHqqJkYle2BQM2Z-M4BLcrkp3_jzopv2szEck4h-l1&ms=au&mt=1447316782&mv=u&expire=1447338939', '720p', 'No', 18245570, 'Success', '2015-11-12 08:35:49', '0000-00-00 00:00:00', '2015-11-12 08:36:28', '2015-11-12 08:35:46'),
(148, 480, 2, 1, '361cd5816be56269250a259285cf5e8b.mp4', 'mp4', 'Sodeca. Soluciones en Ventilación', 45009644, 'https://www.youtube.com/watch?v=RSf8Bb8mM4o', 'https://r8---sn-4g57kne6.googlevideo.com/videoplayback?itag=22&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ratebypass=yes&signature=42FCD11E7C259F3989755F820CD497E4D5081D69.E2576485259EDD1586EDBF8E7BB465C0085B415A&source=youtube&pl=24&mime=video%2Fmp4&key=yt6&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&lmt=1389509851880825&sver=3&requiressl=yes&upn=wzGOaLsH1CA&expire=1447339023&ms=au&dur=235.705&mv=u&mt=1447316782&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9421242%2C9422596%2C9422618%2C9423662&ip=176.9.235.198&id=o-ACXFUz6fg_cdnHiDRM0B4u1wfydi3AN7pvojhinVHdtN&mn=sn-4g57kne6&mm=31&ipbits=0', '720p', 'No', 45009644, 'Success', '2015-11-12 08:38:10', '0000-00-00 00:00:00', '2015-11-12 08:40:30', '2015-11-12 08:38:05'),
(149, 484, 2, 1, 'abaee065d2dddaac35570b838c7d7c84.mp4', 'mp4', 'Chris de Burgh  - When I Think of You LIVE', 8977465, 'http://www.youtube.com/watch?v=aiQ44jI93BA', 'https://r2---sn-4g57kn6d.googlevideo.com/videoplayback?dur=191.541&sver=3&ms=au&mt=1447318705&mv=u&itag=18&mm=31&signature=A7187EB16C5C169635368604A3436CF1F323AC01.6B605C174286EE71516A77E596023B7BF861DADC&mn=sn-4g57kn6d&mime=video%2Fmp4&ipbits=0&ratebypass=yes&requiressl=yes&pl=24&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&upn=m5TEjD4b7_U&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&id=o-AMMK5MnBizRH3e5UMps9UAwa2zcjH_Ls0RXlXM506hC4&expire=1447340710&fexp=9408710%2C9413209%2C9414764%2C9416126%2C9417683%2C9417707%2C9418184%2C9420453%2C9421253%2C9421765%2C9422123%2C9422342%2C9422596%2C9422618%2C9423662%2C9423667%2C9423790%2C9423924&ip=176.9.235.198&lmt=1391994895715310&key=yt6', '360p', 'No', 8977465, 'Success', '2015-11-12 09:05:20', '0000-00-00 00:00:00', '2015-11-12 09:05:48', '2015-11-12 09:05:18'),
(150, 484, 2, 1, 'df134d5a13826e089be0ee10818a7256.mp4', 'mp4', 'Chris de Burgh  - When I Think of You LIVE', 8977465, 'http://www.youtube.com/watch?v=aiQ44jI93BA', 'https://r2---sn-4g57kn6d.googlevideo.com/videoplayback?dur=191.541&sver=3&ms=au&mt=1447318705&mv=u&itag=18&mm=31&signature=A7187EB16C5C169635368604A3436CF1F323AC01.6B605C174286EE71516A77E596023B7BF861DADC&mn=sn-4g57kn6d&mime=video%2Fmp4&ipbits=0&ratebypass=yes&requiressl=yes&pl=24&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&upn=m5TEjD4b7_U&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&id=o-AMMK5MnBizRH3e5UMps9UAwa2zcjH_Ls0RXlXM506hC4&expire=1447340710&fexp=9408710%2C9413209%2C9414764%2C9416126%2C9417683%2C9417707%2C9418184%2C9420453%2C9421253%2C9421765%2C9422123%2C9422342%2C9422596%2C9422618%2C9423662%2C9423667%2C9423790%2C9423924&ip=176.9.235.198&lmt=1391994895715310&key=yt6', '360p', 'No', 8977465, 'Success', '2015-11-12 09:06:23', '0000-00-00 00:00:00', '2015-11-12 09:06:45', '2015-11-12 09:06:22'),
(151, 480, 2, 1, 'ea200781a36172c45f7ebf7dad2e6958.mp4', 'mp4', 'CarboWeld', 17219293, 'https://www.youtube.com/watch?v=ve9Jib-vAnY', 'https://r5---sn-4g57knzd.googlevideo.com/videoplayback?requiressl=yes&mime=video%2Fmp4&lmt=1445346525623421&mm=31&mn=sn-4g57knzd&id=o-ANRgjY_FjDUl-7RA-cqXX4udCawx-gkC5coXq4jOK1Qk&upn=B523ccySs3Q&ip=176.9.235.198&key=yt6&mt=1447318705&mv=u&ms=au&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=13BA5FFEE130CB8BF2B9078A60D9E07EB3FA0C3A.CB6E9DAAB45A19162ED1B365057A49BB1FBBEFAB&sver=3&ratebypass=yes&fexp=9407117%2C9408710%2C9412857%2C9413129%2C9414764%2C9414805%2C9416126%2C9417683%2C9417707%2C9420261%2C9420453%2C9420630%2C9420932%2C9421686%2C9422540%2C9422596%2C9422618%2C9423510%2C9423662%2C9423789%2C9423992&expire=1447340860&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&dur=96.896&itag=22&pl=24&source=youtube', '720p', 'No', 17219293, 'Success', '2015-11-12 09:08:56', '0000-00-00 00:00:00', '2015-11-12 09:09:44', '2015-11-12 09:08:55'),
(152, 484, 2, 1, 'ff4200ea92b9e4a6ab728f5ea8314483.mp4', 'mp4', '‫محسن چاوشی و محسن یگانه - نشکن دلمو‬‎', 8677484, 'https://www.youtube.com/watch?v=_CYg3XCioJE', 'https://r4---sn-4g57knl7.googlevideo.com/videoplayback?upn=WFGGbRyLpQA&id=o-AAsudk47c4sMYRgZmGRulZWjAEOpCe3h3HfSRDD9beCD&ipbits=0&ip=176.9.235.198&key=yt6&ms=au&mv=m&mt=1447319359&lmt=1428030899455929&dur=254.467&mn=sn-4g57knl7&mm=31&fexp=9406985%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447341115&itag=18&mime=video%2Fmp4&source=youtube&pl=24&requiressl=yes&sver=3&signature=8463FEF7889F8E33595DD93D6F582C7A2AEAA998.918FE7BF50CAB778F294A62FFA39FD9964901278&ratebypass=yes&initcwndbps=4685000&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '360p', 'No', 8677484, 'Success', '2015-11-12 09:13:47', '0000-00-00 00:00:00', '2015-11-12 09:14:17', '2015-11-12 09:13:43'),
(153, 484, 2, 1, '0fcc292b3b93e547cce691798a5fcd1e.mp4', 'mp4', 'Chris de Burgh - Don´t Pay the Ferryman', 13909047, 'https://www.youtube.com/watch?v=2jAHTKViJQQ', 'https://r5---sn-4g57knez.googlevideo.com/videoplayback?requiressl=yes&ratebypass=yes&mime=video%2Fmp4&ipbits=0&upn=lQbFLqBeZ7s&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&pl=24&source=youtube&sparams=cwbhb%2Cdur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198&lmt=1397333404332786&key=yt6&id=o-ANehpnK9Q2cEKAC8F0ua12nrV18t4ubwaDkLcR-7XC9m&expire=1447341779&signature=6F86463B685EBCED53AE25CE2AE1391472D9E999.7C10BD2DEDB98A6C333C7A733B8600CB1A3A91F2&mm=31&mn=sn-4g57knez&fexp=9407537%2C9408710%2C9413272%2C9414764%2C9416126%2C9417224%2C9417683%2C9417707%2C9417741%2C9417818%2C9418145%2C9418204%2C9420453%2C9420540%2C9421168%2C9421513%2C9422596%2C9422618%2C9423510%2C9423662%2C9423789%2C9424037%2C9424447&itag=18&sver=3&dur=221.820&mt=1447319384&mv=u&cwbhb=yes&ms=au', '360p', 'No', 13909047, 'Success', '2015-11-12 09:23:20', '0000-00-00 00:00:00', '2015-11-12 09:23:53', '2015-11-12 09:23:14'),
(154, 260, 2, 1, '8e041cfa2b696a113af52c3139bf1f02.webm', 'webm', 'DARPA Hard Test - Tamara Carleton at IRI Member Summit 2014', 8045962, 'http://www.youtube.com/watch?v=TKEQn8EBm1U', 'https://r14---sn-4g57knk7.googlevideo.com/videoplayback?upn=jakU8ETRAJ0&ipbits=0&pl=24&ip=176.9.235.198&mv=u&mt=1447320196&ms=au&signature=3F88D46937029C2E82A0690A6A0061AFC2D235F9.7FB5801C496C0339AF7A4AFE27B4A16B73BE57E9&source=youtube&mn=sn-4g57knk7&mm=31&id=o-AI1iCjmMwhYFDjg3ybOGr7gfVVy5nQp7EkhazS3mo7J7&expire=1447342179&fexp=9405185%2C9405348%2C9408498%2C9408710%2C9412914%2C9413140%2C9414764%2C9416075%2C9416126%2C9416358%2C9417683%2C9417707%2C9417877%2C9419039%2C9419445%2C9420453%2C9422340%2C9422596%2C9422618%2C9423662%2C9423667%2C9423791%2C9423819&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&key=yt6&mime=video%2Fwebm&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1416590624531169&dur=0.000&ratebypass=yes&itag=43&sver=3&requiressl=yes', '360p', 'No', 8045962, 'Success', '2015-11-12 09:29:47', '0000-00-00 00:00:00', '2015-11-12 09:30:17', '2015-11-12 09:29:46'),
(155, 484, 2, 1, '97c45cfdbf81c543e11dccf8f0b925a2.3gp', '3gp', '‫بوی جوی مولیان، مرضیه و جانان در المپیا - ۲۰۰۷‬‎', 16928615, 'https://www.youtube.com/watch?v=Flh-CkYEbVk', 'https://r14---sn-4g57knzl.googlevideo.com/videoplayback?ms=au&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&mv=u&dur=600.189&pl=24&sver=3&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mm=31&itag=36&key=yt6&signature=E1A9C83C5F1B313421710D54AD7813ECBC4722A7.DF735023B31209D3AD83FF035BE1D4D90E39AC0E&upn=92IC-HKnwhM&mn=sn-4g57knzl&ipbits=0&fexp=9405330%2C9408012%2C9408710%2C9414764%2C9416126%2C9417367%2C9417683%2C9417707%2C9420453%2C9421341%2C9421940%2C9422460%2C9422540%2C9422596%2C9422618%2C9423420%2C9423509%2C9423662%2C9423789&mt=1447320196&mime=video%2F3gpp&id=o-ADol9Ymo7K8Bstb49FHLgvJtn0SENsY3Svx7FKf7YU_U&expire=1447342165&ip=176.9.235.198&lmt=1387183378054325&requiressl=yes', '240p', 'No', 16928615, 'Success', '2015-11-12 09:29:50', '0000-00-00 00:00:00', '2015-11-12 09:31:14', '2015-11-12 09:29:48'),
(156, 484, 2, 1, '0ba9385b27353c0b311a6bcce8d25674.flv', 'flv', '‫بوی جوی مولیان، مرضیه و جانان در المپیا - ۲۰۰۷‬‎', 25797942, 'https://www.youtube.com/watch?v=Flh-CkYEbVk', 'https://r14---sn-4g57knzl.googlevideo.com/videoplayback?ms=au&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&mv=u&dur=600.085&pl=24&sver=3&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mm=31&itag=5&key=yt6&signature=35ED6D67C847BA6831DE824DDF2A9D5FD38D35DD.0E0E59142440B46A3650CCA083CA29CFEDC676C1&upn=92IC-HKnwhM&mn=sn-4g57knzl&ipbits=0&fexp=9405330%2C9408012%2C9408710%2C9414764%2C9416126%2C9417367%2C9417683%2C9417707%2C9420453%2C9421341%2C9421940%2C9422460%2C9422540%2C9422596%2C9422618%2C9423420%2C9423509%2C9423662%2C9423789&mt=1447320196&mime=video%2Fx-flv&id=o-ADol9Ymo7K8Bstb49FHLgvJtn0SENsY3Svx7FKf7YU_U&expire=1447342165&ip=176.9.235.198&lmt=1387183221193519&requiressl=yes', '240p', 'No', 25797942, 'Success', '2015-11-12 09:30:23', '0000-00-00 00:00:00', '2015-11-12 09:33:17', '2015-11-12 09:30:23'),
(157, 484, 2, 1, '7277e6d42060240cff9f1c203ba54f1f.flv', 'flv', '‫بوی جوی مولیان، مرضیه و جانان در المپیا - ۲۰۰۷‬‎', 25797942, 'https://www.youtube.com/watch?v=Flh-CkYEbVk', 'https://r14---sn-4g57knzl.googlevideo.com/videoplayback?ms=au&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&mv=u&dur=600.085&pl=24&sver=3&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mm=31&itag=5&key=yt6&signature=35ED6D67C847BA6831DE824DDF2A9D5FD38D35DD.0E0E59142440B46A3650CCA083CA29CFEDC676C1&upn=92IC-HKnwhM&mn=sn-4g57knzl&ipbits=0&fexp=9405330%2C9408012%2C9408710%2C9414764%2C9416126%2C9417367%2C9417683%2C9417707%2C9420453%2C9421341%2C9421940%2C9422460%2C9422540%2C9422596%2C9422618%2C9423420%2C9423509%2C9423662%2C9423789&mt=1447320196&mime=video%2Fx-flv&id=o-ADol9Ymo7K8Bstb49FHLgvJtn0SENsY3Svx7FKf7YU_U&expire=1447342165&ip=176.9.235.198&lmt=1387183221193519&requiressl=yes', '240p', 'No', 25797942, 'Success', '2015-11-12 09:30:44', '0000-00-00 00:00:00', '2015-11-12 09:33:43', '2015-11-12 09:30:43'),
(158, 260, 2, 1, '858d39c67f10bb17b52bea67266868db.mp4', 'mp4', 'Innovation in Mind 2010', 28302431, 'http://www.youtube.com/watch?v=Ru2EcBCntoc', 'https://r10---sn-4g57knkz.googlevideo.com/videoplayback?dur=542.209&fexp=9408710%2C9414764%2C9415949%2C9416126%2C9416851%2C9417683%2C9417707%2C9420453%2C9421666%2C9422353%2C9422596%2C9422618%2C9422675%2C9423510%2C9423662%2C9423791%2C9424134%2C9424184%2C9424378&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=CBBF60DAB3BC3CB2DDC1A16B77622DF1E9AE378E.0F20872FC4DB004A42267CDC018B082D5FFC538F&id=o-AIEPTOoOZ5IvVc_ffXfaHGdapEhYsRiJQjnElA0wbKnT&ms=au&mt=1447320196&pl=24&mv=u&mm=31&mn=sn-4g57knkz&key=yt6&ip=176.9.235.198&sver=3&source=youtube&ratebypass=yes&itag=18&lmt=1388467521840283&upn=iSDLB9uHVKQ&expire=1447342230&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ipbits=0&mime=video%2Fmp4', '360p', 'No', 28302431, 'Prominent', '2015-11-12 09:31:02', '0000-00-00 00:00:00', '2015-11-12 09:33:51', '2015-11-12 09:31:00'),
(159, 484, 2, 1, '719b5d48ea35d93ba4df2434dd6ad83c.mp4', 'mp4', '‫بوی جوی مولیان، مرضیه و جانان در المپیا - ۲۰۰۷‬‎', 49946707, 'https://www.youtube.com/watch?v=Flh-CkYEbVk', 'https://r14---sn-4g57knzl.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&pl=24&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mm=31&upn=92IC-HKnwhM&fexp=9405330%2C9408012%2C9408710%2C9414764%2C9416126%2C9417367%2C9417683%2C9417707%2C9420453%2C9421341%2C9421940%2C9422460%2C9422540%2C9422596%2C9422618%2C9423420%2C9423509%2C9423662%2C9423789&id=o-ADol9Ymo7K8Bstb49FHLgvJtn0SENsY3Svx7FKf7YU_U&expire=1447342165&ip=176.9.235.198&lmt=1387183195781523&ms=au&mt=1447320196&mv=u&dur=600.096&sver=3&itag=18&key=yt6&signature=279509933B57B5F928FC9C4C3DEF9F49D74BE25D.13A4336144DB08A1DD5B8616036281E2184B30CC&mn=sn-4g57knzl&ipbits=0&mime=video%2Fmp4&ratebypass=yes&requiressl=yes', '360p', 'No', 49946707, 'Success', '2015-11-12 09:32:14', '0000-00-00 00:00:00', '2015-11-12 09:35:24', '2015-11-12 09:32:13'),
(160, 260, 2, 1, '3764ffbfab2e0c45fa9c18bc446a0ee8.mp4', 'mp4', 'Rubberband Resistance', 3346614, 'http://www.youtube.com/watch?v=J1hzsbNL0Ng', 'https://r1---sn-4g57kn6d.googlevideo.com/videoplayback?itag=18&pl=24&mime=video%2Fmp4&fexp=9408499%2C9408710%2C9412857%2C9414764%2C9415556%2C9416126%2C9416679%2C9417683%2C9417707%2C9418200%2C9418203%2C9420453%2C9421708%2C9422322%2C9422596%2C9422618%2C9423510%2C9423662%2C9423666%2C9423791%2C9424219%2C9424298&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mm=31&mn=sn-4g57kn6d&ratebypass=yes&requiressl=yes&ms=au&mt=1447321010&mv=m&dur=123.112&expire=1447342730&ip=176.9.235.198&key=yt6&lmt=1444825637858385&sver=3&id=o-AMjlUb3rz6evJwJYpFkdOiR_KE04ezLIjgvdvwIIjoKy&source=youtube&initcwndbps=4678750&ipbits=0&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=21181DBFE047A9593C41645F2652B23859849162.DF9A6470A70E33D8C60E6237AAF8650C47D996A4&upn=pJT_hBfWJF4', '360p', 'No', 3346614, 'Success', '2015-11-12 09:39:14', '0000-00-00 00:00:00', '2015-11-12 09:39:31', '2015-11-12 09:39:13'),
(161, 260, 2, 1, 'fa7b962a2842877a0904d4a5756e8d15.mp4', 'mp4', 'Three Roads to Innovation', 9648588, 'http://www.youtube.com/watch?v=H302pxl2Icg', 'https://r5---sn-4g57knzr.googlevideo.com/videoplayback?requiressl=yes&lmt=1396961385509621&expire=1447342733&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&initcwndbps=4678750&key=yt6&sver=3&signature=8A9EA0C12359F6313E25988CCFF2DFC4CF3D444E.330FAC70F192630028DBA51A8E326BAE0ECA3232&fexp=9407701%2C9408086%2C9408710%2C9412756%2C9412776%2C9414764%2C9416126%2C9417683%2C9417707%2C9418777%2C9420453%2C9420539%2C9421339%2C9421410%2C9422596%2C9422618%2C9423314%2C9423345%2C9423509%2C9423517%2C9423662%2C9423792%2C9424115&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ipbits=0&itag=18&upn=NbQpBFMzCms&dur=168.785&mime=video%2Fmp4&ms=au&id=o-AGO-ybGRDehvJ3h99xv_Fvi3gjoJEDu9Wo3zTJU5x10Z&pl=24&mv=m&mt=1447321010&mn=sn-4g57knzr&mm=31&source=youtube&ratebypass=yes&ip=176.9.235.198', '360p', 'No', 9648588, 'Success', '2015-11-12 09:39:23', '0000-00-00 00:00:00', '2015-11-12 09:40:04', '2015-11-12 09:39:19'),
(162, 260, 2, 1, '75cc97ebd5e12cdfc29535d471761da3.mp4', 'mp4', '2014 IRI Member Summit Highlights', 43607815, 'http://www.youtube.com/watch?v=1ADjeakzYY0', 'https://r11---sn-4g57knz6.googlevideo.com/videoplayback?id=o-AJ2xaWAVg1fNggXbKRvLd40BO5Mz3McE2bVs7rDFnxFk&mm=31&mn=sn-4g57knz6&initcwndbps=4678750&source=youtube&signature=85B4A46EAFF4D69A03464CA726D29547BA4CD427.6E2F1F4560E13BCE463332034649DB6B12A794F0&ms=au&mt=1447321010&mv=m&pl=24&ip=176.9.235.198&upn=dI8JE46dxMs&ipbits=0&requiressl=yes&sver=3&itag=22&ratebypass=yes&dur=200.364&lmt=1416855326660164&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&key=yt6&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9406813%2C9408710%2C9412845%2C9414764%2C9415870%2C9416126%2C9416179%2C9417683%2C9417707%2C9419487%2C9419545%2C9420453%2C9421508%2C9422479%2C9422596%2C9422618%2C9422673%2C9422947%2C9423509%2C9423662%2C9423789%2C9423939&expire=1447342736', '720p', 'No', 43607815, 'Success', '2015-11-12 09:39:32', '0000-00-00 00:00:00', '2015-11-12 09:42:28', '2015-11-12 09:39:31'),
(163, 260, 2, 1, '8c7135f8554a3e0861a358e0f0f7fc19.mp4', 'mp4', 'Leveraging the Edge - John Seely Brown at IRI Member Summit 2014', 33720019, 'http://www.youtube.com/watch?v=EbWe3b8FPR4', 'https://r18---sn-4g57knz7.googlevideo.com/videoplayback?ms=au&mv=m&mt=1447321010&ip=176.9.235.198&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&dur=114.776&id=o-ALxa6ssRJDz0aa2pYretaeHzjpt9hh_DCuRCjTZbZDCa&signature=6AC6957EDD6B32386700B5DE67521C3D86B9E6A3.651B1575945F79F1F265A4229F9411D09A5D45D3&mime=video%2Fmp4&upn=1HL3JndHFHI&mn=sn-4g57knz7&mm=31&ratebypass=yes&expire=1447342737&lmt=1416587827069525&pl=24&initcwndbps=4087500&ipbits=0&fexp=9406852%2C9407168%2C9408710%2C9414764%2C9416126%2C9416231%2C9417517%2C9417683%2C9417707%2C9419444%2C9419891%2C9420238%2C9420453%2C9420925%2C9422461%2C9422540%2C9422596%2C9422618%2C9423662%2C9423667%2C9423707%2C9423792&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&source=youtube&key=yt6&requiressl=yes&itag=22', '720p', 'No', 33720019, 'Success', '2015-11-12 09:39:35', '0000-00-00 00:00:00', '2015-11-12 09:42:28', '2015-11-12 09:39:35'),
(164, 448, 2, 1, 'a216e8303fc86678c26cba6095e31618.mp4', 'mp4', 'Edward Artemiev - Meditation (Stalker Movie Soundtrack) 1979!', 17311177, 'https://www.youtube.com/watch?v=pP1QXKbhqr4&feature=share', 'https://r3---sn-4g57knz6.googlevideo.com/videoplayback?pl=24&itag=18&mn=sn-4g57knz6&mm=31&ip=176.9.235.198&id=o-AEs2IVVeep7ceIeziqq1Bj7ieEFJXTg3F8wqi1YmnoAn&signature=92F0B175471410DE99293B8197516AB00CDC8A0A.483F088671E9B711C81A104487D28C94888144C9&ms=au&upn=-wk7uiJ0Vj0&mv=u&mt=1447327802&key=yt6&mime=video%2Fmp4&expire=1447349471&dur=327.680&ratebypass=yes&sver=3&fexp=9406990%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ipbits=0&lmt=1443672246958128&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&source=youtube', '360p', 'No', 17311177, 'Success', '2015-11-12 11:31:37', '0000-00-00 00:00:00', '2015-11-12 11:32:16', '2015-11-12 11:31:36'),
(165, 1, 2, 1, '4143a0e48be120bee4076c09ae6d4e0b.mp4', 'mp4', 'FUNNY CAT VIDEOS', 24829482, 'https://www.youtube.com/watch?v=-vBqazs3j3A', 'https://r1---sn-4g57knll.googlevideo.com/videoplayback?id=o-APLy7g-jdjlJuC6qTIhWMUXuyhS0wlQtYnAoSyHjQlvf&mm=31&mn=sn-4g57knll&ip=176.9.235.198&ms=au&mt=1447331157&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&pl=24&itag=18&upn=c2Rb1UOphzw&source=youtube&sver=3&ipbits=0&dur=419.886&expire=1447353236&lmt=1392606869894747&signature=2A540352C2F00156CA45DE4D8BCDA08ADEB039A2.E25A75FBE6672823D2F59098AF3B56C1EEC2621F&ratebypass=yes&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418203%2C9420453%2C9421169%2C9422428%2C9422596%2C9422618%2C9422674%2C9423299%2C9423510%2C9423662%2C9423793%2C9423991%2C9424066&requiressl=yes&mime=video%2Fmp4&key=yt6&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '360p', 'No', 24829482, 'Success', '2015-11-12 12:34:11', '0000-00-00 00:00:00', '2015-11-12 12:56:11', '2015-11-12 12:34:10'),
(166, 408, 2, 1, '06648ba538199abe5739c803be208b0f.flv', 'flv', 'Sex Positions for Female Orgasm', 9148883, 'https://www.youtube.com/watch?v=Q6tUXtcjYb4', 'https://r5---sn-4g57kndd.googlevideo.com/videoplayback?nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fx-flv&key=yt6&signature=71AB91960C0C5592C9AD1011AD051B4FCAD18304.6FB408F3F33B38C332019D238E63E26CF057ACB8&lmt=1394265448141888&source=youtube&upn=3ensL2pmx5M&itag=5&ip=176.9.235.198&requiressl=yes&mt=1447332969&mv=m&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ms=au&mm=31&mn=sn-4g57kndd&id=o-AAirZMdIe1BuPrL-1myEbvxgqQ9vy7doRDElouPyEmO4&pl=24&fexp=9407116%2C9408505%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9418164%2C9418182%2C9418749%2C9419445%2C9420453%2C9421339%2C9422596%2C9422618%2C9423510%2C9423625%2C9423642%2C9423662%2C9423674%2C9423793%2C9424446&initcwndbps=4022500&ipbits=0&dur=211.383&sver=3&expire=1447354690', '240p', 'No', 9148883, 'Success', '2015-11-12 12:58:36', '0000-00-00 00:00:00', '2015-11-12 13:08:27', '2015-11-12 12:58:35'),
(167, 408, 2, 1, 'bd704c7a95ca0dcdb5d3b927ec61b90d.flv', 'flv', 'The Best Sex Positions For G Spot Orgasms', 9845430, 'https://www.youtube.com/watch?v=kmUo6tAHWoE', 'https://r3---sn-4g57knez.googlevideo.com/videoplayback?mn=sn-4g57knez&mm=31&key=yt6&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=R7HuTY1CyjI&ms=au&itag=5&lmt=1393933919415029&dur=509.832&mv=u&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&source=youtube&pl=24&signature=50C68CC65F7596D846332338F13C6EA26EDC0459.CA4F1021868CC1244B15B6AE62D376CFBE6A13F3&mime=video%2Fx-flv&requiressl=yes&ip=176.9.235.198&ipbits=0&sver=3&id=o-AK-ajxc1OvefgbdHmlovXdXLKm6K-XieWB5DWqmL2WEi&expire=1447355693&mt=1447333827&fexp=9408710%2C9414703%2C9414764%2C9416126%2C9417581%2C9417683%2C9417707%2C9418203%2C9418899%2C9419445%2C9420453%2C9420540%2C9421253%2C9422282%2C9422342%2C9422596%2C9422618%2C9423662%2C9423667%2C9423793%2C9423939%2C9424204', '240p', 'No', 9845430, 'Success', '2015-11-12 13:15:21', '0000-00-00 00:00:00', '2015-11-12 13:29:10', '2015-11-12 13:15:17'),
(168, 487, 2, 1, '73ad2383c9bf517e77856453e7f74bb4.flv', 'flv', 'PORNO ZONE', 9407254, 'https://www.youtube.com/watch?v=cDZaekC28OA', 'https://r2---sn-4g57kn7d.googlevideo.com/videoplayback?dur=207.647&pl=24&sver=3&ms=au&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&mv=u&itag=5&mm=31&signature=02A697EF4525C81CF5CC9FA06BBA40CA8D0B176E.1A489AA58BAA1D462A5ACA2178AE7BDFFBA03D67&upn=xIsISKuIutc&mn=sn-4g57kn7d&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fx-flv&id=o-ALao-WDfVHnm4iLXhyLjJa8dsjjuefA-M7GajB2W1nVX&expire=1447355754&ipbits=0&mt=1447333827&fexp=9408496%2C9408710%2C9409207%2C9414764%2C9416126%2C9417580%2C9417683%2C9417707%2C9418643%2C9418811%2C9420453%2C9420925%2C9421906%2C9422350%2C9422596%2C9422618%2C9423509%2C9423662%2C9423789&ip=176.9.235.198&lmt=1446509668862747&requiressl=yes&key=yt6', '240p', 'No', 9407254, 'Success', '2015-11-12 13:16:12', '0000-00-00 00:00:00', '2015-11-12 13:37:58', '2015-11-12 13:16:07'),
(169, 504, 2, 1, 'bae11bedcc563d71569403ab5a7a5c3d.3gp', '3gp', 'AP Physics 1: Review: Kinematics 1-Dimensional', 12668040, 'https://www.youtube.com/watch?v=5-1eSY9jxas', 'https://r7---sn-4g57kn6y.googlevideo.com/videoplayback?ms=au&source=youtube&mv=u&dur=1236.880&itag=17&pl=24&ip=176.9.235.198&key=yt6&mime=video%2F3gpp&fexp=9408710%2C9412776%2C9414737%2C9414764%2C9416126%2C9416481%2C9416555%2C9416984%2C9417223%2C9417683%2C9417707%2C9418400%2C9420453%2C9421352%2C9421942%2C9422596%2C9422618%2C9422906%2C9423322%2C9423626%2C9423662%2C9423667%2C9423792&upn=JYhkl2Yv51c&id=o-ADDgyTxwcTDd0kyzTY_EYA4CyOx_GI5ObWM7IBKwIPIz&mt=1447339505&expire=1447361287&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mn=sn-4g57kn6y&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&sver=3&signature=A9374BD3457A2EFCDA70813603FAAB39FC25CC7C.9773CC08E7769DFF9573C8780A5595235922762D&lmt=1365767328508482&mm=31&ipbits=0&requiressl=yes', '144p', 'No', 12668040, 'Success', '2015-11-12 14:48:23', '0000-00-00 00:00:00', '2015-11-12 14:49:11', '2015-11-12 14:48:23'),
(170, 250, 2, 1, '5e0268ddd1be70fd78fe910b719f583a.mp4', 'mp4', 'Texture Measurement & Analysis', 12513417, 'https://www.youtube.com/watch?v=aiTFYDGPER4', 'https://r5---sn-4g57kn6k.googlevideo.com/videoplayback?dur=259.831&fexp=9407059%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420452%2C9422596%2C9422618%2C9423662&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=53EDCAE7596E10808606B4A918DD87842494B408.A4128C5C520386853F7E817D2932EA5A873950C0&ms=au&id=o-AHS16_iB5-xOsY_8DkYKuKNmRc2XJhySZgWEDbJoysf0&mv=u&pl=24&mt=1447358984&mn=sn-4g57kn6k&mm=31&ip=176.9.235.198&key=yt6&sver=3&source=youtube&ratebypass=yes&lmt=1422971030181156&upn=1_KKE36t3hA&expire=1447380840&itag=18&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ipbits=0&mime=video%2Fmp4', '360p', 'No', 12513417, 'Success', '2015-11-12 20:14:12', '0000-00-00 00:00:00', '2015-11-12 20:14:37', '2015-11-12 20:14:12'),
(171, 250, 2, 1, '469bab79079474225379f7052585df49.mp4', 'mp4', 'Tensile Testing a Stainless Steel Tensile Specimen', 6402483, 'https://www.youtube.com/watch?v=67fSwIjYJ-E', 'https://r13---sn-4g57kn6y.googlevideo.com/videoplayback?signature=09BA4382A75854D04925A721C7BEFABDD751238A.42F98038E40E939584A52E0B97AB9C68EDD35EFF&source=youtube&upn=ElQHwCeIeAU&itag=18&ratebypass=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ipbits=0&lmt=1427899765392993&fexp=9408710%2C9414764%2C9415822%2C9416126%2C9416481%2C9417683%2C9417707%2C9418401%2C9418777%2C9420453%2C9420929%2C9421252%2C9421666%2C9421941%2C9422596%2C9422618%2C9423037%2C9423510%2C9423629%2C9423642%2C9423662%2C9423792%2C9424082%2C9424238%2C9424441&mn=sn-4g57kn6y&mm=31&ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fmp4&dur=114.636&id=o-AJOjnl9lGHB3A5K5yYgtK9rmn2RepWm5BbtEflgiSPsw&pl=24&mv=u&mt=1447358984&ms=au&requiressl=yes&expire=1447380965&key=yt6&sver=3', '360p', 'No', 6402483, 'Prominent', '2015-11-12 20:16:51', '0000-00-00 00:00:00', '2015-11-12 20:17:13', '2015-11-12 20:16:49'),
(172, 250, 2, 1, 'd28cc507cadcf29aa20b8a73f151b9c6.mp4', 'mp4', 'Composite material creep testing', 5016015, 'https://www.youtube.com/watch?v=zaWXnuVycXA', 'https://r1---sn-4g57kn6l.googlevideo.com/videoplayback?lmt=1366668021906135&sver=3&dur=82.454&ipbits=0&expire=1447380980&pcm2=no&requiressl=yes&key=yt6&mime=video%2Fmp4&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&signature=15E8C5FBABD563C8D05EE09566EA94E39E59A5A2.98BB776E819989240610AF659B93CA1D58350ABC&fexp=9407156%2C9408710%2C9414764%2C9414875%2C9416126%2C9417683%2C9417707%2C9417817%2C9419445%2C9419838%2C9420453%2C9420927%2C9421793%2C9421932%2C9422151%2C9422342%2C9422596%2C9422618%2C9423328%2C9423490%2C9423509%2C9423662%2C9423791%2C9423953%2C9424114&ratebypass=yes&ip=176.9.235.198&ms=au&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&mt=1447358984&id=o-AHtD0KhLz1nEtG6c0rgoIs9Xu1EphchYSprg3dTQpddZ&mn=sn-4g57kn6l&mm=31&upn=UbrtWFAXs00&source=youtube&pl=24&itag=18', '360p', 'No', 5016015, 'Success', '2015-11-12 20:17:00', '0000-00-00 00:00:00', '2015-11-12 20:17:30', '2015-11-12 20:16:56'),
(173, 419, 2, 1, '05568e3630d5f1749b09ed4a158505c1.webm', 'webm', 'Crowcon Clip Portable Gas Detector', 4195908, 'https://www.youtube.com/watch?v=Hv2d3WgeyQI', 'https://r11---sn-4g57kn6y.googlevideo.com/videoplayback?key=yt6&mime=video%2Fwebm&id=o-AFuurrdCGSIaxcm7mcZYAogb9HEFcd1eRZMBJ14qncmB&signature=426CE3756C46924767AAA76272314C64E8FF7EA5.0B3EF1FB8F850CB4436F48F401D92391BA0B696C&ms=au&mt=1447360370&itag=43&mv=u&upn=ACeO4DYPjME&expire=1447382358&pl=24&ip=176.9.235.198&mm=31&mn=sn-4g57kn6y&requiressl=yes&source=youtube&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&lmt=1405000797004654&fexp=9408710%2C9409206%2C9410706%2C9414764%2C9415870%2C9416126%2C9416903%2C9417098%2C9417206%2C9417683%2C9417707%2C9418046%2C9419445%2C9420453%2C9422596%2C9422618%2C9423429%2C9423509%2C9423662%2C9423793&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&dur=0.000&ratebypass=yes&sver=3', '360p', 'No', 4195908, 'Prominent', '2015-11-12 20:39:40', '0000-00-00 00:00:00', '2015-11-12 20:39:54', '2015-11-12 20:39:34'),
(174, 514, 2, 1, '1e7af670283f5b4b20f1871fb462a334.mp4', 'mp4', 'Tower Crane Assembly with Climber Demo', 19934394, 'https://www.youtube.com/watch?v=RB91Sm-kGJ8', 'https://r12---sn-4g57kn76.googlevideo.com/videoplayback?dur=376.256&fexp=9407168%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9419444%2C9420175%2C9420452%2C9421173%2C9421470%2C9421644%2C9422542%2C9422596%2C9422618%2C9422907%2C9423488%2C9423509%2C9423662%2C9423786%2C9423791%2C9424156&expire=1447389853&sver=3&ipbits=0&pl=24&id=o-AMu_KHCdeNfcIRZjgACkQE9UYGB0z8qM64lxFsKZQsOQ&mime=video%2Fmp4&mn=sn-4g57kn76&mm=31&ms=au&mv=u&mt=1447367883&requiressl=yes&ip=176.9.235.198&ratebypass=yes&upn=uD-v-fyRn2I&signature=5ABD0E2C1DE37F8545BCE9088027CFD9B3AE0A6A.A9A796DD3574F9E49CC32483E0D23457E1B4C908&itag=18&lmt=1388774380048683&key=yt6&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&source=youtube', '360p', 'No', 19934394, 'Success', '2015-11-12 22:45:57', '0000-00-00 00:00:00', '2015-11-12 23:15:07', '2015-11-12 22:45:52'),
(175, 514, 2, 1, '93d278cf371bfffef406ebfb7af8ef1c.mp4', 'mp4', 'Liebherr - LR 11350 crawler crane with PowerBoom', 36061924, 'https://www.youtube.com/watch?v=MvCoJuZK7K4', 'https://r11---sn-4g57kn6s.googlevideo.com/videoplayback?ratebypass=yes&upn=gc1EkeDzoUg&mv=u&mt=1447371450&fexp=9407477%2C9408710%2C9414764%2C9416126%2C9417683%2C9417707%2C9420453%2C9422596%2C9422618%2C9423662&ms=au&source=youtube&mn=sn-4g57kn6s&pl=24&mm=31&requiressl=yes&dur=184.575&id=o-ABV5UxNzT_FWjB6_KygJByYoprs4ZgfG7-nCDZmsDBZm&expire=1447393102&ipbits=0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&lmt=1429777301832249&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&itag=22&key=yt6&mime=video%2Fmp4&signature=27D2B1E1A9B13329BB8746421295E6A3F13D0F01.0948FAF22E3F5AB86B0F7978A63C52D7658283EB&ip=176.9.235.198', '720p', 'No', 36061924, 'Success', '2015-11-12 23:39:34', '0000-00-00 00:00:00', '2015-11-13 00:23:17', '2015-11-12 23:39:29'),
(176, 1, 2, 1, '09e0343a09c3cb1ec44f4c6f47b23e60.mp4', 'mp4', '‫کیک با رویه ژله‬‎', 26367849, 'https://www.youtube.com/watch?v=I-6aa1TgMNI', 'https://r14---sn-4g57knkl.googlevideo.com/videoplayback?mn=sn-4g57knkl&mm=31&dur=496.512&mv=u&mt=1447398302&ms=au&lmt=1429024075696287&mime=video%2Fmp4&source=youtube&fexp=9407000%2C9407156%2C9408710%2C9413209%2C9414764%2C9416126%2C9417683%2C9417703%2C9418400%2C9419446%2C9420261%2C9420453%2C9421524%2C9422191%2C9422338%2C9422596%2C9422618%2C9422796%2C9423510%2C9423519%2C9423662%2C9423790%2C9423820%2C9424134&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=18&expire=1447420333&ratebypass=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&pl=24&signature=8E42C5E91EF6D3E457D9E5EE36714CB2B5C7C1AF.A7592B2970C522BF58DF9AF48CCC634447695D61&sver=3&requiressl=yes&key=yt6&ip=176.9.235.198&ipbits=0&pcm2=no&upn=h86tIDza64w&id=o-AOM4QJSoZ5YHSY1bq2kToWME9uaDOijyk6WSGGx2sNl6', '360p', 'No', 26367849, 'Success', '2015-11-13 07:12:30', '0000-00-00 00:00:00', '2015-11-13 07:13:59', '2015-11-13 07:12:29'),
(177, 1, 2, 1, '553e275d5d7fffcf7ee10194264794a2.mp4', 'mp4', '09 02 2013 khaney mehr   تكنيك چاپ عكس روی كيك خانم گل‏آور', 147312410, 'https://www.youtube.com/watch?v=J57RiwSpbfE', 'https://r18---sn-4g57knz6.googlevideo.com/videoplayback?itag=18&upn=LDF1vxvZ7R8&sver=3&signature=DCA526A4274D269BE5E7027EB8BDA87E3B47CF52.7457BBCCB6DCD8AF816E2B81C60C3EAC1567686C&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&mt=1447399074&mn=sn-4g57knz6&ratebypass=yes&fexp=9406994%2C9407701%2C9408710%2C9414764%2C9416126%2C9416985%2C9417683%2C9418400%2C9420453%2C9422596%2C9422618%2C9423232%2C9423662%2C9423667%2C9423790%2C9424298&lmt=1408333400626778&dur=3313.673&mv=u&pl=24&ipbits=0&ms=au&source=youtube&expire=1447420805&mm=31&ip=176.9.235.198&id=o-ALZGbA6a5Y0JSIYIaoJW91VbpIQcyydtxkGQN32ZXQkR', '360p', 'No', 147312410, 'Success', '2015-11-13 07:20:24', '0000-00-00 00:00:00', '2015-11-13 07:44:27', '2015-11-13 07:20:22'),
(178, 521, 2, 1, '18cdf9451d66964129044b5b59ddb6cb.mp4', 'mp4', 'David Gilmour Live - Royal Albert Hall (London, 2006) - Set 2.2', 729465753, 'https://www.youtube.com/watch?v=QFP6exAg35E', 'https://r1---sn-4g57knes.googlevideo.com/videoplayback?pl=24&mime=video%2Fmp4&expire=1447425002&mn=sn-4g57knes&mm=31&mv=u&mt=1447403346&ms=au&itag=22&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=pzIM4WP2KCU&ipbits=0&requiressl=yes&ip=176.9.235.198&signature=AA18D04DD5EB3B4A2DAFACB75CDECD1CBF57243E.A47066F0668444674A5E6AA01280094B484E1E35&fexp=9407117%2C9408710%2C9414764%2C9415387%2C9416126%2C9416484%2C9417683%2C9417753%2C9419837%2C9420453%2C9421647%2C9421940%2C9422540%2C9422596%2C9422618%2C9423510%2C9423662%2C9423791%2C9424038%2C9424644&sver=3&id=o-AB91qG07Yq-tp1KsiG8p2IKb6VdAb2BuQaxuoURVqn0d&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&dur=4167.447&ratebypass=yes&source=youtube&lmt=1417021013077567&key=yt6', '720p', 'No', 729465753, 'Success', '2015-11-13 08:31:16', '0000-00-00 00:00:00', '2015-11-13 11:28:13', '2015-11-13 08:31:11'),
(179, 523, 2, 1, 'af3750abaa980fd747a4844c1f4c09d5.3gp', '3gp', 'Skin - Human Body Parts - Pre School - Animated Videos For Kids', 1779790, 'https://www.youtube.com/watch?v=v7m0NiLzZTA', 'https://r12---sn-4g57knks.googlevideo.com/videoplayback?pl=24&requiressl=yes&expire=1447425389&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&id=o-ACWiSk8ufaF-Hi_EDzXBu_ZlYMwDmHBG-YJZBuL3bEDP&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&initcwndbps=3785000&key=yt6&ip=176.9.235.198&dur=172.756&mt=1447403756&mv=m&ms=au&fexp=9407116%2C9408504%2C9408710%2C9414764%2C9416126%2C9416678%2C9417683%2C9418203%2C9418750%2C9419446%2C9420453%2C9421242%2C9422596%2C9422618%2C9422676%2C9423280%2C9423294%2C9423339%2C9423411%2C9423468%2C9423662%2C9423667%2C9423792%2C9424115&mm=31&source=youtube&mn=sn-4g57knks&upn=iB2UQGjLZ3o&lmt=1387376890223030&signature=A65BA6190C383A0F1949D38DA0FB131ED5C27D53.C8167CCD811F859DC2C4F86F05B51B4976D8E58E&mime=video%2F3gpp&sver=3&itag=17&ipbits=0', '144p', 'No', 1779790, 'Success', '2015-11-13 08:37:11', '0000-00-00 00:00:00', '2015-11-13 08:44:30', '2015-11-13 08:37:10'),
(180, 2, 2, 1, '18053627f96799c221f2268c38bb207b.mp4', 'mp4', '‫نفرین -آسمان چشم او‬‎', 16788157, 'https://www.youtube.com/watch?v=FESIBnpvzjQ', 'https://r3---sn-4g57kndl.googlevideo.com/videoplayback?dur=282.076&source=youtube&initcwndbps=5558750&fexp=9407059%2C9408710%2C9414764%2C9416126%2C9417683%2C9420453%2C9422596%2C9422618%2C9423662&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ipbits=0&ratebypass=yes&upn=q0eneLkX8jA&id=o-AF-cNHjFpwPCoXojFuhWFoCPpawGAISetFL7LUC1seEn&mime=video%2Fmp4&pl=24&sver=3&ms=au&mt=1447410241&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=m&ip=176.9.235.198&mm=31&mn=sn-4g57kndl&expire=1447431994&lmt=1285279380715345&itag=18&signature=467D8C39CE359A555CA52BA6563FEB36A6110452.9F7F2475D01C6594446430E12EA21DA25A41DFC1&requiressl=yes&key=yt6', '360p', 'No', 16788157, 'Success', '2015-11-13 10:26:42', '0000-00-00 00:00:00', '2015-11-13 10:54:59', '2015-11-13 10:26:41'),
(181, 532, 2, 1, '3bc3caeca288308bd3278938770bf735.mp4', 'mp4', 'Rihanna - Diamonds (The concert for valor)', 19177543, 'https://www.youtube.com/watch?v=GaDJnVgcnW4', 'https://r20---sn-4g57knle.googlevideo.com/videoplayback?mm=31&mn=sn-4g57knle&upn=prsv8lnbgFg&mt=1447427852&mv=u&signature=180FD0786FB6B6D7B9BFC951C511684B7C2001EF.DD565D804E813DBE918194365FE0DD76C562897E&ms=au&ip=176.9.235.198&fexp=9407537%2C9408710%2C9414764%2C9415942%2C9416126%2C9416484%2C9417260%2C9417517%2C9417683%2C9418185%2C9419445%2C9420453%2C9420539%2C9422596%2C9422618%2C9422798%2C9422863%2C9423510%2C9423662%2C9423793%2C9424058%2C9424092%2C9424148&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-AKH-W8ep39InFNoxeEXyU-kBMnYwrKxw8cBzLzuh0v_a&requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&dur=260.667&pl=24&source=youtube&ratebypass=yes&ipbits=0&lmt=1427907831730749&sver=3&itag=18&expire=1447449941&mime=video%2Fmp4&key=yt6', '360p', 'No', 19177543, 'Success', '2015-11-13 15:30:23', '0000-00-00 00:00:00', '2015-11-13 15:31:15', '2015-11-13 15:30:18'),
(182, 250, 2, 1, '06acf7eb758414a11b88a117ee15dfba.webm', 'webm', 'Convolution Integral Example 02 - Convolution of Two Polynomials', 9207658, 'https://www.youtube.com/watch?v=e0Sy_l5boh0', 'https://r1---sn-4g57knzd.googlevideo.com/videoplayback?requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fwebm&signature=D73F98BBB7EC2627C8EAC62D94B4F9EEE2AC4B7F.1240430A254CD64074E8D7B9ED815293A5FEFA9C&source=youtube&ms=au&pl=24&itag=43&mt=1447446590&upn=siuh_CcCink&ip=176.9.235.198&expire=1447468476&mm=31&sver=3&ratebypass=yes&id=o-AAZSLNUo34QD85vMMn6Xct2QBV8RKi_fEn9ukpS4fv71&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&fexp=9406983%2C9408710%2C9414764%2C9416126%2C9417683%2C9420453%2C9422596%2C9422618%2C9423662&dur=0.000&key=yt6&lmt=1398081011812362&mn=sn-4g57knzd&ipbits=0', '360p', 'No', 9207658, 'Success', '2015-11-13 20:35:53', '0000-00-00 00:00:00', '2015-11-13 20:36:11', '2015-11-13 20:35:53'),
(183, 250, 2, 1, '9c785831194feab87dbf2f754572e5b7.webm', 'webm', 'Convolution Integral Example 03 - Convolution of Two Triangles', 15138936, 'https://www.youtube.com/watch?v=35gc3GE4Ddo', 'https://r2---sn-4g57knz7.googlevideo.com/videoplayback?itag=43&fexp=9407155%2C9408710%2C9414764%2C9415521%2C9415874%2C9416126%2C9417683%2C9418204%2C9419838%2C9420453%2C9421211%2C9421249%2C9421503%2C9422541%2C9422596%2C9422618%2C9423299%2C9423510%2C9423662%2C9423792%2C9423978&mime=video%2Fwebm&key=yt6&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&lmt=1414350996605477&source=youtube&upn=xK-iMandcyE&id=o-APQrT1a9P5e58hjQmopZQeRGdwAurytyWWeVvxpjeido&pl=24&mm=31&mn=sn-4g57knz7&ip=176.9.235.198&requiressl=yes&ms=au&mt=1447446590&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&sver=3&ipbits=0&dur=0.000&ratebypass=yes&expire=1447468478&signature=5C6399877CFE5A52FEB69DE31410A14767FB75CD.5934D7C52670AEC8E6679B0E4B044A5C468428A5', '360p', 'No', 15138936, 'Success', '2015-11-13 20:43:02', '0000-00-00 00:00:00', '2015-11-13 20:43:50', '2015-11-13 20:43:01');
INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(184, 531, 2, 1, 'a51aa7cb2b6c47528dadf316832d7399.mp4', 'mp4', 'Moog Servo Valve Repair Process', 10453816, 'https://www.youtube.com/watch?v=9MBMdyWGDxE', 'https://r20---sn-4g57kn6r.googlevideo.com/videoplayback?signature=1AFE236F618FA6C3A1CD139E9B6792AADA9418BE.B7C1A4B3B7C9495F22EE31D11F8A3DEB0513A0E6&sver=3&requiressl=yes&pl=24&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ratebypass=yes&id=o-AL2oW4ZfwkNQXdD9kgcSxFwWbunWPaqPzU3yDaKgUIUr&upn=pxYHcUJyhPI&key=yt6&ip=176.9.235.198&ipbits=0&lmt=1430928055294033&mt=1447449284&mv=u&ms=au&mm=31&mn=sn-4g57kn6r&dur=144.962&itag=18&expire=1447471054&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9406851%2C9408494%2C9408710%2C9414764%2C9416126%2C9416984%2C9417097%2C9417683%2C9418204%2C9419669%2C9420453%2C9421513%2C9422556%2C9422596%2C9422618%2C9422910%2C9423510%2C9423512%2C9423662%2C9423792&source=youtube&mime=video%2Fmp4', '360p', 'No', 10453816, 'Success', '2015-11-13 21:18:24', '0000-00-00 00:00:00', '2015-11-13 21:19:05', '2015-11-13 21:18:18'),
(185, 531, 2, 1, 'c09746a24c4b5657a73118611c6f49b3.flv', 'flv', 'Moog Servo Valve Repair Process', 6179841, 'https://www.youtube.com/watch?v=9MBMdyWGDxE', 'https://r20---sn-4g57kn6r.googlevideo.com/videoplayback?signature=748AB6BF0CF7084118715DBAD0259547E34B545D.2756315CA955BC5ECB1572AB3982805EF1CBD872&lmt=1430928043271606&sver=3&requiressl=yes&mt=1447449284&pl=24&mv=u&ms=au&mm=31&key=yt6&mn=sn-4g57kn6r&dur=144.953&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&itag=5&expire=1447471054&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9406851%2C9408494%2C9408710%2C9414764%2C9416126%2C9416984%2C9417097%2C9417683%2C9418204%2C9419669%2C9420453%2C9421513%2C9422556%2C9422596%2C9422618%2C9422910%2C9423510%2C9423512%2C9423662%2C9423792&id=o-AL2oW4ZfwkNQXdD9kgcSxFwWbunWPaqPzU3yDaKgUIUr&upn=pxYHcUJyhPI&source=youtube&mime=video%2Fx-flv&ip=176.9.235.198&ipbits=0', '240p', 'No', 6179841, 'Success', '2015-11-13 21:31:33', '0000-00-00 00:00:00', '2015-11-13 21:32:04', '2015-11-13 21:31:30'),
(186, 433, 2, 1, '7883d45462f59e628c993a8264ae1709.webm', 'webm', 'OIL AND GAS SURFACE WELLHEAD AND CHRISTMAS TREE', 2471712, 'https://www.youtube.com/watch?v=oVAEwE8YBA0', 'https://r20---sn-4g57knez.googlevideo.com/videoplayback?mn=sn-4g57knez&mm=31&source=youtube&ratebypass=yes&dur=0.000&ms=au&fexp=9405265%2C9406821%2C9407000%2C9407157%2C9408497%2C9408710%2C9414764%2C9416126%2C9416673%2C9417683%2C9419444%2C9420453%2C9421946%2C9422596%2C9422618%2C9422675%2C9423428%2C9423624%2C9423662%2C9423667%2C9423791%2C9423957%2C9424257%2C9424530&mv=u&mt=1447479817&ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-AL7YqOCzMTRzDYJMnQOxWNafSeP63BEU89F2EkT0En7W&pcm2=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&expire=1447501850&requiressl=yes&pl=24&upn=XlICdNKTqVo&sver=3&key=yt6&itag=43&mime=video%2Fwebm&ipbits=0&signature=5DDEFAFD0A92B4437DAF476C209059D7E3E5BE4D.676EDD693200E941D66A707DC798E6D8D1BCC706&lmt=1348963144945676', '360p', 'No', 2471712, 'Success', '2015-11-14 05:51:00', '0000-00-00 00:00:00', '2015-11-14 05:51:09', '2015-11-14 05:50:55'),
(187, 433, 2, 1, '7443a4a9b3b1714408a635609f5d7569.webm', 'webm', 'wellhead instillation.wmv', 15479235, 'https://www.youtube.com/watch?v=z9eWHpEDRME', 'https://r14---sn-4g57knzs.googlevideo.com/videoplayback?lmt=1330731253835167&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&sver=3&signature=A3C5B7D8AD6DD0D49B79D465C67E6B69BE097A1D.3301CD2E269DAE2097DD64B1DCEB2ED34D9C8269&dur=0.000&itag=43&fexp=9408710%2C9410705%2C9414764%2C9416126%2C9416359%2C9417683%2C9417828%2C9420312%2C9420453%2C9421174%2C9421254%2C9421287%2C9421544%2C9422596%2C9422618%2C9423510%2C9423513%2C9423662%2C9423790%2C9424428%2C9424448%2C9424642&key=yt6&upn=78lMVCRu2KE&ratebypass=yes&ipbits=0&mv=u&mt=1447479817&ms=au&id=o-AGJo_t1kTDIM1c_NSmEZVp3AVRRex7DFtcuFw3RVZXxV&expire=1447501878&mime=video%2Fwebm&ip=176.9.235.198&requiressl=yes&pl=24&mn=sn-4g57knzs&mm=31&source=youtube', '360p', 'No', 15479235, 'Success', '2015-11-14 05:51:27', '0000-00-00 00:00:00', '2015-11-14 05:51:57', '2015-11-14 05:51:22'),
(188, 433, 2, 1, '39028be6987cc9d900cc39571df3835c.webm', 'webm', 'GasLift x-mas tree function', 25706684, 'https://www.youtube.com/watch?v=wQE9tEMw9rI', 'https://r11---sn-4g57knzl.googlevideo.com/videoplayback?pl=24&ipbits=0&ip=176.9.235.198&key=yt6&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9408137%2C9408710%2C9413272%2C9414764%2C9416126%2C9417683%2C9418184%2C9418204%2C9419445%2C9420453%2C9420482%2C9421944%2C9422342%2C9422596%2C9422618%2C9422675%2C9422952%2C9423236%2C9423510%2C9423662%2C9423789%2C9424257&itag=43&requiressl=yes&source=youtube&mv=u&mt=1447481339&ms=au&signature=BEE0C7F050FF4EEBF8DEFF647160584A62FAFB00.33B5FC6D6060021DAF2DEEDFFCACB2A501E987FD&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-APwkJdE3T6kl-ofI7Bz2a_zJI5-oUfvvWNMbVRrwAtuK&sver=3&mn=sn-4g57knzl&upn=X7UayvQpz5E&expire=1447503067&lmt=1362179243153990&mime=video%2Fwebm&ratebypass=yes&dur=0.000', '360p', 'No', 25706684, 'Success', '2015-11-14 06:11:18', '0000-00-00 00:00:00', '2015-11-14 06:11:55', '2015-11-14 06:11:13'),
(189, 433, 2, 1, 'b094d516f9e0de8667824a04944e9b98.webm', 'webm', 'Stages of Well Casing and Cementing', 12196581, 'https://www.youtube.com/watch?v=sP9uMwZ5pjo', 'https://r8---sn-4g57knsy.googlevideo.com/videoplayback?ip=176.9.235.198&pl=24&mt=1447481339&mv=u&ms=au&mm=31&mn=sn-4g57knsy&id=o-AD63-EZ6icSsLeMLXrmtezapdugEjYdZ141NdRCHVZnM&upn=D3T7_2knbig&expire=1447503240&sver=3&itag=43&ratebypass=yes&requiressl=yes&source=youtube&dur=0.000&lmt=1403765642675152&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9420453%2C9422596%2C9422618%2C9423662&key=yt6&signature=9B9C56188FA04434C14FD6D9047555F5F307EA5E.6F958EBB9176394C4BD5AF6D7A6D84293DE7BE54&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mime=video%2Fwebm&ipbits=0', '360p', 'No', 12196581, 'Success', '2015-11-14 06:14:21', '0000-00-00 00:00:00', '2015-11-14 06:14:52', '2015-11-14 06:14:16'),
(190, 433, 2, 1, '8ff9031e0f47017a1bce19309298500d.webm', 'webm', 'Drilling, Cementing and Stimulation', 63813585, 'https://www.youtube.com/watch?v=Alj4nAtLXWU', 'https://r17---sn-4g57knzr.googlevideo.com/videoplayback?ipbits=0&mime=video%2Fwebm&ratebypass=yes&requiressl=yes&ms=au&mt=1447481339&mv=u&dur=0.000&sver=3&itag=43&key=yt6&signature=8E3D0E86AA744DF47DA2CC1B53A957ED1E1CAF7E.8B873C47A05B4ABA555BF6B17F610490EB4CCCC1&mn=sn-4g57knzr&id=o-ABTkyvkBJe485kRVTMicyvHEolyA_s-E--6HJ1hpkAdo&expire=1447503247&ip=176.9.235.198&lmt=1384079330203318&fexp=9408350%2C9408710%2C9409246%2C9413141%2C9414764%2C9415515%2C9416126%2C9417683%2C9418184%2C9418204%2C9419444%2C9419838%2C9420453%2C9420924%2C9421292%2C9422596%2C9422618%2C9423348%2C9423663%2C9423667%2C9423791%2C9423851%2C9424134&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&mm=31&pl=24&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&upn=2PJN-cn1_Zw', '360p', 'No', 63813585, 'Success', '2015-11-14 06:14:24', '0000-00-00 00:00:00', '2015-11-14 06:16:27', '2015-11-14 06:14:23'),
(191, 433, 2, 1, 'bf3f05f7e2c2a1d19171cc6361072c74.webm', 'webm', 'Cement baskets and Cementing Plugs for Casing and Well Drilling Process', 268380, 'https://www.youtube.com/watch?v=fvZn7-Knq6M', 'https://r13---sn-4g57kndd.googlevideo.com/videoplayback?expire=1447503357&itag=43&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9405187%2C9408710%2C9412857%2C9412913%2C9414764%2C9415869%2C9416126%2C9416984%2C9417683%2C9418203%2C9418643%2C9420238%2C9420452%2C9421522%2C9422596%2C9422618%2C9422673%2C9423510%2C9423662%2C9423674%2C9423790%2C9423953%2C9424261&source=youtube&mime=video%2Fwebm&lmt=1388128368329716&ms=au&mt=1447481698&mv=m&dur=0.000&mm=31&mn=sn-4g57kndd&id=o-ANDTPdb2SZUPNgAwZ-M0FYpj2u6WbUHg05KxfLkYN8an&upn=Qr40cjsC_ts&ipbits=0&ip=176.9.235.198&key=yt6&requiressl=yes&sver=3&signature=2EA64F644DD322ABF7A3EC15BB45E0777B9D5450.03219AF29D8A04773EA02DFDC634A27C4194FDCE&pl=24&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ratebypass=yes&initcwndbps=5755000', '360p', 'No', 268380, 'Success', '2015-11-14 06:16:06', '0000-00-00 00:00:00', '2015-11-14 06:16:29', '2015-11-14 06:16:03'),
(192, 433, 2, 1, 'ef2f10090c7211ff3ccffcaf739c9769.webm', 'webm', 'AP: Cement Likely Cause of the Oil Rig Blast', 6101203, 'https://www.youtube.com/watch?v=YMUEU0_4B5U', 'https://r20---sn-4g57kn6e.googlevideo.com/videoplayback?ms=au&pl=24&itag=43&mt=1447481698&upn=wU3Xnvzs5Jc&expire=1447503422&mm=31&mv=m&requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fwebm&mn=sn-4g57kn6e&signature=8AEC9B8774DB2412485A41CFB02ED9A18E757E98.61CCFDF3264C925A81597E2FCC2CDBF067848549&source=youtube&fexp=9408255%2C9408710%2C9413010%2C9414764%2C9416126%2C9417132%2C9417656%2C9417683%2C9419444%2C9420453%2C9421411%2C9421585%2C9422596%2C9422618%2C9422864%2C9423292%2C9423510%2C9423626%2C9423662%2C9423793%2C9423859%2C9424210%2C9424428&dur=0.000&key=yt6&lmt=1298635924888515&initcwndbps=5755000&ipbits=0&sver=3&ratebypass=yes&id=o-AJvjyMgpeOAZh7ETfrWEwzha6TnN9xFDeM7HTpapF6a8&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198', '360p', 'No', 6101203, 'Success', '2015-11-14 06:17:27', '0000-00-00 00:00:00', '2015-11-14 06:17:46', '2015-11-14 06:17:24'),
(193, 433, 2, 1, 'b578e96e41a77eae722ef4a51d22e620.webm', 'webm', 'Running Wellhead incl cementing.avi', 3536328, 'https://www.youtube.com/watch?v=BY2AVauZggA', 'https://r19---sn-4g57knkd.googlevideo.com/videoplayback?expire=1447503452&itag=43&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9420452%2C9422494%2C9422596%2C9422618%2C9423662&source=youtube&mime=video%2Fwebm&lmt=1340551056232086&ms=au&mt=1447481698&mv=m&dur=0.000&mm=31&mn=sn-4g57knkd&id=o-AIZBBHZtVLJdmQb2fdU26NVns6mMxzqqRUrcMBQZEOLq&upn=S44zxfaURmA&ipbits=0&ip=176.9.235.198&key=yt6&requiressl=yes&sver=3&signature=964A3C49996175B7FD39435507A8321EF47CBA8C.0E93A5556AB6DA769310E498FA0F0372A4AB3305&pl=24&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ratebypass=yes&initcwndbps=5755000', '360p', 'No', 3536328, 'Success', '2015-11-14 06:17:42', '0000-00-00 00:00:00', '2015-11-14 06:17:59', '2015-11-14 06:17:38'),
(194, 433, 2, 1, '18ee84ea993b6901d381d9fbf2dc0508.mp4', 'mp4', 'HellCat™  2  Intelligent‑Completion Packer', 19423609, 'https://www.youtube.com/watch?v=iLr4QwO6OTs', 'https://r1---sn-4g57knzy.googlevideo.com/videoplayback?id=o-ADc9QGdCSKNx4m50VZbb_ZyNI_d2QOwMY3FH_7jh7fWc&dur=124.319&source=youtube&ip=176.9.235.198&requiressl=yes&itag=22&lmt=1408928724369583&ipbits=0&ratebypass=yes&expire=1447504231&upn=dqhIfJnqo5I&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sver=3&mime=video%2Fmp4&fexp=9406852%2C9407169%2C9408509%2C9408710%2C9414764%2C9416126%2C9417516%2C9417683%2C9420142%2C9420452%2C9420772%2C9422596%2C9422618%2C9423280%2C9423509%2C9423518%2C9423662%2C9423672%2C9423790%2C9424429&ms=au&mv=u&pl=24&mt=1447482175&signature=89004514C35AF0D1C8298ECABD0120CA05E8C1C8.E13B55D8B4AE94BEF269C8E287850CA89C36AFE8&key=yt6&mn=sn-4g57knzy&mm=31', '720p', 'No', 19423609, 'Success', '2015-11-14 06:30:57', '0000-00-00 00:00:00', '2015-11-14 06:32:40', '2015-11-14 06:30:52'),
(195, 433, 2, 1, '284fb7d8accbe7dd00dcd0763f2013ac.webm', 'webm', 'RapidMATRIX Animation - Packers Plus', 16480411, 'https://www.youtube.com/watch?v=JQa8xumQ9HY', 'https://r20---sn-4g57knl7.googlevideo.com/videoplayback?lmt=1320081569781154&fexp=9408490%2C9408710%2C9412526%2C9412857%2C9414764%2C9416074%2C9416126%2C9417529%2C9417683%2C9418802%2C9420309%2C9420453%2C9422596%2C9422618%2C9423452%2C9423662%2C9423667%2C9423789%2C9423858%2C9423992%2C9424049%2C9424605&mv=u&ipbits=0&upn=Yi2qBOFC5_I&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ratebypass=yes&signature=BEB9C187DCB9FFBFD95286FCC0BA472C8CF7FF0E.D774ED0D789AF4EAE4E846D7CA49132734E2368F&source=youtube&key=yt6&sver=3&expire=1447504243&dur=0.000&id=o-ABC5h4kka6Y52htB3QBixQpQJvM_MpnuE4WmLJ-VvAph&mime=video%2Fwebm&ms=au&requiressl=yes&pl=24&itag=43&mt=1447482175&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mn=sn-4g57knl7&mm=31&ip=176.9.235.198', '360p', 'No', 16480411, 'Success', '2015-11-14 06:30:57', '0000-00-00 00:00:00', '2015-11-14 06:31:34', '2015-11-14 06:30:56'),
(196, 433, 2, 1, '6a69df6f9d4e24029766d78d0e3999e7.webm', 'webm', 'Reactive Element Packer (REPacker)', 8265384, 'https://www.youtube.com/watch?v=pQ3r_BBi4q4', 'https://r17---sn-4g57knld.googlevideo.com/videoplayback?expire=1447504266&signature=07DE748ADA508740322F035FAA617A0D84D1FD03.BE4C66DE858A5E0F65D049CFAEB42ECF1A00F83C&requiressl=yes&itag=43&source=youtube&lmt=1299571060519884&dur=0.000&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9408710%2C9408940%2C9414764%2C9416126%2C9417683%2C9418200%2C9418400%2C9420453%2C9421026%2C9421526%2C9421708%2C9422596%2C9422618%2C9422953%2C9422967%2C9423243%2C9423469%2C9423510%2C9423662%2C9423791%2C9424147%2C9424211&ipbits=0&mm=31&upn=2Jw9MMZOPrQ&ratebypass=yes&mt=1447482175&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&ms=au&sver=3&id=o-AGN3Xay4Q2iTYGeZju0yD-qQRF8PPZmkzPL_WJaJJNT6&mime=video%2Fwebm&pl=24&ip=176.9.235.198&key=yt6&mn=sn-4g57knld', '360p', 'No', 8265384, 'Prominent', '2015-11-14 06:31:12', '0000-00-00 00:00:00', '2015-11-14 06:32:23', '2015-11-14 06:31:12'),
(197, 433, 2, 1, 'ea192a8fb85eb45d188271bd380f2b6c.mp4', 'mp4', 'BULLDOG® ACP® Annulus Casing Packer', 69475463, 'https://www.youtube.com/watch?v=1GclhH5CIYE', 'https://r5---sn-4g57kndr.googlevideo.com/videoplayback?ratebypass=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sver=3&lmt=1408172314195954&dur=253.399&source=youtube&fexp=9408710%2C9410705%2C9414764%2C9416126%2C9417683%2C9418778%2C9419487%2C9420453%2C9421341%2C9422150%2C9422556%2C9422596%2C9422618%2C9422864%2C9422952%2C9423509%2C9423643%2C9423662%2C9423791%2C9424211%2C9424434%2C9424642&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&ipbits=0&itag=22&mm=31&ip=176.9.235.198&mn=sn-4g57kndr&mt=1447482175&mv=u&ms=au&pl=24&id=o-AMdKQozOakqRDx6n_mTy9PQjPlJJ-SAyee7bxzicMCf1&upn=OzyHBKOWtmE&expire=1447504278&mime=video%2Fmp4&key=yt6&signature=827311E5D0094DE701AD49F52CE727B3B9EE10AA.1C87C3ED127BBEB6613747858157C64D5074440C', '720p', 'No', 69475463, 'Success', '2015-11-14 06:31:39', '0000-00-00 00:00:00', '2015-11-14 06:35:15', '2015-11-14 06:31:33'),
(198, 433, 2, 1, 'bd3ccc6708b7ae04ba99df2ec57fbf64.mp4', 'mp4', 'Magnus Set 1X Packer', 46689808, 'https://www.youtube.com/watch?v=zlQJKVaam2k', 'https://r13---sn-4g57knll.googlevideo.com/videoplayback?sver=3&ipbits=0&dur=257.578&ratebypass=yes&expire=1447504289&mime=video%2Fmp4&key=yt6&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9406513%2C9407536%2C9408505%2C9408710%2C9413139%2C9414764%2C9415821%2C9416126%2C9417683%2C9417740%2C9418200%2C9419445%2C9420453%2C9420716%2C9421171%2C9421707%2C9422596%2C9422618%2C9422919%2C9423430%2C9423509%2C9423662%2C9423793&signature=937DDD8596450F3B41BF491EA3ADDD7039679388.04E3AE60F34FBF1CDAAAD462EC7FCEA1204B59EF&lmt=1441968412062124&source=youtube&upn=J6u8bLML2o8&itag=22&ip=176.9.235.198&requiressl=yes&ms=au&mt=1447482175&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ALzxFSMjAg_0hqPKVJ03MlB8IRAX1yEu0eYtXfHrAg9y&pl=24&mm=31&mn=sn-4g57knll', '720p', 'No', 46689808, 'Success', '2015-11-14 06:31:39', '0000-00-00 00:00:00', '2015-11-14 06:34:17', '2015-11-14 06:31:35'),
(199, 433, 2, 1, 'bf4c614d7c43e9cb394ab88388acc49e.webm', 'webm', 'TIW HLX Packer C-RPOB, IB-TC-RRP Hydro Hanger, Landing Collar & Set Shoe H1-PL Setting Tool & Dogs', 8345484, 'https://www.youtube.com/watch?v=RRzkKt3_Z1s', 'https://r5---sn-4g57knsy.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&key=yt6&mime=video%2Fwebm&fexp=9407157%2C9408494%2C9408710%2C9414764%2C9416126%2C9417683%2C9418401%2C9419563%2C9420453%2C9421605%2C9422596%2C9422618%2C9423228%2C9423510%2C9423662%2C9423791%2C9424205%2C9424261&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&expire=1447504290&dur=0.000&lmt=1372314193192317&signature=C572096D429BD9B91F091F3597CAEFF9D6E22B41.84C780374A98EE5E069B16022D7E745B52626EAE&source=youtube&ms=au&mv=u&mt=1447482175&id=o-ALUiv3FKyFeX0Rd1Hcp2kMKnXf5Bh4iGDBUhc3tfv6SS&mn=sn-4g57knsy&mm=31&ipbits=0&upn=RnfpGKQabaU&pl=24&itag=43&pcm2=yes&ratebypass=yes&requiressl=yes&sver=3&ip=176.9.235.198', '360p', 'No', 8345484, 'Success', '2015-11-14 06:31:39', '0000-00-00 00:00:00', '2015-11-14 06:33:32', '2015-11-14 06:31:37'),
(200, 433, 2, 1, 'dbaa9358c4884a356cb1e707ce399dc1.webm', 'webm', 'Openhole Fishing', 47626252, 'https://www.youtube.com/watch?v=7-WqVgksKtk', 'https://r5---sn-4g57knzs.googlevideo.com/videoplayback?signature=301C8F88C40BF0373A712253F398838F125BF10A.4C2150461E953E0CEC8F536EE2F72F431DD460F9&requiressl=yes&ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=43&id=o-AJISNKfMLnwFmQG1j0zto6cIfGjieQFBX3ePYdNPx9KJ&mm=31&ipbits=0&mn=sn-4g57knzs&ip=176.9.235.198&ms=au&mt=1447484374&dur=0.000&mv=u&sver=3&upn=Amo-2p9hdSQ&expire=1447506603&lmt=1299169364256677&key=yt6&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9408255%2C9408710%2C9414764%2C9416126%2C9417098%2C9417259%2C9417683%2C9418401%2C9419488%2C9420453%2C9420928%2C9421168%2C9422124%2C9422596%2C9422618%2C9423177%2C9423510%2C9423662%2C9423789%2C9423991%2C9424419%2C9424617&mime=video%2Fwebm&pl=24&source=youtube', '360p', 'No', 47626252, 'Success', '2015-11-14 07:18:16', '0000-00-00 00:00:00', '2015-11-14 07:19:49', '2015-11-14 07:18:14'),
(201, 433, 2, 1, '22e26bbea9205d9e0fab325aeafb63e8.webm', 'webm', 'Casing fill up & circulation tool', 8633370, 'https://www.youtube.com/watch?v=FuVJjthWUKE', 'https://r15---sn-4g57kn6s.googlevideo.com/videoplayback?fexp=9406851%2C9408208%2C9408710%2C9414764%2C9416126%2C9417026%2C9417683%2C9418401%2C9418898%2C9419354%2C9419488%2C9419546%2C9420453%2C9422596%2C9422618%2C9423510%2C9423662%2C9423792%2C9424211%2C9424531&mv=u&key=yt6&lmt=1319875657276261&dur=0.000&ipbits=0&mn=sn-4g57kn6s&requiressl=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mime=video%2Fwebm&signature=56D7247AFCDA3A0A5A97D9EF44A1FB0134F1882F.112860FBC3BA8928BBDA7C33C2820BF9A16B1A97&source=youtube&pl=24&itag=43&mt=1447485113&ms=au&upn=B-pJAnkXHBU&expire=1447507292&mm=31&sver=3&ratebypass=yes&id=o-AIjBzqdTTBlxYxnqTwRoBydOHQd8rbQlY80ItadzphkA&ip=176.9.235.198&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire', '360p', 'No', 8633370, 'Success', '2015-11-14 07:22:07', '0000-00-00 00:00:00', '2015-11-14 07:22:52', '2015-11-14 07:22:02'),
(202, 433, 2, 1, '362062091747786bad8753aef8274af6.webm', 'webm', 'Constructing Totals Dalia Field Part 6 - Running of Tubing Hanger', 12786685, 'https://www.youtube.com/watch?v=5_hLmRiK0bo', 'https://r16---sn-4g57kn76.googlevideo.com/videoplayback?ipbits=0&mime=video%2Fwebm&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&signature=24984B09A732F726EF40EA1D24BDB53CECC87A04.A54E2BC33B1A2499D6331A9D764780AEDF8EB800&key=yt6&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9408710%2C9414764%2C9416126%2C9416359%2C9417580%2C9417683%2C9418200%2C9418204%2C9418400%2C9419445%2C9420453%2C9421175%2C9421464%2C9421644%2C9422191%2C9422596%2C9422618%2C9423040%2C9423510%2C9423662%2C9423723%2C9423793%2C9424301&requiressl=yes&lmt=1298965054112572&source=youtube&dur=0.000&ratebypass=yes&sver=3&upn=yi-O9w2F34g&expire=1447507310&itag=43&id=o-AIsF0aUu2y8f6b6yBgzrhrzPBzjOvRRyPjo1Y4W9gxKt&mm=31&mn=sn-4g57kn76&pl=24&ip=176.9.235.198&ms=au&mt=1447485113&mv=u', '360p', 'No', 12786685, 'Success', '2015-11-14 07:22:07', '0000-00-00 00:00:00', '2015-11-14 07:22:28', '2015-11-14 07:22:05'),
(203, 433, 2, 1, 'c4382503e4b35862f32f35a75bdc7d5b.webm', 'webm', 'Running Casing Animation', 3847333, 'https://www.youtube.com/watch?v=OXgUKXFsJ_I', 'https://r19---sn-4g57knzk.googlevideo.com/videoplayback?ipbits=0&signature=8D767597296E3E4DEA2251B4C473F726CC8F9CA4.3EF7FFA2C432250902B55F935FDC9688783CDD60&mime=video%2Fwebm&itag=43&ratebypass=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sver=3&expire=1447507223&dur=0.000&pl=24&fexp=9406821%2C9408211%2C9408710%2C9409205%2C9414764%2C9416126%2C9417683%2C9418806%2C9419445%2C9420453%2C9422491%2C9422596%2C9422618%2C9422796%2C9423294%2C9423391%2C9423510%2C9423662%2C9423786%2C9423791%2C9423958%2C9424135%2C9424308&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198&lmt=1331096572971536&upn=HK7CYipl_A8&id=o-AKnQrldidI8gjKik0R1-5RchmzGV7ed_aexjLCH3BgnB&mn=sn-4g57knzk&mm=31&requiressl=yes&key=yt6&source=youtube&ms=au&mv=u&mt=1447485113', '360p', 'No', 3847333, 'Success', '2015-11-14 07:22:07', '0000-00-00 00:00:00', '2015-11-14 07:22:52', '2015-11-14 07:22:06'),
(204, 433, 1, 1, '68c271d23eeffc280363c059b99d4037.mp4', 'mp4', 'Drill Bits - Oil and Gas Drilling: From Planning to Production', 28797019, 'https://www.youtube.com/watch?v=4gbI0wDUj0U', 'https://r18---sn-4g57kn7z.googlevideo.com/videoplayback?mime=video%2Fmp4&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&itag=22&expire=1447514345&upn=0dY3g8LPxKI&lmt=1417263057615150&ratebypass=yes&source=youtube&sver=3&ip=176.9.235.198&key=yt6&mm=31&mn=sn-4g57kn7z&mt=1447492347&mv=u&pl=24&id=o-AGtBNneSHsdrrRsBznpBaxcR5anydx-cO70IJxYwRIPO&ms=au&signature=C3E7A9C75520A1BBFD9EBD69DC1E006FC87E2C10.089A612543F7765FE5CBB9905312F8A49FFC97BD&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9418204%2C9420453%2C9421288%2C9421560%2C9421666%2C9422124%2C9422341%2C9422596%2C9422618%2C9422673%2C9423319%2C9423510%2C9423662%2C9423791%2C9423992%2C9424088&ipbits=0&dur=206.959', '720p', 'No', 28797019, 'Prominent', '2015-11-14 09:19:23', '0000-00-00 00:00:00', '2015-11-14 09:19:31', '2015-11-14 09:19:23'),
(205, 433, 1, 1, '78f6a46dc14ffaa42dc961c56ab48d3c.webm', 'webm', 'Oil Well Drilling Process with animation', 105127195, 'https://www.youtube.com/watch?v=XhWrVx08j3M', 'https://r7---sn-4g57knld.googlevideo.com/videoplayback?ratebypass=yes&source=youtube&sver=3&upn=fxC_BjZbec0&lmt=1430404019460405&mv=u&pl=24&mt=1447492347&ms=au&id=o-AOXZDaySuoAVFwWl4nn3SIFj7CmCM7IY-bCxERGXGo7B&signature=97F7FB98E45E131C81E52EDBD71095FEB8D25FA1.98F40901AADC7136C7F00E29B338EDE176CFCB57&ip=176.9.235.198&key=yt6&mn=sn-4g57knld&mm=31&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9418204%2C9418401%2C9418896%2C9420453%2C9420708%2C9421171%2C9421249%2C9422596%2C9422618%2C9423244%2C9423510%2C9423662%2C9423790%2C9424147%2C9424301&dur=0.000&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&requiressl=yes&ipbits=0&expire=1447514355&mime=video%2Fwebm&itag=43&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '360p', 'No', 105127195, 'Success', '2015-11-14 09:19:32', '0000-00-00 00:00:00', '2015-11-14 09:19:55', '2015-11-14 09:19:30'),
(206, 433, 1, 1, '90296c82888b4a24793b5844cfbb8cc8.webm', 'webm', 'Rock Bit/ Tricone Bit/ Oil Drill Bits/ Drill Bits/ Water Well Drill Bits', 4095184, 'https://www.youtube.com/watch?v=pOyT5xcEB6c', 'https://r5---sn-4g57kn7e.googlevideo.com/videoplayback?mt=1447492347&mv=u&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&itag=43&ms=au&ip=176.9.235.198&requiressl=yes&mm=31&mn=sn-4g57kn7e&id=o-AIBS033T2_ZKeVSSeE5iqV50m4dmBYQUIMs5Zs4dleHA&pl=24&fexp=9408254%2C9408710%2C9412527%2C9414764%2C9416126%2C9416556%2C9417055%2C9417683%2C9420453%2C9421097%2C9421793%2C9421941%2C9422596%2C9422618%2C9422925%2C9423318%2C9423420%2C9423510%2C9423662%2C9423790%2C9423991%2C9424428&ratebypass=yes&expire=1447514380&ipbits=0&dur=0.000&sver=3&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mime=video%2Fwebm&key=yt6&signature=27F4A6AB5C5DE6113DB026F09B5842D5885462CC.C4F79BA7FDF116C0EDB6C4E743ABD2BA6BDD4251&source=youtube&upn=XQzyxMxmwcs&lmt=1331541576449475', '360p', 'No', 4095184, 'Success', '2015-11-14 09:20:17', '0000-00-00 00:00:00', '2015-11-14 09:20:22', '2015-11-14 09:20:14'),
(207, 433, 1, 1, '7a93890ae39c21208e7b51d87125817f.webm', 'webm', 'Different Types of Drilling Bits', 7800480, 'https://www.youtube.com/watch?v=1M80acTrkIk', 'https://r13---sn-4g57knsy.googlevideo.com/videoplayback?sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&upn=6MKYL2f5Azc&mime=video%2Fwebm&fexp=9407155%2C9408710%2C9413141%2C9413279%2C9414764%2C9414929%2C9416126%2C9417683%2C9420453%2C9420539%2C9421249%2C9421253%2C9422150%2C9422435%2C9422596%2C9422618%2C9422903%2C9423509%2C9423662%2C9423789%2C9424114%2C9424205&ratebypass=yes&source=youtube&pl=24&mv=u&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ipbits=0&mm=31&mn=sn-4g57knsy&requiressl=yes&sver=3&expire=1447514408&ms=au&mt=1447492347&signature=224F6ED41D1CCF26FB58F7C696B190530748AB09.5246E582184312CD01AD86A4FB16DC795F1B2EA3&dur=0.000&lmt=1403768716628030&key=yt6&ip=176.9.235.198&id=o-ADUFzQr_vXBY8y09m_BK0JdIORXPtBVqFs-DbTYq89s1&itag=43', '360p', 'No', 7800480, 'Success', '2015-11-14 09:20:17', '0000-00-00 00:00:00', '2015-11-14 09:20:22', '2015-11-14 09:20:16'),
(208, 433, 1, 1, '0b0936e0bf6bc627642bd1b436c9b54c.mp4', 'mp4', 'Tomax Anti Stall Technology for oilwell drilling', 57657546, 'https://www.youtube.com/watch?v=alsjqyHNGtI', 'https://r18---sn-4g57knez.googlevideo.com/videoplayback?ipbits=0&mime=video%2Fmp4&ratebypass=yes&requiressl=yes&ms=au&mt=1447492347&mv=u&dur=188.453&sver=3&itag=22&key=yt6&signature=DB648FEAD30A09066E03F86005C959F3802DEA5F.CE6C4DEA6C28CB48D2AA2E3827CD3B6DC7A5EB93&mn=sn-4g57knez&id=o-AKsYVNR398Bb_T3eEJTrnWzY6vj9OPaZ7-gRK9tWg3BT&expire=1447514426&ip=176.9.235.198&lmt=1386949212954280&fexp=9408710%2C9414764%2C9415387%2C9416126%2C9416778%2C9417204%2C9417683%2C9418907%2C9419837%2C9420453%2C9422150%2C9422482%2C9422596%2C9422618%2C9422778%2C9423321%2C9423510%2C9423662%2C9423740%2C9423789%2C9424646&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&source=youtube&mm=31&pl=24&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&upn=TRaY8-KWWR4', '720p', 'No', 57657546, 'Prominent', '2015-11-14 09:20:32', '0000-00-00 00:00:00', '2015-11-14 09:20:55', '2015-11-14 09:20:30'),
(209, 415, 1, 1, '036d69a72b0c77134eb4f75a7244c18a.flv', 'flv', 'Modular plant for methanol production', 15053517, 'https://www.youtube.com/watch?v=a0sh4kxq5E8', 'https://r13---sn-4g57knz6.googlevideo.com/videoplayback?itag=5&sver=3&mime=video%2Fx-flv&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447516522&upn=90rsPt2vmLc&fexp=9407059%2C9408710%2C9414764%2C9416126%2C9417683%2C9420453%2C9422596%2C9422618%2C9423662&ipbits=0&ms=au&lmt=1395533243601661&dur=348.082&mv=u&source=youtube&pl=24&mt=1447494262&requiressl=yes&ip=176.9.235.198&mm=31&key=yt6&signature=B951EB7487B002D00F5579C708BACDC3EFEF3608.B07990C8057F9DFB93DB4278F15859D49242DA6D&id=o-ABq7UR9T8RgWQkMSk9D9a6d_Uh_RBOKHPfr4f0eIPD2r&mn=sn-4g57knz6&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '240p', 'No', 15053517, 'Prominent', '2015-11-14 09:57:23', '0000-00-00 00:00:00', '2015-11-14 09:57:33', '2015-11-14 09:57:18'),
(210, 1, 1, 1, '0859c1ea5a9be82f567b130b36e8f958.3gp', '3gp', '#GettyInspired: Maz Jobrani', 2472930, 'http://www.youtube.com/watch?v=-jt2KrLT1ns', 'https://r5---sn-4g57kn7s.googlevideo.com/videoplayback?nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&sver=3&requiressl=yes&itag=17&expire=1447527644&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mt=1447505962&ipbits=0&pl=24&mv=u&source=youtube&ms=au&lmt=1444247311142175&key=yt6&ip=176.9.235.198&fexp=9408086%2C9408710%2C9410706%2C9414764%2C9416126%2C9417055%2C9417683%2C9419837%2C9420453%2C9420473%2C9421291%2C9421461%2C9421932%2C9421942%2C9422327%2C9422596%2C9422618%2C9423428%2C9423662%2C9423667%2C9423793%2C9424128%2C9424135%2C9424211%2C9424363&dur=245.620&upn=1tOioGeeSjk&mn=sn-4g57kn7s&mm=31&signature=B3F1FC4CA790AFF7A6287EE0FFFCC0DF9ED1FD07.7AF31C7967EB7AA802EACFFFBDFA64A0C240E1EA&mime=video%2F3gpp&id=o-AL0QeZF9yVpF3wMZh9q5XBocO60IawHEfuaPTXVywqWf', '144p', 'No', 2472930, 'Success', '2015-11-14 13:00:53', '0000-00-00 00:00:00', '2015-11-14 13:00:59', '2015-11-14 13:00:51'),
(211, 118, 1, 1, '8d0f71973130b4704d37efb72c432d63.mp4', 'mp4', 'SAP 2000 MODEL : BUILDING WITH VISCOUS DAMPER', 229829, 'https://www.youtube.com/watch?v=l2aK2UqiiiI', 'https://r17---sn-4g57kn6e.googlevideo.com/videoplayback?ipbits=0&lmt=1413636402067329&key=yt6&expire=1447527683&dur=5.201&fexp=9408710%2C9414764%2C9416126%2C9417354%2C9417683%2C9420453%2C9420716%2C9421793%2C9422596%2C9422618%2C9422676%2C9423201%2C9423510%2C9423662%2C9423790%2C9424211&ip=176.9.235.198&itag=18&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ADSuoKUGIGRM7EsFkhRtjxltyi2u7xSphLWbvBjuHrfz&ratebypass=yes&sver=3&mm=31&mn=sn-4g57kn6e&upn=AKiTbHR-zwo&mt=1447505962&pl=24&mv=u&ms=au&source=youtube&signature=80A7BB46728918FA7D0D07A1994573916F455ECD.6E88870434800B61BC55F389CCE563AF1F7073C9&mime=video%2Fmp4&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&requiressl=yes', '360p', 'No', 229829, 'Success', '2015-11-14 13:02:50', '0000-00-00 00:00:00', '2015-11-14 13:02:53', '2015-11-14 13:02:47'),
(212, 118, 1, 1, '91be29e334f7dabf1dcb404ca2eb8baa.mp4', 'mp4', 'SAP2000 - 04 Mass and Modal Analysis', 9618074, 'https://www.youtube.com/watch?v=DOraO8Vt0VE', 'https://r17---sn-4g57kndr.googlevideo.com/videoplayback?ratebypass=yes&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&pl=24&sver=3&requiressl=yes&signature=3DFA75130AF4B3C33496F698A0B3A0FF954834DD.825C582BD917F1BCD804BDED92923EB0A3A95FFE&mime=video%2Fmp4&source=youtube&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9420453%2C9421408%2C9422596%2C9422618%2C9423662&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447527849&itag=18&dur=345.187&mn=sn-4g57kndr&mm=31&ms=au&mv=u&mt=1447505962&lmt=1392137341409036&ipbits=0&key=yt6&ip=176.9.235.198&upn=zlUBmFvbisE&id=o-AB-pPWvIxaCCzBIS5HedwntHhwq9EdPgKjUov4grjWdT', '360p', 'No', 9618074, 'Success', '2015-11-14 13:04:53', '0000-00-00 00:00:00', '2015-11-14 13:04:55', '2015-11-14 13:04:52'),
(213, 118, 1, 1, '2be9b4fcd8a92870b3f8a495f9b3881f.3gp', '3gp', '2-Cardinal points  in Sap2000', 3703963, 'https://www.youtube.com/watch?v=NFP4sqzhWCk', 'https://r5---sn-4g57kn6z.googlevideo.com/videoplayback?mt=1447505962&ipbits=0&itag=17&mm=31&sver=3&mime=video%2F3gpp&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&expire=1447527826&upn=9WUMLP84980&key=yt6&signature=4DC94E3E1D2FBBA434588E64C4B8F0340708C9BD.439457C929600C8644D0C459C7998BA46E22D380&id=o-ANDw9flKH0XN4QClL-30YclzzOgLt8dIzAl-wergF0Dv&mn=sn-4g57kn6z&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ms=au&lmt=1394932345057392&dur=529.089&mv=u&fexp=9408207%2C9408710%2C9414764%2C9416126%2C9416985%2C9417683%2C9418401%2C9418908%2C9419294%2C9420238%2C9420453%2C9420924%2C9421293%2C9421911%2C9422596%2C9422618%2C9423224%2C9423662%2C9423667%2C9423789%2C9424205&source=youtube&pl=24&requiressl=yes&ip=176.9.235.198', '144p', 'No', 3703963, 'Prominent', '2015-11-14 13:08:26', '0000-00-00 00:00:00', '2015-11-14 13:08:30', '2015-11-14 13:08:22'),
(214, 1, 1, 1, '0f0099d5ba9bc43edbf6cceab76e0896.mp4', 'mp4', '#GettyInspired: Maz Jobrani', 13869891, 'http://www.youtube.com/watch?v=-jt2KrLT1ns', 'https://r5---sn-4g57kn7s.googlevideo.com/videoplayback?pl=24&sver=3&itag=18&mn=sn-4g57kn7s&mm=31&id=o-AKORiYfzrUayWH2AEAxPZkYBnOwZXBBnY_KimjZ67O18&dur=245.551&lmt=1444247331879879&ip=176.9.235.198&key=yt6&fexp=9408710%2C9413128%2C9414764%2C9416126%2C9416485%2C9417367%2C9417683%2C9418204%2C9420453%2C9420569%2C9420716%2C9421411%2C9422596%2C9422618%2C9422676%2C9423246%2C9423662%2C9423667%2C9423791%2C9424056&mv=u&source=youtube&ms=au&ratebypass=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&requiressl=yes&mt=1447506643&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&upn=ehFO6aeGtxc&signature=2CCA865E0A87B3B00D79CA78B3C6B9072B128E40.51F6991ADE5C49B79DE658A60CFCB5A88FA9B119&mime=video%2Fmp4&expire=1447528774', '360p', 'No', 13869891, 'Success', '2015-11-14 13:19:47', '0000-00-00 00:00:00', '2015-11-14 13:19:50', '2015-11-14 13:19:43'),
(215, 4, 1, 1, '64b33bf174a5755ce37cdc8077056437.webm', 'webm', 'AZ ARSH TA FARSH', 36397429, 'http://www.youtube.com/watch?v=Rh68zBm1utI', 'https://r4---sn-4g57kn7d.googlevideo.com/videoplayback?itag=43&mt=1447512404&upn=b3DY4t5QtUE&signature=13849B7DBF0BC409301FB083FA01B1549AE65F49.46F12B53C5C00E1258EE3D5AC3BEB5C34C28E773&mime=video%2Fwebm&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpcm2%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&ratebypass=yes&mv=u&source=youtube&ms=au&lmt=1415673384127334&ip=176.9.235.198&key=yt6&fexp=9407157%2C9408499%2C9408710%2C9414764%2C9415030%2C9416126%2C9416984%2C9417683%2C9418203%2C9420453%2C9420890%2C9421946%2C9422541%2C9422596%2C9422618%2C9423292%2C9423419%2C9423510%2C9423662%2C9423791%2C9424530%2C9424616&mn=sn-4g57kn7d&mm=31&id=o-AGRhcpiCI5Cbx5rv1uHaE3dd5zPhZ4BBrlEMFmJKovZW&dur=0.000&sver=3&expire=1447534084&pcm2=yes&pl=24', '360p', 'No', 36397429, 'Success', '2015-11-14 14:48:21', '0000-00-00 00:00:00', '2015-11-14 14:48:35', '2015-11-14 14:48:20'),
(216, 552, 1, 1, 'e166f015feaad524737797a0e684dbcf.mp4', 'mp4', 'How MFL Works - MFE Enterprises', 11580076, 'https://www.youtube.com/watch?v=aQJtHTfHVTU', 'https://r5---sn-4g57knlz.googlevideo.com/videoplayback?pl=24&expire=1447534837&sver=3&dur=204.892&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&ratebypass=yes&upn=UjMOMY0eHbs&id=o-AJKZ2r9B4X25_-aAVVA8_UnDCrbSaRkCqDsemSVuez-W&lmt=1421093699473502&ip=176.9.235.198&fexp=9408494%2C9408710%2C9409206%2C9412777%2C9414764%2C9416126%2C9417683%2C9420453%2C9420924%2C9421712%2C9422342%2C9422357%2C9422596%2C9422618%2C9423319%2C9423419%2C9423510%2C9423662%2C9423789%2C9424210&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&mt=1447513023&ms=au&source=youtube&mime=video%2Fmp4&requiressl=yes&mn=sn-4g57knlz&mm=31&itag=18&key=yt6&signature=D58FBC624AB667F7FC7604307837E5C6C21551E6.1A635DD7915B3817EF5C1170EFE277C2AF3716F7&ipbits=0', '360p', 'No', 11580076, 'Success', '2015-11-14 15:01:42', '0000-00-00 00:00:00', '2015-11-14 15:01:47', '2015-11-14 15:01:36'),
(217, 4, 1, 1, '218c8762aa38d0022e2f75d3eb5ea233.3gp', '3gp', 'SimCity Cities Of Tomorrow S02E33: Saving The Mega Towers', 21258202, 'http://www.youtube.com/watch?v=vuz2koEFnjo', 'https://r11---sn-4g57kne6.googlevideo.com/videoplayback?itag=17&ms=au&mt=1447513023&mv=u&dur=2080.925&id=o-ANffE8uCOZOzZhblGlEqpzw0tTnlMECWFCff6GMs8bxe&fexp=9408710%2C9409207%2C9414764%2C9416126%2C9417224%2C9417683%2C9418145%2C9420260%2C9420452%2C9420930%2C9421170%2C9422596%2C9422618%2C9422674%2C9423487%2C9423510%2C9423662%2C9423791%2C9423939%2C9424048&sparams=cwbhb%2Cdur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&ip=176.9.235.198&mm=31&mn=sn-4g57kne6&lmt=1405074018980035&ipbits=0&expire=1447534992&mime=video%2F3gpp&requiressl=yes&cwbhb=yes&source=youtube&upn=7tlV_B5L8n8&key=yt6&signature=BE234080EB4C2CD5C4362F8718AAF5D94A10E834.DC77D09D82F1BE245560B070499C9DAEA19773F7&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sver=3', '144p', 'No', 21258202, 'Success', '2015-11-14 15:03:33', '0000-00-00 00:00:00', '2015-11-14 15:03:46', '2015-11-14 15:03:30'),
(218, 552, 1, 1, '857aa003c8a10f0d0c1bb3902d5461d7.flv', 'flv', 'How MFL Works - MFE Enterprises', 8979641, 'https://www.youtube.com/watch?v=aQJtHTfHVTU', 'https://r5---sn-4g57knlz.googlevideo.com/videoplayback?mv=u&mt=1447513023&ms=au&pl=24&source=youtube&expire=1447534837&sver=3&dur=204.878&mime=video%2Fx-flv&requiressl=yes&key=yt6&mn=sn-4g57knlz&mm=31&itag=5&upn=UjMOMY0eHbs&id=o-AJKZ2r9B4X25_-aAVVA8_UnDCrbSaRkCqDsemSVuez-W&lmt=1421093693031962&ip=176.9.235.198&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&fexp=9408494%2C9408710%2C9409206%2C9412777%2C9414764%2C9416126%2C9417683%2C9420453%2C9420924%2C9421712%2C9422342%2C9422357%2C9422596%2C9422618%2C9423319%2C9423419%2C9423510%2C9423662%2C9423789%2C9424210&signature=BF4AC5EE10F033838080B5F214D15D9AA0A40B2E.4E7F4EA24649A1D53B3E5C285666BD3E5444CD34&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0', '240p', 'No', 8979641, 'Prominent', '2015-11-14 15:04:18', '0000-00-00 00:00:00', '2015-11-14 15:04:25', '2015-11-14 15:04:12'),
(219, 4, 1, 1, '9619e1267271b45ef52522461483918d.mp4', 'mp4', 'SimCity Cities Of Tomorrow S02E33: Saving The Mega Towers', 173366868, 'http://www.youtube.com/watch?v=vuz2koEFnjo', 'https://r11---sn-4g57kne6.googlevideo.com/videoplayback?itag=18&ms=au&mt=1447513023&mv=u&dur=2080.833&id=o-ANffE8uCOZOzZhblGlEqpzw0tTnlMECWFCff6GMs8bxe&fexp=9408710%2C9409207%2C9414764%2C9416126%2C9417224%2C9417683%2C9418145%2C9420260%2C9420452%2C9420930%2C9421170%2C9422596%2C9422618%2C9422674%2C9423487%2C9423510%2C9423662%2C9423791%2C9423939%2C9424048&sparams=cwbhb%2Cdur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&pl=24&ip=176.9.235.198&mm=31&mn=sn-4g57kne6&lmt=1405073583562838&ratebypass=yes&ipbits=0&expire=1447534992&mime=video%2Fmp4&requiressl=yes&cwbhb=yes&source=youtube&upn=7tlV_B5L8n8&signature=01E68CED50E3966968E48DD96FBECFA3F0294A8A.0E94AA54A4D784F515FB6C2E3E1DCF79F4FB0DFB&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&sver=3&key=yt6', '360p', 'No', 173366868, 'Success', '2015-11-14 15:08:27', '0000-00-00 00:00:00', '2015-11-14 15:09:32', '2015-11-14 15:08:26'),
(220, 4, 1, 1, '18b9249e5c28e44fc804356fab0b7d9a.mp4', 'mp4', 'SimCity: Everything you need to know about Mega Towers', 98455120, 'https://www.youtube.com/watch?v=wzUy0RsSiLs', 'https://r1---sn-4g57kn6l.googlevideo.com/videoplayback?source=youtube&ratebypass=yes&dur=1920.754&initcwndbps=4836250&pl=24&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&requiressl=yes&expire=1447535340&mime=video%2Fmp4&key=yt6&itag=18&ipbits=0&lmt=1417353532586424&sver=3&mt=1447513590&mv=m&signature=3C86141B1C550FDD3F54764047984527B13363BC.301C916FEEF66925708F6C151E80E91F78D8894F&ms=au&upn=0mHtLU46Njs&mm=31&mn=sn-4g57kn6l&id=o-ABSpkoSE8HTeVhZJ0ghxxcNOFKLja_ghk9gtpaF5RR-c&fexp=9405348%2C9406852%2C9408710%2C9414764%2C9416126%2C9417683%2C9417701%2C9420453%2C9422336%2C9422596%2C9422618%2C9422673%2C9423662%2C9423667%2C9423792%2C9423978%2C9424221%2C9424237%2C9424371&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198', '360p', 'No', 98455120, 'Prominent', '2015-11-14 15:09:06', '0000-00-00 00:00:00', '2015-11-14 15:09:23', '2015-11-14 15:09:06'),
(221, 561, 1, 1, '8da57050a86afcb46a7a134482a86e07.mp4', 'mp4', 'HyperMesh | Reflect | Mirror | Entities | Elements | Nodes | GRS |', 20441481, 'https://www.youtube.com/watch?v=MemQD6WTiSo', 'https://r3---sn-4g57knl7.googlevideo.com/videoplayback?pl=24&ipbits=0&upn=wcVJQ6ECYNA&sver=3&requiressl=yes&ratebypass=yes&itag=22&ip=176.9.235.198&lmt=1414736221383205&dur=238.050&expire=1447545870&fexp=9407536%2C9408710%2C9414764%2C9415515%2C9416126%2C9417683%2C9418401%2C9418811%2C9419838%2C9420453%2C9421912%2C9422342%2C9422522%2C9422596%2C9422618%2C9422844%2C9423295%2C9423662%2C9423667%2C9423791%2C9424134%2C9424150%2C9424257&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&key=yt6&mime=video%2Fmp4&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mn=sn-4g57knl7&mm=31&id=o-AKOKGfzKcgeJjMRKq7nmy-p8zbVgPemx18Kleatiu9eG&mv=u&mt=1447523891&ms=au&signature=650DA70CDAFE8383EB07837AFDCC830E3256188E.99264224025B3D8D2C722CDC20197F4A2CEDE322&source=youtube', '720p', 'No', 20441481, 'Prominent', '2015-11-14 18:04:47', '0000-00-00 00:00:00', '2015-11-14 18:04:51', '2015-11-14 18:04:43'),
(222, 1, 1, 1, '86a0a62a6cc98980d427b360f037437e.webm', 'webm', 'Top 10 most amazing places in the world', 31444517, 'https://www.youtube.com/watch?v=RN-UbklDLWo', 'https://r20---sn-4g57kn6s.googlevideo.com/videoplayback?initcwndbps=3030000&ip=176.9.235.198&key=yt6&signature=C154C48025074450FE4490AE8B5D6D081AB5F8D0.703C88E9DFDF92A1C2044EB450F1E56A9BCAB593&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&mn=sn-4g57kn6s&mt=1447524533&mv=m&id=o-AA1Dbr6M0H92qz8iU4iJFWqK-L8JG4NVpQ7z2vAe7_mJ&ms=au&source=youtube&lmt=1405504927673293&dur=0.000&sver=3&mime=video%2Fwebm&fexp=9407117%2C9408137%2C9408492%2C9408710%2C9409208%2C9413011%2C9414764%2C9416126%2C9416554%2C9417422%2C9417683%2C9420453%2C9420539%2C9421027%2C9421469%2C9421647%2C9422596%2C9422618%2C9423243%2C9423510%2C9423662%2C9423793%2C9424371%2C9424619&itag=43&upn=XSPIfDSimVA&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&pl=24&requiressl=yes&ipbits=0&ratebypass=yes&mm=31&expire=1447546279', '360p', 'No', 31444517, 'Success', '2015-11-14 18:11:38', '0000-00-00 00:00:00', '2015-11-14 18:11:44', '2015-11-14 18:11:35'),
(223, 514, 1, 1, 'f640c7d61fe476d2220a5f248f528f5f.3gp', '3gp', 'Erecting the tower crane at K2 at K Station', 16070773, 'https://www.youtube.com/watch?v=C6mL216XPiU', 'https://r8---sn-4g57knll.googlevideo.com/videoplayback?ip=176.9.235.198&requiressl=yes&mm=31&ipbits=0&id=o-AMp0EwoKHOJm6VHF_e6QCzAwqCjc37vYiNMj5drwtffP&mime=video%2F3gpp&expire=1447561180&lmt=1426286933369440&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mt=1447539209&itag=36&signature=A3B2F34EEF7F366ACEEB3BF13D208673D4C21500.4349AD9DC890FF8C572986B79B265FC55F62D9B5&key=yt6&mn=sn-4g57knll&upn=Td4fRk4Y7ls&ms=au&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&dur=567.449&pl=24&fexp=9406993%2C9408710%2C9412846%2C9414764%2C9416126%2C9416985%2C9417683%2C9418204%2C9419451%2C9419542%2C9420309%2C9420453%2C9420539%2C9421168%2C9421711%2C9422516%2C9422596%2C9422618%2C9423509%2C9423662%2C9423791%2C9424183%2C9424307%2C9424546&sver=3', '240p', 'No', 16070773, 'Success', '2015-11-14 22:20:14', '0000-00-00 00:00:00', '2015-11-14 22:20:18', '2015-11-14 22:20:08'),
(224, 514, 1, 1, 'e2d46c7deb13e381284292d60f8d55cd.3gp', '3gp', 'Erecting the tower crane at K2 at K Station', 16070773, 'https://www.youtube.com/watch?v=C6mL216XPiU', 'https://r8---sn-4g57knll.googlevideo.com/videoplayback?ip=176.9.235.198&requiressl=yes&mm=31&ipbits=0&id=o-AMp0EwoKHOJm6VHF_e6QCzAwqCjc37vYiNMj5drwtffP&mime=video%2F3gpp&expire=1447561180&lmt=1426286933369440&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&mt=1447539209&itag=36&signature=A3B2F34EEF7F366ACEEB3BF13D208673D4C21500.4349AD9DC890FF8C572986B79B265FC55F62D9B5&key=yt6&mn=sn-4g57knll&upn=Td4fRk4Y7ls&ms=au&source=youtube&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&mv=u&dur=567.449&pl=24&fexp=9406993%2C9408710%2C9412846%2C9414764%2C9416126%2C9416985%2C9417683%2C9418204%2C9419451%2C9419542%2C9420309%2C9420453%2C9420539%2C9421168%2C9421711%2C9422516%2C9422596%2C9422618%2C9423509%2C9423662%2C9423791%2C9424183%2C9424307%2C9424546&sver=3', '240p', 'No', 16070773, 'Prominent', '2015-11-14 22:20:35', '0000-00-00 00:00:00', '2015-11-14 22:20:40', '2015-11-14 22:20:35'),
(225, 565, 1, 1, 'e34a20bf8b88a793c3558685225e2fc5.mp4', 'mp4', 'GRE Speed Work - Getting a 5 on the Analytical Writing', 20859915, 'https://www.youtube.com/watch?v=VnhZhaz3xBU', 'https://r12---sn-4g57knzy.googlevideo.com/videoplayback?nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&itag=18&mime=video%2Fmp4&expire=1447562814&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-APv439fWvSdR7wFSlVPjMIaWtM0-opLBZ26FUjFBBd3W&dur=1244.961&fexp=9408710%2C9414764%2C9416126%2C9417683%2C9420453%2C9422596%2C9422618%2C9423662&mm=31&mn=sn-4g57knzy&key=yt6&ip=176.9.235.198&signature=441733F2687DCF9DD60F5999E3116ED0FC511329.77745DFFF3715AA16C1C90BFC225202850D1BA23&mt=1447540716&pl=24&mv=u&ipbits=0&ms=au&lmt=1444464144492649&upn=f6tSKffZpj8&source=youtube&sver=3&ratebypass=yes', '360p', 'No', 20859915, 'Prominent', '2015-11-14 22:47:14', '0000-00-00 00:00:00', '2015-11-14 22:47:18', '2015-11-14 22:47:11'),
(226, 569, 1, 1, 'b4e4fab789b241dbd940e7bf3d96760c.3gp', '3gp', 'Muhammad (2015) Movie -Trailer (1)- Majid Majidi -   تیزر فیلم محمد رسول الله -  مجید مجیدی', 1514737, 'https://www.youtube.com/watch?v=gpato3Fu5uI', 'https://r14---sn-4g57kn7s.googlevideo.com/videoplayback?expire=1447592428&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE&requiressl=yes&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&upn=xXt88IdUlek&signature=1E4DB7DECA6759C9A3A97DD0A536D7E21CE6463F.4118AA5373E18A97200B683F60A61F7D18246C6A&key=yt6&sver=3&fexp=9408710%2C9414764%2C9415943%2C9416126%2C9416480%2C9417205%2C9417683%2C9418400%2C9419446%2C9420239%2C9420312%2C9420453%2C9420481%2C9420716%2C9421665%2C9422287%2C9422596%2C9422618%2C9423510%2C9423662%2C9423793%2C9424299%2C9424644&id=o-AF9srxdLlFm7NyZ9N84cseMbduQ6KsXS9QobYo3n7BsN&mn=sn-4g57kn7s&mm=31&mime=video%2F3gpp&itag=17&pl=24&dur=157.988&lmt=1440001774533389&ip=176.9.235.198&ms=au&mv=u&source=youtube&mt=1447570179', '144p', 'No', 1514737, 'Prominent', '2015-11-15 07:00:59', '0000-00-00 00:00:00', '2015-11-15 07:01:00', '2015-11-15 07:00:55'),
(227, 549, 1, 1, 'da24f38fe0588586b2719334256577b2.mp4', 'mp4', 'Centrifugal pumps 11 Multistage 3)', 4447253, 'https://www.youtube.com/watch?v=_PdeDmN8Uuo', 'https://r20---sn-4g57knke.googlevideo.com/videoplayback?dur=95.457&lmt=1392992646637577&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&key=yt6&mime=video%2Fmp4&fexp=9408502%2C9408710%2C9414764%2C9416126%2C9417683%2C9417701%2C9418750%2C9419354%2C9419445%2C9420453%2C9420569%2C9422596%2C9422618%2C9423510%2C9423662%2C9423790%2C9424082%2C9424419&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&expire=1447601445&id=o-AID9GEP-uo56o8NwAKI6usRIok3ftQ745XZk2OLN7Qh1&mn=sn-4g57knke&mm=31&signature=229C7F2222030CD12DB5050B007A664998E13088.2B59B26A09E649729CBB4CE4D7849C7D4239F191&ip=176.9.235.198&ms=au&mv=u&mt=1447579140&pl=24&source=youtube&upn=2DuqapQMKOk&ipbits=0&requiressl=yes&sver=3&itag=18&ratebypass=yes', '360p', 'No', 4447253, 'Success', '2015-11-15 09:31:28', '0000-00-00 00:00:00', '2015-11-15 09:31:31', '2015-11-15 09:31:25'),
(228, 549, 1, 1, 'b48f85d96b754fb80bc1b04aedade898.mp4', 'mp4', 'Centrifugal pumps 10 Multistage 2)', 4351974, 'https://www.youtube.com/watch?v=oOqth06B0LQ', 'https://r1---sn-4g57knzk.googlevideo.com/videoplayback?ms=au&pl=24&itag=18&mt=1447579846&upn=8jZyJl6JNoA&expire=1447601503&mm=31&mv=u&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mime=video%2Fmp4&mn=sn-4g57knzk&signature=2BF9474CBB5EBE578FD4545F582F8BE58DDE466A.86D8DEA258E185C19A544B13CC4FCDBFF4AC3E5A&source=youtube&fexp=9407538%2C9408209%2C9408710%2C9413208%2C9414764%2C9415869%2C9416126%2C9417683%2C9418204%2C9418400%2C9420453%2C9422564%2C9422596%2C9422618%2C9422753%2C9423510%2C9423662%2C9423789%2C9424019%2C9424364&dur=91.765&key=yt6&lmt=1393792838560583&ipbits=0&sver=3&ratebypass=yes&id=o-AJUN3jbtv9zpsD_0TKkpxhdsXA82Ey8e_vFzCP4Lueqx&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198', '360p', 'No', 4351974, 'Success', '2015-11-15 09:31:55', '0000-00-00 00:00:00', '2015-11-15 09:31:56', '2015-11-15 09:31:51');
INSERT INTO `files` (`id`, `user_id`, `server_id`, `website_id`, `name`, `type`, `label`, `size`, `uri`, `link`, `quality`, `is_3d`, `fetched`, `status`, `locked_at`, `deleted_at`, `modified_at`, `created_at`) VALUES
(229, 549, 1, 1, '1aa59d7cb9d4e4abd7c30b1fa82133ba.mp4', 'mp4', 'Centrifugal pumps 10 Multistage 2)', 4351974, 'https://www.youtube.com/watch?v=oOqth06B0LQ', 'https://r1---sn-4g57knzk.googlevideo.com/videoplayback?ms=au&pl=24&itag=18&mt=1447579846&upn=8jZyJl6JNoA&expire=1447601503&mm=31&mv=u&requiressl=yes&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&mime=video%2Fmp4&mn=sn-4g57knzk&signature=2BF9474CBB5EBE578FD4545F582F8BE58DDE466A.86D8DEA258E185C19A544B13CC4FCDBFF4AC3E5A&source=youtube&fexp=9407538%2C9408209%2C9408710%2C9413208%2C9414764%2C9415869%2C9416126%2C9417683%2C9418204%2C9418400%2C9420453%2C9422564%2C9422596%2C9422618%2C9422753%2C9423510%2C9423662%2C9423789%2C9424019%2C9424364&dur=91.765&key=yt6&lmt=1393792838560583&ipbits=0&sver=3&ratebypass=yes&id=o-AJUN3jbtv9zpsD_0TKkpxhdsXA82Ey8e_vFzCP4Lueqx&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=176.9.235.198', '360p', 'No', 4351974, 'Success', '2015-11-15 09:32:04', '0000-00-00 00:00:00', '2015-11-15 09:32:07', '2015-11-15 09:32:03'),
(230, 433, 1, 1, 'f7d8388f8a56f9fc831eefd435ddec28.mp4', 'mp4', 'HellCat™  2  Intelligent‑Completion Packer', 19423609, 'https://www.youtube.com/watch?v=iLr4QwO6OTs', 'https://r1---sn-4g57knzy.googlevideo.com/videoplayback?pl=24&ipbits=0&ip=176.9.235.198&key=yt6&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&fexp=9408491%2C9408710%2C9414764%2C9416126%2C9416485%2C9417423%2C9417683%2C9418162%2C9418183%2C9418204%2C9420453%2C9420737%2C9421508%2C9422288%2C9422596%2C9422618%2C9423510%2C9423662%2C9423789%2C9423847%2C9424128%2C9424208&itag=22&requiressl=yes&source=youtube&mv=u&mt=1447584371&ms=au&signature=99B6E2A69A887197CFDE5C7D407A7E11DA066907.4520A09C3938D05AB1EEB3291A1DB7FE30784DE6&mm=31&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&id=o-ABfFVzzhiFVYISpQv6ZtufDDRwICWXwrWFtnsWu3Mm6k&sver=3&mn=sn-4g57knzy&upn=LJqrPxbe9Vs&expire=1447606428&lmt=1408928724369583&mime=video%2Fmp4&ratebypass=yes&dur=124.319', '720p', 'No', 19423609, 'Success', '2015-11-15 10:54:02', '0000-00-00 00:00:00', '2015-11-15 10:54:05', '2015-11-15 10:53:56'),
(231, 433, 1, 1, 'c65850d5e8765309bfd5494cea156c46.mp4', 'mp4', 'Openhole Fishing', 36600996, 'https://www.youtube.com/watch?v=7-WqVgksKtk', 'https://r5---sn-4g57knzs.googlevideo.com/videoplayback?mime=video%2Fmp4&pl=24&expire=1447606345&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE&ratebypass=yes&source=youtube&dur=654.942&lmt=1390339900608463&ipbits=0&key=yt6&ip=176.9.235.198&requiressl=yes&signature=DC5C9E5B445DF382637A7756C005641FE8D49EA0.8CE693C0A682A25853B47177FE5B6205E69242E9&fexp=9407478%2C9408710%2C9414764%2C9416126%2C9417683%2C9420452%2C9422596%2C9422618%2C9423662&id=o-AMu_AimthasvI0VkFg0Ils6XLzJp41PClrzNd97gIum_&sver=3&mm=31&mn=sn-4g57knzs&mt=1447584371&mv=u&ms=au&itag=18&upn=bVJ2AOBOPD0&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire', '360p', 'No', 36600996, 'Success', '2015-11-15 10:56:05', '0000-00-00 00:00:00', '2015-11-15 10:56:11', '2015-11-15 10:56:02'),
(232, 433, 1, 1, '454b49d491138c6efffa1630bbca9a47.mp4', 'mp4', 'Fishing operation', 594040, 'http://www.youtube.com/watch?v=XjHSLzMeQao', 'https://r5---sn-4g57knll.googlevideo.com/videoplayback?upn=NQzYfFJwnG8&lmt=1436503351877754&id=o-AAd1MB75CjY3x9NtulALEpNzdzxPDP1OvYdtyo3bM9ob&requiressl=yes&dur=22.035&mm=31&mn=sn-4g57knll&pl=24&ratebypass=yes&ip=176.9.235.198&source=youtube&fexp=9406852%2C9407117%2C9408710%2C9414764%2C9416126%2C9416984%2C9417203%2C9417683%2C9418751%2C9418958%2C9420453%2C9421932%2C9422596%2C9422618%2C9423509%2C9423643%2C9423662%2C9423792%2C9424192%2C9424261%2C9424448&ms=au&mt=1447584371&mv=u&itag=18&sver=3&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&expire=1447606533&mime=video%2Fmp4&signature=2D1DE3AD7367387644F270CD98B44A91A89C7AAC.0A5F85BEF063DEC34C33D8C7D20AC471CDC0BC33&key=yt6&nh=IgpwcjAyLmZyYTE1KgkxMjcuMC4wLjE', '360p', 'No', 594040, 'Success', '2015-11-15 10:56:20', '0000-00-00 00:00:00', '2015-11-15 10:56:21', '2015-11-15 10:56:16'),
(233, 433, 1, 1, '4979bbdaa68d79bdefc6b71140875270.mp4', 'mp4', 'View from inside the fishing tool while fishing for lost drillpipe', 2886900, 'https://www.youtube.com/watch?v=e2gUKi5xK3E', 'https://r18---sn-4g57kndk.googlevideo.com/videoplayback?key=yt6&mime=video%2Fmp4&mn=sn-4g57kndk&mm=31&ip=176.9.235.198&pl=24&itag=18&signature=231A888470E5CCA6DC5CA0DDCB1A0F1B63EDA4A3.49E300E957A0E5C119FF208FF56E0B1BA4599990&id=o-AONc8BtOdCUWOMc-R236u7KRY2VbYxozjMNvBMe_o_ts&upn=4nTs_ZKGtTQ&mv=u&mt=1447584371&ms=au&lmt=1282904782942544&sparams=dur%2Cid%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ipbits=0&requiressl=yes&source=youtube&expire=1447606552&dur=112.175&sver=3&ratebypass=yes&fexp=9405348%2C9408496%2C9408710%2C9414764%2C9416126%2C9417683%2C9419445%2C9420309%2C9420453%2C9421085%2C9422140%2C9422365%2C9422545%2C9422596%2C9422618%2C9423231%2C9423294%2C9423510%2C9423662%2C9423715%2C9423793%2C9424147%2C9424210&nh=IgpwcjA0LmZyYTAzKgkxMjcuMC4wLjE', '360p', 'No', 2886900, 'Success', '2015-11-15 10:56:23', '0000-00-00 00:00:00', '2015-11-15 10:56:27', '2015-11-15 10:56:21');

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
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `user_id`, `purchase_id`, `percentage`, `amount`, `deleted_at`, `modified_at`, `created_at`) VALUES
(2, 2, 3, 30, 15000, '0000-00-00 00:00:00', '2015-11-07 13:31:54', '2015-11-07 13:31:54'),
(3, 4, 4, 30, 30000, '0000-00-00 00:00:00', '2015-11-07 13:47:01', '2015-11-07 13:47:01'),
(4, 1, 7, 30, 300, '0000-00-00 00:00:00', '2015-11-07 14:26:25', '2015-11-07 14:26:25'),
(5, 1, 13, 30, 4500, '0000-00-00 00:00:00', '2015-11-09 12:45:45', '2015-11-09 12:45:45'),
(6, 1, 15, 30, 60000, '0000-00-00 00:00:00', '2015-11-09 15:12:16', '2015-11-09 15:12:16'),
(7, 1, 17, 30, 15000, '0000-00-00 00:00:00', '2015-11-09 21:22:39', '2015-11-09 21:22:39'),
(8, 1, 18, 30, 4500, '0000-00-00 00:00:00', '2015-11-10 04:22:11', '2015-11-10 04:22:11'),
(9, 1, 22, 30, 60000, '0000-00-00 00:00:00', '2015-11-10 18:51:25', '2015-11-10 18:51:25'),
(10, 1, 23, 30, 4500, '0000-00-00 00:00:00', '2015-11-11 06:42:31', '2015-11-11 06:42:31'),
(11, 1, 27, 30, 15000, '0000-00-00 00:00:00', '2015-11-11 19:05:54', '2015-11-11 19:05:54'),
(12, 1, 29, 30, 15000, '0000-00-00 00:00:00', '2015-11-12 05:54:08', '2015-11-12 05:54:08'),
(13, 1, 30, 30, 4500, '0000-00-00 00:00:00', '2015-11-12 09:13:19', '2015-11-12 09:13:19'),
(14, 1, 33, 30, 15000, '0000-00-00 00:00:00', '2015-11-12 23:36:42', '2015-11-12 23:36:42'),
(15, 4, 35, 30, 15000, '0000-00-00 00:00:00', '2015-11-13 08:27:39', '2015-11-13 08:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `uri` varchar(255) NOT NULL,
  `posts` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `onlines`
--
CREATE TABLE `onlines` (
`user_id` int(10) unsigned
);

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
(4, 'تجاری', 37580963840, 500000, 'Enable'),
(5, 'تست', 10485760, 1000, 'Enable'),
(6, 'پایه', 536870912, 15000, 'Enable');

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

-- --------------------------------------------------------

--
-- Stand-in structure for view `payments`
--
CREATE TABLE `payments` (
`date` varchar(10)
,`total` bigint(21)
,`amount` decimal(32,0)
);

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
(2, 1, 1, 50000, 'Payline', '8345019', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-07 12:28:03', '2015-11-07 12:27:08'),
(3, 9, 1, 50000, 'Payline', '8345828', '8781720', 'Success', '0000-00-00 00:00:00', '2015-11-07 13:31:54', '2015-11-07 13:30:10'),
(4, 10, 2, 100000, 'Payline', '8346004', '8781907', 'Success', '0000-00-00 00:00:00', '2015-11-07 13:47:01', '2015-11-07 13:44:53'),
(5, 2, 2, 100000, 'Payline', '8346008', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-07 13:45:19', '2015-11-07 13:45:19'),
(6, 1, 5, 1000, 'Payline', '8346125', '8782034', 'Success', '0000-00-00 00:00:00', '2015-11-07 14:03:06', '2015-11-07 13:53:56'),
(7, 8, 5, 1000, 'Payline', '8346516', '8782434', 'Success', '0000-00-00 00:00:00', '2015-11-07 14:26:25', '2015-11-07 14:25:17'),
(8, 7, 1, 50000, 'Payline', '8362392', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-08 15:40:14', '2015-11-08 15:40:14'),
(9, 2, 1, 50000, 'Payline', '8362664', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-08 16:02:47', '2015-11-08 16:02:47'),
(10, 1, 5, 1000, 'Payline', '8369935', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-09 06:17:59', '2015-11-09 06:17:45'),
(11, 1, 5, 1000, 'Payline', '8369977', '8806368', 'Success', '0000-00-00 00:00:00', '2015-11-09 06:22:07', '2015-11-09 06:21:33'),
(12, 1, 6, 20000, 'Payline', '8372227', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-09 09:06:47', '2015-11-09 09:06:23'),
(13, 59, 6, 15000, 'Payline', '8375050', '8811568', 'Success', '0000-00-00 00:00:00', '2015-11-09 12:45:45', '2015-11-09 12:44:13'),
(14, 109, 4, 500000, 'Payline', '8376922', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-09 15:10:45', '2015-11-09 15:10:45'),
(15, 109, 3, 200000, 'Payline', '8376929', '8813521', 'Success', '0000-00-00 00:00:00', '2015-11-09 15:12:16', '2015-11-09 15:11:21'),
(16, 194, 1, 50000, 'Payline', '8378948', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-09 17:34:34', '2015-11-09 17:34:34'),
(17, 250, 1, 50000, 'Payline', '8381791', '8818512', 'Success', '0000-00-00 00:00:00', '2015-11-09 21:22:39', '2015-11-09 21:22:06'),
(18, 260, 6, 15000, 'Payline', '8383371', '8820111', 'Success', '0000-00-00 00:00:00', '2015-11-10 04:22:11', '2015-11-10 04:21:26'),
(19, 284, 1, 50000, 'Payline', '8384465', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-10 06:48:09', '2015-11-10 06:48:09'),
(20, 1, 5, 1000, 'Payline', '8387905', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-10 11:24:52', '2015-11-10 11:24:41'),
(21, 1, 5, 1000, 'Payline', '8387974', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-10 11:37:56', '2015-11-10 11:29:48'),
(22, 351, 3, 200000, 'Payline', '8393912', '8830895', 'Success', '0000-00-00 00:00:00', '2015-11-10 18:51:25', '2015-11-10 18:50:52'),
(23, 248, 6, 15000, 'Payline', '8398116', '8835183', 'Success', '0000-00-00 00:00:00', '2015-11-11 06:42:31', '2015-11-11 06:38:19'),
(24, 379, 4, 500000, 'Payline', '8399022', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-11 07:53:22', '2015-11-11 07:53:22'),
(25, 2, 5, 1000, 'Payline', '8402106', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-11 12:11:35', '2015-11-11 12:11:35'),
(26, 433, 2, 100000, 'Payline', '8407364', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-11 18:59:51', '2015-11-11 18:59:51'),
(27, 433, 1, 50000, 'Payline', '8407432', '8844732', 'Success', '0000-00-00 00:00:00', '2015-11-11 19:05:54', '2015-11-11 19:03:48'),
(28, 1, 5, 1000, 'Payline', '8407621', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-11 19:16:29', '2015-11-11 19:16:14'),
(29, 480, 1, 50000, 'Payline', '8411226', '8848601', 'Success', '0000-00-00 00:00:00', '2015-11-12 05:54:08', '2015-11-12 05:51:19'),
(30, 484, 6, 15000, 'Payline', '8413841', '8851275', 'Success', '0000-00-00 00:00:00', '2015-11-12 09:13:19', '2015-11-12 09:12:28'),
(31, 1, 5, 1000, 'Payline', '8414150', '8851589', 'Success', '0000-00-00 00:00:00', '2015-11-12 09:33:43', '2015-11-12 09:33:01'),
(32, 504, 6, 15000, 'Payline', '8417988', '', 'Waiting', '0000-00-00 00:00:00', '2015-11-12 14:51:09', '2015-11-12 14:51:09'),
(33, 514, 1, 50000, 'Payline', '8423803', '8861495', 'Success', '0000-00-00 00:00:00', '2015-11-12 23:36:42', '2015-11-12 23:35:04'),
(34, 1, 5, 1000, 'Payline', '8425087', '', 'Cancelled', '0000-00-00 00:00:00', '2015-11-13 06:25:17', '2015-11-13 06:24:41'),
(35, 521, 1, 50000, 'Payline', '8426244', '8863993', 'Success', '0000-00-00 00:00:00', '2015-11-13 08:27:39', '2015-11-13 08:27:13');

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
(1, 'http://de1bs.shariftube.ir/', '176.9.235.198', 49192, 'de1bs', 'JBrQsi3KawTHh/OGfV5328/rj5fAgYbfWfe0AXRm43BHli8FZ8Ni9dVvnuEsRUMTUBL1xaoQ0JUoVcuk3AYZmw==', 42949672960, 840636297, 42109036663, 'Yes', '0000-00-00 00:00:00', '2015-11-15 10:56:21', '2015-11-05 21:00:00'),
(2, 'http://ir1ms.shariftube.ir/', '185.49.87.85', 49192, 'ir1ms', 'I0caVWgGdi6odvctGBEdgIOyKbrER+vIgoCPm7XvtcywUHvZcRo+6W+RT4zOM79dzAPvAvbG7hX1eFcfEApueQ==', 139586437120, 4130829818, 135455607302, 'Yes', '0000-00-00 00:00:00', '2015-11-15 05:43:35', '2015-11-05 21:00:00'),
(3, 'http://ir1bs.shariftube.ir/', '185.49.87.85', 49192, 'ir1bs', 'LoXAkthknCc4AziNiGbpBJzsb91Qkadqhiqnu23OYZuGNigSr69EoJ3uUVS7o7KZ2y+i6m8GSVWkGsjFKr6htw==', 32212254720, 0, 32212254720, 'Yes', '0000-00-00 00:00:00', '2015-11-15 05:43:36', '2015-11-05 21:00:00');

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
(40, 4, '91.99.0.189', '2015-11-07 13:02:17'),
(41, 9, '213.233.186.96', '2015-11-07 13:28:27'),
(42, 10, '91.99.0.189', '2015-11-07 13:44:24'),
(43, 1, '2.146.201.136', '2015-11-07 14:03:06'),
(44, 7, '91.99.0.189', '2015-11-07 14:03:53'),
(45, 11, '89.38.244.167', '2015-11-07 14:09:02'),
(46, 7, '91.99.0.189', '2015-11-07 14:17:27'),
(47, 8, '2.146.201.136', '2015-11-07 14:25:10'),
(48, 7, '91.99.0.189', '2015-11-07 14:25:39'),
(49, 8, '2.146.201.136', '2015-11-07 14:26:25'),
(50, 1, '2.146.201.136', '2015-11-07 14:29:56'),
(51, 7, '91.99.0.189', '2015-11-07 14:32:15'),
(52, 7, '91.99.0.189', '2015-11-07 14:42:18'),
(53, 12, '5.72.223.95', '2015-11-07 17:34:03'),
(54, 2, '89.38.244.167', '2015-11-07 17:39:47'),
(55, 1, '151.242.68.146', '2015-11-07 18:55:52'),
(56, 13, '178.62.165.196', '2015-11-07 18:56:47'),
(57, 13, '178.62.165.196', '2015-11-07 19:00:02'),
(58, 13, '151.242.68.146', '2015-11-07 20:43:23'),
(59, 14, '128.65.168.45', '2015-11-07 22:04:03'),
(60, 14, '128.65.168.45', '2015-11-07 22:04:54'),
(61, 2, '213.217.61.202', '2015-11-08 06:58:07'),
(62, 2, '213.217.61.202', '2015-11-08 08:21:58'),
(63, 1, '2.146.201.136', '2015-11-08 11:43:17'),
(64, 2, '213.217.61.202', '2015-11-08 12:40:22'),
(65, 15, '46.143.214.22', '2015-11-08 14:55:54'),
(66, 16, '5.116.56.132', '2015-11-08 14:56:11'),
(67, 17, '5.238.253.182', '2015-11-08 15:09:39'),
(68, 18, '91.107.166.91', '2015-11-08 15:30:29'),
(69, 7, '213.217.61.202', '2015-11-08 15:38:55'),
(70, 19, '5.115.216.157', '2015-11-08 16:17:53'),
(71, 20, '151.242.128.12', '2015-11-08 16:22:40'),
(72, 21, '130.126.241.171', '2015-11-08 16:35:44'),
(73, 22, '93.118.148.237', '2015-11-08 16:42:23'),
(74, 23, '46.164.115.40', '2015-11-08 16:50:54'),
(75, 23, '46.164.115.40', '2015-11-08 16:52:40'),
(76, 24, '194.225.33.236', '2015-11-08 17:10:31'),
(77, 1, '151.242.120.30', '2015-11-08 17:20:51'),
(78, 2, '213.217.61.202', '2015-11-08 17:45:40'),
(79, 25, '46.224.171.134', '2015-11-08 17:49:36'),
(80, 1, '151.242.120.30', '2015-11-08 18:13:45'),
(81, 1, '151.242.120.30', '2015-11-08 18:20:03'),
(82, 26, '85.185.159.104', '2015-11-08 18:56:06'),
(83, 27, '81.28.51.95', '2015-11-08 19:00:51'),
(84, 28, '188.211.8.157', '2015-11-08 19:04:44'),
(85, 29, '151.238.184.153', '2015-11-08 19:05:36'),
(86, 30, '188.212.95.36', '2015-11-08 19:21:56'),
(87, 31, '95.38.198.246', '2015-11-08 19:23:20'),
(88, 32, '2.191.102.188', '2015-11-08 19:28:50'),
(89, 33, '2.177.247.248', '2015-11-08 19:57:13'),
(90, 34, '151.239.105.136', '2015-11-08 20:10:08'),
(91, 35, '81.31.173.181', '2015-11-09 04:56:10'),
(92, 1, '188.211.107.34', '2015-11-09 05:08:04'),
(93, 36, '46.38.158.198', '2015-11-09 05:38:47'),
(94, 37, '2.183.2.4', '2015-11-09 05:51:05'),
(95, 38, '213.233.186.207', '2015-11-09 06:02:28'),
(96, 39, '80.75.5.68', '2015-11-09 06:03:17'),
(97, 40, '84.241.6.174', '2015-11-09 06:08:43'),
(98, 41, '194.225.55.130', '2015-11-09 06:16:38'),
(99, 1, '188.211.107.34', '2015-11-09 06:22:07'),
(100, 42, '46.101.182.94', '2015-11-09 06:38:20'),
(101, 7, '213.217.61.202', '2015-11-09 06:54:15'),
(102, 7, '213.217.61.202', '2015-11-09 06:59:16'),
(103, 7, '188.211.107.34', '2015-11-09 08:19:50'),
(105, 44, '188.211.107.34', '2015-11-09 08:33:35'),
(106, 1, '188.211.107.34', '2015-11-09 08:38:06'),
(107, 44, '188.211.107.34', '2015-11-09 08:41:34'),
(108, 1, '188.211.107.34', '2015-11-09 08:43:39'),
(109, 7, '2.147.42.15', '2015-11-09 08:50:35'),
(110, 45, '85.115.54.201', '2015-11-09 08:54:32'),
(111, 46, '216.185.58.122', '2015-11-09 09:55:40'),
(112, 47, '194.225.232.17', '2015-11-09 10:04:05'),
(113, 48, '5.114.250.41', '2015-11-09 10:05:30'),
(114, 49, '95.38.223.168', '2015-11-09 10:17:37'),
(115, 50, '89.165.36.8', '2015-11-09 10:19:12'),
(116, 51, '194.225.5.35', '2015-11-09 10:28:50'),
(117, 52, '81.31.173.5', '2015-11-09 11:10:57'),
(118, 53, '151.245.51.51', '2015-11-09 11:22:49'),
(119, 54, '5.239.111.173', '2015-11-09 11:53:15'),
(120, 55, '82.198.222.77', '2015-11-09 12:07:16'),
(121, 56, '95.81.85.220', '2015-11-09 12:08:27'),
(122, 57, '188.211.90.94', '2015-11-09 12:10:26'),
(123, 58, '2.190.125.15', '2015-11-09 12:15:17'),
(124, 59, '2.190.145.97', '2015-11-09 12:20:17'),
(125, 60, '194.225.33.90', '2015-11-09 12:22:39'),
(126, 61, '84.241.0.119', '2015-11-09 12:28:45'),
(127, 62, '91.98.118.193', '2015-11-09 12:32:32'),
(128, 63, '46.38.130.225', '2015-11-09 12:33:49'),
(129, 63, '46.38.130.225', '2015-11-09 12:36:06'),
(130, 64, '46.38.130.225', '2015-11-09 12:37:43'),
(131, 65, '176.101.36.239', '2015-11-09 12:38:31'),
(132, 66, '188.166.40.236', '2015-11-09 12:45:03'),
(133, 59, '2.190.145.97', '2015-11-09 12:45:45'),
(134, 67, '50.118.198.70', '2015-11-09 12:47:26'),
(135, 68, '213.233.185.161', '2015-11-09 12:49:40'),
(136, 69, '213.233.185.46', '2015-11-09 12:49:57'),
(137, 70, '45.79.205.129', '2015-11-09 12:50:31'),
(138, 71, '2.181.229.254', '2015-11-09 12:52:27'),
(139, 72, '128.179.165.99', '2015-11-09 12:53:11'),
(140, 73, '151.243.254.28', '2015-11-09 12:54:09'),
(141, 73, '151.243.254.28', '2015-11-09 12:55:26'),
(142, 74, '213.233.189.64', '2015-11-09 12:59:11'),
(143, 75, '91.98.215.202', '2015-11-09 13:03:06'),
(144, 76, '81.31.172.223', '2015-11-09 13:15:49'),
(145, 77, '46.209.15.18', '2015-11-09 13:16:03'),
(146, 78, '194.225.24.75', '2015-11-09 13:16:34'),
(147, 79, '178.62.136.173', '2015-11-09 13:17:33'),
(148, 42, '213.217.61.202', '2015-11-09 13:19:25'),
(149, 80, '46.164.127.199', '2015-11-09 13:25:16'),
(150, 81, '65.49.68.185', '2015-11-09 13:27:48'),
(151, 82, '2.182.218.58', '2015-11-09 13:28:10'),
(152, 83, '213.233.189.160', '2015-11-09 13:28:47'),
(153, 84, '2.190.67.49', '2015-11-09 13:31:10'),
(154, 84, '2.190.67.49', '2015-11-09 13:33:14'),
(155, 84, '2.190.67.49', '2015-11-09 13:33:56'),
(156, 85, '94.183.112.122', '2015-11-09 13:34:14'),
(157, 86, '81.31.174.122', '2015-11-09 13:34:17'),
(158, 87, '213.233.190.145', '2015-11-09 13:37:28'),
(159, 88, '91.106.66.130', '2015-11-09 13:39:16'),
(160, 89, '213.233.188.210', '2015-11-09 13:42:19'),
(161, 87, '213.233.190.145', '2015-11-09 13:45:54'),
(162, 90, '46.100.58.136', '2015-11-09 13:46:21'),
(163, 91, '93.110.9.69', '2015-11-09 13:50:21'),
(164, 91, '93.110.9.69', '2015-11-09 13:50:56'),
(165, 92, '82.99.206.98', '2015-11-09 13:57:40'),
(166, 93, '130.236.182.88', '2015-11-09 14:03:17'),
(167, 94, '46.41.211.236', '2015-11-09 14:06:01'),
(168, 95, '94.184.141.135', '2015-11-09 14:06:47'),
(169, 96, '213.207.250.32', '2015-11-09 14:07:26'),
(170, 97, '5.114.255.116', '2015-11-09 14:09:33'),
(171, 98, '81.31.175.174', '2015-11-09 14:10:12'),
(172, 97, '5.114.255.116', '2015-11-09 14:11:49'),
(173, 20, '81.31.176.119', '2015-11-09 14:12:35'),
(174, 99, '2.190.54.122', '2015-11-09 14:15:14'),
(175, 100, '2.190.205.30', '2015-11-09 14:23:17'),
(176, 101, '94.176.92.159', '2015-11-09 14:26:41'),
(177, 102, '2.178.66.53', '2015-11-09 14:31:01'),
(178, 103, '213.233.188.251', '2015-11-09 14:34:31'),
(179, 104, '81.31.177.187', '2015-11-09 14:34:47'),
(180, 105, '2.177.28.63', '2015-11-09 14:36:22'),
(181, 106, '213.233.190.62', '2015-11-09 14:36:25'),
(182, 107, '213.233.184.34', '2015-11-09 14:44:20'),
(183, 108, '151.240.54.13', '2015-11-09 14:45:47'),
(184, 109, '2.146.88.172', '2015-11-09 14:48:18'),
(185, 110, '188.118.92.207', '2015-11-09 14:49:01'),
(186, 111, '93.118.115.76', '2015-11-09 14:49:18'),
(187, 112, '213.233.188.14', '2015-11-09 14:50:12'),
(188, 113, '188.118.89.87', '2015-11-09 14:52:10'),
(189, 114, '194.225.232.20', '2015-11-09 14:56:55'),
(190, 115, '213.233.184.90', '2015-11-09 15:00:51'),
(191, 116, '213.207.234.161', '2015-11-09 15:03:39'),
(192, 116, '213.207.234.161', '2015-11-09 15:04:01'),
(193, 117, '89.43.103.188', '2015-11-09 15:05:29'),
(194, 118, '151.243.150.184', '2015-11-09 15:08:09'),
(195, 119, '2.190.46.209', '2015-11-09 15:08:27'),
(196, 120, '147.83.123.135', '2015-11-09 15:09:43'),
(197, 109, '2.146.88.172', '2015-11-09 15:12:16'),
(198, 121, '91.98.12.192', '2015-11-09 15:15:25'),
(199, 122, '5.212.215.167', '2015-11-09 15:16:55'),
(200, 123, '213.233.191.135', '2015-11-09 15:17:26'),
(201, 124, '213.233.191.52', '2015-11-09 15:17:35'),
(202, 125, '213.233.188.85', '2015-11-09 15:22:02'),
(203, 126, '81.31.172.124', '2015-11-09 15:25:24'),
(204, 127, '92.16.8.105', '2015-11-09 15:26:12'),
(205, 128, '2.177.129.215', '2015-11-09 15:26:30'),
(206, 129, '2.182.68.69', '2015-11-09 15:27:56'),
(207, 130, '5.232.84.171', '2015-11-09 15:28:48'),
(208, 131, '91.99.121.214', '2015-11-09 15:30:25'),
(209, 132, '176.101.36.203', '2015-11-09 15:30:44'),
(210, 133, '91.99.198.145', '2015-11-09 15:31:05'),
(211, 134, '213.233.184.156', '2015-11-09 15:34:19'),
(212, 135, '188.245.208.113', '2015-11-09 15:37:13'),
(213, 136, '213.147.134.178', '2015-11-09 15:38:07'),
(214, 137, '95.82.15.136', '2015-11-09 15:38:52'),
(215, 138, '31.59.187.5', '2015-11-09 15:39:00'),
(216, 139, '46.101.55.248', '2015-11-09 15:40:19'),
(217, 140, '46.225.171.250', '2015-11-09 15:41:07'),
(218, 141, '93.119.49.234', '2015-11-09 15:42:20'),
(219, 142, '109.236.86.45', '2015-11-09 15:45:38'),
(220, 143, '78.47.149.123', '2015-11-09 15:47:27'),
(221, 144, '130.203.109.148', '2015-11-09 15:47:58'),
(222, 145, '188.245.126.46', '2015-11-09 15:48:04'),
(223, 146, '37.63.191.203', '2015-11-09 15:48:27'),
(224, 137, '95.82.15.136', '2015-11-09 15:48:55'),
(225, 147, '81.31.176.155', '2015-11-09 15:52:08'),
(226, 148, '5.22.14.10', '2015-11-09 15:53:29'),
(227, 149, '151.242.38.92', '2015-11-09 15:55:28'),
(228, 150, '81.31.175.66', '2015-11-09 15:55:34'),
(229, 151, '81.31.172.147', '2015-11-09 15:56:06'),
(230, 152, '5.52.250.110', '2015-11-09 15:56:56'),
(231, 150, '81.31.175.66', '2015-11-09 15:58:46'),
(232, 153, '213.233.186.222', '2015-11-09 16:03:57'),
(233, 154, '213.233.188.163', '2015-11-09 16:08:01'),
(234, 155, '5.113.251.32', '2015-11-09 16:11:30'),
(235, 156, '89.219.230.210', '2015-11-09 16:11:40'),
(236, 157, '109.162.157.171', '2015-11-09 16:12:04'),
(237, 158, '151.243.54.249', '2015-11-09 16:12:48'),
(238, 158, '151.243.54.249', '2015-11-09 16:13:27'),
(239, 159, '2.180.110.194', '2015-11-09 16:15:15'),
(240, 160, '5.221.26.175', '2015-11-09 16:15:50'),
(241, 159, '2.180.110.194', '2015-11-09 16:16:54'),
(242, 160, '5.221.26.175', '2015-11-09 16:17:17'),
(243, 161, '209.95.51.169', '2015-11-09 16:20:33'),
(244, 162, '5.239.198.169', '2015-11-09 16:22:33'),
(245, 163, '213.233.188.165', '2015-11-09 16:23:20'),
(246, 164, '2.176.106.5', '2015-11-09 16:24:15'),
(247, 165, '91.98.246.69', '2015-11-09 16:28:19'),
(248, 166, '5.160.228.199', '2015-11-09 16:31:48'),
(249, 167, '213.233.190.21', '2015-11-09 16:31:54'),
(250, 168, '188.253.11.201', '2015-11-09 16:32:04'),
(251, 169, '91.106.95.124', '2015-11-09 16:32:08'),
(252, 170, '5.52.63.142', '2015-11-09 16:32:10'),
(253, 171, '77.81.42.15', '2015-11-09 16:32:30'),
(254, 172, '89.41.238.249', '2015-11-09 16:34:53'),
(255, 167, '81.31.172.73', '2015-11-09 16:35:47'),
(256, 173, '5.250.38.68', '2015-11-09 16:36:33'),
(257, 174, '128.199.53.63', '2015-11-09 16:37:00'),
(258, 175, '2.177.164.192', '2015-11-09 16:40:14'),
(259, 176, '89.219.86.53', '2015-11-09 16:45:03'),
(260, 177, '81.31.177.238', '2015-11-09 16:45:09'),
(261, 178, '81.31.178.100', '2015-11-09 16:46:02'),
(262, 179, '213.233.186.120', '2015-11-09 16:46:50'),
(263, 180, '213.233.188.223', '2015-11-09 16:49:12'),
(264, 181, '2.146.142.110', '2015-11-09 16:56:53'),
(265, 182, '86.55.158.126', '2015-11-09 17:01:34'),
(266, 183, '86.55.97.148', '2015-11-09 17:09:33'),
(267, 184, '194.225.33.225', '2015-11-09 17:10:28'),
(268, 175, '2.177.164.192', '2015-11-09 17:10:55'),
(269, 185, '2.177.164.192', '2015-11-09 17:13:45'),
(270, 186, '151.243.210.200', '2015-11-09 17:17:29'),
(271, 187, '5.238.104.108', '2015-11-09 17:17:49'),
(272, 188, '188.34.0.141', '2015-11-09 17:20:51'),
(273, 189, '94.176.37.90', '2015-11-09 17:22:41'),
(274, 190, '176.101.36.200', '2015-11-09 17:24:25'),
(275, 191, '46.41.251.40', '2015-11-09 17:24:51'),
(276, 192, '2.176.201.7', '2015-11-09 17:25:04'),
(277, 193, '178.62.89.121', '2015-11-09 17:27:19'),
(278, 194, '213.233.185.232', '2015-11-09 17:31:13'),
(279, 195, '91.106.66.130', '2015-11-09 17:34:03'),
(280, 196, '5.114.6.167', '2015-11-09 17:37:50'),
(281, 197, '178.62.137.173', '2015-11-09 17:41:00'),
(282, 102, '2.178.66.53', '2015-11-09 17:41:23'),
(283, 198, '2.180.68.111', '2015-11-09 17:43:48'),
(284, 199, '82.99.214.205', '2015-11-09 17:44:05'),
(285, 200, '93.110.49.34', '2015-11-09 17:46:33'),
(286, 201, '188.166.40.236', '2015-11-09 17:49:47'),
(287, 202, '91.185.130.199', '2015-11-09 17:50:33'),
(288, 203, '81.31.179.200', '2015-11-09 17:50:47'),
(289, 204, '151.241.24.205', '2015-11-09 17:51:30'),
(290, 205, '151.246.231.188', '2015-11-09 17:59:00'),
(291, 206, '176.46.136.67', '2015-11-09 18:03:32'),
(292, 207, '188.211.67.179', '2015-11-09 18:05:03'),
(293, 208, '5.237.254.15', '2015-11-09 18:18:47'),
(294, 209, '213.233.189.106', '2015-11-09 18:20:19'),
(295, 210, '5.202.221.148', '2015-11-09 18:23:11'),
(296, 211, '79.127.16.24', '2015-11-09 18:27:14'),
(297, 212, '213.233.188.38', '2015-11-09 18:30:57'),
(298, 213, '5.220.149.42', '2015-11-09 18:31:53'),
(299, 214, '195.187.72.155', '2015-11-09 18:34:37'),
(300, 215, '2.176.123.142', '2015-11-09 18:35:59'),
(301, 216, '31.57.13.204', '2015-11-09 18:36:43'),
(302, 217, '83.123.88.186', '2015-11-09 18:37:20'),
(303, 218, '129.110.242.99', '2015-11-09 18:38:01'),
(304, 219, '109.162.205.244', '2015-11-09 18:41:16'),
(305, 220, '146.185.24.134', '2015-11-09 18:50:27'),
(306, 221, '83.123.193.210', '2015-11-09 18:51:59'),
(307, 222, '5.122.184.252', '2015-11-09 19:01:34'),
(308, 223, '2.184.141.90', '2015-11-09 19:03:31'),
(309, 224, '213.233.186.98', '2015-11-09 19:07:23'),
(310, 225, '213.233.186.192', '2015-11-09 19:09:15'),
(311, 226, '151.240.34.59', '2015-11-09 19:18:28'),
(312, 227, '178.131.194.58', '2015-11-09 19:23:53'),
(313, 228, '2.177.74.116', '2015-11-09 19:25:22'),
(314, 229, '2.178.246.145', '2015-11-09 19:35:06'),
(315, 230, '188.245.10.66', '2015-11-09 19:39:49'),
(316, 231, '2.179.89.93', '2015-11-09 19:46:51'),
(317, 232, '107.182.230.48', '2015-11-09 19:50:51'),
(318, 233, '89.198.177.235', '2015-11-09 19:51:06'),
(319, 234, '5.202.227.134', '2015-11-09 19:55:15'),
(320, 235, '2.146.106.148', '2015-11-09 19:56:19'),
(321, 236, '95.82.41.216', '2015-11-09 19:58:15'),
(322, 237, '109.162.247.242', '2015-11-09 20:08:27'),
(323, 238, '213.233.191.67', '2015-11-09 20:09:48'),
(324, 239, '93.114.28.111', '2015-11-09 20:13:19'),
(325, 240, '188.245.210.26', '2015-11-09 20:13:33'),
(326, 241, '5.116.104.235', '2015-11-09 20:14:33'),
(327, 241, '5.116.104.235', '2015-11-09 20:15:23'),
(328, 242, '81.31.174.152', '2015-11-09 20:18:10'),
(329, 243, '94.176.26.144', '2015-11-09 20:32:39'),
(330, 244, '5.22.13.181', '2015-11-09 20:35:16'),
(331, 245, '2.176.71.104', '2015-11-09 20:36:49'),
(332, 246, '151.240.247.39', '2015-11-09 20:37:15'),
(333, 247, '151.240.135.83', '2015-11-09 20:49:27'),
(334, 248, '5.237.74.152', '2015-11-09 21:07:29'),
(335, 249, '81.31.174.219', '2015-11-09 21:07:37'),
(336, 250, '213.233.189.109', '2015-11-09 21:11:18'),
(337, 250, '213.233.189.109', '2015-11-09 21:22:39'),
(338, 251, '86.57.30.115', '2015-11-09 21:34:29'),
(339, 252, '81.31.176.207', '2015-11-09 21:38:56'),
(340, 253, '81.31.176.137', '2015-11-09 21:40:48'),
(341, 254, '194.225.172.12', '2015-11-09 21:42:16'),
(342, 255, '188.245.242.228', '2015-11-09 22:17:18'),
(343, 256, '178.131.44.186', '2015-11-09 23:16:44'),
(344, 256, '178.131.44.186', '2015-11-09 23:16:55'),
(345, 257, '81.31.175.69', '2015-11-10 02:33:26'),
(346, 258, '68.48.197.164', '2015-11-10 03:24:21'),
(347, 259, '46.32.30.98', '2015-11-10 03:38:43'),
(348, 260, '188.159.54.71', '2015-11-10 03:51:08'),
(349, 261, '80.191.170.11', '2015-11-10 04:16:50'),
(350, 262, '64.228.81.76', '2015-11-10 04:17:44'),
(351, 260, '188.159.54.71', '2015-11-10 04:22:11'),
(352, 263, '81.31.172.12', '2015-11-10 04:30:02'),
(353, 264, '188.245.78.226', '2015-11-10 04:40:49'),
(354, 265, '2.177.118.232', '2015-11-10 04:45:03'),
(355, 266, '94.182.192.164', '2015-11-10 04:45:35'),
(356, 267, '86.105.137.80', '2015-11-10 04:53:29'),
(357, 268, '46.32.30.98', '2015-11-10 05:01:14'),
(358, 269, '81.91.144.51', '2015-11-10 05:17:16'),
(359, 270, '109.225.184.142', '2015-11-10 05:22:30'),
(360, 271, '213.233.190.49', '2015-11-10 05:28:26'),
(361, 272, '81.31.173.120', '2015-11-10 05:31:06'),
(362, 273, '188.211.123.51', '2015-11-10 05:37:29'),
(363, 273, '188.211.123.51', '2015-11-10 05:39:33'),
(364, 274, '91.99.59.171', '2015-11-10 05:43:38'),
(365, 275, '148.251.142.203', '2015-11-10 05:46:15'),
(366, 276, '217.66.206.163', '2015-11-10 05:46:32'),
(367, 277, '81.31.173.166', '2015-11-10 05:48:06'),
(368, 278, '213.233.187.46', '2015-11-10 05:53:34'),
(369, 279, '213.233.187.38', '2015-11-10 05:56:11'),
(370, 279, '213.233.187.38', '2015-11-10 05:56:49'),
(371, 280, '81.31.176.140', '2015-11-10 06:03:53'),
(372, 281, '151.243.191.144', '2015-11-10 06:16:16'),
(373, 282, '5.106.255.244', '2015-11-10 06:17:58'),
(374, 283, '5.202.219.190', '2015-11-10 06:20:28'),
(375, 284, '213.233.186.168', '2015-11-10 06:42:59'),
(376, 284, '213.233.186.168', '2015-11-10 06:46:54'),
(377, 285, '213.233.188.104', '2015-11-10 06:47:47'),
(378, 284, '213.233.186.168', '2015-11-10 06:51:01'),
(379, 286, '188.159.11.235', '2015-11-10 07:11:28'),
(380, 286, '188.159.11.235', '2015-11-10 07:11:45'),
(381, 287, '94.184.242.18', '2015-11-10 07:15:35'),
(382, 288, '213.233.186.110', '2015-11-10 07:17:45'),
(383, 289, '2.178.118.179', '2015-11-10 07:20:47'),
(384, 290, '80.253.156.2', '2015-11-10 07:22:33'),
(385, 291, '31.59.59.142', '2015-11-10 07:23:52'),
(386, 292, '151.240.192.193', '2015-11-10 07:25:48'),
(387, 293, '2.146.104.193', '2015-11-10 07:26:33'),
(388, 294, '46.224.195.112', '2015-11-10 07:30:41'),
(389, 295, '31.57.202.252', '2015-11-10 07:33:17'),
(390, 296, '80.191.200.170', '2015-11-10 07:36:13'),
(391, 297, '213.233.173.56', '2015-11-10 07:42:10'),
(392, 298, '5.120.250.28', '2015-11-10 07:44:37'),
(393, 299, '68.181.206.160', '2015-11-10 07:52:22'),
(394, 300, '5.200.98.88', '2015-11-10 07:52:55'),
(395, 279, '213.233.184.132', '2015-11-10 08:05:12'),
(396, 2, '91.99.0.124', '2015-11-10 08:05:29'),
(397, 301, '194.225.170.12', '2015-11-10 08:07:10'),
(398, 301, '194.225.170.12', '2015-11-10 08:07:27'),
(399, 302, '81.31.176.81', '2015-11-10 08:11:07'),
(400, 303, '89.41.12.186', '2015-11-10 08:12:59'),
(401, 304, '188.209.67.38', '2015-11-10 08:15:16'),
(402, 302, '81.31.176.81', '2015-11-10 08:17:33'),
(403, 305, '79.127.35.131', '2015-11-10 08:19:32'),
(404, 306, '81.31.172.78', '2015-11-10 08:23:24'),
(405, 307, '78.38.193.19', '2015-11-10 08:32:14'),
(406, 308, '213.233.173.135', '2015-11-10 08:42:33'),
(407, 309, '213.233.191.121', '2015-11-10 08:58:30'),
(408, 310, '194.225.48.139', '2015-11-10 09:01:33'),
(409, 311, '81.31.161.121', '2015-11-10 09:05:29'),
(410, 312, '81.31.176.145', '2015-11-10 09:11:39'),
(411, 313, '151.238.32.252', '2015-11-10 09:30:24'),
(412, 314, '46.32.30.98', '2015-11-10 09:37:22'),
(413, 306, '213.233.188.191', '2015-11-10 09:38:02'),
(414, 315, '81.31.179.132', '2015-11-10 10:12:55'),
(415, 316, '178.131.51.233', '2015-11-10 10:43:22'),
(416, 317, '212.86.78.162', '2015-11-10 11:27:14'),
(417, 318, '188.210.148.114', '2015-11-10 11:30:28'),
(418, 319, '213.233.184.181', '2015-11-10 11:33:49'),
(419, 320, '128.199.41.247', '2015-11-10 12:16:37'),
(420, 321, '104.236.195.72', '2015-11-10 12:20:13'),
(421, 322, '213.233.163.252', '2015-11-10 12:20:43'),
(422, 323, '213.233.190.14', '2015-11-10 12:22:47'),
(423, 324, '194.225.232.35', '2015-11-10 12:23:02'),
(424, 325, '213.233.191.246', '2015-11-10 12:25:00'),
(425, 326, '194.225.33.186', '2015-11-10 12:32:17'),
(426, 327, '2.177.88.30', '2015-11-10 12:43:15'),
(427, 71, '2.181.229.254', '2015-11-10 13:03:40'),
(428, 328, '213.233.166.60', '2015-11-10 13:14:32'),
(429, 329, '151.232.186.221', '2015-11-10 13:29:20'),
(430, 258, '91.98.1.37', '2015-11-10 13:48:07'),
(431, 330, '213.233.184.122', '2015-11-10 13:48:17'),
(432, 331, '213.233.186.163', '2015-11-10 13:51:12'),
(433, 258, '91.98.1.37', '2015-11-10 13:51:13'),
(434, 2, '91.99.0.124', '2015-11-10 13:54:58'),
(435, 332, '151.246.146.26', '2015-11-10 13:55:14'),
(436, 1, '91.99.0.124', '2015-11-10 13:55:36'),
(437, 258, '91.98.1.37', '2015-11-10 13:56:09'),
(438, 333, '151.241.97.66', '2015-11-10 13:59:11'),
(439, 334, '151.241.97.66', '2015-11-10 14:01:11'),
(440, 335, '188.211.101.159', '2015-11-10 14:39:59'),
(441, 321, '178.62.6.233', '2015-11-10 14:40:39'),
(442, 336, '5.115.68.167', '2015-11-10 14:54:44'),
(443, 337, '91.98.245.173', '2015-11-10 15:09:28'),
(444, 338, '5.200.116.110', '2015-11-10 15:17:28'),
(445, 339, '5.219.173.54', '2015-11-10 15:32:43'),
(446, 339, '5.219.173.54', '2015-11-10 15:34:07'),
(447, 340, '212.175.32.136', '2015-11-10 16:03:23'),
(448, 341, '213.233.189.101', '2015-11-10 16:32:48'),
(449, 342, '46.209.21.9', '2015-11-10 16:33:12'),
(450, 1, '151.242.120.30', '2015-11-10 16:38:58'),
(451, 343, '86.105.135.242', '2015-11-10 16:40:07'),
(452, 343, '86.105.135.242', '2015-11-10 16:44:40'),
(453, 344, '188.34.90.144', '2015-11-10 17:28:25'),
(454, 345, '5.212.253.210', '2015-11-10 17:29:39'),
(455, 346, '188.34.90.144', '2015-11-10 17:31:25'),
(456, 346, '188.34.90.144', '2015-11-10 17:44:56'),
(457, 346, '188.34.90.144', '2015-11-10 17:49:05'),
(458, 347, '188.34.90.144', '2015-11-10 17:49:45'),
(459, 347, '188.34.90.144', '2015-11-10 17:54:17'),
(460, 344, '188.34.90.144', '2015-11-10 17:54:57'),
(461, 2, '95.38.201.85', '2015-11-10 18:03:43'),
(462, 7, '95.38.201.85', '2015-11-10 18:04:29'),
(463, 2, '95.38.201.85', '2015-11-10 18:06:05'),
(464, 348, '91.98.196.106', '2015-11-10 18:06:44'),
(465, 349, '107.182.230.55', '2015-11-10 18:09:23'),
(466, 350, '213.233.185.52', '2015-11-10 18:43:59'),
(467, 351, '188.245.155.78', '2015-11-10 18:45:27'),
(468, 352, '81.31.175.219', '2015-11-10 18:48:20'),
(469, 353, '89.196.28.200', '2015-11-10 18:49:11'),
(470, 346, '188.34.34.188', '2015-11-10 19:10:12'),
(471, 354, '46.225.53.250', '2015-11-10 19:20:08'),
(472, 355, '37.129.142.223', '2015-11-10 19:39:20'),
(473, 109, '2.146.96.114', '2015-11-10 19:46:42'),
(474, 2, '95.38.196.177', '2015-11-10 20:08:04'),
(475, 356, '5.121.84.159', '2015-11-10 20:17:45'),
(476, 357, '65.49.68.181', '2015-11-10 20:32:45'),
(477, 258, '91.98.1.37', '2015-11-10 20:45:30'),
(478, 2, '95.38.196.177', '2015-11-10 21:15:25'),
(479, 358, '213.233.185.204', '2015-11-10 21:59:43'),
(480, 359, '91.99.183.58', '2015-11-10 22:50:02'),
(481, 360, '46.225.44.232', '2015-11-11 04:57:25'),
(482, 40, '84.241.6.174', '2015-11-11 05:15:28'),
(483, 7, '91.99.0.124', '2015-11-11 05:59:01'),
(484, 248, '5.237.94.104', '2015-11-11 06:08:25'),
(485, 7, '91.99.0.124', '2015-11-11 06:10:20'),
(486, 7, '91.99.0.124', '2015-11-11 06:12:59'),
(487, 2, '91.99.0.124', '2015-11-11 06:13:16'),
(488, 248, '5.237.94.104', '2015-11-11 06:44:49'),
(489, 361, '81.91.144.130', '2015-11-11 07:07:01'),
(490, 362, '118.189.209.131', '2015-11-11 07:09:05'),
(491, 363, '5.223.200.203', '2015-11-11 07:10:36'),
(492, 364, '213.233.185.180', '2015-11-11 07:10:43'),
(493, 365, '188.34.34.188', '2015-11-11 07:12:33'),
(494, 77, '46.209.15.18', '2015-11-11 07:13:23'),
(495, 366, '94.183.125.53', '2015-11-11 07:14:01'),
(496, 367, '213.233.185.240', '2015-11-11 07:16:50'),
(497, 367, '213.233.185.240', '2015-11-11 07:17:40'),
(498, 368, '78.38.76.201', '2015-11-11 07:18:25'),
(499, 369, '5.116.236.55', '2015-11-11 07:20:52'),
(500, 370, '5.202.178.90', '2015-11-11 07:30:44'),
(501, 371, '77.81.157.68', '2015-11-11 07:31:38'),
(502, 372, '31.59.92.183', '2015-11-11 07:38:45'),
(503, 373, '69.31.51.244', '2015-11-11 07:39:41'),
(504, 374, '91.99.9.19', '2015-11-11 07:40:30'),
(505, 375, '31.59.28.208', '2015-11-11 07:41:01'),
(506, 375, '31.59.28.208', '2015-11-11 07:41:29'),
(507, 376, '2.176.49.11', '2015-11-11 07:42:17'),
(508, 377, '46.38.130.225', '2015-11-11 07:44:57'),
(509, 35, '213.233.186.188', '2015-11-11 07:45:46'),
(510, 378, '84.241.33.150', '2015-11-11 07:48:43'),
(511, 379, '213.233.191.206', '2015-11-11 07:50:36'),
(512, 380, '81.31.174.255', '2015-11-11 07:54:50'),
(513, 381, '91.98.170.237', '2015-11-11 07:57:48'),
(514, 382, '213.233.189.108', '2015-11-11 07:59:12'),
(515, 85, '81.29.247.158', '2015-11-11 08:01:34'),
(516, 383, '84.241.8.199', '2015-11-11 08:02:56'),
(517, 384, '178.62.64.106', '2015-11-11 08:04:44'),
(518, 385, '77.104.114.47', '2015-11-11 08:11:03'),
(519, 386, '91.98.190.34', '2015-11-11 08:17:52'),
(520, 387, '151.241.152.111', '2015-11-11 08:18:28'),
(521, 388, '37.63.144.160', '2015-11-11 08:22:17'),
(522, 389, '80.253.130.200', '2015-11-11 08:29:19'),
(523, 390, '5.233.76.235', '2015-11-11 08:30:22'),
(524, 391, '5.78.9.74', '2015-11-11 08:31:04'),
(525, 61, '84.241.0.119', '2015-11-11 08:38:35'),
(526, 392, '188.166.87.191', '2015-11-11 08:42:23'),
(527, 393, '46.32.23.81', '2015-11-11 08:44:06'),
(528, 394, '188.158.22.29', '2015-11-11 08:52:17'),
(529, 395, '188.158.29.169', '2015-11-11 08:53:06'),
(530, 142, '151.80.124.21', '2015-11-11 08:56:29'),
(531, 396, '91.133.241.181', '2015-11-11 08:56:29'),
(532, 397, '81.31.173.57', '2015-11-11 09:02:12'),
(533, 398, '194.225.232.22', '2015-11-11 09:03:37'),
(534, 399, '5.160.239.223', '2015-11-11 09:04:17'),
(535, 400, '46.143.248.52', '2015-11-11 09:05:10'),
(536, 171, '92.50.13.55', '2015-11-11 09:12:03'),
(537, 401, '213.233.184.129', '2015-11-11 09:13:03'),
(538, 402, '188.253.66.52', '2015-11-11 09:30:52'),
(539, 403, '81.31.179.160', '2015-11-11 09:33:54'),
(540, 404, '80.75.196.222', '2015-11-11 09:41:20'),
(541, 405, '213.233.190.237', '2015-11-11 09:42:09'),
(542, 92, '82.99.206.98', '2015-11-11 09:47:47'),
(543, 317, '212.86.78.162', '2015-11-11 09:57:43'),
(544, 406, '46.225.108.242', '2015-11-11 10:14:48'),
(545, 407, '217.66.208.2', '2015-11-11 10:17:07'),
(546, 408, '2.145.23.223', '2015-11-11 10:17:54'),
(547, 378, '84.241.33.150', '2015-11-11 10:30:14'),
(548, 409, '81.91.152.27', '2015-11-11 10:31:11'),
(549, 410, '81.31.175.166', '2015-11-11 10:33:48'),
(550, 411, '81.31.173.42', '2015-11-11 10:36:34'),
(551, 412, '86.105.132.122', '2015-11-11 10:58:57'),
(552, 4, '91.99.0.124', '2015-11-11 11:00:34'),
(553, 4, '91.99.0.124', '2015-11-11 11:00:56'),
(554, 4, '91.99.0.124', '2015-11-11 11:01:20'),
(555, 4, '91.99.0.124', '2015-11-11 11:01:55'),
(556, 241, '80.253.133.162', '2015-11-11 11:08:15'),
(557, 141, '106.185.47.126', '2015-11-11 11:10:49'),
(558, 413, '85.9.92.67', '2015-11-11 11:10:53'),
(559, 414, '5.134.159.107', '2015-11-11 11:20:19'),
(560, 51, '151.241.125.179', '2015-11-11 11:20:30'),
(561, 415, '91.98.114.180', '2015-11-11 11:24:03'),
(562, 416, '217.218.26.34', '2015-11-11 11:24:23'),
(563, 417, '151.241.125.234', '2015-11-11 11:24:49'),
(564, 417, '151.241.125.234', '2015-11-11 11:26:11'),
(565, 418, '2.176.16.58', '2015-11-11 11:35:43'),
(566, 419, '109.162.239.59', '2015-11-11 11:39:01'),
(567, 420, '93.118.99.198', '2015-11-11 11:50:30'),
(568, 421, '202.170.51.249', '2015-11-11 11:52:29'),
(569, 422, '151.243.98.173', '2015-11-11 11:53:13'),
(570, 1, '93.118.99.198', '2015-11-11 11:56:21'),
(571, 423, '213.233.186.61', '2015-11-11 12:07:48'),
(572, 424, '93.118.99.198', '2015-11-11 12:11:07'),
(573, 1, '93.118.99.198', '2015-11-11 12:12:49'),
(574, 424, '65.49.14.75', '2015-11-11 12:13:59'),
(575, 425, '213.233.189.193', '2015-11-11 12:24:13'),
(576, 426, '109.108.167.1', '2015-11-11 12:29:13'),
(577, 427, '194.225.170.182', '2015-11-11 12:30:18'),
(578, 428, '82.99.199.58', '2015-11-11 12:36:05'),
(579, 429, '83.123.157.234', '2015-11-11 12:37:28'),
(580, 430, '37.63.143.216', '2015-11-11 12:39:42'),
(581, 119, '2.185.158.220', '2015-11-11 12:45:40'),
(582, 431, '91.99.13.99', '2015-11-11 12:52:58'),
(583, 374, '91.99.9.19', '2015-11-11 13:04:51'),
(584, 432, '188.245.53.253', '2015-11-11 13:08:56'),
(585, 131, '91.99.121.214', '2015-11-11 13:09:02'),
(586, 433, '5.160.95.245', '2015-11-11 13:26:51'),
(587, 434, '2.50.34.107', '2015-11-11 13:31:08'),
(588, 435, '81.31.174.165', '2015-11-11 13:40:08'),
(589, 436, '5.62.187.23', '2015-11-11 13:46:18'),
(590, 437, '213.233.189.20', '2015-11-11 13:52:39'),
(591, 438, '188.75.83.202', '2015-11-11 14:07:15'),
(592, 439, '5.122.182.34', '2015-11-11 14:11:31'),
(593, 159, '2.180.114.89', '2015-11-11 14:19:03'),
(594, 330, '94.176.91.220', '2015-11-11 14:23:38'),
(595, 440, '37.98.62.218', '2015-11-11 14:25:18'),
(596, 441, '217.218.171.11', '2015-11-11 14:26:49'),
(597, 442, '176.56.148.18', '2015-11-11 14:30:21'),
(598, 443, '151.243.83.141', '2015-11-11 14:30:42'),
(599, 444, '213.233.184.136', '2015-11-11 14:33:15'),
(600, 445, '188.158.194.141', '2015-11-11 14:45:15'),
(601, 446, '2.176.88.97', '2015-11-11 14:45:32'),
(602, 447, '2.191.20.92', '2015-11-11 14:48:05'),
(603, 396, '91.133.241.181', '2015-11-11 14:50:52'),
(604, 396, '91.133.241.181', '2015-11-11 14:53:45'),
(605, 448, '128.199.41.16', '2015-11-11 14:57:39'),
(606, 201, '128.199.53.63', '2015-11-11 15:04:53'),
(607, 177, '94.24.8.6', '2015-11-11 15:22:45'),
(608, 449, '165.91.12.240', '2015-11-11 15:39:02'),
(609, 450, '94.176.56.163', '2015-11-11 16:01:24'),
(610, 451, '2.176.175.89', '2015-11-11 16:05:59'),
(611, 346, '194.225.232.40', '2015-11-11 16:19:10'),
(612, 452, '37.128.248.233', '2015-11-11 16:43:51'),
(613, 453, '128.199.99.114', '2015-11-11 16:45:50'),
(614, 454, '151.241.135.24', '2015-11-11 16:47:26'),
(615, 455, '5.238.165.5', '2015-11-11 16:48:15'),
(616, 456, '134.255.207.193', '2015-11-11 16:53:35'),
(617, 346, '194.225.232.40', '2015-11-11 17:02:10'),
(618, 457, '5.78.166.74', '2015-11-11 17:03:05'),
(619, 458, '37.137.176.199', '2015-11-11 17:18:29'),
(620, 459, '188.209.139.21', '2015-11-11 17:20:19'),
(621, 460, '5.235.99.241', '2015-11-11 17:31:28'),
(622, 461, '81.31.179.166', '2015-11-11 17:44:57'),
(623, 59, '2.190.159.173', '2015-11-11 18:00:19'),
(624, 462, '188.210.182.88', '2015-11-11 18:20:57'),
(625, 53, '185.23.129.130', '2015-11-11 18:30:16'),
(626, 433, '5.72.132.105', '2015-11-11 18:54:00'),
(627, 463, '188.158.54.181', '2015-11-11 18:54:28'),
(628, 347, '188.34.71.125', '2015-11-11 19:03:55'),
(629, 433, '5.72.132.105', '2015-11-11 19:12:27'),
(630, 347, '188.34.71.125', '2015-11-11 19:16:38'),
(631, 346, '188.34.71.125', '2015-11-11 19:16:48'),
(632, 346, '188.34.71.125', '2015-11-11 19:25:12'),
(633, 464, '94.184.192.85', '2015-11-11 19:28:03'),
(634, 346, '188.34.71.125', '2015-11-11 19:32:25'),
(635, 465, '109.162.202.41', '2015-11-11 19:35:34'),
(636, 466, '91.133.194.204', '2015-11-11 19:55:52'),
(637, 467, '91.98.4.113', '2015-11-11 20:02:37'),
(638, 468, '129.63.96.90', '2015-11-11 20:04:30'),
(639, 469, '151.238.213.87', '2015-11-11 20:18:19'),
(640, 470, '84.241.14.219', '2015-11-11 20:31:09'),
(641, 471, '45.56.68.151', '2015-11-11 20:31:28'),
(642, 472, '81.31.172.52', '2015-11-11 20:40:05'),
(643, 473, '5.239.70.82', '2015-11-11 21:40:02'),
(644, 474, '109.110.184.100', '2015-11-11 22:02:28'),
(645, 475, '5.239.181.183', '2015-11-11 23:07:04'),
(646, 476, '213.233.186.14', '2015-11-12 01:21:42'),
(647, 477, '175.140.90.1', '2015-11-12 01:36:15'),
(648, 208, '5.237.253.108', '2015-11-12 03:10:09'),
(649, 478, '104.205.176.9', '2015-11-12 04:55:55'),
(650, 479, '5.212.126.30', '2015-11-12 05:45:37'),
(651, 480, '188.166.109.45', '2015-11-12 05:48:15'),
(652, 481, '5.78.30.147', '2015-11-12 05:57:56'),
(653, 482, '84.241.11.11', '2015-11-12 06:07:25'),
(654, 483, '188.158.214.37', '2015-11-12 06:07:36'),
(655, 483, '188.158.214.37', '2015-11-12 06:08:05'),
(656, 222, '5.121.204.193', '2015-11-12 06:45:43'),
(657, 484, '84.241.12.221', '2015-11-12 06:45:45'),
(658, 397, '213.233.184.67', '2015-11-12 07:01:49'),
(659, 375, '31.59.157.234', '2015-11-12 07:22:10'),
(660, 485, '77.81.156.52', '2015-11-12 07:25:49'),
(661, 486, '31.59.151.1', '2015-11-12 07:28:46'),
(662, 487, '91.251.246.87', '2015-11-12 08:07:37'),
(663, 289, '188.211.41.215', '2015-11-12 08:08:48'),
(664, 488, '91.185.146.103', '2015-11-12 08:23:42'),
(665, 275, '5.250.119.81', '2015-11-12 08:39:50'),
(666, 489, '5.220.129.196', '2015-11-12 09:00:14'),
(667, 484, '84.241.12.221', '2015-11-12 09:04:31'),
(668, 490, '109.125.130.139', '2015-11-12 09:26:09'),
(669, 490, '109.125.130.139', '2015-11-12 09:28:27'),
(670, 260, '89.41.225.34', '2015-11-12 09:29:23'),
(671, 484, '84.241.12.221', '2015-11-12 09:31:40'),
(672, 1, '151.242.78.163', '2015-11-12 09:32:48'),
(673, 491, '86.55.232.136', '2015-11-12 10:02:03'),
(674, 492, '95.82.26.146', '2015-11-12 10:05:21'),
(675, 493, '46.101.72.210', '2015-11-12 10:38:08'),
(676, 494, '5.116.42.34', '2015-11-12 10:49:01'),
(677, 495, '213.233.184.164', '2015-11-12 11:54:24'),
(678, 496, '5.62.177.221', '2015-11-12 12:00:08'),
(679, 497, '37.129.47.239', '2015-11-12 12:09:28'),
(680, 498, '89.219.251.205', '2015-11-12 12:36:05'),
(681, 499, '98.210.180.241', '2015-11-12 13:05:52'),
(682, 500, '2.178.136.63', '2015-11-12 13:09:26'),
(683, 501, '151.240.132.124', '2015-11-12 13:15:45'),
(684, 502, '217.157.200.105', '2015-11-12 13:46:12'),
(685, 503, '91.99.7.173', '2015-11-12 14:01:48'),
(686, 118, '151.243.106.109', '2015-11-12 14:26:47'),
(687, 504, '193.151.136.157', '2015-11-12 14:43:38'),
(688, 505, '37.238.160.52', '2015-11-12 15:54:36'),
(689, 506, '151.241.127.10', '2015-11-12 17:30:22'),
(690, 507, '2.191.32.187', '2015-11-12 17:31:44'),
(691, 508, '45.55.161.172', '2015-11-12 19:00:18'),
(692, 111, '188.210.178.13', '2015-11-12 19:13:19'),
(693, 509, '2.146.77.174', '2015-11-12 19:25:52'),
(694, 250, '213.233.190.34', '2015-11-12 20:11:09'),
(695, 510, '151.246.196.33', '2015-11-12 20:12:39'),
(696, 511, '213.233.190.84', '2015-11-12 20:23:36'),
(697, 512, '5.135.20.35', '2015-11-12 20:37:41'),
(698, 294, '46.224.135.44', '2015-11-12 20:45:50'),
(699, 513, '188.34.143.162', '2015-11-12 21:47:44'),
(700, 172, '94.176.39.55', '2015-11-12 22:13:52'),
(701, 514, '151.243.54.195', '2015-11-12 22:42:25'),
(702, 515, '74.15.149.202', '2015-11-13 03:18:32'),
(703, 118, '151.243.106.109', '2015-11-13 05:50:38'),
(704, 516, '5.72.188.102', '2015-11-13 06:33:25'),
(705, 517, '5.219.101.139', '2015-11-13 06:51:32'),
(706, 517, '5.219.101.139', '2015-11-13 06:52:42'),
(707, 518, '5.208.81.164', '2015-11-13 07:14:27'),
(708, 519, '109.110.186.206', '2015-11-13 07:40:07'),
(709, 520, '188.34.200.12', '2015-11-13 07:44:31'),
(710, 520, '188.34.200.12', '2015-11-13 07:48:30'),
(711, 521, '188.210.86.101', '2015-11-13 08:26:44'),
(712, 522, '213.233.190.65', '2015-11-13 08:35:41'),
(713, 523, '213.233.187.73', '2015-11-13 08:35:44'),
(714, 524, '188.214.181.181', '2015-11-13 08:41:06'),
(715, 525, '5.238.131.165', '2015-11-13 09:17:18'),
(716, 526, '188.208.163.101', '2015-11-13 09:20:03'),
(717, 527, '5.201.209.69', '2015-11-13 09:50:24'),
(718, 528, '188.166.109.45', '2015-11-13 10:13:17'),
(719, 529, '5.52.215.130', '2015-11-13 11:20:36'),
(720, 530, '188.158.163.129', '2015-11-13 11:32:36'),
(721, 286, '213.233.190.185', '2015-11-13 12:24:44'),
(722, 2, '95.38.221.96', '2015-11-13 12:33:44'),
(723, 531, '151.240.158.77', '2015-11-13 15:09:26'),
(724, 532, '65.49.68.174', '2015-11-13 15:15:24'),
(725, 533, '2.182.65.85', '2015-11-13 15:23:42'),
(726, 534, '188.166.40.236', '2015-11-13 15:33:34'),
(727, 150, '213.233.184.17', '2015-11-13 15:34:45'),
(728, 535, '5.78.158.226', '2015-11-13 18:17:24'),
(729, 536, '109.122.233.18', '2015-11-13 18:35:14'),
(730, 537, '5.220.49.131', '2015-11-13 19:10:58'),
(731, 538, '95.82.0.145', '2015-11-13 19:16:39'),
(732, 539, '213.233.187.79', '2015-11-13 19:42:12'),
(733, 540, '151.241.174.240', '2015-11-13 19:51:48'),
(734, 540, '151.241.174.240', '2015-11-13 19:52:21'),
(735, 541, '5.221.183.65', '2015-11-14 03:18:33'),
(736, 4, '91.99.234.38', '2015-11-14 06:06:51'),
(737, 542, '194.225.33.94', '2015-11-14 06:34:55'),
(738, 543, '5.211.202.35', '2015-11-14 06:53:37'),
(739, 544, '2.190.57.97', '2015-11-14 09:36:41'),
(740, 545, '81.31.175.174', '2015-11-14 09:59:48'),
(741, 546, '31.7.79.241', '2015-11-14 10:02:53'),
(742, 547, '46.225.138.31', '2015-11-14 10:19:28'),
(743, 548, '5.115.88.109', '2015-11-14 11:45:23'),
(744, 376, '81.31.177.139', '2015-11-14 11:49:41'),
(745, 549, '5.160.95.245', '2015-11-14 11:57:10'),
(746, 550, '151.242.44.178', '2015-11-14 13:55:40'),
(747, 551, '81.31.175.166', '2015-11-14 14:53:03'),
(748, 552, '31.58.49.147', '2015-11-14 14:54:04'),
(749, 553, '128.199.83.245', '2015-11-14 15:08:11'),
(750, 554, '151.247.3.162', '2015-11-14 15:47:08'),
(751, 555, '81.31.177.15', '2015-11-14 15:55:44'),
(752, 556, '2.180.128.74', '2015-11-14 16:14:56'),
(753, 557, '2.177.57.62', '2015-11-14 17:22:41'),
(754, 558, '5.238.211.122', '2015-11-14 17:30:40'),
(755, 558, '5.238.211.122', '2015-11-14 17:35:22'),
(756, 559, '213.233.170.34', '2015-11-14 17:40:35'),
(757, 560, '2.176.14.102', '2015-11-14 17:43:18'),
(758, 561, '93.110.41.162', '2015-11-14 18:00:05'),
(759, 562, '5.239.46.98', '2015-11-14 19:31:44'),
(760, 563, '46.143.29.44', '2015-11-14 20:39:37'),
(761, 564, '213.233.187.102', '2015-11-14 21:29:40'),
(762, 514, '151.243.52.241', '2015-11-14 22:00:46'),
(763, 565, '37.137.227.77', '2015-11-14 22:45:24'),
(764, 566, '81.31.177.6', '2015-11-15 06:11:29'),
(765, 567, '2.176.24.206', '2015-11-15 06:39:18'),
(766, 568, '2.190.149.98', '2015-11-15 06:47:30'),
(767, 569, '213.233.191.125', '2015-11-15 06:58:04'),
(768, 569, '213.233.191.125', '2015-11-15 07:03:05'),
(769, 570, '213.233.191.125', '2015-11-15 07:08:45'),
(770, 415, '91.98.114.180', '2015-11-15 07:52:18'),
(771, 571, '5.160.100.18', '2015-11-15 09:55:09'),
(772, 69, '213.233.191.87', '2015-11-15 09:55:37'),
(773, 572, '92.242.193.4', '2015-11-15 10:29:20'),
(774, 433, '5.160.95.245', '2015-11-15 10:51:57'),
(775, 573, '213.233.187.151', '2015-11-15 10:59:29');

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
(2, 7, 'ویدیو ها با سایز ۰', 'Closed', '2015-11-09 08:39:43', '2015-11-07 10:44:51'),
(3, 9, 'پخش آنلاین', 'Closed', '2015-11-09 08:40:53', '2015-11-07 18:43:11'),
(4, 7, 'تست تیکت من', 'Closed', '2015-11-09 08:39:10', '2015-11-09 08:23:37'),
(5, 44, 'تست دریافت ایمیل', 'Closed', '2015-11-09 08:38:29', '2015-11-09 08:37:16'),
(6, 480, 'خراب بودن لینک دانلود ', 'Closed', '2015-11-12 08:08:04', '2015-11-12 05:59:16');

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
(5, 2, 4, 'سیکتیر کاربر گرامی ', '2015-11-07 12:31:09', '2015-11-07 12:31:09'),
(6, 3, 9, 'سلا م\r\nسیستم پخش آتلاین ویدئوها آماده نشده هنوز؟', '2015-11-07 18:43:11', '2015-11-07 18:43:11'),
(7, 3, 2, 'با سلام\r\nمتاسفانه هنوز چنین سیستمی در این سرویس پیش بینی نشده.\r\nدر صورتی که تیم پشتیبانی تصمیم به ارایه چنین سرویسی اتخاذ کند، به اطلاع کاربران گرامی خواهد رسید.\r\nبا سپاس از پیگیری شما', '2015-11-07 19:08:23', '2015-11-07 19:08:23'),
(8, 4, 7, 'این یک تست است', '2015-11-09 08:23:37', '2015-11-09 08:23:37'),
(9, 5, 44, 'این تست دریافت ایمیل است', '2015-11-09 08:37:16', '2015-11-09 08:37:16'),
(10, 5, 1, 'اوکی تست می شود', '2015-11-09 08:38:29', '2015-11-09 08:38:29'),
(11, 4, 1, 'بسته میشود', '2015-11-09 08:39:10', '2015-11-09 08:39:10'),
(12, 2, 1, 'این مورد فعلا قابل رفع نیست', '2015-11-09 08:39:43', '2015-11-09 08:39:43'),
(13, 3, 1, 'این امکان نیز به ویدئو ها اضافه شد.\nاکنون می توانید قبل از دانلود پیش نمایش ویدئو را ببینید و بعد از دانلود نیز به طور کامل ویدئو را در سایت تماشا کنید.\nبا تشکر از نظر شما', '2015-11-09 08:40:53', '2015-11-09 08:40:53'),
(14, 6, 480, 'سلام \r\nلینک دانلود مربوط به آدرس https://www.youtube.com/watch?v=xEhMkV1tAzY خراب میباشد ', '2015-11-12 05:59:16', '2015-11-12 05:59:16'),
(15, 6, 2, 'با سلام دوست عزیز\r\nمشکل درحال بررسی است. پس از رفع کامل مشکل، شما را باخبر خواهیم ساخت.\r\nسپاس از همکاری تان', '2015-11-12 07:19:55', '2015-11-12 07:19:55'),
(16, 6, 2, 'دوست عزیز\r\nمشکل برطرف شد.\r\nدر صورت بروز هرگونه مشکلی از طریق بخش پشتیبانی با ما در تماس باشید.', '2015-11-12 08:08:04', '2015-11-12 08:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `unsubscribes`
--

CREATE TABLE `unsubscribes` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unsubscribes`
--

INSERT INTO `unsubscribes` (`id`, `email`, `created_at`) VALUES
(1, 'zarezade@ce.sharif.edu', '2015-11-11 06:50:00'),
(2, 'm.feilizadeh@gmail.com', '2015-11-11 06:59:46'),
(3, 'ali.zarezade@yahoo.com', '2015-11-11 07:00:08'),
(4, 'hussein_movassagh@yahoo.com', '2015-11-11 07:11:25'),
(5, 'parsa.yoosefi@gmail.com', '2015-11-11 07:13:18'),
(6, 'a.poorfakhraei@ymail.com', '2015-11-11 07:23:33'),
(7, 'sahand.mozaffari@gmail.com', '2015-11-11 07:30:53'),
(8, 'aliamini64@yahoo.com', '2015-11-11 07:39:21'),
(9, 'jafarzadeh991@yahoo.com', '2015-11-11 07:41:38'),
(10, 'fsth1988@yahoo.com', '2015-11-11 07:41:57'),
(11, 'mabedinyna@yahoo.com', '2015-11-11 07:45:32'),
(12, 'hosabarni@gmail.com', '2015-11-11 07:58:00'),
(13, 'sahar.niknam@gmail.com', '2015-11-11 08:12:54'),
(14, 'mohsen.moghri@yahoo.com', '2015-11-11 08:16:29'),
(15, 'aminj_666@yahoo.com', '2015-11-11 08:24:58'),
(16, 'arashgmn@yahoo.com', '2015-11-11 08:32:21'),
(17, 'miresmaeely@gmail.com', '2015-11-11 08:41:02'),
(18, 'bozorgi90@yahoo.com', '2015-11-11 08:53:46'),
(19, 'sepideh_juyandeh@yahoo.com', '2015-11-11 08:54:29'),
(20, 's.tanhadokht@gmail.com', '2015-11-11 08:56:54'),
(21, 'amir.minoofar@yahoo.com', '2015-11-11 09:01:42'),
(22, 'jahani.peyman@gmail.com', '2015-11-11 09:01:50'),
(23, 'e.imani.72@gmail.com', '2015-11-11 09:18:58'),
(24, 'hossein.shirazu@yahoo.com', '2015-11-11 09:23:06'),
(25, 'hrkhorshidi@yahoo.com', '2015-11-11 09:54:08'),
(26, 'ghandehari@gmail.com', '2015-11-11 10:07:35'),
(27, 'mn.saremi@yahoo.com', '2015-11-11 10:12:39'),
(28, 'kabirhossein@yahoo.com', '2015-11-11 10:12:50'),
(29, 'kabir_hussein@mehr.sharif.ir', '2015-11-11 10:13:41'),
(30, 'noah@chmail.ir', '2015-11-11 10:22:30'),
(31, 'amin_hallaj@ae.sharif.edu', '2015-11-11 10:29:15'),
(32, 'm_ramezani1371@yahoo.com', '2015-11-11 10:39:39'),
(33, 'zagrosnikmaram@gmail.com', '2015-11-11 11:56:27'),
(34, 'razgordani_m@yahoo.com', '2015-11-11 13:08:04'),
(35, 'sh.mohtashamian@gmail.com', '2015-11-11 13:14:03'),
(36, 'meisam_shahami@yahoo.com', '2015-11-11 13:22:59'),
(37, 'jmousavi@ymail.com', '2015-11-11 13:23:01'),
(38, 'atabandeh1296@gmail.com', '2015-11-11 13:57:15'),
(39, 'ss.mirghasemi@yahoo.com', '2015-11-11 14:05:10'),
(40, 'shaabani@ce.sharif.edu', '2015-11-11 14:15:01'),
(41, 'hkazari@yahoo.com', '2015-11-11 14:35:27'),
(42, 'alisoveyti@yahoo.com', '2015-11-11 14:52:21'),
(43, 'mirbagheri@gsme.sharif.edu', '2015-11-11 15:21:11'),
(44, 's_a_mirbagheri@yahoo.com', '2015-11-11 15:21:56'),
(45, 'arkhalig@yahoo.com', '2015-11-11 15:26:19'),
(46, 'monazzah72@yahoo.com', '2015-11-11 15:45:52'),
(47, 'nebrahimpour@chmail.ir', '2015-11-11 15:56:13'),
(48, 'mry_e89@yahoo.com', '2015-11-11 18:28:19'),
(49, 'ashk_empire@yahoo.com', '2015-11-11 19:01:08'),
(50, 'masoume.panahi@gmail.com', '2015-11-12 02:01:26'),
(51, 'aminhomaei98@gmail.com', '2015-11-12 17:29:58'),
(52, 'aboozar.shirazi@yahoo.com', '2015-11-12 21:25:29'),
(53, 'jafary1360@yahoo.com', '2015-11-13 05:25:05'),
(54, 'shirik.shirik@gmail.com', '2015-11-13 06:56:39'),
(55, 'jb.1390@yahoo.com', '2015-11-13 19:53:54'),
(56, 'shahin.asadi@rocketmail.com', '2015-11-14 06:44:59');

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
  `status` enum('Active','Suspicious','Suspended') NOT NULL DEFAULT 'Active',
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

INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `status`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(1, 'm.reza.maghool@gmail.com', '$2a$08$YO8SKtfkAH48EPgah00MB.66DMzUcFYANuKf4epG1CD877tU1zvz6', 'Admin', 'دانشجویان شریف', 'Active', 'Sharifi', NULL, 5410652160, 631129757, 4779522403, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-05 21:00:00'),
(2, 'farskid@gmail.com', '$2a$08$4bbl0TOaRg1jMCYOakdJHercz6t76jyzsaFPUhdbjSVX3avXX189m', 'Admin', 'فرزاد یوسف زاده', 'Active', 'fyz', NULL, 5389680640, 1506329370, 3883351270, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-05 21:00:00'),
(4, 'ehsanfathian@gmail.com', '$2a$08$2PquSySEPgvT6Nea0WvtqOolReNHq5BXQ31lW6QdKZESBFQq6Udqm', 'Admin', 'ehsan fathian', 'Active', 'goldpen', NULL, 5389680640, 864706166, 4524974474, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-05 19:59:33'),
(5, 'mahdi.ganjie@gmail.com', '$2a$08$DwRLl8FkaNHjjuzx53rNFu/MXTZv2cqTH3wXviVWdR3UnokJ8evmq', 'User', 'مهدی گنجی', 'Active', 'edmin13', 2, 5389680640, 0, 5389680640, '0000-00-00 00:00:00', '2015-11-05 21:26:09', '0000-00-00 00:00:00'),
(6, 'shahin.razazi7@gmail.com', '', 'User', 'شاهین رزازی', 'Active', 'shawn', 2, 5389680640, 0, 5389680640, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'farzad_yz@live.com', '$2a$08$ceeIi5NCzUDSR97duokmwOQRGDsKQdDRCmWN6tRvdzB8FaRJp6dy6', 'User', 'فرزاد ۲', 'Active', NULL, 2, 20971520, 20733144, 238376, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-05 21:42:58'),
(8, 'malekimalihe66@gmail.com', '$2a$08$YO8SKtfkAH48EPgah00MB.66DMzUcFYANuKf4epG1CD877tU1zvz6', 'User', 'ملیحه ملکی', 'Active', 'nika93', 1, 5389680640, 0, 5389680640, '0000-00-00 00:00:00', '2015-11-07 14:26:25', '2015-11-06 00:11:29'),
(9, 'hossein128@outlook.com', '$2a$08$U318Lnt5CYU2vVo24zvR8eSYtRrrOr1RCRU6PmKQDDM87PfA7JX86', 'User', 'حسین حسینی', 'Active', 'smh', 2, 2168455168, 16947459, 2151507709, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-07 13:28:27'),
(10, 'soheyl.m66@gmail.com', '$2a$08$EP2eNsf7wOO5i4e6S3C25Ott9rLVi.WVVO5Hg8mKoN9CmIKn14RWy', 'User', 'soheyl', 'Active', NULL, 4, 5389680640, 0, 5389680640, '0000-00-00 00:00:00', '2015-11-07 13:44:24', '2015-11-07 13:44:24'),
(11, 'M2p_co@yahoo.com', '$2a$08$OGSrxVaJKIjMIcYDB1II0.V/Q7eK46YaNMlO9DHhsws3Cios80pFK', 'User', 'Mehdi', 'Active', NULL, 4, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-07 14:09:02', '2015-11-07 14:09:02'),
(12, 'fr4ncesc7@yahoo.com', '$2a$08$ElR8fU4PbPTvJxYHvtRAV.Gr8qUpvtDYcWB1yeVzhTsr4xFaDCq92', 'User', 'Pouria', 'Active', NULL, 4, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-07 17:34:03', '2015-11-07 17:34:03'),
(13, 'Malihe.artist@gmail.com', '$2a$08$wrmQuYQaZBaCafsEQrZceuhWJ1PmsUcjtWyrwQT7p95vkyHzryyES', 'User', 'Malihe', 'Active', NULL, 8, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-07 18:56:47', '2015-11-07 18:56:47'),
(14, 'hanigroup1@gmail.com', '$2a$08$8Q8Fdjpv2XdN5ph4eWEyqeXoJWHQY9ThnvN9sEBrD7ngHntahn2o.', 'User', 'هانی نادعلی زاده', 'Active', NULL, 4, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-07 22:04:03', '2015-11-07 22:04:03'),
(15, 'a_shadman@ie.sharif.edu', '$2a$08$lEWGvH3H7jEp6dGnWCiX3OuTVpWaBOWIIA2VWOtUvdEBPXu6Cjo7K', 'User', 'Shadman', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 14:55:54', '2015-11-08 14:55:54'),
(16, 'bmafshary@yahoo.com', '$2a$08$QPWylyRKYXVOx8alEO0lZeEBi9Dv4vPQT5snj9dv1U5Qq0IEBWKCC', 'User', 'behzad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 14:56:11', '2015-11-08 14:56:11'),
(17, 'saeid_shadkar@yahoo.com', '$2a$08$jkmSQv9gJOcnTBq3ofvaIu5mwyNANDs9IXduQoVIG1XP.GZq./Cfa', 'User', 'saeidshad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 15:09:39', '2015-11-08 15:09:39'),
(18, 'hesam.ahmadian@gmail.com', '$2a$08$pXaYbZCYpQE59GRz3YHWf.3gE5Swv.bIyWSVw2yUgQYI2pEgafITa', 'User', 'samandon', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 15:30:29', '2015-11-08 15:30:29'),
(19, 'mojtaba_jamshidloo@yahoo.com', '$2a$08$6MHrQrNLpKfy137LoYiZVu4NbNipBnh6Zv7xHnX.pvCDeMPveCeXu', 'User', 'mojtaba', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 16:17:53', '2015-11-08 16:17:53'),
(20, 'zarezade@ce.sharif.edu', '$2a$08$H7jO8oL6ASlkk0ZNt7cMdOlziLx618qj/DlAMPPKTE2Ki5as/KBRa', 'User', 'Ali Zarezade', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 16:22:40', '2015-11-08 16:22:40'),
(21, 'atabandeh1296@gmail.com', '$2a$08$ASpFeu0gR7b9RLsdVDfbQuL14w7o9wirtHECC2sJKIBSzxF/w7r0m', 'User', 'armin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 16:35:44', '2015-11-08 16:35:44'),
(22, 'i380016@trbvm.com', '$2a$08$ULRHVsZdKyv2jOzObtIU1eqqA8ry1SWbSKnjtO2PuPv7vrCxbUzrW', 'User', 'i380016', 'Active', NULL, 5, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 16:42:23', '2015-11-08 16:42:23'),
(23, 'MirEsmaeely@gmail.com', '$2a$08$PpI8Q0wZn22OS7hpmebUbeuNtIez/CLhKgRWFVc7iV0nFYB4FC2ne', 'User', 'سید مهدی میراسماعیلی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 16:50:54', '2015-11-08 16:50:54'),
(24, 'v.akrami@aut.ac.ir', '$2a$08$dctx90TTek6zP80fJOkiJ.8A5XrHtRjTqW8cUlMtTfgKi1N.BWs/K', 'User', 'وحید اکرمی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 17:10:31', '2015-11-08 17:10:31'),
(25, 'future7mechanic@gmail.com', '$2a$08$xZ7hhsk7lzYV8f6Ji1tShu3cC2l8q1pyf6a6.HcIrg98UY1y73yDG', 'User', 'عباد یوسف زاده', 'Active', NULL, 2, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 17:49:36', '2015-11-08 17:49:36'),
(26, 'najmeh_neshaat@yahoo.com', '$2a$08$uINsjULr8eC6q0Frl7POj.47ZktpbFMkgmPILaO5nAN79woPCtDn2', 'User', 'نجمه نشاط', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 18:56:06', '2015-11-08 18:56:06'),
(27, 'Snajafi@mech.sharif.edu', '$2a$08$a36qLLMZbfQCL8p2aF01H.U29SuxyII3X7USn8fyw2H34o5HjY1Ka', 'User', 'Sorena2424', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:00:51', '2015-11-08 19:00:51'),
(28, 'anokhodkar@yahoo.com', '$2a$08$U5yExPBpn0wKTkzCvtWKN.eFqVJIQS0tQNZNJP65blWL9GPDXiUDG', 'User', 'امیر حسین نخودکار', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:04:44', '2015-11-08 19:04:44'),
(29, 'j_sepahi@yahoo.com', '$2a$08$2p3dFGVx1qeyjObDN3qvM.WbUA0eoxvIzWQS9nQVuq19iz/jEbBtq', 'User', 'javad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:05:36', '2015-11-08 19:05:36'),
(30, 'moh3n14@yahoo.com', '$2a$08$r8W1jnfzxzEU16KwN0qQNeEyWtS6bxpc0nwpkViTQTBaEOeXxe4K2', 'User', 'mohsensharifi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:21:56', '2015-11-08 19:21:56'),
(31, 'm.a.jabbari24@gmail.com', '$2a$08$o7EEFyuPHQxloFzMvfDnwOqWvT/4LzavKD8arzlNR9jEwEx4.tJJG', 'User', 'Mohammad', 'Active', NULL, 2, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:23:20', '2015-11-08 19:23:20'),
(32, 'r123oza@yahoo.com', '$2a$08$5CrnE1EGuojOkXykAJHyb.nirbelRDESijvRyl9os5UcBswJDNWnG', 'User', 'roza R', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:28:50', '2015-11-08 19:28:50'),
(33, 'rafimre@yahoo.com', '$2a$08$udwxSDIo3dBhL7maKps7O.5dnipD2rd1skNHsBqK7Q7c.LdqVsvCC', 'User', 'محمدرفیع امامی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 19:57:13', '2015-11-08 19:57:13'),
(34, 'mostafa_khory@yahoo.com', '$2a$08$p8ZtZrhtkl00sClK6Cx9CucM9HBrv.BinR6etpRD8vnnm1qlwtFWO', 'User', 'مصطفی خوری نژاد', 'Active', NULL, 4, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-08 20:10:08', '2015-11-08 20:10:08'),
(35, 'mhfd63@yahoo.com', '$2a$08$TzUtmTWXcGfdBbSM60gk5O3ib0cONakFn3xIHdJMOYCfDebF.ywL2', 'User', 'Afshin Ghotbi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 04:56:10', '2015-11-09 04:56:10'),
(36, 'azizi_msa@yahoo.com', '$2a$08$sXe0CFNWykbpU4PsUJngTOMZgasSozw8x..SUa5.rKruxmuNcMkhq', 'User', 'maryam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 05:38:47', '2015-11-09 05:38:47'),
(37, 'mshoja62@hotmail.com', '$2a$08$BrU8uB4YSjER2KxL3FEryu1v/x1cYHa7v4Lw9oiq17Eop.n/HJC9.', 'User', 'مصطفی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 05:51:05', '2015-11-09 05:51:05'),
(38, 'm.ahmaditehrani@yahoo.com', '$2a$08$ERwgS04AfjheSQmgftqLp.1Ji.nFY9CghWZ7VgOGvdJK.WzPQTZhC', 'User', 'Majid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 06:02:28', '2015-11-09 06:02:28'),
(39, 'taherehaghjou@yahoo.com', '$2a$08$5qg92WpaT62eZhc8Hps4duT2Q3t2hYtPsdoTrY4FIvR7/dzJVNjxC', 'User', 'nahid haghjou', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 06:03:17', '2015-11-09 06:03:17'),
(40, 'siavash.salehian@yahoo.com', '$2a$08$U5EHCUNVWbmUFb2CpkETBuAmFHsxNSFDDM5xO.XiqlBgRE6yT0sMC', 'User', 'siavash', 'Active', NULL, 1, 20971520, 4937484, 16034036, '0000-00-00 00:00:00', '2015-11-11 05:16:33', '2015-11-09 06:08:43'),
(41, 'akhlaghi_mehdi@yahoo.com', '$2a$08$R9eco8XvymXWOmZEBKRvKuHtA0UAl8r87ProWfkDwIYwKdLn7nsPW', 'User', 'مهدی اخلاقی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 06:16:38', '2015-11-09 06:16:38'),
(42, 'Mehrnaz.matloob@gmail.com', '$2a$08$rJPoqwxpM1BRla8mNV5j3Ob2Sm2416NXOg3pc7JBjyLJJYSpPUBoG', 'User', 'Matloob', 'Active', NULL, 4, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 06:38:20', '2015-11-09 06:38:20'),
(44, 'mrezamaghool@gmail.com', '$2a$08$gndwOykwZ67GmSl2PZTmXewQl/.zdDB0yk0uFhDKbZCJ7MOrDpoBu', 'User', 'محمدرضا معقول', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 08:33:35', '2015-11-09 08:33:35'),
(45, 'majidsadeqzadeh@yahoo.com', '$2a$08$SljRHIDo2yRoXbasdKPyqOcXcX4JoTkc92oI9N1noW94F5XFzPv6a', 'User', 'Majid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 08:54:32', '2015-11-09 08:54:32'),
(46, 'e_rezayat@yahoo.com', '$2a$08$FYpDowiZKuCwQWnackC7KuNB9KlvrksiNw/DoCi2RKLC2EMQcZloe', 'User', 'Ehsan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 09:55:40', '2015-11-09 09:55:40'),
(47, 'mohammad_rajabi1992@yahoo.com', '$2a$08$sz2bCWl0skvX9osO62vwuu1r/0mDwI0gZOvLJUbsl8Ry040q9KS0.', 'User', 'Mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 10:04:05', '2015-11-09 10:04:05'),
(48, 'rahim_t_2007@yahoo.com', '$2a$08$MFM96q7u2PeLGAKaNYBXzeaIpC7ZiIvIuNnsmruskvglg6q94pkrW', 'User', 'طلوعی رحیم', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 10:05:30', '2015-11-09 10:05:30'),
(49, 'endline_2009@yahoo.com', '$2a$08$ByTKAAvjPiD5r0rgymkHuOf7V7EYmkpFdFb233jHXth3W9Rjj2.Du', 'User', 'حسین اسدالهی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 10:17:37', '2015-11-09 10:17:37'),
(50, 'fereshteh_mahmood@yahoo.com', '$2a$08$dbOlflYPl2813FOEX0E5J.ZFf.UKXSa9Lr3TvlRWQKUhdlM/CeAs2', 'User', 'محمود', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 10:19:12', '2015-11-09 10:19:12'),
(51, 'signalhadaf@gmail.com', '$2a$08$yYEcmbIQGcMBTDRV1cMun.6oPogGSeZBCqRTezRgsdgcnBT0wzYqm', 'User', 'signaling', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 10:28:50', '2015-11-09 10:28:50'),
(52, 'seifoori@ce.sharif.edu', '$2a$08$QGPt3iNSf4ZJJ27dU3dVGeUV0IFBglcbatfudBcTen984gUncIUOy', 'User', 'sara seifoori', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 11:10:57', '2015-11-09 11:10:57'),
(53, 'ehsan181989@yahoo.com', '$2a$08$0ATifz9qdvDhdwPTkipL8u/z9D.946XBFKGuzeOns8/ONQwOeE2Cm', 'User', 'Ehsan Taghvaei', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 11:22:49', '2015-11-09 11:22:49'),
(54, 'zhsadri@yahoo.com', '$2a$08$nsknw8mcQ5bGWSWwwlRBsedXk8syWjsDa8ubfPXDeLo8Y2a0HrtQC', 'User', 'زینب سادات صدری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 11:53:15', '2015-11-09 11:53:15'),
(55, 'ehsan_en85@yahoo.com', '$2a$08$mu4VKGLOpNByDJxO82kzTuHyR999dswNVP8.MhRmYdnlfW/i/6172', 'User', 'ehsan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:07:16', '2015-11-09 12:07:16'),
(56, 'y.namkhah@gmail.com', '$2a$08$V2DTq1bUxrchj8YctaNKk.tAhHPIL83B3/mqs8V.ojEQxwMgdWXAi', 'User', 'yalda namkhah', 'Active', NULL, 1, 20971520, 9282185, 11689335, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:08:27'),
(57, 'hanifa_pilvar@yahoo.com', '$2a$08$k2D9gLLwgZJzSvDCMR7zhe7qXx58ecGSlryiuuzjbfH0ny4RoLxNm', 'User', 'حنیفا', 'Active', NULL, 1, 20971520, 11350769, 9620751, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:10:26'),
(58, 'ahmadsadeghi27@yahoo.com', '$2a$08$rfePycRF9unRXPt7sWSyU.cLvsX3Q3X1IlnLhFGfQz0L0cxg5ovFm', 'User', 'ahmad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:15:17', '2015-11-09 12:15:17'),
(59, 'parisa_ghahhari@yahoo.com', '$2a$08$G1kl1lags7Y53VNhQi16R.MTNZiWp9nzWjoNUIj9B1hIbxiqjOEZy', 'User', 'پریسا قهاری', 'Active', NULL, 1, 557842432, 74410019, 483432413, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:20:17'),
(60, 'jabereslami@yahoo.com', '$2a$08$VMuDa2hLiTrm7NXsrFeXHOnIwzAtgzxxNw.DizuAgDkX5phVBiH6m', 'User', 'Jaber Eslami', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:22:39', '2015-11-09 12:22:39'),
(61, 'ahmad.arefi64@yahoo.com', '$2a$08$EaEQGKGi02GK530JSJLZHuKbVbvq7VTyd6ManQvUtBz74TUlgMhcm', 'User', 'ahmad', 'Active', NULL, 1, 20971520, 15852836, 5118684, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:28:45'),
(62, 'm_t_mehr@yahoo.com', '$2a$08$GJWbdbzMNyziM4F45iBQOu/EqCC3Jjw2hrKk/GHNMeblmsOAhhbsS', 'User', 'مرضیه طاهری مهر', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:32:32', '2015-11-09 12:32:32'),
(63, 'mpak_90@yahoo.com', '$2a$08$XtO24rNJBQlvyUnXG42CreCsjK4HBJteQIgcyhRGbQk29JKVHRj5m', 'User', 'محمد مهدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:33:49', '2015-11-09 12:33:49'),
(64, 'mpak90@gmail.com', '$2a$08$gWdg0TxGsM418gThXHebDOGLOTl6I/qEb9K.fDBcCnhEqdyaM1dD.', 'User', 'محمد ماجی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:37:43', '2015-11-09 12:37:43'),
(65, 'anahita.rns@gmail.com', '$2a$08$jDzE1RrhPl6LEjZRiXK00uEbDHjnq5Y1TlZuW/Ez/EEoN4jRYDDZi', 'User', 'anahita', 'Active', NULL, 1, 20971520, 5751556, 15219964, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:38:31'),
(66, 'sima.mehri1410@gmail.com', '$2a$08$H8BlXu3uXCGSpcaC2R14luMA1Bfux2UUg2OfTzNFqvtExH9gpuqVa', 'User', 'Sima Mehri', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:45:03', '2015-11-09 12:45:03'),
(67, 'ayoubi.mahdi@yahoo.com', '$2a$08$et65KUkLiERuMvVgmnDoduto/TtREI88sWEHVMCqvOWeX1zBgRtmm', 'User', 'مهدی ایوبی', 'Active', NULL, 1, 20971520, 8436490, 12535030, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:47:26'),
(68, 'saeid.poor@gmail.com', '$2a$08$e3rdNCdQ96WvecOW84e4KeLUI8uLSiOiKGD/EPp2UI1FKCoCU9ZPm', 'User', 'saeid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:49:40', '2015-11-09 12:49:40'),
(69, 'behrooz.fereidoonnezhad@gmail.com', '$2a$08$nxBLJTU3qD7zqPuqSg4dk.O3.U2JE2NA/BQUceQwohLHWhsJGx19i', 'User', 'بهروز فریدون نژاد', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:49:57', '2015-11-09 12:49:57'),
(70, 'bamdad.ag@gmail.com', '$2a$08$ew7jA3X6lScrXYA8PYWAAOVuK6VTLVlkUgEtFy/sXpdpsBsWfTf9q', 'User', 'Bamdad Aghili Dehkordi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:50:31', '2015-11-09 12:50:31'),
(71, 'gholinezhad.hadi@gmail.com', '$2a$08$Gs6oAgIeJq43fwtxOo9akOTVUp4e4rU43AIsmyTjqpjuMW0IfA9WK', 'User', 'hadi gh', 'Active', NULL, 1, 20971520, 2595799, 18375721, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 12:52:27'),
(72, 'mabedinyna@yahoo.com', '$2a$08$mjyT9ZVuFFmXI57hg4tkqezz.Jh92eNUtClLsr3SzlDOhQvehxKpe', 'User', 'Mohammad Abedini', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:53:11', '2015-11-09 12:53:11'),
(73, 'mirbagheri@gsme.sharif.edu', '$2a$08$To0Tbj5WtS8ixCG3rNwLeej22CjHkWfnP3qPFME8BGynxa1JDenLy', 'User', 'میرباقری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:54:09', '2015-11-09 12:54:09'),
(74, 'i430686@trbvm.com', '$2a$08$2jLCHY1bxRycrzuacCSNT.S.KfKEP/CfXz8luwxgSyggCmZffKUv2', 'User', 'alaki', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 12:59:11', '2015-11-09 12:59:11'),
(75, 'sa_szssharif@yahoo.com', '$2a$08$CoXIvMfwEoJan0kMhOemn.e1ntWLyYWh3yPN1v8lkB6Uk/rwlw/Sa', 'User', 'saeede szs', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:03:06', '2015-11-09 13:03:06'),
(76, 'mshiri30@gmail.com', '$2a$08$m1peqpnzPM7k4HucSq5mPe8Nf/WWxJq0sskrnKPciZsuXayAstA7a', 'User', 'محمد مهدی شیری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:15:49', '2015-11-09 13:15:49'),
(77, 'mhf1989@yahoo.com', '$2a$08$MvQfIN3G7P5uZzU7d1toIeimbS6UOOTkjI4FBtv7yR4a9X1gegUC2', 'User', 'محمدحسن', 'Suspicious', NULL, 1, 20971520, 18966235, 2005285, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 13:16:03'),
(78, 'at.panahi@yahoo.com', '$2a$08$9FhWzdvI1Y4yBpTpThbxfOd933JycLQTENpLoj6iDPUAw6qvUiIO.', 'User', 'عطیه سادات پناهی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:16:34', '2015-11-09 13:16:34'),
(79, 'hasanshx@gmail.com', '$2a$08$2jx8hwg67GX53STbJfGMz.HfL7vDJ5cmPe700AJiozFYLfpA1R8b.', 'User', 'hassan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:17:33', '2015-11-09 13:17:33'),
(80, 's.tanhadokht@gmail.com', '$2a$08$0JrJAcgZuzn8SCfTHnXp4u9sxUQz87ga1W9XF4LQSGnsA08fRdGD.', 'User', 'soliman', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:25:16', '2015-11-09 13:25:16'),
(81, 'hassan.niknam@gmail.com', '$2a$08$5Qm7y26sL8ypZxbjPbrGHuedVa47AoB.5sbvNDm1eXUdcXeN5CRKi', 'User', 'Hassan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:27:48', '2015-11-09 13:27:48'),
(82, 'abbas_khodayari2000@yahoo.com', '$2a$08$3dOHLFs31ojGrP8XuLFOP.PZKr4fxWQAV3VfRBe8FVJf8V7MLYxYC', 'User', 'عباس خدایاری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:28:10', '2015-11-09 13:28:10'),
(83, 'tabrizchi_z@yahoo.com', '$2a$08$Fv2LTeaA6kaYrvZ9RSVqQeMNH.toyXczxJtuzzxODYKA6JASwKzcS', 'User', 'زهرا تبریزچی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:28:47', '2015-11-09 13:28:47'),
(84, 'makzeta@gmail.com', '$2a$08$PG2LOrAzs01cBpsKwiTeR.yJkUHMv.cay/jJob2fmiCoXQy2a8ZQC', 'User', 'محمدعلی کرمی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:33:41', '2015-11-09 13:31:10'),
(85, 'pedram_elhami_nia@yahoo.com', '$2a$08$l4gsIog42XbxnFDXq7sHMOnb1/wS53/Fy.jYDJpFWV5q84rGswHRy', 'User', 'Pedram Elhaminia', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:34:14', '2015-11-09 13:34:14'),
(86, 'hossein_ashini@yahoo.com', '$2a$08$3BrbrAuL96tsC46rPyd7ReSUoipPWHAiAmorgYkdVCR64kUpRDLrC', 'User', 'حسین عشینی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:34:17', '2015-11-09 13:34:17'),
(87, 'sara.mashhoun@gmail.com', '$2a$08$qEUfkr0upUxEZOD8e7TLVufjzP30mXxdd2RsBespA3Yjee8aMG9iS', 'User', 'avastar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:37:28', '2015-11-09 13:37:28'),
(88, 'mestaji71@yahoo.com', '$2a$08$TQ6qXW3YlnhvQNn0T2gUtOND08qDzWLdvImQSOE/5WW7QLc7pK7WC', 'User', 'مرتضی استاجی', 'Active', NULL, 1, 20971520, 17441114, 3530406, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 13:39:16'),
(89, 'h.maleki_che@yahoo.com', '$2a$08$11uClProY8T6N0Oh12hV6uYNmtz3bovYwIiP8/zrOO.FE0iIEnbXe', 'User', 'Hesam Maleki', 'Active', NULL, 1, 20971520, 3932798, 17038722, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 13:42:19'),
(90, 'pouyan_farzad@yahoo.com', '$2a$08$cCPQPhBOFQphUlfzh1YYYecD0u72pGyodGebccWc..GW5xwv9yPay', 'User', 'pouyan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:46:21', '2015-11-09 13:46:21'),
(91, 'shakibnarges@yahoo.com', '$2a$08$qH0KwAh5pEAPFZA1uGHSMePa3Koa2wMsFJ/bU48CWR2a7VuLk9r2u', 'User', 'نرگس شکیب', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 13:50:21', '2015-11-09 13:50:21'),
(92, 'mina_h2661@yahoo.com', '$2a$08$2avifjClOWtAsSgneDkgz.Ia1G2gGKShzLBbKv6kVERnvHyUAU94q', 'User', 'سیده مینا حسینی هفشجانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:47:14', '2015-11-09 13:57:40'),
(93, 'mahfoozi@ce.sharif.edu', '$2a$08$VcXK7XwjwxZxNOAfQAwkIeGqrShFoRkvW730eQVGeYYaijlISF7Pu', 'User', 'Rohollah', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:03:17', '2015-11-09 14:03:17'),
(94, 'falsafi_1364@yahoo.com', '$2a$08$9c53f5emEhbbF85YIG25HOb6Ig0rIyBmoqWc63MPyw91JntqPbRaW', 'User', 'mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:06:01', '2015-11-09 14:06:01'),
(95, 'salmanpour.ehsan@yahoo.com', '$2a$08$6uUMJY1Cs2MqW7kOP45LU.yzMAvToJViae6hghkcHw2sUyiGMFtTK', 'User', 'Ehsan Salmanpour', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:06:47', '2015-11-09 14:06:47'),
(96, 'sharar_mosh@yahoo.com', '$2a$08$G2rFrUtMIMlgPBwKeKoxPOjed1u2Ct6pG3.98tQMdL5L857M1MltG', 'User', 'Sharareh Sh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:07:26', '2015-11-09 14:07:26'),
(97, 'hdmohammadi@yahoo.com', '$2a$08$jvFwO1T9OBhlAaCRQhee3OE.GYhShuyMaJj0pz4fGdgUHrKTnOWN2', 'User', 'هادی محمدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:09:33', '2015-11-09 14:09:33'),
(98, 'sanaz_sdh90@yahoo.com', '$2a$08$2scmgeGH59YcFPenhCSB4Onl816R5Lz0sFLgAF3XEwEDeh9Y0SyW2', 'User', 'sanaz', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:10:12', '2015-11-09 14:10:12'),
(99, 'saeed.moeini.1988@gmail.com', '$2a$08$6LyeNVI0EDRchTstEFD1LeuWzRJ2lonyKcCW.O1vPxye4CWESIxHO', 'User', 'saeed Moeini', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:15:14', '2015-11-09 14:15:14'),
(100, 'behnam_hd68@yahoo.com', '$2a$08$35vOZpGmngkHAnic8Aoxw.MEhntxHCL/4Mo/seXtmEj.9RQxdFRKi', 'User', 'Behnamhd68', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:23:17', '2015-11-09 14:23:17'),
(101, 'mehrnoosh_moghaddam@yahoo.com', '$2a$08$ufYhc89v7sldByAFDun1lundsVVXOo159VuePmnm8DlpG8UjRHovO', 'User', 'مهرنوش مقدم', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:26:41', '2015-11-09 14:26:41'),
(102, 'soroushaghaee@yahoo.com', '$2a$08$sMeZczoLYdSnamCUGkyhqeeYUFv/mwED.rkuLpfUWDgF3HYjQEqcC', 'User', 'Soroush Aghaee', 'Active', NULL, 1, 20971520, 6776376, 14195144, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 14:31:01'),
(103, 'tqk18876@foxja.com', '$2a$08$0qDVajRgPMOuNIOfsp0ciuz1YvkhOhxEy3QodqgjhzROa7FV22RhG', 'User', 'tqk18876', 'Active', NULL, 1, 20971520, 991719, 19979801, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 14:34:31'),
(104, 'shmoghimi70@gmail.com', '$2a$08$NRZQbYUSz2106mKtFM6vnu0Y2Hb43KU/w4NpEiuxlpN.DoW19vq5S', 'User', 'سید حامد', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:34:47', '2015-11-09 14:34:47'),
(105, 'z_jelveh@yahoo.com', '$2a$08$8DFYZ7WU93SJCR0xRJA0OuMuuymHTub7Rsdz1WCxum5ggXO8gDO6O', 'User', 'zahra', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:36:22', '2015-11-09 14:36:22'),
(106, 'morteza.soltanpour123@gmail.com', '$2a$08$GEJ1GYRIUeYiRcI9YKb0CeShlnM4Xpa1uh.O0HBTGnBHYBk.k6WLW', 'User', 'morteza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:36:25', '2015-11-09 14:36:25'),
(107, 'mskarimi@elenoon.ir', '$2a$08$CS0ihj04l5sgmlXMYyIftugxwB5fkQQ80Y5Wa.pkKJuekZ6vh447q', 'User', 'محمد صادق کریمی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:44:20', '2015-11-09 14:44:20'),
(108, 'amineh.alimohammadi@gmail.com', '$2a$08$oET1i9SgV5CE6eSOXvnGVuu6Nj5VDHpOTbZLU4uS2mjb1.ugz0o.a', 'User', 'amineh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:45:47', '2015-11-09 14:45:47'),
(109, 'm.ezabadi@hotmail.com', '$2a$08$xTrmoek3AIqPUxnHGY18eOGw5S6fL6xxHgloZdDp8vp1TbXGVqONW', 'User', 'Mostafa', 'Active', NULL, 1, 12905873408, 563244566, 12342628842, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 14:48:18'),
(110, 'd.mahmoodzadeh@gmail.com', '$2a$08$XZZIJV0985PntMgFOkXYv.Zt41V0QScUqZWqnx/LAvJDLfr/NiPYC', 'User', 'davood', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:49:01', '2015-11-09 14:49:01'),
(111, 'ma.kiany.ch@gmail.com', '$2a$08$4r2TxC2rypKjs9qOjmz3SOUg.aT3PnmGWy0aIXQF1mC6M8IT88KcG', 'User', 'محمد ', 'Active', NULL, 1, 20971520, 15598582, 5372938, '0000-00-00 00:00:00', '2015-11-12 19:10:06', '2015-11-09 14:49:18'),
(112, 'esmaeil414@gmail.com', '$2a$08$hXgftH9hbuK6Jan3RtLTOePNalgAUL.ve4XJYew3q/NVS1ixhixtm', 'User', 'اسماعیل', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:50:12', '2015-11-09 14:50:12'),
(113, 'mohnamazi@alum.sharif.edu', '$2a$08$6L83c5nSPX2aqZU9fHCiMO/aaSgr.pYuNMHQ/9rejW2Uw/22oeFlm', 'User', 'Mohsen Namazi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:52:10', '2015-11-09 14:52:10'),
(114, 'm_saye_m1368@yahoo.com', '$2a$08$mzg4eHio7rq7zz8PM4rThuFlkGQHWsjvpBseBfZoHfkizilB2MYOS', 'User', 'محمد رسول', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 14:56:55', '2015-11-09 14:56:55'),
(115, 'sadraei121@gmail.com', '$2a$08$5LCAJkDua7JIfDLHy3TCC.oVvjNh/4QOPocNNIc8vSneKcYc6QIeK', 'User', 'حمید صدرایی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:00:51', '2015-11-09 15:00:51'),
(116, 'b_babaei_r@yahoo.com', '$2a$08$xLpoCJStGgQju2lUfILwFeJDchI6N5WZYdfTbFOQZr8oK9u2PkbRW', 'User', 'Behnam babaei', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:03:39', '2015-11-09 15:03:39'),
(117, 'noah@chmail.ir', '$2a$08$swTF7Gr1IsCT0ZQ8VIESY.t8TWGKkoA6sPVMjiLWb7puS5WtFIRgu', 'User', 'euphrates', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:05:29', '2015-11-09 15:05:29'),
(118, 'elnaznobahar@yahoo.com', '$2a$08$9LLIZJSj2C5i7VXUCiHRb.NfLVwBeUwhGkYbY5rWfTXd0kRPxHypG', 'User', 'Elnaz', 'Active', NULL, 1, 20971520, 9847903, 11123617, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 15:08:09'),
(119, 'mohammad_9069@yahoo.com', '$2a$08$sDC4WXcfaGmDky7J4khdFepnB7GrHFMqsRtqdkxepC9Y3YsCwRgSS', 'User', 'محمد فتاحیان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:47:52', '2015-11-09 15:08:27'),
(120, 'z.raissi@yahoo.com', '$2a$08$XwZ2w08OTv9N7FOAJOUWeutDE4SqczqXpOt3cNem9/3s1W6Y4F3AK', 'User', 'Zahra ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:09:43', '2015-11-09 15:09:43'),
(121, 'a.turbodesign@gmail.com', '$2a$08$Xy2llHn91kgPJdBSzomVc.0eZHDIDliynAoggxuivKERBTf1mngOe', 'User', 'Ali Asbafkan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:15:25', '2015-11-09 15:15:25'),
(122, 'shahryar.sarmast@yahoo.com', '$2a$08$wkq900nwRgTDwhNQlBvwOO58VMiCj3QY6fJVL/V4eGNT9VYqbXz4C', 'User', 'شهریار', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:16:55', '2015-11-09 15:16:55'),
(123, 'parvinahmadi@ee.sharif.ir', '$2a$08$5Sfh6Ru2oesl9VnrbwuTl.2Su2vWG86fdPMvN.KebvWqhBkLHsD8O', 'User', 'Ahmadi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:17:26', '2015-11-09 15:17:26'),
(124, 'mo69_hoseini@yahoo.com', '$2a$08$mduinX0YkW0a6G8kwL0oa.0xMF90RmuIW5vf5MRV9ehvxqiFdQaLO', 'User', 'spman', 'Active', NULL, 1, 20971520, 6499980, 14471540, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 15:17:35'),
(125, 'parham.sahandi@yahoo.com', '$2a$08$pMcFpmkacPU3eHLMuuqkIeTRfaKsTF7lFIu.dUsz3jjw6iMnJKzfG', 'User', 'پرهام سهندی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:22:02', '2015-11-09 15:22:02'),
(126, 'sabourianparinaz@yahoo.com', '$2a$08$QK6KnkKT0ezq55JgP3gZYOa.emKtZCqYcAO9k4D3pT763/C4JtXIK', 'User', 'Parinaz', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:25:24', '2015-11-09 15:25:24'),
(127, 'aghtabrizi@yahoo.com', '$2a$08$knlxaYg0hEuDhLnLhoE1O.T6tbafHusHIoos32ZGtQ6QaDjCMv9gC', 'User', 'mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:26:12', '2015-11-09 15:26:12'),
(128, 'ghofrani_erfan@yahoo.com', '$2a$08$SFA1MS7f6ttGaNb5SMi2wOguJKIa2A2cX97rBzb7ZJhk6llzdmbdK', 'User', 'Erfan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:26:30', '2015-11-09 15:26:30'),
(129, 'mdaalvand@gmail.com', '$2a$08$N7skPM0grrBOfKDP3ZKTXOAp6p0TN2gRepLwcIGbqBhjFNu.Jm5iO', 'User', 'mehdi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 15:25:40', '2015-11-09 15:27:56'),
(130, 'zafari@ce.sharif.edu', '$2a$08$4IU4IjQXgT1I8AEB0Ir82Od47A30NCLqpgUITTvvfRI.V.JT9f4kS', 'User', 'ali zafari', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:28:48', '2015-11-09 15:28:48'),
(131, 'azadvarsoheil@gmail.com', '$2a$08$QU72BAyPURJnh3xjCCYpJOVJYpD6CKJqlXBuvceTHbgWDhMzhJBtC', 'User', 'Soheil Azadvar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:30:25', '2015-11-09 15:30:25'),
(132, 'mohebbi42@gmail.com', '$2a$08$oCgSYI5D7IjgrqMpouFYne4/Uy9WZ5yLN19CKvQNNpm22jSqWuZne', 'User', 'Monireh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:30:44', '2015-11-09 15:30:44'),
(133, 'hhadavi_91@yahoo.com', '$2a$08$sTPA8PNcGQPtzp5nZ61ZGOKkeeCXwhXMUZwJ3792rUuy1pbmH.96W', 'User', 'Hossein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:31:05', '2015-11-09 15:31:05'),
(134, 'abcde_894@yahoo.com', '$2a$08$407prvRDXK5vRNikhCUwmegB3NUUadbY6mcu794sxS7faeJIhMQCe', 'User', 'hnpm894', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:34:19', '2015-11-09 15:34:19'),
(135, 'abbas68shafie@yahoo.com', '$2a$08$siS3RtjuMpqKp91KZMH8UOayJTzyGGNUHS5OMJCf/Dv6eVGB62u0.', 'User', 'Abbas', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:37:13', '2015-11-09 15:37:13'),
(136, 'fnili_999@yahoo.com', '$2a$08$0qnRaHY3uYu5Y6nqpx7NW.rF.7TUmYetBJGuzYdK0YZMXg77lHDIC', 'User', 'فاطمه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:38:07', '2015-11-09 15:38:07'),
(137, 'a.haji1370@gmail.com', '$2a$08$ESMgljgikKGWHKKVNODMb.ZoXLCqkAbOP7zqZu1dwbxVMG5DR4ZZy', 'User', 'امیرحسین حاجی زاده', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:38:52', '2015-11-09 15:38:52'),
(138, 'parnin.star@gmail.com', '$2a$08$EiyndVzyvF80YRz5UOaTXe5TD7afU6NqhpPYeGTAbOhDH39wO/Mpq', 'User', 'parnian pourshayan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:39:00', '2015-11-09 15:39:00'),
(139, 'aliiaminian@yahoo.com', '$2a$08$f92TUqxghXkvgqnulu0oO.ylZB/NMTK0fg/gQOU2X6t8am504EBma', 'User', 'ali aminian', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:40:19', '2015-11-09 15:40:19'),
(140, 'bahador_beigomi@yahoo.com', '$2a$08$kmMSaMwZk29ZSOBu8VWZV.60uPssUZ0AoeW9VUAlC.g27QCO2bwPm', 'User', 'bahador', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:41:07', '2015-11-09 15:41:07'),
(141, 'rezvankavosi@gmail.com', '$2a$08$ebJX82DyMeBPF6rVHYuWyeG6AthgxgTSBgC0aIplu8VBZvNUT59hy', 'User', 'Rezvan', 'Active', NULL, 1, 20971520, 2787605, 18183915, '0000-00-00 00:00:00', '2015-11-09 15:44:44', '2015-11-09 15:42:20'),
(142, 'keyhan_babaei@yahoo.com', '$2a$08$vilXiNW5N4K1hQnPrBjOouW0ixEG2sTt1h7wjzVqdHgZ/5yo0JoJC', 'User', 'کیهان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:45:38', '2015-11-09 15:45:38'),
(143, 'amirmahdi69@yahoo.com', '$2a$08$1MZOLi0banR0ONKACTejNuYSas2cmup6ZF0.cqB/VpgKG9aqtMTz.', 'User', 'amirmahdi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:47:27', '2015-11-09 15:47:27'),
(144, 'arhsaeedi@yahoo.com', '$2a$08$ckCO2jqZb9ZUTTGdOy9y4OWMZAWLGtgCoB9lyDhsd.GDfoEAeFcmS', 'User', 'احمدرضا حاج سعیدی صادق', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:47:58', '2015-11-09 15:47:58'),
(145, 'hesamwls@yahoo.com', '$2a$08$aeWuzN7R6EvS2OdDce4WieoFuhFI5DDqfiChb9iPAqpAaiKsp7Kj2', 'User', 'Hesam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:48:04', '2015-11-09 15:48:04'),
(146, 'sadeghi_pouria@yahoo.com', '$2a$08$tTGqW2EAIDUUvG4Oj9Nub.e06UZUkf4qUoqtbQefjeRaODGr0K3ES', 'User', 'pouria', 'Active', NULL, 1, 20971520, 6453891, 14517629, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 15:48:27'),
(147, 'nastaran.shekofte89@gmail.com', '$2a$08$Wv1HiJ7PGWHuG4Oo9lOiueEklW7CKRcVtlSff.0FlvAyrSkAJtqIi', 'User', 'نسترن', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:52:08', '2015-11-09 15:52:08'),
(148, 'zahra.hosseindokht@yahoo.com', '$2a$08$ScUJWQIYzHafYa6F4Fc8HuTheJ8iZwH0Dz5tRAV/xvnXWg2cc38Fq', 'User', 'Zahra Hosseindokht', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:53:29', '2015-11-09 15:53:29'),
(149, 'oraclelongroad@gmail.com', '$2a$08$h8TA73WhWAZZk3OyqVLw0uRLGeWZTql7/qGEz66SfP4iSHZb4kc3y', 'User', 'miad abrin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:55:28', '2015-11-09 15:55:28'),
(150, 'ravansalarnasrin@yahoo.com', '$2a$08$ZmSmkPHCzCMpcLezy6ryk.Gb7l7uV.x2UhZwOptV02KvjY8YHPkaS', 'User', 'nasrin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:55:34', '2015-11-09 15:55:34'),
(151, 'gatefe@ymail.com', '$2a$08$FU2N6v17EOUbOJSsZRClMOYzWufP/89ZmdQzl2RNOCpFN8tUSvMcS', 'User', 'atefe', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:56:06', '2015-11-09 15:56:06'),
(152, 'hamid.nasiriasayesh@gmail.com', '$2a$08$KkPsxaVuSKcZTR76h7iiYu2RYiCJdrpQZiZIP9/1LCANzzSOQSvUG', 'User', 'hamid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 15:56:56', '2015-11-09 15:56:56'),
(153, 'farhadkarimi1372@yahoo.com', '$2a$08$WJsTgquFqXWAjJGnWSGSYOr58yD23uZJ/CaJpbrYMNq6MIgqdAtSa', 'User', 'فرفاد', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:03:57', '2015-11-09 16:03:57'),
(154, 'farzad_it_2005@yahoo.com', '$2a$08$xAgOIg5OVxWNtEDmDqIKf./TFBno1iO9osE5X1UafoQKqLWHx8UwG', 'User', 'farzad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:08:01', '2015-11-09 16:08:01'),
(155, 'mr.najafzadeh@yahoo.com', '$2a$08$uqKvx9xPKuVa3ZfLV5bqTumYz2SwchfYEPSC/X1q3tf4glRY3glyO', 'User', 'mohammad najafAdeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:11:30', '2015-11-09 16:11:30'),
(156, 'mohammadhesam1369@yahoo.com', '$2a$08$rMA9u3f44OACXonskjStQu.iS69gE3ckZ6t.vGoMWLmAzgvWTWJEO', 'User', 'محمد حسام حسنی سعدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:11:40', '2015-11-09 16:11:40'),
(157, 'vata69@yahoo.com', '$2a$08$nePVIbGSU4Z7BzkJC5uFA.nQfzPyU04PGLBUEQjHDYTMNjt.6Sj7.', 'User', 'Vahid siadat', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:12:04', '2015-11-09 16:12:04'),
(158, 'mortaza.sadeghi@yahoo.com', '$2a$08$8dTmwhELLth7rXPNiy4feee70Sa1ZKDFzGzfv2ZbXhFDJYQydEX4i', 'User', 'مرتضی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:12:48', '2015-11-09 16:12:48'),
(159, 'so_seidi@yahoo.com', '$2a$08$Ss6xURL1S9HgMwj6UdwoguuWq5NvsgLluaopXL2O/fLLMJOMuprja', 'User', 'somaye seyedi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:15:15', '2015-11-09 16:15:15'),
(160, 'hfattahpour@gmail.com', '$2a$08$6EGNYpBbDZW3aj8qBXNTYOHY/azdoEmVMZftyuCoPGwo6RwqP5Ig.', 'User', 'هانیه فتاح پور', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:15:50', '2015-11-09 16:15:50'),
(161, 'samngft82@yahoo.com', '$2a$08$ISNentbWlJMO0dmN6JucvuuqPJqIPmiAO1TjEJlgo2Br2EjHKEKIm', 'User', 'amin golkar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:20:33', '2015-11-09 16:20:33'),
(162, 'h_nasehfard@yahoo.com', '$2a$08$3Z5FBI06IAYdcwoXZxmHaey1eG0juBnB/BbgEu9DUFifWB0xz/CeK', 'User', 'haniyeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:22:33', '2015-11-09 16:22:33'),
(163, 'hadi.sheybani1993@yahoo.com', '$2a$08$ThVaTFKLFVqrfxsx2UNGauwZE.u7mJkpm/f7cYeSc.CpBxPIgSkt.', 'User', 'هادی شیبانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:23:20', '2015-11-09 16:23:20'),
(164, 'tm_bahlake@yahoo.com', '$2a$08$lUAXdHXYGrG842xPvqiIjOmpywrt1DmGB5WGg1p5.HL2RitdFG1r.', 'User', 'توی محمد بهلکه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:24:15', '2015-11-09 16:24:15'),
(165, 'vah.ghazizadeh@gmail.com', '$2a$08$d2ATYG2yXHU7bxyH1WJjMuNkhsnrPzMGDhb/h0LCvWGAimjyOKCAC', 'User', 'vahid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:28:19', '2015-11-09 16:28:19'),
(166, 'hamid654s@gmail.com', '$2a$08$4WlExIwPSOakwapwKAVMBuTMVNilWLpLYK4SRgbScsxdKyH6H8H6a', 'User', 'Hamidreza Soltani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:31:48', '2015-11-09 16:31:48'),
(167, 'mjkiani1@yahoo.com', '$2a$08$MAXBTipy4Siaofe3nZNn0ump9Ev3Esqb3GWvHXks1adlZsoGFpBDa', 'User', 'mjkiani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:31:54', '2015-11-09 16:31:54'),
(168, 'm.ghasemian68@yahoo.com', '$2a$08$FQgh66kvvFRdVOhgAvvs4.YETrogAugDDMGtUzrtnnAafKshmq8a.', 'User', 'majid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:32:04', '2015-11-09 16:32:04'),
(169, 'amira.davoodi@yahoo.com', '$2a$08$GWJy8pb4awyxeHeo5szZGuHPnI8BUqg1QGyV9FR5/1WoaW7fUNjrK', 'User', 'Amir Abbas Davoodi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:32:08', '2015-11-09 16:32:08'),
(170, 'mehrnooshrafiei@gmail.com', '$2a$08$DWLg0agS2bjP23xQnT6mV.YfVUZNV/dultqVKZ4On.t1Zgkht2Su2', 'User', 'Mehrnoosh Rafiei', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:32:10', '2015-11-09 16:32:10'),
(171, 't.rezazadeh.68@gmail.com', '$2a$08$ZAYDRd8ejXNbleCxgC9Jl.Muhyezf6CPUAn4Q72p54.uUe2ldqh/.', 'User', 'Tohid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:32:30', '2015-11-09 16:32:30'),
(172, 'zs.emami@yahoo.com', '$2a$08$joJvQaR9OUpA9P6ME7RfSujPPqL.UONKA0bm26repWvjyF8NzZfOG', 'User', 'zahra', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:34:53', '2015-11-09 16:34:53'),
(173, 'mnamnam@ymail.com', '$2a$08$jNmm7Q5OJ5BFWdrp2hSRk.ngFlfcPk1/atXwocqxntqwE83ohvxXy', 'User', 'naeimeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:36:33', '2015-11-09 16:36:33'),
(174, 'aliq26@gmail.com', '$2a$08$d6nSdPwdktGRVCYO7Xgbi.tZgDNkwBacuwLX.rof1B.tpXqfrgJ2a', 'User', 'ali ghorbanpour', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:37:00', '2015-11-09 16:37:00'),
(175, 'necraimouche@emeil.ir', '$2a$08$63yVjVqRhFkNLY7UbIzXbe3D66UfOaVxw6Gt4eUaCb8i2.cv.qfOK', 'User', 'necraimouche', 'Active', NULL, 1, 20971520, 7216542, 13754978, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 16:40:14'),
(176, 'ramtin_rohani67@yahoo.com', '$2a$08$rDbfabhGhm8dCJfmkxrK5.liUMigJ6QLTdT8rxOIvwDYBVBfir9sW', 'User', 'ramtin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:45:03', '2015-11-09 16:45:03'),
(177, 'aghapour.ce@gmail.com', '$2a$08$hsMmKtnHTItxUFUIG1oqZeDOBOCXkItwXjg7NvFnZGWYRdsA2J.FO', 'User', 'ehsan', 'Active', NULL, 1, 20971520, 18847884, 2123636, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 16:45:09'),
(178, 'abedini.mohamadreza@gmail.com', '$2a$08$70bu13UbjmqfWQGeeMhLKuBU3Vckf1KHzCRg/V1hIUtuHBoNngbrK', 'User', 'محمد رضا عابدینی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:46:02', '2015-11-09 16:46:02'),
(179, 'omiran40@yahoo.com', '$2a$08$g7q7yAxnwXLvWzEguctFz.Nxm7V/t8MBJEsvwk/U6JwK5JjPw2Qy.', 'User', 'omidalizadeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:46:50', '2015-11-09 16:46:50'),
(180, 'nadiahalimi71@yahoo.com', '$2a$08$ZwgTNB1pgx7CtY5BMaH3mOm8GMSP0GNW3V3m1jlW628Dy36cuMJvm', 'User', 'nadia', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:49:12', '2015-11-09 16:49:12'),
(181, 'amin_r53@yahoo.com', '$2a$08$BEy2psFIEVQaZOPS5Sdl7OejaGBY.2kCLHi35tvuki0YbHQzNYrV.', 'User', 'amin53', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 16:56:53', '2015-11-09 16:56:53'),
(182, 'a_hamidreza@yahoo.com', '$2a$08$WCTBRNr55JhFZ8SGpgQBxeaJzunrhDbSxf0BbwaKiWin8dlMZUxJ6', 'User', 'Hamidreza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:01:34', '2015-11-09 17:01:34'),
(183, 'sepanta.m1990@yahoo.com', '$2a$08$UcFtbWmJvmqPd3UmpXOqweGCooTRhyU6by/8OC7HNDESmpz9AjTdm', 'User', 'mammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:09:33', '2015-11-09 17:09:33'),
(184, 'syavash_azna@yahoo.com', '$2a$08$6C42PhVwB7yG6u3rmyGJYOu1Ch.w3WXow31/Q5Jd6QA55iyjbCIeW', 'User', 'سیاوش', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:10:28', '2015-11-09 17:10:28'),
(185, 'a@b.com', '$2a$08$qG8qZodHUw13970eUEU0P.gqSWwzlRLcNEWi32mvs7Du/IdtKRqsa', 'User', 'abcfgc ghj', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:13:45', '2015-11-09 17:13:45'),
(186, 'ghannadian_parya@dena.sharif.edu', '$2a$08$F2I0iBwexINnmjECu9HvzeSbZXSO8roPUYEyMMaYY6aEZWh1Qmjrm', 'User', 'parya ghannadian', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:17:29', '2015-11-09 17:17:29'),
(187, 'mohamadi.amir1991@yahoo.com', '$2a$08$mApZZ8ZHwj34uV69baqwI.NGJa2AjyjQOufv.82sUI8SMaAa3ZwsS', 'User', 'amirarash86', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:17:49', '2015-11-09 17:17:49'),
(188, 'farid_fazel_m@yahoo.com', '$2a$08$Op20wQIGlFtuUxsCU5FFmu3NcpukyPgXnFIQH7PlXtowKarqY43sS', 'User', 'farid mojtahedi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:20:51', '2015-11-09 17:20:51'),
(189, 'rezazadeh.pouya@gmail.com', '$2a$08$IfjQNW1rEnzrljec1EkexOZ.uaou4oYIsu779SGubhUskzF4sQNnC', 'User', 'Pouya Rz', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:22:41', '2015-11-09 17:22:41'),
(190, 'sedghi86@chmail.ir', '$2a$08$SF0KPwwjp8nRWJHxEqoy3OyrQerZmv361BHAPc9vmXOHnMZy6jR1K', 'User', 'sedghi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:24:25', '2015-11-09 17:24:25'),
(191, 'masoud_ferma06@yahoo.com', '$2a$08$U5HebuHw2DMak5xHnRgS8uQjZVIeHsVGJylJqzKiaAn3Re5mbl35i', 'User', 'masoud', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:24:51', '2015-11-09 17:24:51'),
(192, 'mohagheghi@ut.ac.ir', '$2a$08$I5vhhaVNcZ8GBwwnmlxy0.ew6.4i.1uY3/KKesu7TyHLKpytKym/6', 'User', 'mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:25:04', '2015-11-09 17:25:04'),
(193, 'alisoveyti@yahoo.com', '$2a$08$DQlVduqhxKA6Co36s8UXjuKY6ak7HfPUYfA0piB1NYeUT1XHVqMCC', 'User', 'alisoveyti', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:27:19', '2015-11-09 17:27:19'),
(194, 'seyedmohammadforghani@gmail.com', '$2a$08$yvtz23lYKNF2XjyCbOI7nOPtqCU3arJSUlv56oijSk5IaFWy5Kd1i', 'User', 'محمد فرقانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:31:13', '2015-11-09 17:31:13'),
(195, 'payam.soleimani@yahoo.com', '$2a$08$CFf4yrBVGd5A0vZyLOSu4uWC.tWX6aeTqGO2gn/1DezBpQq7ZtpE.', 'User', 'پیام سلیمانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:34:03', '2015-11-09 17:34:03'),
(196, 'q.erfan@yahoo.com', '$2a$08$mQuIKPsjB5TOOWMqGxWkPuXuZiSxSCEzGzzxa9KEmv0JxufIDlxAW', 'User', 'erfan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:37:50', '2015-11-09 17:37:50'),
(197, 'golmohammadi@mech.sharif.edu', '$2a$08$gnbowiRpcb6DfkrMvcZnlOEcR60bkc6CqNgtqjvv5AeXNknJ8C4Ze', 'User', 'arashgmn', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:41:00', '2015-11-09 17:41:00'),
(198, 's.h.fahimifard@gmail.com', '$2a$08$RRiOxv9q0OCVRttsAYVJ3.kw8Q0..tEy4Kf9ynxUaFbHvQj9Unnaa', 'User', 'سید حامد', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:43:48', '2015-11-09 17:43:48'),
(199, 'meghdad26@yahoo.com', '$2a$08$Pb5rRJWtq0VpFCaGtTzL4.FeeZq6fIAYvfq8/sD8WgZw/ccQil4Ba', 'User', 'meghdad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:44:05', '2015-11-09 17:44:05'),
(200, 'hamed_am_92@yahoo.com', '$2a$08$ZK7bw4QdVe6z2roDqb62Fe8OD9sHo9eke9HOszRSSLHFCPJqDIUyW', 'User', 'حامد امیری مقدم', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:46:33', '2015-11-09 17:46:33'),
(201, 'emranvfd@yahoo.com', '$2a$08$73ypmO0fcTmhZP6YJyjyj.vEImKKdERUHJV7taBHu9hDL3o3b.gF6', 'User', 'emran', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:49:47', '2015-11-09 17:49:47'),
(202, 'tina_3683@yahoo.com', '$2a$08$mSgUPPa7zCXzdXn5G6HT8O37zmt7/ZyZhQI5B2eJw9MsGCXh3pBra', 'User', 'Fatemeh Abbasi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:50:33', '2015-11-09 17:50:33'),
(203, 'aminazadi71@yahoo.com', '$2a$08$PjhZPsWWG8GbwrRFSDfTH.RZ/xbv.kjiHfKSWan.LMEjRlZwj9IaG', 'User', 'امین آزادی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:50:47', '2015-11-09 17:50:47'),
(204, 'sefidkooh1383@yahoo.com', '$2a$08$4htcLlb0y4v8LCXL90HE2.JmAyD4/UqiRYteJTRhn4lnoTwb0/9TG', 'User', 'hossein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:51:30', '2015-11-09 17:51:30'),
(205, 'ro.kh67@yahoo.com', '$2a$08$0XgegGSe0tJA5HdbL3aC4eHFsl4myNHfmqkJxeww9Rk90bqoMv3uC', 'User', 'روح الهخسروی زاده', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 17:59:00', '2015-11-09 17:59:00'),
(206, 'mehrasorouskhani1368@gmail.com', '$2a$08$vNlf1UzLW7kX0rjNjiwchO99iNaLc/agGIf1uep92Ol6278f7OiSa', 'User', 'Yasin Orouskhani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:03:32', '2015-11-09 18:03:32'),
(207, 'sahar_sajadi2005@yahoo.com', '$2a$08$TWpC3c8SYG5Sv531GVcoBuaEX6DOxiICWs1uRTwGJw19AefP4MiNm', 'User', 'sahar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:05:03', '2015-11-09 18:05:03'),
(208, 'mohammad_mr71@yahoo.com', '$2a$08$hP9H7vTOtSfX4lGMtNsTd.koE2Kn28wtyMdbg6N12rVrHPeQjtQHu', 'User', 'محمد رضایی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:18:47', '2015-11-09 18:18:47'),
(209, 'mohammadikaivan@yahoo.com', '$2a$08$8oQvHopoI8vUjLoEzM4JEuCCLBXY8sgpaOz1J4sNgSjHxRiddKfMS', 'User', 'kaivan mohammadi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:20:19', '2015-11-09 18:20:19'),
(210, 'zeinalian.sh@gmail.com', '$2a$08$9Ioid2WJxI8v1Pwolk8q1OXAN0uUswg0HsrlyXL5ClAvtDXo2rdz2', 'User', 'shahrzad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:23:11', '2015-11-09 18:23:11'),
(211, 'hsaadat69@yahoo.com', '$2a$08$OmzSa5twxZ2v5ZQVHiOT1e8fBuBsxz3ycdxbzSacRIKPdFhTteLl2', 'User', 'محمد حسین سعادت', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:27:14', '2015-11-09 18:27:14'),
(212, 'rasool_s70@yahoo.com', '$2a$08$8HXjc2MO2JNdXUtfiO2oa.4tOSo2WTxoQBj2GvbZfRtHJZlRb5lBq', 'User', 'mohamadreza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:30:57', '2015-11-09 18:30:57'),
(213, 'mohammadali.ahmady@gmail.com', '$2a$08$mx5dPRRvuFtjP7LXn114G.E8PmoB.glJm9UyyJNpfvLLK1WOsEN1q', 'User', 'mohammad ali ahamdy', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:31:53', '2015-11-09 18:31:53'),
(214, 'rajabzadeh.hesam@gmail.com', '$2a$08$S1BD0ZTfubJvr6lZJolDleAkD59fVRtwwOYHiIwvmiAA0PgKSA2kS', 'User', 'Hesameddin Rajabzadeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:34:37', '2015-11-09 18:34:37'),
(215, 'sa_abdollahpour@yahoo.com', '$2a$08$d8aGYe9kSGUdvxcQL2krJOcWfTJcY.ssJZe3zLsZ3KEp4mJgh8sEy', 'User', 'saeed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:35:59', '2015-11-09 18:35:59'),
(216, 'farzan_rashidi@yahoo.com', '$2a$08$7YE7k9XJxOqHyMfmrAQvGujdJ1vwjMh7yb36WMExjdkaPb9bWFL.6', 'User', 'frashidi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:36:43', '2015-11-09 18:36:43'),
(217, 'keyhan.ahmad@gmail.com', '$2a$08$480tTl6BC9KQ4dfRGLg8nO7vEJfgLUKW2CbmpOVlYdISWXOh63Dwe', 'User', 'ahmadkeyhan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:37:20', '2015-11-09 18:37:20'),
(218, 'zahra_z1@yahoo.com', '$2a$08$Pu4UwwXp5OKzGoFFrZKdS.EyekU4/XQAqDZX.RFWyiXNjNQs9.iiq', 'User', 'zahra zangenehmadar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:38:01', '2015-11-09 18:38:01'),
(219, 'homayoun.hamed@gmail.com', '$2a$08$O9GLdb8LB7gi50UmiELPgeHhoyf6QgTMyYQt8sBq22LeS8xIl5eXa', 'User', 'homayoun', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:41:16', '2015-11-09 18:41:16'),
(220, 'alireza.hamze@yahoo.com', '$2a$08$J7HbcxuyJwM0TbYbqFnFiuNf7gcz.DPoPNFhF1zGQ3O5KXMvIhRFS', 'User', 'علیرضا حمزه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:50:27', '2015-11-09 18:50:27');
INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `status`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(221, 'mohsen_karmozdi@yahoo.com', '$2a$08$0cpoNBy73w1hDFFaoVRtEOXkyNVjQEH2Ov9i8rgtD6fqYA0FD8nFi', 'User', 'mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 18:51:59', '2015-11-09 18:51:59'),
(222, 'naderjahanbakhshi@yahoo.com', '$2a$08$qZXfgwUXkyKdzRRgGMnNFuAuHmCERTzdVarED1yr6Szw0tlY06Sme', 'User', 'nader', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:01:34', '2015-11-09 19:01:34'),
(223, 'fraebanitalebi@yahoo.com', '$2a$08$Hb1cRvguHc1LNDL5lQ2NMeJWiG9QREQovdbDiapohNxGZ29c95T7e', 'User', 'Ehsan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:03:31', '2015-11-09 19:03:31'),
(224, 'mrzhajiabadi@gmail.com', '$2a$08$aChI8SkEEf8geKSmwGNYaO/klxiHpfb0lIv1dk4MOt/2F3ueDBH7i', 'User', 'محمد رضا حاجی آبادی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:07:23', '2015-11-09 19:07:23'),
(225, 'mohammad.mehrdad@ymail.com', '$2a$08$dPE75sjZxGYsS2gX2Rglzud2hK0mwSRcmNhxWIXpFILM9j.EQYCL2', 'User', 'mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:09:15', '2015-11-09 19:09:15'),
(226, 'h_soltaninejad87@yahoo.com', '$2a$08$ElwwJzIJKYVT1lLXpNNNwOi/RvIvNbDCQVONm9lZ4noR9k7Pq/sce', 'User', 'hajar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:18:28', '2015-11-09 19:18:28'),
(227, 'rohollahnasiri68@yahoo.com', '$2a$08$uRaXJ1UEp5eG6DjLenEs9usWG.bYJoVcmIBS6ga0sPaAlqEOFYK4q', 'User', 'rohollah', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:23:53', '2015-11-09 19:23:53'),
(228, 'rezaei.foad@gmail.com', '$2a$08$fjIDyrNVuY1eUjflVEdu9equVyqNNEugbOFteyoIPfln0jQhp1IPm', 'User', 'فواد رضایی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:25:22', '2015-11-09 19:25:22'),
(229, 'bmoha@aut.ac.ir', '$2a$08$6Qcxwdqf6p344oKkpMcIhOc5q1fP6.4sAjN6oCCodylEjkDtkU11C', 'User', 'bmoha', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:35:06', '2015-11-09 19:35:06'),
(230, 'razian.mr@gmail.com', '$2a$08$rFfsdR5KUhJpWAMRkNiEFe/h49lfDli6SxQRogrJdDXTzjMwXPUBS', 'User', 'Mohammad Reza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:39:49', '2015-11-09 19:39:49'),
(231, 'm.khodabandeloo@yahoo.com', '$2a$08$7Vq7YW2YQXWmqi1KawNbeOVxuxtEjgmoY448OQjA4MsgHBwNTEwKK', 'User', 'مصطفی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:46:51', '2015-11-09 19:46:51'),
(232, 'kiastopher@yahoo.com', '$2a$08$9gWY97EI9X7Pm52Bhef71ud1QqgJfZ8CUvbftPV6MyEFKvsnJXYLW', 'User', 'کیارش', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:50:51', '2015-11-09 19:50:51'),
(233, 'h_kh_89@yahoo.com', '$2a$08$ISstTh9jKrcUejQJnqVXUuo/SoawVd/EJ0SYt8Y7fry/4GTV/GcNK', 'User', 'hamidreza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:51:06', '2015-11-09 19:51:06'),
(234, 'moradshahi@ee.sharif.ir', '$2a$08$sdEAujAWM1AK8aukKZOEEek1lOpupeOy6qOzXGD/xuA.nuNCKiMda', 'User', 'Mehrad Moradshahi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:55:15', '2015-11-09 19:55:15'),
(235, 'smkian12@gmail.com', '$2a$08$vURKCrcNCqaeS3oMMOykde2Jt8lGZOmVSA3wVwtWc8YbY.d1bHOce', 'User', 'Samane', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:56:19', '2015-11-09 19:56:19'),
(236, 'mohammad_fazlikhani@yahoo.com', '$2a$08$OGgBeBOentrdLjDLzBSghenDXQN4Ylb/XZRXoBFx.9AG7EZ7d/w6e', 'User', 'Mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 19:58:15', '2015-11-09 19:58:15'),
(237, 'tmpry-2@yahoo.com', '$2a$08$714RfwHVgBCiu2SHuSwwt.ziZdtQ.z.hdrewIOTp0Or1rZJI2n8TO', 'User', 'mjdn mjdm', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:08:27', '2015-11-09 20:08:27'),
(238, 'fallah.samira72@gmail.com', '$2a$08$KeTntCXIsGCbscih6n883OVZLS9XMSCypPJjEEIxGSx0Z1TAMRqW6', 'User', 'samira', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:09:48', '2015-11-09 20:09:48'),
(239, 'ahomayouni92@yahoo.com', '$2a$08$A49T4VajA6Utp1o7M9dRk.X0zxNmdsRhavpTjCCv6WDJoTzP91Ama', 'User', 'احمدرضا', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:13:19', '2015-11-09 20:13:19'),
(240, 'ehsaee@ce.sharif.edu', '$2a$08$y8l7eQkY0gdnR9PAfrbJS.yfAYY6wXqGghxTrf0X.A4222htW9D2e', 'User', 'shahryar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:13:33', '2015-11-09 20:13:33'),
(241, 'alirezaaghaee17@yahoo.com', '$2a$08$yls8zbBZIelwVCUdFRHIlOTTxjkPudtsJB3sBLSTMTXoaJpfMYYk.', 'User', 'alireza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:14:33', '2015-11-09 20:14:33'),
(242, 'sinasafaei2012@gmail.com', '$2a$08$ameSQKuJfVr3M3PPsys1N.nXg3JToNDe2Yqp33RtL3lVcdMkl42Y6', 'User', 'سینا صفایی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:18:10', '2015-11-09 20:18:10'),
(243, 'sinaeq@yahoo.com', '$2a$08$pL1xaoj7Fui75PcircyYzOPUEyfHCFYvgBFEDFQHzq2KOxfIcXa6C', 'User', 'sina masoumi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:32:39', '2015-11-09 20:32:39'),
(244, 'a.h.taherkhani@gmail.com', '$2a$08$2kqc2YMxTaUuqSNz23jw1uvZbv1nVm4K7AvQLrZ0/xcpqfCpNIuzS', 'User', 'amir hosein taherkhani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:35:16', '2015-11-09 20:35:16'),
(245, 'a.aminkhaki@gmail.com', '$2a$08$45olfH53Tac6cpA5Q4m5i.7WuOFhawpwm9SMhjZ8G0TzB0jj7LJtK', 'User', 'AlirezA', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:36:49', '2015-11-09 20:36:49'),
(246, 'hamdollahzadeh_m@ee.sharif.edu', '$2a$08$UiJauIoAOg0eP5oW6N18HOmtdtPAGBHQX71ZbXT2HkM/BwayFnRE6', 'User', 'Mohammad Hamdollahzadeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:37:15', '2015-11-09 20:37:15'),
(247, 'sityaghoubi@gmail.com', '$2a$08$2ceklwZhMbZbd0oYTBJwaukt8NiZMiXIubkNagEW3SZwekC.AbtNu', 'User', 'tahereh yaghoubi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 20:49:27', '2015-11-09 20:49:27'),
(248, 'aminterm@gmail.com', '$2a$08$SUo8GCEpp0S7myjxaQLJsOnlz.e0RcwmEvBJo7L2Bt3QbNxIL2D4a', 'User', 'امین امین', 'Active', NULL, 1, 557842432, 43216954, 514625478, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 21:07:29'),
(249, 'ss.mirghasemi@yahoo.com', '$2a$08$ZR8sw9L5Zy1lWGu03cX6DO5CeJrJTZXNeouiEyM2RBEElwtYoKU42', 'User', 'سید سعید میرقاسمی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 21:07:37', '2015-11-09 21:07:37'),
(250, 'pooriaaminizadeh@yahoo.com', '$2a$08$wWlHe1WHjUiWTkLkbx7Ob.1D80E5viT2Q7c.D8/xQ0nFUbOFrpYSK', 'User', 'پوریا امینی زاده', 'Active', NULL, 1, 2168455168, 43674928, 2124780240, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 21:11:18'),
(251, 'imanmohammadi68@gmail.com', '$2a$08$iss7notlTPV6fFyDbVaIH.b4APKeOnQjcl.QUaTueVrImYUOXssiy', 'User', 'ایمان محمدی ده چشمه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 21:34:29', '2015-11-09 21:34:29'),
(252, 'asohrabi71@gmail.com', '$2a$08$UAsMoLr7aepahKecMUv6juxzdWzTmS.xw/ImKTSQY8eIr7Sp/8JqG', 'User', 'علی سهرابی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 21:38:56', '2015-11-09 21:38:56'),
(253, 'aboozar.shirazi@yahoo.com', '$2a$08$xaY9CSUoKhR8FR5vN1Uz8.zBRJhiApjW0Mox7ESNd2xpYuosa2F5i', 'User', 'abouzar', 'Active', NULL, 1, 20971520, 3251632, 17719888, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 21:40:48'),
(254, 'cmlvi.sh@gmail.com', '$2a$08$xT2gmyD8NA2W5nuvu6ceKeOOvw4mwOQcxSpSkxAkFUo0RpIJWolLy', 'User', 'shahab', 'Active', NULL, 1, 20971520, 17129087, 3842433, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-09 21:42:16'),
(255, 'ansari@alum.sharif.edu', '$2a$08$L3xUDeO5hPTzdRsCaL4Bq.pKFAgDZy0tS.62CCpi0rMLj8ncF0Hyu', 'User', 'Meysam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 22:17:18', '2015-11-09 22:17:18'),
(256, 'nebrahimpour@chmail.ir', '$2a$08$GLJyqmUJkN8JMKS7J4xLTeqwbdvIzTy4LPOxayM79WW8Rk5z.cNh2', 'User', 'نیما ابراهیم‌پور', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-09 23:16:44', '2015-11-09 23:16:44'),
(257, 'mahdisalehiun@gmail.com', '$2a$08$yoUZq0SqSD21pDsCZALuXuE20CuuGGK6dSPNKSflLQvUcuox9gKdG', 'User', 'mahdisalehiun', 'Active', NULL, 1, 20971520, 14247405, 6724115, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 02:33:26'),
(258, 'parisaphys94@yahoo.com', '$2a$08$d4XBy74lIPK16syncRNLpOFdzEmgUiWNLYchLyct13E24HQ8.6T/m', 'User', 'parisa bashiri', 'Active', NULL, 1, 20971520, 18135181, 2836339, '0000-00-00 00:00:00', '2015-11-10 13:52:42', '2015-11-10 03:24:21'),
(259, 'n_sobhaniye@yahoo.com', '$2a$08$nSKYbs0oQ8RSZjRB3ik71eDlcW40T/CDO4j.uU/xmwcJo0hxFAsgu', 'User', 'نیلوفر سبحانیه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 03:38:43', '2015-11-10 03:38:43'),
(260, 'sinamzus@gmail.com', '$2a$08$HSJHy53LFcZuPRPHfDbuIew7FNDoYIH31RNPzmQ06DwxjvyrGWGGu', 'User', 'Sina Mohammadi Zadeh', 'Active', NULL, 1, 557842432, 139269069, 418573363, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 03:51:08'),
(261, 'r_khaksarpour@yahoo.com', '$2a$08$awXkq51Vb0I6YauuieIPSetLgP60bs6wuO7S0GRIrkpcKuElksima', 'User', 'Reza Khaksarpour', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:16:50', '2015-11-10 04:16:50'),
(262, 'amirrezas@gmail.com', '$2a$08$0pbIEkdoV4WG63Fxma7yQ.JSZIpgXteZf3NwWRydo9QFKxjcYSyXW', 'User', 'امیررضا صداقت', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:17:44', '2015-11-10 04:17:44'),
(263, 'hamidimotlagh@sharif.ir', '$2a$08$azPmcLG5lCVkov18n8ivueKAGpJk5B5/X1gzuR8Nxr2.9QCCtSav2', 'User', 'روح اله حمیدی مطلق', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:30:02', '2015-11-10 04:30:02'),
(264, 'm7912183@yahoo.com', '$2a$08$FCBJyuNfV1mY09sjPaqzo.2aQ0szFvi2ytWfzE0Jhj6BB4bhZtqru', 'User', 'mehran', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:40:49', '2015-11-10 04:40:49'),
(265, 'meraj.sohrabi@yahoo.com', '$2a$08$upRf6bjS5A2jWcZ6ykqChuZC8eBN4eorpvENdqbjhYjDv8P36E4/O', 'User', 'معراج سهرابی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:45:03', '2015-11-10 04:45:03'),
(266, 'shahed.abbasi@yahoo.com', '$2a$08$z80HA5zyTC2rNSQZeavNSeQIRp/cFxjxyw5zR.0L2OOy0Cy./3uX.', 'User', 'shahed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:45:35', '2015-11-10 04:45:35'),
(267, 'jfarzammehr@yahoo.com', '$2a$08$gBedvTqWu1om9OeJwBXGMeMNzOrYP4/hqr.e.RAbtdtfwgLN9Doui', 'User', 'jfarzammehr', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 04:53:29', '2015-11-10 04:53:29'),
(268, 'e.habibi1367@gmail.com', '$2a$08$WPimS4BRYtEk4IjY5BC3AOQe6EB6Q7h9VTOAn8kIqQyE1tbaTsBTq', 'User', 'Elahe Habibi', 'Active', NULL, 1, 20971520, 16188529, 4782991, '0000-00-00 00:00:00', '2015-11-10 05:03:47', '2015-11-10 05:01:14'),
(269, 'z.meftahi@yahoo.com', '$2a$08$kpkkEChuN4VBlgp12MvlPeEXJnsFfZheQ/.bMulPkSiZ.N0YcTlpa', 'User', 'Asemane', 'Active', NULL, 1, 20971520, 20039668, 931852, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 05:17:16'),
(270, 'sheida.shakoorian@gmail.com', '$2a$08$w23i0EriITdmGz7QtaPRlOXB5dpKVH0vextMDXd/pgmsZ68hTt5V2', 'User', 'شیدا شکوریان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 05:22:30', '2015-11-10 05:22:30'),
(271, 'skhatibirad@yahoo.com', '$2a$08$44lhaC3OBUenkl4cUDIAFeXu6w1NTlb4uPEhxyanb2QjkUPTuqPCG', 'User', 'skhatibi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 05:28:26', '2015-11-10 05:28:26'),
(272, 's.saadatnejad@rayana.ir', '$2a$08$RSvjoIpshx81fJ2D5xgUDOlL3rNLyMBSqfmXT36pha5QG8TbjrRQW', 'User', 'saeed', 'Suspicious', NULL, 1, 20971520, 910174, 20061346, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 05:31:06'),
(273, 'reza.kh7@gmail.com', '$2a$08$7EIgrEp7QC9BZAUeJF8hJeIEltWHxmTKbBy4Iiddc//4TRcYEWraW', 'User', 'reza khalvandi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 05:37:29', '2015-11-10 05:37:29'),
(274, 'makan.etefagh@yahoo.com', '$2a$08$6BLUTlzLPXcx4FkksQ4RnuNRwdnR3/Ba2GpSxwQBQAe75t5Fzmpe6', 'User', 'makan etefagh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 05:43:38', '2015-11-10 05:43:38'),
(275, 'saralah_arand@yahoo.com', '$2a$08$xyZnkHHMMAvUmFb2hXw0fuFEavmJZ9NfeSAC0zXvO6Kw4geeGdzUu', 'User', 'ثارالله علیزاده ', 'Active', NULL, 1, 20971520, 9253484, 11718036, '0000-00-00 00:00:00', '2015-11-12 08:33:50', '2015-11-10 05:46:15'),
(276, 'h.shakiba@yahoo.com', '$2a$08$IfdgAcv78HLrYedzeHtZ9.3BMQyH25Qb3rMaH5Se5V8/ReE27If/.', 'User', 'hadi shakiba', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 05:46:32', '2015-11-10 05:46:32'),
(277, 'hrkhorshidi7@gmail.com', '$2a$08$gb0DQkWozeGfsLSzmd7ZIO4uJ1kY4qUTKwtp8QW7nDyCtSM3ToR3q', 'User', 'حمید رضا', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 05:48:06', '2015-11-10 05:48:06'),
(278, 'm.taghavi24@gmail.com', '$2a$08$3prsUxTk9BM6nH0sYME86eMUUNaBnppu/feqfOZ0ql/g6pADvqt5.', 'User', 'taghavi', 'Active', NULL, 1, 20971520, 1739640, 19231880, '0000-00-00 00:00:00', '2015-11-10 06:03:53', '2015-11-10 05:53:34'),
(279, 'kazemi_zangeneh@yahoo.com', '$2a$08$bYGwun8MV2MCPS9WMaOZWeo5A8GobsOltpxbSwzJWpQSBBsPeVTwC', 'User', 'fatemeh kazemi', 'Active', NULL, 1, 20971520, 20067340, 904180, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 05:56:11'),
(280, 'foroughi@che.sharif.edu', '$2a$08$Mo1wsXNiHczC9iyFyE6vruSM7bZ3dPGAFTIUGoaMh4UHUNAWxOhci', 'User', 'سجاد فروغی', 'Active', NULL, 1, 20971520, 14908641, 6062879, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 06:03:53'),
(281, 'katanish@yahoo.com', '$2a$08$Wv4svS2NtMVHlL13MfmvhuDRbkfLxgjWKa8lDhypi.21hujAse7Oa', 'User', 'katanish', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 06:16:16', '2015-11-10 06:16:16'),
(282, 'hamed_jafari_ae@yahoo.com', '$2a$08$6HNfW7KeAgXkBcKcQaLaRe.IOvBEcjW6rVG.l.KmbD2Q5KvMzqWSq', 'User', 'hamed ', 'Active', NULL, 1, 20971520, 3898226, 17073294, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 06:17:58'),
(283, 'nima_hajiabdolrahim@yahoo.com', '$2a$08$u1T6WIkDRG3L1sH6Mjlu0OuyVxZP8xqTThbWl0RxGGEcr7w4JdkUa', 'User', 'نیما حاجی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 06:20:28', '2015-11-10 06:20:28'),
(284, 'sadegh_ramzapour@yahoo.com', '$2a$08$8gBVrQOJyX6koraywF8B1.27uGtO2yjh9IpHbW4XLD.HW1MXQEN7u', 'User', 'sadegh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 06:42:59', '2015-11-10 06:42:59'),
(285, 'ysn279@gmail.com', '$2a$08$Uc9HPyE5rsjz51oNQMKhb.57SBUYC94iQB5x5A2KCp1G8//yj/a2K', 'User', 'yasin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 06:47:47', '2015-11-10 06:47:47'),
(286, 'masoumeh_ap@yahoo.com', '$2a$08$a6AFiiTqyKPAKqB2ba0uZupwocVq5JJFsZeKuNNW0Ay/87dVrJ8O.', 'User', 'Masoumeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:11:28', '2015-11-10 07:11:28'),
(287, 'h_jafary_khorramy@yahoo.com', '$2a$08$rxPU7lI64AbdYYHJ7fEh4ugjXOTG55By1700F1.WiyNvwSctOK99.', 'User', 'hamed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:15:35', '2015-11-10 07:15:35'),
(288, 'ahmadinezhad_adel@yahoo.com', '$2a$08$lubgNZUBxgyR2MTsHUYi1.jwW9l/Plgc9SZoM9H1wmbzKI3sFfNY6', 'User', 'Adel Ahmadinezhad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:17:45', '2015-11-10 07:17:45'),
(289, 'salehi.reza27@yahoo.com', '$2a$08$dExesrxwjH2tBGM4WYaPFeL954DU38y6kjL1qkIT.J8WmFWH64ok6', 'User', 'razie', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:20:47', '2015-11-10 07:20:47'),
(290, 'kh_immortal@yahoo.com', '$2a$08$1rkzZvND2eYwXRYYWy9okeRMUNg.lYRDtTFnNtpz7TdJXjUVxroKS', 'User', 'خشايار', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:22:33', '2015-11-10 07:22:33'),
(291, 'neda.bathaee@gmail.com', '$2a$08$DNHooZI0BQMtMuhNRR9pION.4Rb6P6dbfUxitd88Q/UamrBzYjHQW', 'User', 'marzieh bathaee', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:23:52', '2015-11-10 07:23:52'),
(292, 'maryam.gharghani@gmail.com', '$2a$08$8uygSuWBtflq5jqo3DuE8.naaE3ORbpxU3ncnRPKUvP8nMJqWFJjG', 'User', 'مریم غرقانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:25:47', '2015-11-10 07:25:47'),
(293, 'nafiseh.ghadiri@yahoo.com', '$2a$08$PObsxQZCaKCC7dTMxY6jC.razh4j3ZE6k7ffruVh0njfZjKqSdzse', 'User', 'nafiseh', 'Suspicious', NULL, 1, 20971520, 18378774, 2592746, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 07:26:33'),
(294, 'm.danehkar@yahoo.com', '$2a$08$9zflOp0LUnVukVeRTIJeA.9nNOBU4jD0b1jQTFcFN4gimcYuarVBy', 'User', 'محمدرضا دانه کار', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:30:41', '2015-11-10 07:30:41'),
(295, 'kazemiahmad70@gmail.com', '$2a$08$5kAmdsxHLqiCsKtqv2TWmO.V8Fvkz5R.tucuUw4gFyfNCv8FPa41C', 'User', 'akhmad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:33:17', '2015-11-10 07:33:17'),
(296, 'p_karami@yahoo.com', '$2a$08$5a8SzSiCSDDmCt6g3kVUL.hHBlz0WLyTcdYwqd7Chvg1sje64wm0G', 'User', 'پری کرمی', 'Active', NULL, 1, 20971520, 15337335, 5634185, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 07:36:13'),
(297, 'tashakori_sh@yahoo.com', '$2a$08$RdQUQL7L06ebcnq84iVAju9moRGjC58hPm1gxBM5UEypmsEoKF/B6', 'User', 'shabnam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:42:10', '2015-11-10 07:42:10'),
(298, 'pkhanipour@yahoo.com', '$2a$08$GaOxP2Zj1Z7O4xt57HhwFOY19xafZoyiJWdGk9j9OcF39WxbAA3Rq', 'User', 'pkhanipour', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:44:37', '2015-11-10 07:44:37'),
(299, 'hfalahati@ce.sharif.edu', '$2a$08$2plUjDxZC1ipdmbM0jWw9OkTA6wrijJPp34nsGR5W2LXbzMKWQV3i', 'User', 'Hajar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:52:22', '2015-11-10 07:52:22'),
(300, 'i.eghbalahmadi@gmail.com', '$2a$08$3k20xps88WWawIYit9FdJ.xaseDlB4UdG05SHRwVL1ikWRwJpMl86', 'User', 'محمد حسین اقبال احمدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 07:52:55', '2015-11-10 07:52:55'),
(301, 'javad.amnian@gmail.com', '$2a$08$n45668N5PtPZfL91hq0ySOkeGYdlfs3U0r7tk3NLDyeXOBuaD5hxO', 'User', 'جواد امنیان ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 08:07:10', '2015-11-10 08:07:10'),
(302, 'hassan.hafez.kolahi@gmail.com', '$2a$08$gBFyUkm08A0N962IrkGISe.BRess8GPkjUM2ojqWcR6Hei7h5N/SO', 'User', 'Hassan', 'Active', NULL, 1, 20971520, 15155079, 5816441, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 08:11:07'),
(303, 'jjk73058@foxja.com', '$2a$08$POQZlGHKmdNMUWQ3hZbEJesPQfmCo/6E2zPPsujH5nGhcjhER/O8C', 'User', 'gholi gholiani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 08:12:59', '2015-11-10 08:12:59'),
(304, 'abbas300pourdeilami@yahoo.com', '$2a$08$31VDtqPb4VVxccCMOVgFtuz1jOOP/8eqMtShoWk4iFOf0WGyvZ5We', 'User', 'Pourdeilami', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 08:15:16', '2015-11-10 08:15:16'),
(305, 'zeynab.barzegar@gmail.com', '$2a$08$f6w3fKe8VbbTTGf9NSpk2.TE/45YjtFT/TUMA.Nao86z5rBvnvcTW', 'User', 'Zeynab Barzegar', 'Active', NULL, 1, 20971520, 15420818, 5550702, '0000-00-00 00:00:00', '2015-11-10 08:24:14', '2015-11-10 08:19:32'),
(306, 'kvaezi@ee.sharif.edu', '$2a$08$20w7PUWniP3NJJAh8hYVo.lrMyYHsgBQoMM7wb3qpGq0sGXs1MjXy', 'User', 'Kaveh Vaezi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 08:23:24', '2015-11-10 08:23:24'),
(307, 'alikhaki136@yahoo.com', '$2a$08$qkeW16RZ3MT0YmXBqvyo9uJLCJsVD7bh0BgV7GfmqzWFuPFm1jkyG', 'User', 'ali khaki', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 08:32:14', '2015-11-10 08:32:14'),
(308, 'sajjadsahaf@gmail.com', '$2a$08$jLycupZhctvELSc1cujjcOZSYsb9wvR/CXXFmKT1PNryBwLkko34i', 'User', 'sajjad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 08:42:33', '2015-11-10 08:42:33'),
(309, 'saeid_kshf@yahoo.com', '$2a$08$dmlpeIVbaaWO7pTxjW3greRIOYp043h8yDQ6U.7DjkWy6vFY7Xx3a', 'User', 'saeed kash', 'Active', NULL, 1, 20971520, 14056086, 6915434, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 08:58:30'),
(310, 'bizdik3@yahoo.com', '$2a$08$hh8pzNrVc3v1UPVM6Fa1xONIAvyxPRnSOoqxumMs4wzgdZAUkwWKK', 'User', 'shahrzad hanife', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 09:01:33', '2015-11-10 09:01:33'),
(311, 'mard.manteghi@yahoo.com', '$2a$08$3Lv41FE7ONAtqu7T9BaIPOu9rhtN9eQh4E6yVJ6hBr117kL92jAmC', 'User', 'manteghi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 09:05:29', '2015-11-10 09:05:29'),
(312, 'sharifriab@gmail.com', '$2a$08$VakrPTP43hZb0rGAI9DZe.UJjA5Z5Otw6Y8oUanVbX5yjeYkyOsaO', 'User', 'mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 09:11:39', '2015-11-10 09:11:39'),
(313, 'zahrakameli69@yahoo.com', '$2a$08$x4p09hKhDQmiUyyjuhmjlePT/GPlV3UN127r1CWU.jyRxZJfeepyS', 'User', 'zahra', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 09:30:24', '2015-11-10 09:30:24'),
(314, 'miladsetareh1989@gmail.com', '$2a$08$RLI204Ws3QeTkOmZgBFJK.CNX71MiFvDz.O3n5y8X0/csFWuHdKWO', 'User', 'ميلاد', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 09:37:22', '2015-11-10 09:37:22'),
(315, 'mahmood_atarodi@yahoo.com', '$2a$08$VlSz8QP2KbFysugK3wxfT.uY0ubAOHWUcrhju1PnEi9e9xmlUP2HS', 'User', 'mahmood', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 10:12:55', '2015-11-10 10:12:55'),
(316, 'mhkhalesi@yahoo.com', '$2a$08$7My47Tw3LRva9MXoQELu6.SjGFkIrSWKTOrVT24M6lhhSUDcSrbSK', 'User', 'mhkhalesi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 10:43:22', '2015-11-10 10:43:22'),
(317, 'mrbehzadi@yahoo.com', '$2a$08$noZzjha9sfYKvr3GsQJmNeakcp7s09HzmoVl21aNdIt4XDDARi56W', 'User', 'محمدرضا بهزادی مقدم', 'Active', NULL, 1, 20971520, 13439057, 7532463, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 11:27:14'),
(318, 'mohammad_tavakoli@mech.sharif.ir', '$2a$08$zGujtz0G8SIoE4Qf6MyXS.cGlLGRAWbEALj/WqJDW4wtoMq1JYowG', 'User', 'محمد توکلی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 11:30:28', '2015-11-10 11:30:28'),
(319, 'barbarimahmood@gmail.com', '$2a$08$C1lffsJ6hDbUhkYwrjzzLOM2.H7T/9cEieTIhsOl9Ckc8chuLMNou', 'User', 'mahmood', 'Active', NULL, 1, 20971520, 16277916, 4693604, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 11:33:49'),
(320, 'mohamad.khorshidi155@yahoo.com', '$2a$08$yer0BH8wW4MEuRdWOJLh4.arJn.MKM1QCEqKuVRg.d/LleNLRLerK', 'User', 'محمد خورشیدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:16:37', '2015-11-10 12:16:37'),
(321, 'jahani.peyman@gmail.com', '$2a$08$9EtmuTOEXlKlZNfG3yfomOKafPg9yEAhq5EUiEVOZVBG8WwYRfHw.', 'User', 'پیمان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:20:13', '2015-11-10 12:20:13'),
(322, 'mortezamahmoudi99@gmail.com', '$2a$08$tDMkQvb2AdHpJkftQCFZxezKi8nhG9Z5nHQ0Q.dimMt0.FKGf.R8u', 'User', 'مرتضی محمودی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:20:43', '2015-11-10 12:20:43'),
(323, 'm.feilizadeh@gmail.com', '$2a$08$sFZzQVkgBR4fB0RjFiSbY.u1UQenmvc8dpAgIPbotYcjzIgLkNHx.', 'User', 'Mehrzad Feilizadeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:22:47', '2015-11-10 12:22:47'),
(324, 'hossein.forghani@gmail.com', '$2a$08$u88AESSumrMNwL7rVK9krOu48cdmBasmQD7LRm.0NxilrfeAh/0MK', 'User', 'hossein', 'Suspicious', NULL, 1, 20971520, 6456080, 14515440, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 12:23:02'),
(325, 'yousef_dehghan@yahoo.com', '$2a$08$5skTUp0WLU0cXPAK3YiTi.pN1Jw7.emrAC.wjf5COXZlPPNryq1T.', 'User', 'یوسف دهقان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:25:00', '2015-11-10 12:25:00'),
(326, 'vahid.jafariazar@yahoo.com', '$2a$08$EaZ0zUg6SKyhoeipi1oE3uOu4tILvwcsxxR0rkhum3e/vOIuiZkIS', 'User', 'vahid jafari', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:32:17', '2015-11-10 12:32:17'),
(327, 'noghabaei@alum.sharif.edu', '$2a$08$NitIn5gqIWy9C8xx2kugtOOI3E31SAk.qvM0BC9zIFkAB3w8Hl2/y', 'User', 'bahram noghabaei', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 12:43:15', '2015-11-10 12:43:15'),
(328, 'meehhhrrraan@gmail.com', '$2a$08$ePB2EMdQtmJKTBCdrpG52eWgozVEm3aOQNzw.vKm0XzTrYkR5h5wu', 'User', 'med edem', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 13:14:32', '2015-11-10 13:14:32'),
(329, 'i.rajaeenezhad@yahoo.com', '$2a$08$nHMB7B7ploIXFo7vZhWrNO/LwRBIGBzR5seAO.7n2Ni7nmQMJUXTy', 'User', 'ایمان رجایی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 13:29:20', '2015-11-10 13:29:20'),
(330, 'amir.1371hm@gmail.com', '$2a$08$9TAFoErMU2xTRZOlhua0jejJo6LVfnDuPPpM.v2MLXZW6LNW75vd2', 'User', 'امیر حاجی مزدارانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 13:48:17', '2015-11-10 13:48:17'),
(331, 'amirhatami1000@gmail.com', '$2a$08$7neQyWC9yUdQ62nqZuLcsOx/p1gMZcCM2xyOFapXXsKziYgulN1XW', 'User', 'amir reza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 13:51:12', '2015-11-10 13:51:12'),
(332, 'f_ghasemi_82@yahoo.com', '$2a$08$rKnFabTYQAQppbWKzRrtL.LAWYm9I0ze5RYazdfnviBx6F7cxGOgC', 'User', 'ghasemi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 13:55:14', '2015-11-10 13:55:14'),
(333, 'farhad.seraj@gmail.com', '$2a$08$PjM83wFI4ZudROVsnQiVsOsNyIed8kebzf631Y8qKrGJMObGMLpju', 'User', 'Farhad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 13:59:11', '2015-11-10 13:59:11'),
(334, 'gharibe.nistam1@gmail.com', '$2a$08$tP27j9Abx8Ly9h0OxYigVOCG1wDOPhJcp2gz1oF0Cy5pxGZXkF3r6', 'User', 'gharibe', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 14:01:11', '2015-11-10 14:01:11'),
(335, 'faezehkhakbazan@yahoo.com', '$2a$08$U0pcG9s8fEvS1FeCl8jfbu0cSMDFairjNep/2aAFG96I6IXByWc9S', 'User', 'Faezeh64', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 14:39:59', '2015-11-10 14:39:59'),
(336, 'amirhosein.m@hotmail.com', '$2a$08$ityw1sgvRmo1RRzD5zmeGeH9TWw2fjUPrSI/Mg5CE7OJQRdCwMKzC', 'User', 'amirhosein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 14:54:44', '2015-11-10 14:54:44'),
(337, 'alinourian872@gmail.com', '$2a$08$7NSd7WI6dNENYEix5dy9TeKg.WGeE7x0WV1mG7FXxcOP0vCEwPs66', 'User', 'علی نوریانی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 15:09:28', '2015-11-10 15:09:28'),
(338, 'm.hasan.ghasemi@gmail.com', '$2a$08$fl5TXh5HHMqKCjKrk6LPI.c8EkxGunmC8eDolRaAvEX5GgSmx.dEK', 'User', 'aaaaa', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 15:17:28', '2015-11-10 15:17:28'),
(339, 'ghasemr110@gmail.com', '$2a$08$NgOqiq5zf4wg6rT7y9nbz.URU8BwvOBXmTmSOkL/8qJbC3o7.V4nO', 'User', 'ghasemr', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 15:32:43', '2015-11-10 15:32:43'),
(340, 'hsnkhaki@yahoo.com', '$2a$08$YlKlb9rz19gCUPEaKwnBSehLbXxdfH7hcEfv6pQWS1ZXGq/V/y6rO', 'User', 'hossein khaki', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 16:03:23', '2015-11-10 16:03:23'),
(341, 'mohammad4692@gmail.com', '$2a$08$TIAMfixOEl8PL9hWKeD3YumEysw.fFi27G3I5.caphrMrSDdsyptK', 'User', 'محمد خ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 16:32:48', '2015-11-10 16:32:48'),
(342, 'myaali_ee@yahoo.com', '$2a$08$ao1eCgrn2TVuvuHjtwCyJu49V4shdksolJGJrflDDAmEipX4wnwcq', 'User', 'Mohammad Yaali', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 16:33:12', '2015-11-10 16:33:12'),
(343, 'yaser.851179@gmail.com', '$2a$08$irFiMLhPSKAxKtNzg13WPubTDodF3EqjJ2Zq8fQNxagbvLUknOHYO', 'User', 'یاصر افراسیابی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 16:40:07', '2015-11-10 16:40:07'),
(344, 'alirezakhadir@gmail.com', '$2a$08$ZCWkqsir1SJ4PBSQjvE0wuXOdQZMsfSm3Ev1ZhTkqid5Vf8g5ToTu', 'User', 'alireza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 17:28:25', '2015-11-10 17:28:25'),
(345, 'rasulsavari@yahoo.com', '$2a$08$NwSyJ7IpEtVaNUmQIOdYBeM0SBz5RaIrOFseXnMXs258xhX0hYrG6', 'User', 'rasulsavari', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 17:29:39', '2015-11-10 17:29:39'),
(346, 'najm1668@gmail.com', '$2a$08$akkM7TDZI0EvhgYbXeaNAebOMLTC6sb5sSn.FP9mMBChLhOnPX1ye', 'User', 'najmjak', 'Active', NULL, 1, 20971520, 10182845, 10788675, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 17:31:25'),
(347, 'najm16968@gmail.com', '$2a$08$41tENR8jyEOMRu32p75ysunUu9grhEJ8nEAL5SieNGRQlF5M/Lg5S', 'User', 'najmuytr', 'Active', NULL, 1, 20971520, 18632150, 2339370, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 17:49:45'),
(348, 'saeid.kamali@yahoo.com', '$2a$08$5YpreG0iZubzIOe9vwgbjOulbXKe7j8Yr3XSuIgOldAAlz63v2CW6', 'User', 'saeid kamali', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 18:06:44', '2015-11-10 18:06:44'),
(349, 'mohsenmazidi@ymail.com', '$2a$08$AfcR18mryg4Aj3WC8jtBbus4aKLbWV.x5qlJneYQ2omQtWARUoXWK', 'User', 'Mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 18:09:23', '2015-11-10 18:09:23'),
(350, 'arefeh.bajalan@yahoo.com', '$2a$08$Cc4i4z9G5oJJalS5MDJCRONWtyj6ukmJbKl3VvHLs5F55GfxQzuA2', 'User', 'زهرا باجلان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 18:43:59', '2015-11-10 18:43:59'),
(351, 'miredris_s@yahoo.com', '$2a$08$cDnriWMaA9y6QNk62codeOhjvJMMCpiXrY8VVBr2apbpj9xrcge4m', 'User', 'edrissohrab', 'Active', NULL, 1, 12905873408, 14378764, 12891494644, '0000-00-00 00:00:00', '2015-11-10 18:53:11', '2015-11-10 18:45:27'),
(352, 'torabi.parisa@yahoo.com', '$2a$08$edUZ8kubNsrdetkySU6GVeTw8okIZFPrSO2y.yuC7iDQho/m.fm6e', 'User', 'Parisa', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 18:48:20', '2015-11-10 18:48:20'),
(353, 'mohammad_chavosh@yahoo.com', '$2a$08$Tk0AzQ2DsaTD8vcbKYFPDumxtuKdBhKIs7fBspZBKQClDHUO0lypW', 'User', 'سید محمد چاوشیان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 18:49:11', '2015-11-10 18:49:11'),
(354, 'mehran.qate@gmail.com', '$2a$08$jmy86oXc6A9uVc7LeZRgauY..cuuC.zTld7ARETQi.VHbOn0qGAMS', 'User', 'mehran', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 19:20:08', '2015-11-10 19:20:08'),
(355, 'ma.maddah@yahoo.com', '$2a$08$AzwRS2QUNwcTx2MXNmAT3.z89uN8SC3.c421uMkoAa/WyKX6Glkqe', 'User', 'noghreh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 19:39:20', '2015-11-10 19:39:20'),
(356, 'rahmani.sajjad@yahoo.com', '$2a$08$QZEe8qKXzso8I4sE09F7r.p8zjLe3wxsxgCHgHqZ8Ch9sszWhFiG2', 'User', 'sajjad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 20:54:51', '2015-11-10 20:17:45'),
(357, 'z_abedini2901@yahoo.com', '$2a$08$oacNA0McF0ltPV2aL7M4supHi.3XlmS5qVSvstDM8qCc7TW9tUrpW', 'User', 'zeinab_abedini', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 20:32:45', '2015-11-10 20:32:45'),
(358, 'arashmohammadi73@yahoo.com', '$2a$08$qf2ZMfOQH0CagsTjwMllSeHS4rnC2O./ZylpGe9vHfIJYgRDF08Ee', 'User', 'aarash', 'Active', NULL, 1, 20971520, 6533235, 14438285, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-10 21:59:43'),
(359, 'kabir_hussein@mehr.sharif.ir', '$2a$08$JKxZNJB5RQvBCBK7mOxhv.94DYOE8/499A/rjI6jFsGZzXATf7yCK', 'User', 'Hossein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-10 22:50:02', '2015-11-10 22:50:02'),
(360, 'n.soudi@ymail.com', '$2a$08$StVmohs4bwAxWCIJsPohUuJ2Dv9UgxgoyQifqSIwFeFYa.FMJ7y0i', 'User', 'Najiba', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 04:57:25', '2015-11-11 04:57:25'),
(361, 'miladsefidgaran@yahoo.com', '$2a$08$3HXV08D4NM0sZH7yZrTCQOdkqgw5pbU6I4ERFarblPzWl68wYqCRe', 'User', 'Milad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:07:01', '2015-11-11 07:07:01'),
(362, 's_seifozzakerini@yahoo.com', '$2a$08$54C7d0kRcnFaKYsFvk3sneo0Vo0ymd6P7H.O9L8EdQiuee3VBr8I6', 'User', 'Sajjad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:09:05', '2015-11-11 07:09:05'),
(363, 'niyousha@gmail.com', '$2a$08$yMY3i9Sc57Wa3jDJDaMmt.nhOLTdWwrfu6.y.pdP0CFVodEc52X0K', 'User', 'نیوشا ببرافکن', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:10:36', '2015-11-11 07:10:36'),
(364, 'hesam.zandi@gmail.com', '$2a$08$M3M8BG1dRtLs0EJzwZX6veCeJaR8JkJnMj/Xbos9g1SGwci3JGAJS', 'User', 'hesam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:10:43', '2015-11-11 07:10:43'),
(365, 'narjes.khadir@yahoo.com', '$2a$08$26MRYvqJwLwhvZkMewZxEum9Xn0gC0efpww3dAs0UGdNv2s4Q8dSK', 'User', 'نرجس خدیر ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:12:33', '2015-11-11 07:12:33'),
(366, 'm_saeidi16@yahoo.com', '$2a$08$uoL1f3OKkJCL4uMJ9gMrU.IAh1/pC3knUxR4k5Fx/FA147etQKDWe', 'User', 'مریم سعیدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:14:01', '2015-11-11 07:14:01'),
(367, 'amirbidokhti@yahoo.com', '$2a$08$uWD5basQTiii9ZECtay4keu60krHzZ3GzpE6YB00bDOQWy0bgxn3K', 'User', 'امیر بیدختی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:16:50', '2015-11-11 07:16:50'),
(368, 'maryamabedy2000@yahoo.com', '$2a$08$mk5psAC0c3KaQsrUSM7dAu7XuZo6gaacq/UpqjN5S/cODslP.d3iG', 'User', 'maryam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:18:25', '2015-11-11 07:18:25'),
(369, 'mohammadrahdan89@gmail.com', '$2a$08$Cb4g5USDXOsXnHjBabOoKeyL9Te6120zipfiCo9DNOXaGfZ.qxDja', 'User', 'mohammad Rahdan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:20:52', '2015-11-11 07:20:52'),
(370, 'baghili@yahoo.com', '$2a$08$JloOfUjSHQCDlzsBxibHGOmnOrMVhfT4wuW47cGmNz8Zi1OPQFX8i', 'User', 'babak aghili', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:30:44', '2015-11-11 07:30:44'),
(371, 'kn.sara@yahoo.com', '$2a$08$FR9XFTKuyj3fizalnxNKFehQCc1Wfl4fCnMT.wZ.HYufTrXX8yOwS', 'User', 'sara khayat noroozi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:31:38', '2015-11-11 07:31:38'),
(372, 'pro.gangster@gmail.com', '$2a$08$kCLbrktOfN5qAVbmChdff.IbkiDGaXMgoVKTt/Xl01GIWQujtzSze', 'User', 'Mohammad Miri', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:38:45', '2015-11-11 07:38:45'),
(373, 'yaskhanloo@yahoo.com', '$2a$08$vJyTnf9VMOjRdTcRV5yIBu00rIHPjGHob26YxegBIB5u9KVqPiqDW', 'User', 'یاسمن', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:39:41', '2015-11-11 07:39:41'),
(374, 'hamedhelisaz@gmail.com', '$2a$08$3vTYEw37s3Xb0cIdx6MhsO.Pgd4Zcb2S6JV0DyBeWJgromCqRYFPO', 'User', 'حامد حلی ساز', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:40:30', '2015-11-11 07:40:30'),
(375, 'sobhan.dadkhah@yahoo.com', '$2a$08$w3JT6bRQMu0jqxtDtv2bMuraPlZQcFu6OHvn8FIPnYgEoNc9yiG2y', 'User', 'سبحان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:42:32', '2015-11-11 07:41:01'),
(376, 'mmh.moradpoor@yahoo.com', '$2a$08$fSGIvqRa300uGWur4UHLLOShoaLyOIf6eDlEKyFS.han/MolN2Q2m', 'User', 'Maryam Moradpour', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:42:17', '2015-11-11 07:42:17'),
(377, 'zeinabshariaty@yahoo.com', '$2a$08$Vn088P9MjyVqMxGzH0Zia.vx/EWzMI6cg.rj6O6GNVzHwfeUNpHLK', 'User', 'z.shariati', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:44:57', '2015-11-11 07:44:57'),
(378, 'rozhins@yahoo.com', '$2a$08$GFEpWRSesSDBZqY0EW2KReTV3fD5x/gMomt9A9GjGO2Cn8IPHIx5i', 'User', 'روژین صبوری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:48:43', '2015-11-11 07:48:43'),
(379, 'hossein.heydari.ee@gmail.com', '$2a$08$4TG2DNOJJK2JQhDq3JXXx.iZ5TruAiW0doinNflqWfntkkPkojEk.', 'User', ' حسین حیدری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:50:36', '2015-11-11 07:50:36'),
(380, 'r.samadi.b@gmail.com', '$2a$08$eNlIJh1oxRiLY5e9fvh9uOUjyZJxbhTzJHqWfjeGLVdT/UNbMeZnW', 'User', 'roohollah', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:54:50', '2015-11-11 07:54:50'),
(381, 'mkamarei@chmail.ir', '$2a$08$s86l4OTXcog5An1DI29bM.lFMzmOmtMMW4rGNIGciIxIGwrDTxH4K', 'User', 'morteza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:57:48', '2015-11-11 07:57:48'),
(382, 'farnaz_farman@yahoo.com', '$2a$08$YTUQ24r9mU7xw1X4dx7YuuWRrADysiR8svcRouTugZDDpfqXKadae', 'User', 'Farnaz Farman', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 07:59:12', '2015-11-11 07:59:12'),
(383, 'mjavadhd@yahoo.com', '$2a$08$8ajn8CsWwIIgFpgJBUy3XuMoo1RQd4DXsZw7EjAzQZqIaRuOIA5Gu', 'User', 'MJavadHD', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:02:56', '2015-11-11 08:02:56'),
(384, 'saeedmaleki92@gmail.com', '$2a$08$1QC2BgJRxpNuWIwcQpgc2uv9.60h/5YlOq0RnXMnFanYLkBxJu.O2', 'User', 'saeed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:04:44', '2015-11-11 08:04:44'),
(385, 'amin_najafiamin@yahoo.com', '$2a$08$vuNmpaow4mWCtqXG5ypRxuvdEs28aRefcv0OqpjKIBwVOYS8WgIhm', 'User', 'Amin Najafi Amin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:11:03', '2015-11-11 08:11:03'),
(386, 'mirhadi.rahgoshay@yahoo.com', '$2a$08$YBg74wy5H4vlkB2m4CIFj.8x4vgc1H0tKTxoUmZtdPD7TI.00/UuG', 'User', 'Hadi Rahi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:17:52', '2015-11-11 08:17:52'),
(387, 'seyyed.reza.kazemi@gmail.com', '$2a$08$oIPcJPO1VIuFcYqiOJnf6u9Cbm3wbB6oDN/yoixIXI.PV.9A2Xkk2', 'User', 'sedreza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:18:28', '2015-11-11 08:18:28'),
(388, 'ali_reza_91@yahoo.com', '$2a$08$E88RqUTq8FJGydLZWF3DH.0rZf56wOmsXmIWeg.Sq0f3UKnulVi.G', 'User', 'Alireza Mirshamsi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:22:17', '2015-11-11 08:22:17'),
(389, 'alireza.ghalam@yahoo.com', '$2a$08$gjvxtDfRW9BcitCbfN2zAevOuJX1NWJqrJDdFaeO5ynGe5D4riYRK', 'User', 'alireza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:29:19', '2015-11-11 08:29:19'),
(390, 'saeed.sheikhhoseini@yahoo.com', '$2a$08$4OdtivaYbfNhboBQ6d67AeN4aSIzBNuu0P94Gn6MikjX.tO12uV9u', 'User', 'Saeed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:30:22', '2015-11-11 08:30:22'),
(391, 'pouyaadn@gmail.com', '$2a$08$kNMSZ3Sg1XgmcQ2tDh8Ya./oz0t6iN25VL2rMAEOV5csbYB9NMvkG', 'User', 'Pouya Adn', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:31:04', '2015-11-11 08:31:04'),
(392, 'mrokhfrooz@gmail.com', '$2a$08$SNDlPdf2Zc25dt2y11gOWOx9Bi.2O0M3jD0TbFNIo9L.XXMIoX9oS', 'User', 'mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:42:23', '2015-11-11 08:42:23'),
(393, 'zahra.hasanpour72@gmail.com', '$2a$08$uzyEoItiLFSJ3J1sUXSqme1LyypQM6CYc040fCYUllySO9bcwkWsC', 'User', 'زهرا  ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:44:06', '2015-11-11 08:44:06'),
(394, 'javadmousavi91@live.com', '$2a$08$YQCHW2hEekRc4AQfctnxCe34o0/05alLQIYutKSmz5epcZsVmgvfu', 'User', 'javad mousavi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:52:17', '2015-11-11 08:52:17'),
(395, 'mm.rezai@gmail.com', '$2a$08$2VeGOyNBhHzTQeJojF49quDdTADZ17jad.ycFl9X0mzBSHU294Ejq', 'User', 'Mahdi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 08:53:06', '2015-11-11 08:53:06'),
(396, 'haniye_zare@ymail.com', '$2a$08$5R0IThGWOEZdXIYfy3u1G.iQYdcjrYkH.4nfTjur/18WYysUuR9DO', 'User', 'elahe zare', 'Active', NULL, 1, 20971520, 17223836, 3747684, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-11 08:56:29'),
(397, 'sina_sedaghat13@yahoo.com', '$2a$08$p5eOcJRc4XyTHsd9YBMEa.HAI.YK7Ujutmglv32e0YknrOIH9Yn56', 'User', 'Sina Honesty', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:02:12', '2015-11-11 09:02:12'),
(398, 'arfaghaninejad@dena.sharif.ir', '$2a$08$aNMDwGELiXZEdn3kmJe7ruON7anUquWnSrRwpxGaFS6x/eBlZFLZy', 'User', 'ارفع غنی نژاد', 'Active', NULL, 1, 20971520, 714684, 20256836, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-11 09:03:37'),
(399, 'sepantaminoo418@yahoo.com', '$2a$08$uS9yKfc8grV5JwpjEAqo7.4Px0vyrNib986MDeS4DdO2la6v.U78a', 'User', 'mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:04:17', '2015-11-11 09:04:17'),
(400, 'amirsonei@gmail.com', '$2a$08$BhTW7fCLZbzofzZj7Pbgp.6dLqtzza9fBPxyRri/9Mcd3dDP4uUri', 'User', 'amir sonee', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:05:10', '2015-11-11 09:05:10'),
(401, 'hd.alzd@yahoo.com', '$2a$08$mLEUootWJAtuu4kIAkNyBegXTl3YbmQDlVonwe/o8ghEABnFaTKs2', 'User', 'hadi alizadeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:13:03', '2015-11-11 09:13:03'),
(402, 'mahdi1001@gmail.com', '$2a$08$hcxSM6NLBc4P8b3Gn4X87e/LhFbu72UEEG9DEM7x5lXNpmJ.lPU2i', 'User', 'Mahdi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:30:52', '2015-11-11 09:30:52'),
(403, 'omid@post.com', '$2a$08$2UehUYcEIMFjJv2xiMfvreMVfIt2DwfgcisTTnpdRHBlw1BO6FwMq', 'User', 'omid taheri', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:33:54', '2015-11-11 09:33:54'),
(404, 'a.seif67@gmail.com', '$2a$08$b1FL8O1OX69Opduz7FycL.hOAiivZwyuQGrV5e5JJtSwPAIBIFSDW', 'User', 'a.seif67@gmail.com', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:41:20', '2015-11-11 09:41:20'),
(405, 'eijadi3@gmail.com', '$2a$08$dFn7EBMLwxhV4yNuZfoCK.xvDYxVeJU3zbkNONYQj60FcdCWdykPq', 'User', 'Eijadi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 09:42:09', '2015-11-11 09:42:09'),
(406, 'amirala.rahmani@gmail.com', '$2a$08$ioNQiMW7uy3en8DH6qS85uY82uJumE0rc5mbW68Zve.6O6n/bU2MW', 'User', 'امیرعلا', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 10:14:48', '2015-11-11 10:14:48'),
(407, 'abtahi@mech.sharif.ir', '$2a$08$zZsPBeN0MH95luKwlEv0k.py.6gNOtEPm8hQvxf9QafJ6mPMPd6vK', 'User', 'mansour', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 10:17:07', '2015-11-11 10:17:07'),
(408, 'sm.zandavi@yahoo.com', '$2a$08$Y02DiefbeIVP2noCK0CoJeJES8rtr/QWyjn4tKxcM63i6G1k.U6ui', 'User', 'seid miad zandavi', 'Active', NULL, 1, 20971520, 18994313, 1977207, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-11 10:17:54'),
(409, 'ghorbani1363@gmail.com', '$2a$08$lyaC817oSuMduQtw0mppzusyiy4NDmVjATbOZATjahIiTR.0xyfa6', 'User', 'saeed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 10:31:11', '2015-11-11 10:31:11'),
(410, 'madastan1@gmail.com', '$2a$08$DbBU7BHKUq8I9M0Dg7nZOedQTE9WXH5lOQMj.5RkOmBv2YROkDcy2', 'User', 'محمد علي', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 10:33:48', '2015-11-11 10:33:48'),
(411, 'm_ramezani1371@yahoo.com', '$2a$08$hMeSOvSqD86iwDyCUSiXpulJFx5HIvfRLM3WXuLAk.TFYK4SNQMfu', 'User', 'isco alarcan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 10:36:34', '2015-11-11 10:36:34'),
(412, 'tavakoli_mmehdi@yahoo.com', '$2a$08$nIgUFgMYzdsD5dl6HFmiRuGTcC8cYvjgKdokf0EhqtF54PFOOFi4S', 'User', 'mmt22', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 10:58:57', '2015-11-11 10:58:57'),
(413, 'neshati.ali@gmail.com', '$2a$08$CylYp3lwL4mmMK6aXfNswO6iT0fY3HY1Y0OiQ35OFt/pT5mom0jCW', 'User', 'ali neshati', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:10:53', '2015-11-11 11:10:53'),
(414, 'h_ghorbankhany@yahoo.com', '$2a$08$WsS1Lm7q8OkOi2VGjiGeTuEOqij4lidHLzkEDwfoRWx.At0PV5E3O', 'User', 'ghorban945', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:20:19', '2015-11-11 11:20:19'),
(415, 'maryamoa67@yahoo.com', '$2a$08$dwnl3bHyDuM6bDRPkPthYuoI1eJdYNv/b10Vm3B0FL7VDaluy.au.', 'User', 'maryam', 'Active', NULL, 1, 20971520, 15053517, 5918003, '0000-00-00 00:00:00', '2015-11-15 09:08:01', '2015-11-11 11:24:03'),
(416, 'h_soltani2001@yahoo.com', '$2a$08$HPMVHrBSP1kJpFJrBClgpev6t1oH8ey1wDc00E5PmWNa9P8YGHeJ2', 'User', 'حسینعلی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:24:23', '2015-11-11 11:24:23'),
(417, 'moayedmojtaba@gmail.com', '$2a$08$913lnXL47zefh6Po1A5bYeNH9ifTncmE3rwEVsGJaO09XKsjsutW2', 'User', 'مجتبی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:24:49', '2015-11-11 11:24:49'),
(418, 'h_seiti@yahoo.com', '$2a$08$TxR8XDOBOg2GPSAQHpaBIu36L6xuUSVMq.xuc.WJ0eqhDwM1ATn7e', 'User', 'حمیدرضا صیتی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:35:43', '2015-11-11 11:35:43'),
(419, 'e.orouskhani@gmail.com', '$2a$08$5o7m9muBti2gK2xFi3MLqODPhmdWOjXHHYg339ma8eqeWkhsdZG.i', 'User', 'اروسخانی', 'Active', NULL, 1, 20971520, 4195908, 16775612, '0000-00-00 00:00:00', '2015-11-12 20:39:34', '2015-11-11 11:39:01'),
(420, 'mmbahador@gmail.com', '$2a$08$OiNB89ZrF5o6tDWV3NT2p.i9/XfBo1BnKhLhlUNjcXQFtkh3BXabW', 'User', 'محمد بهادر', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:50:30', '2015-11-11 11:50:30'),
(421, 'elt_ahmadi@alum.sharif.edu', '$2a$08$jEBSEHOfS1mYUrbr1xgccu.0X53AjmrC7.CwyVCmHDkILorK/I1mS', 'User', 'eltefat', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:52:29', '2015-11-11 11:52:29'),
(422, 'mdmmomenirad@gmail.com', '$2a$08$LRAjE5zbLzjnwz9CbJ4W8uVaq99uLF2JXRcRBvrG9LSpApxHhJwT.', 'User', 'mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 11:53:13', '2015-11-11 11:53:13'),
(423, 'aliahmadikia@yahoo.com', '$2a$08$VgxYbnK8tgZtBHQ9h8d35.d2BuGhTM00qp3exsid68eUqvXqe1JSq', 'User', 'ali ahmadikia', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:07:48', '2015-11-11 12:07:48'),
(424, 'ntf.farrokh@gmail.com', '$2a$08$LSNZb3wOgLutZVVwQ5y6LeoZ0fPpuxJw3c58VSuMrnXwyWnRSGyue', 'User', 'najibe', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:13:06', '2015-11-11 12:11:07'),
(425, 'aghakashi@gmail.com', '$2a$08$RkE8gHWVjrA4wTwGVOZnQ.8lfMpUiKNXMBVnMCRyZ0MUiVA/6RE2K', 'User', 'vahid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:24:13', '2015-11-11 12:24:13'),
(426, 'dehghan.saman72@gmail.com', '$2a$08$dfzuQMqnFikQDrTwzMjLdejLsXYnFQQ4ZudkcPgKVXGNFFX.B2Gaa', 'User', 'namas', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:29:13', '2015-11-11 12:29:13'),
(427, 'e.ebrahimi.f@gmail.com', '$2a$08$SzdAQjBTYnuaMeLYx6G6seSWPeJ2QdQBUoxLw3I.ZMNShm4PJq0Re', 'User', 'اسماعیل', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:30:18', '2015-11-11 12:30:18'),
(428, 'anahid_07@yahoo.com', '$2a$08$7IG5ROhLgHOOfnH5rdanVeyIqd2gBJxHDiF3UFFjfthl33ywyHzVK', 'User', 'Habibeh Anahid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:36:05', '2015-11-11 12:36:05'),
(429, 'mohammadhojjati@yahoo.com', '$2a$08$Pg7WWnFFtxCHVAEd5OUTferhG6XSuR7KddkT2NSfvJi9YwTk1uE3K', 'User', 'Mohammad Hojjati', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:37:28', '2015-11-11 12:37:28'),
(430, 'hossein.b.008@gmail.com', '$2a$08$SquY4OrfoXBDqW1jHkfqruDtX4QckT1NP8tLxZ/IzZXXVlPq1yyxy', 'User', 'hossein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:39:42', '2015-11-11 12:39:42'),
(431, 'mohshiri@gmail.com', '$2a$08$3XT97SCPKGmncu2u0IvUq.b1Y8sz1p5z/g5hqh/QqBKu6GTG6QCuS', 'User', 'mohammad shiri', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 12:52:58', '2015-11-11 12:52:58'),
(432, 'saeedmonfared67@gmail.com', '$2a$08$sSJQtaHV6BTkx4eOaKe9GO89O.4I4BpN1zmLtFnPLuXmu26aNhUr.', 'User', 'saeed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 13:08:56', '2015-11-11 13:08:56'),
(433, 'saeed8710@yahoo.com', '$2a$08$7knyUHnO12hoU8ELULg9X.1352Om30iJhIah4JmBtis6AtNeT1rau', 'User', 'سعید محمودپور', 'Active', NULL, 1, 2168455168, 539410527, 1629044641, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-11 13:26:51'),
(434, 'amin_danesh1992@yahoo.com', '$2a$08$YtDkUEFVL3eS5Fd9hInqAOJPXjsV.fPu2KF1ByoaJB5GqWW2rm.s6', 'User', 'betoche', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 13:31:08', '2015-11-11 13:31:08'),
(435, 'abaraani@ce.sharif.edu', '$2a$08$XfqXVVsAjHhS9qwINigjnOIgDfcydmABsI841gdpLpsM94.7HyQL2', 'User', 'alireza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 13:40:08', '2015-11-11 13:40:08'),
(436, 'milad_pasand@alum.sharif.edu', '$2a$08$HFMQrC8UO1ZKubZjjy3rSOaQNduRXOB.5sc94Aw5PEg0r2na1qYhK', 'User', 'milad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 13:46:18', '2015-11-11 13:46:18'),
(437, 'mhd.noori71@yahoo.com', '$2a$08$BHPzM05io1n0PdE3uruwmeaJv5yCyXe5TCZzyrYV97tcQK3AGHoWe', 'User', 'mahdiye', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 13:52:39', '2015-11-11 13:52:39');
INSERT INTO `users` (`id`, `email`, `password`, `role`, `name`, `status`, `referral_code`, `referral_id`, `quota`, `used`, `remain`, `deleted_at`, `modified_at`, `created_at`) VALUES
(438, 'shaabaniilani@yahoo.com', '$2a$08$doGYS3fdQo6brtBysaTT3.hL54PwtetTds5HZd51wQftdXoT4zYvG', 'User', 'Ali Karimi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:07:15', '2015-11-11 14:07:15'),
(439, 'imanfaraji68@yahoo.com', '$2a$08$v7BFfFrQVomsdJG954KOje8ZRRVDF5Zh3rR6EeFLM9lyK.QMsbhgW', 'User', 'ایمان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:11:31', '2015-11-11 14:11:31'),
(440, 'roozbeh.z.13@gmail.com', '$2a$08$LSQ2lutiYJOUTwMXfSw2A.y8sxbTGV2L9XOQ0bk.TK9OfQtG1l6/u', 'User', 'Roozbeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:25:18', '2015-11-11 14:25:18'),
(441, 'noushin.shakib@gmail.com', '$2a$08$LqX6Dm3adu8gtNJBcvvTFO58MsASZ1HapvrDb/P9yjAg7DKhH3yxG', 'User', 'Noushin', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:26:49', '2015-11-11 14:26:49'),
(442, 'mohsen.vatanparast@gmail.com', '$2a$08$GdM7zzigwIlPps25SMggP.4BASvdp1tuFBYA6hWWtI2CuJaOzTFJC', 'User', 'mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:30:21', '2015-11-11 14:30:21'),
(443, 'hnourizadeh@yahoo.com', '$2a$08$anG4yS33IINcel97IIoO3usLQ6tOjInCtYFRwggOQWOmgA/oRnlKi', 'User', 'Helena', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:30:42', '2015-11-11 14:30:42'),
(444, 'mohsenbehjatishendi@gmail.com', '$2a$08$bpOWAIzlhOrWTVvnTBNQT.X4NAg67liKA26VoGoPZbNR.dn63eRjK', 'User', 'mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:33:15', '2015-11-11 14:33:15'),
(445, 'arkhalig@yahoo.com', '$2a$08$fatxlRVudOUnyPS9c7YloOxT974mW/P/QGAvKRmmrr7NtmTv4a1ZC', 'User', 'Alireza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:45:15', '2015-11-11 14:45:15'),
(446, 'yousef_mohammadi@mech.sharif.edu', '$2a$08$5IzwG2xghOAgGO2p3TUQZOAJS7kK1rH4tjAp/xfpG1sSJTZ1Jd5m6', 'User', 'yousef', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:45:32', '2015-11-11 14:45:32'),
(447, 'khrmohammadi@gmail.com', '$2a$08$enqg1Zs2vfendCnMNIK1nOOZONHsLtkp5Za9EXnXIK9zYaU7XYv9y', 'User', 'khashayar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 14:48:05', '2015-11-11 14:48:05'),
(448, 'hilbert.cantor@gmail.com', '$2a$08$iFFWPl8oFLfhDGieTqoJaONq.TzPUJN4PLQZLWr2I5O8YfaFgvaAW', 'User', 'feri', 'Active', NULL, 1, 20971520, 17311177, 3660343, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-11 14:57:39'),
(449, 'mostafakarimi71@yahoo.com', '$2a$08$INLaN8McJ1xfUn74TqvQUe7ExvqfDmH4r8jPXRZE55/7IEg3XBShG', 'User', 'Mostafa Karimi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 15:39:02', '2015-11-11 15:39:02'),
(450, 'mh.hadi@yahoo.com', '$2a$08$lcxxlaMF6WTXU07oEgYGfuzSFm3q4npLmMENwZPNNLAhRHs8hvqv.', 'User', 'محمدحسین', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:01:24', '2015-11-11 16:01:24'),
(451, 'h.pirhosseinloo@yahoo.com', '$2a$08$zUpvd5qpasTeJ7vWV0i2wuOFTp3kwdan6O52LLM5p0d9LpcGX.gce', 'User', 'Hpirlo', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:05:58', '2015-11-11 16:05:58'),
(452, 'saeidansary144@yahoo.com', '$2a$08$4B6d6aHUNGW5vQSAgseorObBLRr7A9/3oegmX18BXJgWEcVf.nSnq', 'User', 'saeid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:43:51', '2015-11-11 16:43:51'),
(453, 'amirhnoor@gmail.com', '$2a$08$8Nlq341sbbKoVvQuWyEUMOEXILoLYRv9YQNj.xlL/3IJpZP3hROaa', 'User', ' امیرحسین نوربخش', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:45:50', '2015-11-11 16:45:50'),
(454, 'rezaei.mahyar@yahoo.com', '$2a$08$9AipQfgjenkQgSa60wOL0Odz/haGXPtoAGsfMyA0OqtkG4qFvLHeu', 'User', 'مهیار', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:47:26', '2015-11-11 16:47:26'),
(455, 'am.soufi@yahoo.com', '$2a$08$bRqn7MMfNmYqCregTMudg.fXXLTkz16.F2h.B9py7zY4QxYEFe6Wm', 'User', 'امیرمهدی صوفی عنایتی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:48:15', '2015-11-11 16:48:15'),
(456, 'asadi.amir70@yahoo.com', '$2a$08$DEhCQr44LqqZnqbFWWcawe8xHobbA/9WOtBsixbyOB.VT.kyfVsDi', 'User', 'amir', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 16:53:35', '2015-11-11 16:53:35'),
(457, 'arash_itech@yahoo.com', '$2a$08$JAZK68Npk4dAXquFE9m6ie3Y7dth6DFZq3DXSq5gP5kAMHXPvxYZC', 'User', 'arash', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 17:03:05', '2015-11-11 17:03:05'),
(458, 'm.nematolahi@gmail.com', '$2a$08$bDlHSSUyAelvsqLbCpnTRe1Mx/BsyqK7sbk3nq58aqBz8D8qIq49W', 'User', 'Mohammadreza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 17:18:29', '2015-11-11 17:18:29'),
(459, 'samiamir87@yahoo.com', '$2a$08$hPu8c2RlOXszBAKasixnx.5eWcdduNbqF/hQMf3tvU6Vqg7rYoENK', 'User', 'Amirhossein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 17:20:19', '2015-11-11 17:20:19'),
(460, 'ivatloo@yahoo.com', '$2a$08$Og0cwswT9URqVE0y9ledxutaF2XLMqHVR.fT7MF6.CAcD1eTLhUGC', 'User', 'behnam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 17:31:28', '2015-11-11 17:31:28'),
(461, 'atamoradi8@gmail.com', '$2a$08$MBzM8W0d9LJvhVzcsRv5UOO0izmGAglgPAINzmdUoDY0HAkWRvJWq', 'User', 'ata', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 17:44:57', '2015-11-11 17:44:57'),
(462, 'abdollahi.yaser@yahoo.com', '$2a$08$bH1xvjuCK4VL224ZR6xZte7b3tLphWDh6cAVoVtlLvY/I7s4E4t2.', 'User', 'یاسر', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 18:20:57', '2015-11-11 18:20:57'),
(463, 'kramezani@ce.sharif.edu', '$2a$08$MmbpOCCedxERD2YM4ODgIesmkPhJ8QuAXohNI2WvngTTC9HYnh0fq', 'User', 'kaveh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 18:54:28', '2015-11-11 18:54:28'),
(464, 'mahdi0969@yahoo.com', '$2a$08$ozy9cmFdKLbS3Fkrx0jzbOhdVrgwQSSSkfJ4bsRnw4dK1ul0nT0rO', 'User', 'mehdizangane', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 19:28:03', '2015-11-11 19:28:03'),
(465, 'cyrus.co1995@gmail.com', '$2a$08$JryYA45Dghlml9x7h1hwhumjxmb7EHichJmiOv99/UNFenk0cTKVG', 'User', 'kourosh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 19:35:34', '2015-11-11 19:35:34'),
(466, 'sahebeh.nabavi@yahoo.com', '$2a$08$su6SKAAzaV62TAbOxZDMRuBvv6jDd/688R9gC1s8gUdEek5k4EOEK', 'User', 'سحر ناصری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 19:55:52', '2015-11-11 19:55:52'),
(467, 'sharatian@hotmail.com', '$2a$08$AJeO10mL5TLiEOcK2vApbO7oTQF3MF2.cpHM5AzrN8cJ1y5pqX/vi', 'User', 'سعید هراتیان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 20:02:37', '2015-11-11 20:02:37'),
(468, 'zaim.mohsen@gmail.com', '$2a$08$AOvSIxKhnzdoE7z7kQ8dA.SO8ZJflTEnNfxSYhmLWLpqs1B23JWMW', 'User', 'Mohsen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 20:04:30', '2015-11-11 20:04:30'),
(469, 'iman_moneminezhad@yahoo.com', '$2a$08$Aw0NbClvuCvJ84ieGTIBk.4RmCVfXRs9Wi4oOms81RsA6KExZlhy.', 'User', 'ایمان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 20:18:19', '2015-11-11 20:18:19'),
(470, 'hamid_hojjat84@yahoo.com', '$2a$08$DfiqpJsPa0JOsivbQUwUu.lr6TDIahKGrm0iVnmhg1SqaGUk2MT7q', 'User', 'hamid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 20:31:09', '2015-11-11 20:31:09'),
(471, 'homayoon_f@yahoo.com', '$2a$08$Xma8xPbDcFJ25IdGrdyiROPGGJ.lZu7bMU7dkNNVPfD55II/lLWGi', 'User', 'Homayoon', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 20:31:28', '2015-11-11 20:31:28'),
(472, 'm_heidari9488@yahoo.com', '$2a$08$6T7eW7ey4vR3iCbRLsUONOOTZ3XwWLZEqlrooA8d2Fw/XkPD/g.yG', 'User', 'marzieh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 20:40:05', '2015-11-11 20:40:05'),
(473, 'neshat_12@yahoo.com', '$2a$08$DT0c99Y9ykhLXuFesybkQONUYropJ69aWTUIB3ZZz7RJZQ6m0UqrS', 'User', 'mostafa', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 21:40:02', '2015-11-11 21:40:02'),
(474, 'farzad_nikfar@yahoo.com', '$2a$08$cQ9rSWZn5lAE9n4Z40CrLeDOjajG/auA30aJzdj8GeoNR359OuCD2', 'User', 'farzad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 22:02:28', '2015-11-11 22:02:28'),
(475, 'sh_rahmani67@yahoo.com', '$2a$08$xZbhrdkT9aeiaIva0Dal6OvUEz9za25i/gR66f94iCsupzh0yc3De', 'User', 'Shima', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-11 23:07:04', '2015-11-11 23:07:04'),
(476, 'svalianpour@gmail.com', '$2a$08$78vxt910uJZ89WAz5sN8TuSPjTOL5QfO6XSRuWx7VTYD4.YrtNoNC', 'User', 'rts', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 01:21:42', '2015-11-12 01:21:42'),
(477, 'saghar.ahadi13@gmail.com', '$2a$08$mRHQ05mccPPoFLDGlMJwMeu/tYbtFEDhr3ydqCBL.BdVEHErimm82', 'User', 'saghar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 01:36:15', '2015-11-12 01:36:15'),
(478, 'ehsan_mahdavi7@yahoo.com', '$2a$08$34KvvttzrxyMXGFLRKq3YeYvz95IaQumDOVJTXPZ5cT20QF80NOjm', 'User', 'Ehsan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 04:55:55', '2015-11-12 04:55:55'),
(479, 'majid.zavvar@gmail.com', '$2a$08$9iWMG50eeBIaO5FeGKvq8uJymqWoN/UtSsOlARhyWCJv5RTM0r/7C', 'User', 'majid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 05:45:37', '2015-11-12 05:45:37'),
(480, 'a.tashakori71@yahoo.com', '$2a$08$mcG4VHIXfiX8O24D6gpxPup68FBuzXGPZnrrk9zhWktvd0m1rNPq2', 'User', 'علیرضا', 'Active', NULL, 1, 2168455168, 99440937, 2069014231, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-12 05:48:15'),
(481, 'koosha.khorramian@yahoo.com', '$2a$08$VSmARBEwQzsG701ykN3EieJSd4aqk3N9o4sReCHUiOid.60rSGICq', 'User', 'کوشا خرمیان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 05:57:56', '2015-11-12 05:57:56'),
(482, 'hamedamini84@gmail.com', '$2a$08$CApqNcEBBPgGeaW5UBNNh.a.GjPcAD/kYF.KJKbwXNZxj9LWNoIDu', 'User', 'hamed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 06:07:25', '2015-11-12 06:07:25'),
(483, 'khosro.aryaman@yahoo.com', '$2a$08$fi6au005ziGwV6nbJf89OOjPdTpqX.MWuHoPhCQzChXAmRYX1pPF.', 'User', 'khosro', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 06:07:36', '2015-11-12 06:07:36'),
(484, 'ali.farmad@gmail.com', '$2a$08$V6TMND6XJ4vTazNrln5uIePGk7uTKWZAGPQmSm3WRhin1jBYZLoGC', 'User', 'alifarmad', 'Active', NULL, 1, 557842432, 159012667, 398829765, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-12 06:45:45'),
(485, 'mohamadhossein.fakharan@yahoo.com', '$2a$08$fOUIE5FMHOvFvktPhJlujOwNfcu15yCORPZDNK1kk9mBbw7mS0QoK', 'User', 'محمد حسین', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 07:25:49', '2015-11-12 07:25:49'),
(486, 'goldenhair.1373@yahoo.com', '$2a$08$fXxFIqzTQrBAEcmv6fFIQOAmXFXQRJ1dP9frV964.n.TRO3p84JLe', 'User', 'Arash', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 07:28:46', '2015-11-12 07:28:46'),
(487, 'mahdi14@chmail.ir', '$2a$08$w5KGgmQxcbdTjjM72kcwce3bOyz1Ul3emWNoYaJETdBOIOkyPk/cu', 'User', 'mahdi', 'Active', NULL, 1, 20971520, 18814508, 2157012, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-12 08:07:37'),
(488, 'm_eraz9426@yahoo.com', '$2a$08$suVHQVe9MsLUT5exsyEBteUG9lFHmF/K6zCBPOrvBDf1/U/wElT6G', 'User', 'mousa', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 08:23:42', '2015-11-12 08:23:42'),
(489, 'morteza.salehi@gmail.com', '$2a$08$BUEdBhvMpp7Xtf0RZEnP5.QErtIZhqV4Xg37WcAK7QOMoel/fS536', 'User', 'linuxmaster', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 09:00:14', '2015-11-12 09:00:14'),
(490, 'fereydonian69@gmail.com', '$2a$08$ZSLM58HJMWU940qNLGK3reKrkSdZmlYoR8wfxxXLKDUtCgzGlbWmy', 'User', 'Mohammad fereydounian', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 09:26:09', '2015-11-12 09:26:09'),
(491, 'm.gheisari69@gmail.com', '$2a$08$NmQYOq4qJCbFGk8XfoAj0uBtjVa2XVsDuEmB6Qro..5aiSCsz.gue', 'User', 'marzieh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 10:02:03', '2015-11-12 10:02:03'),
(492, 'm_s_tavakkoli@yahoo.com', '$2a$08$ayguDcfoit1Ky99nsrCzE.PbSw9IIQNqzMlALaLXNEQJVDzYysUfS', 'User', 'Mohammad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 10:05:20', '2015-11-12 10:05:20'),
(493, 'sobhanforoughi@yahoo.com', '$2a$08$NqK1RB07bMcGYAOMzdyyieMR.qgXOERWdup9ue1bkaI3UqzwMNTma', 'User', 'Sobhan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 10:38:08', '2015-11-12 10:38:08'),
(494, 'ali.delbariyani@gmail.com', '$2a$08$VRIkCujJXWdEXVTz8f0TiuwFxRZbnMJ3V1Pn0GVPq6T8XW.fc66Y2', 'User', 'علی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 10:49:01', '2015-11-12 10:49:01'),
(495, 'zarif.arezoo@yahoo.com', '$2a$08$fEWTkBsV4urJzlDl8iZuLeaZYO.csFGcRO4XIuKd.Ey5WZH4fyN7C', 'User', 'Arezoo', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 11:54:24', '2015-11-12 11:54:24'),
(496, 'amin.tohidi@yahoo.com', '$2a$08$LL7gJwawJRH0TkqkIKmlSOP20YgmzrkoQDEtnD7U6rVAz6q.SI126', 'User', 'امین توحیدی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 12:00:08', '2015-11-12 12:00:08'),
(497, 'a_h_hemmati@yahoo.com', '$2a$08$vk9TcwYPOkQcCrTbMDn6xuEBSWNwfq0aJl2DtJihljKJrYkRP1NUC', 'User', 'amir hossein hemmati', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 12:09:28', '2015-11-12 12:09:28'),
(498, 'hofenberg@gmail.com', '$2a$08$nxwTV4IUuuRVUbXv3KLVbOggE60ckmQI6XBLg60VBxZLFFDLeW9SC', 'User', 'Amir Hossein Sadat Razavi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 12:36:05', '2015-11-12 12:36:05'),
(499, 'mohammad.ali.taj@gmail.com', '$2a$08$YXqqi29OZj2QXMPG19N3yOUg09MeUfPmCZgiIH7ALcj07FVpPWhXm', 'User', 'Mohammadali Taj', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 13:05:52', '2015-11-12 13:05:52'),
(500, 'hoomanasgari94@yahoo.com', '$2a$08$XnmFcdK1KhCfY0QdCxj0BOSWS7O8YLwzKyFG.Ba7mRaPaDS2BrssS', 'User', 'هومن ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 13:09:26', '2015-11-12 13:09:26'),
(501, 'sygickhashayar@gmail.com', '$2a$08$MkLEtDDJMc5qN52jTGTFcelHv7.LzYeW11wzP81NGKr9dm7JM78lC', 'User', 'hasan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 13:15:45', '2015-11-12 13:15:45'),
(502, 'kazemzadeh_2005@yahoo.com', '$2a$08$AivAgkCilRA93uIZvY77X.nWmaqfsFvDJGlcI9ljN9yuj1sMNEPcW', 'User', 'Ouria Kazemzadeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 13:46:12', '2015-11-12 13:46:12'),
(503, 'mehr1367@gmail.com', '$2a$08$oAnTAvamtiB6ogeTnY5q2ekNELofeReoA4gdKyq2o3jrgmjjXfNAS', 'User', 'soushiant', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 14:01:48', '2015-11-12 14:01:48'),
(504, 'si.mabphysics@gmail.com', '$2a$08$EVJAB3kZnpB6VuFK22tVC.e4sKvlqrW/dpU7Ims2LayXVqEFZ6Tre', 'User', 'محمد مظهری', 'Active', NULL, 1, 20971520, 12668040, 8303480, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-12 14:43:38'),
(505, 'mojahed_ha2020@yahoo.com', '$2a$08$9JOgIXHusAjaNuF1e1r4LunEu1W/NB.JY2hbwcM70MBEFbwOFbWE6', 'User', 'Mojahed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 15:54:36', '2015-11-12 15:54:36'),
(506, 'h.rahimi.sh@gmail.com', '$2a$08$8tPKHsKpIDzm1Bks1BCvbOUk/Z9tPDu5xJkruY1bVzbTfs9GYHHyK', 'User', 'H R', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 17:30:22', '2015-11-12 17:30:22'),
(507, 'miladazizpour@gmail.com', '$2a$08$s0wKLz1XOlQXbL4NhppDn.HiSJhxVDuHXcuGjELkLLSR7DTvAg6/C', 'User', 'Milad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 17:31:44', '2015-11-12 17:31:44'),
(508, 'hossein.mehri3@gmail.com', '$2a$08$CLZHF6bmF6OIMChJT09YiuTbAhiu57LXb45KYRGi.5F8gZI.BbqkK', 'User', 'Hossein', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 19:00:18', '2015-11-12 19:00:18'),
(509, 'maryam.brj@gmail.com', '$2a$08$bU8fJUQDhm3ZAJ6Ilt8l8uFvPoGvGhpJORAUi89l4ERtW0lUJmlXu', 'User', 'Maryam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 19:25:52', '2015-11-12 19:25:52'),
(510, 'saedkh87@gmail.com', '$2a$08$JU2XPRZtNUIcLMPSelv87eSJO2PB5FG7LZsE2uAUzSQl2HB8M9Gwq', 'User', 'saed', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 20:12:39', '2015-11-12 20:12:39'),
(511, 'hojat.rashidi@gmail.com', '$2a$08$8d98ov4HnhbJ9IH38uiJw.TOHe52wir7jpKch0qb7ifooQwltCdVi', 'User', 'hojat', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 20:23:36', '2015-11-12 20:23:36'),
(512, 'r_shahmirzayi@yahoo.com', '$2a$08$wClM81ctgYyOUh3qPZj74ubpPWP3bvOb6vsIMDi1GCIQVRuokZmdO', 'User', 'rohollah', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 20:37:41', '2015-11-12 20:37:41'),
(513, 'naimeh_mohamadi@yahoo.com', '$2a$08$TzrzKALxzp3XtqVqOvdFR.Nzqc5r7fFDuriG6vMkK7jP5rv6WfMvm', 'User', 'naimeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-12 21:47:44', '2015-11-12 21:47:44'),
(514, 'agh_amir21@yahoo.com', '$2a$08$IFe4iLA2bWv5FD9Z4UJW8.wNegNNzVOjGEuj4GxwvrRCrvaUqxG0e', 'User', 'amirhossein', 'Active', NULL, 1, 2168455168, 72067091, 2096388077, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-12 22:42:25'),
(515, 'amin.sadeghi@live.com', '$2a$08$ZRx0YlLY0qnkkIqjZs9D1O6Mokte6hBQdPvZp.WbmKUsnF4D1gqhS', 'User', 'محمدامین صادقی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 03:18:32', '2015-11-13 03:18:32'),
(516, 'morteza.mazinani@gmail.com', '$2a$08$ox5J4h4zK8IJP68OX2QhVuWzpyjPZhkW1NnlQs6ouE4X.f/bPRaDS', 'User', 'morteza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 06:33:25', '2015-11-13 06:33:25'),
(517, 'hoghooghihadi@yahoo.com', '$2a$08$VsTTnmhAleRJsuuHvkyMl.ziwDlroVa6xmvMOn2VKXnlmt4efM9K2', 'User', 'hhshariftube', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 06:51:32', '2015-11-13 06:51:32'),
(518, 'behrouz_shasti@mech.sharif.ir', '$2a$08$43Iad3I2C4nPnPYYE1MWxuUeSwob/MOvVFcO/Lk2iPBDUhCgAQbGG', 'User', 'behrouz', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 07:14:27', '2015-11-13 07:14:27'),
(519, 'v.karamzadeh@gmail.com', '$2a$08$2Hyi7GYgGcJGFtvfhM1hv.uhsyNvjeQ0.yTJMNT8zuxB8VSIz5Pta', 'User', 'vahid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 07:40:07', '2015-11-13 07:40:07'),
(520, 'hosseinpour.mhd@gmail.com', '$2a$08$ey0DLkG8JqzgYie6TMoLGOvEbNSyhRbOHgVp8SXQo/K1nHAboqRti', 'User', 'Mehdi ', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 07:44:31', '2015-11-13 07:44:31'),
(521, 'pmehdinejad@gmail.com', '$2a$08$rkmgKjQgEtZyNcsUHDIhU.mQee0nukz9Dd2g0DfCKy7o3IFLsQ0sS', 'User', 'Pourya', 'Active', NULL, 4, 2168455168, 729465753, 1438989415, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-13 08:26:44'),
(522, 'karimipegah@yahoo.com', '$2a$08$LwU4A0LcPQC6BtpCYOYB9.qs.mOgVgaVS.5s/9E6oQqYOIYV4bLOy', 'User', 'Pegahi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 08:35:41', '2015-11-13 08:35:41'),
(523, 'maede.chavoshi@yahoo.com', '$2a$08$bRYRdrvNpdc12LkJ7nmKVeuJIeyRiuSQiaAQcVtPExniLqL4hz5fO', 'User', 'maede', 'Active', NULL, 1, 20971520, 1779790, 19191730, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-13 08:35:44'),
(524, 'm.behjati442@yahoo.com', '$2a$08$xzubvauRYXJLf98E7eu8LOowW9agnAAFCUnr1s1TDF56Bufuo1vKS', 'User', 'MAHDIEH', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 08:41:06', '2015-11-13 08:41:06'),
(525, 'behzadesmailifar@yahoo.com', '$2a$08$e8CGPgfcftuHTsjciZb43uJ6i1A0aJm7oubETEh0hYr.l7dwEWEa6', 'User', 'behzad esmaeilifar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 09:17:18', '2015-11-13 09:17:18'),
(526, 'sr.mohseni@yahoo.com', '$2a$08$7PDkrnRzyVq2IkFblmkyhODR3WbdjRCteVNe4oPYmlyVaJTfylQPe', 'User', 'SaiedReza', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 09:20:03', '2015-11-13 09:20:03'),
(527, 'yasinshaeri@yahoo.com', '$2a$08$byLlyuTFGpQzcmK4zYZjtuCR/WZCuxYBQtlPuAbbTlbTNdvEXr0wO', 'User', 'm.sh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 09:50:24', '2015-11-13 09:50:24'),
(528, 'bbkghadiri6@gmail.com', '$2a$08$emTJnKGFwDEoOj6UrDne1.9n.pwyF7ixQpG.Vpl0rvBiwTDkPLdsS', 'User', 'babak', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 10:13:17', '2015-11-13 10:13:17'),
(529, 'e_molaei7@yahoo.com', '$2a$08$s0ugyHh7QCeN8wIpq5PKR.fv.2b3mg7AVyDuGqme7ezi8zQFKXskC', 'User', 'Elahe', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 11:20:36', '2015-11-13 11:20:36'),
(530, 's.hanifpour@gmail.com', '$2a$08$CpiOHuqt8VIL6AbnAq1ZF.QTjtdDlWA7u6qPSXrKx5D.69NcdC7aG', 'User', 'hanifpour44', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 11:32:36', '2015-11-13 11:32:36'),
(531, 'ebehnam2004@yahoo.com', '$2a$08$48hOhrd8EL83f8gEsCWgoeZL5zegabV9momF1PWGJabhQH4O3gPAy', 'User', 'behnam', 'Active', NULL, 1, 20971520, 16633657, 4337863, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-13 15:09:26'),
(532, 'nilooraeofy@yahoo.com', '$2a$08$gFOcKwXfmTA8P6obQa3R9OmWYFr72oy7HMCcXbd3SO1ft6siq2gua', 'User', 'niloofar', 'Active', NULL, 1, 20971520, 19177543, 1793977, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-13 15:15:24'),
(533, 'rahmi.mathematics@gmail.com', '$2a$08$IsoVbs06i3kNwSVUaV3MvOCGANMeOhn/0Ls2e27qxQEvn1LI7Pfai', 'User', 'راضیه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 15:23:42', '2015-11-13 15:23:42'),
(534, 'z.barzegari.d@gmail.com', '$2a$08$v3Rvqr4Y3yWJHfAvUswPP.x8TEnZIH6ibWhJQ71CKnHT6h4U.DOhm', 'User', 'zahra', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 15:33:34', '2015-11-13 15:33:34'),
(535, 'ghm_2004@yahoo.com', '$2a$08$1aRuxFhUbfQbVrIhWVwycOf6JGcHNI5AMmbWZEverlCzMmp6lTtD2', 'User', 'ghasem', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 18:17:24', '2015-11-13 18:17:24'),
(536, 'nili@ae.sharif.ir', '$2a$08$xU6pKuCfdMw5o4es8FOgJ.JzE1WO3oyGs26dfSHoDe2Xp073cZ/u6', 'User', 'alinili', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 18:35:14', '2015-11-13 18:35:14'),
(537, 'z.pirhadi@gmail.com', '$2a$08$ZuMOgVBCMerK9gCozAubJuTGL6ank/izoWINxm80CBuM6t8HKkjb2', 'User', 'zahra', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 19:10:58', '2015-11-13 19:10:58'),
(538, 'habib.yajam@gmail.com', '$2a$08$XrZbtyZbqxREhZPx481V1OvgB3ZOoFB.bo6ViSbSpvKptlpy7UB1.', 'User', 'habib', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 19:16:39', '2015-11-13 19:16:39'),
(539, 'hsm.hgh@gmail.com', '$2a$08$LEBNVWZh3t8kRvXmH38jNeeq9lV8IHMpH7PZhjVsOq5lmfn11wJ7m', 'User', 'Hesam', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 19:42:12', '2015-11-13 19:42:12'),
(540, 'elbarati@alum.sharif.ir', '$2a$08$eHrM6ArfgrSgbQH27EHoyelh48VlnAM3Js56dLY5jIrjiBRCCONXW', 'User', 'barati', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-13 19:51:48', '2015-11-13 19:51:48'),
(541, 'mashayekhi@ce.sharif.edu', '$2a$08$hO3SPLwT7yDPH7ud8CBEIuIJUnXxBSDtyE5CpN.DcrGfeFVPwxtrm', 'User', 'Hoda', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 03:18:33', '2015-11-14 03:18:33'),
(542, 'hr.moazzen@gmail.com', '$2a$08$LOGbNAeEcjyCam4J6NbC6.BFK/1AEF5zlrGmqdjjZWfN5kX8Hl9Ma', 'User', 'hamidreza moazzen', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 06:34:55', '2015-11-14 06:34:55'),
(543, 's_mahyad@yahoo.com', '$2a$08$AEpvXYsBUuhrtOtXb3cJ1eNPHau8i1yBY2nKAknY0DEhfQ1aLjJTG', 'User', 'Saeed Mahyad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 06:53:37', '2015-11-14 06:53:37'),
(544, 'pirazh_kh2004@yahoo.com', '$2a$08$deSZf3ipRwtAtOg7YxpZ9uMUdzGxbhqvB2oaJlEAdpGcV.TVVwS5S', 'User', 'Pirazh Khorramshahi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 09:36:41', '2015-11-14 09:36:41'),
(545, 'tehrani_fn@yahoo.com', '$2a$08$1vwAsy9hDzp4CjzQ5PXxoOlDvvVKmVqBn8sOe9q/1Ry17.DjpZlOm', 'User', 'Niloofar Tehrani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 09:59:48', '2015-11-14 09:59:48'),
(546, 'nazarieyeh@yahoo.com', '$2a$08$9pPGui0gCHuPU6P6zFPZs.yHbyS7vCAzGJ0bI90ynP0zNAyMImd.2', 'User', 'فاطمه', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 10:02:53', '2015-11-14 10:02:53'),
(547, 'faklagi@yahoo.com', '$2a$08$DItJUJTFyect05RD4lmOveNarX9/.goizMsjO6toGFK/bnQaxah1G', 'User', 'farid', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 10:19:28', '2015-11-14 10:19:28'),
(548, 'saeedghodsi@rocketmail.com', '$2a$08$fATGyuBmtM0AytAYWLL4huTHGIYxcsMW5zkqkFlYFOpr82.PyBWiG', 'User', 'سعید قدسی', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 11:45:23', '2015-11-14 11:45:23'),
(549, 'amin.nassim@live.com', '$2a$08$5Y9nU2kvAR0IUVS1Bfho7eBRkt951axCqzNaxRR3K75Vc4yMo6dFe', 'User', 'Amin', 'Active', NULL, 1, 20971520, 13151201, 7820319, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-14 11:57:10'),
(550, 'eng_negar@yahoo.com', '$2a$08$B4c3c10OuNhj7EVjA1lUbunSC9racFj7J4nugdvkkXCotTzO/6eAG', 'User', 'negar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 13:55:40', '2015-11-14 13:55:40'),
(551, 'mojtaba.pirali@yahoo.com', '$2a$08$56XHBMsM5E43bEN67KYlReAkC/u9Dvh4/NQifrMENnL3KosuHy7G2', 'User', 'Mojtaba', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 14:53:03', '2015-11-14 14:53:03'),
(552, 'naserlotfi2009@gmail.com', '$2a$08$H3dKMTq6x3AWtsz8zIjFc.oK.Cx0R1TYSzAkD8jfcu84m/QS6s8rK', 'User', 'naser', 'Active', NULL, 1, 20971520, 11580076, 9391444, '0000-00-00 00:00:00', '2015-11-15 11:12:02', '2015-11-14 14:54:04'),
(553, 'momenie63@gmail.com', '$2a$08$oPn6QsOl2IfPLH4q9X3CteNEGMGtl38D/nFCG59LU8lpHh12V6Z86', 'User', 'احسان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 15:08:11', '2015-11-14 15:08:11'),
(554, 'adfsadf@sdfsdf.com', '$2a$08$ccWDakfY8o5XxgqekG0Pqu8DCn6aUhPSnMHpYogKOW7UrACjQPD9W', 'User', 'adfsadf@sdfsdf.com', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 15:47:08', '2015-11-14 15:47:08'),
(555, 'aliakbarforoughi1371@gmail.com', '$2a$08$iVTrxQafxJ3GvHdzQpX93uSNDJyEWg7jyHTYQV0i2rmyQhuZxHlAC', 'User', 'aliakbar foroughi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 15:55:44', '2015-11-14 15:55:44'),
(556, 'r.velayati88@gmail.com', '$2a$08$EfXkjMxoHOKqet9yyybP2OKYdGzza6Ij2YNvs9Jy/cuQ.rIe4fE6S', 'User', 'vela33', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 16:14:56', '2015-11-14 16:14:56'),
(557, 'a.chemist69@yahoo.com', '$2a$08$dswQ87mR5LtRn5EFv6E5o.YYl8Dr5Rsu6YOWDW4w6NLo5BiIknLNq', 'User', 'گنگی نزاد', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 17:22:41', '2015-11-14 17:22:41'),
(558, 'hs.soleimani@yahoo.com', '$2a$08$A7ffhLfkaIMz6dyQ8FEq6O3O38Nw3LJeJzdEGMtgyOJwhcl.yZa..', 'User', 'h.soleimani', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 17:30:40', '2015-11-14 17:30:40'),
(559, 'hadi.zamani86@yahoo.com', '$2a$08$wiU9S6inmpGoE9fGh6Exu.tpAC4kUwI6x0t0/ZW6fPqS.mbBqlxJS', 'User', 'hadi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 17:40:35', '2015-11-14 17:40:35'),
(560, 'r.motahari69@yahoo.com', '$2a$08$seCw8R88DVDCTXNuyGntrO3m9qYZ82SCxW/2idreThi/ASE1Zez92', 'User', 'رضا مطهری', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 17:43:18', '2015-11-14 17:43:18'),
(561, 'j.pasandidehpour@gmail.com', '$2a$08$Z9SDRk2W56Mj9mjLJ9k68usRgRRovZttQbQTDeoumF0CqPLLtPIai', 'User', 'javad', 'Active', NULL, 1, 20971520, 20441481, 530039, '0000-00-00 00:00:00', '2015-11-15 09:08:01', '2015-11-14 18:00:05'),
(562, 'ahmadvand.hassan@gmail.com', '$2a$08$pMOdKBnpFsChyPQUMBPJlunA1GTHGOeVm/sYK1JnGMHcMWXuMqEEG', 'User', 'hassan', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 19:31:44', '2015-11-14 19:31:44'),
(563, 'mehdi.darshi@yahoo.com', '$2a$08$2UGlbB9lHSqfli5RenAIWevbWYvQyY5Fa8muaeLJLz98kI.93F..e', 'User', 'Mehdi Darshi', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 20:39:37', '2015-11-14 20:39:37'),
(564, 'aminsabbaghian@ce.sharif.edu', '$2a$08$eeNsy8NozMihEkBFN2l2qeTOTfjm2hYvtlndXqCjwxJM56jd8JuQ6', 'User', 'amin saba', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-14 21:29:40', '2015-11-14 21:29:40'),
(565, 'mdaneshvar_9385@yahoo.com', '$2a$08$1JieGrngBKsBq2T5OHw0EujpG/.4el.M0i8jImT/2IAZCZPXdHw9e', 'User', 'محمد', 'Active', NULL, 1, 20971520, 20859915, 111605, '0000-00-00 00:00:00', '2015-11-15 09:06:03', '2015-11-14 22:45:24'),
(566, 'ahmedpayro@yahoo.com', '$2a$08$HexFKbB2DWd9WSOlbvSflOxbJOvBmGWTkrg5CnlSA.qu.K2QHZBm2', 'User', 'ahmad', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 06:11:29', '2015-11-15 06:11:29'),
(567, 'fathieh_faghih@yahoo.com', '$2a$08$PnF3jYA0szxcZL1MefefOOPgXapHbwSypycut91RpdX9LLcwACxY2', 'User', 'Fathiyeh', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 06:39:18', '2015-11-15 06:39:18'),
(568, 'mido_7013@yahoo.com', '$2a$08$yozA9mur0sC10CW64NtuOOJiks2x3RWBUSvHp5Yo.5mRjgU1fO4H2', 'User', 'mido', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 06:47:30', '2015-11-15 06:47:30'),
(569, 'h.tarjoman@gmail.com', '$2a$08$gqJPNSd7j18ZDSsuU7sXS.2FC8wxAtt0vo6K87VJjs5Cmo0tP46ba', 'User', 'heidar', 'Active', NULL, 1, 20971520, 1514737, 19456783, '0000-00-00 00:00:00', '2015-11-15 09:06:03', '2015-11-15 06:58:04'),
(570, 'mgeo377@gmail.com', '$2a$08$NZX9tQHGDXBR6mkY2lP23.Yaxz1uLkBpgll92lkipkvrX.acMewFy', 'User', 'ross', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 07:08:45', '2015-11-15 07:08:45'),
(571, 'vranjbar@ce.sharif.edu', '$2a$08$mcF8VLGa9YpQsXK1uMlRYuvnnYb/uBU6re/a2TJ9aiIA39xhHBsiK', 'User', 'Vahid Ranjbar', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 09:55:09', '2015-11-15 09:55:09'),
(572, 'mo.kianian@gmail.com', '$2a$08$6ZglBMQ3ePfYAJ4okTUGEuBit6sINWRjAFU3Lrhq2EEmBP/xr9CFK', 'User', 'مرتضی کیانیان', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 10:29:20', '2015-11-15 10:29:20'),
(573, 'farzana.heidari@gmail.com', '$2a$08$MNZMKkpNVgdeArIZ9q7QQ.wTtbFXhfQmzZ63ckdGd6WiIvS9P.mRW', 'User', 'farzane', 'Active', NULL, 1, 20971520, 0, 20971520, '0000-00-00 00:00:00', '2015-11-15 10:59:29', '2015-11-15 10:59:29');

-- --------------------------------------------------------

--
-- Stand-in structure for view `visits`
--
CREATE TABLE `visits` (
`date` varchar(10)
,`total` bigint(21)
);

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

-- --------------------------------------------------------

--
-- Structure for view `onlines`
--
DROP TABLE IF EXISTS `onlines`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `onlines`  AS  select `logs`.`user_id` AS `user_id` from `logs` where ((`logs`.`user_id` is not null) and (`logs`.`created_at` > (now() - interval 2 minute))) group by `logs`.`user_id` ;

-- --------------------------------------------------------

--
-- Structure for view `payments`
--
DROP TABLE IF EXISTS `payments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payments`  AS  select date_format(`purchases`.`created_at`,'%Y-%m-%d') AS `date`,count(0) AS `total`,sum(`purchases`.`amount`) AS `amount` from `purchases` where (`purchases`.`status` = 'Success') group by date_format(`purchases`.`created_at`,'%Y-%m-%d') ;

-- --------------------------------------------------------

--
-- Structure for view `visits`
--
DROP TABLE IF EXISTS `visits`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visits`  AS  select date_format(`logs`.`created_at`,'%Y-%m-%d') AS `date`,count(0) AS `total` from `logs` group by date_format(`logs`.`created_at`,'%Y-%m-%d') ;

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
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

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
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indexes for table `unsubscribes`
--
ALTER TABLE `unsubscribes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `referral_id` (`referral_id`),
  ADD KEY `quota` (`quota`,`used`,`remain`),
  ADD KEY `dates` (`deleted_at`,`modified_at`,`created_at`),
  ADD KEY `status` (`status`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_logins`
--
ALTER TABLE `failed_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13651;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `password_changes`
--
ALTER TABLE `password_changes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `remember_tokens`
--
ALTER TABLE `remember_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;
--
-- AUTO_INCREMENT for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `success_logins`
--
ALTER TABLE `success_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=776;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ticket_replays`
--
ALTER TABLE `ticket_replays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `unsubscribes`
--
ALTER TABLE `unsubscribes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574;
--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
