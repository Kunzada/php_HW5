-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 21 2024 г., 11:36
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `genre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `Name`, `Author`, `year`, `genre`) VALUES
(1, 'Book 1', 'Author 1', '2020', 'Genre 1'),
(2, 'Book 1', 'Author 1', '2020', 'Genre 1'),
(3, 'Hunger games', 'Suzanne Collins', '2008', 'Fantasy'),
(4, 'Hunger games', 'Suzanne Collins', '2008', 'Fantasy'),
(5, 'Pride and Prejudice', 'Jane Austen', '0000', 'Fiction'),
(6, 'To Kill a Mockingbird', 'Harper Lee', '1960', 'Classics'),
(7, 'Pride and Prejudice', 'Jane Austen', '1990', 'Fiction'),
(8, 'To Kill a Mockingbird', 'Harper Lee', '1960', 'Classics'),
(9, 'Jane Eyre', 'Charlotte Brontë', '1990', 'Historical'),
(10, 'The Little Prince', 'Antoine de Saint-Exupéry', '2018', 'Fantasy'),
(11, 'The Little Prince', 'Antoine de Saint-Exupéry', '2018', 'Fantasy');

-- --------------------------------------------------------

--
-- Структура таблицы `readers`
--

CREATE TABLE `readers` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Surname` varchar(255) NOT NULL,
  `Fathername` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `readers`
--

INSERT INTO `readers` (`id`, `Name`, `Surname`, `Fathername`, `birthday`, `address`) VALUES
(1, 'Kaskanova', 'Adele', 'Talgatovna', '2006-01-05', 'Break street 43'),
(2, 'Kaskanova', 'Adele', 'Talgatovna', '2006-01-05', 'Break street 43'),
(3, 'Jane', 'Mark', NULL, '1990-05-01', 'Ula street 23'),
(4, 'Kamila', 'Amirtaevna', 'Kairatovna', '2000-05-03', 'Uly dala 34'),
(5, 'Jane', 'Mark', NULL, '1990-05-01', 'Ula street 23'),
(6, 'Kamila', 'Amirtaevna', 'Kairatovna', '2000-05-03', 'Uly dala 34'),
(7, 'Azhar', 'Maratovna', NULL, '2017-05-04', 'Nono street 23'),
(8, 'Laura', 'Damirova', 'Asetovna', '2016-05-20', 'Jana zhol 14'),
(9, 'Azhar', 'Maratovna', NULL, '2017-05-04', 'Nono street 23'),
(10, 'Laura', 'Damirova', 'Asetovna', '2016-05-20', 'Jana zhol 14');

-- --------------------------------------------------------

--
-- Структура таблицы `rentals`
--

CREATE TABLE `rentals` (
  `Id_rentals` int(11) NOT NULL,
  `id_books` int(11) NOT NULL,
  `id_readers` int(11) NOT NULL,
  `date_of_collection` date NOT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `rentals`
--

INSERT INTO `rentals` (`Id_rentals`, `id_books`, `id_readers`, `date_of_collection`, `return_date`) VALUES
(1, 4, 4, '2024-05-01', '2024-05-24'),
(2, 4, 4, '2024-05-01', '2024-05-24'),
(3, 3, 7, '2016-05-10', '2024-05-31'),
(4, 3, 7, '2016-05-10', '2024-05-31'),
(5, 8, 1, '2024-05-23', NULL),
(6, 8, 1, '2024-05-23', NULL),
(7, 5, 10, '2024-05-31', NULL),
(8, 1, 9, '2024-05-14', NULL),
(9, 5, 10, '2024-05-31', NULL),
(10, 1, 9, '2024-05-14', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `readers`
--
ALTER TABLE `readers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`Id_rentals`),
  ADD KEY `readers` (`id_readers`),
  ADD KEY `books` (`id_books`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `readers`
--
ALTER TABLE `readers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `rentals`
--
ALTER TABLE `rentals`
  MODIFY `Id_rentals` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `books` FOREIGN KEY (`id_books`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `readers` FOREIGN KEY (`id_readers`) REFERENCES `readers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
