-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2021 a las 13:21:30
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apitest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `placa` varchar(25) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `activo` int(11) NOT NULL,
  `clientes_grupo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `placa`, `fecha_creacion`, `fecha_modificacion`, `activo`, `clientes_grupo_id`) VALUES
(1, '456789', '2021-10-16 00:00:00', '2021-10-16 00:00:00', 1, 1),
(2, '987456', '2021-10-16 00:00:00', '2021-10-16 00:00:00', 1, 1),
(3, '78945612', '2020-12-12 00:00:00', '2020-12-12 00:00:00', 1, 2),
(17, '8888', '2021-10-17 03:07:00', '2021-10-17 05:15:23', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_grupo`
--

CREATE TABLE `clientes_grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `porcentaje` int(3) DEFAULT '0',
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes_grupo`
--

INSERT INTO `clientes_grupo` (`id`, `nombre`, `activo`, `porcentaje`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, 'Pension', 1, 90, '2021-10-16 00:00:00', '2021-10-16 00:00:00'),
(3, 'Normal', 1, 0, '2021-10-16 00:00:00', '2021-10-23 00:00:00'),
(4, 'ElPana', 1, 22, '2021-10-17 03:46:09', '2021-10-17 05:45:20'),
(5, 'Ejele', 1, 22, '2021-10-17 04:31:29', '2021-10-17 05:40:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_estacionamiento`
--

CREATE TABLE `registro_estacionamiento` (
  `id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `clientes_grupo_id` int(11) NOT NULL,
  `registro_entrada` int(1) NOT NULL DEFAULT '1',
  `fecha_entrada` datetime NOT NULL,
  `registro_salida` int(1) DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `cobro` float(12,2) DEFAULT NULL,
  `minutos` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registro_estacionamiento`
--

INSERT INTO `registro_estacionamiento` (`id`, `clientes_id`, `clientes_grupo_id`, `registro_entrada`, `fecha_entrada`, `registro_salida`, `fecha_salida`, `cobro`, `minutos`) VALUES
(1, 1, 1, 1, '2021-10-01 00:00:00', 1, '2021-10-17 09:27:59', 100.00, 23607),
(9, 3, 3, 1, '2021-10-17 07:54:43', 1, '2021-10-17 09:22:24', 20.00, 87);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Indices de la tabla `clientes_grupo`
--
ALTER TABLE `clientes_grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `registro_estacionamiento`
--
ALTER TABLE `registro_estacionamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_id` (`clientes_id`),
  ADD KEY `clientes_grupo_id` (`clientes_grupo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `clientes_grupo`
--
ALTER TABLE `clientes_grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro_estacionamiento`
--
ALTER TABLE `registro_estacionamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registro_estacionamiento`
--
ALTER TABLE `registro_estacionamiento`
  ADD CONSTRAINT `registro_estacionamiento_ibfk_1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `registro_estacionamiento_ibfk_2` FOREIGN KEY (`clientes_grupo_id`) REFERENCES `clientes_grupo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
