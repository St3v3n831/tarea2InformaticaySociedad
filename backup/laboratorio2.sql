-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-09-2025 a las 18:24:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laboratorio2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbadministrador`
--

CREATE TABLE `tbadministrador` (
  `tbadministradorid` int(11) NOT NULL,
  `tbadministradoremail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tbadministradornombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tbadministradorestadocuenta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbadministrador`
--

INSERT INTO `tbadministrador` (`tbadministradorid`, `tbadministradoremail`, `tbadministradornombre`, `tbadministradorestadocuenta`) VALUES
(1, 'admin@gmail.com', 'Admin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbservicio`
--

CREATE TABLE `tbservicio` (
  `tbservicioid` int(11) NOT NULL,
  `tbserviciocodigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tbservicionombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tbserviciodescripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tbservicioestado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbservicio`
--

INSERT INTO `tbservicio` (`tbservicioid`, `tbserviciocodigo`, `tbservicionombre`, `tbserviciodescripcion`, `tbservicioestado`) VALUES
(1, 'ADM-3030', 'Transporte', 'Uber', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbsesion`
--

CREATE TABLE `tbsesion` (
  `tbsesionid` int(11) DEFAULT NULL,
  `tbsesionrol` enum('ADMIN','PRODUCTOR') NOT NULL,
  `tbsesionproductorid` int(11) DEFAULT NULL,
  `tbsesionadministradorid` int(11) DEFAULT NULL,
  `tbsesionusuarionombre` varchar(255) NOT NULL,
  `tbsesionusuariocontrasenia` varchar(300) NOT NULL,
  `tbsesionusuarioestado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbsesion`
--

INSERT INTO `tbsesion` (`tbsesionid`, `tbsesionrol`, `tbsesionproductorid`, `tbsesionadministradorid`, `tbsesionusuarionombre`, `tbsesionusuariocontrasenia`, `tbsesionusuarioestado`) VALUES
(1, 'ADMIN', NULL, 1, 'admin@gmail.com', '$2y$10$I1Vs3gYfln9XP0JDtaMZB.OV5qU1FX9Cx/T4Syw2LsJuOBeQB42/2', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbservicio`
--
ALTER TABLE `tbservicio`
  ADD PRIMARY KEY (`tbservicioid`);

--
-- Indices de la tabla `tbsesion`
--
ALTER TABLE `tbsesion`
  ADD UNIQUE KEY `tbsesionusuarionombre` (`tbsesionusuarionombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
