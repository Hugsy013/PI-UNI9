-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2024 às 22:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
CREATE DATABASE IF NOT EXISTS `bd_sim` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_sim`;

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
(8, 7, NULL, 0, 'Pneu furado', 'Beatriz', '2024-11-20 00:27:35', '2024-11-22 20:27:36'),
(9, 11, NULL, 1, 'Carro batido', 'Gustavo', '2024-11-20 00:27:35', '2024-11-30 20:27:36'),
(10, 11, NULL, 0, 'Repintura', 'Rodrigo', '2024-11-20 00:44:53', '2024-11-29 20:44:53');

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
(7, '506.456.218-70', 'Gustavo R', '123456789', '0000-00-00', 'gurosousa6@uni9.edu.br', '(11)96066-6840', 4, 'ABC1D23', '#00fbff', 'Rua gustavo, 129'),
(10, '503.868.078-09', 'Beatriz Alves', '53.146.888-4', '0000-00-00', 'bia.h.alves2001@uni9.edu.br', '(11)94363-1126', 3, 'ABC1D23', 'Preto', 'Rua Exemplo, 123'),
(11, '511.220.018-84', 'Matheus Lucas Gomes', '39.179.740-4', '0000-00-00', 'gomeslucas.matheus@uni9.edu.br', '(11)94604-4074', 4, 'DJU7H25', 'Preto', 'Rua Carlos Beumiro Correira, 644 - 02532-012');

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
(3, '00.000.000/0000-00', 'Gustavo', 'a', '12.345.678-9', 'gurosousa6@uni9.edu.br', '(11)96066-6840', 3, 'ABC1D23', 'Preto', 'Rua gustavo, 129'),
(4, '00.000.000/0000-00', 'Beatriz', 'a', '12.345.678-9', 'bia.a6@uni9.edu.br', '(11)99876-6840', 1, 'AEC9756', 'Branco', 'Rua alvarez, 129'),
(5, '00.000.000/0000-00', 'Rodrigo', 'a', '12.335.648-9', 'rodrigo.s@uni9.edu.br', '(11)93876-0000', 4, 'ADC9688', 'Verde àgua', 'Rua tonelli, 129');

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
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id da tabela pedido', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_pf`
--
ALTER TABLE `tb_pf`
  MODIFY `idPf` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK do pf', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_pj`
--
ALTER TABLE `tb_pj`
  MODIFY `idPj` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK da tabela PJ ', AUTO_INCREMENT=6;

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
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-22 21:07:52', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt_BR\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
