-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2021 at 04:16 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codinglovers`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` text NOT NULL,
  `book_cat` text NOT NULL,
  `book_author` text NOT NULL,
  `book_publication` text NOT NULL,
  `book_desc` text NOT NULL,
  `price` float NOT NULL,
  `book_img` varchar(50) NOT NULL,
  `amazon_link` text NOT NULL,
  `flipkart_link` text NOT NULL,
  `thriftbooks_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `book_cat`, `book_author`, `book_publication`, `book_desc`, `price`, `book_img`, `amazon_link`, `flipkart_link`, `thriftbooks_link`) VALUES
(2, 'html', 'Html', 'shivam', 'my publication', 'hskglk', 600.56, 'html cssjs.png', 'https://cutt.ly/cb74cgp', '', ''),
(3, 'Python book', 'Python', 'Gudoo', 'Puthon Publication', 'pytohn book', 4620, 'Python_logo.png', 'https://cutt.ly/Ab764ku', 'https://cutt.ly/gb5qs2i', 'https://cutt.ly/vb5qbVE'),
(4, 'LET US JAVA', 'Java', 'by Yashavant P. Kanetkar (Author)', 'BPB Publication', '<p><b style=\"font-weight: bold; color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Learn the basics of most favoured dynamic language for application development</b><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><b style=\"font-weight: bold; color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Key Features</b></p><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Major reorganisation of chapters with a view to improve comprehension of concepts involved</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Comprehensive coverage of all the concepts of Core Java</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Simple language, crystal clear approach, user-friendly book</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Concepts are duly supported by several examples and self-explanatory analogies.</li><p><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><b style=\"font-weight: bold; color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Description</b><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Java Language is very popularly used for creating applications for PC, Laptop, Tablet, Web and Mobile world Learning a language that can work on so many different platforms can be a challenge. This is where you would find this book immediately useful. It follows a simple and easy narration style. It doesn\'t assume any programming background. It begins with the basics and steadily builds the pace so that the reader finds it easy to handle complex topics towards the end. Each chapter has been designed to create a deep and lasting impression on the reader\'s mind. Object-Oriented Programming has been covered in detail to give a strong foundation for Java Programming. Well thought out and fully working example programs and carefully crafted exercises of this book, cover every aspect of Java programming.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><b style=\"font-weight: bold; color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">What will you learn</b><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"></p><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Data types &amp; Control Instructions</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Classes &amp; Objects</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Arrays &amp; Strings</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Inheritance &amp; Polymorphism</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Interfaces, Packages</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Exception Handling, Effective IO</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Multithreading &amp; Synchronization</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Generics, Collection classes, GUI Using Swing</li><li style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Database Connectivity Using JDBC</li><p><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><b style=\"font-weight: bold; color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Who this book is for</b><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">This book will prove to be a \"must have\" for beginners as well as experienced professionals as it is a stepping stone for learning Java technology.</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><b style=\"font-weight: bold;\">Table of Contents</b><br>1. An Overview of Java<br>2. Getting Started<br>3. Java Data Types and Instructions<br>4. Decision Control Instruction<br>5. Loop Control Instruction<br>6. Case-Control Instruction<br>7. Functions<br>8. Advanced Features of Functions<br>9. Introduction to OOP<br>10. Classes and Objects<br>11. Arrays<br>12. Strings and Enums<br>13. Inheritance<br>14. Polymorphism<br>15. Exception Handling<br>16. Effective Input/ Output<br>17. Multithreading In Java<br>18. Generics<br>19. Collection Classes<br>20. User Interfaces<br>21. JDBC<br>22. Index<br><br><b style=\"font-weight: bold;\">About the Author</b><br><b style=\"font-weight: bold;\">Yashavant Kanetkar</b><br>Through his books and Quest Video Courses on C, C++, Java, Python, Data Structures, .NET, IoT, etc. Yashavant Kanetkar has created, molded and groomed lacs of IT careers in the last three decades. Yashavant\'s books and Quest videos have made a significant contribution in creating top-notch IT manpower in India and abroad.<br>Yashavant\'s books are globally recognized and millions of students/professionals have benefitted from them. Yashavant\'s books have been translated into Hindi, Gujarati, Japanese, Korean and Chinese languages. Many of his books are published in India, USA, Japan, Singapore, Korea and China.<br>Yashavant is a much sought after speaker in the IT field and has conducted seminars/workshops at TedEx, IITs, IIITs, NITs and global software companies.</p>', 200, 'java.png', '', '', ''),
(5, 'C++', 'C language', 'Denis Richi', 'BPB Publication', '<p>This book is for beginners...</p>', 500, 'C++.png', '', '', ''),
(6, 'Hindi Python', 'Python', 'shivam', 'SS', '<p>Awesome Book</p>', 1000.5, 'photo-1562813733-b31f71025d54.jpg', '', '', ''),
(7, 'Hindi java book', 'Java', 'shivam', 'SS', '<p>Awesome book</p>', 200.56, 'code image.jpg', 'https://www.amazon.in/', 'https://www.flipkart.com/', 'https://www.thriftbooks.com/');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_no`, `msg`, `date`) VALUES
(1, 'first post', 'firstpost@gmail.com', '12346789', 'first post', '2021-05-06 16:23:49'),
(2, 'mera naam', 'meraemail@email.com', '4545454545', 'yaar ab to add ho ja database mei', NULL),
(3, 'mera naam', 'meraemail@email.com', '4545454545', 'ab to datetime aaja', '2021-05-06 19:04:35'),
(4, 'mera naam', 'meraemail@email.com', '4545454545', 'fjkjalkjflkjflkjwklejaflkhv', '2021-05-06 20:38:07'),
(5, 'mera naam', 'meraemail@email.com', '4545454545', 'fjkjalkjflkjflkjwklejaflkhv', '2021-05-06 20:50:46'),
(6, 'mera naam', 'meraemail@email.com', '4545454545', 'akfkgkhgdkdknvknlv', '2021-05-06 20:53:12'),
(7, 'mera naam', 'meraemail@email.com', '4545454545', 'kjkflkfklgf', '2021-05-06 20:58:25'),
(8, 'mera naam', 'meraemail@email.com', '4545454545', 'dhhvsdjgskjhkj', '2021-05-06 21:03:56'),
(9, 'Abhinav Srivastava', 'abhinavsrivastava@gmail.com', '9084897343', 'Hi, this website is amazing and very useful for programmers. Thank You for this amazing website.', '2021-05-07 20:23:49'),
(10, 'Abhinav Srivastava', 'abhinavsrivastava@gmail.com', '9084897343', 'Hi, this website is amazing and very useful for programmers. Thank You for this amazing website.', '2021-05-07 20:57:33'),
(11, 'Ankita Srivastava', 'ankitasri195@gmail.com', '9361100684', 'Awesome website for developers and beginners.\r\n\r\nThank You\r\nAnkita Srivastava', '2021-05-22 21:52:43'),
(12, 'Shivam Srivastava', 'shivamsri142@gmail.com', '9354894461', 'Thank You', '2021-05-22 21:54:33'),
(13, 'Shivam Srivastava', 'shivamsri142@gmail.com', '9354894461', 'Thank You', '2021-05-22 22:01:28'),
(14, 'Fashion World', 'fashionworld.cpr@gmail.com', '9084897342', 'Thank you', '2021-05-22 22:02:38'),
(15, 'Fashion World', 'fashionworld.cpr@gmail.com', '9084897342', 'Yes successfully send...', '2021-05-22 22:08:59'),
(16, 'Fashion World', 'fashionworld.cpr@gmail.com', '9084897342', 'Yes successfully send...', '2021-05-22 22:09:25'),
(17, 'Shivam Srivastava', 'ss14021999@gmail.com', '9084897342', 'thank', '2021-05-22 22:10:00'),
(18, 'Fashion World', 'fashionworld.cpr@gmail.com', '9084897342', 'thank\r\n', '2021-05-22 22:10:57'),
(19, 'Fashion World', 'fashionworld.cpr@gmail.com', '9084897342', 'thank\r\n', '2021-05-22 22:13:41'),
(20, 'Shivam Srivastava', 'shivamsri142@gmail.com', '9354894461', 'yes', '2021-05-22 22:14:15'),
(21, 'Anushka', 'anushka@gmail.com', '9084897342', 'THis is awesome..', '2021-05-23 21:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `tittle` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `tittle`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(4, 'Wide Range of best Features', 'jinja', 'forth-post', '<p>Sandboxed execution mode. Every aspect of the template execution is monitored and explicitly whitelisted or blacklisted, whatever is preferred. This makes it possible to execute untrusted templates.\r\npowerful automatic HTML escaping system for cross site scripting prevention.\r\nTemplate inheritance makes it possible to use the same or a similar layout for all templates.\r\nHigh performance with just in time compilation to Python bytecode. Jinja2 will translate your template sources on first load into Python bytecode for best runtime performance.\r\nOptional ahead-of-time compilation\r\nEasy to debug with a debug system that integrates template compile and runtime errors into the standard Python traceback system.\r\nConfigurable syntax. For instance you can reconfigure Jinja2 to better fit output formats such as LaTeX or JavaScript.\r\nTemplate designer helpers. Jinja2 ships with a wide range of useful little helpers that help solving common tasks in templates such as breaking up sequences of items into multiple columns and more.</p><p><br><br>\r\n<a herf=\"https://www.youtube.com/\"> Shivam Srivastava\'s YouTube Channel</a>\r\n</p>', 'home-bg.jpg', '2021-05-24 15:47:34'),
(5, 'Welcome to the Pallets Projects!', 'jinja', 'fifth-post', 'The Pallets Projects are a collection of Python web development libraries that were independently developed by Armin Ronacher and later used as the basis of the Flask microframework. Today the Pallets Projects are a community-driven organization with the goal to maintain and improve those libraries.', '', '2021-05-07 21:29:46'),
(6, 'Flask', 'Flask is a lightweight ', 'sixth-post', 'Flask is a lightweight WSGI web application framework. It is designed to make getting started quick and easy, with the ability to scale up to complex applications. It began as a simple wrapper around Werkzeug and Jinja and has become one of the most popular Python web application frameworks.\r\n\r\nFlask offers suggestions, but doesn\'t enforce any dependencies or project layout. It is up to the developer to choose the tools and libraries they want to use. There are many extensions provided by the community that make adding new functionality easy.', '', '2021-05-07 21:30:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
