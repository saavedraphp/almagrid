-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-07-2022 a las 21:25:42
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

DROP TABLE IF EXISTS `actas`;
CREATE TABLE IF NOT EXISTS `actas` (
  `acta_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `estado_asignacion` char(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='																			';

--
-- Volcado de datos para la tabla `actas`
--

INSERT INTO `actas` (`acta_id`, `empr_id`, `tipo_docu_id`, `tipo_movimiento_codigo`, `acta_encargado_id`, `acta_supervisor_id`, `contrato_id`, `acta_sub_cliente`, `acta_numero_ingr_sali`, `acta_costo`, `acta_fecha_ini`, `acta_fecha_fin`, `acta_comentario`, `estado_asignacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 1, 'INGRESO', NULL, NULL, NULL, 'Luis Saavedra', '40221837', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Ingreso	Accion\r\n12	GRANADA	0	10	\r\n13	PALTA FUERTE GRADE	0	10', 'REALIZADO', '2022-06-20 18:56:13', '2022-06-20 19:01:14', NULL),
(2, 11, 1, 'INGRESO', NULL, NULL, NULL, 'Veronica', '500023', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Ingreso	Accion\r\n11	PITAJAYA modi	0	15	\r\n12	GRANADA	10	15	\r\n13	PALTA FUERTE GRADE	10	25', 'REALIZADO', '2022-06-20 19:02:08', '2022-06-20 19:21:56', NULL),
(3, 11, 1, 'DESPACHO', NULL, NULL, NULL, 'Luis Saavedra', '40221837', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Salida	Accion\r\n12	GRANADA	25	5	\r\n13	PALTA FUERTE GRADE	35	5	\r\n11	PITAJAYA modi	15	4', NULL, '2022-06-20 19:58:03', '2022-06-20 19:58:03', NULL),
(4, 11, 1, 'INGRESO', NULL, NULL, NULL, 'Rocio Saavedra', '54227813', NULL, NULL, NULL, '12	GRANADA \r\n7\r\n20	15	RACK 2-1	\r\n13	PALTA FUERTE GRADE \r\n8\r\n30	3	RACK 2-2', 'REALIZADO', '2022-07-01 21:50:15', '2022-07-01 21:50:15', NULL),
(5, 11, 1, 'DESPACHO', NULL, NULL, NULL, 'Luis Saavedra', '40221837', NULL, NULL, NULL, '#ID Producto	Producto	Stock	Salida	Accion\r\n12	GRANADA	35	15	\r\n13	PALTA FUERTE GRADE	33	3', NULL, '2022-07-04 14:42:27', '2022-07-04 14:42:27', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casillas_empresas`
--

DROP TABLE IF EXISTS `casillas_empresas`;
CREATE TABLE IF NOT EXISTS `casillas_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_id` int(11) NOT NULL,
  `empr_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_casillas` (`rc_id`),
  KEY `fk_empresa_casilla` (`empr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `casillas_empresas`
--

INSERT INTO `casillas_empresas` (`id`, `rc_id`, `empr_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 11, '2022-06-08 09:42:39', NULL, NULL),
(2, 4, 11, '2022-06-09 14:14:27', '2022-06-22 20:21:08', '2022-06-22 20:21:08'),
(3, 8, 11, '2022-06-09 14:14:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `id` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` int(4) NOT NULL,
  `estado_id` int(4) DEFAULT NULL,
  `pais_id` int(4) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  `c_cond_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos_x_empresa`
--

DROP TABLE IF EXISTS `contactos_x_empresa`;
CREATE TABLE IF NOT EXISTS `contactos_x_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE IF NOT EXISTS `empresas` (
  `empr_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`empr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`empr_id`, `user_id`, `empr_nombre`, `empr_ruc`, `empr_direccion`, `empr_telefono`, `empr_celular`, `empr_correo`, `empr_contacto`, `empr_estado`, `empr_ruta_img_reporte`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 8, 'Abogados S.A', '10438875820', 'adeconperuventas@gmail.com', '980560812', '980560812', 'adeconperuventas@gmail.com', NULL, 'ACTI', '', '2022-03-17 18:31:13', '2022-06-16 14:55:09', NULL),
(10, 9, 'FOREVER21', '20390247487', 'Av Los Precursores 593', '980560812', '5612937', 'elizabethcanaquiri@gmail.com', NULL, 'ACTI', NULL, '2022-03-17 18:42:40', '2022-03-17 18:42:40', NULL),
(11, 10, 'LUVANET modi', '20390247499', 'AV LA MOLINA 6521 modi', '45874199', '960203799', 'ventasmodi@luevanet.com', 'Ronny Tirado Bazan modi', 'ACTI', '', '2022-04-22 19:38:34', '2022-06-16 20:07:36', NULL),
(16, 15, 'Veronica pruen', '20122524153', 'mz g2 lote 16, H.A Daniel Alcides Carrión Sector \"C\" Los Olivos', '4543543', '5655654654', 'saavedraphp@gmail.com', NULL, 'ACTI', NULL, '2022-06-09 15:13:58', '2022-06-09 15:14:14', '2022-06-09 15:14:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(4) NOT NULL,
  `pais_id` int(4) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `esta_reloj` varchar(255) DEFAULT NULL,
  `estado` char(4) NOT NULL DEFAULT 'ACTI',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 NOT NULL,
  `queue` text CHARACTER SET utf8mb4 NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE IF NOT EXISTS `kardex` (
  `kard_id` int(11) NOT NULL AUTO_INCREMENT,
  `acta_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `lote_id` int(11) NOT NULL,
  `rc_id` int(11) DEFAULT NULL,
  `tipo_movimiento` varchar(45) DEFAULT NULL,
  `kard_cantidad` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kard_id`),
  KEY `fk_kardex_idx` (`prod_id`),
  KEY `fk_lote_idx` (`lote_id`),
  KEY `fk_acta_id_idx` (`acta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`kard_id`, `acta_id`, `prod_id`, `lote_id`, `rc_id`, `tipo_movimiento`, `kard_cantidad`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 12, 9999999, 8, 'INGRESO', 10, '2022-06-20 18:56:13', '2022-06-22 21:08:37', NULL),
(2, 1, 13, 9999999, 8, 'INGRESO', 10, '2022-06-20 18:56:13', '2022-06-22 21:08:37', NULL),
(3, 2, 11, 9999999, 8, 'INGRESO', 15, '2022-06-20 19:02:08', '2022-06-22 21:08:48', NULL),
(4, 2, 12, 9999999, 5, 'INGRESO', 15, '2022-06-20 19:02:08', '2022-06-22 21:08:48', NULL),
(5, 2, 13, 9999999, 5, 'INGRESO', 25, '2022-06-20 19:02:08', '2022-06-22 21:08:48', NULL),
(6, 3, 12, 9999999, NULL, 'DESPACHO', 5, '2022-06-20 19:58:03', NULL, NULL),
(7, 3, 13, 9999999, NULL, 'DESPACHO', 5, '2022-06-20 19:58:03', NULL, NULL),
(8, 3, 11, 9999999, NULL, 'DESPACHO', 4, '2022-06-20 19:58:03', NULL, NULL),
(9, 4, 12, 9999999, 7, 'INGRESO', 15, '2022-07-01 21:50:15', NULL, NULL),
(10, 4, 13, 9999999, 8, 'INGRESO', 3, '2022-07-01 21:50:15', NULL, NULL),
(11, 5, 12, 9999999, NULL, 'DESPACHO', 15, '2022-07-04 14:42:27', NULL, NULL),
(12, 5, 13, 9999999, NULL, 'DESPACHO', 3, '2022-07-04 14:42:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

DROP TABLE IF EXISTS `lotes`;
CREATE TABLE IF NOT EXISTS `lotes` (
  `lote_id` int(11) NOT NULL AUTO_INCREMENT,
  `lote_nombre` varchar(45) DEFAULT NULL,
  `lote_fecha_vencimiento` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lotes`
--

INSERT INTO `lotes` (`lote_id`, `lote_nombre`, `lote_fecha_vencimiento`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '9999999', '2030-12-30', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote_x_producto`
--

DROP TABLE IF EXISTS `lote_x_producto`;
CREATE TABLE IF NOT EXISTS `lote_x_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lote_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poducto_idx` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lote_x_producto`
--

INSERT INTO `lote_x_producto` (`id`, `lote_id`, `prod_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 9999999, 12, 20, '2022-06-20 18:56:13', '2022-07-04 14:42:27'),
(2, 9999999, 13, 30, '2022-06-20 18:56:13', '2022-07-04 14:42:27'),
(3, 9999999, 11, 11, '2022-06-20 19:02:08', '2022-06-20 19:58:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 25),
(2, 'App\\User', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(4) NOT NULL,
  `pais_nombre` varchar(150) NOT NULL,
  `estado_id` int(4) DEFAULT NULL,
  `pais_estado` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_COUNTRIES_NAME` (`pais_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('saavedraphp@gmail.com', '$2y$10$amjM0PXvbePv6.7MObNeSus8EW9ORFOvOMuYhalf.thX.AgMfkdh6', '2022-07-04 15:31:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.productos.index', 'Listado Productos', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24'),
(2, 'admin.productos.create', 'Crear Producto', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24'),
(3, 'admin.productos.edit', 'Editar Producto', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24'),
(4, 'admin.productos.destroy', 'Eliminar Producto', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_x_empresa`
--

DROP TABLE IF EXISTS `productos_x_empresa`;
CREATE TABLE IF NOT EXISTS `productos_x_empresa` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `fk_presentaciones_idx` (`unidad_id`),
  KEY `fk_empresas_idx` (`empr_id`),
  KEY `fk_categoria_producto_idx` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_x_empresa`
--

INSERT INTO `productos_x_empresa` (`prod_id`, `categoria_id`, `empr_id`, `unidad_id`, `prod_nombre`, `prod_codigo`, `prod_sku`, `prod_ean`, `prod_cantidad`, `prod_precio`, `prod_serie`, `prod_lote`, `prod_comentario`, `prod_stock`, `prod_fecha_vencimiento`, `prod_peso`, `prod_estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, NULL, 11, 5, 'PITAJAYA modi', NULL, 'LUVPITMEDD', NULL, NULL, NULL, NULL, NULL, 'COMENTAIOS MODI', 11, NULL, '2', NULL, '2022-04-25 18:17:15', '2022-05-18 15:34:19', NULL),
(12, NULL, 11, 5, 'GRANADA', NULL, 'LUVGRAMED', NULL, NULL, NULL, NULL, '5412', 'ADD', 20, '2022-04-25', '2', NULL, '2022-04-25 20:29:51', '2022-04-25 20:29:51', NULL),
(13, NULL, 11, 5, 'PALTA FUERTE GRADE', NULL, 'LUVPALGRA', NULL, NULL, NULL, NULL, '5210', 'ADD PALTA', 30, '2023-02-08', '1', NULL, '2022-04-25 20:31:32', '2022-04-25 20:31:32', NULL),
(14, NULL, 10, 5, 'Manzana Mediana', NULL, 'F12MANMED', NULL, NULL, NULL, NULL, NULL, 'MANZANA MEDIANA', 0, NULL, '1', NULL, '2022-05-03 18:44:08', '2022-05-03 18:45:49', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `racks`
--

DROP TABLE IF EXISTS `racks`;
CREATE TABLE IF NOT EXISTS `racks` (
  `rack_id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `racks`
--

INSERT INTO `racks` (`rack_id`, `rack_nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'RACK 1', '2022-04-25 20:49:39', '2022-06-07 18:51:23', NULL),
(4, 'RACK 2', '2022-04-25 20:49:47', '2022-06-07 18:51:25', NULL),
(5, 'RACK 3', '2022-06-16 20:20:39', '2022-06-16 20:20:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `racks_casillas`
--

DROP TABLE IF EXISTS `racks_casillas`;
CREATE TABLE IF NOT EXISTS `racks_casillas` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_id` int(11) NOT NULL,
  `rc_nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rc_id`),
  KEY `fk_rack_idx` (`rack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `racks_casillas`
--

INSERT INTO `racks_casillas` (`rc_id`, `rack_id`, `rc_nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 3, 'RACK 1-1', '2022-04-25 20:50:25', '2022-04-25 20:50:25', NULL),
(5, 3, 'RACK 1-2', '2022-04-25 20:50:44', '2022-04-25 20:50:44', NULL),
(6, 3, 'RACK 1-3', '2022-04-25 20:50:56', '2022-04-25 20:50:56', NULL),
(7, 4, 'RACK 2-1', '2022-05-12 21:05:48', '2022-05-12 21:05:48', NULL),
(8, 4, 'RACK 2-2', '2022-05-12 21:05:59', '2022-05-12 21:05:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_detalle`
--

DROP TABLE IF EXISTS `registro_detalle`;
CREATE TABLE IF NOT EXISTS `registro_detalle` (
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='	';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24'),
(2, 'Almacenero', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24'),
(3, 'Empresa', 'web', '2022-07-07 18:31:24', '2022-07-07 18:31:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keep` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS `tipo_documentos`;
CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `tipo_docu_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_docu_nombre` varchar(45) DEFAULT NULL,
  `tipo_docu_estado` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tipo_docu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `tipo_movimiento`;
CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `tm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tm_nombre` varchar(45) DEFAULT NULL,
  `tm_codigo` char(10) DEFAULT NULL,
  `tm_estado` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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

DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `id` int(11) NOT NULL,
  `unid_codigo` char(5) NOT NULL,
  `unid_nombre` varchar(45) DEFAULT NULL,
  `unid_orden` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id`, `unid_codigo`, `unid_nombre`, `unid_orden`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, '', 'UNIDAD', 1, '2022-03-17 05:00:00', '2022-04-25 05:00:00', NULL),
(2, '', 'ROLLO', 2, '2022-03-17 05:00:00', '2022-04-25 05:00:00', NULL),
(3, '', 'PAQUETE', 3, '2022-03-17 05:00:00', '2022-04-25 05:00:00', NULL),
(4, '', 'MILLAR', 4, '2022-03-17 05:00:00', '2022-04-25 05:00:00', NULL),
(5, 'CONO', 'CONO', 1, '2022-04-22 05:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'LUIS', 'saavedraphp@gmail.com', NULL, '$2y$10$MnNjH7pF.W2QLhD2NJYbTOv6QIoG4wlq3jxfXHU23/WRwMsCI1UNi', 'BwVxmVFzxkBHjxnqzoGxtO8gFd9TIE7YFVLteAFQBYSD44lobnuCdz7jyQ6r', NULL, '2022-07-04 21:00:40', NULL),
(3, 'Eduardo modi', 'egrillo@almagri.com', NULL, '$2y$10$04HZ6k.XV3c3hD3/xaCpP.XAWR112Buq2KBQoWQBkjITr44YSZzzS', 'Ur0tBO2qNwsgpMlU0jxMKDrpYncilYD69w1lbiMfO3mZugkjpcHC3SPtt1B8', '2021-02-26 05:22:30', '2022-07-06 20:49:00', NULL),
(8, 'Abogados S.A', 'adeconperuventas@gmail.com', NULL, '$2y$10$FoJcwBfziPsKAbQPG4dPC.ANdHHFn8ysO3br4PZQGp4esjOm.aczO', NULL, '2022-03-17 18:31:13', '2022-03-17 18:31:13', NULL),
(9, 'FOREVER21', 'elizabethcanaquiri@gmail.com', NULL, '$2y$10$LOZmpgbXswvvd6K0ga3tTepin40tsqdRx9TMuMenCnYhhWJAjoRr2', NULL, '2022-03-17 18:42:40', '2022-03-17 18:42:40', NULL),
(10, 'LUVANET', 'ventas@luevanet.com', NULL, '$2y$10$b2YmFSppkFmBFBmC0pSfruLRbUaQj0MSmJhPH7O7RGl41U.aH.XEG', NULL, '2022-04-22 19:38:33', '2022-04-22 19:38:33', NULL),
(15, 'Veronica pruen', 'saavedraphp@gmail.com', NULL, '$2y$10$trBT1aPpxrj/SQhim3ZByupRtCf3BS/6lRFtE/SMoazNlXt.Jntci', NULL, '2022-06-09 15:13:58', '2022-06-09 15:13:58', NULL),
(24, 'JESUS modi', 'saavedraphp2@gmail.com', NULL, '$2y$10$mT4gRzP3/6rKJ1prdY/ez.EenwCQThKa7ujb9JAFO2RZpeXTbuiz.', NULL, '2022-07-06 21:38:05', '2022-07-06 21:38:48', NULL),
(25, 'ALMACENERO 2', 'almacenero@gmil.coM', NULL, '$2y$10$MyhHFcMF3WecxYUctogSquCt7yS55fN16McEfo6SxS4.Xtz0tavlu', NULL, '2022-07-08 21:00:45', '2022-07-08 21:00:45', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usua_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`usua_id`),
  KEY `usuarios_pais_id_foreign` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_acta_id` FOREIGN KEY (`acta_id`) REFERENCES `actas` (`acta_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lote_x_producto`
--
ALTER TABLE `lote_x_producto`
  ADD CONSTRAINT `fk_poducto` FOREIGN KEY (`prod_id`) REFERENCES `productos_x_empresa` (`prod_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos_x_empresa`
--
ALTER TABLE `productos_x_empresa`
  ADD CONSTRAINT `fk_categoria_producto` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_producto` FOREIGN KEY (`empr_id`) REFERENCES `empresas` (`empr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_unidad_medida` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `racks_casillas`
--
ALTER TABLE `racks_casillas`
  ADD CONSTRAINT `fk_rack` FOREIGN KEY (`rack_id`) REFERENCES `racks` (`rack_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
