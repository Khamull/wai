-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Dez-2014 às 20:45
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sobavi`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso`
--

CREATE TABLE IF NOT EXISTS `acesso` (
`acessoID` int(11) NOT NULL,
  `acessoUsuario` varchar(50) NOT NULL,
  `acessoIP` varchar(15) NOT NULL,
  `acessoData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE IF NOT EXISTS `caixa` (
`caixaID` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `funcionario` varchar(100) NOT NULL,
  `valorInicial` float(10,2) NOT NULL,
  `valorFinal` float(10,2) NOT NULL,
  `vendaInicial` int(11) NOT NULL,
  `vendaFinal` int(11) NOT NULL,
  `lancamentoInicial` int(11) NOT NULL,
  `lancamentoFinal` int(11) NOT NULL,
  `retiradaInicial` int(11) NOT NULL,
  `retiradaFinal` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dataInicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`caixaID`, `usuario`, `funcionario`, `valorInicial`, `valorFinal`, `vendaInicial`, `vendaFinal`, `lancamentoInicial`, `lancamentoFinal`, `retiradaInicial`, `retiradaFinal`, `data`, `dataInicio`, `status`) VALUES
(1, 'gesse', '1', 0.00, 250.00, 1, 8, 1, 12, 1, 1, '2012-09-10 12:00:56', '2012-09-06 19:49:23', 'F'),
(2, 'hernani', '2', 0.00, 0.00, 1, 1, 2, 2, 1, 1, '2012-09-08 17:32:45', '2012-09-07 22:34:48', 'F'),
(3, 'hernani', '1', 0.00, 0.00, 1, 2, 2, 3, 1, 1, '2012-09-08 17:41:34', '2012-09-08 17:33:08', 'F'),
(4, 'hernani', '2', 0.00, 0.00, 2, 4, 3, 3, 1, 1, '2012-09-09 03:02:02', '2012-09-09 02:42:15', 'F'),
(5, 'hernani', '2', 155.00, 155.00, 4, 7, 11, 12, 1, 1, '2012-09-09 19:24:50', '2012-09-09 19:07:28', 'F'),
(6, 'gesse', '1', 0.00, 250.00, 1, 9, 12, 12, 1, 1, '2012-09-10 12:15:18', '2012-09-10 12:01:10', 'F'),
(7, 'GESSE', '1', 0.00, 1434.00, 9, 13, 12, 15, 1, 1, '2012-09-10 12:53:04', '2012-09-10 12:23:00', 'F'),
(8, 'gesse', '1', 0.00, 250.00, 13, 27, 15, 80, 1, 2, '2012-09-14 13:40:33', '2012-09-11 12:30:42', 'F'),
(9, 'hernani', '2', 0.00, 3056.00, 7, 20, 15, 38, 1, 1, '2012-09-13 10:48:58', '2012-09-11 12:32:22', 'F'),
(10, 'hernani', '2', 0.00, 0.00, 17, 20, 38, 38, 1, 1, '2012-09-14 12:00:43', '2012-09-14 11:47:11', 'F'),
(11, 'hernani', '2', 50.00, -98830.10, 17, 23, 38, 76, 1, 2, '2012-09-14 13:19:20', '2012-09-14 12:28:52', 'F'),
(12, 'hernani', '2', 50.00, 1869.90, 23, 27, 76, 78, 2, 2, '2012-09-14 13:29:48', '2012-09-14 13:22:10', 'F'),
(13, 'gesse', '1', 50.00, 369.90, 20, 29, 80, 86, 2, 2, '2012-09-17 19:30:00', '2012-09-17 19:09:02', 'F'),
(14, 'gesse', '1', 0.00, 1819.90, 29, 30, 86, 87, 2, 2, '2012-09-21 22:02:08', '2012-09-21 22:00:44', 'F'),
(15, 'gesse', '1', 10.00, 622.90, 30, 38, 87, 96, 2, 2, '2012-09-25 17:44:46', '2012-09-24 11:14:26', 'F'),
(16, 'gesse', '1', 100.00, 699.50, 38, 41, 96, 101, 2, 2, '2012-09-25 19:23:30', '2012-09-25 17:45:46', 'F'),
(17, 'gesse', '1', 10.00, 3912.00, 41, 52, 103, 115, 2, 2, '2012-10-05 11:55:07', '2012-09-26 19:11:47', 'F'),
(18, 'hernani', '2', 0.00, 69.90, 27, 52, 105, 115, 2, 2, '2012-10-05 11:57:46', '2012-10-01 01:42:52', 'F'),
(19, 'hernani', '1', 10.00, 0.00, 28, 0, 115, 0, 2, 0, '2012-10-05 11:58:56', '2012-10-05 11:58:56', 'A'),
(20, 'gesse', '1', 10.00, 699.20, 52, 56, 115, 120, 2, 2, '2012-10-05 12:09:44', '2012-10-05 12:00:15', 'F'),
(21, 'gesse', '1', 0.00, 432.70, 56, 58, 120, 121, 2, 2, '2012-10-17 16:31:01', '2012-10-05 20:07:24', 'F'),
(22, 'viviane', '3', 50.00, 0.00, 1, 0, 120, 0, 2, 0, '2012-10-05 20:44:57', '2012-10-05 20:44:57', 'A'),
(23, 'WALTER', '1', 0.00, 0.00, 1, 0, 121, 0, 2, 0, '2012-10-16 18:42:06', '2012-10-16 18:42:06', 'A'),
(24, 'gesse1', '1', 50.00, 594.00, 1, 63, 150, 152, 2, 3, '2012-10-17 17:59:54', '2012-10-17 17:26:59', 'F'),
(25, 'gesse', '1', 0.00, 3792.70, 57, 65, 158, 164, 3, 3, '2013-04-05 11:38:12', '2012-10-17 18:22:18', 'F'),
(26, 'gesse', '1', 100.00, 1921.95, 65, 74, 165, 172, 3, 3, '2013-06-05 17:34:24', '2013-04-09 20:08:30', 'F'),
(27, 'gesse', '1', 0.00, 1774.70, 73, 79, 172, 178, 3, 3, '2014-06-26 20:51:27', '2013-06-05 17:58:43', 'F'),
(28, 'gesse', '1', 50.00, 2109.70, 80, 82, 178, 181, 3, 3, '2014-09-16 16:37:51', '2014-06-26 20:55:38', 'F'),
(29, 'gesse', '1', 10.00, 1317.70, 83, 84, 181, 187, 3, 3, '2014-09-16 16:57:16', '2014-09-16 16:38:48', 'F'),
(30, 'gesse', '1', 10.00, 1217.70, 85, 86, 187, 188, 3, 3, '2014-10-09 19:14:42', '2014-09-24 13:07:29', 'F'),
(31, 'gesse', '1', 10.00, 1272.70, 87, 88, 188, 192, 3, 3, '2014-12-04 18:52:44', '2014-12-04 18:16:14', 'F'),
(32, 'adm', '1', 1000.00, 0.00, 1, 0, 193, 0, 3, 0, '2014-12-26 17:16:51', '2014-12-26 17:16:51', 'A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
`cargoID` int(11) NOT NULL,
  `cargoTitulo` varchar(40) NOT NULL,
  `cargoDescricao` text NOT NULL,
  `cargoData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cargoAtivo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`cargoID`, `cargoTitulo`, `cargoDescricao`, `cargoData`, `cargoAtivo`) VALUES
