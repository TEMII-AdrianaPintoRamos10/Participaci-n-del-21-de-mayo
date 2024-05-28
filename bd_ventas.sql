SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `bd_ventas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_ventas`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `celular` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `celular`) VALUES
(1, 'Adriana', 'adriramos@gmail.com', '63462063'),
(2, 'raysa', 'raysam@mail.com', '67005808');

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'QLED TV TOSHIBA 65', 'Modelo M550 con una calidad 4K Quantum.', 4170),
(2, 'Tecno Pova 6 pro', 'Un celular innovador con un diseño Dynamic Tech', 2570);

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `email`, `password`) VALUES
(1, 'adriana', 'ramos', 'adripintoramos@mail.com', '9580702'),
(2, 'luisa', 'velasco', 'luisa.velasc@mail.com', 'd41d8cd98f00b204e9800998ecf8427e'),
(3, 'Oscar', 'Rocha', 'rocha.osc@mail.com', '123456'),
(4, 'Adalberto', 'Yabeta', 'adal.yabeta@mail.com', '654321'),
(5, 'Cesar', 'Camargo', 'c.camargo@mail.com', '13579'),
(6, 'Lucymar', 'Arauz', 'ara.lucy@mail.com', '147369');

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `ventas` (`id`, `producto_id`, `cliente_id`, `fecha`) VALUES
(1, 1, 1, '2024-05-20'),
(2, 2, 2, '2024-05-18');


ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`) USING BTREE;


ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
