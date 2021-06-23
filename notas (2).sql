-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2021 a las 23:18:06
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(100) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(1, 'DEPORTE'),
(2, 'TRABAJO'),
(3, 'COMPRAS'),
(4, 'VARIOS'),
(5, 'ESTUDIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_notas`
--

CREATE TABLE `categorias_notas` (
  `id` int(100) NOT NULL,
  `id_categorias` int(100) NOT NULL,
  `id_notas` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias_notas`
--

INSERT INTO `categorias_notas` (`id`, `id_categorias`, `id_notas`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 2),
(4, 3, 1),
(5, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(100) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `estado`) VALUES
(1, 'CREADO'),
(2, 'MODIFICADO'),
(3, 'BORRADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `id_estado` int(100) NOT NULL,
  `create_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `titulo`, `id_estado`, `create_at`, `updated_at`, `descripcion`) VALUES
(1, 'HAY QUE COMPRAR', 1, '0000-00-00', '0000-00-00', 'comprar 1 huevo'),
(2, 'TAREA', 3, '2021-05-05', '2021-05-06', 'hacer la tarea'),
(3, 'TRABAJO', 2, '2021-06-05', '2021-06-06', 'ir a trabajar'),
(4, 'TAREA2', 3, '2021-05-05', '2021-05-06', 'hacer la tarea'),
(5, 'TRABAJO2', 3, '2021-01-05', '2021-02-06', 'hacer la tarea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_usuarios`
--

CREATE TABLE `notas_usuarios` (
  `id` int(100) NOT NULL,
  `id_usuario` int(100) NOT NULL,
  `id_nota` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas_usuarios`
--

INSERT INTO `notas_usuarios` (`id`, `id_usuario`, `id_nota`) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 4, 4),
(4, 1, 3),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`) VALUES
(1, 'nicolas', 'nicomar80@gmail.com'),
(2, 'CINTI', 'cinti@gmail.com'),
(3, 'pepe', 'pepe@gmail.com'),
(4, 'jose', 'jose@gmail.com'),
(5, 'martin', 'martin@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorias` (`id_categorias`),
  ADD KEY `id_notas` (`id_notas`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas_usuarios`
--
ALTER TABLE `notas_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notas_usuarios` (`id_nota`),
  ADD KEY `usuario_notas` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `notas_usuarios`
--
ALTER TABLE `notas_usuarios`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias_notas`
--
ALTER TABLE `categorias_notas`
  ADD CONSTRAINT `categorias_notas_ibfk_1` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `categorias_notas_ibfk_2` FOREIGN KEY (`id_notas`) REFERENCES `notas` (`id`);

--
-- Filtros para la tabla `notas_usuarios`
--
ALTER TABLE `notas_usuarios`
  ADD CONSTRAINT `notas_usuarios` FOREIGN KEY (`id_nota`) REFERENCES `notas` (`id`),
  ADD CONSTRAINT `usuario_notas` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
