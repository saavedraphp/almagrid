-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-11-2022 a las 12:09:33
-- Versión del servidor: 5.6.51-cll-lve
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `almagri`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actas`
--

CREATE TABLE `actas` (
  `acta_id` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  `tipo_docu_id` int(11) NOT NULL COMMENT '- Guia\n- Factura',
  `tipo_movimiento_codigo` char(11) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '- alamacenamiento\n- Picking\n',
  `acta_encargado_id` int(11) DEFAULT NULL,
  `acta_supervisor_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL,
  `acta_sub_cliente` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `acta_numero_ingr_sali` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `acta_costo` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `acta_fecha_ini` datetime DEFAULT NULL,
  `acta_fecha_fin` datetime DEFAULT NULL,
  `acta_comentario` longtext CHARACTER SET utf8mb4,
  `estado_asignacion` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='																			';

--
-- Volcado de datos para la tabla `actas`
--

INSERT INTO `actas` (`acta_id`, `empr_id`, `tipo_docu_id`, `tipo_movimiento_codigo`, `acta_encargado_id`, `acta_supervisor_id`, `contrato_id`, `acta_sub_cliente`, `acta_numero_ingr_sali`, `acta_costo`, `acta_fecha_ini`, `acta_fecha_fin`, `acta_comentario`, `estado_asignacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 19, 1, 'INGRESO', NULL, NULL, NULL, 'Luis Saavedra', '40221837', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Ingreso	Accion\r\n3	Cámara web Radioshack con luz led	0	10	\r\n2	Mouse pad ergonómico Teraware	0	8	\r\n1	Notebook Lenovo Thinkpad L15, 15.6\"	0	6', 'REALIZADO', '2022-06-22 21:24:55', '2022-06-27 21:30:10', '2022-06-27 21:30:10'),
(2, 19, 1, 'INGRESO', NULL, NULL, NULL, 'Veronica', '200023', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Ingreso	Accion\r\n3	Cámara web Radioshack con luz led	10	15', 'REALIZADO', '2022-06-22 21:26:03', '2022-06-27 21:30:08', '2022-06-27 21:30:08'),
(3, 19, 1, 'DESPACHO', NULL, NULL, NULL, 'Rocio Saavedra', '54227813', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Salida	Accion\r\n3	Cámara web Radioshack con luz led	25	5	\r\n2	Mouse pad ergonómico Teraware	8	3', NULL, '2022-06-22 23:52:06', '2022-06-27 21:45:36', '2022-06-27 21:45:36'),
(4, 19, 1, 'INGRESO', NULL, NULL, NULL, 'Luis', '12345678', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-06-24 23:21:45', '2022-06-27 21:30:07', '2022-06-27 21:30:07'),
(5, 19, 1, 'DESPACHO', NULL, NULL, NULL, 'Luis', '12345678', NULL, NULL, NULL, NULL, NULL, '2022-06-24 23:23:58', '2022-06-27 21:45:34', '2022-06-27 21:45:34'),
(6, 19, 1, 'INGRESO', NULL, NULL, NULL, 'Rocio Saavedra', '40221837', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Ingreso	Accion\r\n3	Cámara web Radioshack con luz led	17	5	\r\n2	Mouse pad ergonómico Teraware	7	4', 'PENDIENTE', '2022-06-24 23:52:54', '2022-06-27 21:30:03', '2022-06-27 21:30:03'),
(7, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-06-27 17:07:50', '2022-06-27 17:21:55', '2022-06-27 17:21:55'),
(8, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, 'STOCK AL 27 DE JUNIO DEL 2022', 'REALIZADO', '2022-06-27 21:42:52', '2022-08-09 18:36:38', '2022-08-09 18:36:38'),
(9, 21, 1, 'DESPACHO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, NULL, '2022-06-27 21:51:15', '2022-08-11 23:42:40', '2022-08-11 23:42:40'),
(10, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-06-27 21:52:33', '2022-08-09 18:36:34', '2022-08-09 18:36:34'),
(11, 22, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(12, 24, 1, 'INGRESO', NULL, NULL, NULL, 'Luis Saavedra', '40221837', NULL, NULL, NULL, '95	Monomero 15ml modi	0	2	101', 'REALIZADO', '2022-07-14 16:40:08', '2022-08-09 18:36:29', '2022-08-09 18:36:29'),
(13, 24, 1, 'DESPACHO', NULL, NULL, NULL, 'Rocio Saavedra', NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-14 16:59:14', '2022-08-09 18:36:44', '2022-08-09 18:36:44'),
(14, 24, 1, 'INGRESO', NULL, NULL, NULL, 'Luis Saavedra', '54227813', NULL, NULL, NULL, '95	Monomero 15ml modi	1	2	102', 'REALIZADO', '2022-07-14 22:03:35', '2022-08-09 18:36:25', '2022-08-09 18:36:25'),
(15, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-12 00:28:46', '2022-08-12 00:28:46', NULL),
(16, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-12 00:35:21', '2022-08-12 00:35:21', NULL),
(17, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-15 17:49:56', '2022-08-15 17:49:56', NULL),
(18, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-15 17:52:03', '2022-08-15 17:52:03', NULL),
(19, 21, 1, 'DESPACHO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, NULL, '2022-08-15 17:53:12', '2022-08-15 17:53:12', NULL),
(20, 21, 1, 'DESPACHO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, NULL, '2022-08-17 17:10:59', '2022-08-17 17:10:59', NULL),
(21, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-17 22:47:17', '2022-08-17 22:47:17', NULL),
(22, 27, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-18 18:41:21', '2022-08-18 23:47:55', '2022-08-18 23:47:55'),
(23, 27, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, 'TWNNPR28COA	FLAT COUPE PLATE 28CM	CORAL TIENE DOS POSICIONES B-104-106', 'REALIZADO', '2022-08-19 20:37:33', '2022-08-19 20:37:33', NULL),
(24, 21, 1, 'DESPACHO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, NULL, '2022-08-20 01:25:14', '2022-08-20 01:25:14', NULL),
(25, 21, 1, 'DESPACHO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, NULL, '2022-08-20 01:25:33', '2022-08-20 01:25:33', NULL),
(26, 21, 1, 'INGRESO', NULL, NULL, NULL, 'Frank Bautista', '72934473', NULL, NULL, NULL, NULL, 'REALIZADO', '2022-08-20 01:26:52', '2022-08-20 01:26:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casillas_empresas`
--

CREATE TABLE `casillas_empresas` (
  `id` int(11) NOT NULL,
  `rc_id` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `casillas_empresas`
--

INSERT INTO `casillas_empresas` (`id`, `rc_id`, `empr_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 222, 21, '2022-06-25 18:56:42', NULL, NULL),
(9, 223, 21, '2022-06-25 18:56:42', NULL, NULL),
(10, 224, 22, '2022-06-27 10:20:09', NULL, NULL),
(11, 225, 22, '2022-06-27 10:20:09', NULL, NULL),
(12, 233, 22, '2022-06-27 11:05:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(4) NOT NULL,
  `estado_id` int(4) DEFAULT NULL,
  `pais_id` int(4) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `c_cond_id` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos_x_empresa`
--

CREATE TABLE `contactos_x_empresa` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contactos_x_empresa`
--

INSERT INTO `contactos_x_empresa` (`id`, `empresa_id`, `nombre`, `telefono`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 19, 'Veronica', '960203783', 'veronica@gmail.com', '2022-06-22 17:36:20', '2022-06-22 17:36:20', NULL),
(9, 19, 'Jessica', '98542175', 'jemec_1@hotmail.com', '2022-06-22 17:36:56', '2022-06-22 17:36:56', NULL),
(10, 21, 'CESAR ENRIQUE ZEVALLOS HERNANDEZ', '987106454', 'empresas@merqhatuperu.com', '2022-06-25 18:53:41', '2022-06-25 18:53:41', NULL),
(11, 21, 'AMY', '993976557', 'empresas@merqhatuperu.com', '2022-06-25 18:54:19', '2022-06-25 18:54:19', NULL),
(12, 22, 'LUIS EDOARDO BACIGALUPO ROMERO', '947670577', 'lbacigalupo@andana.com.pe', '2022-06-27 22:19:45', '2022-06-27 22:19:45', NULL),
(13, 23, 'ROY RODRIGUEZ', '969421805', 'roy.rodriguez@innova-itc.com', '2022-06-27 23:39:08', '2022-06-27 23:39:08', NULL),
(14, 23, 'SHARON HUAMANI', '960143426', 'asistente.ingenieria@innova-itc.com', '2022-06-27 23:40:01', '2022-06-27 23:40:01', NULL),
(15, 24, 'Raul Alexander', '960203783', 'raulalexander@gmail.com', '2022-07-14 15:57:45', '2022-07-14 16:00:19', NULL),
(16, 25, 'JESUS', '980560812', 'elizabethcanaquiri@gmail.com', '2022-07-14 21:27:38', '2022-07-14 21:27:38', NULL),
(17, 27, 'MARTIN EZEQUIEL LIJTMAER', '922022359', 'martin@volfperu.com', '2022-07-16 18:32:26', '2022-07-16 18:32:26', NULL),
(18, 27, 'Daniela', '926738874', 'compras@volfperu.com', '2022-07-16 18:33:29', '2022-07-16 18:33:29', NULL),
(19, 28, 'Julio', '998363741', 'almacen@itvperu.com', '2022-07-16 18:44:27', '2022-07-16 18:44:27', NULL),
(20, 28, 'Saul', '943292466', 'almacen@itvperu.com', '2022-07-16 18:45:21', '2022-07-16 18:45:21', NULL),
(21, 28, 'Sra. Clara', '999999999', 'contabilidad@itvperu.com', '2022-07-16 18:46:21', '2022-07-16 18:46:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `empr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `empr_nombre` varchar(50) NOT NULL,
  `empr_ruc` char(12) DEFAULT NULL,
  `empr_direccion` varchar(255) DEFAULT NULL,
  `empr_telefono` varchar(45) DEFAULT NULL,
  `empr_celular` varchar(45) DEFAULT NULL,
  `empr_correo` varchar(45) DEFAULT NULL,
  `empr_contacto` varchar(45) DEFAULT NULL,
  `empr_estado` char(4) DEFAULT 'ACTI',
  `empr_ruta_img_reporte` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`empr_id`, `user_id`, `empr_nombre`, `empr_ruc`, `empr_direccion`, `empr_telefono`, `empr_celular`, `empr_correo`, `empr_contacto`, `empr_estado`, `empr_ruta_img_reporte`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 18, 'EMPRESA TES', '20402218372', 'CALLE LOS ZORZALES 160  - SAN ISIDRO', '5612938', '960203783', 'empresates@gmail.com', NULL, 'ACTI', '19-1655923069.pdf', '2022-06-22 17:17:57', '2022-06-27 21:45:47', '2022-06-27 21:45:47'),
(20, 19, 'VOLF PERU SAC', '20607444111', 'Av. de la Aviación 545, Miraflores', '994910135', '960143426', 'martin@volfperu.com', NULL, 'ACTI', NULL, '2022-06-24 23:05:57', '2022-06-24 23:06:11', '2022-06-24 23:06:11'),
(21, 20, 'MERQHATU HORECA SAC', '20608344595', 'AV. ALEJANDRO VELASCO ASTETE NRO. 265 DPTO. 101 URB. MARISCAL RAMON CASTILLA, SAN BORJA', '987106454', '987106454', 'empresas@merqhatuperu.com', NULL, 'ACTI', NULL, '2022-06-25 18:52:11', '2022-06-25 18:54:40', NULL),
(22, 21, 'ANDANA REPRESENTACIONES SAC', '20512238611', 'AV. OSCAR R. BENAVIDES NRO. 380 INT. 601, MIRAFLORES', '947670577', '947670577', 'lbacigalupo@andana.com.pe', NULL, 'ACTI', NULL, '2022-06-27 22:18:43', '2022-07-06 17:43:03', '2022-07-06 17:43:03'),
(23, 22, 'INNOVA INFORMATION TECHNOLOGY & COMMUNICATIONS SAC', '20602207162', 'PJ. MARTIR OLAYA NRO. 129 INT. 1506, MIRAFLORES', '969421805', '969421805', 'roy.rodriguez@innova-itc.com', NULL, 'ACTI', NULL, '2022-06-27 23:38:01', '2022-06-27 23:38:01', NULL),
(24, 23, 'EMPRESA-TEST23', '20390247487', 'mz g2 lote 16, H.A Daniel Alcides Carrión Sector \"C\" Los Olivos', '960203783', '980560812', 'empresa-test22@gmail.com', NULL, 'ACTI', '', '2022-07-13 22:53:55', '2022-08-09 18:35:56', '2022-08-09 18:35:56'),
(27, 26, 'VOLF PERU SAC', '20604045569', 'Av. de la Aviacion Nro. 545, Miraflores', '922022359', '922022359', 'martin@volfperu.com', NULL, 'ACTI', NULL, '2022-07-16 18:30:37', '2022-07-16 18:30:37', NULL),
(28, 27, 'TRADING VENTURES SAC', '20600657641', 'JR. CMDTE JUAN FANNING 297 URB. LA VIÑITA, BARRANCO', '998363741', '998363741', 'almacen@itvperu.com', NULL, 'ACTI', NULL, '2022-07-16 18:43:41', '2022-07-16 18:43:41', NULL),
(29, 28, 'KBM SERVICIOS GENERALES S.A.C', '20522992845', 'AV. GUARDIA PERUANA NRO. 1465 INT. 1 LA CAMPIÑA, CHORRILLOS', '012242084', '999999999', 'prueba@prueba.com', NULL, 'ACTI', NULL, '2022-07-16 18:52:30', '2022-08-09 18:36:06', '2022-08-09 18:36:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(4) NOT NULL,
  `pais_id` int(4) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `esta_reloj` varchar(255) DEFAULT NULL,
  `estado` char(4) NOT NULL DEFAULT 'ACTI'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 NOT NULL,
  `queue` text CHARACTER SET utf8mb4 NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `kard_id` int(11) NOT NULL,
  `acta_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `rc_id` int(11) DEFAULT NULL,
  `tipo_movimiento` varchar(45) DEFAULT NULL,
  `kard_cantidad` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`kard_id`, `acta_id`, `prod_id`, `lote_id`, `rc_id`, `tipo_movimiento`, `kard_cantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 9999999, 5, 'INGRESO', 10, '2022-06-22 21:24:55', '2022-06-27 21:30:10', '2022-06-27 21:30:10'),
(2, 1, 2, 9999999, 11, 'INGRESO', 8, '2022-06-22 21:24:55', '2022-06-27 21:30:10', '2022-06-27 21:30:10'),
(3, 1, 1, 9999999, 6, 'INGRESO', 6, '2022-06-22 21:24:55', '2022-06-27 21:30:10', '2022-06-27 21:30:10'),
(4, 2, 3, 9999999, 6, 'INGRESO', 15, '2022-06-22 21:26:03', '2022-06-27 21:30:08', '2022-06-27 21:30:08'),
(5, 3, 3, 9999999, NULL, 'DESPACHO', 5, '2022-06-22 23:52:06', '2022-06-27 21:45:36', '2022-06-27 21:45:36'),
(6, 3, 2, 9999999, NULL, 'DESPACHO', 3, '2022-06-22 23:52:06', '2022-06-27 21:45:36', '2022-06-27 21:45:36'),
(7, 4, 2, 9999999, 6, 'INGRESO', 5, '2022-06-24 23:21:45', '2022-06-27 21:30:07', '2022-06-27 21:30:07'),
(8, 4, 3, 9999999, 6, 'INGRESO', 2, '2022-06-24 23:21:45', '2022-06-27 21:30:07', '2022-06-27 21:30:07'),
(9, 4, 1, 9999999, 6, 'INGRESO', 4, '2022-06-24 23:21:45', '2022-06-27 21:30:07', '2022-06-27 21:30:07'),
(10, 5, 2, 9999999, NULL, 'DESPACHO', 3, '2022-06-24 23:23:58', '2022-06-27 21:45:34', '2022-06-27 21:45:34'),
(11, 5, 3, 9999999, NULL, 'DESPACHO', 5, '2022-06-24 23:23:58', '2022-06-27 21:45:34', '2022-06-27 21:45:34'),
(12, 5, 1, 9999999, NULL, 'DESPACHO', 2, '2022-06-24 23:23:58', '2022-06-27 21:45:34', '2022-06-27 21:45:34'),
(13, 6, 3, 9999999, NULL, 'INGRESO', 5, '2022-06-24 23:52:54', '2022-06-27 21:30:03', '2022-06-27 21:30:03'),
(14, 6, 2, 9999999, NULL, 'INGRESO', 4, '2022-06-24 23:52:54', '2022-06-27 21:30:03', '2022-06-27 21:30:03'),
(15, 7, 10, 9999999, 222, 'INGRESO', 5, '2022-06-27 17:07:50', '2022-06-27 17:21:55', '2022-06-27 17:21:55'),
(16, 8, 10, 9999999, 222, 'INGRESO', 5, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(17, 8, 15, 9999999, 223, 'INGRESO', 3, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(18, 8, 16, 9999999, 223, 'INGRESO', 1, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(19, 8, 17, 9999999, 223, 'INGRESO', 1, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(20, 8, 27, 9999999, 223, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(21, 8, 32, 9999999, 222, 'INGRESO', 4, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(22, 8, 33, 9999999, 222, 'INGRESO', 3, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(23, 8, 34, 9999999, 222, 'INGRESO', 10, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(24, 8, 35, 9999999, 222, 'INGRESO', 11, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(25, 8, 36, 9999999, 222, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(26, 8, 37, 9999999, 223, 'INGRESO', 1, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(27, 8, 38, 9999999, 223, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(28, 8, 39, 9999999, 223, 'INGRESO', 3, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(29, 8, 45, 9999999, 223, 'INGRESO', 3, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(30, 8, 47, 9999999, 223, 'INGRESO', 18, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(31, 8, 48, 9999999, 223, 'INGRESO', 6, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(32, 8, 51, 9999999, 223, 'INGRESO', 1, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(33, 8, 56, 9999999, 223, 'INGRESO', 1, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(34, 8, 57, 9999999, 223, 'INGRESO', 6, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(35, 8, 58, 9999999, 223, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(36, 8, 59, 9999999, 223, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:37', '2022-08-09 18:36:37'),
(37, 8, 60, 9999999, 223, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:38', '2022-08-09 18:36:38'),
(38, 8, 61, 9999999, 223, 'INGRESO', 2, '2022-06-27 21:42:52', '2022-08-09 18:36:38', '2022-08-09 18:36:38'),
(39, 9, 32, 9999999, NULL, 'DESPACHO', 2, '2022-06-27 21:51:15', '2022-08-11 23:42:40', '2022-08-11 23:42:40'),
(40, 9, 33, 9999999, NULL, 'DESPACHO', 2, '2022-06-27 21:51:15', '2022-08-11 23:42:40', '2022-08-11 23:42:40'),
(41, 9, 34, 9999999, NULL, 'DESPACHO', 4, '2022-06-27 21:51:15', '2022-08-11 23:42:40', '2022-08-11 23:42:40'),
(42, 9, 35, 9999999, NULL, 'DESPACHO', 2, '2022-06-27 21:51:15', '2022-08-11 23:42:40', '2022-08-11 23:42:40'),
(43, 9, 36, 9999999, NULL, 'DESPACHO', 1, '2022-06-27 21:51:15', '2022-08-11 23:42:40', '2022-08-11 23:42:40'),
(44, 10, 12, 9999999, 223, 'INGRESO', 22, '2022-06-27 21:52:33', '2022-08-09 18:36:34', '2022-08-09 18:36:34'),
(45, 11, 68, 9999999, 233, 'INGRESO', 27, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(46, 11, 79, 9999999, 233, 'INGRESO', 6, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(47, 11, 82, 9999999, 233, 'INGRESO', 24, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(48, 11, 85, 9999999, 224, 'INGRESO', 84, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(49, 11, 86, 9999999, 224, 'INGRESO', 24, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(50, 11, 87, 9999999, 224, 'INGRESO', 12, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(51, 11, 88, 9999999, 224, 'INGRESO', 12, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(52, 11, 89, 9999999, 224, 'INGRESO', 204, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(53, 11, 91, 9999999, 225, 'INGRESO', 156, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(54, 11, 94, 9999999, 225, 'INGRESO', 168, '2022-06-27 23:04:58', '2022-07-06 17:42:56', '2022-07-06 17:42:56'),
(55, 12, 95, 9999999, 4, 'INGRESO', 2, '2022-07-14 16:40:08', '2022-08-09 18:36:29', '2022-08-09 18:36:29'),
(56, 13, 95, 9999999, NULL, 'DESPACHO', 1, '2022-07-14 16:59:14', '2022-08-09 18:36:44', '2022-08-09 18:36:44'),
(57, 14, 95, 9999999, 5, 'INGRESO', 2, '2022-07-14 22:03:35', '2022-08-09 18:36:25', '2022-08-09 18:36:25'),
(58, 15, 59, 9999999, 223, 'INGRESO', 2, '2022-08-12 00:28:46', NULL, NULL),
(59, 15, 45, 9999999, 223, 'INGRESO', 3, '2022-08-12 00:28:46', NULL, NULL),
(60, 15, 37, 9999999, 223, 'INGRESO', 1, '2022-08-12 00:28:46', NULL, NULL),
(61, 15, 31, 9999999, 222, 'INGRESO', 7, '2022-08-12 00:28:46', NULL, NULL),
(62, 15, 35, 9999999, 222, 'INGRESO', 8, '2022-08-12 00:28:46', NULL, NULL),
(63, 15, 51, 9999999, 222, 'INGRESO', 1, '2022-08-12 00:28:46', NULL, NULL),
(64, 15, 57, 9999999, 223, 'INGRESO', 6, '2022-08-12 00:28:46', NULL, NULL),
(65, 15, 32, 9999999, 222, 'INGRESO', 3, '2022-08-12 00:28:46', NULL, NULL),
(66, 15, 33, 9999999, 222, 'INGRESO', 3, '2022-08-12 00:28:46', NULL, NULL),
(67, 15, 30, 9999999, 222, 'INGRESO', 10, '2022-08-12 00:28:46', NULL, NULL),
(68, 15, 34, 9999999, 222, 'INGRESO', 12, '2022-08-12 00:28:46', NULL, NULL),
(69, 15, 15, 9999999, 223, 'INGRESO', 3, '2022-08-12 00:28:46', NULL, NULL),
(70, 15, 16, 9999999, 223, 'INGRESO', 1, '2022-08-12 00:28:46', NULL, NULL),
(71, 15, 38, 9999999, 223, 'INGRESO', 2, '2022-08-12 00:28:46', NULL, NULL),
(72, 15, 39, 9999999, 223, 'INGRESO', 3, '2022-08-12 00:28:46', NULL, NULL),
(73, 15, 27, 9999999, 223, 'INGRESO', 2, '2022-08-12 00:28:46', NULL, NULL),
(74, 15, 12, 9999999, 223, 'INGRESO', 16, '2022-08-12 00:28:46', NULL, NULL),
(75, 15, 47, 9999999, 223, 'INGRESO', 15, '2022-08-12 00:28:46', NULL, NULL),
(76, 15, 36, 9999999, 222, 'INGRESO', 3, '2022-08-12 00:28:46', NULL, NULL),
(77, 15, 17, 9999999, 223, 'INGRESO', 1, '2022-08-12 00:28:46', NULL, NULL),
(78, 15, 56, 9999999, 223, 'INGRESO', 1, '2022-08-12 00:28:46', NULL, NULL),
(79, 16, 97, 9999999, 223, 'INGRESO', 4, '2022-08-12 00:35:21', NULL, NULL),
(80, 16, 98, 9999999, 223, 'INGRESO', 2, '2022-08-12 00:35:21', NULL, NULL),
(81, 16, 99, 9999999, 223, 'INGRESO', 9, '2022-08-12 00:35:21', NULL, NULL),
(82, 17, 31, 9999999, 222, 'INGRESO', 15, '2022-08-15 17:49:56', NULL, NULL),
(83, 17, 30, 9999999, 222, 'INGRESO', 15, '2022-08-15 17:49:56', NULL, NULL),
(84, 18, 207, 9999999, 223, 'INGRESO', 5, '2022-08-15 17:52:03', NULL, NULL),
(85, 19, 207, 9999999, NULL, 'DESPACHO', 3, '2022-08-15 17:53:12', NULL, NULL),
(86, 19, 30, 9999999, NULL, 'DESPACHO', 2, '2022-08-15 17:53:12', NULL, NULL),
(87, 19, 32, 9999999, NULL, 'DESPACHO', 1, '2022-08-15 17:53:12', NULL, NULL),
(88, 19, 33, 9999999, NULL, 'DESPACHO', 1, '2022-08-15 17:53:12', NULL, NULL),
(89, 20, 30, 9999999, NULL, 'DESPACHO', 18, '2022-08-17 17:10:59', NULL, NULL),
(90, 20, 31, 9999999, NULL, 'DESPACHO', 20, '2022-08-17 17:10:59', NULL, NULL),
(91, 20, 34, 9999999, NULL, 'DESPACHO', 10, '2022-08-17 17:10:59', NULL, NULL),
(92, 20, 35, 9999999, NULL, 'DESPACHO', 8, '2022-08-17 17:10:59', NULL, NULL),
(93, 20, 47, 9999999, NULL, 'DESPACHO', 11, '2022-08-17 17:10:59', NULL, NULL),
(94, 20, 39, 9999999, NULL, 'DESPACHO', 3, '2022-08-17 17:10:59', NULL, NULL),
(95, 21, 30, 9999999, 222, 'INGRESO', 10, '2022-08-17 22:47:17', NULL, NULL),
(96, 21, 34, 9999999, 222, 'INGRESO', 8, '2022-08-17 22:47:17', NULL, NULL),
(97, 21, 31, 9999999, 222, 'INGRESO', 10, '2022-08-17 22:47:17', NULL, NULL),
(98, 21, 35, 9999999, 222, 'INGRESO', 10, '2022-08-17 22:47:17', NULL, NULL),
(99, 22, 231, 9999999, 158, 'INGRESO', 2, '2022-08-18 18:41:21', '2022-08-18 23:47:55', '2022-08-18 23:47:55'),
(100, 22, 241, 9999999, 158, 'INGRESO', 2, '2022-08-18 18:41:21', '2022-08-18 23:47:55', '2022-08-18 23:47:55'),
(101, 22, 228, 9999999, 158, 'INGRESO', 2, '2022-08-18 18:41:21', '2022-08-18 23:47:55', '2022-08-18 23:47:55'),
(102, 22, 242, 9999999, 158, 'INGRESO', 2, '2022-08-18 18:41:21', '2022-08-18 23:47:55', '2022-08-18 23:47:55'),
(103, 22, 255, 9999999, 159, 'INGRESO', 3, '2022-08-18 18:41:21', '2022-08-18 23:47:55', '2022-08-18 23:47:55'),
(104, 23, 135, 9999999, 84, 'INGRESO', 100, '2022-08-19 20:37:33', NULL, NULL),
(105, 23, 101, 9999999, 82, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(106, 23, 102, 9999999, 82, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(107, 23, 103, 9999999, 82, 'INGRESO', 9, '2022-08-19 20:37:33', NULL, NULL),
(108, 23, 105, 9999999, 79, 'INGRESO', 3, '2022-08-19 20:37:33', NULL, NULL),
(109, 23, 106, 9999999, 82, 'INGRESO', 10, '2022-08-19 20:37:33', NULL, NULL),
(110, 23, 107, 9999999, 80, 'INGRESO', 13, '2022-08-19 20:37:33', NULL, NULL),
(111, 23, 108, 9999999, 80, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(112, 23, 109, 9999999, 80, 'INGRESO', 5, '2022-08-19 20:37:33', NULL, NULL),
(113, 23, 110, 9999999, 80, 'INGRESO', 10, '2022-08-19 20:37:33', NULL, NULL),
(114, 23, 111, 9999999, 80, 'INGRESO', 5, '2022-08-19 20:37:33', NULL, NULL),
(115, 23, 112, 9999999, 82, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(116, 23, 114, 9999999, 80, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(117, 23, 115, 9999999, 80, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(118, 23, 116, 9999999, 80, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(119, 23, 118, 9999999, 80, 'INGRESO', 2, '2022-08-19 20:37:33', NULL, NULL),
(120, 23, 119, 9999999, 80, 'INGRESO', 2, '2022-08-19 20:37:33', NULL, NULL),
(121, 23, 120, 9999999, 81, 'INGRESO', 5, '2022-08-19 20:37:33', NULL, NULL),
(122, 23, 121, 9999999, 81, 'INGRESO', 45, '2022-08-19 20:37:33', NULL, NULL),
(123, 23, 122, 9999999, 81, 'INGRESO', 13, '2022-08-19 20:37:33', NULL, NULL),
(124, 23, 124, 9999999, 81, 'INGRESO', 7, '2022-08-19 20:37:33', NULL, NULL),
(125, 23, 125, 9999999, 83, 'INGRESO', 3, '2022-08-19 20:37:33', NULL, NULL),
(126, 23, 128, 9999999, 83, 'INGRESO', 3, '2022-08-19 20:37:33', NULL, NULL),
(127, 23, 129, 9999999, 83, 'INGRESO', 3, '2022-08-19 20:37:33', NULL, NULL),
(128, 23, 130, 9999999, 83, 'INGRESO', 10, '2022-08-19 20:37:33', NULL, NULL),
(129, 23, 131, 9999999, 83, 'INGRESO', 10, '2022-08-19 20:37:33', NULL, NULL),
(130, 23, 133, 9999999, 83, 'INGRESO', 2, '2022-08-19 20:37:33', NULL, NULL),
(131, 23, 134, 9999999, 82, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(132, 23, 136, 9999999, 84, 'INGRESO', 10, '2022-08-19 20:37:33', NULL, NULL),
(133, 23, 137, 9999999, 84, 'INGRESO', 9, '2022-08-19 20:37:33', NULL, NULL),
(134, 23, 138, 9999999, 84, 'INGRESO', 1, '2022-08-19 20:37:33', NULL, NULL),
(135, 23, 139, 9999999, 84, 'INGRESO', 8, '2022-08-19 20:37:33', NULL, NULL),
(136, 23, 141, 9999999, 83, 'INGRESO', 16, '2022-08-19 20:37:33', NULL, NULL),
(137, 24, 31, 9999999, NULL, 'DESPACHO', 7, '2022-08-20 01:25:14', NULL, NULL),
(138, 24, 30, 9999999, NULL, 'DESPACHO', 6, '2022-08-20 01:25:14', NULL, NULL),
(139, 25, 31, 9999999, NULL, 'DESPACHO', 7, '2022-08-20 01:25:33', NULL, NULL),
(140, 25, 30, 9999999, NULL, 'DESPACHO', 6, '2022-08-20 01:25:33', NULL, NULL),
(141, 26, 47, 9999999, 223, 'INGRESO', 26, '2022-08-20 01:26:52', NULL, NULL),
(142, 26, 97, 9999999, 223, 'INGRESO', 10, '2022-08-20 01:26:52', NULL, NULL),
(143, 26, 39, 9999999, 223, 'INGRESO', 12, '2022-08-20 01:26:52', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `lote_id` int(11) NOT NULL,
  `lote_nombre` varchar(45) DEFAULT NULL,
  `lote_fecha_vencimiento` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lotes`
--

INSERT INTO `lotes` (`lote_id`, `lote_nombre`, `lote_fecha_vencimiento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '9999999', '2030-12-30', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote_x_producto`
--

CREATE TABLE `lote_x_producto` (
  `id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lote_x_producto`
--

INSERT INTO `lote_x_producto` (`id`, `lote_id`, `prod_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 9999999, 3, 0, '2022-06-22 21:24:55', '2022-06-27 21:45:36'),
(2, 9999999, 2, 0, '2022-06-22 21:24:55', '2022-06-27 21:45:36'),
(3, 9999999, 1, 0, '2022-06-22 21:24:55', '2022-06-27 21:45:34'),
(4, 9999999, 10, 0, '2022-06-27 17:07:50', '2022-08-09 18:36:37'),
(5, 9999999, 15, 3, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(6, 9999999, 16, 1, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(7, 9999999, 17, 1, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(8, 9999999, 27, 2, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(9, 9999999, 32, 2, '2022-06-27 21:42:52', '2022-08-15 17:53:12'),
(10, 9999999, 33, 2, '2022-06-27 21:42:52', '2022-08-15 17:53:12'),
(11, 9999999, 34, 10, '2022-06-27 21:42:52', '2022-08-17 22:47:17'),
(12, 9999999, 35, 10, '2022-06-27 21:42:52', '2022-08-17 22:47:17'),
(13, 9999999, 36, 3, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(14, 9999999, 37, 1, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(15, 9999999, 38, 2, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(16, 9999999, 39, 12, '2022-06-27 21:42:52', '2022-08-20 01:26:52'),
(17, 9999999, 45, 3, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(18, 9999999, 47, 30, '2022-06-27 21:42:52', '2022-08-20 01:26:52'),
(19, 9999999, 48, 0, '2022-06-27 21:42:52', '2022-08-09 18:36:37'),
(20, 9999999, 51, 1, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(21, 9999999, 56, 1, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(22, 9999999, 57, 6, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(23, 9999999, 58, 0, '2022-06-27 21:42:52', '2022-08-09 18:36:37'),
(24, 9999999, 59, 2, '2022-06-27 21:42:52', '2022-08-12 00:28:46'),
(25, 9999999, 60, 0, '2022-06-27 21:42:52', '2022-08-09 18:36:37'),
(26, 9999999, 61, 0, '2022-06-27 21:42:52', '2022-08-09 18:36:38'),
(27, 9999999, 12, 16, '2022-06-27 21:52:33', '2022-08-12 00:28:46'),
(28, 9999999, 68, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(29, 9999999, 79, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(30, 9999999, 82, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(31, 9999999, 85, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(32, 9999999, 86, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(33, 9999999, 87, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(34, 9999999, 88, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(35, 9999999, 89, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(36, 9999999, 91, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(37, 9999999, 94, 0, '2022-06-27 23:04:58', '2022-07-06 17:42:56'),
(38, 9999999, 95, 0, '2022-07-14 16:40:08', '2022-08-09 18:36:44'),
(39, 9999999, 31, -2, '2022-08-12 00:28:46', '2022-08-20 01:25:33'),
(40, 9999999, 30, 3, '2022-08-12 00:28:46', '2022-08-20 01:25:33'),
(41, 9999999, 97, 14, '2022-08-12 00:35:21', '2022-08-20 01:26:52'),
(42, 9999999, 98, 2, '2022-08-12 00:35:21', NULL),
(43, 9999999, 99, 9, '2022-08-12 00:35:21', NULL),
(44, 9999999, 207, 2, '2022-08-15 17:52:03', '2022-08-15 17:53:12'),
(45, 9999999, 231, 0, '2022-08-18 18:41:21', '2022-08-18 23:47:55'),
(46, 9999999, 241, 0, '2022-08-18 18:41:21', '2022-08-18 23:47:55'),
(47, 9999999, 228, 0, '2022-08-18 18:41:21', '2022-08-18 23:47:55'),
(48, 9999999, 242, 0, '2022-08-18 18:41:21', '2022-08-18 23:47:55'),
(49, 9999999, 255, 0, '2022-08-18 18:41:21', '2022-08-18 23:47:55'),
(50, 9999999, 135, 100, '2022-08-19 20:37:33', NULL),
(51, 9999999, 101, 8, '2022-08-19 20:37:33', NULL),
(52, 9999999, 102, 8, '2022-08-19 20:37:33', NULL),
(53, 9999999, 103, 9, '2022-08-19 20:37:33', NULL),
(54, 9999999, 105, 3, '2022-08-19 20:37:33', NULL),
(55, 9999999, 106, 10, '2022-08-19 20:37:33', NULL),
(56, 9999999, 107, 13, '2022-08-19 20:37:33', NULL),
(57, 9999999, 108, 8, '2022-08-19 20:37:33', NULL),
(58, 9999999, 109, 5, '2022-08-19 20:37:33', NULL),
(59, 9999999, 110, 10, '2022-08-19 20:37:33', NULL),
(60, 9999999, 111, 5, '2022-08-19 20:37:33', NULL),
(61, 9999999, 112, 8, '2022-08-19 20:37:33', NULL),
(62, 9999999, 114, 8, '2022-08-19 20:37:33', NULL),
(63, 9999999, 115, 8, '2022-08-19 20:37:33', NULL),
(64, 9999999, 116, 8, '2022-08-19 20:37:33', NULL),
(65, 9999999, 118, 2, '2022-08-19 20:37:33', NULL),
(66, 9999999, 119, 2, '2022-08-19 20:37:33', NULL),
(67, 9999999, 120, 5, '2022-08-19 20:37:33', NULL),
(68, 9999999, 121, 45, '2022-08-19 20:37:33', NULL),
(69, 9999999, 122, 13, '2022-08-19 20:37:33', NULL),
(70, 9999999, 124, 7, '2022-08-19 20:37:33', NULL),
(71, 9999999, 125, 3, '2022-08-19 20:37:33', NULL),
(72, 9999999, 128, 3, '2022-08-19 20:37:33', NULL),
(73, 9999999, 129, 3, '2022-08-19 20:37:33', NULL),
(74, 9999999, 130, 10, '2022-08-19 20:37:33', NULL),
(75, 9999999, 131, 10, '2022-08-19 20:37:33', NULL),
(76, 9999999, 133, 2, '2022-08-19 20:37:33', NULL),
(77, 9999999, 134, 8, '2022-08-19 20:37:33', NULL),
(78, 9999999, 136, 10, '2022-08-19 20:37:33', NULL),
(79, 9999999, 137, 9, '2022-08-19 20:37:33', NULL),
(80, 9999999, 138, 1, '2022-08-19 20:37:33', NULL),
(81, 9999999, 139, 8, '2022-08-19 20:37:33', NULL),
(82, 9999999, 141, 16, '2022-08-19 20:37:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(90, '2014_10_12_000000_create_users_table', 4),
(91, '2014_10_12_100000_create_password_resets_table', 4),
(92, '2019_08_19_000000_create_failed_jobs_table', 4),
(95, '2020_05_18_181402_create_tasks_table', 4),
(101, '2022_03_16_140808_create_permission_tables', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 3),
(1, 'App\\User', 29),
(1, 'App\\User', 30),
(2, 'App\\User', 23),
(4, 'App\\User', 18),
(4, 'App\\User', 19),
(4, 'App\\User', 20),
(4, 'App\\User', 21),
(4, 'App\\User', 22),
(4, 'App\\User', 26),
(4, 'App\\User', 27),
(4, 'App\\User', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` int(4) NOT NULL,
  `pais_nombre` varchar(150) NOT NULL,
  `estado_id` int(4) DEFAULT NULL,
  `pais_estado` int(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.productos.index', 'Listado de Productos', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(2, 'admin.productos.create', 'Crear Producto', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(3, 'admin.productos.edit', 'Editar Producto', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(4, 'admin.productos.destroy', 'Eliminar Producto', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(5, 'admin.recepcion.index', 'Listado de Recepciones', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(6, 'admin.recepcion.create', 'Crear Recepcion', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(7, 'admin.recepcion.destroy', 'Eliminar Recepcion', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(8, 'admin.despacho.index', 'Listado de Despachos', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(9, 'admin.despacho.create', 'Crear Despacho', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(10, 'admin.despacho.destroy', 'Eliminar Despacho', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(11, 'admin.clientes.index', 'Listado de Clientes', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(12, 'admin.clientes.create', 'Crear Cliente', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(13, 'admin.clientes.edit', 'Editar Cliente', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(14, 'admin.clientes.destroy', 'Eliminar Cliente', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(15, 'admin.racks.index', 'Listado de Racks', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(16, 'admin.racks.create', 'Crear Rack', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(17, 'admin.racks.edit', 'Editar Rack', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(18, 'admin.racks.destroy', 'Eliminar Rack', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(19, 'admin.casillas.index', 'Listado de Casillas', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(20, 'admin.casillas.create', 'Crear Casilla', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(21, 'admin.casillas.edit', 'Editar Casilla', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(22, 'admin.casillas.destroy', 'Eliminar Casilla', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(23, 'admin.usuarios.index', 'Listado de Usuarios', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(24, 'admin.usuarios.create', 'Crear Usuario', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(25, 'admin.usuarios.edit', 'Editar Usuario', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(26, 'admin.usuarios.destroy', 'Eliminar Usuario', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(27, 'admin.roles.index', 'Listado de Roles', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(28, 'admin.roles.create', 'Crear Rol', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(29, 'admin.roles.edit', 'Editar Rol', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40'),
(30, 'admin.roles.destroy', 'Eliminar Rol', 'web', '2022-07-21 22:27:40', '2022-07-21 22:27:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_x_empresa`
--

CREATE TABLE `productos_x_empresa` (
  `prod_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `empr_id` int(11) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  `prod_nombre` varchar(200) DEFAULT NULL,
  `prod_codigo` char(20) DEFAULT NULL,
  `prod_sku` varchar(45) DEFAULT NULL,
  `prod_ean` varchar(45) DEFAULT NULL,
  `prod_cantidad` smallint(6) DEFAULT NULL,
  `prod_precio` float(10,2) DEFAULT NULL,
  `prod_serie` varchar(45) DEFAULT NULL,
  `prod_lote` char(12) DEFAULT NULL,
  `prod_comentario` longtext,
  `prod_stock` smallint(10) DEFAULT '0',
  `prod_fecha_vencimiento` date DEFAULT NULL,
  `prod_peso` varchar(45) DEFAULT NULL,
  `prod_estado` char(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_x_empresa`
--

INSERT INTO `productos_x_empresa` (`prod_id`, `categoria_id`, `empr_id`, `unidad_id`, `prod_nombre`, `prod_codigo`, `prod_sku`, `prod_ean`, `prod_cantidad`, `prod_precio`, `prod_serie`, `prod_lote`, `prod_comentario`, `prod_stock`, `prod_fecha_vencimiento`, `prod_peso`, `prod_estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 19, 5, 'Notebook Lenovo Thinkpad L15, 15.6\"', NULL, 'LAPTNLT15', NULL, NULL, NULL, NULL, NULL, 'Notebook Lenovo Thinkpad L15, 15.6\" mode COLOR NEGRO', 0, NULL, '2', NULL, '2022-06-22 21:16:37', '2022-06-25 18:59:07', '2022-06-25 18:59:07'),
(2, NULL, 19, 8, 'Mouse pad ergonómico Teraware', NULL, 'CB-MP802-BLK', NULL, NULL, NULL, NULL, NULL, 'Mouse pad ergonómico Teraware COLOR NEGRO', 0, NULL, '1', NULL, '2022-06-22 21:20:16', '2022-06-25 18:59:04', '2022-06-25 18:59:04'),
(3, NULL, 19, 1, 'Cámara web Radioshack con luz led', NULL, '2604780', NULL, NULL, NULL, NULL, NULL, 'Interfaz:USB 2.0\r\nResolución de videos:1080p\r\nTapa de privacidad:No\r\nIncluye clip:Sí\r\nCorrección de iluminación:brillo automático', 0, NULL, '1', NULL, '2022-06-22 21:21:57', '2022-06-25 18:59:00', '2022-06-25 18:59:00'),
(4, NULL, 21, 8, 'Paprika Pimenton', NULL, 'A102001', NULL, NULL, NULL, NULL, NULL, 'BADIA', 0, NULL, '0', NULL, '2022-06-25 18:58:52', '2022-06-27 16:40:06', NULL),
(5, NULL, 21, 8, 'Cebolla en Polvo Onion Powder', NULL, 'A102002', NULL, NULL, NULL, NULL, NULL, 'BADIA', 0, NULL, '0', NULL, '2022-06-25 19:00:09', '2022-06-27 16:40:16', NULL),
(6, NULL, 21, 8, 'Soya Sauce', NULL, 'A102003', NULL, NULL, NULL, NULL, NULL, 'Sofit Oyster', 0, NULL, '710', NULL, '2022-06-27 16:22:20', '2022-06-27 16:40:49', NULL),
(7, NULL, 21, 8, 'Vinagre Tinto', NULL, 'A102004', NULL, NULL, NULL, NULL, NULL, 'LUREN', 0, NULL, '5', NULL, '2022-06-27 16:23:50', '2022-06-27 16:41:05', NULL),
(8, NULL, 21, 8, 'Pickles', NULL, 'A102005', NULL, NULL, NULL, NULL, NULL, 'OLIVOS DEL SUR', 0, NULL, '1.8', NULL, '2022-06-27 16:24:36', '2022-06-27 16:41:23', NULL),
(9, NULL, 21, 2, 'Leche Entera GLORIA', NULL, 'A102006', NULL, NULL, NULL, NULL, NULL, 'GLORIA', 0, NULL, '900', NULL, '2022-06-27 16:26:59', '2022-06-27 17:57:29', NULL),
(10, NULL, 21, 8, 'Gaseosa BIG COLA', NULL, 'A102007', NULL, NULL, NULL, NULL, NULL, 'BIG COLA', 0, NULL, '3.3', NULL, '2022-06-27 16:33:48', '2022-06-27 16:41:47', NULL),
(11, NULL, 21, 2, 'Harina sin Preparar', NULL, 'A102008', NULL, NULL, NULL, NULL, NULL, 'GRANO DE ORO', 0, NULL, '1', NULL, '2022-06-27 16:42:38', '2022-06-27 16:42:38', NULL),
(12, NULL, 21, 2, 'Sal de Mesa EMSAL', NULL, 'A102009', NULL, NULL, NULL, NULL, NULL, 'EMSAL', 16, NULL, '1', NULL, '2022-06-27 17:15:41', '2022-06-27 17:57:50', NULL),
(13, NULL, 21, 2, 'Pimienta Negra', NULL, 'A102010', NULL, NULL, NULL, NULL, NULL, 'TOÑA', 0, NULL, '1', NULL, '2022-06-27 17:20:20', '2022-06-27 17:23:23', NULL),
(14, NULL, 21, 2, 'Tomillo Entero', NULL, 'A102011', NULL, NULL, NULL, NULL, NULL, 'TOÑA', 0, NULL, '500', NULL, '2022-06-27 17:22:51', '2022-06-27 17:22:51', NULL),
(15, NULL, 21, 8, 'Jabón Liquido Rosas', NULL, 'A102012', NULL, NULL, NULL, NULL, NULL, 'MARTELL', 3, NULL, '0', NULL, '2022-06-27 17:24:30', '2022-06-27 17:24:30', NULL),
(16, NULL, 21, 8, 'Jabón Liquido Talco Bebe', NULL, 'A102013', NULL, NULL, NULL, NULL, NULL, 'MARTELL', 1, NULL, '3.78', NULL, '2022-06-27 17:25:07', '2022-06-27 17:25:07', NULL),
(17, NULL, 21, 8, 'Vasos Colores con Tapa NN', NULL, 'A102014', NULL, NULL, NULL, NULL, NULL, 'NN', 1, NULL, '0', NULL, '2022-06-27 17:27:49', '2022-06-27 17:53:18', NULL),
(18, NULL, 21, 1, 'Foil Papel Aluminio', NULL, 'A102015', NULL, NULL, NULL, NULL, NULL, 'U-THIL', 0, NULL, '304.8', NULL, '2022-06-27 17:28:46', '2022-06-27 17:28:46', NULL),
(19, NULL, 21, 2, 'Papel Toalla Interfoliado SUPREMO', NULL, 'A102016', NULL, NULL, NULL, NULL, NULL, 'SUPREMO', 0, NULL, '200', NULL, '2022-06-27 17:40:02', '2022-06-27 17:40:02', NULL),
(20, NULL, 21, 2, 'Bolsas Plástico Roca FELIX', NULL, 'A102017', NULL, NULL, NULL, NULL, NULL, 'FELIX', 0, NULL, '7', NULL, '2022-06-27 17:41:24', '2022-06-27 17:41:24', NULL),
(21, NULL, 21, 3, 'Bolsas Papel Kraft ARO', NULL, 'A102018', NULL, NULL, NULL, NULL, NULL, 'ARO', 0, NULL, '100', NULL, '2022-06-27 17:42:36', '2022-06-27 17:42:36', NULL),
(22, NULL, 21, 3, 'Bolsas Kraft DJANGO', NULL, 'A102019', NULL, NULL, NULL, NULL, NULL, 'DJANGO', 0, NULL, '26', NULL, '2022-06-27 17:43:40', '2022-06-27 17:43:40', NULL),
(23, NULL, 21, 2, 'Chuño TOÑA', NULL, 'A102023', NULL, NULL, NULL, NULL, NULL, 'TOÑA', 0, NULL, '1', NULL, '2022-06-27 17:44:50', '2022-06-27 17:44:50', NULL),
(24, NULL, 21, 6, 'Kétchup CRISOL', NULL, 'A102021', NULL, NULL, NULL, NULL, NULL, 'CRISOL', 0, NULL, '20', NULL, '2022-06-27 17:45:50', '2022-06-27 17:45:50', NULL),
(25, NULL, 21, 6, 'Aceite Fritura Fina CRISOL', NULL, 'A102022', NULL, NULL, NULL, NULL, NULL, 'CRISOL', 0, NULL, '20', NULL, '2022-06-27 17:46:46', '2022-06-27 17:46:46', NULL),
(26, NULL, 21, 8, 'Ajo en Polvo Garlic Powder BADIA', NULL, 'A102024', NULL, NULL, NULL, NULL, NULL, 'BADIA', 0, NULL, '455', NULL, '2022-06-27 17:48:00', '2022-06-27 17:48:00', NULL),
(27, NULL, 21, 8, 'Pimienta Roja Cayenne Pepper BADIA', NULL, 'A102025', NULL, NULL, NULL, NULL, NULL, 'BADIA', 2, NULL, '455', NULL, '2022-06-27 17:48:49', '2022-06-27 17:48:49', NULL),
(28, NULL, 21, 2, 'Azucara Blanca POMALCA', NULL, 'A102026', NULL, NULL, NULL, NULL, NULL, 'POMALCA', 0, NULL, '1', NULL, '2022-06-27 17:50:36', '2022-06-27 17:50:36', NULL),
(29, NULL, 21, 1, 'Mostaza ALPESA', NULL, 'A102027', NULL, NULL, NULL, NULL, NULL, 'ALPESA', 0, NULL, '4', NULL, '2022-06-27 17:52:17', '2022-06-27 17:52:17', NULL),
(30, NULL, 21, 3, 'Inca Kola', NULL, 'A102028', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', 3, NULL, '500', NULL, '2022-06-27 17:59:43', '2022-06-27 18:14:12', NULL),
(31, NULL, 21, 3, 'Coca Cola', NULL, 'A102029', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', -2, NULL, '500', NULL, '2022-06-27 18:00:32', '2022-08-15 17:53:52', NULL),
(32, NULL, 21, 3, 'Fanta Naranja', NULL, 'A102030', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', 2, NULL, '500', NULL, '2022-06-27 18:01:42', '2022-06-27 18:12:10', NULL),
(33, NULL, 21, 3, 'Fanta Roja', NULL, 'A102031', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', 2, NULL, '500', NULL, '2022-06-27 18:10:52', '2022-06-27 18:12:28', NULL),
(34, NULL, 21, 3, 'Inca Kola ZERO', NULL, 'A102032', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', 10, NULL, '500', NULL, '2022-06-27 18:11:29', '2022-06-27 18:15:28', NULL),
(35, NULL, 21, 3, 'Coca Kola ZERO', NULL, 'A102033', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', 10, NULL, '500', NULL, '2022-06-27 18:15:13', '2022-06-27 18:15:13', NULL),
(36, NULL, 21, 3, 'Sprite', NULL, 'A102034', NULL, NULL, NULL, NULL, NULL, 'Comercial Perú', 3, NULL, '500', NULL, '2022-06-27 18:16:53', '2022-06-27 18:16:53', NULL),
(37, NULL, 21, 1, 'CAJA VARIOS', NULL, 'A102035', NULL, NULL, NULL, NULL, NULL, 'Trapos sucios 3, bolsa abierta papel Kraft, Maskingtape, papel interfoliado, Bolsa de Sal Rota', 1, NULL, '0', NULL, '2022-06-27 18:18:35', '2022-06-27 18:18:35', NULL),
(38, NULL, 21, 1, 'Kétchup HEINZ', NULL, 'A102036', NULL, NULL, NULL, NULL, NULL, 'HEINZ', 2, NULL, '5', NULL, '2022-06-27 18:55:53', '2022-06-27 18:55:53', NULL),
(39, NULL, 21, 3, 'Papel Toalla Soft JUMBO', NULL, 'A102037', NULL, NULL, NULL, NULL, NULL, 'JUMBO', 12, NULL, '120', NULL, '2022-06-27 18:56:52', '2022-06-27 18:56:52', NULL),
(40, NULL, 21, 2, 'Comino Molido TOÑA', NULL, 'A102038', NULL, NULL, NULL, NULL, NULL, 'TOÑA', 0, NULL, '1', NULL, '2022-06-27 18:57:27', '2022-06-27 18:57:27', NULL),
(41, NULL, 21, 1, 'Envases Salseros CMG', NULL, 'A102039', NULL, NULL, NULL, NULL, NULL, 'CMG\r\n5000 X 1onza', 0, NULL, '5000', NULL, '2022-06-27 18:58:26', '2022-06-27 18:59:00', NULL),
(42, NULL, 21, 1, 'Tapas Envases Salseros CMG', NULL, 'A102040', NULL, NULL, NULL, NULL, NULL, 'CMG\r\n5000 Uni x 1 onza', 0, NULL, '5000', NULL, '2022-06-27 19:00:23', '2022-06-27 19:00:23', NULL),
(43, NULL, 21, 3, 'Bolsa Kraft ROTAPEL', NULL, 'A102041', NULL, NULL, NULL, NULL, NULL, 'ROTAPEL', 0, NULL, '10', NULL, '2022-06-27 19:02:29', '2022-06-27 19:02:29', NULL),
(44, NULL, 21, 3, 'Bolsa kraft #12 ROTAPEL', NULL, 'A102042', NULL, NULL, NULL, NULL, NULL, 'ROTAPEL', 0, NULL, '500', NULL, '2022-06-27 19:03:13', '2022-06-27 19:03:13', NULL),
(45, NULL, 21, 3, 'Bolsa Kraft 26x40x16 ROTAPEL', NULL, 'A102043', NULL, NULL, NULL, NULL, NULL, 'ROTAPEL', 3, NULL, '26', NULL, '2022-06-27 19:03:59', '2022-06-27 21:44:53', NULL),
(46, NULL, 21, 3, 'Bolsa kraft #20 DJANGO', NULL, 'A102044', NULL, NULL, NULL, NULL, NULL, 'DJANGO', 0, NULL, '0', NULL, '2022-06-27 19:04:44', '2022-06-27 19:04:44', NULL),
(47, NULL, 21, 3, 'Servilleta Blanca SFOLL', NULL, 'A102045', NULL, NULL, NULL, NULL, NULL, 'SOFL', 30, NULL, '6', NULL, '2022-06-27 19:05:37', '2022-06-27 19:05:37', NULL),
(48, NULL, 21, 2, 'Achiote Entero TOÑA', NULL, 'A102046', NULL, NULL, NULL, NULL, NULL, 'TOÑA', 0, NULL, '1', NULL, '2022-06-27 19:06:22', '2022-06-27 19:06:22', NULL),
(49, NULL, 21, 2, 'Orégano Entero TOÑA', NULL, 'A102047', NULL, NULL, NULL, NULL, NULL, 'TOÑA 500GR', 0, NULL, '500', NULL, '2022-06-27 19:07:57', '2022-06-27 19:07:57', NULL),
(50, NULL, 21, 2, 'Azúcar DULFINA', NULL, 'A102048', NULL, NULL, NULL, NULL, NULL, 'DULFINA 1KG', 0, NULL, '1', NULL, '2022-06-27 19:09:01', '2022-06-27 19:09:01', NULL),
(51, NULL, 21, 8, 'Desengrasante Profesional FACIL', NULL, 'A102049', NULL, NULL, NULL, NULL, NULL, 'FACIL 4LITROS', 1, NULL, '4', NULL, '2022-06-27 19:10:58', '2022-06-27 19:10:58', NULL),
(52, NULL, 21, 1, 'Kétchup WALIBI', NULL, 'A102050', NULL, NULL, NULL, NULL, NULL, 'WALIBI', 0, NULL, '0', NULL, '2022-06-27 19:40:32', '2022-06-27 19:40:32', NULL),
(53, NULL, 21, 3, 'Envase Hamburguesa Ct4 ECOESTRATEGIA', NULL, 'A102051', NULL, NULL, NULL, NULL, NULL, 'ECOESTRATEGIA 15X15 24gr', 0, NULL, '24', NULL, '2022-06-27 19:42:28', '2022-06-27 19:44:18', NULL),
(54, NULL, 21, 3, 'Envase menú Ct5 ECOESTRATEGIA', NULL, 'A102052', NULL, NULL, NULL, NULL, NULL, 'ECOESTRATEGIA 23X15 34gr', 0, NULL, '34', NULL, '2022-06-27 19:43:44', '2022-06-27 19:43:44', NULL),
(55, NULL, 21, 3, 'Papel Toalla Interfoliado LIZ', NULL, 'A102053', NULL, NULL, NULL, NULL, NULL, 'LIZ', 0, NULL, '0', NULL, '2022-06-27 19:46:05', '2022-06-27 19:46:05', NULL),
(56, NULL, 21, 2, 'Vasos Descartables Transparentes NN', NULL, 'A102054', NULL, NULL, NULL, NULL, NULL, '100unid LA BOLSA', 1, NULL, '100', NULL, '2022-06-27 19:47:04', '2022-06-27 19:47:04', NULL),
(57, NULL, 21, 2, 'Estropajo para Limpieza CARMELITAS', NULL, 'A102055', NULL, NULL, NULL, NULL, NULL, 'CARMELITAS', 6, NULL, '0', NULL, '2022-06-27 19:47:51', '2022-06-27 19:47:51', NULL),
(58, NULL, 21, 6, 'Aceite Crisol Frit Intenso CRISOL', NULL, 'A102056', NULL, NULL, NULL, NULL, NULL, 'CRISOL BALDE 20LITROS', 0, NULL, '20', NULL, '2022-06-27 19:48:48', '2022-06-27 19:48:48', NULL),
(59, NULL, 21, 6, 'Aceite Crisol Multiusos CRISOL', NULL, 'A102057', NULL, NULL, NULL, NULL, NULL, 'CRISOL BALDE 20LITROS', 2, NULL, '20', NULL, '2022-06-27 19:49:44', '2022-06-27 19:49:44', NULL),
(60, NULL, 21, 1, 'Mayonesa ALPESA', NULL, 'A102058', NULL, NULL, NULL, NULL, NULL, 'ALPESA 3.8KG', 0, NULL, '3.8', NULL, '2022-06-27 19:51:06', '2022-06-27 19:51:06', NULL),
(61, NULL, 21, 1, 'Kétchup ALPESA', NULL, 'A102059', NULL, NULL, NULL, NULL, NULL, 'ALPESA 3.8KG', 0, NULL, '3.8', NULL, '2022-06-27 19:54:01', '2022-06-27 19:54:01', NULL),
(62, NULL, 21, 3, 'Pasta Nicolini Codo Rayado NICOLINI', NULL, 'A102060', NULL, NULL, NULL, NULL, NULL, 'NICOLINI 5 Kg', 0, NULL, '5', NULL, '2022-06-27 21:25:24', '2022-06-27 21:25:24', NULL),
(63, NULL, 21, 3, 'Pasta Nicolini Plumilla NICOLINI', NULL, 'A102061', NULL, NULL, NULL, NULL, NULL, 'NICOLINI 20 bolsas 250 gr.', 0, NULL, '5', NULL, '2022-06-27 21:27:31', '2022-06-27 21:28:04', NULL),
(64, NULL, 21, 3, 'Pasta Nicolini Spaghetti NICOLINI', NULL, 'A102062', NULL, NULL, NULL, NULL, NULL, 'NICOLINI 20 bolsas 500 gr.', 0, NULL, '5', NULL, '2022-06-27 21:28:41', '2022-06-27 21:28:41', NULL),
(65, NULL, 22, 8, 'Schug Sonoma coast Chardonnay', NULL, 'B114001', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:39:40', '2022-07-06 17:43:27', '2022-07-06 17:43:27'),
(66, NULL, 22, 8, 'Schug Carneros Pinot Noir', NULL, 'B114002', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:40:22', '2022-07-06 17:46:01', '2022-07-06 17:46:01'),
(67, NULL, 22, 8, 'Schug Sonoma coast Pinot Noir', NULL, 'B114003', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:40:55', '2022-07-06 17:46:45', '2022-07-06 17:46:45'),
(68, NULL, 22, 8, 'Pisco Quebranta  x 2lt', NULL, 'B114004', NULL, NULL, NULL, NULL, NULL, 'Caja x 9 bot', 0, NULL, '0', NULL, '2022-06-27 22:41:39', '2022-07-06 17:46:20', '2022-07-06 17:46:20'),
(69, NULL, 22, 8, 'VT  FUEGO BLANCO CONTRAVIENTO BLEND 2018', NULL, 'B114005', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:42:07', '2022-07-06 17:43:48', '2022-07-06 17:43:48'),
(70, NULL, 22, 8, 'VB PETIT BATUCO SAUVIGNON BLANC', NULL, 'B114006', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:42:33', '2022-07-06 17:46:53', '2022-07-06 17:46:53'),
(71, NULL, 22, 8, 'VT PETIT BATUCO CABERNET SAUVIGNON', NULL, 'B114007', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:42:59', '2022-07-06 17:47:01', '2022-07-06 17:47:01'),
(72, NULL, 22, 8, 'VT PETIT BATUCO MERLOT', NULL, 'B114008', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:43:31', '2022-07-06 17:48:14', '2022-07-06 17:48:14'),
(73, NULL, 22, 8, 'VB FUEGO GEWURZTRAMINER 2018', NULL, 'B114009', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:44:01', '2022-07-06 17:46:12', '2022-07-06 17:46:12'),
(74, NULL, 22, 8, 'VB FUEGO SAUVIGNON BLANC 2018', NULL, 'B114010', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:44:44', '2022-07-06 17:46:37', '2022-07-06 17:46:37'),
(75, NULL, 22, 8, 'VT  FUEGO BLANCOCONTRAVIENTO MALBEC 2018', NULL, 'B114011', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:45:08', '2022-07-06 17:48:25', '2022-07-06 17:48:25'),
(76, NULL, 22, 8, 'VT FUEGO FLINTSTONE  CABERNET FRANc 2015', NULL, 'B114012', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:45:41', '2022-07-06 17:46:29', '2022-07-06 17:46:29'),
(77, NULL, 22, 8, 'VT FUEGO FLINTSTONE  MALBEC  2015', NULL, 'B114013', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:46:15', '2022-07-06 17:48:38', '2022-07-06 17:48:38'),
(78, NULL, 22, 8, 'VT FUEGO VALLE SILEX CABERNET FRANK-MALBEC 2016', NULL, 'B114014', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:46:40', '2022-07-06 17:48:47', '2022-07-06 17:48:47'),
(79, NULL, 22, 8, 'VINO BLANCO PISANO CISPLATINO TORRONTES', NULL, 'B114015', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:47:09', '2022-07-06 17:48:56', '2022-07-06 17:48:56'),
(80, NULL, 22, 8, 'VINO ROSADO PISANO CISPLATINO CABERNET FRANC ROSE', NULL, 'B114016', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:47:32', '2022-07-06 17:49:07', '2022-07-06 17:49:07'),
(81, NULL, 22, 8, 'VINO TINTO PISANO CISPLATINO TANNAT MERLOT', NULL, 'B114017', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:48:09', '2022-07-06 17:43:57', '2022-07-06 17:43:57'),
(82, NULL, 22, 8, 'VINO TINTO PISANO CISPLATINO TANNAT', NULL, 'B114018', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:48:46', '2022-07-06 17:44:05', '2022-07-06 17:44:05'),
(83, NULL, 22, 8, 'VINO TINTO PISANO RPF TANNAT', NULL, 'B114019', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:49:26', '2022-07-06 17:44:11', '2022-07-06 17:44:11'),
(84, NULL, 22, 8, 'VINO TINTO PISANO RIO DE LOS PAJAROS TANNAT', NULL, 'B114020', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:49:56', '2022-07-06 17:44:37', '2022-07-06 17:44:37'),
(85, NULL, 22, 8, 'VINO BLANCO SCHUBERT WAIRARAPA SAUVIGNON BLANC SELECTION', NULL, 'B114021', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:50:29', '2022-07-06 17:44:44', '2022-07-06 17:44:44'),
(86, NULL, 22, 8, 'VINO BLANCO SCHUBERT WAIRARAPA SAUVIGNON BLANC', NULL, 'B114022', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:51:43', '2022-07-06 17:44:53', '2022-07-06 17:44:53'),
(87, NULL, 22, 8, 'VINO TINTO SCHUBERT WAIRARAPA PINOT NOIR BLOCK B', NULL, 'B114023', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:52:45', '2022-07-06 17:45:01', '2022-07-06 17:45:01'),
(88, NULL, 22, 8, 'VINO TINTO SCHUBERT WAIRARAPA PINOT NOIR MARIONS VINEYARD', NULL, 'B114024', NULL, NULL, NULL, NULL, NULL, 'Caja x 6 bot', 0, NULL, '0', NULL, '2022-06-27 22:53:56', '2022-07-06 17:45:11', '2022-07-06 17:45:11'),
(89, NULL, 22, 8, 'VINO TINTO SCHUBERT WAIRARAPA PINOT NOIR SELECTION', NULL, 'B114025', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:54:52', '2022-07-06 17:45:20', '2022-07-06 17:45:20'),
(90, NULL, 22, 8, 'VINO BLANCO THE WEDGE CHENIN BLANC/ROUSSANNE', NULL, 'B114026', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:55:26', '2022-07-06 17:45:28', '2022-07-06 17:45:28'),
(91, NULL, 22, 8, 'VINO TINTO THE WEDGE SHIRAZ/MOURVEDRE/VIOGNIER', NULL, 'B114027', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:56:06', '2022-07-06 17:45:35', '2022-07-06 17:45:35'),
(92, NULL, 22, 8, 'VINO BLANCO THE WEDGE CHENIN BLANC', NULL, 'B114028', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:56:25', '2022-07-06 17:45:42', '2022-07-06 17:45:42'),
(93, NULL, 22, 8, 'VINO TINTO THE WEDGE PINOTAGE', NULL, 'B114029', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:56:44', '2022-07-06 17:45:49', '2022-07-06 17:45:49'),
(94, NULL, 22, 8, 'VINO TINTO THE WEDGE GRENACHE', NULL, 'B114030', NULL, NULL, NULL, NULL, NULL, 'Caja x 12 bot', 0, NULL, '0', NULL, '2022-06-27 22:57:19', '2022-07-06 17:44:29', '2022-07-06 17:44:29'),
(95, NULL, 24, 1, 'Monomero 15ml modi', NULL, '021233', NULL, NULL, NULL, NULL, NULL, 'Monomero 15ml Descripción mod', 0, NULL, '2', NULL, '2022-07-14 16:11:00', '2022-07-14 16:38:44', NULL),
(96, NULL, 23, 5, 'DIL DOS CAPUCHON XL', NULL, '6667575', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', NULL, '2022-07-15 01:20:13', '2022-07-15 01:20:42', '2022-07-15 01:20:42'),
(97, NULL, 21, 3, 'Servilleta Blanca Simple SFOLL', NULL, 'A102063', NULL, NULL, NULL, NULL, NULL, 'Paquete de 15 Unidades', 14, NULL, '0', NULL, '2022-08-12 00:30:21', '2022-08-12 00:30:21', NULL),
(98, NULL, 21, 8, 'Lavavajilla Sapolio', NULL, 'A102064', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '0.8', NULL, '2022-08-12 00:31:04', '2022-08-12 00:31:04', NULL),
(99, NULL, 21, 8, 'Esponja Multiuso Limpia Max', NULL, 'A102065', NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, '0', NULL, '2022-08-12 00:31:33', '2022-08-12 00:31:33', NULL),
(100, NULL, 27, 1, 'DEEP COUPE PLATE 28 CM - CLAY', NULL, 'EADC28CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814872', 0, NULL, '2.65', NULL, '2022-08-12 17:02:04', '2022-08-18 16:54:41', NULL),
(101, NULL, 27, 1, 'BOWL 121CL - CLAY', NULL, 'EABW20CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814919', 8, NULL, '2.84', NULL, '2022-08-12 17:02:57', '2022-08-18 16:55:05', NULL),
(102, NULL, 27, 1, 'BOWL 121CL - COBALTO', NULL, 'EABW20CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814414', 8, NULL, '2.84', NULL, '2022-08-12 17:03:41', '2022-08-18 16:55:35', NULL),
(103, NULL, 27, 1, 'DEEP PLATE 26CM - DUAL OVAL', NULL, 'EAOD26DU', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016832425', 9, NULL, '2.1', NULL, '2022-08-12 17:04:37', '2022-08-18 16:55:55', NULL),
(104, NULL, 27, 1, 'DEEP COUPE PLATE 28 CM - DUAL', NULL, 'EADC28DU', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814124', 0, NULL, '2.65', NULL, '2022-08-12 17:09:07', '2022-08-18 16:56:16', NULL),
(105, NULL, 27, 1, 'DEEP COUPE PLATE 28 CM - CALDERA', NULL, 'EADC28CA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814629', 3, NULL, '2.65', NULL, '2022-08-12 17:09:51', '2022-08-18 16:56:30', NULL),
(106, NULL, 27, 1, '27 CM RIMLESS PLATE - RUBY', NULL, 'RBNNPR27', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009451923', 10, NULL, '8.35', NULL, '2022-08-12 17:10:28', '2022-08-18 16:56:58', NULL),
(107, NULL, 27, 1, 'COUPE PLATE 28 CM - CLAY', NULL, 'EACP28CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814827', 13, NULL, '11.4', NULL, '2022-08-12 17:11:36', '2022-08-18 16:57:30', NULL),
(108, NULL, 27, 1, 'CUP23CL - CLAY', NULL, 'EACU23CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814964', 8, NULL, '2.79', NULL, '2022-08-12 17:12:48', '2022-08-18 16:57:53', NULL),
(109, NULL, 27, 1, 'CUP23CL - COBALTO', NULL, 'EACU23CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814469', 5, NULL, '2.79', NULL, '2022-08-12 17:15:34', '2022-08-18 16:58:21', NULL),
(110, NULL, 27, 1, '24 CM RIMPLESS PLATE - RUBY', NULL, 'RBNNPR24', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009451930', 10, NULL, '6.53', NULL, '2022-08-12 17:16:06', '2022-08-18 16:59:07', NULL),
(111, NULL, 27, 1, 'FLATE COPE PLATE 24 CM - IMPALA', NULL, 'IPNNPR24', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009451152', 5, NULL, '6.53', NULL, '2022-08-12 17:17:06', '2022-08-18 16:59:30', NULL),
(112, NULL, 27, 1, 'SAUCER FOR 09CL CUP - CLAY', NULL, 'EASA13CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814971', 8, NULL, '2.53', NULL, '2022-08-12 17:17:48', '2022-08-18 17:00:05', NULL),
(113, NULL, 27, 1, 'COUPE PLETA 28 CM - CALDERA', NULL, 'EACP28CA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814575', 0, NULL, '11.4', NULL, '2022-08-12 17:18:24', '2022-08-18 17:00:37', NULL),
(114, NULL, 27, 1, 'CUP09CL - CLAY', NULL, 'EACU09CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814940', 8, NULL, '1.52', NULL, '2022-08-12 17:21:38', '2022-08-18 17:01:11', NULL),
(115, NULL, 27, 1, 'CUP09CL - COBALTO', NULL, 'EACU09CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814445', 8, NULL, '1.52', NULL, '2022-08-12 17:22:28', '2022-08-18 17:02:34', NULL),
(116, NULL, 27, 1, 'COUPE PLATE 24 CM - CLAY', NULL, 'EACP24CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814810', 8, NULL, '7.9', NULL, '2022-08-12 17:23:17', '2022-08-18 17:03:11', NULL),
(117, NULL, 27, 1, 'COUPE PLATE 28 CM - DUAL', NULL, 'EACP28DU', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814070', 0, NULL, '11.4', NULL, '2022-08-12 17:25:06', '2022-08-18 17:03:26', NULL),
(118, NULL, 27, 1, 'COUPE PLATE 24 CM - DUAL', NULL, 'EACP24DU', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814063', 2, NULL, '7.9', NULL, '2022-08-12 17:25:45', '2022-08-18 17:03:42', NULL),
(119, NULL, 27, 1, 'COUPE PLATE 24 CM - COBALTO', NULL, 'EACP24CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814315', 2, NULL, '7.9', NULL, '2022-08-12 17:26:21', '2022-08-18 17:04:23', NULL),
(120, NULL, 27, 1, 'BOWL121CL - DUAL', NULL, 'EABW20DU', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814162', 5, NULL, '2.84', NULL, '2022-08-12 17:26:58', '2022-08-18 17:04:44', NULL),
(121, NULL, 27, 1, 'DEEP PLATE 26CM - CLAY OVAL', NULL, 'EAOD26CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016832401', 45, NULL, '2.1', NULL, '2022-08-12 17:27:46', '2022-08-18 17:05:13', NULL),
(122, NULL, 27, 1, 'BOWL 121CL - CALDERA', NULL, 'EABW20CA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814667', 13, NULL, '2.84', NULL, '2022-08-12 17:28:19', '2022-08-18 17:05:34', NULL),
(123, NULL, 27, 1, 'DEEP PLATE 26CM - CALDERA OVAL', NULL, 'EAOD26CA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016832395', 0, NULL, '2.1', NULL, '2022-08-12 17:29:44', '2022-08-18 17:05:55', NULL),
(124, NULL, 27, 1, 'DEEP PLATE 26CM - COBALTO OVAL', NULL, 'EAOD26CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016832418', 7, NULL, '2.1', NULL, '2022-08-12 17:30:14', '2022-08-18 17:06:17', NULL),
(125, NULL, 27, 1, 'RICE BOWL 16 CM - CRUST', NULL, 'GNNNRB16CR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478784', 3, NULL, '5.36', NULL, '2022-08-12 17:30:50', '2022-08-18 17:07:12', NULL),
(126, NULL, 27, 1, 'GENESIS COLLECTION - ALMENDRA', NULL, 'GN116C08AL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478449', 0, NULL, '1.8', NULL, '2022-08-12 17:31:30', '2022-08-18 17:07:34', NULL),
(127, NULL, 27, 1, 'GENESIS COLLECTION - CRUST', NULL, 'GN116C08CR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478920', 0, NULL, '1.8', NULL, '2022-08-12 17:32:06', '2022-08-18 17:07:58', NULL),
(128, NULL, 27, 1, 'GN116C23ALA - GENESIS COLLECTION - ALMENDRA', NULL, 'GN116C23AL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478456', 3, NULL, '3.3', NULL, '2022-08-12 17:36:28', '2022-08-18 17:08:48', NULL),
(129, NULL, 27, 1, 'GN116C23CR - GENESIS COLLECTION - CRUST', NULL, 'GN116C23CR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478937', 3, NULL, '3.3', NULL, '2022-08-12 17:36:58', '2022-08-18 17:09:23', NULL),
(130, NULL, 27, 1, 'OVAL PLATE RIMLESS 36 CM - NEGRO', NULL, 'NFNNOP36BK', NULL, NULL, NULL, NULL, NULL, 'serie 6294009459806', 10, NULL, '7.2', NULL, '2022-08-12 17:50:08', '2022-08-18 17:10:47', NULL),
(131, NULL, 27, 1, '32 CM OVAL PLATE - CORAL', NULL, 'TWNNOP32CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477565', 10, NULL, '5.51', NULL, '2022-08-12 17:50:53', '2022-08-18 17:11:13', NULL),
(132, NULL, 27, 1, '15 CM NOODLE BOWL - NEGRO', NULL, 'NFOPNB15BK', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009459493', 0, NULL, '2.56', NULL, '2022-08-12 17:51:26', '2022-08-18 17:11:45', NULL),
(133, NULL, 27, 1, 'EARED ROUND DISH 16 CM - NEGRO', NULL, 'NFOPRD16BK', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009459677', 2, NULL, '4.84', NULL, '2022-08-12 17:51:58', '2022-08-18 17:12:06', NULL),
(134, NULL, 27, 1, 'SAUCER FOR 20 & 23 CL CUP - CLAY', NULL, 'EASA16CL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814988', 8, NULL, '3.73', NULL, '2022-08-12 17:52:29', '2022-08-18 18:03:42', NULL),
(135, NULL, 27, 1, 'DEEP COUPE PLATE 28 CM - COBALTO', NULL, 'EADC28CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814377', 100, NULL, '2.65', NULL, '2022-08-12 17:53:59', '2022-08-18 18:04:04', NULL),
(136, NULL, 27, 1, '27 CM RIMLESS PLATE - IMPALA', NULL, 'IPNNPR27', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009451138', 10, NULL, '8.35', NULL, '2022-08-12 17:54:28', '2022-08-18 18:04:33', NULL),
(137, NULL, 27, 1, '27 CM RIMLESS PLATE - DARK RED', NULL, 'NFNNPR27DR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009460260', 9, NULL, '8.35', NULL, '2022-08-12 17:54:56', '2022-08-18 18:04:59', NULL),
(138, NULL, 27, 1, 'COUPE PLATE 24 CM - CALDERA', NULL, 'EACP24CA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814568', 1, NULL, '7.9', NULL, '2022-08-12 17:55:23', '2022-08-18 18:05:29', NULL),
(139, NULL, 27, 1, 'FLAT COUPE PLATE 28CM - CORAL', NULL, 'TWNNPR28CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009451589', 8, NULL, '10.56', NULL, '2022-08-12 17:55:53', '2022-08-18 18:05:57', NULL),
(140, NULL, 27, 1, '27 CM RIMLESS PLATE - NEGRO', NULL, 'NFNNPR27BK', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009459820', 0, NULL, '8.35', NULL, '2022-08-12 17:56:19', '2022-08-18 18:06:20', NULL),
(141, NULL, 27, 1, '23 CM EXTRA DEEP PLATE - LAGOON', NULL, 'TWCLXD23LA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477794', 16, NULL, '3.92', NULL, '2022-08-12 17:57:01', '2022-08-18 18:06:48', NULL),
(142, NULL, 27, 1, 'COUPE BOWL 26 CM - LAGOON', NULL, 'TWBUBC26LA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477688', 0, NULL, '10.4', NULL, '2022-08-12 17:57:24', '2022-08-18 18:07:12', NULL),
(143, NULL, 27, 1, '23 CM EXTRA DEEP PLATE - BEACH', NULL, 'TWCLXD23BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478005', 0, NULL, '3.92', NULL, '2022-08-12 17:57:51', '2022-08-18 18:07:38', NULL),
(144, NULL, 27, 1, 'FLAT COUPE PLATE 24CM - LAGOON', NULL, 'TWNNPR24LA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477732', 0, NULL, '6.53', NULL, '2022-08-12 17:58:19', '2022-08-18 18:12:51', NULL),
(145, NULL, 27, 1, 'FLAT COUPE PLATE 21CM - LAGOON', NULL, 'TWNNPR21LA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477725', 0, NULL, '4', NULL, '2022-08-12 17:58:45', '2022-08-18 18:13:11', NULL),
(146, NULL, 27, 1, 'FLAT COUPE PLATE 24CM - BEACH', NULL, 'TWNNPR24BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477947', 0, NULL, '6.53', NULL, '2022-08-12 17:59:10', '2022-08-18 18:13:58', NULL),
(147, NULL, 27, 1, 'FLAT COUPE PLATE 21CM - CORAL', NULL, 'TWNNPR21CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477510', 0, NULL, '4', NULL, '2022-08-12 17:59:43', '2022-08-18 18:14:18', NULL),
(148, NULL, 27, 1, 'RIMLESS PLATE 21CM - BROWN', NULL, 'NFNNPR21BW', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009460727', 0, NULL, '4', NULL, '2022-08-12 18:01:17', '2022-08-18 18:14:41', NULL),
(149, NULL, 27, 1, 'COUPE BOWL 26 CM - CORAL', NULL, 'TWBUBC26CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477473', 0, NULL, '10.4', NULL, '2022-08-12 18:01:39', '2022-08-18 18:15:11', NULL),
(150, NULL, 27, 1, 'FLAT COUPE PLATE 24CM - CORAL', NULL, 'TWNNPR24CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477527', 0, NULL, '6.53', NULL, '2022-08-12 18:02:06', '2022-08-18 18:15:53', NULL),
(151, NULL, 27, 1, 'SAUCER FOR 20 & 23 CL CUP - COBALTO', NULL, 'EASA16CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814483', 0, NULL, '3.73', NULL, '2022-08-12 18:02:33', '2022-08-18 18:16:20', NULL),
(152, NULL, 27, 1, 'COUPE BWOL 26CM - DARK RED', NULL, 'NFBUBC26DR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009498621', 0, NULL, '10.4', NULL, '2022-08-12 18:02:57', '2022-08-18 18:16:44', NULL),
(153, NULL, 27, 1, '21CM RIMLESS PLATE - NEGRO', NULL, 'NFNNPR21BK', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009459844', 0, NULL, '4', NULL, '2022-08-12 18:03:22', '2022-08-18 18:17:03', NULL),
(154, NULL, 27, 1, '17CM SAUCER FOR COFFE CUP - CRUST', NULL, 'GNCLSA02CR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478951', 0, NULL, '3.42', NULL, '2022-08-12 18:03:47', '2022-08-18 18:17:36', NULL),
(155, NULL, 27, 1, '17CM SAUCER FOR COFFE CUP', NULL, 'GNCLSA02CR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478951', 0, NULL, '3.42', NULL, '2022-08-12 18:04:07', '2022-08-18 18:18:13', '2022-08-18 18:18:13'),
(156, NULL, 27, 1, '32CM OVAL PLATTER - LAGOON', NULL, 'TWNNOP32LA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477770', 0, NULL, '5.51', NULL, '2022-08-12 18:04:31', '2022-08-18 18:18:37', NULL),
(157, NULL, 27, 1, 'FARED OVAL DISH 25CM - NEGRO', NULL, 'NFOPOD25BK', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009459653', 0, NULL, '10', NULL, '2022-08-12 18:05:02', '2022-08-18 18:19:00', NULL),
(158, NULL, 27, 1, 'BUTTER RAMEQUIN 8CM - DARK RED', NULL, 'NFBABR02DR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009460321', 0, NULL, '1.76', NULL, '2022-08-12 18:05:30', '2022-08-18 18:20:03', NULL),
(159, NULL, 27, 1, '21CM RIMLESS PLATE - DARK RED', NULL, 'NFNNPR21DR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009460284', 0, NULL, '4', NULL, '2022-08-12 18:06:01', '2022-08-18 18:20:30', NULL),
(160, NULL, 27, 1, '17CM SAUCER FOR COFFE CUP - ALMENDRA', NULL, 'GNCLSA02AL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478470', 0, NULL, '3.42', NULL, '2022-08-12 18:06:25', '2022-08-18 18:21:01', NULL),
(161, NULL, 27, 1, 'SAUCER FOR 09CL CUP - COBALTO', NULL, 'EASA13CO', NULL, NULL, NULL, NULL, NULL, 'Serie 6294016814476', 0, NULL, '2.53', NULL, '2022-08-12 18:07:03', '2022-08-18 18:21:23', NULL),
(162, NULL, 27, 1, '13CM SAUCER FOR EXPRESSO CUP - CRUST', NULL, 'GNCLSA13CR', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478944', 0, NULL, '2', NULL, '2022-08-12 18:07:32', '2022-08-18 18:21:48', NULL),
(163, NULL, 27, 1, '32CM OVAL PLATTER - BEACH', NULL, 'TWNNOP32BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477985', 0, NULL, '5.51', NULL, '2022-08-12 18:07:56', '2022-08-18 18:22:23', NULL),
(164, NULL, 27, 1, '13CM SAUCER FOR EXPRESSO CUP - ALMENDRA', NULL, 'GNCLSA13AL', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009478463', 0, NULL, '2', NULL, '2022-08-12 18:08:20', '2022-08-18 18:22:55', NULL),
(165, NULL, 27, 1, 'COUPE BOWL 26 CM - BEACH', NULL, 'TWBUBC26BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477893', 0, NULL, '10.4', NULL, '2022-08-12 18:08:43', '2022-08-18 18:29:08', NULL),
(166, NULL, 27, 1, 'COUPE BOWL 26 CM', NULL, 'TWBUBC26BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477893', 0, NULL, '10.4', NULL, '2022-08-12 18:09:02', '2022-08-18 18:28:44', '2022-08-18 18:28:44'),
(167, NULL, 27, 1, 'FLAT COUPE PLATE 21CM - BEACH', NULL, 'TWNNPR21BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009477930', 0, NULL, '4', NULL, '2022-08-12 18:09:29', '2022-08-18 18:29:39', NULL),
(168, NULL, 27, 1, '28CM RIMLESS PLATE - BEACH', NULL, 'TWNNPR28BE', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009451558', 0, NULL, '10.56', NULL, '2022-08-12 18:11:11', '2022-08-18 18:29:54', NULL),
(169, NULL, 27, 1, '28CM RIMLESS PLATE - LAGOON', NULL, 'TWNNPR28LA', NULL, NULL, NULL, NULL, NULL, 'Serie 6294009452180', 0, NULL, '10.56', NULL, '2022-08-12 18:11:34', '2022-08-18 18:30:21', NULL),
(170, NULL, 27, 1, 'FLATE PLATE 21CM', NULL, 'RP0922', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '21.2', NULL, '2022-08-12 18:12:07', '2022-08-12 18:12:07', NULL),
(171, NULL, 27, 1, 'COUPE PLATE PARALLEL 26CM', NULL, 'RP7511', NULL, NULL, NULL, NULL, NULL, 'Serie RP7511', 0, NULL, '8.51', NULL, '2022-08-12 18:12:40', '2022-08-12 18:12:40', NULL),
(172, NULL, 27, 1, 'COUPE PLATE PARALLEL 24CM', NULL, 'RP7512', NULL, NULL, NULL, NULL, NULL, 'Serie RP7512', 0, NULL, '13.6', NULL, '2022-08-12 18:15:02', '2022-08-12 18:15:02', NULL),
(173, NULL, 27, 1, 'COUPE PLATE PARALLEL 21CM', NULL, 'RP7513', NULL, NULL, NULL, NULL, NULL, 'Serie RP7513', 0, NULL, '19.1', NULL, '2022-08-12 18:15:27', '2022-08-12 18:15:27', NULL),
(174, NULL, 27, 1, 'GOURMET PLATE PARALLEL 28CM', NULL, 'RP7521', NULL, NULL, NULL, NULL, NULL, 'Serie RP7521', 0, NULL, '5.51', NULL, '2022-08-12 18:15:51', '2022-08-12 18:15:51', NULL),
(175, NULL, 27, 1, 'STEAK PLATE PARALLEL 28CM', NULL, 'RP7524', NULL, NULL, NULL, NULL, NULL, 'Serie RP7524', 0, NULL, '11.72', NULL, '2022-08-12 18:16:23', '2022-08-12 18:16:23', NULL),
(176, NULL, 27, 1, 'COUPE DEEP PLATE PARALLEL 26.5CM', NULL, 'RP7526', NULL, NULL, NULL, NULL, NULL, 'Serie RP7526', 0, NULL, '5.7', NULL, '2022-08-12 18:16:59', '2022-08-12 18:16:59', NULL),
(177, NULL, 27, 1, 'COFFE CUP SAUCER 15CM', NULL, 'RP0213', NULL, NULL, NULL, NULL, NULL, 'Serie RP0213', 0, NULL, '14.55', NULL, '2022-08-12 18:17:26', '2022-08-12 18:17:26', NULL),
(178, NULL, 27, 1, 'COFFE CUP SAUCER 15CM', NULL, 'RP0213', NULL, NULL, NULL, NULL, NULL, 'Serie RP0213', 0, NULL, '14.55', NULL, '2022-08-12 18:17:46', '2022-08-12 18:17:46', NULL),
(179, NULL, 27, 1, 'OVAL PLATTER COUPE 38CM', NULL, 'RP0224', NULL, NULL, NULL, NULL, NULL, 'Serie RP0224', 0, NULL, '17.1', NULL, '2022-08-12 18:18:12', '2022-08-12 18:18:12', NULL),
(180, NULL, 27, 1, 'COFFE CUP (STACKABLE) 0.20L', NULL, 'RP0231', NULL, NULL, NULL, NULL, NULL, 'Serie RP0231', 0, NULL, '15.7', NULL, '2022-08-12 18:18:37', '2022-08-12 18:18:37', NULL),
(181, NULL, 27, 1, 'OVAL PLATE 28CM', NULL, 'RP0285', NULL, NULL, NULL, NULL, NULL, 'Serie RP0285', 0, NULL, '8.6', NULL, '2022-08-12 18:19:03', '2022-08-12 18:19:03', NULL),
(182, NULL, 27, 1, 'CEREAL BOWL 14CM', NULL, 'RP0905', NULL, NULL, NULL, NULL, NULL, 'Serie RP0905', 0, NULL, '14', NULL, '2022-08-12 18:19:25', '2022-08-12 18:19:25', NULL),
(183, NULL, 27, 1, 'SALAD BOWL 16CM', NULL, 'RP0906', NULL, NULL, NULL, NULL, NULL, 'Serie RP0906', 0, NULL, '9.24', NULL, '2022-08-12 18:19:50', '2022-08-12 18:19:50', NULL),
(184, NULL, 27, 1, 'RIM PASTA PLATE 28CM', NULL, 'RP0909', NULL, NULL, NULL, NULL, NULL, 'Serie RP0909', 0, NULL, '6.5', NULL, '2022-08-12 18:20:12', '2022-08-12 18:20:12', NULL),
(185, NULL, 27, 1, 'FLAT PLATE 24CM', NULL, 'RP0921', NULL, NULL, NULL, NULL, NULL, 'Serie RP0921', 0, NULL, '15.32', NULL, '2022-08-12 18:20:39', '2022-08-12 18:20:39', NULL),
(186, NULL, 27, 1, 'FLAT PLATE 18CM', NULL, 'RP0923', NULL, NULL, NULL, NULL, NULL, 'Serie RP0923', 0, NULL, '19.43', NULL, '2022-08-12 18:22:29', '2022-08-12 18:22:29', NULL),
(187, NULL, 27, 1, 'FLAT PLATE 16CM', NULL, 'RP0924', NULL, NULL, NULL, NULL, NULL, 'Serie RP0924', 0, NULL, '14.5', NULL, '2022-08-12 18:22:50', '2022-08-12 18:22:50', NULL),
(188, NULL, 27, 1, 'TEA BOT W/LID 0.80L', NULL, 'RP0934', NULL, NULL, NULL, NULL, NULL, 'Serie RP0934', 0, NULL, '7', NULL, '2022-08-12 23:43:14', '2022-08-12 23:43:14', NULL),
(189, NULL, 27, 1, 'FLAT PLATE 28CM', NULL, 'RP0941', NULL, NULL, NULL, NULL, NULL, 'Serie RP0941', 0, NULL, '11.2', NULL, '2022-08-12 23:43:51', '2022-08-12 23:43:51', NULL),
(190, NULL, 27, 1, 'SUGAR PACK HOLDER 6X9X5,5', NULL, 'RP0944', NULL, NULL, NULL, NULL, NULL, 'Serie RP0944', 0, NULL, '20.72', NULL, '2022-08-12 23:44:16', '2022-08-12 23:44:16', NULL),
(191, NULL, 27, 1, 'OVAL PLATE 32CM', NULL, 'RP0949', NULL, NULL, NULL, NULL, NULL, 'Serie RP0949', 0, NULL, '11.5', NULL, '2022-08-12 23:44:39', '2022-08-12 23:44:39', NULL),
(192, NULL, 27, 1, 'OVAL PLATE 26CM', NULL, 'RP0950', NULL, NULL, NULL, NULL, NULL, 'Serie RP0950', 0, NULL, '7.13', NULL, '2022-08-12 23:45:06', '2022-08-12 23:45:06', NULL),
(193, NULL, 27, 1, 'FLAT PLATE 30CM', NULL, 'RP0954', NULL, NULL, NULL, NULL, NULL, 'Serie RP0954', 0, NULL, '13.5', NULL, '2022-08-12 23:45:29', '2022-08-12 23:45:29', NULL),
(194, NULL, 27, 1, 'BOWL 10CM', NULL, 'RP0983', NULL, NULL, NULL, NULL, NULL, 'Serie RP0983', 0, NULL, '13.13', NULL, '2022-08-12 23:45:54', '2022-08-12 23:45:54', NULL),
(195, NULL, 27, 1, 'RITZ PASTA BOWL 30.3CM', NULL, 'RP0988', NULL, NULL, NULL, NULL, NULL, 'Serie RP0988', 0, NULL, '14.5', NULL, '2022-08-12 23:46:21', '2022-08-12 23:46:21', NULL),
(196, NULL, 27, 1, 'CREAMER 0.10L', NULL, 'RP0992', NULL, NULL, NULL, NULL, NULL, 'Serie RP0992', 0, NULL, '8.35', NULL, '2022-08-12 23:46:47', '2022-08-12 23:46:47', NULL),
(197, NULL, 27, 1, 'PIZZA PLATE 31CM', NULL, 'RP0996', NULL, NULL, NULL, NULL, NULL, 'Serie RP0996', 0, NULL, '15.6', NULL, '2022-08-12 23:47:11', '2022-08-12 23:47:11', NULL),
(198, NULL, 27, 1, 'OVAL PLATTER 23,5X31,5CM', NULL, 'RP4002', NULL, NULL, NULL, NULL, NULL, 'Serie RP4002', 0, NULL, '11.8', NULL, '2022-08-12 23:47:37', '2022-08-12 23:47:37', NULL),
(199, NULL, 27, 1, 'OVAL PLATTER 26X36CM', NULL, 'RP4003', NULL, NULL, NULL, NULL, NULL, 'Serie RP4003', 0, NULL, '15.1', NULL, '2022-08-12 23:48:03', '2022-08-12 23:48:03', NULL),
(200, NULL, 27, 1, 'DEEP BOWL 23.5CM', NULL, 'RP4153', NULL, NULL, NULL, NULL, NULL, 'Serie RP4153', 0, NULL, '22.3', NULL, '2022-08-12 23:48:29', '2022-08-12 23:48:29', NULL),
(201, NULL, 27, 1, 'SQUARE SAUCE DISH 7X7CM', NULL, 'RP4174', NULL, NULL, NULL, NULL, NULL, 'Serie RP4174', 0, NULL, '24.54', NULL, '2022-08-12 23:49:07', '2022-08-12 23:49:07', NULL),
(202, NULL, 27, 1, 'SQUARE SAUCE DISH 6X6CM', NULL, 'RP4175', NULL, NULL, NULL, NULL, NULL, 'Serie RP4175', 0, NULL, '15.7', NULL, '2022-08-12 23:49:32', '2022-08-12 23:49:32', NULL),
(203, NULL, 27, 1, 'SALT SHAKER (898) 6CM', NULL, 'RP5012', NULL, NULL, NULL, NULL, NULL, 'Serie RP5012', 0, NULL, '16.22', NULL, '2022-08-12 23:49:53', '2022-08-12 23:49:53', NULL),
(204, NULL, 27, 1, 'PEPPER SHAKER (898) 6CM', NULL, 'RP5013', NULL, NULL, NULL, NULL, NULL, 'Serie RP5013', 0, NULL, '16.22', NULL, '2022-08-12 23:50:22', '2022-08-12 23:50:22', NULL),
(205, NULL, 27, 1, 'FLAT PLATE 26X30,5CM', NULL, 'RP5601', NULL, NULL, NULL, NULL, NULL, 'Serie RP5601', 0, NULL, '10.1', NULL, '2022-08-12 23:50:43', '2022-08-12 23:50:43', NULL),
(206, NULL, 27, 1, 'FLAT PLATE 19,5X23,5CM', NULL, 'RP5602', NULL, NULL, NULL, NULL, NULL, 'Serie RP5602', 0, NULL, '22.54', NULL, '2022-08-12 23:51:03', '2022-08-12 23:51:03', NULL),
(207, NULL, 21, 6, 'Aceite Delicia de Oro', NULL, 'A102066', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '20', NULL, '2022-08-15 17:51:15', '2022-08-15 17:56:37', NULL),
(208, NULL, 27, 1, 'FLAT PLATE 16X17CM', NULL, 'RP5603', NULL, NULL, NULL, NULL, NULL, 'Serie RP5603', 0, NULL, '18.1', NULL, '2022-08-16 00:22:31', '2022-08-16 00:22:31', NULL),
(209, NULL, 27, 1, 'SOUP PLATE 20,5X22CM', NULL, 'RP5604', NULL, NULL, NULL, NULL, NULL, 'Serie RP5604', 0, NULL, '23.2', NULL, '2022-08-16 00:23:03', '2022-08-16 00:23:03', NULL),
(210, NULL, 27, 1, 'PLAT PLATTER 30X35CM', NULL, 'RP5605', NULL, NULL, NULL, NULL, NULL, 'Serie RP5605', 0, NULL, '13.84', NULL, '2022-08-16 00:45:37', '2022-08-16 00:45:37', NULL),
(211, NULL, 27, 1, 'SNACK PLATE 15,5X25,5CM', NULL, 'RP5606', NULL, NULL, NULL, NULL, NULL, 'Serie RP5606', 0, NULL, '18.6', NULL, '2022-08-16 00:46:05', '2022-08-16 00:46:05', NULL),
(212, NULL, 27, 1, 'OVAL PLATE (L)23,5X41CM', NULL, 'RP5607', NULL, NULL, NULL, NULL, NULL, 'Serie RP5607', 0, NULL, '13.4', NULL, '2022-08-16 00:46:39', '2022-08-16 00:46:39', NULL),
(213, NULL, 27, 1, 'MUG 0.35L', NULL, 'RP5615', NULL, NULL, NULL, NULL, NULL, 'Serie RP5615', 0, NULL, '14.52', NULL, '2022-08-16 00:47:58', '2022-08-16 00:47:58', NULL),
(214, NULL, 27, 1, 'CREAMER 0.18L', NULL, 'RP5617', NULL, NULL, NULL, NULL, NULL, 'Serie RP5617', 0, NULL, '11', NULL, '2022-08-16 00:48:19', '2022-08-16 00:48:19', NULL),
(215, NULL, 27, 1, 'SUGAR BOWL W/LID 0.18L', NULL, 'RP5618', NULL, NULL, NULL, NULL, NULL, 'Serie RP5618', 0, NULL, '18.6', NULL, '2022-08-16 00:48:49', '2022-08-16 00:48:49', NULL),
(216, NULL, 27, 1, 'PASTA BOWL 26X26,5CM', NULL, 'RP5621', NULL, NULL, NULL, NULL, NULL, 'Serie RP5621', 0, NULL, '7.63', NULL, '2022-08-16 00:49:13', '2022-08-16 00:49:13', NULL),
(217, NULL, 27, 1, 'FRUIT BOWL 13X12.5', NULL, 'RP5626', NULL, NULL, NULL, NULL, NULL, 'Serie RP5626', 0, NULL, '15.2', NULL, '2022-08-16 00:49:39', '2022-08-16 00:49:39', NULL),
(218, NULL, 27, 1, 'RICE BOWL 11X11,5CM', NULL, 'RP5627', NULL, NULL, NULL, NULL, NULL, 'Serie RP5627', 0, NULL, '11.5', NULL, '2022-08-16 00:50:02', '2022-08-16 00:50:02', NULL),
(219, NULL, 27, 1, 'DIP DISH 9,5X9,5CM', NULL, 'RP5628', NULL, NULL, NULL, NULL, NULL, 'Serie RP5628', 0, NULL, '28', NULL, '2022-08-16 00:50:23', '2022-08-16 00:50:23', NULL),
(220, NULL, 27, 1, 'LONG TRAY 12X40,5CM', NULL, 'RP5630', NULL, NULL, NULL, NULL, NULL, 'Serie RP5630', 0, NULL, '7.2', NULL, '2022-08-16 00:50:44', '2022-08-16 00:50:44', NULL),
(221, NULL, 27, 1, 'SALT SHAKER 4CM', NULL, 'RP5631', NULL, NULL, NULL, NULL, NULL, 'Serie RP5631', 0, NULL, '10.54', NULL, '2022-08-16 00:51:11', '2022-08-16 00:51:11', NULL),
(222, NULL, 27, 1, 'PEPPER SHAKER 3,5CM', NULL, 'RP5632', NULL, NULL, NULL, NULL, NULL, 'Serie RP5632', 0, NULL, '11.2', NULL, '2022-08-16 00:51:34', '2022-08-16 00:51:34', NULL),
(223, NULL, 27, 1, 'COFFEE POT W/LID 0.9L', NULL, 'RP5634', NULL, NULL, NULL, NULL, NULL, 'Serie RP5634', 0, NULL, '5.42', NULL, '2022-08-16 00:51:55', '2022-08-16 00:51:55', NULL),
(224, NULL, 27, 1, 'SALAS BOWL (TALL) 22,5X24X13,2CM', NULL, 'RP5635', NULL, NULL, NULL, NULL, NULL, 'Serie RP5635', 0, NULL, '6.43', NULL, '2022-08-16 00:52:16', '2022-08-16 00:52:16', NULL),
(225, NULL, 27, 1, 'CEREAL BOWL 16CM', NULL, 'RP5637', NULL, NULL, NULL, NULL, NULL, 'Serie RP5637', 0, NULL, '12.9', NULL, '2022-08-16 00:52:38', '2022-08-16 00:52:38', NULL),
(226, NULL, 27, 1, 'HIDE DROP ULTRA SILVER', NULL, 'UHDDP18S', NULL, NULL, NULL, NULL, NULL, 'Serie UHDDP18S', 0, NULL, '4.8', NULL, '2022-08-16 00:53:05', '2022-08-16 00:53:05', NULL),
(227, NULL, 27, 1, '31 CM ROUND PLATE ULTRA PURE GOLD DESIGN', NULL, 'UGDRP31D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDRP31D5', 0, NULL, '4.8', NULL, '2022-08-16 00:55:04', '2022-08-16 00:55:04', NULL),
(228, NULL, 27, 1, '15 CM SAUCER ULTRA PURE GOLD DESIGN', NULL, 'UGDSA15D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDSA15D5', 0, NULL, '4.8', NULL, '2022-08-16 00:57:10', '2022-08-16 00:57:10', NULL),
(229, NULL, 27, 1, '23 CM DEEP PLATE ULTRA PURE GOLD DESIGN', NULL, 'UGDDP23D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDDP23D5', 0, NULL, '4.8', NULL, '2022-08-17 22:51:59', '2022-08-17 22:51:59', NULL),
(230, NULL, 27, 1, 'DEEP COUPE PLATE', NULL, 'ONDP28A', NULL, NULL, NULL, NULL, NULL, 'Serie ONDP28A', 0, NULL, '4.8', NULL, '2022-08-17 22:54:03', '2022-08-17 22:54:03', NULL),
(231, NULL, 27, 1, '09CL EXPRESSO CUP ULTRA PURE GOLD DESIGN', NULL, 'UGDCU09D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDCU09D5', 0, NULL, '4.8', NULL, '2022-08-17 22:54:50', '2022-08-17 22:54:50', NULL),
(232, NULL, 27, 1, '29 CM DEEP PLATE ULTRA KING & QUEEN DESIGN', NULL, 'UKQDP29', NULL, NULL, NULL, NULL, NULL, 'Serie UKQDP29', 0, NULL, '4.8', NULL, '2022-08-17 22:56:11', '2022-08-17 22:56:11', NULL),
(233, NULL, 27, 1, '33 CM SCALLOP PLATE ULTRA KING & QUEEN DESIGN', NULL, 'UKQSP33', NULL, NULL, NULL, NULL, NULL, 'Serie UKQSP33', 0, NULL, '4.8', NULL, '2022-08-17 22:56:54', '2022-08-17 22:56:54', NULL),
(234, NULL, 27, 1, '33CM SCALLOP PLATE ULTRA PURE GOLD DESIGN', NULL, 'UGDSP33D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDSP33D5', 0, NULL, '4.8', NULL, '2022-08-17 23:31:46', '2022-08-17 23:31:46', NULL),
(235, NULL, 27, 1, '29CM DEEP LATE ULTRA PURE GOLD DESIGN', NULL, 'UGDDP29D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDDP29D5', 0, NULL, '4.8', NULL, '2022-08-17 23:32:10', '2022-08-17 23:32:10', NULL),
(236, NULL, 27, 1, '25CL CREAMER ULTRA PURE GOLD DESIGN', NULL, 'UGDCR25D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDCR25D5', 0, NULL, '4.8', NULL, '2022-08-17 23:32:39', '2022-08-17 23:32:39', NULL),
(237, NULL, 27, 1, '25CL SUGAR BOWL W.LID ULTRA PURE GOLD', NULL, 'UGDSU25D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDSU25D5', 0, NULL, '4.8', NULL, '2022-08-17 23:33:00', '2022-08-17 23:33:00', NULL),
(238, NULL, 27, 1, '21CL TEA CUP ULTRA PURE GOLD DESIGN', NULL, 'UGDCU21D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDCU21D5', 0, NULL, '4.8', NULL, '2022-08-17 23:33:23', '2022-08-17 23:33:23', NULL),
(239, NULL, 27, 1, '33.5CM SQ PLATE ULTRA PURE GOLD DESIGN', NULL, 'UGDSP34D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDSP34D5', 0, NULL, '4.8', NULL, '2022-08-17 23:33:44', '2022-08-17 23:33:44', NULL),
(240, NULL, 27, 1, '26CM SQUARE PLATE ULTRA PURE GOLD DESIGN', NULL, 'UGDSP26D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDSP26D5', 0, NULL, '4.8', NULL, '2022-08-17 23:34:04', '2022-08-17 23:34:04', NULL),
(241, NULL, 27, 1, '12CM SAUCER ULTRA PURE GOLD DESIGN', NULL, 'UGDSA12D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDSA12D5', 0, NULL, '4.8', NULL, '2022-08-17 23:34:24', '2022-08-17 23:34:24', NULL),
(242, NULL, 27, 1, '150CL TEA POT W.LID ULTRA PURE GOLD DSN', NULL, 'UGDTP150D5', NULL, NULL, NULL, NULL, NULL, 'Serie UGDTP150D5', 0, NULL, '4.8', NULL, '2022-08-17 23:34:46', '2022-08-17 23:34:46', NULL),
(243, NULL, 27, 1, 'DROP', NULL, 'HDDP18', NULL, NULL, NULL, NULL, NULL, 'Serie HDDP18', 0, NULL, '4.8', NULL, '2022-08-17 23:35:09', '2022-08-17 23:35:09', NULL),
(244, NULL, 27, 1, 'ASHORE ROUND PLATE WITH HOLLOW CENTRAL SECTION 29CM', NULL, 'ARRP29', NULL, NULL, NULL, NULL, NULL, 'Serie ARRP29', 0, NULL, '4.8', NULL, '2022-08-17 23:35:33', '2022-08-17 23:35:33', NULL),
(245, NULL, 27, 1, 'DEEP ROUND PLATTED 29CM', NULL, 'AMDP29', NULL, NULL, NULL, NULL, NULL, 'Serie AMDP29', 0, NULL, '4.8', NULL, '2022-08-17 23:38:40', '2022-08-17 23:38:40', NULL),
(246, NULL, 27, 1, 'APPEAL CARVED BOWEL 20CM', NULL, 'APCB20', NULL, NULL, NULL, NULL, NULL, 'Serie APCB20', 0, NULL, '4.8', NULL, '2022-08-17 23:39:02', '2022-08-17 23:39:02', NULL),
(247, NULL, 27, 1, 'SKETCHES FINGER MARKED BIG', NULL, 'STEP28A', NULL, NULL, NULL, NULL, NULL, 'Serie STEP28A', 0, NULL, '4.8', NULL, '2022-08-17 23:39:23', '2022-08-17 23:39:23', NULL),
(248, NULL, 27, 1, 'SKETCHES FINGER MARKED DEEPER', NULL, 'STEDP 20', NULL, NULL, NULL, NULL, NULL, 'Serie STEDP 20', 0, NULL, '4.8', NULL, '2022-08-17 23:39:43', '2022-08-17 23:39:43', NULL),
(249, NULL, 27, 1, 'APPEAL ROUND FLAT PLATE 30CM', NULL, 'APRFP30', NULL, NULL, NULL, NULL, NULL, 'Serie APRFP30', 0, NULL, '4.8', NULL, '2022-08-17 23:40:03', '2022-08-17 23:40:03', NULL),
(250, NULL, 27, 1, '32CM DROP PLATE', NULL, 'HDDP32', NULL, NULL, NULL, NULL, NULL, 'Serie HDDP32', 0, NULL, '4.8', NULL, '2022-08-17 23:40:20', '2022-08-17 23:40:20', NULL),
(251, NULL, 27, 1, 'A ROUGH PLATE DEEP WHITE MAT OUT & IV IN', NULL, 'STCD20OC18', NULL, NULL, NULL, NULL, NULL, 'Serie STCD20OC18', 0, NULL, '4.8', NULL, '2022-08-17 23:40:49', '2022-08-17 23:40:49', NULL),
(252, NULL, 27, 1, 'CHILL ROUND DEEP PLATE 29CM', NULL, 'CHDP29', NULL, NULL, NULL, NULL, NULL, 'Serie CHDP29', 0, NULL, '4.8', NULL, '2022-08-17 23:41:53', '2022-08-17 23:41:53', NULL),
(253, NULL, 27, 1, 'CARVED FLAT PLATE WHITE MATT OUTSIDE & IVERY INSIDE', NULL, 'STCP24OC18', NULL, NULL, NULL, NULL, NULL, 'Serie STCP24OC18', 0, NULL, '4.8', NULL, '2022-08-17 23:42:24', '2022-08-17 23:42:24', NULL),
(254, NULL, 27, 1, 'FLAT ROUND TRAY 26CM', NULL, 'AMFLT26', NULL, NULL, NULL, NULL, NULL, 'Serie AMFLT26', 0, NULL, '4.8', NULL, '2022-08-18 00:30:43', '2022-08-18 00:30:43', NULL),
(255, NULL, 27, 1, '15CM PIVOTING BOWL WHITE MATT OUTSIDE AND IVORY INSIDE', NULL, 'STPB15OC18', NULL, NULL, NULL, NULL, NULL, 'Serie STPB15OC18', 0, NULL, '5.4', NULL, '2022-08-18 00:31:22', '2022-08-18 00:31:22', NULL),
(256, NULL, 27, 1, 'SMALL UN EVEN ITEM WHITE MATT', NULL, 'STCD11WHM', NULL, NULL, NULL, NULL, NULL, 'Serie STCD11WHM', 0, NULL, '5.4', NULL, '2022-08-18 00:31:46', '2022-08-18 00:31:46', NULL),
(257, NULL, 27, 1, '20CM EMBOSSED FLAT PLATE', NULL, 'STEP20', NULL, NULL, NULL, NULL, NULL, 'Serie STEP20', 0, NULL, '5.4', NULL, '2022-08-18 00:32:21', '2022-08-18 00:32:21', NULL),
(258, NULL, 27, 1, '25CM EMBOSSED FLAT PLATE', NULL, 'STEP25', NULL, NULL, NULL, NULL, NULL, 'Serie STEP25', 0, NULL, '5.4', NULL, '2022-08-18 00:32:50', '2022-08-18 00:32:50', NULL),
(259, NULL, 27, 1, '20CM PIVOTING BOWL WHITE MATT OUTSIDE AND IVORY INSIDE', NULL, 'STPB20OC18', NULL, NULL, NULL, NULL, NULL, 'Serie STPB20OC18', 0, NULL, '5.4', NULL, '2022-08-18 00:33:18', '2022-08-18 00:33:18', NULL),
(260, NULL, 27, 1, 'CHILL ROUND STAND 13CM', NULL, 'CHRS13', NULL, NULL, NULL, NULL, NULL, 'Serie CHRS13', 0, NULL, '5.4', NULL, '2022-08-18 00:33:40', '2022-08-18 00:33:40', NULL),
(261, NULL, 27, 1, 'HK770/25', NULL, 'HK770/25', NULL, NULL, NULL, NULL, NULL, 'Serie HK770/25', 0, NULL, '7.4', NULL, '2022-08-18 00:34:06', '2022-08-18 00:34:06', NULL);
INSERT INTO `productos_x_empresa` (`prod_id`, `categoria_id`, `empr_id`, `unidad_id`, `prod_nombre`, `prod_codigo`, `prod_sku`, `prod_ean`, `prod_cantidad`, `prod_precio`, `prod_serie`, `prod_lote`, `prod_comentario`, `prod_stock`, `prod_fecha_vencimiento`, `prod_peso`, `prod_estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(262, NULL, 27, 1, 'HK770A/25', NULL, 'HK770A/25', NULL, NULL, NULL, NULL, NULL, 'Serie HK770A/25', 0, NULL, '8.7', NULL, '2022-08-18 00:34:30', '2022-08-18 00:34:30', NULL),
(263, NULL, 27, 1, 'HK770A/20', NULL, 'HK770A/20', NULL, NULL, NULL, NULL, NULL, 'Serie HK770A/20', 0, NULL, '11', NULL, '2022-08-18 00:34:50', '2022-08-18 00:34:50', NULL),
(264, NULL, 27, 1, 'HKF305', NULL, 'HKF305', NULL, NULL, NULL, NULL, NULL, 'Serie HKF305', 0, NULL, '10.5', NULL, '2022-08-18 00:35:41', '2022-08-18 00:35:41', NULL),
(265, NULL, 27, 1, 'HKW35', NULL, 'HKW35', NULL, NULL, NULL, NULL, NULL, 'Serie HKW35', 0, NULL, '9.2', NULL, '2022-08-18 00:35:59', '2022-08-18 00:35:59', NULL),
(266, NULL, 27, 1, 'HKB20', NULL, 'HKB20', NULL, NULL, NULL, NULL, NULL, 'Serie HKB20', 0, NULL, '7.3', NULL, '2022-08-18 00:36:21', '2022-08-18 00:36:21', NULL),
(267, NULL, 27, 1, 'HKST18', NULL, 'HKST18', NULL, NULL, NULL, NULL, NULL, 'Serie HKST18', 0, NULL, '6', NULL, '2022-08-18 00:36:45', '2022-08-18 00:36:45', NULL),
(268, NULL, 27, 1, 'HK201W', NULL, 'HK201W', NULL, NULL, NULL, NULL, NULL, 'Serie HK201W', 0, NULL, '9.5', NULL, '2022-08-18 00:37:07', '2022-08-18 00:37:07', NULL),
(269, NULL, 27, 1, 'HKT997', NULL, 'HKT997', NULL, NULL, NULL, NULL, NULL, 'Serie HKT997', 0, NULL, '8.2', NULL, '2022-08-18 00:37:28', '2022-08-18 00:37:28', NULL),
(270, NULL, 27, 1, 'HKST924', NULL, 'HKST924', NULL, NULL, NULL, NULL, NULL, 'Serie HKST924', 0, NULL, '6', NULL, '2022-08-18 00:37:45', '2022-08-18 00:37:45', NULL),
(271, NULL, 27, 1, 'TABLE SPOON MADISON', NULL, '011 CM', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CM', 0, NULL, '22', NULL, '2022-08-18 00:38:12', '2022-08-18 00:38:12', NULL),
(272, NULL, 27, 1, 'TABLE FORK MADISON', NULL, '011 TM', NULL, NULL, NULL, NULL, NULL, 'Serie 011 TM', 0, NULL, '17', NULL, '2022-08-18 00:38:32', '2022-08-18 00:38:32', NULL),
(273, NULL, 27, 1, 'SOLID TABLE KNIFE MADISON', NULL, '011 CHM/M', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CHM/M', 0, NULL, '28', NULL, '2022-08-18 00:38:52', '2022-08-18 00:38:52', NULL),
(274, NULL, 27, 1, 'DESSERT SPOON MADISON', NULL, '011 CP', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CP', 0, NULL, '17.6', NULL, '2022-08-18 00:39:16', '2022-08-18 00:39:16', NULL),
(275, NULL, 27, 1, 'TEA SPOON MADISON', NULL, '011 CT', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CT', 0, NULL, '19', NULL, '2022-08-18 00:39:41', '2022-08-18 00:39:41', NULL),
(276, NULL, 27, 1, 'COFFEE SPOON MADISON', NULL, '011 CC', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CC', 0, NULL, '14.1', NULL, '2022-08-18 00:40:04', '2022-08-18 00:40:04', NULL),
(277, NULL, 27, 1, 'SOLID STEAK KNIFE MADISON', NULL, '011 CHA/M', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CHA/M', 0, NULL, '28', NULL, '2022-08-18 00:40:33', '2022-08-18 00:40:33', NULL),
(278, NULL, 27, 1, 'BUTTER SPREADER MADISON', NULL, '011 CHB', NULL, NULL, NULL, NULL, NULL, 'Serie 011 CHB', 0, NULL, '26', NULL, '2022-08-18 00:40:55', '2022-08-18 00:40:55', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `racks`
--

CREATE TABLE `racks` (
  `rack_id` int(11) NOT NULL,
  `rack_nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `racks`
--

INSERT INTO `racks` (`rack_id`, `rack_nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'TORRE A', '2022-06-14 23:44:34', '2022-06-14 23:44:34', NULL),
(7, 'TORRE B', '2022-06-14 23:45:05', '2022-06-14 23:45:05', NULL),
(8, 'TORRE C', '2022-06-14 23:45:24', '2022-06-14 23:45:24', NULL),
(9, 'TORRE D', '2022-06-14 23:45:48', '2022-06-14 23:45:48', NULL),
(10, 'TORRE E', '2022-06-25 18:07:18', '2022-06-25 18:07:18', NULL),
(11, 'TORRE F', '2022-06-25 18:07:27', '2022-06-25 18:07:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `racks_casillas`
--

CREATE TABLE `racks_casillas` (
  `rc_id` int(11) NOT NULL,
  `rack_id` int(11) NOT NULL,
  `rc_nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `racks_casillas`
--

INSERT INTO `racks_casillas` (`rc_id`, `rack_id`, `rc_nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 6, '101', '2022-04-25 20:50:25', '2022-06-24 22:49:48', NULL),
(5, 6, '102', '2022-04-25 20:50:44', '2022-06-24 22:49:54', NULL),
(6, 6, '103', '2022-04-25 20:50:56', '2022-06-24 22:50:01', NULL),
(7, 6, '104', '2022-05-04 17:24:06', '2022-06-24 22:50:08', NULL),
(8, 6, '105', '2022-05-04 17:24:56', '2022-06-24 22:50:17', NULL),
(9, 6, '106', '2022-05-04 17:25:11', '2022-06-24 22:50:24', NULL),
(10, 6, '113', '2022-06-14 23:51:59', '2022-06-24 22:52:02', NULL),
(11, 6, '107', '2022-06-14 23:52:18', '2022-06-24 22:50:33', NULL),
(12, 6, '108', '2022-06-14 23:56:57', '2022-06-24 22:50:45', NULL),
(13, 6, '109', '2022-06-14 23:57:13', '2022-06-24 22:51:21', NULL),
(14, 6, '111', '2022-06-14 23:59:36', '2022-06-14 23:59:36', NULL),
(15, 6, '112', '2022-06-14 23:59:47', '2022-06-14 23:59:47', NULL),
(16, 6, '110', '2022-06-15 00:00:01', '2022-06-24 22:51:46', NULL),
(17, 6, '114', '2022-06-15 00:00:13', '2022-06-15 00:00:13', NULL),
(18, 6, '115', '2022-06-24 22:43:49', '2022-06-24 22:48:31', NULL),
(19, 6, '201', '2022-06-24 22:48:47', '2022-06-24 22:52:16', NULL),
(20, 6, '202', '2022-06-24 22:48:56', '2022-06-24 22:52:23', NULL),
(21, 6, '203', '2022-06-24 22:49:05', '2022-06-24 22:52:31', NULL),
(22, 6, '204', '2022-06-24 22:55:19', '2022-06-24 22:55:19', NULL),
(23, 6, '205', '2022-06-24 22:55:27', '2022-06-24 22:55:27', NULL),
(24, 6, '206', '2022-06-24 22:55:35', '2022-06-24 22:55:35', NULL),
(25, 6, '207', '2022-06-24 22:55:43', '2022-06-24 22:55:43', NULL),
(26, 6, '208', '2022-06-24 22:55:52', '2022-06-24 22:55:52', NULL),
(27, 6, '209', '2022-06-24 22:56:00', '2022-06-24 22:56:00', NULL),
(28, 6, '210', '2022-06-24 22:56:07', '2022-06-24 22:56:07', NULL),
(29, 6, '211', '2022-06-24 22:56:17', '2022-06-24 22:56:17', NULL),
(30, 6, '212', '2022-06-24 22:56:25', '2022-06-24 22:56:25', NULL),
(31, 6, '213', '2022-06-24 22:56:33', '2022-06-24 22:56:33', NULL),
(32, 6, '214', '2022-06-24 22:56:42', '2022-06-24 22:56:42', NULL),
(33, 6, '215', '2022-06-24 22:56:50', '2022-06-24 22:56:50', NULL),
(34, 6, '301', '2022-06-24 22:57:11', '2022-06-24 22:57:11', NULL),
(35, 6, '302', '2022-06-24 22:57:23', '2022-06-24 22:57:23', NULL),
(36, 6, '303', '2022-06-24 22:57:32', '2022-06-24 22:57:32', NULL),
(37, 6, '304', '2022-06-24 22:57:42', '2022-06-24 22:57:42', NULL),
(38, 6, '305', '2022-06-24 22:57:50', '2022-06-24 22:57:50', NULL),
(39, 6, '306', '2022-06-24 22:57:59', '2022-06-24 22:57:59', NULL),
(40, 6, '307', '2022-06-24 22:58:09', '2022-06-24 22:58:09', NULL),
(41, 6, '308', '2022-06-24 22:58:17', '2022-06-24 22:58:17', NULL),
(42, 6, '309', '2022-06-24 22:58:24', '2022-06-24 22:58:24', NULL),
(43, 6, '310', '2022-06-24 22:58:32', '2022-06-24 22:58:32', NULL),
(44, 6, '311', '2022-06-24 22:58:40', '2022-06-24 22:58:40', NULL),
(45, 6, '312', '2022-06-24 22:58:49', '2022-06-24 22:58:49', NULL),
(46, 6, '313', '2022-06-24 22:59:15', '2022-06-24 22:59:15', NULL),
(47, 6, '314', '2022-06-24 22:59:23', '2022-06-24 22:59:23', NULL),
(48, 6, '315', '2022-06-24 22:59:31', '2022-06-24 22:59:31', NULL),
(49, 6, '401', '2022-06-24 23:07:06', '2022-06-24 23:07:06', NULL),
(50, 6, '402', '2022-06-24 23:07:15', '2022-06-24 23:07:15', NULL),
(51, 6, '403', '2022-06-24 23:07:22', '2022-06-24 23:07:22', NULL),
(52, 6, '404', '2022-06-24 23:10:45', '2022-06-24 23:10:45', NULL),
(53, 6, '405', '2022-06-24 23:10:54', '2022-06-24 23:10:54', NULL),
(54, 6, '406', '2022-06-24 23:11:01', '2022-06-24 23:11:01', NULL),
(55, 6, '407', '2022-06-24 23:11:09', '2022-06-24 23:11:09', NULL),
(56, 6, '408', '2022-06-24 23:11:17', '2022-06-24 23:11:17', NULL),
(57, 6, '409', '2022-06-24 23:11:25', '2022-06-24 23:11:25', NULL),
(58, 6, '410', '2022-06-24 23:11:33', '2022-06-24 23:11:33', NULL),
(59, 6, '411', '2022-06-24 23:11:42', '2022-06-24 23:11:42', NULL),
(60, 6, '412', '2022-06-24 23:11:49', '2022-06-24 23:11:49', NULL),
(61, 6, '413', '2022-06-24 23:11:58', '2022-06-24 23:11:58', NULL),
(62, 6, '414', '2022-06-24 23:12:05', '2022-06-24 23:12:05', NULL),
(63, 6, '415', '2022-06-24 23:12:16', '2022-06-24 23:12:16', NULL),
(64, 6, '501', '2022-06-24 23:13:12', '2022-06-24 23:13:12', NULL),
(65, 6, '502', '2022-06-24 23:13:21', '2022-06-24 23:13:21', NULL),
(66, 6, '503', '2022-06-24 23:13:28', '2022-06-24 23:13:28', NULL),
(67, 6, '504', '2022-06-24 23:13:37', '2022-06-24 23:13:37', NULL),
(68, 6, '505', '2022-06-24 23:13:45', '2022-06-24 23:13:45', NULL),
(69, 6, '506', '2022-06-24 23:13:51', '2022-06-24 23:13:51', NULL),
(70, 6, '507', '2022-06-24 23:13:58', '2022-06-24 23:13:58', NULL),
(71, 6, '508', '2022-06-24 23:14:05', '2022-06-24 23:14:05', NULL),
(72, 6, '509', '2022-06-24 23:14:13', '2022-06-24 23:14:13', NULL),
(73, 6, '510', '2022-06-24 23:14:21', '2022-06-24 23:14:21', NULL),
(74, 6, '511', '2022-06-24 23:14:28', '2022-06-24 23:14:28', NULL),
(75, 6, '512', '2022-06-24 23:14:37', '2022-06-24 23:14:37', NULL),
(76, 6, '513', '2022-06-24 23:14:45', '2022-06-24 23:14:45', NULL),
(77, 6, '514', '2022-06-24 23:14:53', '2022-06-24 23:14:53', NULL),
(78, 6, '515', '2022-06-24 23:15:02', '2022-06-24 23:15:02', NULL),
(79, 7, '101', '2022-06-24 23:15:15', '2022-06-24 23:15:15', NULL),
(80, 7, '102', '2022-06-24 23:15:22', '2022-06-24 23:15:22', NULL),
(81, 7, '103', '2022-06-24 23:15:30', '2022-06-24 23:15:30', NULL),
(82, 7, '104', '2022-06-24 23:15:38', '2022-06-24 23:15:38', NULL),
(83, 7, '105', '2022-06-24 23:25:41', '2022-06-24 23:25:41', NULL),
(84, 7, '106', '2022-06-24 23:25:51', '2022-06-24 23:25:51', NULL),
(85, 7, '107', '2022-06-24 23:25:59', '2022-06-24 23:25:59', NULL),
(86, 7, '108', '2022-06-24 23:26:07', '2022-06-24 23:26:07', NULL),
(87, 7, '109', '2022-06-24 23:26:15', '2022-06-24 23:26:15', NULL),
(88, 7, '110', '2022-06-24 23:26:26', '2022-06-24 23:26:26', NULL),
(89, 7, '111', '2022-06-24 23:26:35', '2022-06-24 23:26:35', NULL),
(90, 7, '112', '2022-06-24 23:27:05', '2022-06-24 23:27:05', NULL),
(91, 7, '113', '2022-06-24 23:27:14', '2022-06-24 23:27:14', NULL),
(92, 7, '114', '2022-06-24 23:27:23', '2022-06-24 23:27:23', NULL),
(93, 7, '201', '2022-06-24 23:28:09', '2022-06-24 23:28:09', NULL),
(94, 7, '202', '2022-06-24 23:28:16', '2022-06-24 23:28:16', NULL),
(95, 7, '203', '2022-06-24 23:28:24', '2022-06-24 23:28:24', NULL),
(96, 7, '204', '2022-06-24 23:28:33', '2022-06-24 23:28:33', NULL),
(97, 7, '205', '2022-06-24 23:28:41', '2022-06-24 23:28:41', NULL),
(98, 7, '206', '2022-06-24 23:28:49', '2022-06-24 23:28:49', NULL),
(99, 7, '207', '2022-06-24 23:28:56', '2022-06-24 23:28:56', NULL),
(100, 7, '208', '2022-06-24 23:29:04', '2022-06-24 23:29:04', NULL),
(101, 7, '209', '2022-06-24 23:29:13', '2022-06-24 23:29:13', NULL),
(102, 7, '210', '2022-06-24 23:29:21', '2022-06-24 23:29:21', NULL),
(103, 7, '211', '2022-06-24 23:29:29', '2022-06-24 23:29:29', NULL),
(104, 7, '212', '2022-06-24 23:29:38', '2022-06-24 23:29:38', NULL),
(105, 7, '213', '2022-06-24 23:29:46', '2022-06-24 23:29:46', NULL),
(106, 7, '214', '2022-06-24 23:29:54', '2022-06-24 23:29:54', NULL),
(107, 7, '301', '2022-06-24 23:33:57', '2022-06-24 23:33:57', NULL),
(108, 7, '302', '2022-06-24 23:34:06', '2022-06-24 23:34:06', NULL),
(109, 7, '303', '2022-06-24 23:34:14', '2022-06-24 23:34:14', NULL),
(110, 7, '304', '2022-06-24 23:34:21', '2022-06-24 23:34:21', NULL),
(111, 7, '305', '2022-06-24 23:34:28', '2022-06-24 23:34:28', NULL),
(112, 7, '306', '2022-06-24 23:34:35', '2022-06-24 23:34:35', NULL),
(113, 7, '307', '2022-06-24 23:36:10', '2022-06-24 23:36:10', NULL),
(114, 7, '307', '2022-06-24 23:36:44', '2022-06-24 23:36:44', NULL),
(115, 7, '308', '2022-06-24 23:36:50', '2022-06-24 23:36:50', NULL),
(116, 7, '309', '2022-06-24 23:36:59', '2022-06-24 23:36:59', NULL),
(117, 7, '310', '2022-06-24 23:37:06', '2022-06-24 23:37:06', NULL),
(118, 7, '311', '2022-06-24 23:37:13', '2022-06-24 23:37:13', NULL),
(119, 7, '312', '2022-06-24 23:37:20', '2022-06-24 23:37:20', NULL),
(120, 7, '313', '2022-06-24 23:37:28', '2022-06-24 23:37:28', NULL),
(121, 7, '314', '2022-06-24 23:37:36', '2022-06-24 23:37:36', NULL),
(122, 7, '401', '2022-06-24 23:37:44', '2022-06-24 23:37:44', NULL),
(123, 7, '402', '2022-06-24 23:37:51', '2022-06-24 23:37:51', NULL),
(124, 7, '403', '2022-06-24 23:37:59', '2022-06-24 23:37:59', NULL),
(125, 7, '404', '2022-06-24 23:38:06', '2022-06-24 23:38:06', NULL),
(126, 7, '405', '2022-06-24 23:38:14', '2022-06-24 23:38:14', NULL),
(127, 7, '406', '2022-06-24 23:38:22', '2022-06-24 23:38:22', NULL),
(128, 7, '407', '2022-06-24 23:38:28', '2022-06-24 23:38:28', NULL),
(129, 7, '408', '2022-06-24 23:38:38', '2022-06-24 23:38:38', NULL),
(130, 7, '409', '2022-06-24 23:38:46', '2022-06-24 23:38:46', NULL),
(131, 7, '410', '2022-06-24 23:38:53', '2022-06-24 23:38:53', NULL),
(132, 7, '411', '2022-06-24 23:39:00', '2022-06-24 23:39:00', NULL),
(133, 7, '412', '2022-06-24 23:39:08', '2022-06-24 23:39:08', NULL),
(134, 7, '413', '2022-06-24 23:39:16', '2022-06-24 23:39:16', NULL),
(135, 7, '414', '2022-06-24 23:39:23', '2022-06-24 23:39:23', NULL),
(136, 7, '501', '2022-06-24 23:39:36', '2022-06-24 23:39:36', NULL),
(137, 7, '502', '2022-06-24 23:39:46', '2022-06-24 23:39:46', NULL),
(138, 7, '503', '2022-06-24 23:39:53', '2022-06-24 23:39:53', NULL),
(139, 7, '504', '2022-06-24 23:40:00', '2022-06-24 23:40:00', NULL),
(140, 7, '505', '2022-06-24 23:40:07', '2022-06-24 23:40:07', NULL),
(141, 7, '506', '2022-06-24 23:40:15', '2022-06-24 23:40:15', NULL),
(142, 7, '507', '2022-06-24 23:40:22', '2022-06-24 23:40:22', NULL),
(143, 7, '508', '2022-06-24 23:40:30', '2022-06-24 23:40:30', NULL),
(144, 7, '509', '2022-06-24 23:40:39', '2022-06-24 23:40:39', NULL),
(145, 7, '510', '2022-06-24 23:40:46', '2022-06-24 23:40:46', NULL),
(146, 7, '511', '2022-06-24 23:40:58', '2022-06-24 23:40:58', NULL),
(147, 7, '512', '2022-06-24 23:41:06', '2022-06-24 23:41:06', NULL),
(148, 7, '513', '2022-06-24 23:41:14', '2022-06-24 23:41:14', NULL),
(149, 7, '514', '2022-06-24 23:41:22', '2022-06-24 23:41:22', NULL),
(150, 8, '101', '2022-06-25 17:47:42', '2022-06-25 17:47:42', NULL),
(151, 8, '102', '2022-06-25 17:47:51', '2022-06-25 17:47:51', NULL),
(152, 8, '103', '2022-06-25 17:47:59', '2022-06-25 17:47:59', NULL),
(153, 8, '104', '2022-06-25 17:48:06', '2022-06-25 17:48:06', NULL),
(154, 8, '105', '2022-06-25 17:48:14', '2022-06-25 17:48:14', NULL),
(155, 8, '106', '2022-06-25 17:48:22', '2022-06-25 17:48:22', NULL),
(156, 8, '107', '2022-06-25 17:48:36', '2022-06-25 17:48:36', NULL),
(157, 8, '108', '2022-06-25 17:48:43', '2022-06-25 17:48:43', NULL),
(158, 8, '109', '2022-06-25 17:48:51', '2022-06-25 17:48:51', NULL),
(159, 8, '110', '2022-06-25 17:49:03', '2022-06-25 17:49:03', NULL),
(160, 8, '111', '2022-06-25 17:49:12', '2022-06-25 17:49:12', NULL),
(161, 8, '112', '2022-06-25 17:49:21', '2022-06-25 17:49:21', NULL),
(162, 8, '113', '2022-06-25 17:49:29', '2022-06-25 17:49:29', NULL),
(163, 8, '114', '2022-06-25 17:49:39', '2022-06-25 17:49:39', NULL),
(164, 8, '114', '2022-06-25 17:49:56', '2022-06-25 17:49:56', NULL),
(165, 8, '201', '2022-06-25 17:50:04', '2022-06-25 17:50:04', NULL),
(166, 8, '202', '2022-06-25 17:50:11', '2022-06-25 17:50:11', NULL),
(167, 8, '203', '2022-06-25 17:50:18', '2022-06-25 17:50:18', NULL),
(168, 8, '204', '2022-06-25 17:50:26', '2022-06-25 17:50:26', NULL),
(169, 8, '205', '2022-06-25 17:50:33', '2022-06-25 17:50:33', NULL),
(170, 8, '206', '2022-06-25 17:50:42', '2022-06-25 17:50:42', NULL),
(171, 8, '207', '2022-06-25 17:50:50', '2022-06-25 17:50:50', NULL),
(172, 8, '208', '2022-06-25 17:50:58', '2022-06-25 17:50:58', NULL),
(173, 8, '209', '2022-06-25 17:51:08', '2022-06-25 17:51:33', NULL),
(174, 8, '210', '2022-06-25 17:51:50', '2022-06-25 17:51:50', NULL),
(175, 8, '211', '2022-06-25 17:58:38', '2022-06-25 17:58:38', NULL),
(176, 8, '212', '2022-06-25 17:58:45', '2022-06-25 17:58:45', NULL),
(177, 8, '213', '2022-06-25 17:58:52', '2022-06-25 17:58:52', NULL),
(178, 8, '214', '2022-06-25 17:59:08', '2022-06-25 17:59:08', NULL),
(179, 8, '301', '2022-06-25 17:59:50', '2022-06-25 17:59:50', NULL),
(180, 8, '302', '2022-06-25 18:00:02', '2022-06-25 18:00:02', NULL),
(181, 8, '303', '2022-06-25 18:00:14', '2022-06-25 18:00:14', NULL),
(182, 8, '304', '2022-06-25 18:00:20', '2022-06-25 18:00:20', NULL),
(183, 8, '305', '2022-06-25 18:00:28', '2022-06-25 18:00:28', NULL),
(184, 8, '306', '2022-06-25 18:00:37', '2022-06-25 18:01:05', NULL),
(185, 8, '307', '2022-06-25 18:00:46', '2022-06-25 18:01:14', NULL),
(186, 8, '308', '2022-06-25 18:01:23', '2022-06-25 18:01:23', NULL),
(187, 8, '309', '2022-06-25 18:01:30', '2022-06-25 18:01:30', NULL),
(188, 8, '310', '2022-06-25 18:01:37', '2022-06-25 18:01:37', NULL),
(189, 8, '311', '2022-06-25 18:01:45', '2022-06-25 18:01:45', NULL),
(190, 8, '312', '2022-06-25 18:01:51', '2022-06-25 18:01:51', NULL),
(191, 8, '313', '2022-06-25 18:02:00', '2022-06-25 18:02:00', NULL),
(192, 8, '314', '2022-06-25 18:02:06', '2022-06-25 18:02:06', NULL),
(193, 8, '401', '2022-06-25 18:02:34', '2022-06-25 18:02:34', NULL),
(194, 8, '402', '2022-06-25 18:02:41', '2022-06-25 18:02:41', NULL),
(195, 8, '403', '2022-06-25 18:02:48', '2022-06-25 18:02:48', NULL),
(196, 8, '404', '2022-06-25 18:02:54', '2022-06-25 18:02:54', NULL),
(197, 8, '405', '2022-06-25 18:03:01', '2022-06-25 18:03:01', NULL),
(198, 8, '406', '2022-06-25 18:03:08', '2022-06-25 18:03:08', NULL),
(199, 8, '407', '2022-06-25 18:03:14', '2022-06-25 18:03:14', NULL),
(200, 8, '408', '2022-06-25 18:03:20', '2022-06-25 18:03:20', NULL),
(201, 8, '409', '2022-06-25 18:03:26', '2022-06-25 18:03:26', NULL),
(202, 8, '410', '2022-06-25 18:03:32', '2022-06-25 18:03:32', NULL),
(203, 8, '411', '2022-06-25 18:03:38', '2022-06-25 18:03:38', NULL),
(204, 8, '412', '2022-06-25 18:03:45', '2022-06-25 18:03:45', NULL),
(205, 8, '413', '2022-06-25 18:03:53', '2022-06-25 18:03:53', NULL),
(206, 8, '414', '2022-06-25 18:04:00', '2022-06-25 18:04:00', NULL),
(207, 8, '501', '2022-06-25 18:04:14', '2022-06-25 18:04:14', NULL),
(208, 8, '502', '2022-06-25 18:04:22', '2022-06-25 18:04:22', NULL),
(209, 8, '503', '2022-06-25 18:04:29', '2022-06-25 18:04:29', NULL),
(210, 8, '504', '2022-06-25 18:04:37', '2022-06-25 18:04:37', NULL),
(211, 8, '505', '2022-06-25 18:04:44', '2022-06-25 18:04:44', NULL),
(212, 8, '506', '2022-06-25 18:04:51', '2022-06-25 18:04:51', NULL),
(213, 8, '507', '2022-06-25 18:04:59', '2022-06-25 18:04:59', NULL),
(214, 8, '508', '2022-06-25 18:05:05', '2022-06-25 18:05:05', NULL),
(215, 8, '509', '2022-06-25 18:05:12', '2022-06-25 18:05:12', NULL),
(216, 8, '510', '2022-06-25 18:05:19', '2022-06-25 18:05:19', NULL),
(217, 8, '511', '2022-06-25 18:05:27', '2022-06-25 18:05:27', NULL),
(218, 8, '512', '2022-06-25 18:05:34', '2022-06-25 18:05:34', NULL),
(219, 8, '513', '2022-06-25 18:05:40', '2022-06-25 18:05:40', NULL),
(220, 8, '514', '2022-06-25 18:05:51', '2022-06-25 18:05:51', NULL),
(221, 11, '101', '2022-06-25 18:07:42', '2022-06-25 18:07:42', NULL),
(222, 11, '102', '2022-06-25 18:07:50', '2022-06-25 18:07:50', NULL),
(223, 11, '103', '2022-06-25 18:07:56', '2022-06-25 18:07:56', NULL),
(224, 11, '104', '2022-06-25 18:08:05', '2022-06-25 18:08:05', NULL),
(225, 11, '105', '2022-06-25 18:08:12', '2022-06-25 18:08:12', NULL),
(226, 11, '106', '2022-06-25 18:08:22', '2022-06-25 18:08:22', NULL),
(227, 11, '107', '2022-06-25 18:08:29', '2022-06-25 18:08:29', NULL),
(228, 11, '108', '2022-06-25 18:08:36', '2022-06-25 18:08:36', NULL),
(229, 11, '109', '2022-06-25 18:08:44', '2022-06-25 18:08:44', NULL),
(230, 11, '110', '2022-06-25 18:08:55', '2022-06-25 18:08:55', NULL),
(231, 11, '111', '2022-06-25 18:09:01', '2022-06-25 18:09:01', NULL),
(232, 11, '112', '2022-06-25 18:09:10', '2022-06-25 18:09:10', NULL),
(233, 11, '113', '2022-06-25 18:09:17', '2022-06-25 18:09:17', NULL),
(234, 11, '114', '2022-06-25 18:09:26', '2022-06-25 18:09:26', NULL),
(235, 11, '115', '2022-06-25 18:09:34', '2022-06-25 18:09:34', NULL),
(236, 11, '201', '2022-06-25 18:10:05', '2022-06-25 18:10:05', NULL),
(237, 11, '202', '2022-06-25 18:10:14', '2022-06-25 18:10:14', NULL),
(238, 11, '203', '2022-06-25 18:10:20', '2022-06-25 18:10:20', NULL),
(239, 11, '204', '2022-06-25 18:10:27', '2022-06-25 18:10:27', NULL),
(240, 11, '205', '2022-06-25 18:10:37', '2022-06-25 18:10:37', NULL),
(241, 11, '206', '2022-06-25 18:10:47', '2022-06-25 18:10:47', NULL),
(242, 11, '207', '2022-06-25 18:10:54', '2022-06-25 18:10:54', NULL),
(243, 11, '208', '2022-06-25 18:11:00', '2022-06-25 18:11:00', NULL),
(244, 11, '209', '2022-06-25 18:11:07', '2022-06-25 18:11:07', NULL),
(245, 11, '210', '2022-06-25 18:11:15', '2022-06-25 18:11:15', NULL),
(246, 11, '211', '2022-06-25 18:11:22', '2022-06-25 18:11:22', NULL),
(247, 11, '212', '2022-06-25 18:11:30', '2022-06-25 18:11:30', NULL),
(248, 11, '213', '2022-06-25 18:11:37', '2022-06-25 18:11:37', NULL),
(249, 11, '214', '2022-06-25 18:11:44', '2022-06-25 18:11:44', NULL),
(250, 11, '215', '2022-06-25 18:11:51', '2022-06-25 18:11:51', NULL),
(251, 11, '301', '2022-06-25 18:12:10', '2022-06-25 18:12:10', NULL),
(252, 11, '302', '2022-06-25 18:12:16', '2022-06-25 18:12:16', NULL),
(253, 11, '303', '2022-06-25 18:12:25', '2022-06-25 18:12:25', NULL),
(254, 11, '304', '2022-06-25 18:12:33', '2022-06-25 18:12:33', NULL),
(255, 11, '305', '2022-06-25 18:12:40', '2022-06-25 18:12:40', NULL),
(256, 11, '306', '2022-06-25 18:12:47', '2022-06-25 18:12:47', NULL),
(257, 11, '307', '2022-06-25 18:12:53', '2022-06-25 18:12:53', NULL),
(258, 11, '308', '2022-06-25 18:13:01', '2022-06-25 18:13:01', NULL),
(259, 11, '309', '2022-06-25 18:13:08', '2022-06-25 18:13:08', NULL),
(260, 11, '310', '2022-06-25 18:13:14', '2022-06-25 18:13:14', NULL),
(261, 11, '311', '2022-06-25 18:13:22', '2022-06-25 18:13:22', NULL),
(262, 11, '312', '2022-06-25 18:13:30', '2022-06-25 18:13:30', NULL),
(263, 11, '313', '2022-06-25 18:13:37', '2022-06-25 18:13:37', NULL),
(264, 11, '314', '2022-06-25 18:13:46', '2022-06-25 18:13:46', NULL),
(265, 11, '315', '2022-06-25 18:13:54', '2022-06-25 18:13:54', NULL),
(266, 11, '401', '2022-06-25 18:14:25', '2022-06-25 18:14:25', NULL),
(267, 11, '402', '2022-06-25 18:14:32', '2022-06-25 18:14:32', NULL),
(268, 11, '403', '2022-06-25 18:14:40', '2022-06-25 18:14:40', NULL),
(269, 11, '404', '2022-06-25 18:37:37', '2022-06-25 18:37:37', NULL),
(270, 11, '405', '2022-06-25 18:37:45', '2022-06-25 18:37:45', NULL),
(271, 11, '406', '2022-06-25 18:37:53', '2022-06-25 18:37:53', NULL),
(272, 11, '407', '2022-06-25 18:38:01', '2022-06-25 18:38:01', NULL),
(273, 11, '408', '2022-06-25 18:38:08', '2022-06-25 18:38:08', NULL),
(274, 11, '409', '2022-06-25 18:38:15', '2022-06-25 18:38:15', NULL),
(275, 11, '410', '2022-06-25 18:38:23', '2022-06-25 18:38:23', NULL),
(276, 11, '411', '2022-06-25 18:38:31', '2022-06-25 18:38:31', NULL),
(277, 11, '412', '2022-06-25 18:38:38', '2022-06-25 18:38:38', NULL),
(278, 11, '413', '2022-06-25 18:38:46', '2022-06-25 18:38:46', NULL),
(279, 11, '414', '2022-06-25 18:38:55', '2022-06-25 18:38:55', NULL),
(280, 11, '415', '2022-06-25 18:39:02', '2022-06-25 18:39:02', NULL),
(281, 11, '501', '2022-06-25 18:39:27', '2022-06-25 18:39:27', NULL),
(282, 11, '502', '2022-06-25 18:39:35', '2022-06-25 18:39:35', NULL),
(283, 11, '503', '2022-06-25 18:39:45', '2022-06-25 18:39:45', NULL),
(284, 11, '504', '2022-06-25 18:39:53', '2022-06-25 18:39:53', NULL),
(285, 11, '505', '2022-06-25 18:40:00', '2022-06-25 18:40:00', NULL),
(286, 11, '506', '2022-06-25 18:40:07', '2022-06-25 18:40:07', NULL),
(287, 11, '507', '2022-06-25 18:40:15', '2022-06-25 18:40:15', NULL),
(288, 11, '508', '2022-06-25 18:40:23', '2022-06-25 18:40:23', NULL),
(289, 11, '509', '2022-06-25 18:40:31', '2022-06-25 18:40:31', NULL),
(290, 11, '510', '2022-06-25 18:40:39', '2022-06-25 18:40:39', NULL),
(291, 11, '511', '2022-06-25 18:40:48', '2022-06-25 18:40:48', NULL),
(292, 11, '512', '2022-06-25 18:40:57', '2022-06-25 18:40:57', NULL),
(293, 11, '513', '2022-06-25 18:41:04', '2022-06-25 18:41:04', NULL),
(294, 11, '514', '2022-06-25 18:41:11', '2022-06-25 18:41:11', NULL),
(295, 11, '515', '2022-06-25 18:41:19', '2022-06-25 18:41:19', NULL),
(296, 9, '101', '2022-08-09 18:48:36', '2022-08-09 18:48:36', NULL),
(297, 9, '102', '2022-08-09 18:48:46', '2022-08-09 18:48:46', NULL),
(298, 9, '103', '2022-08-09 18:48:53', '2022-08-09 18:48:53', NULL),
(299, 9, '104', '2022-08-09 18:49:04', '2022-08-09 18:49:04', NULL),
(300, 9, '105', '2022-08-09 18:49:11', '2022-08-09 18:49:11', NULL),
(301, 9, '106', '2022-08-09 18:49:19', '2022-08-09 18:49:19', NULL),
(302, 9, '107', '2022-08-09 18:49:27', '2022-08-09 18:49:27', NULL),
(303, 9, '108', '2022-08-09 18:49:34', '2022-08-09 18:49:34', NULL),
(304, 9, '109', '2022-08-09 18:49:48', '2022-08-09 18:49:48', NULL),
(305, 9, '110', '2022-08-09 18:49:56', '2022-08-09 18:49:56', NULL),
(306, 9, '111', '2022-08-09 18:50:03', '2022-08-09 18:50:03', NULL),
(307, 9, '112', '2022-08-09 18:50:13', '2022-08-09 18:50:13', NULL),
(308, 9, '113', '2022-08-09 18:50:21', '2022-08-09 18:50:21', NULL),
(309, 9, '114', '2022-08-09 18:50:33', '2022-08-09 18:50:33', NULL),
(310, 9, '115', '2022-08-09 18:50:39', '2022-08-09 18:50:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_detalle`
--

CREATE TABLE `registro_detalle` (
  `rd_id` int(11) NOT NULL,
  `regi_id` int(11) NOT NULL,
  `pe_id` int(11) DEFAULT NULL,
  `rd_cantidad` varchar(100) DEFAULT NULL,
  `rd_precio` float DEFAULT NULL,
  `rd_unidad_medida` varchar(45) DEFAULT NULL,
  `rd_fabricante` varchar(45) DEFAULT NULL,
  `rd_lote` varchar(45) DEFAULT NULL,
  `rd_serie` varchar(45) DEFAULT NULL,
  `rd_comentario` longtext,
  `rd_estado` char(4) DEFAULT 'ACTI',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='	';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(2, 'OPERADOR', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(3, 'ASISTENTE', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39'),
(4, 'CLIENTE', 'web', '2022-07-21 22:27:39', '2022-07-21 22:27:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keep` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `keep`, `created_at`, `updated_at`) VALUES
(1, 'Dignissimos ipsum sit et voluptas dignissimos vero maiores aut.', '2022-03-17 18:10:27', '2022-03-17 18:10:27'),
(2, 'Dolorem voluptatem non pariatur delectus molestias.', '2022-03-17 18:10:27', '2022-03-17 18:10:27'),
(3, 'Voluptas non qui omnis omnis nemo totam.', '2022-03-17 18:10:27', '2022-03-17 18:10:27'),
(4, 'Natus optio ipsum eligendi aut reprehenderit sed ut.', '2022-03-17 18:10:27', '2022-03-17 18:10:27'),
(5, 'Minima corrupti eos est ab.', '2022-03-17 18:10:27', '2022-03-17 18:10:27'),
(6, 'Est sunt libero enim dolorem aut dignissimos qui laborum.', '2022-03-17 18:15:33', '2022-03-17 18:15:33'),
(7, 'Voluptatibus cupiditate qui minus assumenda sint.', '2022-03-17 18:15:33', '2022-03-17 18:15:33'),
(8, 'Sed voluptates est non et.', '2022-03-17 18:15:33', '2022-03-17 18:15:33'),
(9, 'Dolorum ut vel laboriosam mollitia eos et.', '2022-03-17 18:15:33', '2022-03-17 18:15:33'),
(10, 'Aut ut ad sed dolor.', '2022-03-17 18:15:33', '2022-03-17 18:15:33'),
(11, 'Quia amet est illo ut accusantium.', '2022-04-22 14:34:00', '2022-04-22 14:34:00'),
(12, 'Totam et voluptatem dolorum et.', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(13, 'Nam ab sapiente deleniti voluptatem accusantium natus.', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(14, 'Est dolor dolor tempora fugit saepe a.', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(15, 'Sit animi cum aut dolor hic excepturi.', '2022-04-22 14:34:01', '2022-04-22 14:34:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `tipo_docu_id` int(11) NOT NULL,
  `tipo_docu_nombre` varchar(45) DEFAULT NULL,
  `tipo_docu_estado` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`tipo_docu_id`, `tipo_docu_nombre`, `tipo_docu_estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DNI', 'ACTI', NULL, NULL, NULL),
(2, 'BREVETE', 'ACTI', NULL, NULL, NULL),
(3, 'CARNET EXTRANJERIA', 'ACTI', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `tm_id` int(11) NOT NULL,
  `tm_nombre` varchar(45) DEFAULT NULL,
  `tm_codigo` char(10) DEFAULT NULL,
  `tm_estado` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`tm_id`, `tm_nombre`, `tm_codigo`, `tm_estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INGRESO', 'INGRESO', NULL, NULL, NULL, NULL),
(2, 'DESPACHO', 'DESPACHO', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id` int(11) NOT NULL,
  `unid_codigo` char(5) NOT NULL,
  `unid_nombre` varchar(45) DEFAULT NULL,
  `unid_orden` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id`, `unid_codigo`, `unid_nombre`, `unid_orden`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 'CAJAS', 'CAJAS', 1, '2022-03-17 05:00:00', NULL, NULL),
(2, 'BOLSA', 'BOLSAS', 2, '2022-03-17 05:00:00', NULL, NULL),
(3, 'PAQUE', 'PAQUETES', 3, '2022-03-17 05:00:00', NULL, NULL),
(4, 'BARRI', 'BARRILES', 4, '2022-03-17 05:00:00', NULL, NULL),
(5, 'CONO', 'CONO', 1, '2022-04-22 05:00:00', NULL, NULL),
(6, 'BALDE', 'BALDES', NULL, '2021-02-26 00:22:30', NULL, NULL),
(7, 'TANQU', 'TANQUES', NULL, '2021-02-26 00:18:58', NULL, NULL),
(8, 'UNI', 'UNIDADES', 1, '2022-06-22 20:27:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` char(9) COLLATE utf8mb4_unicode_ci DEFAULT 'ACTI',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Adminisrador', 'saavedraphp@gmail.com', NULL, '$2y$10$BU5NWnrdlt.RJDJfodtove0DuF1GcL3XNLP4/SxKuqKY4x4Ux.2Xi', '8YnQbznskOpWCJzwsp7r5khNeTASqh3jDM9fNZaUZI79fzYZenr24tDOp5bo', 'ACTI', '2022-02-24 16:10:10', '2022-08-01 20:11:34', NULL),
(3, 'Eduardo Grillo', 'egrillo@almagri.com', NULL, '$2y$10$yqJ/6zF1.kpUUuIpWX208uudTDgNMM5HK.4sz2xVe5Nmnxl2mlMg.', 'KQ3Ie48mQL7RsryS0KsHiqXXT04PErS1g005OnrshsM2V95BMvtvX5QbDTC8', 'ACTI', '2022-02-26 05:22:30', '2022-08-01 20:10:56', NULL),
(18, 'EMPRESA TES', 'empresates@gmail.com', NULL, '$2y$10$qYHujhwwqKML9RzVG1pgzu67dVSt2we1JYKDxUHbSy0Gd7CJbCVqu', NULL, 'ACTI', '2022-06-22 17:17:57', '2022-07-13 22:13:11', '2022-07-13 22:13:11'),
(19, 'VOLF PERU SAC', 'martin@volfperu.com', NULL, '$2y$10$SRUVdI3AUm8qY7ZRWUFJcu.NIs.ked85PQNl3.Qzp2sFjM.9zXk4G', NULL, 'ACTI', '2022-06-24 23:05:57', '2022-07-16 18:29:21', '2022-07-16 18:29:21'),
(20, 'MERQHATU HORECA SAC', 'empresas@merqhatuperu.com', NULL, '$2y$10$4zTWu.7a.gI0/JXTTmQC/Ov.UKtZCCthtImWfaPkYvUB90gXdCAO6', NULL, 'ACTI', '2022-06-25 18:52:11', '2022-10-05 21:43:19', NULL),
(21, 'ANDANA REPRESENTACIONES SAC', 'lbacigalupo@andana.com.pe', NULL, '$2y$10$SXOa.c879ff.Ll3M1eDSCOjCUtzBGFFwq0zOuSd0d23k9GjHCHY5q', NULL, 'ACTI', '2022-06-27 22:18:43', '2022-07-16 18:34:09', '2022-07-16 18:34:09'),
(22, 'INNOVA INFORMATION TECHNOLOGY & COMMUNICATIONS SAC', 'roy.rodriguez@innova-itc.com', NULL, '$2y$10$0oGc8JQQ9pKymkh05v4H7O2OVVgfCLwQRPvFsC/9/.5UBTAjnKlgG', NULL, 'ACTI', '2022-06-27 23:38:01', '2022-06-27 23:38:01', NULL),
(23, 'EMPRESA-TEST23', 'empresa-test@gmail.com', NULL, '$2y$10$FAKB597pWCNh9HMpPMRKE.eMNPn4Fzsw67euw2IIFvgpl95X7LjK2', NULL, 'ACTI', '2022-07-13 22:53:55', '2022-08-15 20:03:20', '2022-08-15 20:03:20'),
(26, 'VOLF PERU SAC', 'martin@volfperu.com', NULL, '$2y$10$dJfvBUYzhIpPYtKVXL7NuuiPd/257HJ/dZUoysPPKDuk5yU/FUtbq', NULL, 'ACTI', '2022-07-16 18:30:37', '2022-08-12 23:41:12', NULL),
(27, 'TRADING VENTURES SAC', 'almacen@itvperu.com', NULL, '$2y$10$UO2MnLmel9tWt4FOKH/lM.un6OwL6a9nAeIXB0f/wku7pXqjXo0a2', NULL, 'ACTI', '2022-07-16 18:43:41', '2022-07-16 18:43:41', NULL),
(28, 'KBM SERVICIOS GENERALES S.A.C', 'prueba@prueba.com', NULL, '$2y$10$orzDe4MHH0Tapz1j3Om0qemEbbcUIVTfMLEzip5ilO9oluxnHu7WS', NULL, 'ACTI', '2022-07-16 18:52:30', '2022-07-16 18:53:47', '2022-07-16 18:53:47'),
(29, 'Frank Bautista', 'fcueva@almagri.com', NULL, '$2y$10$nkQGWsI9MoEOKsqJZ0ZId.reETgkNQ12ERi6RyT4RYNIiLXZNoHeu', NULL, 'ACTI', '2022-08-01 20:05:57', '2022-08-01 20:05:57', NULL),
(30, 'Renzo Grillo', 'rgrillo@almagri.com', NULL, '$2y$10$YtLKLFRCIn5FZfhwTUFKB.YbRnWlaMFm3sBOamlIOIQ7PWm5XhMgq', NULL, 'ACTI', '2022-08-01 20:10:32', '2022-08-01 20:10:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usua_id` int(10) UNSIGNED NOT NULL,
  `usua_nombre` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `usua_email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `usua_f_nacimiento` datetime DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `ciudad_id` int(11) DEFAULT NULL,
  `usua_direccion` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `usua_code_zip` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actas`
--
ALTER TABLE `actas`
  ADD PRIMARY KEY (`acta_id`),
  ADD KEY `fk_empresas_idx` (`empr_id`),
  ADD KEY `fk_servicios_x_acta_idx` (`tipo_movimiento_codigo`),
  ADD KEY `fk_tipo_documentos_x_acta_idx` (`tipo_docu_id`);

--
-- Indices de la tabla `casillas_empresas`
--
ALTER TABLE `casillas_empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_casillas` (`rc_id`),
  ADD KEY `fk_empresa_casilla` (`empr_id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos_x_empresa`
--
ALTER TABLE `contactos_x_empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empr_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`kard_id`),
  ADD KEY `fk_kardex_idx` (`prod_id`),
  ADD KEY `fk_actas_idx` (`acta_id`),
  ADD KEY `fk_lote_idx` (`lote_id`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`lote_id`);

--
-- Indices de la tabla `lote_x_producto`
--
ALTER TABLE `lote_x_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_COUNTRIES_NAME` (`pais_nombre`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `productos_x_empresa`
--
ALTER TABLE `productos_x_empresa`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `fk_presentaciones_idx` (`unidad_id`),
  ADD KEY `fk_empresas_idx` (`empr_id`),
  ADD KEY `fk_categoria_producto_idx` (`categoria_id`);

--
-- Indices de la tabla `racks`
--
ALTER TABLE `racks`
  ADD PRIMARY KEY (`rack_id`);

--
-- Indices de la tabla `racks_casillas`
--
ALTER TABLE `racks_casillas`
  ADD PRIMARY KEY (`rc_id`),
  ADD KEY `fk_rack_idx` (`rack_id`);

--
-- Indices de la tabla `registro_detalle`
--
ALTER TABLE `registro_detalle`
  ADD PRIMARY KEY (`rd_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`tipo_docu_id`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`tm_id`);

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usua_id`),
  ADD KEY `usuarios_pais_id_foreign` (`pais_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actas`
--
ALTER TABLE `actas`
  MODIFY `acta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `casillas_empresas`
--
ALTER TABLE `casillas_empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `contactos_x_empresa`
--
ALTER TABLE `contactos_x_empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `empr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `kard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `lote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `lote_x_producto`
--
ALTER TABLE `lote_x_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `productos_x_empresa`
--
ALTER TABLE `productos_x_empresa`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT de la tabla `racks`
--
ALTER TABLE `racks`
  MODIFY `rack_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `racks_casillas`
--
ALTER TABLE `racks_casillas`
  MODIFY `rc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `tipo_docu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  MODIFY `tm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usua_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `casillas_empresas`
--
ALTER TABLE `casillas_empresas`
  ADD CONSTRAINT `fk_casillas` FOREIGN KEY (`rc_id`) REFERENCES `racks_casillas` (`rc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_empresa_casilla` FOREIGN KEY (`empr_id`) REFERENCES `empresas` (`empr_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos_x_empresa`
--
ALTER TABLE `productos_x_empresa`
  ADD CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_producto` FOREIGN KEY (`empr_id`) REFERENCES `empresas` (`empr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_medida` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`id`);

--
-- Filtros para la tabla `racks_casillas`
--
ALTER TABLE `racks_casillas`
  ADD CONSTRAINT `fk_rack` FOREIGN KEY (`rack_id`) REFERENCES `racks` (`rack_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
