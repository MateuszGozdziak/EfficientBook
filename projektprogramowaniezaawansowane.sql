-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Gru 2021, 23:52
-- Wersja serwera: 10.4.19-MariaDB
-- Wersja PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projektprogramowaniezaawansowane`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_Klienta` int(11) NOT NULL,
  `Nazwa_Firmy` varchar(15) NOT NULL,
  `Imie` varchar(15) NOT NULL,
  `Nazwisko` varchar(15) NOT NULL,
  `NIP` int(11) NOT NULL,
  `Numer_telefonu` int(11) NOT NULL,
  `Email` varchar(15) NOT NULL,
  `Adres` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`ID_Klienta`, `Nazwa_Firmy`, `Imie`, `Nazwisko`, `NIP`, `Numer_telefonu`, `Email`, `Adres`) VALUES
(1, 'testNazwaFirmy', 'Adam', 'Kozek', 0, 102103104, 'testmail', 'Ulicaulica');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_Pracownika` int(11) NOT NULL,
  `Imie` varchar(15) NOT NULL,
  `Nazwisko` varchar(15) NOT NULL,
  `Login` varchar(15) NOT NULL,
  `Haslo` varchar(15) NOT NULL,
  `CzyAdmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_Pracownika`, `Imie`, `Nazwisko`, `Login`, `Haslo`, `CzyAdmin`) VALUES
(1, 'Wojtek', 'Grzes', 'testlogin', 'testhaslo', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `ID_Produktu` int(11) NOT NULL,
  `Nazwa` varchar(15) NOT NULL,
  `Ilosc_dostepnych` int(11) NOT NULL,
  `Cena_brutto` int(11) NOT NULL,
  `Cena_netto` int(11) NOT NULL,
  `Kod` varchar(15) NOT NULL,
  `Marka` varchar(15) NOT NULL,
  `VAT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`ID_Produktu`, `Nazwa`, `Ilosc_dostepnych`, `Cena_brutto`, `Cena_netto`, `Kod`, `Marka`, `VAT`) VALUES
(1, 'Piwo', 100, 10, 8, 'axj4fzzdfkkdp', 'TYSKIE', 23),
(2, 'kubuś', 144, 5, 3, 'axasdfasdsdp', 'Marka_kubus', 23),
(3, 'whisky', 130, 180, 120, 'axj4dddfkkdp', 'Jack', 23);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `todo`
--

CREATE TABLE `todo` (
  `ID_ToDo` int(11) NOT NULL,
  `ID_Pracownika` int(11) NOT NULL,
  `Tytul` varchar(40) NOT NULL,
  `Opis` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `ID_Zamowienia` int(11) NOT NULL,
  `ID_Klienta` int(11) NOT NULL,
  `Termin` date NOT NULL,
  `Metoda_Platnosci` varchar(15) NOT NULL,
  `Numer_Trackingowy` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`ID_Zamowienia`, `ID_Klienta`, `Termin`, `Metoda_Platnosci`, `Numer_Trackingowy`) VALUES
(1, 1, '2021-12-09', 'karta', 'numertrack1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowione_produkty`
--

CREATE TABLE `zamowione_produkty` (
  `ID_zamowione_produkty` int(11) NOT NULL,
  `ID_zamowienia` int(11) NOT NULL,
  `ID_produkty` int(11) NOT NULL,
  `Ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowione_produkty`
--

INSERT INTO `zamowione_produkty` (`ID_zamowione_produkty`, `ID_zamowienia`, `ID_produkty`, `Ilosc`) VALUES
(1, 1, 1, 6);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_Klienta`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_Pracownika`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`ID_Produktu`);

--
-- Indeksy dla tabeli `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`ID_ToDo`),
  ADD KEY `ID_Pracownika` (`ID_Pracownika`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`ID_Zamowienia`),
  ADD KEY `ID_Klienta` (`ID_Klienta`);

--
-- Indeksy dla tabeli `zamowione_produkty`
--
ALTER TABLE `zamowione_produkty`
  ADD PRIMARY KEY (`ID_zamowione_produkty`),
  ADD KEY `ID_zamowienia` (`ID_zamowienia`),
  ADD KEY `ID_produkty` (`ID_produkty`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_Klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_Pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `todo`
--
ALTER TABLE `todo`
  MODIFY `ID_ToDo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `ID_Zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `zamowione_produkty`
--
ALTER TABLE `zamowione_produkty`
  MODIFY `ID_zamowione_produkty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`ID_Pracownika`) REFERENCES `pracownicy` (`ID_Pracownika`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klienci` (`ID_Klienta`);

--
-- Ograniczenia dla tabeli `zamowione_produkty`
--
ALTER TABLE `zamowione_produkty`
  ADD CONSTRAINT `zamowione_produkty_ibfk_1` FOREIGN KEY (`ID_zamowienia`) REFERENCES `zamowienia` (`ID_Zamowienia`),
  ADD CONSTRAINT `zamowione_produkty_ibfk_2` FOREIGN KEY (`ID_produkty`) REFERENCES `produkty` (`ID_Produktu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
