-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 11-06-2024 a las 19:26:30
-- Versión del servidor: 11.5.0-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones_turisticas`
--

CREATE TABLE `promociones_turisticas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cupo` int(11) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `promociones_turisticas`
--

INSERT INTO `promociones_turisticas` (`id`, `nombre`, `descripcion`, `destino`, `duracion`, `precio`, `cupo`, `contacto`) VALUES
(1, 'Aventura en el Salar de Uyuni', 'Experimenta la magia del salar de Uyuni con este tour de 3 días lleno de actividades emocionantes.', 'Salar de Uyuni', 3, 350.00, 20, 'info@aventurasbolivia.com'),
(2, 'Explorando el Lago Titicaca', 'Descubre las islas flotantes de los Uros y la mística Isla del Sol en un viaje inolvidable.', 'Lago Titicaca', 2, 250.00, 15, 'reservas@explorabolivia.com'),
(3, 'Aventura en el Parque Nacional Madidi', 'Sumérgete en la selva amazónica boliviana con este trekking de 5 días en el Parque Nacional Madidi.', 'Parque Nacional Madidi', 5, 500.00, 10, 'info@amazoniaaventuras.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_accesos`
--

CREATE TABLE `seg_accesos` (
  `cod_usu` varchar(50) NOT NULL,
  `cod_apl` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_aplicacion`
--

CREATE TABLE `seg_aplicacion` (
  `cod_apl` varchar(100) NOT NULL,
  `cod_apl_sup` varchar(100) DEFAULT NULL,
  `cod_mod` varchar(30) NOT NULL,
  `dsc_apl` varchar(50) NOT NULL,
  `obs_apl` varchar(50) NOT NULL,
  `tpo_apl` varchar(50) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `ayuda` text DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `target_tpo` varchar(20) DEFAULT NULL,
  `hr_ini` time(5) DEFAULT NULL,
  `ht_fin` time(5) DEFAULT NULL,
  `sw_vie` int(11) DEFAULT NULL,
  `sw_sab` int(11) DEFAULT NULL,
  `sw_dom` int(11) DEFAULT NULL,
  `sw_fer` int(11) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `seg_aplicacion`
--

INSERT INTO `seg_aplicacion` (`cod_apl`, `cod_apl_sup`, `cod_mod`, `dsc_apl`, `obs_apl`, `tpo_apl`, `menu`, `ayuda`, `url`, `target_tpo`, `hr_ini`, `ht_fin`, `sw_vie`, `sw_sab`, `sw_dom`, `sw_fer`, `estado`, `usu_cre`, `fh_cre`, `usu_mod`, `fh_mod`) VALUES
('SEGPAGEMODULOBTNCREAR', NULL, 'SEG', 'Crear Nuevo Modulo', 'Crear Nuevo Modulo', 'BUTTON', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULOBTNEDITAR', NULL, 'SEG', 'Editar Modulo', 'Editar Modulo', 'BUTTON', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULOBTNELIMINAR', NULL, 'SEG', 'Eliminar Modulo', 'Eliminar Modulo', 'BUTTON', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULOPAGECREATE', NULL, 'SEG', 'Pagina Crear', 'Pagina Crear', 'PAGE', 'NO', NULL, '/modulo/index.php', '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULOPAGELIST', NULL, 'SEG', 'Lista de Modulos', 'Lsita de Modulos', 'PAGE', 'MENU', NULL, '/modulo/index.php', '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULORPTPDFACTIVOS', NULL, 'SEG', 'Reporte de Modulos Activos', 'Reporte de Modulos Activos', 'REPORTPDF', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULORPTPDFTOTAL', NULL, 'SEG', 'Reporte de Modulos', 'Reporte de Modulos', 'REPORTPDF', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 10:57:47', NULL, NULL),
('SEGPAGEMODULORPTXLSACTIVOS', NULL, 'SEG', 'Reporte de Modulos Activos en Formato XLSX', 'Reporte de Modulos Activos en Formato XLSX', 'REPORTXLS', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 11:05:44', NULL, NULL),
('SEGPAGEMODULORPTXLSTOTAL', NULL, 'SEG', 'Reporte de Modulos', 'Reporte de Modulos', 'REPORTXLS', 'NO', NULL, NULL, '_BLANK', '00:00:00.00000', '23:59:00.00000', 1, 1, 1, 1, 'ACTIVO', 'admin', '2024-04-16 11:05:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_control_usuario`
--

CREATE TABLE `seg_control_usuario` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `cod_usu` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_log_aplicacion`
--

CREATE TABLE `seg_log_aplicacion` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `cod_usu` varchar(50) NOT NULL,
  `cod_apl` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_modulo`
--

CREATE TABLE `seg_modulo` (
  `cod_mod` varchar(30) NOT NULL,
  `dsc_mod` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `seg_modulo`
--

INSERT INTO `seg_modulo` (`cod_mod`, `dsc_mod`, `estado`, `usu_cre`, `fh_cre`, `usu_mod`, `fh_mod`) VALUES
('aa', 'bbbbb', 'ACTIVO', 'ADMIN', '2024-04-26 12:30:58', 'ADmin', '2024-06-11 12:06:21'),
('aa1', 'aa', 'aa', 'Admin', '2024-06-04 15:13:28', NULL, NULL),
('ACT', 'ACTIVOS FIJOS', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('ADM', 'ADMINISTRACION', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('b', 'ghh', 'ACTIVO', 'Admin', '2024-05-16 15:56:36', 'ADmin', '2024-05-16 16:05:39'),
('COM', 'COMPRAS', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('CON', 'CONTABILIDAD', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('CRM', 'GESTION DE CLIENTES', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('CXC', 'CUENTAS POR COBRAR', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('CXP', 'CUENTAS POR PAGAR', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('E-C', 'E-COMMERCE', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('eee', 'eee', 'ee', 'Admin', '2024-06-04 15:16:46', NULL, NULL),
('ERP', 'PLANIFICACION DE RECURSOS EMPRESARIALES', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('f', 'f', 'ACTIVO', 'Admin', '2024-05-17 23:58:15', NULL, NULL),
('fff', 'ff', 'ff', 'Admin', '2024-05-14 16:01:29', NULL, NULL),
('ffff', 'ff', 'ff', 'Admin', '2024-05-14 16:01:57', NULL, NULL),
('g', 'g', 'g', 'Admin', '2024-05-17 23:59:49', NULL, NULL),
('INF', 'INFORMATICA', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('INV', 'INVENTARIO', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('LOG', 'LOGISTICA', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('Lol', 'lol', 'ACTIVO', 'Admin', '2024-05-06 13:22:31', NULL, NULL),
('lol2', 'lol2', 'ACTIVO', 'Admin', '2024-05-06 13:37:48', NULL, NULL),
('loquesea', 'loquesea', 'ACTIVO', 'Admin', '2024-05-09 19:49:00', NULL, NULL),
('MKT', 'MARKETING', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('PRE', 'PRESUPUESTO', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('PRO', 'PRODUCCION', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('PRUEBA', 'PRUEBA', 'ACTIVO', 'ADmin', '2024-04-16 14:06:24', NULL, NULL),
('PRUEBA0', 'PRUEBA0', 'ACTIVO', 'Admin', '2024-04-18 19:37:55', NULL, NULL),
('PRUEBA1', 'PRUEBA0', 'ACTIVO', 'Admin', '2024-04-18 19:49:13', NULL, NULL),
('RRH', 'RECURSOS HUMANOS', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('sd', 'sd', 'ACTIVO', 'Admin', '2024-05-10 09:15:02', NULL, NULL),
('SEG', 'SEG', 'ACTIVO', 'admin', '2024-04-04 17:39:31', 'Admin', '2024-04-16 15:25:49'),
('SER', 'SERVICIOS', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('TEMPORAL', '[value-2]', '[value-3]', 'system', '2024-04-29 19:18:15', '[value-6]', '2024-04-29 19:30:47'),
('TES', 'TESORERIA', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('UAI', 'AUDITORIA INTERNA', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL),
('VEN', 'VENTAS', 'ACTIVO', 'admin', '2024-04-04 17:39:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_perfil`
--

CREATE TABLE `seg_perfil` (
  `cod_prf` varchar(30) NOT NULL,
  `dsc_prf` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_perfil_det`
--

CREATE TABLE `seg_perfil_det` (
  `cod_prf_det` varchar(30) NOT NULL,
  `cod_prf` varchar(30) NOT NULL,
  `cod_apl` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_usuario`
--

CREATE TABLE `seg_usuario` (
  `cod_usu` varchar(50) NOT NULL,
  `psw` varchar(300) NOT NULL,
  `rrhh_cod` varchar(10) DEFAULT NULL,
  `prf_cod` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `sw_session` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `seg_usuario`
--

INSERT INTO `seg_usuario` (`cod_usu`, `psw`, `rrhh_cod`, `prf_cod`, `email`, `sw_session`, `token`, `ip`, `login`, `estado`, `usu_cre`, `fh_cre`, `usu_mod`, `fh_mod`) VALUES
('admin', '9970f16668b0ce09b694293b5164ae2b211fb9a23e9026bb4d0d1aef370f192120dd5f5a8e78c06d57fa036de0975c09b528ea7dc49262aee10c3247e62964fa', NULL, NULL, 'admin@admin.com', NULL, NULL, NULL, NULL, 'ACTIVO', 'admin@admin.com', '2024-05-13 17:27:00', NULL, NULL),
('admin1', '9970f16668b0ce09b694293b5164ae2b211fb9a23e9026bb4d0d1aef370f192120dd5f5a8e78c06d57fa036de0975c09b528ea7dc49262aee10c3247e62964fa', NULL, NULL, 'admin1@admin.com', NULL, NULL, NULL, NULL, 'ACTIVO', 'admin1@admin.com', '2024-05-13 19:40:07', NULL, NULL),
('admin4', '9970f16668b0ce09b694293b5164ae2b211fb9a23e9026bb4d0d1aef370f192120dd5f5a8e78c06d57fa036de0975c09b528ea7dc49262aee10c3247e62964fa', NULL, NULL, 'admin4@admin.com', NULL, NULL, NULL, NULL, 'ACTIVO', 'admin4@admin.com', '2024-05-18 15:02:35', NULL, NULL),
('asd', 'e436d0ebd6dbee8e727e1c6681de1fa4717c508ccb756ce81d9e22576a99d567daff139dc9bfa29caf14a785ed817655d4e8d71de4abac6d01336f037e7ec4f5', NULL, NULL, 'asd@asd.cinma', NULL, NULL, NULL, NULL, 'ACTIVO', 'asd@asd.cinma', '2024-05-16 15:55:30', NULL, NULL),
('pablito', '9970f16668b0ce09b694293b5164ae2b211fb9a23e9026bb4d0d1aef370f192120dd5f5a8e78c06d57fa036de0975c09b528ea7dc49262aee10c3247e62964fa', NULL, NULL, 'pablito@pablito.com', NULL, NULL, NULL, NULL, 'ACTIVO', 'pablito@pablito.com', '2024-05-16 15:33:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_ver_accesos`
--

CREATE TABLE `seg_ver_accesos` (
  `id` bigint(20) NOT NULL,
  `cod_usu` varchar(30) NOT NULL,
  `cod_apl` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_ver_aplicacion`
--

CREATE TABLE `seg_ver_aplicacion` (
  `id` bigint(20) NOT NULL,
  `nro` int(11) DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `cod_apl` varchar(100) NOT NULL,
  `cod_apl_sup` varchar(100) DEFAULT NULL,
  `cod_mod` varchar(30) NOT NULL,
  `dsc_apl` varchar(50) NOT NULL,
  `obs_apl` varchar(50) NOT NULL,
  `tpo_apl` varchar(50) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `ayuda` text DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `target_tpo` varchar(20) DEFAULT NULL,
  `hr_ini` varchar(5) DEFAULT NULL,
  `ht_fin` varchar(5) DEFAULT NULL,
  `sw_vie` int(11) DEFAULT NULL,
  `sw_sab` int(11) DEFAULT NULL,
  `sw_dom` int(11) DEFAULT NULL,
  `sw_fer` int(11) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_ver_modulo`
--

CREATE TABLE `seg_ver_modulo` (
  `id` bigint(20) NOT NULL,
  `cod_mod` varchar(30) NOT NULL,
  `dsc_mod` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usu_cre` varchar(50) NOT NULL,
  `fh_cre` datetime NOT NULL,
  `usu_mod` varchar(50) DEFAULT NULL,
  `fh_mod` datetime DEFAULT NULL,
  `nro` int(11) DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_instalacion_camaras`
--

CREATE TABLE `servicios_instalacion_camaras` (
  `id` int(11) NOT NULL,
  `nombre_servicio` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `numero_camaras` int(11) DEFAULT NULL,
  `tipo_camara` varchar(50) DEFAULT NULL,
  `garantia` int(11) DEFAULT NULL,
  `tiempo_instalacion` varchar(50) DEFAULT NULL,
  `monitoreo_remoto` varchar(10) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios_instalacion_camaras`
--

INSERT INTO `servicios_instalacion_camaras` (`id`, `nombre_servicio`, `descripcion`, `numero_camaras`, `tipo_camara`, `garantia`, `tiempo_instalacion`, `monitoreo_remoto`, `precio`) VALUES
(1, 'pack básico 4 cámaras', 'instalación de 4 cámaras de seguridad con monitoreo remoto opcional. ideal para hogares pequeños y oficinas.', 4, 'domo', 12, '1 día', '1', 500.00),
(2, 'pack estándar 8 cámaras', 'instalación de 8 cámaras de seguridad con monitoreo remoto y almacenamiento en la nube. recomendado para medianas empresas.', 8, 'bala', 24, '2 días', '1', 900.00),
(3, 'pack avanzado 12 cámaras', 'instalación de 12 cámaras de seguridad con monitoreo remoto, almacenamiento en la nube y mantenimiento anual. perfecto para grandes oficinas y almacenes.', 12, 'ptz', 36, '3 días', '1', 1300.00),
(4, 'pack completo 16 cámaras', 'instalación de 16 cámaras de seguridad con monitoreo remoto, almacenamiento en la nube, mantenimiento anual y soporte técnico 24/7. ideal para grandes instalaciones y edificios.', 16, 'infrarroja', 36, '4 días', '1', 1600.00),
(5, 'pack premium 20 cámaras', 'instalación de 20 cámaras de seguridad con todas las características del pack completo y cámaras adicionales en áreas estratégicas. diseñado para grandes complejos y áreas de alta seguridad.', 20, 'domo y ptz', 48, '5 días', '1', 2000.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `promociones_turisticas`
--
ALTER TABLE `promociones_turisticas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seg_accesos`
--
ALTER TABLE `seg_accesos`
  ADD PRIMARY KEY (`cod_usu`,`cod_apl`) USING BTREE,
  ADD KEY `cod_apl` (`cod_apl`) USING BTREE;

--
-- Indices de la tabla `seg_aplicacion`
--
ALTER TABLE `seg_aplicacion`
  ADD PRIMARY KEY (`cod_apl`) USING BTREE,
  ADD KEY `cod_mod` (`cod_mod`) USING BTREE;

--
-- Indices de la tabla `seg_control_usuario`
--
ALTER TABLE `seg_control_usuario`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cod_usu` (`cod_usu`) USING BTREE;

--
-- Indices de la tabla `seg_log_aplicacion`
--
ALTER TABLE `seg_log_aplicacion`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `cod_usu` (`cod_usu`) USING BTREE,
  ADD KEY `cod_apl` (`cod_apl`) USING BTREE;

--
-- Indices de la tabla `seg_modulo`
--
ALTER TABLE `seg_modulo`
  ADD PRIMARY KEY (`cod_mod`) USING BTREE;

--
-- Indices de la tabla `seg_perfil`
--
ALTER TABLE `seg_perfil`
  ADD PRIMARY KEY (`cod_prf`) USING BTREE;

--
-- Indices de la tabla `seg_perfil_det`
--
ALTER TABLE `seg_perfil_det`
  ADD PRIMARY KEY (`cod_prf_det`) USING BTREE,
  ADD KEY `cod_prf` (`cod_prf`) USING BTREE;

--
-- Indices de la tabla `seg_usuario`
--
ALTER TABLE `seg_usuario`
  ADD PRIMARY KEY (`cod_usu`) USING BTREE;

--
-- Indices de la tabla `seg_ver_accesos`
--
ALTER TABLE `seg_ver_accesos`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `seg_ver_aplicacion`
--
ALTER TABLE `seg_ver_aplicacion`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `seg_ver_modulo`
--
ALTER TABLE `seg_ver_modulo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `servicios_instalacion_camaras`
--
ALTER TABLE `servicios_instalacion_camaras`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `promociones_turisticas`
--
ALTER TABLE `promociones_turisticas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seg_control_usuario`
--
ALTER TABLE `seg_control_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seg_log_aplicacion`
--
ALTER TABLE `seg_log_aplicacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seg_ver_accesos`
--
ALTER TABLE `seg_ver_accesos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seg_ver_aplicacion`
--
ALTER TABLE `seg_ver_aplicacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seg_ver_modulo`
--
ALTER TABLE `seg_ver_modulo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios_instalacion_camaras`
--
ALTER TABLE `servicios_instalacion_camaras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seg_accesos`
--
ALTER TABLE `seg_accesos`
  ADD CONSTRAINT `seg_accesos_ibfk_1` FOREIGN KEY (`cod_usu`) REFERENCES `seg_usuario` (`cod_usu`),
  ADD CONSTRAINT `seg_accesos_ibfk_2` FOREIGN KEY (`cod_apl`) REFERENCES `seg_aplicacion` (`cod_apl`);

--
-- Filtros para la tabla `seg_aplicacion`
--
ALTER TABLE `seg_aplicacion`
  ADD CONSTRAINT `seg_aplicacion_ibfk_1` FOREIGN KEY (`cod_mod`) REFERENCES `seg_modulo` (`cod_mod`);

--
-- Filtros para la tabla `seg_control_usuario`
--
ALTER TABLE `seg_control_usuario`
  ADD CONSTRAINT `seg_control_usuario_ibfk_1` FOREIGN KEY (`cod_usu`) REFERENCES `seg_usuario` (`cod_usu`);

--
-- Filtros para la tabla `seg_log_aplicacion`
--
ALTER TABLE `seg_log_aplicacion`
  ADD CONSTRAINT `seg_log_aplicacion_ibfk_1` FOREIGN KEY (`cod_usu`) REFERENCES `seg_usuario` (`cod_usu`),
  ADD CONSTRAINT `seg_log_aplicacion_ibfk_2` FOREIGN KEY (`cod_apl`) REFERENCES `seg_aplicacion` (`cod_apl`);

--
-- Filtros para la tabla `seg_perfil_det`
--
ALTER TABLE `seg_perfil_det`
  ADD CONSTRAINT `seg_perfil_det_ibfk_1` FOREIGN KEY (`cod_prf`) REFERENCES `seg_perfil` (`cod_prf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
