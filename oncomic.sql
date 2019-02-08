-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-02-2019 a las 11:45:21
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.1.21

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
(1, 1, 1, 2),
(2, 3, 4, 3),
(3, 3, 3, 2),
(4, 1, 3, 3),
(5, 2, 5, 4);

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
(1, 'BATMAN SLAIN'),
(2, 'IRON MAN TECH'),
(3, 'FLASH !!');

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
(2, 'Batman', 'Un tipo con un disfraz muy malo', '14545646454561-T', '2019-01-18 00:00:12', 14, 1, 25, 6, 20, 'default.svg', 1, 1),
(3, 'IRON MAN', 'Un tipo con traje molon', '123456789-T', '2019-01-25 00:03:00', 23, 0, 40, 2, 0, 'default.svg', 0, 2),
(4, 'FLASH', 'El hombre que corre mucho', '0316256404', '2019-02-16 00:00:00', 12, 1, 20, 14.3, 0, 'default.svg', 1, 3);

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
(4, 2, 4);

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
(7, 2, 3);

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
(1, 2, 1),
(2, 2, 2),
(3, 4, 3),
(4, 3, 2);

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
(1, '2019-01-04 00:00:00', 21, 1),
(2, '2019-02-01 00:00:00', 21, NULL);

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
(1, '25', 2, 1),
(2, '25', 3, 1),
(3, '12', 2, 1),
(4, '12', 3, 2);

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
(2, '22446540R', 'cliente', 'cliente', 'cliente', 'cliente', 'B221D9DBB083A7F33428D7C2A3C3198AE925614D70210E28716CCAA7CD4DDB79', 'cliente@gmail.com', 2, 'd1f2asd1f2asdf1as2df45asd4f65a4sdf5asdf1', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comic`
--
ALTER TABLE `comic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comiceditorial`
--
ALTER TABLE `comiceditorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comicgenero`
--
ALTER TABLE `comicgenero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `comicidioma`
--
ALTER TABLE `comicidioma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
