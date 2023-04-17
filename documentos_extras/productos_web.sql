-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 13-04-2023 a las 17:45:01
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `almagri_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_web`
--

CREATE TABLE `productos_web` (
  `id` int NOT NULL,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `categoria` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `precio` float(10,2) NOT NULL,
  `descuento` float(10,2) DEFAULT NULL,
  `precio_final` float(10,2) NOT NULL,
  `precio_compra` float(10,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `ruta_imagen` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_web`
--

INSERT INTO `productos_web` (`id`, `nombre`, `categoria`, `precio`, `descuento`, `precio_final`, `precio_compra`, `cantidad`, `ruta_imagen`, `estado`, `orden`, `created_at`, `updated_at`) VALUES
(1, 'Paleta Glitter', 'COSMETICOS', 20.00, NULL, 20.00, 10.00, 3, '1.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', '2023-04-13 14:38:05'),
(2, 'Ultrabond Preparadores', 'COSMETICOS', 18.00, NULL, 18.00, 15.00, 2, '2.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', '2023-04-13 14:51:26'),
(3, 'Labiales Neon Matte', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '3.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(4, 'Foreo Facial', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '4.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(5, 'Labial Matte', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '5.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(6, 'Iluminadores', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '6.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(7, 'Paleta Sombra', 'COSMETICOS', 25.00, NULL, 25.00, NULL, 1, '7.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(8, 'Polvos Acrilicos Nude', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '8.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(9, 'Brochas para Limpiar y aplicar polvo', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '9.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(10, 'Pinza cobertura curva C', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '10.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(11, 'Gel de Cejas', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '11.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(12, 'Vinchas de Maquillajes', 'COSMETICOS', 8.00, NULL, 8.00, NULL, 1, '12.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(13, 'Pinzas para Cejas', 'COSMETICOS', 8.00, NULL, 8.00, NULL, 1, '13.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(14, 'Esponja de maquillaje', 'COSMETICOS', 7.00, NULL, 7.00, NULL, 1, '14.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(15, 'Tazas love', 'OTROS', 10.00, NULL, 10.00, NULL, 1, '15.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(16, 'Labiales Matte', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '16.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(17, 'Paleta de Contornos y polvos', 'COSMETICOS', 22.00, NULL, 22.00, NULL, 1, '17.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(18, 'Paleta Glitter', 'COSMETICOS', 25.00, NULL, 25.00, NULL, 1, '18.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(19, 'Foil para diseño de uñas', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '19.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(20, 'Sombra Billeteras', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '20.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(21, 'Cortina de Baño Navideñas', 'COSMETICOS', 18.00, NULL, 18.00, NULL, 1, '22.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(22, 'Set de Brochas Difuminar', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '23.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(23, 'Base Liquida Efecto Matte', 'COSMETICOS', 20.00, NULL, 20.00, NULL, 1, '24.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(24, 'Paleta Correctoras', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '25.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(25, 'Paleta Sombra', 'COSMETICOS', 35.00, NULL, 35.00, 20.00, 0, '26.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', '2023-04-13 14:50:18'),
(26, 'Paleta Sombra', 'COSMETICOS', 35.00, NULL, 35.00, NULL, 1, '26.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(27, 'Corrector en Barra PW', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '27.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(28, 'Polvo Compacto', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '28.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(29, 'Corrector mas Contorno', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '29.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(30, 'Limpiador de Brochas', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '30.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(31, 'Set de brochas', 'COSMETICOS', 28.00, NULL, 28.00, NULL, 1, '31.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(32, 'Cartera con piedritas', 'COSMETICOS', 35.00, NULL, 35.00, NULL, 1, '32.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(33, 'Delineador - Ojos y Labios', 'COSMETICOS', 3.00, NULL, 3.00, NULL, 1, '33.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(34, 'Labiales Matte Liquido', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '34.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(35, 'PolyGel Powder Gel', 'COSMETICOS', 35.00, NULL, 35.00, NULL, 1, '35.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(36, 'Body Faja', 'COSMETICOS', 60.00, NULL, 60.00, NULL, 1, '36.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(37, 'Peine alisador', 'COSMETICOS', 40.00, NULL, 40.00, NULL, 1, '37.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(38, 'Primer de Ojos', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '38.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(39, 'Duo Correcto', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '39.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(40, 'Polvos Suelto HD', 'COSMETICOS', 25.00, NULL, 25.00, NULL, 1, '40.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(41, 'Labiales Matte', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '41.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(42, 'Mascarilla Hidratante', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '42.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(43, 'Maquillaje Iluminadores', 'COSMETICOS', 20.00, NULL, 20.00, NULL, 1, '43.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(44, 'Paleta Mini BREAKER', 'COSMETICOS', 18.00, NULL, 18.00, NULL, 1, '44.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(45, 'Polvo Compacto', 'COSMETICOS', 8.00, NULL, 8.00, NULL, 1, '45.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(46, 'Neceser para Cosmeticos', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '46.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(47, 'Repisa Humanoide', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '47.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(48, 'Mini Lampara', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '48.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(49, 'Set de cubiertos para niños', 'COSMETICOS', 8.00, NULL, 8.00, NULL, 1, '49.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(50, 'Monederos Hello Kitty', 'COSMETICOS', 5.00, NULL, 5.00, NULL, 1, '50.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(51, 'Polvos acrilicos CHIRIMOYA 15G', 'COSMETICOS', 25.00, NULL, 25.00, NULL, 1, '51.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(52, 'Pisos Navideñas', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '52.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(53, 'Cortina de Baño Navideñas', 'COSMETICOS', 18.00, NULL, 18.00, NULL, 1, '53.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(54, 'Tomatodos kawai', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '54.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(55, 'Kit uñas acrilicas 145', 'COSMETICOS', 145.00, NULL, 145.00, NULL, 1, '55.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(56, 'Pincel para acrilico kolinsky brush', 'COSMETICOS', 55.00, NULL, 55.00, NULL, 1, '56.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(57, 'Decoraciones para uñas acrilicas', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '57.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(58, 'Tips para uñas acrilicas', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '58.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(59, 'Morral para hombres', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '59.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(60, 'Set de cuchillos pasteles', 'COSMETICOS', 40.00, NULL, 40.00, NULL, 1, '60.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(61, 'Almohadas biscoelasticas para niños', 'COSMETICOS', 25.00, NULL, 25.00, NULL, 1, '61.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(62, 'Vasos tomatodos Unicornio', 'COSMETICOS', 20.00, NULL, 20.00, NULL, 1, '62.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(63, 'Mini cartera para mujer', 'COSMETICOS', 20.00, NULL, 20.00, NULL, 1, '63.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(64, 'Morral para dama', 'COSMETICOS', 25.00, NULL, 25.00, NULL, 1, '64.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(65, 'Subcionador de espinillas', 'COSMETICOS', 35.00, NULL, 35.00, NULL, 1, '65.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(66, 'Joyero remo', 'COSMETICOS', 12.00, NULL, 12.00, NULL, 1, '66.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(67, 'Mesa Plegable Para Laptop Tablet Con Posa Vaso Modelo', 'COSMETICOS', 35.00, NULL, 35.00, NULL, 1, '67.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(68, 'Porta lapiceros kawaii', 'COSMETICOS', 7.00, NULL, 7.00, NULL, 1, '68.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(69, 'Removedor de esmaltes', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '69.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(70, 'Faja reloj de arena', 'COSMETICOS', 45.00, NULL, 45.00, NULL, 1, '70.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(71, 'Cepillo alisador', 'COSMETICOS', 40.00, NULL, 40.00, NULL, 1, '71.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(72, 'Cepillo multifuncional', 'COSMETICOS', 10.00, NULL, 10.00, NULL, 1, '72.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL),
(73, 'Acrilicos clear', 'COSMETICOS', 15.00, NULL, 15.00, NULL, 1, '73.jpg', 'ACTIVO', 1, '2023-04-06 05:00:00', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos_web`
--
ALTER TABLE `productos_web`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos_web`
--
ALTER TABLE `productos_web`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
