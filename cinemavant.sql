-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Sty 2020, 00:07
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cinemavant`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `halls`
--

CREATE TABLE `halls` (
  `hall_id` int(11) NOT NULL,
  `amount_of_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `halls`
--

INSERT INTO `halls` (`hall_id`, `amount_of_seats`) VALUES
(1, 100),
(2, 23),
(3, 10),
(9, 30),
(10, 25);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `poster` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `age_category` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `release_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `poster`, `description`, `age_category`, `genre`, `release_date`) VALUES
(1, 'Auta', 'auta.jpg', 'Speed, I am speed', 'od 3 lat', 'thriller', '2020-01-20 00:00:00'),
(4, 'Avengers: Endgame', 'brkksaj', 'film', '+10', 'Akcja', '2020-01-17 05:06:00'),
(5, 'Avengers: Infinity War', 'brak', 'film marvela', '+10', 'Akcja', '2020-01-24 10:10:00'),
(6, 'Lord of the Rings', 'brkksaj', 'film', '+10', 'fantasy', '2020-01-08 10:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `amount_of_tickets` int(11) NOT NULL DEFAULT 1,
  `seance_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `email`, `amount_of_tickets`, `seance_id`) VALUES
(2, 'admin@cinemavant.com', 1, 11),
(8, 'gethsemanens@gmail.com', 3, 11),
(9, 'gethsemanens@gmail.com', 2, 11),
(10, 'gethsemanens@gmail.com', 2, 11);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanses_times`
--

CREATE TABLE `seanses_times` (
  `seance_id` int(11) NOT NULL,
  `seance_time` datetime NOT NULL,
  `movie_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `amount_of_free` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `seanses_times`
--

INSERT INTO `seanses_times` (`seance_id`, `seance_time`, `movie_id`, `hall_id`, `amount_of_free`) VALUES
(2, '2020-01-15 13:00:00', 1, 1, 0),
(8, '2020-01-18 00:00:00', 1, 3, 0),
(11, '2020-01-23 00:00:00', 6, 1, 100),
(22, '2020-01-03 10:00:00', 4, 3, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `firstname` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`email`, `password`, `firstname`, `surname`, `updated_at`, `created_at`, `admin`) VALUES
('admin@cinemavant.com', '$2y$10$hZqTimyzGB7eHmaevCt2rewz2pte7pVXbjOnb8YMrdZxAOUFsj8L.', 'admin', 'admin', '2020-01-11 18:06:34', '2020-01-11 18:06:34', 1),
('gethsemanens@gmail.com', '$2y$10$m5ko6LDIYr0SGodnNvcqfONiF0hw59s2JS0.4ec0tYRzC7THbdaQW', 'Szymon', 'Majcher', '2020-01-11 16:59:25', '2020-01-11 16:59:25', 0),
('kuba@wp.pl', '$2y$10$33whKbXOuAyE5m7TJbxT4esu91RPADXB.OYfg5Os/8zxTE2Tam2ZW', 'Kuba', 'Kuziel', '2019-11-23 17:02:01', '2019-11-23 17:02:01', 0),
('maciej@admin.com', '$2y$10$UZz1zkXd1YRIJp5GWbGa/.hsobJpA62G8IrPPYxmzLl3gzeXdRNg2', 'Maciej', 'Lehmann', '2020-01-11 22:23:00', '2020-01-11 22:23:00', 1),
('pawcio503029855@gmail.com', '$2y$10$hHbP7YJPFhvGWWjauA/TuuRa.JMwY71v.5qvcjjdcg/Kcm24sp4Vi', 'Paweł', 'Michciński', '2019-12-19 14:17:11', '2019-12-19 14:17:11', 0),
('pawel@admin.com', '$2y$10$8SPRoSOgL8IwHfWMYX4ca.IuBMY8rAXwaA0O1AWY/VjDQLHr9h04G', 'Paweł', 'Michciński', '2020-01-11 22:23:33', '2020-01-11 22:23:33', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hall_id`);

--
-- Indeksy dla tabeli `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indeksy dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `seance_id` (`seance_id`),
  ADD KEY `email` (`email`);

--
-- Indeksy dla tabeli `seanses_times`
--
ALTER TABLE `seanses_times`
  ADD PRIMARY KEY (`seance_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `halls`
--
ALTER TABLE `halls`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `seanses_times`
--
ALTER TABLE `seanses_times`
  MODIFY `seance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`seance_id`) REFERENCES `seanses_times` (`seance_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Ograniczenia dla tabeli `seanses_times`
--
ALTER TABLE `seanses_times`
  ADD CONSTRAINT `seanses_times_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `seanses_times_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`),
  ADD CONSTRAINT `seanses_times_ibfk_3` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
