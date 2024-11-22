-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/11/2024 às 23:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_sim`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_admin`
--

CREATE TABLE `tb_admin` (
  `idAdmin` int(11) NOT NULL COMMENT 'PK do admin',
  `login` varchar(50) NOT NULL COMMENT 'Login do admin',
  `senha` varchar(255) NOT NULL COMMENT 'Senha do admin',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do admin',
  `permissao` char(3) NOT NULL COMMENT 'Permissões do admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_admin`
--

INSERT INTO `tb_admin` (`idAdmin`, `login`, `senha`, `nome`, `permissao`) VALUES
(1, 'Rodrigo', '25d55ad283aa400af464c76d713c07ad', 'Rodrigo dos Santos', 'ce'),
(2, 'Beatriz', '25d55ad283aa400af464c76d713c07ad', 'Beatriz Henrique', 'a'),
(3, 'Gustavo', '25d55ad283aa400af464c76d713c07ad', 'Gustavo Rodrigues', 'd'),
(4, 'Alessandro', '25d55ad283aa400af464c76d713c07ad', 'Alessando Gutierrez', 'e'),
(5, 'Alexander', '25d55ad283aa400af464c76d713c07ad', 'Alexander Leal', 'c'),
(6, 'Gabriel', '25d55ad283aa400af464c76d713c07ad', 'Gabriel Jesus', 'r'),
(7, 'Ismael', '25d55ad283aa400af464c76d713c07ad', 'Ismael dos Santos', 'r'),
(8, 'Kalebe', '25d55ad283aa400af464c76d713c07ad', 'Kalebe Gonçalves', 'r');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pedido`
--

CREATE TABLE `tb_pedido` (
  `idPedido` int(11) NOT NULL COMMENT 'id da tabela pedido',
  `idPf` int(11) DEFAULT NULL COMMENT 'FK do pf',
  `idPj` int(11) DEFAULT NULL COMMENT 'FK do pj',
  `resolvido` tinyint(1) NOT NULL COMMENT 'se está resolvido ou não',
  `problema` longtext NOT NULL COMMENT 'Descrição do problema',
  `colaborador` varchar(20) NOT NULL COMMENT 'Nome do colaborador',
  `dataInicio` datetime NOT NULL COMMENT 'Data do inicio do pedido',
  `dataFim` datetime DEFAULT NULL COMMENT 'Data do fim do pedido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Tabela de pedidos';

--
-- Despejando dados para a tabela `tb_pedido`
--

INSERT INTO `tb_pedido` (`idPedido`, `idPf`, `idPj`, `resolvido`, `problema`, `colaborador`, `dataInicio`, `dataFim`) VALUES
(6, 7, NULL, 0, 'problema', 'gustavo', '2024-10-19 16:43:19', NULL),
(7, NULL, 3, 0, 'a', 'gustavo', '2024-10-19 16:44:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pf`
--

CREATE TABLE `tb_pf` (
  `idPf` int(11) NOT NULL COMMENT 'PK do pf',
  `cpf` char(14) NOT NULL COMMENT 'CPF do cliente PF',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do cliente PF',
  `rg` char(12) NOT NULL COMMENT 'RG do cliente PF',
  `nascimento` date NOT NULL COMMENT 'Data de nascimento do cliente PF',
  `email` varchar(50) NOT NULL COMMENT 'Email do cliente PF',
  `celular` char(14) NOT NULL COMMENT 'Número de celular do cliente PF',
  `idVeiculo` int(11) NOT NULL COMMENT 'FK do veiculo',
  `placa` char(7) NOT NULL COMMENT 'Placa do carro do cliente PF',
  `corCarro` varchar(20) NOT NULL COMMENT 'Cor do carro do cliente PF',
  `endereco` varchar(150) NOT NULL COMMENT 'Endereço do cliente PF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_pf`
--

INSERT INTO `tb_pf` (`idPf`, `cpf`, `nome`, `rg`, `nascimento`, `email`, `celular`, `idVeiculo`, `placa`, `corCarro`, `endereco`) VALUES
(7, '506.456.218-70', 'Gustavo', '123456789', '2024-10-25', 'gurosousa6@uni9.edu.br', '(11)96066-6840', 4, 'ABC1D23', '#00fbff', 'Rua gustavo, 129');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pj`
--

CREATE TABLE `tb_pj` (
  `idPj` int(11) NOT NULL COMMENT 'PK da tabela PJ ',
  `cnpj` char(20) NOT NULL COMMENT 'CNPJ do cliente PJ',
  `nome` varchar(100) NOT NULL COMMENT 'Nome do cliente PJ',
  `razaoSocial` varchar(100) NOT NULL COMMENT 'Razão Social do cliente PJ',
  `insEstadual` char(12) NOT NULL COMMENT 'Inscrição Estadual do cliente PJ',
  `email` varchar(50) NOT NULL COMMENT 'Email do cliente PJ',
  `celular` char(14) NOT NULL COMMENT 'Número do cliente PJ',
  `idVeiculo` int(11) NOT NULL COMMENT 'FK do veículo',
  `placa` char(7) NOT NULL COMMENT 'Placa do carro do cliente PJ',
  `corCarro` varchar(20) NOT NULL COMMENT 'Cor do carro do cliente PJ',
  `endereco` varchar(150) NOT NULL COMMENT 'Endereço do cliente PJ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_pj`
--

INSERT INTO `tb_pj` (`idPj`, `cnpj`, `nome`, `razaoSocial`, `insEstadual`, `email`, `celular`, `idVeiculo`, `placa`, `corCarro`, `endereco`) VALUES
(3, '00.000.000/0000-00', 'Gustavo', 'a', '12.345.678-9', 'gurosousa6@uni9.edu.br', '(11)96066-6840', 3, 'ABC1D23', '#00ff04', 'Rua gustavo, 129');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_veiculo`
--

CREATE TABLE `tb_veiculo` (
  `idVeiculo` int(11) NOT NULL COMMENT 'PK do Veículo',
  `marca` varchar(20) NOT NULL COMMENT 'Marca do veículo',
  `modelo` varchar(20) NOT NULL COMMENT 'Modelo do veículo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tb_veiculo`
--

INSERT INTO `tb_veiculo` (`idVeiculo`, `marca`, `modelo`) VALUES
(1, 'Fiat', 'Uno'),
(2, 'Chevrolet', 'Onix'),
(3, 'Toyota', 'Corolla'),
(4, 'Honda', 'Civic');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Índices de tabela `tb_pedido`
--
ALTER TABLE `tb_pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `FK_idPF` (`idPf`),
  ADD KEY `FK_idPj` (`idPj`);

--
-- Índices de tabela `tb_pf`
--
ALTER TABLE `tb_pf`
  ADD PRIMARY KEY (`idPf`),
  ADD KEY `FK_PF_idVeiculo` (`idVeiculo`);

--
-- Índices de tabela `tb_pj`
--
ALTER TABLE `tb_pj`
  ADD PRIMARY KEY (`idPj`),
  ADD KEY `FK_PJ_idVeiculo` (`idVeiculo`);

--
-- Índices de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  ADD PRIMARY KEY (`idVeiculo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK do admin', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tb_pedido`
--
ALTER TABLE `tb_pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id da tabela pedido', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_pf`
--
ALTER TABLE `tb_pf`
  MODIFY `idPf` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK do pf', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_pj`
--
ALTER TABLE `tb_pj`
  MODIFY `idPj` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK da tabela PJ ', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_veiculo`
--
ALTER TABLE `tb_veiculo`
  MODIFY `idVeiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK do Veículo', AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_pedido`
--
ALTER TABLE `tb_pedido`
  ADD CONSTRAINT `FK_idPF` FOREIGN KEY (`idPf`) REFERENCES `tb_pf` (`idPf`),
  ADD CONSTRAINT `FK_idPj` FOREIGN KEY (`idPj`) REFERENCES `tb_pj` (`idPj`);

--
-- Restrições para tabelas `tb_pf`
--
ALTER TABLE `tb_pf`
  ADD CONSTRAINT `FK_PF_idVeiculo` FOREIGN KEY (`idVeiculo`) REFERENCES `tb_veiculo` (`idVeiculo`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_pj`
--
ALTER TABLE `tb_pj`
  ADD CONSTRAINT `FK_PJ_idVeiculo` FOREIGN KEY (`idVeiculo`) REFERENCES `tb_veiculo` (`idVeiculo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
