SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `bookshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bookshop`;

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `authors` (`id`, `name`, `surname`) VALUES
(1, 'Джордж', 'Оруэлл'),
(2, 'Фридрих', 'Ницше'),
(3, 'Иоганн Вольфганг', 'фон Гёте'),
(4, 'Дмитрий', 'Котеров'),
(5, 'Игорь', 'Симдянов'),
(6, 'Джон', 'Толкин'),
(7, 'Аркадий', 'Стругацкий'),
(8, 'Борис', 'Стругацкий');

DROP TABLE IF EXISTS `authors_books`;
CREATE TABLE `authors_books` (
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `authors_books` (`author_id`, `book_id`) VALUES
(1, 3),
(1, 7),
(2, 1),
(3, 2),
(4, 4),
(5, 4),
(6, 5),
(7, 6),
(8, 6);

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` int(20) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` int(11) NOT NULL DEFAULT 1,
  `public_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `books` (`id`, `isbn`, `title`, `pages`, `public_date`) VALUES
(1, 123123123, 'Так говорил Заратустра', 100, NULL),
(2, 234234234, 'Фауст', 100, NULL),
(3, 345345345, '1984', 100, NULL),
(4, 567567567, 'PHP 7 в подлиннике', 1000, NULL),
(5, 678678678, 'Властелин колец', 100, NULL),
(6, 789789789, 'Пикник на обочине', 100, NULL),
(7, 890890890, 'Скотный двор', 100, NULL);

DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `genres` (`id`, `genre`) VALUES
(1, 'Фантастика'),
(2, 'Антиутопия'),
(3, 'Приключения'),
(4, 'Философия'),
(5, 'Трагедия'),
(6, 'Программирование');

DROP TABLE IF EXISTS `genres_books`;
CREATE TABLE `genres_books` (
  `book_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `genres_books` (`book_id`, `genres_id`) VALUES
(1, 4),
(2, 5),
(3, 2),
(3, 1),
(4, 6),
(5, 1),
(5, 3),
(6, 1),
(6, 3),
(7, 2);


ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `authors_books`
  ADD KEY `author_id` (`author_id`),
  ADD KEY `book_id` (`book_id`);

ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `genres_books`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genres_id` (`genres_id`);


ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `authors_books`
  ADD CONSTRAINT `authors_books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authors_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `genres_books`
  ADD CONSTRAINT `genres_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `genres_books_ibfk_2` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SELECT * FROM books INNER JOIN authors_books ON id = book_id INNER JOIN authors ON author_id = authors.id INNER JOIN genres_books ON books.id = genres_books.book_id INNER JOIN genres ON genres_id = genres.id WHERE genres_id = 1;
SELECT authors.name, authors.surname, COUNT(authors_books.book_id) FROM authors INNER JOIN authors_books ON authors.id = authors_books.author_id GROUP BY authors.id LIMIT 1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
