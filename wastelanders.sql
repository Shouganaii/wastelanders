-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Set-2019 às 00:11
-- Versão do servidor: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wastelanders`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `date_posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `photos`
--

INSERT INTO `photos` (`id`, `id_user`, `url`, `date_posted`) VALUES
(1, 1, 'asjkdhakjsd', '2019-09-18 00:00:00'),
(2, 2, 'asdklansdk', '2019-09-10 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `photos_comments`
--

CREATE TABLE `photos_comments` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL,
  `date_comment` datetime NOT NULL,
  `txt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `photos_comments`
--

INSERT INTO `photos_comments` (`id`, `id_user`, `id_photo`, `date_comment`, `txt`) VALUES
(1, 1, 2, '2019-09-01 09:21:24', 'top'),
(2, 1, 2, '2019-09-23 00:00:00', 'massa dms man');

-- --------------------------------------------------------

--
-- Estrutura da tabela `photos_likes`
--

CREATE TABLE `photos_likes` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `photos_likes`
--

INSERT INTO `photos_likes` (`id`, `id_user`, `id_photo`) VALUES
(1, 1, 2),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `pass`, `avatar`) VALUES
(1, 'caio', 'admin@admin', '$2y$07$BCryptRequires22Chrcte/VlQH0piJtjXl.0t1XkA8pw9dMXTpOq', ''),
(2, 'testador', 'teste@teste.com.br', '$2y$10$LN0Qmpks9Nk8rzm4TvcMTu7GlNiJ9JtqHbsslXthWwgP/Cpx/lb7i', ''),
(3, 'Caio', 'frias.caio@yahoo.com.br', '$2y$10$nvbwz360UuQRjM.YqRTjke4XteE5N1oZFArPINUP7OqPjaXmv3FyG', ''),
(4, '123', 'meuemail@hotmail.com.br', '$2y$10$7AKPng12aSy1e4iUvYWsr.UY45jgIclESuGZd9Ity6bb3BBdb5ZfS', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_following`
--

CREATE TABLE `users_following` (
  `id` int(11) NOT NULL,
  `id_user_active` int(11) NOT NULL,
  `id_user_passive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_following`
--

INSERT INTO `users_following` (`id`, `id_user_active`, `id_user_passive`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 1, 3),
(4, 2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos_comments`
--
ALTER TABLE `photos_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos_likes`
--
ALTER TABLE `photos_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_following`
--
ALTER TABLE `users_following`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photos_comments`
--
ALTER TABLE `photos_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photos_likes`
--
ALTER TABLE `photos_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_following`
--
ALTER TABLE `users_following`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
