-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Jun-2019 às 18:14
-- Versão do servidor: 10.1.40-MariaDB
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diario_de_classe`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `RA` varchar(11) NOT NULL,
  `nome_aluno` varchar(100) NOT NULL,
  `email_aluno` varchar(50) NOT NULL,
  `senha_aluno` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `codigo_disciplina` varchar(11) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula_aluno`
--

CREATE TABLE `matricula_aluno` (
  `id_turma_disciplina` varchar(11) NOT NULL,
  `RA` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `matricula` varchar(11) NOT NULL,
  `nome_professor` varchar(100) NOT NULL,
  `email_professor` varchar(50) NOT NULL,
  `senha_professor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `codigo_turma` varchar(11) NOT NULL,
  `turma` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_disciplina`
--

CREATE TABLE `turma_disciplina` (
  `id_turma_disciplina` varchar(11) NOT NULL,
  `codigo_disciplina` varchar(11) NOT NULL,
  `codigo_turma` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_disciplina_professor`
--

CREATE TABLE `turma_disciplina_professor` (
  `id_turma_disciplina` varchar(11) NOT NULL,
  `matricula` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`RA`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`codigo_disciplina`);

--
-- Indexes for table `matricula_aluno`
--
ALTER TABLE `matricula_aluno`
  ADD KEY `ra` (`RA`),
  ADD KEY `disciplina_turma` (`id_turma_disciplina`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`matricula`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`codigo_turma`);

--
-- Indexes for table `turma_disciplina`
--
ALTER TABLE `turma_disciplina`
  ADD PRIMARY KEY (`id_turma_disciplina`),
  ADD KEY `disciplina` (`codigo_disciplina`),
  ADD KEY `turma` (`codigo_turma`);

--
-- Indexes for table `turma_disciplina_professor`
--
ALTER TABLE `turma_disciplina_professor`
  ADD KEY `turma_disciplina` (`id_turma_disciplina`),
  ADD KEY `turma_professor` (`matricula`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `matricula_aluno`
--
ALTER TABLE `matricula_aluno`
  ADD CONSTRAINT `disciplina_turma` FOREIGN KEY (`id_turma_disciplina`) REFERENCES `turma_disciplina` (`id_turma_disciplina`),
  ADD CONSTRAINT `ra` FOREIGN KEY (`RA`) REFERENCES `aluno` (`RA`);

--
-- Limitadores para a tabela `turma_disciplina`
--
ALTER TABLE `turma_disciplina`
  ADD CONSTRAINT `disciplina` FOREIGN KEY (`codigo_disciplina`) REFERENCES `disciplina` (`codigo_disciplina`),
  ADD CONSTRAINT `turma` FOREIGN KEY (`codigo_turma`) REFERENCES `turma` (`codigo_turma`);

--
-- Limitadores para a tabela `turma_disciplina_professor`
--
ALTER TABLE `turma_disciplina_professor`
  ADD CONSTRAINT `turma_disciplina` FOREIGN KEY (`id_turma_disciplina`) REFERENCES `turma_disciplina` (`id_turma_disciplina`),
  ADD CONSTRAINT `turma_professor` FOREIGN KEY (`matricula`) REFERENCES `professor` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
