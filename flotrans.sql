-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2026 a las 06:30:51
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
-- Base de datos: `flotrans`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `registro_id` int(11) DEFAULT NULL,
  `ip_usuario` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id`, `usuario_id`, `accion`, `tabla_afectada`, `registro_id`, `ip_usuario`, `created_at`) VALUES
(1, 2, 'INSERT', 'sesion', 2, '::1', '2026-09-12 17:29:43'),
(2, 3, 'INSERT', 'usuarios', 3, '::1', '2026-10-05 21:48:13'),
(3, 3, 'INSERT', 'sesion', 3, '::1', '2026-10-05 21:48:22'),
(4, 3, 'INSERT', 'sesion', 3, '::1', '2026-10-05 21:54:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores`
--

CREATE TABLE `conductores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cedula` varchar(30) NOT NULL,
  `tipo_licencia` varchar(20) NOT NULL,
  `jornada_max_horas` int(11) DEFAULT 8,
  `descanso_min_horas` int(11) DEFAULT 1,
  `estado` varchar(50) DEFAULT 'Disponible',
  `fecha_ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conductores`
--

INSERT INTO `conductores` (`id`, `nombre`, `cedula`, `tipo_licencia`, `jornada_max_horas`, `descanso_min_horas`, `estado`, `fecha_ingreso`) VALUES
(1, 'brigitte lopez torres', '1214714857', 'A1', 8, 1, 'Disponible', '2026-09-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `codigo`) VALUES
(1, 'CONT-001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `franja_horaria` varchar(100) DEFAULT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `dias_semana` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(30) DEFAULT 'activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id`, `contrato_id`, `nombre`, `descripcion`, `franja_horaria`, `hora_inicio`, `hora_fin`, `dias_semana`, `tipo`, `estado`) VALUES
(1, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(2, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(3, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(4, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(5, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(6, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(7, 1, 'ruta al sol', NULL, NULL, '23:20:00', '00:20:00', 'Todos', 'Urbano', 'programada'),
(8, 1, 'ruta al sol', NULL, NULL, '21:23:00', '00:23:00', 'Todos', 'Urbano', 'programada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `contrasena_hash` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(50) NOT NULL DEFAULT 'operador',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `ultimo_acceso` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena_hash`, `password`, `rol`, `activo`, `ultimo_acceso`, `created_at`) VALUES
(1, 'Prueba', 'prueba@prueba.com', '$2y$10$M6l19vsp9towvrsJYl1gtO3sePsf4YDKZy.fCohKSuoeuncDUbcHC', '', 'operador', 1, '2026-09-12 17:22:10', '2026-09-12 22:21:23'),
(2, 'Prueba', 'prueba2@prueba.com', '$2y$10$kEJutrj/T0IbDfH5eQosXO9vMHDgo1rz27Xn00S2q6Yp0.pho7a1C', '', 'operador', 1, '2026-09-12 17:29:43', '2026-09-12 22:23:47'),
(3, 'brigitte lopez torres', 'brigittelopeztorres@gmail.com', '$2y$10$92f1J1YaL.p.WauCPRh0tewIqTzD2AVcRJqE8as1Sxu/5TlgzH7Ze', '', 'administrador', 1, '2026-10-05 21:54:45', '2026-10-06 02:48:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `capacidad_pasajeros` int(11) DEFAULT 0,
  `tipo` varchar(50) NOT NULL,
  `estado` varchar(50) DEFAULT 'activo',
  `kilometraje` int(11) DEFAULT 0,
  `fecha_soat` date DEFAULT NULL,
  `fecha_tecnomecanica` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `marca`, `modelo`, `anio`, `capacidad_pasajeros`, `tipo`, `estado`, `kilometraje`, `fecha_soat`, `fecha_tecnomecanica`, `created_at`, `updated_at`) VALUES
(1, 'RLX 43E', 'Mercedes', 'tvs', 2026, 50, 'microbus', 'activo', 2500, '2031-01-11', '2030-09-24', '2026-09-12 22:34:55', '2026-09-12 22:34:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rutas_contratos` (`contrato_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `conductores`
--
ALTER TABLE `conductores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `fk_rutas_contratos` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
