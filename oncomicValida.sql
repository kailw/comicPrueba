-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2019 a las 15:33:33
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oncomic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`) VALUES
(1, 'Aloon Moore'),
(2, 'Grant Morrison'),
(3, 'Will Eisne'),
(4, 'Stan Lee'),
(5, 'Robin Wood');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorespecialidad`
--

CREATE TABLE `autorespecialidad` (
  `id` int(11) NOT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_comic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autorespecialidad`
--

INSERT INTO `autorespecialidad` (`id`, `id_especialidad`, `id_autor`, `id_comic`) VALUES
(12, 3, 5, NULL),
(13, 3, 1, NULL),
(31, 3, 1, NULL),
(32, 2, 4, NULL),
(33, 1, 5, NULL),
(36, 3, 2, NULL),
(37, 2, 5, NULL),
(40, 3, 2, NULL),
(41, 2, 2, NULL),
(42, 1, 5, NULL),
(84, 3, 2, 18),
(85, 2, 4, 18),
(86, 2, 5, 18),
(87, 1, 4, 18),
(114, 2, 2, 4),
(115, 2, 5, 4),
(116, 2, 1, 19),
(117, 1, 3, 19),
(118, 2, 2, 19),
(119, 3, 4, 19),
(120, 1, 3, 3),
(121, 3, 1, 3),
(122, 3, 4, 3),
(127, 2, 1, 2),
(128, 3, 3, 2),
(137, 3, 1, 20),
(138, 2, 2, 20),
(139, 2, 1, 20),
(140, 1, 5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coleccion`
--

CREATE TABLE `coleccion` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `coleccion`
--

INSERT INTO `coleccion` (`id`, `desc`) VALUES
(1, 'COLECCIÓN DE BATMAN'),
(2, 'COLECCIÓN IRON MAN'),
(3, 'COLECCIÓN DE FLASH'),
(4, 'COLECCIÓN DE DAREEVIL'),
(5, 'COLECCIÓN DE AQUAMAN'),
(7, 'COLECCIÓN PRUEBA'),
(8, 'COLECCIÓN HULK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comic`
--

CREATE TABLE `comic` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `fechapublicacion` datetime NOT NULL,
  `pagina` int(11) NOT NULL,
  `color` tinyint(1) NOT NULL,
  `existencias` int(11) NOT NULL,
  `precio` float NOT NULL,
  `descuento` float DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `destacado` tinyint(1) DEFAULT NULL,
  `id_coleccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comic`
--

INSERT INTO `comic` (`id`, `titulo`, `desc`, `isbn`, `fechapublicacion`, `pagina`, `color`, `existencias`, `precio`, `descuento`, `foto`, `destacado`, `id_coleccion`) VALUES
(2, 'HULK Version 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '1235545455-G', '2019-04-16 00:00:00', 14, 0, 14, 6.5, 15, 'destacado1.jpg', 1, 8),
(3, 'DARE EVIL Version 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '123456789-T', '2019-01-25 00:00:00', 23, 0, 48, 2, 0, 'destacado2.jpg', 0, NULL),
(4, 'FLASH Version 1', 'El hombre que corre mucho', '0316256404', '2019-01-23 00:00:00', 12, 1, 4, 14.3, 0, 'destacado3.jpg', 1, 3),
(18, 'Prueba', 'ayuda !!!aa', '123456-78RT', '2019-03-07 00:00:00', 15, 1, 29, 2.5, 0, 'destacado7.jpg', 1, NULL),
(19, 'Batman version 3', 'es muy malote', '1405199777-T', '2019-01-05 00:00:00', 23, 1, 48, 2.5, 0, 'batmanversion1.png', 1, NULL),
(20, 'Batman Version 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '123456-T7/7', '2019-02-17 00:00:00', 15, 0, 47, 3.5, 0, 'batmananocero1.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comiceditorial`
--

CREATE TABLE `comiceditorial` (
  `id` int(11) NOT NULL,
  `id_editorial` int(11) DEFAULT NULL,
  `id_comic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comiceditorial`
--

INSERT INTO `comiceditorial` (`id`, `id_editorial`, `id_comic`) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 1, 2),
(4, 1, 4),
(5, 1, NULL),
(6, 2, NULL),
(7, 2, NULL),
(8, 1, NULL),
(9, 2, NULL),
(10, 1, 18),
(11, 2, 19),
(12, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comicgenero`
--

CREATE TABLE `comicgenero` (
  `id` int(11) NOT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `id_comic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comicgenero`
--

INSERT INTO `comicgenero` (`id`, `id_genero`, `id_comic`) VALUES
(1, 1, 2),
(2, 4, 2),
(3, 5, 2),
(4, 2, 4),
(5, 4, 4),
(6, 10, 3),
(7, 2, 3),
(24, 13, NULL),
(34, 1, NULL),
(35, 10, NULL),
(36, 11, NULL),
(37, 13, NULL),
(38, 10, NULL),
(39, 7, NULL),
(40, 13, NULL),
(41, 7, NULL),
(42, 13, NULL),
(43, 13, NULL),
(44, 13, NULL),
(45, 9, NULL),
(46, 13, NULL),
(47, 7, NULL),
(48, 10, NULL),
(49, 5, NULL),
(50, 10, NULL),
(51, 13, NULL),
(52, 2, NULL),
(53, 7, NULL),
(54, 6, NULL),
(55, 7, NULL),
(56, 7, NULL),
(57, 7, NULL),
(58, 7, NULL),
(59, 13, NULL),
(60, 10, NULL),
(61, 6, NULL),
(62, 7, NULL),
(63, 10, NULL),
(64, 13, NULL),
(65, 2, NULL),
(66, 2, NULL),
(67, 5, NULL),
(68, 10, NULL),
(69, 13, NULL),
(70, 6, NULL),
(71, 7, NULL),
(72, 7, NULL),
(73, 10, NULL),
(74, 13, NULL),
(75, 7, NULL),
(76, 5, NULL),
(77, 2, NULL),
(78, 13, NULL),
(79, 7, 18),
(80, 9, 18),
(81, 11, 18),
(82, 12, 18),
(83, 13, 19),
(84, 7, 19),
(85, 6, 20),
(86, 10, 20),
(87, 7, 20),
(88, 13, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comicidioma`
--

CREATE TABLE `comicidioma` (
  `id` int(11) NOT NULL,
  `id_comic` int(11) DEFAULT NULL,
  `id_idioma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comicidioma`
--

INSERT INTO `comicidioma` (`id`, `id_comic`, `id_idioma`) VALUES
(4, 3, 2),
(8, NULL, 2),
(9, NULL, 3),
(10, NULL, 3),
(11, NULL, 1),
(12, NULL, 3),
(13, NULL, 1),
(14, NULL, 2),
(15, NULL, 3),
(19, NULL, 3),
(20, NULL, 1),
(21, NULL, 2),
(22, NULL, 1),
(23, NULL, 3),
(32, NULL, 1),
(33, NULL, 3),
(36, NULL, 2),
(37, NULL, 1),
(38, NULL, 3),
(51, 18, 3),
(61, 4, 3),
(62, 19, 1),
(63, 19, 2),
(64, 19, 3),
(67, 2, 1),
(68, 2, 2),
(70, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`id`, `desc`) VALUES
(1, 'MARVEL'),
(2, 'DCOMICS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `desc`) VALUES
(1, 'DIBUJANTE'),
(2, 'GUIONISTA'),
(3, 'ESCRITOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `iva`, `id_usuario`) VALUES
(35, '2019-02-16 00:00:00', 21, 10),
(44, '2019-02-16 00:00:00', 1, 1),
(48, '2019-02-18 00:00:00', 21, 2),
(49, '2019-02-18 00:00:00', 21, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL COMMENT '\n	',
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `desc`) VALUES
(1, 'INFANTIL'),
(2, 'SUPERHEROE'),
(4, 'FANTASÍA Y AVENTURA'),
(5, 'SOBRENATURAL Y PARANORMAL'),
(6, 'DETECTIVESCA'),
(7, 'BELICO'),
(9, 'HISTORICO'),
(10, 'CIENCIA FICCIÓN\r\n'),
(11, 'HUMOR'),
(12, 'TERROR'),
(13, 'AUTOBIOGRÁFICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `id` int(11) NOT NULL,
  `desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`id`, `desc`) VALUES
(1, 'Castellano'),
(2, 'Inglés'),
(3, 'Alemán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id` int(11) NOT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `id_comic` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`id`, `cantidad`, `id_comic`, `id_factura`) VALUES
(1, '25', 2, NULL),
(2, '25', 3, NULL),
(3, '12', 2, NULL),
(18, '1', 3, NULL),
(25, '1', 3, NULL),
(26, '1', 3, NULL),
(39, '1', 4, NULL),
(42, '1', 3, NULL),
(43, '1', 4, NULL),
(44, '11', 3, NULL),
(45, '3', 3, NULL),
(46, '3', 4, NULL),
(47, '3', 3, NULL),
(49, '5', 2, NULL),
(50, '1', 3, 35),
(51, '1', 4, NULL),
(52, '1', 3, NULL),
(53, '6', NULL, NULL),
(54, '2', 3, NULL),
(55, '1', 2, NULL),
(56, '1', 3, NULL),
(57, '5', 2, NULL),
(58, '8', 3, NULL),
(59, '1', 18, NULL),
(60, '1', 19, NULL),
(61, '2', 20, NULL),
(62, '1', 3, 48),
(63, '1', 19, 48),
(64, '1', 20, 48),
(65, '1', 3, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `desc`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ape1` varchar(255) NOT NULL,
  `ape2` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `validacion` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `nombre`, `ape1`, `ape2`, `login`, `pass`, `email`, `id_tipousuario`, `token`, `validacion`) VALUES
(1, '24465169T', 'kevin', 'dominguez', 'sisalima', 'kevin', 'B221D9DBB083A7F33428D7C2A3C3198AE925614D70210E28716CCAA7CD4DDB79', 'kevin@gmail.com', 1, '1df4d5fdadfa5a6s5df4as6d5fas4dfr8r787fr', 1),
(2, '22446540R', 'cliente', 'cliente', 'cliente', 'cliente', 'B221D9DBB083A7F33428D7C2A3C3198AE925614D70210E28716CCAA7CD4DDB79', 'cliente@gmail.com', 2, 'd1f2asd1f2asdf1as2df45asd4f65a4sdf5asdf1', 1),
(9, '14521899T', 'pep', 'pep', 'pepp', 'pepa', 'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', 'kevi14ful@gmail.com', 2, 'K8bvIAcUHyy2VTeDMJuRkEDReuzrSqqdmLuXisriSlFbaFnHCbuU0FwRZp9nNFPKE4TvgyP6SPLSBEfqwaVp3RhmqFfkPEn9k8HXrcvwqjPqMe6qe6z7H4ItBxZsVyrt9oMbDwUdPTA3yZVUh7hiXYZI0wIGNDM0Vlh0jRwUdtt97dbkOPK7gEjT0qrtmZzGVgeYPF8s', 1),
(10, '24465169T', 'kevin', 'dominguez', 'sisalima', 'kailwe', 'b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79', 'kevi14ful@gmail.com', 2, 'Fn20u4F48o0wNALs3cz39OKjKgFITOTvXs273Hudbcl7TaLyDac6Ez33insshGgAlF1dPnUJZJwDjVpfPK8gxXh54jFxriLnOxo3T2on1MlejxESeeO9OzVFlg7fuh3ACvE8XlPC9UpZ4ARXd1C0qBlExEYnruHExQT0R7pDPRzSQdwmno9yf8I2hL7jiu6RslbE7pWx', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `autorespecialidad`
--
ALTER TABLE `autorespecialidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autorespecialidad_especialidad1_idx` (`id_especialidad`),
  ADD KEY `fk_autorespecialidad_autor1_idx` (`id_autor`),
  ADD KEY `fk_autorespecialidad_comic1_idx` (`id_comic`);

--
-- Indices de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comic`
--
ALTER TABLE `comic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ISBN_UNIQUE` (`isbn`),
  ADD KEY `fk_comic_coleccion1_idx` (`id_coleccion`);

--
-- Indices de la tabla `comiceditorial`
--
ALTER TABLE `comiceditorial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comiceditorial_editorial1_idx` (`id_editorial`),
  ADD KEY `fk_comiceditorial_comic1_idx` (`id_comic`);

--
-- Indices de la tabla `comicgenero`
--
ALTER TABLE `comicgenero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comicgenero_genero1_idx` (`id_genero`),
  ADD KEY `fk_comicgenero_comic1_idx` (`id_comic`);

--
-- Indices de la tabla `comicidioma`
--
ALTER TABLE `comicidioma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comicidioma_comic1_idx` (`id_comic`),
  ADD KEY `fk_comicidioma_idioma1_idx` (`id_idioma`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_factura_usuario1_idx` (`id_usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linea_comic1_idx` (`id_comic`),
  ADD KEY `fk_linea_factura1_idx` (`id_factura`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_tipousuario_idx` (`id_tipousuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `autorespecialidad`
--
ALTER TABLE `autorespecialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comic`
--
ALTER TABLE `comic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `comiceditorial`
--
ALTER TABLE `comiceditorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `comicgenero`
--
ALTER TABLE `comicgenero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `comicidioma`
--
ALTER TABLE `comicidioma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '\n	', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autorespecialidad`
--
ALTER TABLE `autorespecialidad`
  ADD CONSTRAINT `fk_autorespecialidad_autor1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_autorespecialidad_comic1` FOREIGN KEY (`id_comic`) REFERENCES `comic` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_autorespecialidad_especialidad1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `comic`
--
ALTER TABLE `comic`
  ADD CONSTRAINT `fk_comic_coleccion1` FOREIGN KEY (`id_coleccion`) REFERENCES `coleccion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `comiceditorial`
--
ALTER TABLE `comiceditorial`
  ADD CONSTRAINT `fk_comiceditorial_comic1` FOREIGN KEY (`id_comic`) REFERENCES `comic` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comiceditorial_editorial1` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `comicgenero`
--
ALTER TABLE `comicgenero`
  ADD CONSTRAINT `fk_comicgenero_comic1` FOREIGN KEY (`id_comic`) REFERENCES `comic` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comicgenero_genero1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `comicidioma`
--
ALTER TABLE `comicidioma`
  ADD CONSTRAINT `fk_comicidioma_comic1` FOREIGN KEY (`id_comic`) REFERENCES `comic` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comicidioma_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `fk_linea_comic1` FOREIGN KEY (`id_comic`) REFERENCES `comic` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_linea_factura1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipousuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tipousuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