(1, 'Gerente', '', '2012-07-05 12:48:18', 'S'),
(2, 'Vendedor', '', '2012-07-05 13:05:03', 'S'),
(3, 'Caixa', '', '2012-07-05 16:23:37', 'S'),
(4, 'Balconista', 'Irá realizar as tarefas de balção e interação com os clientes.', '2012-07-05 13:57:09', 'S'),
(5, 'ASSISTENTE INFORMATICA ', '', '2013-04-09 20:02:02', 'N'),
(6, 'TECNICO INFORMATICA ', '', '2013-04-09 20:02:04', 'N'),
(7, 'Motorista', '', '2013-04-09 20:01:46', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cheques`
--

CREATE TABLE IF NOT EXISTS `cheques` (
`chequeID` int(11) NOT NULL,
  `receberID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `valorCheque` float(10,2) NOT NULL,
  `numeroCheque` varchar(30) NOT NULL,
  `vencimentoCheque` date NOT NULL,
  `observacoes` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `cheques`
--

INSERT INTO `cheques` (`chequeID`, `receberID`, `clienteID`, `valorCheque`, `numeroCheque`, `vencimentoCheque`, `observacoes`) VALUES
(1, 56, 1, 1230.52, '258369', '2012-09-11', 'cheque devolvido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
`clienteID` int(11) NOT NULL,
  `tipoPessoa` varchar(1) NOT NULL,
  `clienteNomeFantasia` varchar(40) NOT NULL,
  `clienteRazaoSocial` varchar(40) NOT NULL,
  `clienteCnpj` varchar(20) NOT NULL,
  `clienteInscEstadual` varchar(20) NOT NULL,
  `clienteInscMunicipal` varchar(20) NOT NULL,
  `clienteEndereco` varchar(40) NOT NULL,
  `clienteNumero` varchar(6) NOT NULL,
  `clienteBairro` varchar(50) NOT NULL,
  `clienteCep` varchar(10) NOT NULL,
  `clienteCidade` varchar(20) NOT NULL,
  `clienteUf` varchar(2) NOT NULL,
  `clienteComplemento` text NOT NULL,
  `clienteContato` varchar(30) NOT NULL,
  `clienteTelefone` varchar(14) NOT NULL,
  `clienteFax` varchar(14) NOT NULL,
  `clienteRadio` varchar(15) NOT NULL,
  `clienteCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(20) NOT NULL,
  `clienteEmail` varchar(100) NOT NULL,
  `clienteSite` varchar(100) NOT NULL,
  `clienteAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `clienteData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clienteUsuario` varchar(40) NOT NULL,
  `limiteCredito` float(16,4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteID`, `tipoPessoa`, `clienteNomeFantasia`, `clienteRazaoSocial`, `clienteCnpj`, `clienteInscEstadual`, `clienteInscMunicipal`, `clienteEndereco`, `clienteNumero`, `clienteBairro`, `clienteCep`, `clienteCidade`, `clienteUf`, `clienteComplemento`, `clienteContato`, `clienteTelefone`, `clienteFax`, `clienteRadio`, `clienteCelular`, `operadoraCelular`, `clienteEmail`, `clienteSite`, `clienteAtivo`, `clienteData`, `clienteUsuario`, `limiteCredito`) VALUES
(1, 'f', 'quecaralhodebasededadosquenaotemcliente', 'quecaralhodebasededadosquenaotemcliente', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'S', '2014-12-26 17:22:55', '', 0.0000),
(2, 'f', 'quecaralhodebasededadosquenaotemcliente2', 'quecaralhodebasededadosquenaotemcliente2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'S', '2014-12-26 17:23:35', '', 2000000.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contapagar`
--

CREATE TABLE IF NOT EXISTS `contapagar` (
`contapagarID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `favorecido` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `intervalo` int(11) NOT NULL,
  `data` date NOT NULL,
  `usuario` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `contapagar`
--

INSERT INTO `contapagar` (`contapagarID`, `formPagID`, `favorecido`, `valor`, `vezes`, `intervalo`, `data`, `usuario`) VALUES
(1, 6, 'nokia', 500.00, 14, 30, '2012-09-20', 'hernani'),
(2, 6, 'forte em midia', 1000.00, 3, 30, '2012-09-30', 'gesse'),
(3, 6, 'anhanguera', 1000.00, 1, 30, '2012-11-07', 'gesse'),
(4, 6, 'anhanguera', 1000.00, 1, 30, '2012-11-07', 'gesse'),
(5, 6, 'Fornecedor Acessorios', 900.00, 3, 15, '2012-11-02', 'gesse'),
(6, 1, 'teste contas a pagar', 10.00, 1, 30, '2013-04-10', 'gesse'),
(7, 1, 'Agua Mineral', 11.00, 1, 30, '2013-04-09', 'gesse'),
(8, 6, 'Sa Metais', 3000.00, 4, 7, '2013-04-22', 'gesse'),
(9, 1, 'pintor', 100.00, 1, 30, '2014-06-13', 'gesse'),
(10, 1, 'Cleber', 50.00, 1, 30, '2014-09-16', 'gesse'),
(11, 1, 'Mickaely', 50.00, 1, 30, '2014-12-20', 'gesse'),
(12, 6, 'Escritorio Pasqualino', 100.00, 1, 30, '2014-12-15', 'gesse');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
`empresaID` int(11) NOT NULL,
  `nomeFantasia` varchar(50) NOT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ramo` varchar(30) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `inscEstadual` varchar(20) NOT NULL,
  `inscMunicipal` varchar(20) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `complemento` varchar(200) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `operadora` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `site` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaAtiva` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`empresaID`, `nomeFantasia`, `razaoSocial`, `ramo`, `cnpj`, `inscEstadual`, `inscMunicipal`, `cep`, `rua`, `numero`, `bairro`, `cidade`, `uf`, `complemento`, `responsavel`, `telefone`, `fax`, `celular`, `operadora`, `email`, `site`, `data`, `empresaAtiva`) VALUES
(1, 'WAIFINNYS 100% MODA EVANGÉLICA', 'CAMPANHA & SANTOS MODA EVANGELICA - ME', 'Roupas e Acessórios', '07.370.904/0001-58', '712.107.530.11', '', '13220005', 'AV. FERNAO DIAS PAES LEME', '1.764', 'JARDIM PRIMAVERA', 'Várzea Paulista', 'SP', '', 'Diego João dos Santos', '(11) 4493-1289', '00000000', '(11) 0000-0000', 'VIVO', '', '', '2014-12-11 20:23:22', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
`estoqueID` int(11) NOT NULL,
  `fornecedorID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `precoCusto` float(10,2) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `lucro` varchar(10) NOT NULL,
  `unidade` varchar(2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`estoqueID`, `fornecedorID`, `produtoID`, `quantidade`, `precoCusto`, `preco`, `lucro`, `unidade`, `data`, `usuario`) VALUES
(1, 41, 11, 0, 289.00, 1184.90, '310', 'UN', '2012-09-08 17:20:03', 'hernani'),
(2, 41, 10, 0, 100.00, 315.00, '215', 'UN', '2012-09-08 17:21:08', 'hernani'),
(3, 41, 5, 0, 119.00, 297.50, '150', 'UN', '2012-09-08 17:21:29', 'hernani'),
(4, 41, 7, 0, 57.00, 114.00, '100', 'UN', '2012-09-08 17:21:47', 'hernani'),
(5, 41, 4, 0, 323.00, 726.75, '125', 'UN', '2012-09-08 17:22:04', 'hernani'),
(6, 41, 8, 0, 95.00, 204.25, '115', 'UN', '2012-09-08 17:22:22', 'hernani'),
(7, 41, 16, 0, 419.00, 963.70, '130', 'UN', '2012-09-08 17:23:39', 'hernani'),
(8, 41, 13, 0, 142.00, 396.18, '179', 'UN', '2012-09-08 17:24:14', 'hernani'),
(9, 41, 14, 0, 187.00, 514.25, '175', 'UN', '2012-09-08 17:24:31', 'hernani'),
(10, 41, 1, 0, 35.00, 77.00, '120', 'UN', '2012-09-08 17:24:40', 'hernani'),
(11, 41, 2, 0, 47.00, 101.05, '115', 'UN', '2012-09-08 17:24:53', 'hernani'),
(12, 41, 3, 0, 87.00, 208.80, '140', 'UN', '2012-09-08 17:25:14', 'hernani'),
(13, 41, 15, 0, 460.00, 989.00, '115', 'UN', '2012-09-09 03:15:53', 'hernani'),
(14, 41, 12, 0, 415.00, 1037.50, '150', 'UN', '2012-09-09 03:16:20', 'hernani'),
(15, 41, 6, 0, 85.00, 187.00, '120', 'UN', '2012-09-09 03:16:51', 'hernani'),
(16, 41, 9, 0, 83.00, 186.75, '125', 'UN', '2012-09-09 03:17:32', 'hernani'),
(17, 40, 18, 0, 15.00, 30.00, '100.00', 'UN', '2012-09-11 13:46:12', 'gesse'),
(18, 40, 17, 0, 10.00, 25.00, '150.00', 'MT', '2012-09-11 13:47:24', 'gesse'),
(19, 40, 17, 0, 10.00, 25.00, '150.00', 'MT', '2012-09-11 13:48:21', 'gesse'),
(20, 40, 19, 0, 49.00, 73.50, '50', 'UN', '2012-09-13 11:46:07', 'hernani'),
(21, 40, 19, 0, 49.00, 73.50, '50', 'UN', '2012-09-14 02:15:43', 'hernani'),
(22, 40, 19, 0, 49.00, 73.50, '50', 'UN', '2012-09-14 11:16:17', 'hernani'),
(23, 40, 20, 0, 100.00, 150.00, '50.00', 'UN', '2012-09-14 11:17:17', 'hernani'),
(24, 40, 21, 0, 200.00, 400.00, '100', 'UN', '2012-09-14 11:18:10', 'hernani'),
(25, 40, 22, 0, 200.00, 500.00, '150', 'UN', '2012-09-14 11:18:56', 'hernani'),
(26, 40, 19, 0, 49.00, 73.50, '50.00', 'UN', '2012-09-14 11:19:32', 'hernani'),
(27, 40, 19, 0, 49.00, 73.50, '50.00', 'UN', '2012-09-14 11:22:14', 'hernani'),
(28, 40, 19, 0, 45.00, 69.90, '55.33', 'UN', '2012-09-14 12:25:24', 'hernani'),
(29, 40, 19, 0, 35.00, 63.00, '80', 'UN', '2012-10-04 16:32:59', 'hernani'),
(30, 40, 23, 0, 180.00, 249.90, '38.83', 'UN', '2012-10-05 11:33:10', 'gesse'),
(31, 40, 23, 0, 190.00, 256.50, '35', 'UN', '2012-10-05 11:38:04', 'gesse'),
(32, 40, 19, 0, 40.00, 72.00, '80', 'UN', '2012-10-17 17:21:51', 'gesse'),
(33, 40, 23, 0, 65.00, 97.50, '50', 'MT', '2013-04-09 20:15:57', 'gesse'),
(34, 40, 25, 0, 19.00, 21.00, '10.53', 'UN', '2013-04-09 20:19:18', 'gesse'),
(35, 40, 24, 0, 16.22, 22.00, '35.64', 'MT', '2013-04-09 20:21:43', 'gesse'),
(36, 40, 23, 0, 69.00, 145.00, '110.14', 'MT', '2014-06-26 20:55:02', 'gesse'),
(37, 40, 26, 0, 25.00, 55.00, '120.00', 'UN', '2014-12-04 18:22:58', 'gesse'),
(38, 41, 30, 0, 35.00, 69.90, '99.71', 'UN', '2014-12-26 17:19:21', 'adm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formapagamento`
--

CREATE TABLE IF NOT EXISTS `formapagamento` (
`formID` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `formAtivo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `formapagamento`
--

INSERT INTO `formapagamento` (`formID`, `descricao`, `formAtivo`) VALUES
(1, 'Dinheiro', 'S'),
(2, 'Cartão (Crédito)', 'S'),
(3, 'Cartão (Débito)', 'S'),
(4, 'Cheque (com entrada)', 'S'),
(5, 'Cheque (sem entrada)', 'S'),
(6, 'Boleto', 'S'),
(7, 'Crediário', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
`fornecedorID` int(11) NOT NULL,
  `fornNomeFantasia` varchar(40) NOT NULL,
  `fornRazaoSocial` varchar(40) NOT NULL,
  `fornCnpj` varchar(20) NOT NULL,
  `fornInscEstadual` varchar(20) NOT NULL,
  `fornInscMunicipal` varchar(20) NOT NULL,
  `fornEndereco` varchar(40) NOT NULL,
  `fornNumero` varchar(6) NOT NULL,
  `fornBairro` varchar(50) NOT NULL,
  `fornCep` varchar(12) NOT NULL,
  `fornCidade` varchar(20) NOT NULL,
  `fornUf` varchar(2) NOT NULL,
  `fornComplemento` text NOT NULL,
  `fornContato` varchar(30) NOT NULL,
  `fornTelefone` varchar(14) NOT NULL,
  `fornFax` varchar(14) NOT NULL,
  `fornRadio` varchar(15) NOT NULL,
  `fornCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(20) NOT NULL,
  `fornEmail` varchar(100) NOT NULL,
  `fornSite` varchar(100) NOT NULL,
  `fornAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `fornData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fornUsuario` varchar(40) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`fornecedorID`, `fornNomeFantasia`, `fornRazaoSocial`, `fornCnpj`, `fornInscEstadual`, `fornInscMunicipal`, `fornEndereco`, `fornNumero`, `fornBairro`, `fornCep`, `fornCidade`, `fornUf`, `fornComplemento`, `fornContato`, `fornTelefone`, `fornFax`, `fornRadio`, `fornCelular`, `operadoraCelular`, `fornEmail`, `fornSite`, `fornAtivo`, `fornData`, `fornUsuario`) VALUES
(41, 'waifinnys', 'Campanha & Santos Moda Evang.-ME', '07.370.904/0001-58', '', '', 'Av fernao dias paes leme', '1764', 'Jardim primavera', '', 'varzea pta', 'SP', '', 'Diego', '(11) 4493-1289', '', '', '', '', '', 'http://', 'S', '2014-12-11 20:58:34', 'cadastro.Usuario@2f231c50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
`funcionarioID` int(11) NOT NULL,
  `cargoID` int(11) NOT NULL,
  `funcionarioNome` varchar(50) NOT NULL,
  `funcionarioNascimento` date NOT NULL,
  `funcionarioRg` varchar(20) NOT NULL,
  `funcionarioCpf` varchar(20) NOT NULL,
  `funcionarioEndereco` varchar(50) NOT NULL,
  `funcionarioNumero` varchar(10) NOT NULL,
  `funcionarioBairro` varchar(50) NOT NULL,
  `funcionarioCep` varchar(15) NOT NULL,
  `funcionarioCidade` varchar(40) NOT NULL,
  `funcionarioUf` varchar(2) NOT NULL,
  `funcionarioComplemento` varchar(100) NOT NULL,
  `funcionarioTelefone` varchar(15) NOT NULL,
  `funcionarioCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(30) NOT NULL,
  `funcionarioEmail` varchar(100) NOT NULL,
  `funcionarioData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `funcionarioUsuario` varchar(40) NOT NULL,
  `funcionarioAtivo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`funcionarioID`, `cargoID`, `funcionarioNome`, `funcionarioNascimento`, `funcionarioRg`, `funcionarioCpf`, `funcionarioEndereco`, `funcionarioNumero`, `funcionarioBairro`, `funcionarioCep`, `funcionarioCidade`, `funcionarioUf`, `funcionarioComplemento`, `funcionarioTelefone`, `funcionarioCelular`, `operadoraCelular`, `funcionarioEmail`, `funcionarioData`, `funcionarioUsuario`, `funcionarioAtivo`) VALUES
(1, 1, 'admin', '2014-12-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '2014-12-26 17:16:18', '', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamentos`
--

CREATE TABLE IF NOT EXISTS `lancamentos` (
`lancamentoID` int(11) NOT NULL,
  `receberID` int(11) DEFAULT NULL,
  `pagarID` int(11) DEFAULT NULL,
  `vendaID` int(11) DEFAULT NULL,
  `transferenciaID` int(11) DEFAULT NULL,
  `contaPagarID` int(11) DEFAULT NULL,
  `livroID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `desconto` float(10,2) DEFAULT NULL,
  `acrescimo` float(10,2) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `favorecido` text,
  `observacao` text,
  `tipo` varchar(1) NOT NULL COMMENT 'Ou ''R'' de Recebido Ou ''P'' de Pago Ou ''D'' de Deposito Ou ''T'' de Transferencia Ou ''C'' de Cheque sem Fundo',
  `usuario` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=195 ;

--
-- Extraindo dados da tabela `lancamentos`
--

INSERT INTO `lancamentos` (`lancamentoID`, `receberID`, `pagarID`, `vendaID`, `transferenciaID`, `contaPagarID`, `livroID`, `formID`, `valor`, `desconto`, `acrescimo`, `data`, `favorecido`, `observacao`, `tipo`, `usuario`) VALUES
(1, 1, NULL, 1, NULL, NULL, 1, 6, 250.00, 10.00, 0.00, '2012-09-06 20:13:39', NULL, 'Desconto por pagamento adiantado.', 'R', 'gesse'),
(2, 6, NULL, 1, NULL, NULL, 1, 1, 1687.54, NULL, NULL, '2012-09-08 17:40:46', NULL, NULL, 'R', 'hernani'),
(3, NULL, NULL, NULL, 1, NULL, 1, 1, 300.00, NULL, NULL, '2012-09-09 03:07:08', NULL, NULL, 'T', 'hernani'),
(4, NULL, NULL, NULL, 1, NULL, 5, 1, 300.00, NULL, NULL, '2012-09-09 03:07:08', NULL, NULL, 'D', 'hernani'),
(5, NULL, NULL, NULL, 2, NULL, 1, 1, 200.00, NULL, NULL, '2012-09-09 03:08:37', NULL, NULL, 'T', 'hernani'),
(6, NULL, NULL, NULL, 2, NULL, 3, 1, 200.00, NULL, NULL, '2012-09-09 03:08:37', NULL, NULL, 'D', 'hernani'),
(7, NULL, NULL, NULL, 3, NULL, 1, 1, 150.00, NULL, NULL, '2012-09-09 03:09:58', NULL, NULL, 'T', 'hernani'),
(8, NULL, NULL, NULL, 3, NULL, 2, 1, 150.00, NULL, NULL, '2012-09-09 03:09:58', NULL, NULL, 'D', 'hernani'),
(9, NULL, NULL, NULL, 4, NULL, 1, 1, 200.00, NULL, NULL, '2012-09-09 03:11:40', NULL, NULL, 'T', 'hernani'),
(10, NULL, NULL, NULL, 4, NULL, 4, 1, 200.00, NULL, NULL, '2012-09-09 03:11:40', NULL, NULL, 'D', 'hernani'),
(11, 15, NULL, 6, NULL, NULL, 1, 1, 1600.00, NULL, NULL, '2012-09-09 19:16:37', NULL, NULL, 'R', 'hernani'),
(12, 25, NULL, 9, NULL, NULL, 1, 1, 588.60, NULL, NULL, '2012-09-10 12:24:26', NULL, NULL, 'R', 'GESSE'),
(13, 35, NULL, 11, NULL, NULL, 1, 1, 1184.00, NULL, NULL, '2012-09-10 12:43:21', NULL, NULL, 'R', 'gesse'),
(14, 36, NULL, 12, NULL, NULL, 1, 1, 184.90, NULL, NULL, '2012-09-10 12:45:48', NULL, NULL, 'R', 'gesse'),
(15, 38, NULL, 7, NULL, NULL, 1, 1, 924.50, NULL, NULL, '2012-09-11 12:33:10', NULL, NULL, 'R', 'hernani'),
(16, 8, NULL, 2, NULL, NULL, 1, 7, 1825.48, 0.00, 0.00, '2012-09-11 12:51:18', NULL, '', 'R', 'hernani'),
(17, 10, NULL, 3, NULL, NULL, 1, 7, 1230.52, 0.00, 0.00, '2012-09-11 12:51:29', NULL, '', 'R', 'hernani'),
(18, 9, NULL, 2, NULL, NULL, 1, 7, 1825.48, 0.00, 0.00, '2012-09-11 12:52:28', NULL, '', 'R', 'hernani'),
(19, 11, NULL, 3, NULL, NULL, 1, 7, 1230.52, 0.00, 0.00, '2012-09-11 12:52:34', NULL, '', 'R', 'hernani'),
(20, 12, NULL, 3, NULL, NULL, 1, 7, 1230.52, 0.00, 0.00, '2012-09-11 12:52:42', NULL, '', 'R', 'hernani'),
(21, 47, NULL, 16, NULL, NULL, 1, 1, 924.50, NULL, NULL, '2012-09-11 13:12:00', NULL, NULL, 'R', 'hernani'),
(22, 53, NULL, 13, NULL, NULL, 3, 5, 394.97, 0.00, 0.00, '2012-09-11 13:30:28', NULL, '', 'R', 'gesse'),
(23, NULL, NULL, NULL, 5, NULL, 1, 1, 1230.52, NULL, NULL, '2012-09-11 13:32:50', NULL, NULL, 'T', 'gesse'),
(24, NULL, NULL, NULL, 5, NULL, 5, 1, 1230.52, NULL, NULL, '2012-09-11 13:32:50', NULL, NULL, 'D', 'gesse'),
(25, 56, NULL, 0, NULL, NULL, 1, 4, 1230.52, NULL, NULL, '2012-09-11 13:34:22', NULL, 'cheque devolvido', 'C', 'gesse'),
(26, NULL, NULL, NULL, 6, NULL, 5, 1, 1230.52, NULL, NULL, '2012-09-11 13:36:55', NULL, NULL, 'T', 'gesse'),
(27, NULL, NULL, NULL, 6, NULL, 1, 1, 1230.52, NULL, NULL, '2012-09-11 13:36:55', NULL, NULL, 'D', 'gesse'),
(28, 14, NULL, 5, NULL, NULL, 5, 4, 3603.18, 0.00, 0.00, '2012-09-13 10:43:59', NULL, '', 'R', 'hernani'),
(29, 16, NULL, 6, NULL, NULL, 5, 4, 2500.00, 0.00, 0.00, '2012-09-13 10:44:22', NULL, '', 'R', 'hernani'),
(30, 13, NULL, 4, NULL, NULL, 5, 3, 12254.22, 0.00, 0.00, '2012-09-13 10:44:32', NULL, '', 'R', 'hernani'),
(31, 26, NULL, 9, NULL, NULL, 5, 4, 2666.67, 0.00, 0.00, '2012-09-13 10:44:45', NULL, '', 'R', 'hernani'),
(32, 7, NULL, 1, NULL, NULL, 5, 3, 0.00, 0.00, 0.00, '2012-09-13 10:44:53', NULL, '', 'R', 'hernani'),
(33, 32, NULL, 10, NULL, NULL, 5, 4, 4344.63, 0.00, 0.00, '2012-09-13 10:45:01', NULL, '', 'R', 'hernani'),
(34, 56, NULL, 0, NULL, NULL, 5, 4, 1230.52, 0.00, 0.00, '2012-09-13 10:45:12', NULL, '', 'R', 'hernani'),
(35, 39, NULL, 7, NULL, NULL, 5, 4, 1000.00, 0.00, 0.00, '2012-09-13 10:45:23', NULL, '', 'R', 'hernani'),
(36, 44, NULL, 14, NULL, NULL, 5, 3, 1184.90, 0.00, 0.00, '2012-09-13 10:45:32', NULL, '', 'R', 'hernani'),
(37, 57, NULL, 19, NULL, NULL, 5, 3, 25.00, 0.00, 0.00, '2012-09-13 10:45:41', NULL, '', 'R', 'hernani'),
(38, 61, NULL, 22, NULL, NULL, 1, 1, 900.00, NULL, NULL, '2012-09-14 12:36:11', NULL, NULL, 'R', 'hernani'),
(39, NULL, NULL, NULL, 7, NULL, 1, 1, 10000.00, NULL, NULL, '2012-09-14 12:40:49', NULL, NULL, 'T', 'hernani'),
(40, NULL, NULL, NULL, 7, NULL, 5, 1, 10000.00, NULL, NULL, '2012-09-14 12:40:49', NULL, NULL, 'D', 'hernani'),
(41, 22, NULL, 8, NULL, NULL, 3, 2, 394.97, 0.00, 0.00, '2012-09-14 12:42:45', NULL, '', 'R', 'hernani'),
(42, 27, NULL, 9, NULL, NULL, 4, 4, 2666.67, 0.00, 0.00, '2012-09-14 12:43:19', NULL, '', 'R', 'hernani'),
(43, 33, NULL, 10, NULL, NULL, 2, 4, 4344.63, 0.00, 0.00, '2012-09-14 12:44:22', NULL, '', 'R', 'hernani'),
(44, 37, NULL, 12, NULL, NULL, 2, 2, 1000.00, 0.00, 0.00, '2012-09-14 12:44:48', NULL, '', 'R', 'hernani'),
(45, 40, NULL, 7, NULL, NULL, 5, 4, 1000.00, 0.00, 0.00, '2012-09-14 12:45:07', NULL, '', 'R', 'hernani'),
(46, 45, NULL, 15, NULL, NULL, 3, 2, 592.45, 0.00, 0.00, '2012-09-14 12:45:26', NULL, '', 'R', 'hernani'),
(47, 17, NULL, 6, NULL, NULL, 2, 4, 2500.00, 0.00, 0.00, '2012-09-14 12:46:03', NULL, '', 'R', 'hernani'),
(48, 48, NULL, 16, NULL, NULL, 4, 5, 1000.00, 0.00, 0.00, '2012-09-14 12:46:38', NULL, '', 'R', 'hernani'),
(49, 2, NULL, 1, NULL, NULL, 3, 6, 260.00, 0.00, 0.00, '2012-09-14 12:47:44', NULL, '', 'R', 'hernani'),
(50, 18, NULL, 6, NULL, NULL, 2, 4, 2500.00, 0.00, 0.00, '2012-09-14 12:48:02', NULL, '', 'R', 'hernani'),
(51, 23, NULL, 8, NULL, NULL, 2, 2, 394.97, 0.00, 0.00, '2012-09-14 12:48:23', NULL, '', 'R', 'hernani'),
(52, 28, NULL, 9, NULL, NULL, 4, 4, 2666.67, 0.00, 0.00, '2012-09-14 12:48:46', NULL, '', 'R', 'hernani'),
(53, 34, NULL, 10, NULL, NULL, 3, 4, 4344.63, 0.00, 0.00, '2012-09-14 12:49:05', NULL, '', 'R', 'hernani'),
(54, 41, NULL, 7, NULL, NULL, 2, 4, 1000.00, 0.00, 0.00, '2012-09-14 12:49:26', NULL, '', 'R', 'hernani'),
(55, 46, NULL, 15, NULL, NULL, 2, 2, 592.45, 0.00, 0.00, '2012-09-14 12:49:45', NULL, '', 'R', 'hernani'),
(56, 49, NULL, 16, NULL, NULL, 4, 5, 1000.00, 0.00, 0.00, '2012-09-14 12:50:01', NULL, '', 'R', 'hernani'),
(57, 54, NULL, 13, NULL, NULL, 3, 5, 394.97, 0.00, 0.00, '2012-09-14 12:50:19', NULL, '', 'R', 'hernani'),
(58, 3, NULL, 1, NULL, NULL, 2, 6, 260.00, 0.00, 0.00, '2012-09-14 12:50:46', NULL, '', 'R', 'hernani'),
(59, 19, NULL, 6, NULL, NULL, 2, 4, 2500.00, 0.00, 0.00, '2012-09-14 12:51:05', NULL, '', 'R', 'hernani'),
(60, 24, NULL, 8, NULL, NULL, 2, 2, 394.97, 0.00, 0.00, '2012-09-14 12:51:21', NULL, '', 'R', 'hernani'),
(61, 55, NULL, 13, NULL, NULL, 3, 5, 394.97, 0.00, 0.00, '2012-09-14 12:51:40', NULL, '', 'R', 'hernani'),
(62, 50, NULL, 16, NULL, NULL, 5, 5, 1000.00, 0.00, 0.00, '2012-09-14 12:51:57', NULL, '', 'R', 'hernani'),
(63, 29, NULL, 9, NULL, NULL, 4, 4, 2666.67, 0.00, 0.00, '2012-09-14 12:52:11', NULL, '', 'R', 'hernani'),
(64, 42, NULL, 7, NULL, NULL, 3, 4, 1000.00, 0.00, 0.00, '2012-09-14 12:52:27', NULL, '', 'R', 'hernani'),
(65, 4, NULL, 1, NULL, NULL, 2, 6, 260.00, 0.00, 0.00, '2012-09-14 12:52:56', NULL, '', 'R', 'hernani'),
(66, 20, NULL, 6, NULL, NULL, 3, 4, 2500.00, 0.00, 0.00, '2012-09-14 12:53:11', NULL, '', 'R', 'hernani'),
(67, 30, NULL, 9, NULL, NULL, 2, 4, 2666.67, 0.00, 0.00, '2012-09-14 12:53:27', NULL, '', 'R', 'hernani'),
(68, 43, NULL, 7, NULL, NULL, 4, 4, 1000.00, 0.00, 0.00, '2012-09-14 12:53:45', NULL, '', 'R', 'hernani'),
(69, 51, NULL, 16, NULL, NULL, 2, 5, 1000.00, 0.00, 0.00, '2012-09-14 12:54:00', NULL, '', 'R', 'hernani'),
(70, 5, NULL, 1, NULL, NULL, 2, 6, 260.00, 0.00, 0.00, '2012-09-14 12:54:25', NULL, '', 'R', 'hernani'),
(71, 21, NULL, 6, NULL, NULL, 3, 4, 2500.00, 0.00, 0.00, '2012-09-14 12:54:44', NULL, '', 'R', 'hernani'),
(72, 31, NULL, 9, NULL, NULL, 4, 4, 2666.67, 0.00, 0.00, '2012-09-14 12:55:00', NULL, '', 'R', 'hernani'),
(73, 58, NULL, 17, NULL, NULL, 5, 2, 142.50, 7.50, 0.00, '2012-09-14 13:07:06', NULL, 'desconto de 5% tarifa de cart&#227;o', 'R', 'hernani'),
(74, 60, NULL, 21, NULL, NULL, 1, 7, 219.90, 0.00, 0.00, '2012-09-14 13:09:28', NULL, '', 'R', 'hernani'),
(75, 59, NULL, 17, NULL, NULL, 5, 2, 150.00, 0.00, 0.00, '2012-09-14 13:11:37', NULL, '', 'R', 'hernani'),
(76, 62, NULL, 23, NULL, NULL, 1, 1, 619.90, NULL, NULL, '2012-09-14 13:23:37', NULL, NULL, 'R', 'hernani'),
(77, 63, NULL, 24, NULL, NULL, 1, 7, 1200.00, 0.00, 0.00, '2012-09-14 13:27:51', NULL, '', 'R', 'hernani'),
(78, 65, NULL, 26, NULL, NULL, 5, 4, 150.00, 0.00, 0.00, '2012-09-14 13:37:44', NULL, '', 'R', 'hernani'),
(79, 64, NULL, 25, NULL, NULL, 5, 3, 69.90, 0.00, 0.00, '2012-09-14 13:38:08', NULL, '', 'R', 'hernani'),
(80, 66, NULL, 20, NULL, NULL, 1, 1, 69.90, NULL, NULL, '2012-09-17 19:13:51', NULL, NULL, 'R', 'gesse'),
(81, NULL, NULL, NULL, 8, NULL, 1, 1, 3000.00, NULL, NULL, '2012-09-17 19:14:58', NULL, NULL, 'T', 'gesse'),
(82, NULL, NULL, NULL, 8, NULL, 5, 1, 3000.00, NULL, NULL, '2012-09-17 19:14:58', NULL, NULL, 'D', 'gesse'),
(83, 67, NULL, 28, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2012-09-17 19:18:37', NULL, NULL, 'R', 'gesse'),
(84, 69, NULL, 28, NULL, NULL, 3, 2, 90.00, 10.00, 0.00, '2012-09-17 19:21:32', NULL, 'desconto maior por causa da antecipacao', 'R', 'gesse'),
(85, 68, NULL, 28, NULL, NULL, 2, 2, 92.50, 7.50, 0.00, '2012-09-17 19:21:56', NULL, 'desconto maior por causa da antecipacao', 'R', 'gesse'),
(86, 70, NULL, 29, NULL, NULL, 1, 1, 1569.90, NULL, NULL, '2012-09-21 22:01:45', NULL, NULL, 'R', 'gesse'),
(87, 71, NULL, 30, NULL, NULL, 1, 1, 67.90, NULL, NULL, '2012-09-24 14:19:04', NULL, NULL, 'R', 'gesse'),
(88, 72, NULL, 31, NULL, NULL, 1, 1, 9.00, NULL, NULL, '2012-09-24 14:19:40', NULL, NULL, 'R', 'gesse'),
(89, 75, NULL, 32, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2012-09-24 15:32:53', NULL, NULL, 'R', 'gesse'),
(90, 76, NULL, 33, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-09-24 15:37:14', NULL, NULL, 'R', 'gesse'),
(91, 85, NULL, 36, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-09-24 17:06:12', NULL, NULL, 'R', 'gesse'),
(92, 88, NULL, 37, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2012-09-24 17:11:12', NULL, NULL, 'R', 'gesse'),
(93, 89, NULL, 37, NULL, NULL, 1, 1, 145.00, NULL, NULL, '2012-09-24 17:11:33', NULL, NULL, 'R', 'gesse'),
(94, NULL, NULL, NULL, 9, NULL, 1, 1, 1000.00, NULL, NULL, '2012-09-25 17:42:36', NULL, NULL, 'T', 'gesse'),
(95, NULL, NULL, NULL, 9, NULL, 5, 1, 1000.00, NULL, NULL, '2012-09-25 17:42:36', NULL, NULL, 'D', 'gesse'),
(96, 90, NULL, 38, NULL, NULL, 1, 1, 279.60, NULL, NULL, '2012-09-25 18:11:03', NULL, NULL, 'R', 'gesse'),
(97, 80, NULL, 34, NULL, NULL, 5, 4, 75.00, 0.00, 0.00, '2012-09-25 18:21:17', NULL, '', 'R', 'gesse'),
(98, 91, NULL, 39, NULL, NULL, 5, 2, 64.90, 5.00, 0.00, '2012-09-25 18:26:58', NULL, 'desconto taxa cartao', 'R', 'gesse'),
(99, NULL, 15, NULL, NULL, 2, 3, 6, 333.33, 0.00, 0.00, '2012-09-25 18:33:56', 'forte em midia', '', 'P', 'gesse'),
(100, 92, NULL, 40, NULL, NULL, 1, 7, 69.90, 0.00, 0.00, '2012-09-25 18:50:56', NULL, '', 'R', 'gesse'),
(101, NULL, 1, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-09-25 20:19:08', 'nokia', '', 'P', 'gesse'),
(102, NULL, 16, NULL, NULL, 2, 5, 6, 333.33, 0.00, 0.00, '2012-09-25 20:19:57', 'forte em midia', '', 'P', 'gesse'),
(103, 93, NULL, 41, NULL, NULL, 5, 6, 106.45, 3.50, 0.00, '2012-09-26 19:16:45', NULL, '', 'R', 'gesse'),
(104, 95, NULL, 42, NULL, NULL, 3, 5, 69.90, 0.00, 0.00, '2012-09-27 17:52:26', NULL, '', 'R', 'gesse'),
(105, 96, NULL, 43, NULL, NULL, 1, 1, 900.00, NULL, NULL, '2012-10-02 17:49:38', NULL, NULL, 'R', 'gesse'),
(106, 97, NULL, 44, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2012-10-02 19:39:27', NULL, NULL, 'R', 'gesse'),
(107, 98, NULL, 45, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2012-10-02 19:42:25', NULL, NULL, 'R', 'gesse'),
(108, 100, NULL, 47, NULL, NULL, 1, 1, 400.00, NULL, NULL, '2012-10-03 14:27:23', NULL, NULL, 'R', 'gesse'),
(109, 101, NULL, 27, NULL, NULL, 1, 1, 69.90, NULL, NULL, '2012-10-04 16:26:12', NULL, NULL, 'R', 'hernani'),
(110, NULL, NULL, NULL, 10, NULL, 1, 1, 2000.00, NULL, NULL, '2012-10-04 16:29:14', NULL, NULL, 'T', 'hernani'),
(111, NULL, NULL, NULL, 10, NULL, 3, 1, 2000.00, NULL, NULL, '2012-10-04 16:29:14', NULL, NULL, 'D', 'hernani'),
(112, 102, NULL, 48, NULL, NULL, 4, 6, 60.70, 2.30, 0.00, '2012-10-05 11:25:59', NULL, 'taxa do boleto 2,30', 'R', 'gesse'),
(113, 105, NULL, 51, NULL, NULL, 1, 1, 2052.00, NULL, NULL, '2012-10-05 11:39:01', NULL, NULL, 'R', 'gesse'),
(114, 103, NULL, 50, NULL, NULL, 4, 2, 115.95, 9.00, 0.00, '2012-10-05 11:42:36', NULL, '', 'R', 'gesse'),
(115, 106, NULL, 52, NULL, NULL, 1, 1, 256.50, NULL, NULL, '2012-10-05 12:00:44', NULL, NULL, 'R', 'gesse'),
(116, 73, NULL, 31, NULL, NULL, 1, 5, 35.00, 0.00, 5.00, '2012-10-05 12:03:19', NULL, 'pagamento de boleto atrasado ', 'R', 'gesse'),
(117, 110, NULL, 55, NULL, NULL, 1, 6, 147.70, 2.30, 0.00, '2012-10-05 12:06:43', NULL, 'taxa desconto ', 'R', 'gesse'),
(118, NULL, NULL, NULL, 11, NULL, 1, 1, 2000.00, NULL, NULL, '2012-10-05 12:09:19', NULL, NULL, 'T', 'gesse'),
(119, NULL, NULL, NULL, 11, NULL, 4, 1, 2000.00, NULL, NULL, '2012-10-05 12:09:19', NULL, NULL, 'D', 'gesse'),
(120, 111, NULL, 56, NULL, NULL, 5, 7, 690.00, 3.00, 0.00, '2012-10-16 17:22:15', NULL, 'DESCONTO', 'R', 'gesse'),
(121, 108, NULL, 54, NULL, NULL, 5, 4, 75.00, 0.00, 0.00, '2012-10-17 16:31:41', NULL, '', 'R', 'gesse'),
(122, 77, NULL, 33, NULL, NULL, 5, 5, 30.00, 0.00, 0.00, '2012-10-17 16:31:54', NULL, '', 'R', 'gesse'),
(123, 81, NULL, 34, NULL, NULL, 5, 4, 75.00, 0.00, 0.00, '2012-10-17 16:32:16', NULL, '', 'R', 'gesse'),
(124, 82, NULL, 35, NULL, NULL, 5, 2, 50.00, 0.00, 0.00, '2012-10-17 16:32:27', NULL, '', 'R', 'gesse'),
(125, 86, NULL, 36, NULL, NULL, 5, 2, 40.00, 0.00, 0.00, '2012-10-17 16:32:43', NULL, '', 'R', 'gesse'),
(126, 99, NULL, 46, NULL, NULL, 5, 7, 2289.90, 0.00, 0.00, '2012-10-17 16:33:32', NULL, '', 'R', 'gesse'),
(127, 109, NULL, 54, NULL, NULL, 3, 4, 75.00, 0.00, 0.00, '2012-10-17 16:34:13', NULL, '', 'R', 'gesse'),
(128, 74, NULL, 31, NULL, NULL, 3, 5, 30.00, 0.00, 0.00, '2012-10-17 16:34:36', NULL, '', 'R', 'gesse'),
(129, 78, NULL, 33, NULL, NULL, 3, 5, 30.00, 0.00, 0.00, '2012-10-17 16:34:52', NULL, '', 'R', 'gesse'),
(130, 83, NULL, 35, NULL, NULL, 3, 2, 50.00, 0.00, 0.00, '2012-10-17 16:35:36', NULL, '', 'R', 'gesse'),
(131, 87, NULL, 36, NULL, NULL, 3, 2, 40.00, 0.00, 0.00, '2012-10-17 16:35:55', NULL, '', 'R', 'gesse'),
(132, 94, NULL, 41, NULL, NULL, 5, 6, 109.95, 0.00, 0.00, '2012-10-17 16:36:10', NULL, '', 'R', 'gesse'),
(133, 104, NULL, 50, NULL, NULL, 5, 2, 124.95, 0.00, 0.00, '2012-10-17 16:36:37', NULL, '', 'R', 'gesse'),
(134, 79, NULL, 33, NULL, NULL, 3, 5, 30.00, 0.00, 0.00, '2012-10-17 16:36:48', NULL, '', 'R', 'gesse'),
(135, 84, NULL, 35, NULL, NULL, 5, 2, 50.00, 0.00, 0.00, '2012-10-17 16:37:01', NULL, '', 'R', 'gesse'),
(136, NULL, 2, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:38:18', 'nokia', '', 'P', 'gesse'),
(137, NULL, 3, NULL, NULL, 1, 3, 6, 35.71, 0.00, 0.00, '2012-10-17 16:38:33', 'nokia', '', 'P', 'gesse'),
(138, NULL, 17, NULL, NULL, 2, 5, 6, 333.33, 0.00, 0.00, '2012-10-17 16:38:48', 'forte em midia', '', 'P', 'gesse'),
(139, NULL, 4, NULL, NULL, 1, 3, 6, 35.71, 0.00, 0.00, '2012-10-17 16:39:07', 'nokia', '', 'P', 'gesse'),
(140, NULL, 5, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:39:26', 'nokia', '', 'P', 'gesse'),
(141, NULL, 6, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:39:54', 'nokia', '', 'P', 'gesse'),
(142, NULL, 7, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:40:08', 'nokia', '', 'P', 'gesse'),
(143, NULL, 8, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:40:25', 'nokia', '', 'P', 'gesse'),
(144, NULL, 9, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:40:38', 'nokia', '', 'P', 'gesse'),
(145, NULL, 10, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:40:55', 'nokia', '', 'P', 'gesse'),
(146, NULL, 11, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:41:15', 'nokia', '', 'P', 'gesse'),
(147, NULL, 12, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:41:29', 'nokia', '', 'P', 'gesse'),
(148, NULL, 13, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:41:42', 'nokia', '', 'P', 'gesse'),
(149, NULL, 14, NULL, NULL, 1, 5, 6, 35.71, 0.00, 0.00, '2012-10-17 16:41:55', 'nokia', '', 'P', 'gesse'),
(150, 112, NULL, 59, NULL, NULL, 1, 1, 294.00, NULL, NULL, '2012-10-17 17:47:10', NULL, NULL, 'R', 'gesse1'),
(151, 113, NULL, 60, NULL, NULL, 1, 7, 400.00, 0.00, 0.00, '2012-10-17 17:58:48', NULL, '', 'R', 'gesse1'),
(152, 115, NULL, 62, NULL, NULL, 2, 3, 490.00, 10.00, 0.00, '2012-10-17 18:04:29', NULL, 'desc. taxa cartao', 'R', 'gesse'),
(153, NULL, NULL, NULL, 12, NULL, 1, 1, 2000.00, NULL, NULL, '2012-10-17 18:09:04', NULL, NULL, 'T', 'gesse'),
(154, NULL, NULL, NULL, 12, NULL, 2, 1, 2000.00, NULL, NULL, '2012-10-17 18:09:04', NULL, NULL, 'D', 'gesse'),
(155, 114, NULL, 61, NULL, NULL, 2, 5, 400.00, 0.00, 0.00, '2012-10-17 18:10:30', NULL, '', 'R', 'gesse'),
(156, NULL, 18, NULL, NULL, 3, 1, 6, 1000.00, 0.00, 0.00, '2012-10-17 18:16:47', 'anhanguera', '', 'P', 'gesse'),
(157, NULL, 19, NULL, NULL, 4, 1, 6, 1000.00, 0.00, 0.00, '2012-10-17 18:18:44', 'anhanguera', 'foi feito deposito em conta', 'P', 'gesse'),
(158, 116, NULL, 58, NULL, NULL, 1, 1, 3000.00, NULL, NULL, '2012-10-17 18:23:26', NULL, NULL, 'R', 'gesse'),
(159, 117, NULL, 64, NULL, NULL, 1, 1, 360.00, NULL, NULL, '2012-11-01 12:21:09', NULL, NULL, 'R', 'gesse'),
(160, NULL, 20, NULL, NULL, 5, 1, 6, 300.00, 0.00, 0.00, '2012-11-01 12:28:33', 'Fornecedor Acessorios', '', 'P', 'gesse'),
(161, 52, NULL, 16, NULL, NULL, 5, 5, 997.00, 3.00, 0.00, '2013-02-20 18:47:53', NULL, 'teste', 'R', 'gesse'),
(162, NULL, NULL, NULL, 13, NULL, 5, 1, 5000.00, NULL, NULL, '2013-02-20 18:49:31', NULL, NULL, 'T', 'gesse'),
(163, NULL, NULL, NULL, 13, NULL, 2, 1, 5000.00, NULL, NULL, '2013-02-20 18:49:31', NULL, NULL, 'D', 'gesse'),
(164, NULL, 23, NULL, NULL, 6, 1, 1, 10.00, 0.00, 0.00, '2013-04-05 11:41:29', 'teste contas a pagar', '', 'P', 'gesse'),
(165, 118, NULL, 65, NULL, NULL, 1, 1, 614.25, NULL, NULL, '2013-04-09 20:35:24', NULL, NULL, 'R', 'gesse'),
(166, NULL, 24, NULL, NULL, 7, 1, 1, 11.00, 0.00, 0.00, '2013-04-09 20:40:15', 'Agua Mineral', '', 'P', 'gesse'),
(167, NULL, 25, NULL, NULL, 8, 5, 6, 750.00, 0.00, 0.00, '2013-04-09 20:56:57', 'Sa Metais', '', 'P', 'gesse'),
(168, 124, NULL, 71, NULL, NULL, 5, 4, 97.50, 0.00, 0.00, '2013-04-09 21:17:54', NULL, '', 'R', 'gesse'),
(169, 121, NULL, 69, NULL, NULL, 1, 6, 775.00, 5.00, 0.00, '2013-04-09 21:19:07', NULL, 'desconto de R$ 5,00 pq pagou adiantado', 'R', 'gesse'),
(170, NULL, NULL, NULL, 14, NULL, 1, 1, 750.00, NULL, NULL, '2013-04-09 21:19:49', NULL, NULL, 'T', 'gesse'),
(171, NULL, NULL, NULL, 14, NULL, 5, 1, 750.00, NULL, NULL, '2013-04-09 21:19:49', NULL, NULL, 'D', 'gesse'),
(172, 131, NULL, 74, NULL, NULL, 1, 1, 360.00, NULL, NULL, '2013-06-05 17:59:52', NULL, NULL, 'R', 'gesse'),
(173, 133, NULL, 76, NULL, NULL, 1, 1, 72.00, NULL, NULL, '2014-06-13 13:30:10', NULL, NULL, 'R', 'gesse'),
(174, NULL, 29, NULL, NULL, 9, 1, 1, 100.00, 0.00, 0.00, '2014-06-13 13:32:42', 'pintor', '', 'P', 'gesse'),
(175, 134, NULL, 77, NULL, NULL, 1, 1, 72.00, NULL, NULL, '2014-06-14 17:33:26', NULL, NULL, 'R', 'gesse'),
(176, 135, NULL, 78, NULL, NULL, 1, 1, 21.00, NULL, NULL, '2014-06-18 15:01:03', NULL, NULL, 'R', 'gesse'),
(177, 136, NULL, 79, NULL, NULL, 1, 1, 42.00, NULL, NULL, '2014-06-23 17:41:34', NULL, NULL, 'R', 'gesse'),
(178, 137, NULL, 80, NULL, NULL, 1, 1, 145.00, NULL, NULL, '2014-06-26 20:57:38', NULL, NULL, 'R', 'gesse'),
(179, 138, NULL, 81, NULL, NULL, 1, 1, 562.00, NULL, NULL, '2014-07-22 00:18:39', NULL, NULL, 'R', 'gesse'),
(180, 139, NULL, 82, NULL, NULL, 1, 1, 145.00, NULL, NULL, '2014-08-04 20:25:51', NULL, NULL, 'R', 'gesse'),
(181, 140, NULL, 83, NULL, NULL, 5, 2, 130.00, 15.00, 0.00, '2014-09-16 16:40:29', NULL, 'desconto por antecipacao', 'R', 'gesse'),
(182, NULL, 30, NULL, NULL, 10, 1, 1, 50.00, 0.00, 0.00, '2014-09-16 16:43:34', 'Cleber', 'abastecimento moto', 'P', 'gesse'),
(183, 141, NULL, 84, NULL, NULL, 1, 1, 45.00, NULL, NULL, '2014-09-16 16:44:44', NULL, NULL, 'R', 'gesse'),
(184, 142, NULL, 84, NULL, NULL, 1, 7, 100.00, 0.00, 0.00, '2014-09-16 16:48:49', NULL, '', 'R', 'gesse'),
(185, NULL, NULL, NULL, 15, NULL, 1, 1, 2000.00, NULL, NULL, '2014-09-16 16:56:19', NULL, NULL, 'T', 'gesse'),
(186, NULL, NULL, NULL, 15, NULL, 3, 1, 2000.00, NULL, NULL, '2014-09-16 16:56:19', NULL, NULL, 'D', 'gesse'),
(187, 143, NULL, 85, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2014-09-24 13:10:00', NULL, NULL, 'R', 'gesse'),
(188, 146, NULL, 87, NULL, NULL, 1, 7, 55.00, 0.00, 0.00, '2014-12-04 18:26:25', NULL, '', 'R', 'gesse'),
(189, NULL, 31, NULL, NULL, 11, 1, 1, 50.00, 0.00, 0.00, '2014-12-04 18:36:08', 'Mickaely', '', 'P', 'gesse'),
(190, NULL, 32, NULL, NULL, 12, 3, 6, 100.00, 0.00, 0.00, '2014-12-04 18:36:20', 'Escritorio Pasqualino', '', 'P', 'gesse'),
(191, 149, NULL, 88, NULL, NULL, 3, 2, 45.00, 10.00, 0.00, '2014-12-04 18:42:57', NULL, 'juros antecipaç&#227;o', 'R', 'gesse'),
(192, 144, NULL, 85, NULL, NULL, 1, 7, 115.00, 0.00, 20.00, '2014-12-04 19:03:48', NULL, 'juros por atraso', 'R', 'gesse'),
(193, 150, NULL, 90, NULL, NULL, 1, 1, 500.00, NULL, NULL, '2014-12-26 17:25:50', NULL, NULL, 'R', 'adm'),
(194, 152, NULL, 90, NULL, NULL, 1, 1, 500.00, NULL, NULL, '2014-12-26 17:26:47', NULL, NULL, 'R', 'adm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livrocaixa`
--

CREATE TABLE IF NOT EXISTS `livrocaixa` (
`livroID` int(11) NOT NULL,
  `banco` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `valorInicial` float(10,2) NOT NULL,
  `dataInicio` date NOT NULL,
  `ultimoLancamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `saldo` float(14,2) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `livrocaixa`
--

INSERT INTO `livrocaixa` (`livroID`, `banco`, `descricao`, `valorInicial`, `dataInicio`, `ultimoLancamento`, `saldo`, `status`) VALUES
(1, 'Loja', 'Caixa que recebe tudo que entra na loja.', 0.00, '2012-07-23', '2014-12-26 17:26:47', 5104.39, 'S'),
(2, 'Caixa Econômica Federal', '', 0.00, '2012-09-08', '2013-02-20 18:49:31', 27806.19, 'S'),
(3, 'Bradesco', '', 0.00, '2012-09-08', '2014-12-04 18:42:58', 16932.11, 'S'),
(4, 'Itaú', '', 0.00, '2012-09-08', '2012-10-05 12:09:19', 16043.33, 'S'),
(5, 'Banco do Brasil', '', 0.00, '2012-09-08', '2014-09-16 16:40:29', 44531.99, 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE IF NOT EXISTS `orcamento` (
`orcamentoID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `entrada` float(10,2) NOT NULL,
  `troco` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `desconto` float(10,2) NOT NULL,
  `notaFiscal` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `orcamento`
--

INSERT INTO `orcamento` (`orcamentoID`, `clienteID`, `formPagID`, `valor`, `entrada`, `troco`, `vezes`, `desconto`, `notaFiscal`, `data`, `usuario`, `status`) VALUES
(1, 1, 1, 1994.00, 0.00, 0.00, 1, 0.00, '0', '2012-09-09 03:15:17', 'hernani', '2'),
(2, 0, 1, 20970.00, 0.00, 0.00, 1, 0.00, '0', '2012-09-14 13:16:07', 'hernani', '2'),
(3, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2012-09-11 13:05:49', 'elaine', '1'),
(4, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2012-09-14 13:16:25', 'hernani', '1'),
(6, 2, 1, 150.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-06 13:50:38', 'gesse', '2'),
(7, 2, 1, 63000.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-16 17:43:42', 'gesse', '2'),
(8, 1, 1, 15000.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-17 18:24:19', 'gesse', '2'),
(9, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2012-10-17 18:24:20', 'gesse', '1'),
(10, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2014-12-04 18:57:39', 'gesse1', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoitem`
--

CREATE TABLE IF NOT EXISTS `orcamentoitem` (
`itemID` int(11) NOT NULL,
  `orcamentoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `orcamentoitem`
--

INSERT INTO `orcamentoitem` (`itemID`, `orcamentoID`, `produtoID`, `quantidade`, `valor`, `total`) VALUES
(1, 1, 10, 3.00, 315.00, 945.00),
(2, 1, 6, 5.00, 187.00, 935.00),
(3, 1, 7, 1.00, 114.00, 114.00),
(4, 2, 19, 300.00, 69.90, 20970.00),
(5, 6, 20, 1.00, 150.00, 150.00),
(6, 7, 19, 1000.00, 63.00, 63000.00),
(7, 8, 20, 100.00, 150.00, 15000.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagar`
--

CREATE TABLE IF NOT EXISTS `pagar` (
`pagarID` int(11) NOT NULL,
  `contapagarID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `parcela` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'Ou ''D'' de Devendo ou ''P'' de Pago'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Extraindo dados da tabela `pagar`
--

INSERT INTO `pagar` (`pagarID`, `contapagarID`, `formID`, `valor`, `vencimento`, `parcela`, `de`, `status`) VALUES
(1, 1, 6, 35.71, '2012-09-20', 1, 14, 'P'),
(2, 1, 6, 35.71, '2012-10-20', 2, 14, 'P'),
(3, 1, 6, 35.71, '2012-11-19', 3, 14, 'P'),
(4, 1, 6, 35.71, '2012-12-19', 4, 14, 'P'),
(5, 1, 6, 35.71, '2013-01-18', 5, 14, 'P'),
(6, 1, 6, 35.71, '2013-02-17', 6, 14, 'P'),
(7, 1, 6, 35.71, '2013-03-19', 7, 14, 'P'),
(8, 1, 6, 35.71, '2013-04-18', 8, 14, 'P'),
(9, 1, 6, 35.71, '2013-05-18', 9, 14, 'P'),
(10, 1, 6, 35.71, '2013-06-17', 10, 14, 'P'),
(11, 1, 6, 35.71, '2013-07-17', 11, 14, 'P'),
(12, 1, 6, 35.71, '2013-08-16', 12, 14, 'P'),
(13, 1, 6, 35.71, '2013-09-15', 13, 14, 'P'),
(14, 1, 6, 35.71, '2013-10-15', 14, 14, 'P'),
(15, 2, 6, 333.33, '2012-09-30', 1, 3, 'P'),
(16, 2, 6, 333.33, '2012-10-30', 2, 3, 'P'),
(17, 2, 6, 333.33, '2012-11-29', 3, 3, 'P'),
(18, 3, 6, 1000.00, '2012-11-07', 1, 1, 'P'),
(19, 4, 6, 1000.00, '2012-11-07', 1, 1, 'P'),
(20, 5, 6, 300.00, '2012-11-02', 1, 3, 'P'),
(21, 5, 6, 300.00, '2012-11-17', 2, 3, 'D'),
(22, 5, 6, 300.00, '2012-12-02', 3, 3, 'D'),
(23, 6, 1, 10.00, '2013-04-10', 1, 1, 'P'),
(24, 7, 1, 11.00, '2013-04-09', 1, 1, 'P'),
(25, 8, 6, 750.00, '2013-04-22', 1, 4, 'P'),
(26, 8, 6, 750.00, '2013-04-29', 2, 4, 'D'),
(27, 8, 6, 750.00, '2013-05-06', 3, 4, 'D'),
(28, 8, 6, 750.00, '2013-05-13', 4, 4, 'D'),
(29, 9, 1, 100.00, '2014-06-13', 1, 1, 'P'),
(30, 10, 1, 50.00, '2014-09-16', 1, 1, 'P'),
(31, 11, 1, 50.00, '2014-12-20', 1, 1, 'P'),
(32, 12, 6, 100.00, '2014-12-15', 1, 1, 'P');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
`produtoID` int(11) NOT NULL,
  `tipoprodutoID` int(11) NOT NULL,
  `fornecedorID` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `unidade` varchar(2) NOT NULL,
  `precoCusto` float(10,2) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `estoqueMinimo` int(11) NOT NULL,
  `estoque` float(10,2) NOT NULL,
  `lucro` varchar(10) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `produtoAtivo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produtoID`, `tipoprodutoID`, `fornecedorID`, `nome`, `codigo`, `unidade`, `precoCusto`, `preco`, `estoqueMinimo`, `estoque`, `lucro`, `data`, `produtoAtivo`) VALUES
(27, 33, 41, 'Gab mix', '100', 'UN', 20.00, 39.90, 20, 0.00, '99.50', '2014-12-11 21:27:35', 'S'),
(28, 33, 41, 'Ludann', '101', 'UN', 20.00, 37.90, 20, 0.00, '89.50', '2014-12-11 21:31:56', 'S'),
(29, 34, 41, 'Diversas', '102', 'UN', 20.00, 69.90, 10, 0.00, '249.50', '2014-12-11 21:42:29', 'S'),
(30, 30, 41, 'Agnnes', '103', 'UN', 35.00, 69.90, 10, 199905.00, '99.71', '2014-12-26 19:10:51', 'S'),
(31, 30, 41, 'Iza costa', '104', 'UN', 20.00, 45.90, 10, 0.00, '129.50', '2014-12-12 12:41:22', 'S'),
(32, 26, 41, 'Bian-ka', '105', 'UN', 18.00, 59.90, 10, 0.00, '232.78', '2014-12-12 12:48:47', 'S'),
(33, 40, 41, 'Trifil', '106', 'UN', 5.00, 9.90, 20, 0.00, '98.00', '2014-12-12 12:51:59', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE IF NOT EXISTS `receber` (
`receberID` int(11) NOT NULL,
  `vendaID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `parcela` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'Ou ''D'' de Devendo Ou ''P'' de Pago'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=190 ;

--
-- Extraindo dados da tabela `receber`
--

INSERT INTO `receber` (`receberID`, `vendaID`, `formID`, `clienteID`, `valor`, `vencimento`, `parcela`, `de`, `status`) VALUES
(1, 1, 6, 0, 260.00, '2012-10-06', 1, 5, 'P'),
(2, 1, 6, 0, 260.00, '2012-11-06', 2, 5, 'P'),
(3, 1, 6, 0, 260.00, '2012-12-06', 3, 5, 'P'),
(4, 1, 6, 0, 260.00, '2013-01-06', 4, 5, 'P'),
(5, 1, 6, 0, 260.00, '2013-02-06', 5, 5, 'P'),
(6, 1, 3, 0, 1687.54, '2012-09-08', 1, 1, 'P'),
(7, 1, 3, 0, 0.00, '2012-09-09', 1, 1, 'P'),
(8, 2, 7, 1, 1825.48, '2012-10-08', 1, 2, 'P'),
(9, 2, 4, 1, 1825.48, '2012-11-08', 2, 2, 'P'),
(10, 3, 7, 1, 1230.52, '2012-10-09', 1, 3, 'P'),
(11, 3, 4, 1, 1230.52, '2012-11-09', 2, 3, 'P'),
(12, 3, 4, 1, 1230.52, '2012-12-09', 3, 3, 'P'),
(13, 4, 3, 0, 12254.22, '2012-09-10', 1, 1, 'P'),
(14, 5, 4, 0, 3603.18, '2012-09-09', 1, 1, 'P'),
(15, 6, 4, 1, 1600.00, '2012-09-09', 1, 1, 'P'),
(16, 6, 4, 1, 2500.00, '2012-09-09', 1, 6, 'P'),
(17, 6, 4, 1, 2500.00, '2012-10-09', 2, 6, 'P'),
(18, 6, 4, 1, 2500.00, '2012-11-09', 3, 6, 'P'),
(19, 6, 4, 1, 2500.00, '2012-12-09', 4, 6, 'P'),
(20, 6, 4, 1, 2500.00, '2013-01-09', 5, 6, 'P'),
(21, 6, 4, 1, 2500.00, '2013-02-09', 6, 6, 'P'),
(22, 8, 2, 0, 394.97, '2012-10-10', 1, 3, 'P'),
(23, 8, 2, 0, 394.97, '2012-11-10', 2, 3, 'P'),
(24, 8, 2, 0, 394.97, '2012-12-10', 3, 3, 'P'),
(25, 9, 4, 0, 588.60, '2012-09-10', 1, 1, 'P'),
(26, 9, 4, 0, 2666.67, '2012-09-10', 1, 6, 'P'),
(27, 9, 4, 0, 2666.67, '2012-10-10', 2, 6, 'P'),
(28, 9, 4, 0, 2666.67, '2012-11-10', 3, 6, 'P'),
(29, 9, 4, 0, 2666.67, '2012-12-10', 4, 6, 'P'),
(30, 9, 4, 0, 2666.67, '2013-01-10', 5, 6, 'P'),
(31, 9, 4, 0, 2666.67, '2013-02-10', 6, 6, 'P'),
(32, 10, 4, 0, 4344.63, '2012-09-10', 1, 3, 'P'),
(33, 10, 4, 0, 4344.63, '2012-10-10', 2, 3, 'P'),
(34, 10, 4, 0, 4344.63, '2012-11-10', 3, 3, 'P'),
(35, 11, 1, 0, 1184.00, '2012-09-10', 1, 1, 'P'),
(36, 12, 2, 0, 184.90, '2012-09-10', 1, 1, 'P'),
(37, 12, 2, 0, 1000.00, '2012-10-10', 1, 1, 'P'),
(38, 7, 4, 0, 924.50, '2012-09-11', 1, 1, 'P'),
(39, 7, 4, 0, 1000.00, '2012-09-11', 1, 5, 'P'),
(40, 7, 4, 0, 1000.00, '2012-10-11', 2, 5, 'P'),
(41, 7, 4, 0, 1000.00, '2012-11-11', 3, 5, 'P'),
(42, 7, 4, 0, 1000.00, '2012-12-11', 4, 5, 'P'),
(43, 7, 4, 0, 1000.00, '2013-01-11', 5, 5, 'P'),
(44, 14, 3, 0, 1184.90, '2012-09-12', 1, 1, 'P'),
(45, 15, 2, 0, 592.45, '2012-10-11', 1, 2, 'P'),
(46, 15, 2, 0, 592.45, '2012-11-11', 2, 2, 'P'),
(47, 16, 5, 0, 924.50, '2012-09-11', 1, 1, 'P'),
(48, 16, 5, 0, 1000.00, '2012-10-11', 1, 5, 'P'),
(49, 16, 5, 0, 1000.00, '2012-11-11', 2, 5, 'P'),
(50, 16, 5, 0, 1000.00, '2012-12-11', 3, 5, 'P'),
(51, 16, 5, 0, 1000.00, '2013-01-11', 4, 5, 'P'),
(52, 16, 5, 0, 1000.00, '2013-02-11', 5, 5, 'P'),
(53, 13, 5, 1, 394.97, '2012-10-11', 1, 3, 'P'),
(54, 13, 5, 1, 394.97, '2012-11-11', 2, 3, 'P'),
(55, 13, 5, 1, 394.97, '2012-12-11', 3, 3, 'P'),
(56, 0, 4, 1, 1230.52, '2012-09-10', 1, 1, 'P'),
(57, 19, 3, 0, 25.00, '2012-09-12', 1, 1, 'P'),
(58, 17, 2, 0, 150.00, '2012-10-14', 1, 2, 'P'),
(59, 17, 2, 0, 150.00, '2012-11-14', 2, 2, 'P'),
(60, 21, 7, 1, 219.90, '2012-10-14', 1, 1, 'P'),
(61, 22, 1, 0, 900.00, '2012-09-14', 1, 1, 'P'),
(62, 23, 1, 0, 619.90, '2012-09-14', 1, 1, 'P'),
(63, 24, 7, 1, 1200.00, '2012-10-14', 1, 1, 'P'),
(64, 25, 3, 0, 69.90, '2012-09-15', 1, 1, 'P'),
(65, 26, 4, 0, 150.00, '2012-09-14', 1, 1, 'P'),
(66, 20, 1, 0, 69.90, '2012-09-17', 1, 1, 'P'),
(67, 28, 2, 0, 100.00, '2012-09-17', 1, 1, 'P'),
(68, 28, 2, 0, 100.00, '2012-10-17', 1, 2, 'P'),
(69, 28, 2, 0, 100.00, '2012-11-17', 2, 2, 'P'),
(70, 29, 1, 0, 1569.90, '2012-09-21', 1, 1, 'P'),
(71, 30, 1, 0, 67.90, '2012-09-24', 1, 1, 'P'),
(72, 31, 5, 1, 9.00, '2012-09-24', 1, 1, 'P'),
(73, 31, 5, 1, 30.00, '2012-10-04', 1, 2, 'P'),
(74, 31, 5, 1, 30.00, '2012-11-24', 2, 2, 'P'),
(75, 32, 1, 0, 150.00, '2012-09-24', 1, 1, 'P'),
(76, 33, 5, 0, 40.00, '2012-09-24', 1, 1, 'P'),
(77, 33, 5, 0, 30.00, '2012-10-24', 1, 3, 'P'),
(78, 33, 5, 0, 30.00, '2012-11-24', 2, 3, 'P'),
(79, 33, 5, 0, 30.00, '2012-12-24', 3, 3, 'P'),
(80, 34, 4, 0, 75.00, '2012-09-24', 1, 2, 'P'),
(81, 34, 4, 0, 75.00, '2012-10-24', 2, 2, 'P'),
(82, 35, 2, 0, 50.00, '2012-10-24', 1, 3, 'P'),
(83, 35, 2, 0, 50.00, '2012-11-24', 2, 3, 'P'),
(84, 35, 2, 0, 50.00, '2012-12-24', 3, 3, 'P'),
(85, 36, 2, 1, 40.00, '2012-09-24', 1, 1, 'P'),
(86, 36, 2, 1, 40.00, '2012-10-24', 1, 2, 'P'),
(87, 36, 2, 1, 40.00, '2012-11-24', 2, 2, 'P'),
(88, 37, 1, 0, 150.00, '2012-09-24', 1, 1, 'P'),
(89, 37, 1, 0, 145.00, '2012-09-24', 1, 1, 'P'),
(90, 38, 1, 0, 279.60, '2012-09-25', 1, 1, 'P'),
(91, 39, 2, 0, 69.90, '2012-10-25', 1, 1, 'P'),
(92, 40, 7, 1, 69.90, '2012-10-25', 1, 1, 'P'),
(93, 41, 6, 1, 109.95, '2012-10-26', 1, 2, 'P'),
(94, 41, 6, 1, 109.95, '2012-11-26', 2, 2, 'P'),
(95, 42, 5, 1, 69.90, '2012-10-10', 1, 1, 'P'),
(96, 43, 1, 0, 900.00, '2012-10-02', 1, 1, 'P'),
(97, 44, 1, 0, 150.00, '2012-10-02', 1, 1, 'P'),
(98, 45, 1, 1, 150.00, '2012-10-02', 1, 1, 'P'),
(99, 46, 7, 1, 2289.90, '2012-11-03', 1, 1, 'P'),
(100, 47, 1, 0, 400.00, '2012-10-03', 1, 1, 'P'),
(101, 27, 1, 0, 69.90, '2012-10-04', 1, 1, 'P'),
(102, 48, 6, 1, 63.00, '2012-11-05', 1, 1, 'P'),
(103, 50, 2, 0, 124.95, '2012-11-05', 1, 2, 'P'),
(104, 50, 2, 0, 124.95, '2012-12-05', 2, 2, 'P'),
(105, 51, 1, 0, 2052.00, '2012-10-05', 1, 1, 'P'),
(106, 52, 1, 0, 256.50, '2012-10-05', 1, 1, 'P'),
(107, 53, 3, 0, 150.00, '2012-10-06', 1, 1, 'D'),
(108, 54, 4, 0, 75.00, '2012-10-05', 1, 2, 'P'),
(109, 54, 4, 0, 75.00, '2012-11-05', 2, 2, 'P'),
(110, 55, 6, 2, 150.00, '2012-11-05', 1, 1, 'P'),
(111, 56, 7, 2, 693.00, '2012-11-16', 1, 1, 'P'),
(112, 59, 1, 0, 294.00, '2012-10-17', 1, 1, 'P'),
(113, 60, 7, 2, 400.00, '2012-11-17', 1, 1, 'P'),
(114, 61, 5, 0, 400.00, '2012-11-17', 1, 1, 'P'),
(115, 62, 3, 0, 500.00, '2012-10-18', 1, 1, 'P'),
(116, 58, 1, 0, 3000.00, '2012-10-17', 1, 1, 'P'),
(117, 64, 1, 0, 360.00, '2012-11-01', 1, 1, 'P'),
(118, 65, 1, 0, 614.25, '2013-04-09', 1, 1, 'P'),
(119, 67, 2, 0, 315.00, '2013-05-09', 1, 1, 'D'),
(120, 68, 2, 0, 550.00, '2013-05-09', 1, 1, 'D'),
(121, 69, 6, 2, 780.00, '2013-05-09', 1, 1, 'P'),
(122, 70, 6, 1, 105.00, '2013-05-09', 1, 2, 'D'),
(123, 70, 6, 1, 105.00, '2013-06-09', 2, 2, 'D'),
(124, 71, 4, 0, 97.50, '2013-04-09', 1, 1, 'P'),
(125, 72, 6, 1, 86.83, '2013-05-26', 1, 6, 'D'),
(126, 72, 6, 1, 86.83, '2013-06-26', 2, 6, 'D'),
(127, 72, 6, 1, 86.83, '2013-07-26', 3, 6, 'D'),
(128, 72, 6, 1, 86.83, '2013-08-26', 4, 6, 'D'),
(129, 72, 6, 1, 86.83, '2013-09-26', 5, 6, 'D'),
(130, 72, 6, 1, 86.83, '2013-10-26', 6, 6, 'D'),
(131, 74, 1, 0, 360.00, '2013-06-05', 1, 1, 'P'),
(132, 75, 3, 0, 72.00, '2013-06-06', 1, 1, 'D'),
(133, 76, 1, 0, 72.00, '2014-06-13', 1, 1, 'P'),
(134, 77, 1, 0, 72.00, '2014-06-14', 1, 1, 'P'),
(135, 78, 1, 0, 21.00, '2014-06-18', 1, 1, 'P'),
(136, 79, 1, 2, 42.00, '2014-06-23', 1, 1, 'P'),
(137, 80, 1, 0, 145.00, '2014-06-26', 1, 1, 'P'),
(138, 81, 1, 1, 562.00, '2014-07-21', 1, 1, 'P'),
(139, 82, 1, 0, 145.00, '2014-08-04', 1, 1, 'P'),
(140, 83, 2, 0, 145.00, '2014-10-16', 1, 1, 'P'),
(141, 84, 7, 2, 45.00, '2014-09-16', 1, 1, 'P'),
(142, 84, 7, 2, 100.00, '2014-09-15', 1, 1, 'P'),
(143, 85, 7, 2, 50.00, '2014-09-24', 1, 1, 'P'),
(144, 85, 7, 2, 95.00, '2014-10-24', 1, 1, 'P'),
(145, 86, 7, 2, 72.00, '2014-10-24', 1, 1, 'D'),
(146, 87, 7, 2, 55.00, '2015-01-04', 1, 3, 'P'),
(147, 87, 7, 2, 55.00, '2015-02-04', 2, 3, 'D'),
(148, 87, 7, 2, 55.00, '2015-03-04', 3, 3, 'D'),
(149, 88, 2, 0, 55.00, '2015-01-04', 1, 1, 'P'),
(150, 90, 7, 2, 500.00, '2014-12-26', 1, 1, 'P'),
(151, 90, 7, 2, 548.50, '2015-01-26', 1, 1, 'D'),
(152, 90, 7, 2, 500.00, '2014-12-26', 1, 1, 'P'),
(153, 90, 7, 2, 78.36, '2015-01-26', 1, 7, 'D'),
(154, 90, 7, 2, 78.36, '2015-02-26', 2, 7, 'D'),
(155, 90, 7, 2, 78.36, '2015-03-26', 3, 7, 'D'),
(156, 90, 7, 2, 78.36, '2015-04-26', 4, 7, 'D'),
(157, 90, 7, 2, 78.36, '2015-05-26', 5, 7, 'D'),
(158, 90, 7, 2, 78.36, '2015-06-26', 6, 7, 'D'),
(159, 90, 7, 2, 78.36, '2015-07-26', 7, 7, 'D'),
(160, 91, 7, 1, 139.80, '2015-01-26', 1, 10, 'D'),
(161, 91, 7, 1, 139.80, '2015-02-26', 2, 10, 'D'),
(162, 91, 7, 1, 139.80, '2015-03-26', 3, 10, 'D'),
(163, 91, 7, 1, 139.80, '2015-04-26', 4, 10, 'D'),
(164, 91, 7, 1, 139.80, '2015-05-26', 5, 10, 'D'),
(165, 91, 7, 1, 139.80, '2015-06-26', 6, 10, 'D'),
(166, 91, 7, 1, 139.80, '2015-07-26', 7, 10, 'D'),
(167, 91, 7, 1, 139.80, '2015-08-26', 8, 10, 'D'),
(168, 91, 7, 1, 139.80, '2015-09-26', 9, 10, 'D'),
(169, 91, 7, 1, 139.80, '2015-10-26', 10, 10, 'D'),
(170, 92, 7, 0, 104.85, '2015-01-26', 1, 10, 'D'),
(171, 92, 7, 0, 104.85, '2015-02-26', 2, 10, 'D'),
(172, 92, 7, 0, 104.85, '2015-03-26', 3, 10, 'D'),
(173, 92, 7, 0, 104.85, '2015-04-26', 4, 10, 'D'),
(174, 92, 7, 0, 104.85, '2015-05-26', 5, 10, 'D'),
(175, 92, 7, 0, 104.85, '2015-06-26', 6, 10, 'D'),
(176, 92, 7, 0, 104.85, '2015-07-26', 7, 10, 'D'),
(177, 92, 7, 0, 104.85, '2015-08-26', 8, 10, 'D'),
(178, 92, 7, 0, 104.85, '2015-09-26', 9, 10, 'D'),
(179, 92, 7, 0, 104.85, '2015-10-26', 10, 10, 'D'),
(180, 93, 7, 2, 314.55, '2015-01-26', 1, 10, 'D'),
(181, 93, 7, 2, 314.55, '2015-02-26', 2, 10, 'D'),
(182, 93, 7, 2, 314.55, '2015-03-26', 3, 10, 'D'),
(183, 93, 7, 2, 314.55, '2015-04-26', 4, 10, 'D'),
(184, 93, 7, 2, 314.55, '2015-05-26', 5, 10, 'D'),
(185, 93, 7, 2, 314.55, '2015-06-26', 6, 10, 'D'),
(186, 93, 7, 2, 314.55, '2015-07-26', 7, 10, 'D'),
(187, 93, 7, 2, 314.55, '2015-08-26', 8, 10, 'D'),
(188, 93, 7, 2, 314.55, '2015-09-26', 9, 10, 'D'),
(189, 93, 7, 2, 314.55, '2015-10-26', 10, 10, 'D');

-- --------------------------------------------------------

--
-- Estrutura da tabela `retiradas`
--

CREATE TABLE IF NOT EXISTS `retiradas` (
`retiradaID` int(11) NOT NULL,
  `caixaID` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `observacao` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `retiradas`
--

INSERT INTO `retiradas` (`retiradaID`, `caixaID`, `usuario`, `responsavel`, `valor`, `observacao`, `data`) VALUES
(1, 11, 'hernani', 'Hernani', 100000.00, 'retirada de segurança', '2012-09-14 13:19:06'),
(2, 24, 'gesse1', 'Hernani', 150.00, 'segurança', '2012-10-17 17:56:41');

-- --------------------------------------------------------

--
-- Estrutura da tabela `retiradasestoque`
--

CREATE TABLE IF NOT EXISTS `retiradasestoque` (
`retiradaID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `motivo` text NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `retiradasestoque`
--

INSERT INTO `retiradasestoque` (`retiradaID`, `produtoID`, `quantidade`, `motivo`, `usuario`, `data`) VALUES
(1, 18, 5.00, 'Fazer 10 metros de lajes treliças', '1', '2012-09-11 13:47:07'),
(2, 18, 10.00, 'Fazer 20 metros de lajes treliças', '1', '2012-09-11 13:48:11'),
(3, 19, 2.00, 'teste', '1', '2012-10-05 18:05:25'),
(4, 25, 8.00, 'Para fazer 100mt de laje pra cliente tal', '1', '2013-04-09 20:20:52'),
(5, 23, 2.00, 'Para fazer 100mt de laje pra cliente tal', '1', '2013-04-09 20:21:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoproduto`
--

CREATE TABLE IF NOT EXISTS `tipoproduto` (
`tipoprodutoID` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipoAtivo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Extraindo dados da tabela `tipoproduto`
--

INSERT INTO `tipoproduto` (`tipoprodutoID`, `tipo`, `data`, `tipoAtivo`) VALUES
(26, 'Saia longa', '2014-12-11 21:01:13', 'S'),
(27, 'Vestido', '2014-12-04 18:16:54', 'S'),
(28, 'Vestido social', '2014-12-11 21:00:18', 'S'),
(29, 'Vestido longo', '2014-12-11 21:00:30', 'S'),
(30, 'Saia social ', '2014-12-11 21:01:38', 'S'),
(31, 'Saia jeans ', '2014-12-11 21:01:59', 'S'),
(32, 'Saia longuete', '2014-12-11 21:02:39', 'S'),
(33, 'Blusa', '2014-12-11 21:11:14', 'S'),
(34, 'Camisete', '2014-12-11 21:11:26', 'S'),
(35, 'Bolero', '2014-12-11 21:11:51', 'S'),
(36, 'Bolsa', '2014-12-11 21:12:20', 'S'),
(37, 'Carteira', '2014-12-11 21:12:32', 'S'),
(38, 'Gravata', '2014-12-11 21:12:40', 'S'),
(39, 'Cueca', '2014-12-11 21:13:02', 'S'),
(40, 'Meia-calça', '2014-12-11 21:13:47', 'S'),
(41, 'Meia', '2014-12-11 21:14:22', 'S'),
(42, 'Sobretudo', '2014-12-11 21:17:16', 'S'),
(43, 'Blusa de linha', '2014-12-11 21:17:34', 'S'),
(44, 'Bolero de linha', '2014-12-11 21:17:55', 'S'),
(45, 'Cinto', '2014-12-11 21:18:03', 'S'),
(46, 'Saia de linha', '2014-12-12 11:22:50', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencias`
--

CREATE TABLE IF NOT EXISTS `transferencias` (
`transferenciaID` int(11) NOT NULL,
  `bancoDe` int(11) NOT NULL,
  `bancoPara` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `observacoes` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `transferencias`
--

INSERT INTO `transferencias` (`transferenciaID`, `bancoDe`, `bancoPara`, `valor`, `observacoes`, `data`) VALUES
(1, 1, 5, 300.00, 'cobrir cheque da nokia', '2012-09-09 03:07:07'),
(2, 1, 3, 200.00, 'cobrir saldo devedor', '2012-09-09 03:08:37'),
(3, 1, 2, 150.00, 'transfer&#234;ncia para poupança ', '2012-09-09 03:09:58'),
(4, 1, 4, 200.00, 'pagar conta de agua e luz debito altomatico', '2012-09-09 03:11:40'),
(5, 1, 5, 1230.52, 'Deposito do cheque do joao', '2012-09-11 13:32:50'),
(6, 5, 1, 1230.52, 'cheque devolvido', '2012-09-11 13:36:55'),
(7, 1, 5, 10000.00, 'transferencia de segurança', '2012-09-14 12:40:49'),
(8, 1, 5, 3000.00, '', '2012-09-17 19:14:58'),
(9, 1, 5, 1000.00, '', '2012-09-25 17:42:36'),
(10, 1, 3, 2000.00, '', '2012-10-04 16:29:14'),
(11, 1, 4, 2000.00, '', '2012-10-05 12:09:19'),
(12, 1, 2, 2000.00, 'motivo', '2012-10-17 18:09:04'),
(13, 5, 2, 5000.00, 'repasse de locaç&#227;o', '2013-02-20 18:49:31'),
(14, 1, 5, 750.00, 'deposito do boleto pago na loja', '2013-04-09 21:19:49'),
(15, 1, 3, 2000.00, 'transferencia para pagamentos de conta', '2014-09-16 16:56:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`usuarioID` int(11) NOT NULL,
  `usuarioNome` varchar(50) NOT NULL,
  `usuarioTelefone` varchar(15) NOT NULL,
  `usuarioEmail` varchar(100) NOT NULL,
  `usuarioLogin` varchar(20) NOT NULL,
  `usuarioSenha` varchar(20) NOT NULL,
  `usuarioNivel` int(11) NOT NULL,
  `usuarioData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioAtivo` varchar(1) NOT NULL DEFAULT 'S'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `usuarioNome`, `usuarioTelefone`, `usuarioEmail`, `usuarioLogin`, `usuarioSenha`, `usuarioNivel`, `usuarioData`, `usuarioAtivo`) VALUES
(6, 'Diego Joao dos Santos', '', '', 'adm', 'adm123', 1, '2014-12-11 20:53:34', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
`vendaID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `entrada` float(10,2) NOT NULL,
  `troco` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `desconto` float(10,2) NOT NULL,
  `notaFiscal` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94 ;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`vendaID`, `clienteID`, `formPagID`, `valor`, `entrada`, `troco`, `vezes`, `desconto`, `notaFiscal`, `data`, `usuario`, `status`) VALUES
(1, 0, 3, 1687.54, 1687.54, 0.00, 1, 0.00, '0', '2012-09-08 17:40:46', 'hernani', '2'),
(2, 1, 7, 3650.97, 0.00, 0.00, 2, 0.00, '0', '2012-09-09 02:52:01', 'hernani', '2'),
(3, 1, 7, 3691.55, 0.00, 0.00, 3, 0.00, '0', '2012-09-09 03:00:33', 'hernani', '2'),
(4, 0, 3, 12254.22, 0.00, 0.00, 1, 0.00, '0', '2012-09-09 19:10:00', 'hernani', '2'),
(5, 0, 4, 3603.18, 0.00, 0.00, 1, 0.00, '0', '2012-09-09 19:14:25', 'hernani', '2'),
(6, 1, 4, 16600.00, 1600.00, 0.00, 6, 0.00, '0', '2012-09-09 19:16:37', 'hernani', '2'),
(7, 0, 4, 5924.50, 924.50, 0.00, 5, 0.00, '0', '2012-09-11 12:33:10', 'hernani', '2'),
(8, 0, 2, 1184.90, 0.00, 0.00, 3, 0.00, '0', '2012-09-10 12:04:21', 'gesse', '2'),
(9, 0, 4, 16588.60, 588.60, 0.00, 6, 0.00, '0', '2012-09-10 12:24:26', 'gesse', '2'),
(10, 0, 4, 13033.90, 0.00, 0.00, 3, 0.00, '0', '2012-09-10 12:26:38', 'GESSE', '2'),
(11, 0, 1, 1184.00, 1200.00, 16.00, 1, 0.90, '0', '2012-09-10 12:43:21', 'GESSE', '2'),
(12, 0, 2, 1184.90, 184.90, 0.00, 1, 0.00, '0', '2012-09-10 12:45:48', 'gesse', '2'),
(13, 1, 5, 1184.90, 0.00, 0.00, 3, 0.00, '0', '2012-09-11 13:29:49', 'gesse', '2'),
(14, 0, 3, 1184.90, 0.00, 0.00, 1, 0.00, '0', '2012-09-11 12:36:51', 'hernani', '2'),
(15, 0, 2, 1184.90, 0.00, 0.00, 2, 0.00, '0', '2012-09-11 12:42:46', 'hernani', '2'),
(16, 0, 5, 5924.50, 924.50, 0.00, 5, 0.00, '0', '2012-09-11 13:12:00', 'hernani', '2'),
(17, 0, 2, 300.00, 0.00, 0.00, 2, 0.00, '0', '2012-09-14 12:33:02', 'hernani', '2'),
(19, 0, 3, 25.00, 0.00, 0.00, 1, 0.00, '0', '2012-09-11 13:55:53', 'gesse', '2'),
(20, 0, 1, 69.90, 100.00, 30.10, 1, 0.00, '0', '2012-09-17 19:13:51', 'gesse', '2'),
(21, 1, 7, 219.90, 0.00, 0.00, 1, 0.00, '0', '2012-09-14 12:34:27', 'hernani', '2'),
(22, 0, 1, 900.00, 1000.00, 100.00, 1, 0.00, '0', '2012-09-14 12:36:11', 'hernani', '2'),
(23, 0, 1, 619.90, 630.00, 10.10, 1, 0.00, '0', '2012-09-14 13:23:37', 'hernani', '2'),
(24, 1, 7, 1200.00, 0.00, 0.00, 1, 0.00, '0', '2012-09-14 13:26:37', 'hernani', '2'),
(25, 0, 3, 69.90, 0.00, 0.00, 1, 0.00, '0', '2012-09-14 13:28:34', 'hernani', '2'),
(26, 0, 4, 150.00, 0.00, 0.00, 1, 0.00, '0', '2012-09-14 13:29:24', 'hernani', '2'),
(27, 0, 1, 69.90, 70.00, 0.10, 1, 0.00, '0', '2012-10-04 16:26:12', 'hernani', '2'),
(28, 0, 2, 300.00, 100.00, 0.00, 2, 0.00, '0', '2012-09-17 19:18:37', 'gesse', '2'),
(29, 0, 1, 1569.90, 1600.00, 30.10, 1, 0.00, '0', '2012-09-21 22:01:45', 'gesse', '2'),
(30, 0, 1, 67.90, 100.00, 32.10, 1, 2.00, '0', '2012-09-24 14:19:04', 'gesse', '2'),
(31, 1, 5, 69.00, 9.00, 0.00, 2, 0.90, '0', '2012-09-24 14:19:40', 'gesse', '2'),
(32, 0, 1, 150.00, 200.00, 50.00, 1, 0.00, '0', '2012-09-24 15:32:54', 'gesse', '2'),
(33, 0, 5, 130.00, 40.00, 0.00, 3, 20.00, '0', '2012-09-24 15:37:14', 'gesse', '2'),
(34, 0, 4, 150.00, 0.00, 0.00, 2, 0.00, '0', '2012-09-24 15:38:38', 'gesse', '2'),
(35, 0, 2, 150.00, 0.00, 0.00, 3, 0.00, '0', '2012-09-24 17:02:05', 'gesse', '2'),
(36, 1, 2, 120.00, 40.00, 0.00, 2, 30.00, '0', '2012-09-24 17:06:12', 'gesse', '2'),
(37, 0, 1, 145.00, 170.00, 25.00, 1, 5.00, '0', '2012-09-24 17:11:33', 'gesse', '2'),
(38, 0, 1, 279.60, 280.00, 0.40, 1, 0.00, '0', '2012-09-25 18:11:03', 'gesse', '2'),
(39, 0, 2, 69.90, 0.00, 0.00, 1, 0.00, '0', '2012-09-25 18:20:01', 'gesse', '2'),
(40, 1, 7, 69.90, 0.00, 0.00, 1, 0.00, '0', '2012-09-25 18:45:21', 'gesse', '2'),
(41, 1, 6, 219.90, 0.00, 0.00, 2, 0.00, '0', '2012-09-26 19:15:30', 'gesse', '2'),
(42, 1, 5, 69.90, 0.00, 0.00, 1, 0.00, '0', '2012-09-27 17:50:42', 'gesse', '2'),
(43, 0, 1, 900.00, 1000.00, 100.00, 1, 0.00, '0', '2012-10-02 17:49:38', 'gesse', '2'),
(44, 0, 1, 150.00, 200.00, 50.00, 1, 0.00, '0', '2012-10-02 19:39:27', 'gesse', '2'),
(45, 1, 1, 150.00, 160.00, 10.00, 1, 0.00, '0', '2012-10-02 19:42:25', 'gesse', '2'),
(46, 1, 7, 2289.90, 0.00, 0.00, 1, 80.00, '0', '2012-10-03 14:24:39', 'gesse', '2'),
(47, 0, 1, 400.00, 400.00, 0.00, 1, 0.00, '0', '2012-10-03 14:27:23', 'gesse', '2'),
(48, 1, 6, 63.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-05 11:23:05', 'gesse', '2'),
(49, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2012-10-04 16:27:50', 'hernani', '1'),
(50, 0, 2, 249.90, 0.00, 0.00, 2, 0.00, '0', '2012-10-05 11:34:24', 'gesse', '2'),
(51, 0, 1, 2052.00, 2100.00, 48.00, 1, 0.00, '0', '2012-10-05 11:39:01', 'gesse', '2'),
(52, 0, 1, 256.50, 260.00, 3.50, 1, 0.00, '0', '2012-10-05 12:00:44', 'gesse', '2'),
(53, 0, 3, 150.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-05 12:01:17', 'gesse', '2'),
(54, 0, 4, 150.00, 0.00, 0.00, 2, 0.00, '0', '2012-10-05 12:01:52', 'gesse', '2'),
(55, 2, 6, 150.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-05 12:05:40', 'gesse', '2'),
(56, 2, 7, 693.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-16 17:15:43', 'gesse', '2'),
(57, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2012-10-05 20:59:20', 'viviane', '1'),
(58, 0, 1, 3000.00, 3000.00, 0.00, 1, 0.00, '0', '2012-10-17 18:23:26', 'gesse', '2'),
(59, 0, 1, 294.00, 300.00, 6.00, 1, 0.00, '0', '2012-10-17 17:47:10', 'gesse1', '2'),
(60, 2, 7, 400.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-17 17:51:12', 'gesse1', '2'),
(61, 0, 5, 400.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-17 17:52:29', 'gesse1', '2'),
(62, 0, 3, 500.00, 0.00, 0.00, 1, 0.00, '0', '2012-10-17 17:52:53', 'gesse1', '2'),
(63, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2012-10-17 17:52:58', 'gesse1', '1'),
(64, 0, 1, 360.00, 400.00, 40.00, 1, 0.00, '0', '2012-11-01 12:21:09', 'gesse', '2'),
(65, 0, 1, 614.25, 650.00, 35.75, 1, 0.00, '0', '2013-04-09 20:35:24', 'gesse', '2'),
(67, 0, 2, 315.00, 0.00, 0.00, 1, 0.00, '0', '2013-04-09 20:57:53', 'gesse', '2'),
(68, 0, 2, 550.00, 0.00, 0.00, 1, 0.00, '0', '2013-04-09 21:04:16', 'gesse', '2'),
(69, 2, 6, 780.00, 0.00, 0.00, 1, 0.00, '0', '2013-04-09 21:04:53', 'gesse', '2'),
(70, 1, 6, 210.00, 0.00, 0.00, 2, 0.00, '0', '2013-04-09 21:07:35', 'gesse', '2'),
(71, 0, 4, 97.50, 0.00, 0.00, 1, 0.00, '0', '2013-04-09 21:11:47', 'gesse', '2'),
(72, 1, 6, 521.00, 0.00, 0.00, 6, 0.00, '0', '2013-04-26 13:36:44', 'gesse', '2'),
(74, 0, 1, 360.00, 400.00, 40.00, 1, 0.00, '0', '2013-06-05 17:59:52', 'gesse', '2'),
(75, 0, 3, 72.00, 0.00, 0.00, 1, 0.00, '0', '2013-06-05 18:03:42', 'gesse', '2'),
(76, 0, 1, 72.00, 100.00, 28.00, 1, 0.00, '0', '2014-06-13 13:30:10', 'gesse', '2'),
(77, 0, 1, 72.00, 100.00, 28.00, 1, 0.00, '0', '2014-06-14 17:33:26', 'gesse', '2'),
(78, 0, 1, 21.00, 50.00, 29.00, 1, 0.00, '0', '2014-06-18 15:01:03', 'gesse', '2'),
(79, 2, 1, 42.00, 50.00, 8.00, 1, 0.00, '0', '2014-06-23 17:41:34', 'gesse', '2'),
(80, 0, 1, 145.00, 150.00, 5.00, 1, 0.00, '0', '2014-06-26 20:57:38', 'gesse', '2'),
(81, 1, 1, 562.00, 600.00, 38.00, 1, 10.00, '0', '2014-07-22 00:18:39', 'gesse', '2'),
(82, 0, 1, 145.00, 150.00, 5.00, 1, 0.00, '0', '2014-08-04 20:25:51', 'gesse', '2'),
(83, 0, 2, 145.00, 0.00, 0.00, 1, 0.00, '0', '2014-09-16 16:39:21', 'gesse', '2'),
(84, 2, 7, 145.00, 45.00, 0.00, 1, 0.00, '0', '2014-09-16 16:44:44', 'gesse', '2'),
(85, 2, 7, 145.00, 50.00, 0.00, 1, 0.00, '0', '2014-09-24 13:10:00', 'gesse', '2'),
(86, 2, 7, 72.00, 0.00, 0.00, 1, 0.00, '0', '2014-09-24 13:12:53', 'gesse', '2'),
(87, 2, 7, 165.00, 0.00, 0.00, 3, 0.00, '0', '2014-12-04 18:24:12', 'gesse', '2'),
(88, 0, 2, 55.00, 0.00, 0.00, 1, 0.00, '0', '2014-12-04 18:41:41', 'gesse', '2'),
(89, 0, 0, 0.00, 0.00, 0.00, 0, 0.00, '0', '2014-12-04 18:41:48', 'gesse', '1'),
(90, 2, 7, 1048.50, 500.00, 0.00, 7, 0.00, '0', '2014-12-26 17:26:47', 'adm', '2'),
(91, 1, 7, 1398.00, 0.00, 0.00, 10, 0.00, '0', '2014-12-26 17:54:32', 'adm', '2'),
(92, 0, 7, 1048.50, 0.00, 0.00, 10, 0.00, '0', '2014-12-26 18:05:44', 'adm', '2'),
(93, 2, 7, 3145.50, 0.00, 0.00, 10, 0.00, '0', '2014-12-26 19:11:13', 'adm', '2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendaitem`
--

CREATE TABLE IF NOT EXISTS `vendaitem` (
`itemID` int(11) NOT NULL,
  `vendaID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Extraindo dados da tabela `vendaitem`
--

INSERT INTO `vendaitem` (`itemID`, `vendaID`, `produtoID`, `quantidade`, `valor`, `total`) VALUES
(1, 1, 7, 1.00, 114.00, 114.00),
(3, 1, 1, 5.00, 77.00, 385.00),
(4, 1, 13, 3.00, 396.18, 1188.54),
(5, 2, 13, 3.00, 396.18, 1188.54),
(6, 2, 4, 2.00, 726.75, 1453.50),
(7, 2, 13, 1.00, 396.18, 396.18),
(8, 2, 8, 3.00, 204.25, 612.75),
(9, 3, 5, 2.00, 297.50, 595.00),
(10, 3, 7, 1.00, 114.00, 114.00),
(11, 3, 8, 3.00, 204.25, 612.75),
(12, 3, 11, 1.00, 1184.90, 1184.90),
(13, 3, 11, 1.00, 1184.90, 1184.90),
(14, 4, 13, 4.00, 396.18, 1584.72),
(15, 4, 7, 2.00, 114.00, 228.00),
(16, 4, 11, 5.00, 1184.90, 5924.50),
(17, 4, 6, 3.00, 187.00, 561.00),
(18, 4, 15, 4.00, 989.00, 3956.00),
(19, 5, 9, 3.00, 186.75, 560.25),
(20, 5, 12, 2.00, 1037.50, 2075.00),
(21, 5, 13, 1.00, 396.18, 396.18),
(22, 5, 9, 1.00, 186.75, 186.75),
(23, 5, 1, 5.00, 77.00, 385.00),
(24, 6, 12, 1.00, 1037.50, 1037.50),
(25, 6, 12, 15.00, 1037.50, 15562.50),
(26, 8, 11, 1.00, 1184.90, 1184.90),
(27, 9, 11, 14.00, 1184.90, 16588.60),
(28, 10, 11, 11.00, 1184.90, 13033.90),
(29, 11, 11, 1.00, 1184.90, 1184.90),
(30, 12, 11, 1.00, 1184.90, 1184.90),
(31, 7, 11, 5.00, 1184.90, 5924.50),
(32, 14, 11, 1.00, 1184.90, 1184.90),
(33, 15, 11, 1.00, 1184.90, 1184.90),
(34, 16, 11, 5.00, 1184.90, 5924.50),
(35, 13, 11, 1.00, 1184.90, 1184.90),
(36, 19, 17, 1.00, 25.00, 25.00),
(38, 17, 20, 1.00, 150.00, 150.00),
(39, 17, 20, 1.00, 150.00, 150.00),
(40, 21, 19, 1.00, 69.90, 69.90),
(41, 21, 20, 1.00, 150.00, 150.00),
(42, 22, 21, 1.00, 400.00, 400.00),
(43, 22, 22, 1.00, 500.00, 500.00),
(44, 23, 19, 1.00, 69.90, 69.90),
(45, 23, 20, 1.00, 150.00, 150.00),
(46, 23, 21, 1.00, 400.00, 400.00),
(47, 24, 21, 3.00, 400.00, 1200.00),
(48, 25, 19, 1.00, 69.90, 69.90),
(49, 26, 20, 1.00, 150.00, 150.00),
(51, 20, 19, 1.00, 69.90, 69.90),
(52, 28, 20, 2.00, 150.00, 300.00),
(53, 29, 19, 1.00, 69.90, 69.90),
(54, 29, 20, 10.00, 150.00, 1500.00),
(55, 30, 19, 1.00, 69.90, 69.90),
(56, 31, 19, 1.00, 69.90, 69.90),
(57, 32, 20, 1.00, 150.00, 150.00),
(58, 33, 20, 1.00, 150.00, 150.00),
(59, 34, 20, 1.00, 150.00, 150.00),
(60, 35, 20, 1.00, 150.00, 150.00),
(61, 36, 20, 1.00, 150.00, 150.00),
(62, 37, 20, 1.00, 150.00, 150.00),
(64, 38, 19, 4.00, 69.90, 279.60),
(65, 39, 19, 1.00, 69.90, 69.90),
(66, 40, 19, 1.00, 69.90, 69.90),
(67, 41, 19, 1.00, 69.90, 69.90),
(68, 41, 20, 1.00, 150.00, 150.00),
(69, 42, 19, 1.00, 69.90, 69.90),
(70, 43, 21, 1.00, 400.00, 400.00),
(71, 43, 22, 1.00, 500.00, 500.00),
(72, 44, 20, 1.00, 150.00, 150.00),
(73, 45, 20, 1.00, 150.00, 150.00),
(74, 46, 21, 1.00, 400.00, 400.00),
(75, 46, 21, 1.00, 400.00, 400.00),
(76, 46, 19, 1.00, 69.90, 69.90),
(77, 46, 22, 3.00, 500.00, 1500.00),
(78, 47, 21, 1.00, 400.00, 400.00),
(79, 27, 19, 1.00, 69.90, 69.90),
(80, 48, 19, 1.00, 63.00, 63.00),
(81, 50, 23, 1.00, 249.90, 249.90),
(82, 51, 23, 8.00, 256.50, 2052.00),
(83, 52, 23, 1.00, 256.50, 256.50),
(84, 53, 20, 1.00, 150.00, 150.00),
(85, 54, 20, 1.00, 150.00, 150.00),
(86, 55, 20, 1.00, 150.00, 150.00),
(87, 56, 19, 1.00, 63.00, 63.00),
(88, 56, 19, 10.00, 63.00, 630.00),
(90, 59, 19, 2.00, 72.00, 144.00),
(91, 59, 20, 1.00, 150.00, 150.00),
(92, 60, 21, 1.00, 400.00, 400.00),
(93, 61, 21, 1.00, 400.00, 400.00),
(94, 62, 22, 1.00, 500.00, 500.00),
(95, 58, 20, 20.00, 150.00, 3000.00),
(96, 64, 19, 5.00, 72.00, 360.00),
(97, 65, 23, 3.50, 97.50, 341.25),
(98, 65, 25, 5.00, 21.00, 105.00),
(99, 65, 25, 8.00, 21.00, 168.00),
(100, 67, 25, 15.00, 21.00, 315.00),
(101, 68, 24, 25.00, 22.00, 550.00),
(102, 69, 23, 8.00, 97.50, 780.00),
(103, 70, 25, 10.00, 21.00, 210.00),
(104, 71, 23, 1.00, 97.50, 97.50),
(105, 72, 22, 1.00, 500.00, 500.00),
(106, 72, 25, 1.00, 21.00, 21.00),
(108, 74, 19, 5.00, 72.00, 360.00),
(109, 75, 19, 1.00, 72.00, 72.00),
(110, 76, 19, 1.00, 72.00, 72.00),
(111, 77, 19, 1.00, 72.00, 72.00),
(112, 78, 25, 1.00, 21.00, 21.00),
(113, 79, 25, 2.00, 21.00, 42.00),
(114, 80, 23, 1.00, 145.00, 145.00),
(115, 81, 19, 1.00, 72.00, 72.00),
(116, 81, 22, 1.00, 500.00, 500.00),
(117, 82, 23, 1.00, 145.00, 145.00),
(118, 83, 23, 1.00, 145.00, 145.00),
(119, 84, 23, 1.00, 145.00, 145.00),
(120, 85, 23, 1.00, 145.00, 145.00),
(121, 86, 19, 1.00, 72.00, 72.00),
(122, 87, 26, 3.00, 55.00, 165.00),
(124, 88, 26, 1.00, 55.00, 55.00),
(125, 90, 30, 15.00, 69.90, 1048.50),
(126, 91, 30, 20.00, 69.90, 1398.00),
(127, 92, 30, 15.00, 69.90, 1048.50),
(128, 93, 30, 45.00, 69.90, 3145.50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acesso`
--
ALTER TABLE `acesso`
 ADD PRIMARY KEY (`acessoID`);

--
-- Indexes for table `caixa`
--
ALTER TABLE `caixa`
 ADD PRIMARY KEY (`caixaID`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
 ADD PRIMARY KEY (`cargoID`);

--
-- Indexes for table `cheques`
--
ALTER TABLE `cheques`
 ADD PRIMARY KEY (`chequeID`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`clienteID`);

--
-- Indexes for table `contapagar`
--
ALTER TABLE `contapagar`
 ADD PRIMARY KEY (`contapagarID`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`empresaID`);

--
-- Indexes for table `estoque`
--
ALTER TABLE `estoque`
 ADD PRIMARY KEY (`estoqueID`);

--
-- Indexes for table `formapagamento`
--
ALTER TABLE `formapagamento`
 ADD PRIMARY KEY (`formID`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
 ADD PRIMARY KEY (`fornecedorID`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
 ADD PRIMARY KEY (`funcionarioID`), ADD KEY `cargoID` (`cargoID`);

--
-- Indexes for table `lancamentos`
--
ALTER TABLE `lancamentos`
 ADD PRIMARY KEY (`lancamentoID`), ADD KEY `idx_1` (`formID`,`livroID`);

--
-- Indexes for table `livrocaixa`
--
ALTER TABLE `livrocaixa`
 ADD PRIMARY KEY (`livroID`);

--
-- Indexes for table `orcamento`
--
ALTER TABLE `orcamento`
 ADD PRIMARY KEY (`orcamentoID`);

--
-- Indexes for table `orcamentoitem`
--
ALTER TABLE `orcamentoitem`
 ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `pagar`
--
ALTER TABLE `pagar`
 ADD PRIMARY KEY (`pagarID`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
 ADD PRIMARY KEY (`produtoID`), ADD KEY `tipoprodutoID` (`tipoprodutoID`), ADD KEY `fornecedorID` (`fornecedorID`);

--
-- Indexes for table `receber`
--
ALTER TABLE `receber`
 ADD PRIMARY KEY (`receberID`);

--
-- Indexes for table `retiradas`
--
ALTER TABLE `retiradas`
 ADD PRIMARY KEY (`retiradaID`);

--
-- Indexes for table `retiradasestoque`
--
ALTER TABLE `retiradasestoque`
 ADD PRIMARY KEY (`retiradaID`);

--
-- Indexes for table `tipoproduto`
--
ALTER TABLE `tipoproduto`
 ADD PRIMARY KEY (`tipoprodutoID`);

--
-- Indexes for table `transferencias`
--
ALTER TABLE `transferencias`
 ADD PRIMARY KEY (`transferenciaID`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`usuarioID`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
 ADD PRIMARY KEY (`vendaID`);

--
-- Indexes for table `vendaitem`
--
ALTER TABLE `vendaitem`
 ADD PRIMARY KEY (`itemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acesso`
--
ALTER TABLE `acesso`
MODIFY `acessoID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `caixa`
--
ALTER TABLE `caixa`
MODIFY `caixaID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
MODIFY `cargoID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cheques`
--
ALTER TABLE `cheques`
MODIFY `chequeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contapagar`
--
ALTER TABLE `contapagar`
MODIFY `contapagarID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
MODIFY `empresaID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `estoque`
--
ALTER TABLE `estoque`
MODIFY `estoqueID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `formapagamento`
--
ALTER TABLE `formapagamento`
MODIFY `formID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `fornecedor`
--
ALTER TABLE `fornecedor`
MODIFY `fornecedorID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
MODIFY `funcionarioID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lancamentos`
--
ALTER TABLE `lancamentos`
MODIFY `lancamentoID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `livrocaixa`
--
ALTER TABLE `livrocaixa`
MODIFY `livroID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `orcamento`
--
ALTER TABLE `orcamento`
MODIFY `orcamentoID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `orcamentoitem`
--
ALTER TABLE `orcamentoitem`
MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pagar`
--
ALTER TABLE `pagar`
MODIFY `pagarID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
MODIFY `produtoID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `receber`
--
ALTER TABLE `receber`
MODIFY `receberID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT for table `retiradas`
--
ALTER TABLE `retiradas`
MODIFY `retiradaID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `retiradasestoque`
--
ALTER TABLE `retiradasestoque`
MODIFY `retiradaID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tipoproduto`
--
ALTER TABLE `tipoproduto`
MODIFY `tipoprodutoID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `transferencias`
--
ALTER TABLE `transferencias`
MODIFY `transferenciaID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
MODIFY `vendaID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `vendaitem`
--
ALTER TABLE `vendaitem`
MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cargoID`) REFERENCES `cargo` (`cargoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`tipoprodutoID`) REFERENCES `tipoproduto` (`tipoprodutoID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`fornecedorID`) REFERENCES `fornecedor` (`fornecedorID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
