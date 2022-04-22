-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-04-2022 a las 14:41:46
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
  `serv_id` int(11) NOT NULL COMMENT '- alamacenamiento\n- Picking\n',
  `acta_encargado_id` int(11) DEFAULT NULL,
  `acta_supervisor_id` int(11) DEFAULT NULL,
  `contrato_id` int(11) DEFAULT NULL,
  `acta_sub_cliente` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `acta_numero_ingr_sali` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `acta_costo` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `acta_fecha_ini` datetime DEFAULT NULL,
  `acta_fecha_fin` datetime DEFAULT NULL,
  `acta_comentario` longtext CHARACTER SET utf8mb4,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`acta_id`),
  KEY `fk_empresas_idx` (`empr_id`),
  KEY `fk_servicios_x_acta_idx` (`serv_id`),
  KEY `fk_tipo_documentos_x_acta_idx` (`tipo_docu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='																			';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`empr_id`, `user_id`, `empr_nombre`, `empr_ruc`, `empr_direccion`, `empr_telefono`, `empr_celular`, `empr_correo`, `empr_contacto`, `empr_estado`, `empr_ruta_img_reporte`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 8, 'Abogados S.A', '10438875820', 'adeconperuventas@gmail.com', '980560812', '980560812', 'adeconperuventas@gmail.com', NULL, 'ACTI', NULL, '2022-03-17 18:31:13', '2022-03-17 18:31:13', NULL),
(10, 9, 'FOREVER21', '20390247487', 'Av Los Precursores 593', '980560812', '5612937', 'elizabethcanaquiri@gmail.com', NULL, 'ACTI', NULL, '2022-03-17 18:42:40', '2022-03-17 18:42:40', NULL);

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
  `kard_cantidad` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kard_id`),
  KEY `fk_kardex_idx` (`prod_id`),
  KEY `fk_actas_idx` (`acta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'App\\User', 1);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.productos.index', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(2, 'admin.productos.create', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(3, 'admin.productos.edit', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(4, 'admin.productos.destroy', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01');

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
  `prod_fecha_vencimiento` timestamp NULL DEFAULT NULL,
  `prod_estado` char(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `fk_presentaciones_idx` (`unidad_id`),
  KEY `fk_empresas_idx` (`empr_id`),
  KEY `fk_categoria_producto_idx` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_x_empresa`
--

INSERT INTO `productos_x_empresa` (`prod_id`, `categoria_id`, `empr_id`, `unidad_id`, `prod_nombre`, `prod_codigo`, `prod_sku`, `prod_ean`, `prod_cantidad`, `prod_precio`, `prod_serie`, `prod_lote`, `prod_comentario`, `prod_stock`, `prod_fecha_vencimiento`, `prod_estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, NULL, 9, 1, 'Monomero 15ml', '09009MO03030', NULL, NULL, NULL, NULL, NULL, NULL, 'MONOMERO', 0, NULL, NULL, '2022-03-17 18:39:45', '2022-03-17 18:39:45', NULL),
(10, NULL, 10, 1, 'Polvos Acrilicos 30G', 'PAFS3000001', NULL, NULL, NULL, NULL, NULL, NULL, 'POLVOS ACRILICOS', 0, NULL, NULL, '2022-04-20 19:11:24', '2022-04-20 19:11:24', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(2, 'Almacenero', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01'),
(3, 'Empresa', 'web', '2022-04-22 14:34:01', '2022-04-22 14:34:01');

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
-- Estructura de tabla para la tabla `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios` (
  `serv_id` int(11) NOT NULL AUTO_INCREMENT,
  `serv_nombre` varchar(45) DEFAULT NULL,
  `serv_codigo` char(6) DEFAULT NULL,
  `serv_estado` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`serv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

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
(1, '', 'UNIDAD', 1, '2022-03-17 05:00:00', NULL, NULL),
(2, '', 'ROLLO', 2, '2022-03-17 05:00:00', NULL, NULL),
(3, '', 'PAQUETE', 3, '2022-03-17 05:00:00', NULL, NULL),
(4, '', 'MILLAR', 4, '2022-03-17 05:00:00', NULL, NULL);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Luis', 'saavedraphp@gmail.com', NULL, '$2y$12$P3DK3QkU/VicHL5fj1ZLSOFWyyFie4BouEuyx81ZcBP6Omtqjjs/6', 'ycWnW9nHd4O9kKJOYU7M1RVQSbdYDhZZKXghoahtLTLkax2b1T67OowBzGn3', NULL, NULL),
(2, 'Usuario Demo', 'demo@gmail.com', NULL, '$2y$10$ebXJfHGWbAOXZO9KK029.eES/HkZQKOcMcs.ejkY8zNot.YkhW3yK', 'M12SVMyqRiGYYztYUXpkPLXaFNaUgps1CtAJUtLdsA5W0GYz30RTsE7alVPH', '2021-02-23 03:41:09', '2021-02-23 03:41:09'),
(3, 'Eduardo', 'egrillo@almagri.com', NULL, '$2y$12$P3DK3QkU/VicHL5fj1ZLSOFWyyFie4BouEuyx81ZcBP6Omtqjjs/6', 'OR3KT630lrbL8FRCYD7JeXiJamHYDga67x3zZrdq6hVOUWUHId3nQ7mDttwa', '2021-02-26 05:22:30', '2021-03-02 23:18:11'),
(8, 'Abogados S.A', 'adeconperuventas@gmail.com', NULL, '$2y$10$FoJcwBfziPsKAbQPG4dPC.ANdHHFn8ysO3br4PZQGp4esjOm.aczO', NULL, '2022-03-17 18:31:13', '2022-03-17 18:31:13'),
(9, 'FOREVER21', 'elizabethcanaquiri@gmail.com', NULL, '$2y$10$LOZmpgbXswvvd6K0ga3tTepin40tsqdRx9TMuMenCnYhhWJAjoRr2', NULL, '2022-03-17 18:42:40', '2022-03-17 18:42:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
