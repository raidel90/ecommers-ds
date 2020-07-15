-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2020 at 12:28 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `german_ecommerce_ds`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(11) DEFAULT NULL,
  `shop_link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `code` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci,
  `beneficios` longtext COLLATE utf8mb4_unicode_ci,
  `uso_sugerido` longtext COLLATE utf8mb4_unicode_ci,
  `advertencia` longtext COLLATE utf8mb4_unicode_ci,
  `sabores` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion_imagen` longtext COLLATE utf8mb4_unicode_ci,
  `brandscategories_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '999',
  `active` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles_flavors`
--

CREATE TABLE `articles_flavors` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `flavor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brandscategory_id` int(11) DEFAULT NULL,
  `image_preview` text COLLATE utf8mb4_unicode_ci,
  `image_detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `global_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `brandscategory_id`, `image_preview`, `image_detail`, `created_at`, `updated_at`, `deleted_at`, `global_name`, `order`) VALUES
(50, 'La Casa de los Condimentos', 'la-casa-de-los-condimentos', NULL, NULL, NULL, '2020-06-03 09:44:02', '2020-06-03 09:44:02', NULL, 'nacional', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brandscategories`
--

CREATE TABLE `brandscategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image_preview` text COLLATE utf8mb4_unicode_ci,
  `image_detail` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `show_on_front` int(11) DEFAULT '1',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brandscategories`
--

INSERT INTO `brandscategories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `image_preview`, `image_detail`, `slug`, `order`, `description`, `show_on_front`, `icon`) VALUES
(28, 'Frutos Secos', '2020-06-03 09:24:20', '2020-06-11 11:56:35', NULL, NULL, NULL, 'frutos-secos', NULL, NULL, 0, 'imind-feather'),
(29, 'Frutos Deshidratados', '2020-06-03 09:25:18', '2020-06-08 06:29:57', NULL, NULL, NULL, 'frutos-deshidratados', NULL, NULL, 1, 'icon54-v2-mango'),
(31, 'Condimentos', '2020-06-03 09:26:17', '2020-06-08 06:29:30', NULL, NULL, NULL, 'condimentos', NULL, NULL, 1, 'icon54-v4-eggs-1'),
(32, 'Semillas', '2020-06-03 09:27:16', '2020-06-08 06:28:46', NULL, 'brandscategories/June2020/hvXOxBiQKqkgUwStKqCZ.png', NULL, 'semillas', NULL, NULL, 1, 'icon54-v2-pecan'),
(33, 'Harinas', '2020-06-11 11:53:57', '2020-06-11 11:55:26', NULL, NULL, NULL, 'harinas', NULL, NULL, 1, 'imind-feather');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`, `icono`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-01-11 15:38:06', '2019-01-11 15:38:06', ''),
(2, NULL, 1, 'Category 2', 'category-2', '2019-01-11 18:38:06', '2019-01-11 18:38:06', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Contraseña', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(22, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 6),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'name', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\",\"messages\":{\"required\":\"El campo :attribute es requerido.\",\"max\":\"El largo m\\u00e1ximo del campo :attribute es :max.\"}},\"display\":{\"width\":\"3\",\"id\":\"name\"}}', 2),
(59, 7, 'description', 'rich_text_box', 'Descripción', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo :attribute es requerido.\"}}}', 14),
(60, 7, 'image', 'multiple_images', 'Imágen', 0, 0, 1, 1, 1, 1, '{}', 9),
(61, 7, 'brand_id', 'number', 'Brand Id', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo :attribute es requerido.\"}}}', 10),
(62, 7, 'shop_link', 'checkbox', 'Destacar', 0, 1, 1, 1, 1, 1, '{\"on\":\"Si\",\"off\":\"No\",\"display\":{\"width\":\"1\",\"id\":\"destacar\"}}', 8),
(63, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 15),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(65, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 17),
(66, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 8, 'name', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(69, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(70, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 6),
(71, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(72, 9, 'name', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(73, 9, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:brands,slug\"}}', 3),
(75, 9, 'image_preview', 'image', 'Imágen de muestra', 0, 0, 0, 0, 0, 0, '{\"resize\":{\"width\":\"150\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true}', 5),
(76, 9, 'image_detail', 'image', 'Imágen en detalle', 0, 0, 0, 0, 0, 0, '{}', 6),
(77, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(79, 9, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(80, 7, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:products,slug\"},\"display\":{\"width\":\"3\",\"id\":\"slug\"}}', 3),
(81, 7, 'product_belongsto_brand_relationship', 'relationship', 'Marca', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(82, 9, 'brand_belongsto_brandscategory_relationship', 'relationship', 'Categoría', 0, 0, 0, 0, 0, 0, '{\"model\":\"App\\\\Brandscategory\",\"table\":\"brandscategories\",\"type\":\"belongsTo\",\"column\":\"brandscategory_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(83, 8, 'image_preview', 'image', 'Imágen de muestra', 0, 1, 1, 1, 1, 1, '{}', 7),
(84, 8, 'image_detail', 'image', 'Imágen en detalle', 0, 0, 1, 1, 1, 1, '{}', 8),
(85, 8, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:brandscategories,slug\"}}', 9),
(86, 9, 'brandscategory_id', 'text', 'Brandscategory Id', 0, 0, 0, 0, 0, 0, '{}', 4),
(87, 7, 'price', 'text', 'Precio', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\",\"messages\":{\"required\":\"El campo :attribute es requerido.\",\"max\":\"El largo m\\u00e1ximo del campo :attribute es :max.\"}},\"display\":{\"width\":\"1\",\"id\":\"price\"}}', 4),
(88, 7, 'discount', 'number', 'Descuento', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\",\"messages\":{\"required\":\"El campo :attribute es requerido.\",\"max\":\"El largo m\\u00e1ximo del campo :attribute es :max.\"}},\"display\":{\"width\":\"1\",\"id\":\"discount\"}}', 5),
(89, 7, 'code', 'text', 'Código', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\",\"messages\":{\"required\":\"El campo :attribute es requerido.\",\"max\":\"El largo m\\u00e1ximo del campo :attribute es :max.\"}},\"display\":{\"width\":\"1\",\"id\":\"code\"}}', 6),
(90, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(91, 10, 'image', 'image', 'Imágen', 0, 1, 1, 1, 1, 1, '{}', 2),
(92, 10, 'title', 'text', 'Título', 0, 1, 1, 1, 1, 1, '{}', 3),
(93, 10, 'description', 'text', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 4),
(94, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(95, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(96, 10, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(97, 10, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{}', 8),
(98, 10, 'order', 'number', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 9),
(99, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(100, 11, 'name', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(101, 11, 'logo', 'image', 'Logo', 0, 1, 1, 1, 1, 1, '{}', 3),
(102, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(103, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(104, 11, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 6),
(105, 9, 'global_name', 'select_dropdown', 'Tipo', 0, 1, 1, 1, 1, 1, '{\"default\":\"nacional\",\"options\":{\"nacional\":\"Nacional\",\"importada\":\"Importada\",\"otras\":\"Otras Marcas\"}}', 10),
(106, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(107, 12, 'name', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(108, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(109, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(110, 12, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 5),
(113, 8, 'order', 'number', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 10),
(114, 8, 'description', 'rich_text_box', 'Descripción', 0, 0, 1, 1, 1, 1, '{}', 11),
(115, 8, 'show_on_front', 'checkbox', 'Mostrar en el home', 0, 1, 1, 1, 1, 1, '{}', 12),
(116, 13, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(117, 13, 'reference', 'text', 'Referencia', 0, 0, 1, 0, 0, 0, '{}', 2),
(118, 13, 'payu_order_id', 'text', 'Payu OrdenID', 0, 0, 1, 0, 0, 0, '{}', 3),
(119, 13, 'transaction_id', 'text', 'Transacción ID', 0, 0, 1, 0, 0, 0, '{}', 4),
(120, 13, 'state', 'text', 'Estado del Pago', 0, 1, 1, 1, 0, 0, '{}', 5),
(121, 13, 'value', 'text', 'Valor', 0, 1, 1, 1, 1, 1, '{}', 6),
(122, 13, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 7),
(123, 13, 'amount', 'text', 'Monto', 0, 0, 1, 0, 0, 0, '{}', 8),
(124, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(125, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(126, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(127, 13, 'order_belongstomany_product_relationship', 'relationship', 'Productos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"orders_products\",\"pivot\":\"1\",\"taggable\":\"0\"}', 12),
(128, 7, 'images', 'image', 'Imágen de muestra en descripción', 0, 0, 0, 0, 0, 0, '{}', 22),
(129, 7, 'beneficios', 'rich_text_box', 'Beneficios', 0, 0, 0, 0, 0, 0, '{}', 18),
(130, 7, 'uso_sugerido', 'rich_text_box', 'Uso Sugerido', 0, 0, 0, 0, 0, 0, '{}', 19),
(131, 7, 'advertencia', 'rich_text_box', 'Advertencias', 0, 0, 0, 0, 0, 0, '{}', 20),
(133, 7, 'descripcion_imagen', 'rich_text_box', 'Descripción Imagen de muestra', 0, 0, 0, 0, 0, 0, '{}', 24),
(134, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(135, 14, 'title', 'text', 'Título', 0, 1, 1, 1, 1, 1, '{}', 2),
(136, 14, 'description', 'rich_text_box', 'Descripción', 0, 1, 1, 1, 1, 1, '{}', 3),
(137, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(138, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(139, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 6),
(140, 7, 'product_belongsto_brandscategory_relationship', 'relationship', 'Categoría', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Brandscategory\",\"table\":\"brandscategories\",\"type\":\"belongsTo\",\"column\":\"brandscategories_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(141, 7, 'brandscategories_id', 'text', 'Brandscategories Id', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"El campo :attribute es requerido.\"}}}', 23),
(142, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(143, 15, 'name', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(144, 15, 'product_id', 'text', 'Descuento', 0, 0, 1, 1, 1, 1, '{}', 3),
(145, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(146, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(147, 15, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 6),
(150, 13, 'date', 'text', 'Fecha', 0, 1, 1, 0, 0, 0, '{}', 12),
(151, 9, 'order', 'text', 'Orden', 0, 1, 1, 1, 1, 1, '{}', 11),
(152, 7, 'order', 'text', 'Orden', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\",\"messages\":{\"required\":\"El campo :attribute es requerido.\",\"max\":\"El largo m\\u00e1ximo del campo :attribute es :max.\"}},\"display\":{\"width\":\"1\",\"id\":\"order\"}}', 7),
(153, 10, 'mobile', 'checkbox', 'Es para móvil', 0, 1, 1, 1, 1, 1, '{\"on\":\"Si\",\"off\":\"No\",\"display\":{\"width\":\"1\",\"id\":\"mobile\"}}', 10),
(202, 7, 'active', 'checkbox', 'Activo', 0, 1, 1, 1, 1, 1, '{\"on\":\"Si\",\"off\":\"No\",\"display\":{\"width\":\"1\",\"id\":\"activo\"}}', 22),
(205, 13, 'estadoTx', 'text', 'Estado Tx', 0, 0, 1, 0, 0, 0, '{}', 13),
(206, 13, 'lapPaymentMethod', 'text', 'Metodo de Pago Lap', 0, 0, 1, 0, 0, 0, '{}', 14),
(207, 13, 'pseBank', 'text', 'Banco PSE', 0, 0, 1, 0, 0, 0, '{}', 15),
(208, 13, 'extra1', 'text', 'Extra', 0, 0, 1, 0, 0, 0, '{}', 16),
(209, 13, 'cus', 'text', 'CUS', 0, 0, 1, 0, 0, 0, '{}', 17),
(210, 13, 'transactionState', 'text', 'Estado Transacción', 0, 0, 1, 0, 0, 0, '{}', 18),
(211, 13, 'currency', 'text', 'Moneda', 0, 0, 0, 0, 0, 0, '{}', 19),
(212, 13, 'referenceCode', 'text', 'Código de Referencia', 0, 0, 1, 0, 0, 0, '{}', 20),
(213, 13, 'description', 'text', 'Description', 0, 0, 1, 0, 0, 0, '{}', 21),
(214, 13, 'TX_VALUE', 'text', 'TX VALUE', 0, 0, 1, 0, 0, 0, '{}', 22),
(215, 13, 'reference_pol', 'text', 'Referencia Pol', 0, 0, 1, 0, 0, 0, '{}', 23),
(216, 13, 'transactionId', 'text', 'Transaction ID', 0, 0, 1, 0, 0, 0, '{}', 24),
(217, 13, 'loteryNumber', 'text', 'Número de Lotería', 0, 0, 1, 0, 0, 0, '{}', 25),
(218, 13, 'stateCode', 'select_dropdown', 'Estado', 1, 1, 1, 1, 1, 1, '{\"default\":\"option1\",\"options\":{\"0\":\"Cancelado\",\"1\":\"Ingresado\",\"2\":\"En camino\",\"3\":\"Entregado\"}}', 26),
(219, 13, 'order_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"articles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 27),
(220, 4, 'icono', 'image', 'Icono', 1, 1, 1, 1, 1, 1, '{}', 5),
(221, 8, 'icon', 'text', 'Icono', 0, 0, 1, 1, 1, 1, '{}', 3),
(222, 7, 'tamaños', 'text', 'Tamaños', 0, 0, 0, 0, 0, 0, '{}', 18),
(223, 7, 'presentation', 'text', 'Presentation', 1, 0, 0, 0, 0, 0, '{}', 12),
(224, 15, 'price', 'text', 'Precio', 0, 1, 1, 1, 1, 1, '{}', 7),
(237, 7, 'product_belongstomany_presentacione_relationship', 'relationship', 'presentaciones', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Presentacione\",\"table\":\"presentaciones\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nombre_producto_relacion\",\"pivot_table\":\"product_presentacion_pivote\",\"pivot\":\"1\",\"taggable\":\"on\"}', 25),
(238, 15, 'flavor_belongstomany_product_relationship', 'relationship', 'productos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"flavor_product_pivote\",\"pivot\":\"1\",\"taggable\":\"on\"}', 8),
(239, 1, 'email_verified_at', 'timestamp', 'Email Verificado', 0, 1, 1, 1, 1, 1, '{}', 6),
(240, 1, 'address', 'text', 'Dirección', 0, 1, 1, 1, 1, 1, '{}', 12),
(241, 1, 'city', 'text', 'Ciudad', 0, 1, 1, 1, 1, 1, '{}', 13),
(242, 1, 'state', 'text', 'Departamento', 0, 1, 1, 1, 1, 1, '{}', 14),
(243, 1, 'zip', 'text', 'Zip', 0, 1, 1, 1, 1, 1, '{}', 15),
(244, 1, 'country', 'text', 'País', 0, 1, 1, 1, 1, 1, '{}', 16),
(245, 1, 'phone', 'text', 'Teléfono', 0, 1, 1, 1, 1, 1, '{}', 17),
(246, 1, 'dni', 'text', 'Dni', 0, 1, 1, 1, 1, 1, '{}', 18),
(247, 1, 'cardname', 'text', 'Nombre de la tarjeta', 0, 1, 1, 1, 1, 1, '{}', 19),
(248, 1, 'cardnumber', 'text', 'Numero de tarjeta', 0, 1, 1, 1, 1, 1, '{}', 20),
(249, 1, 'cardexpmonth', 'text', 'Mes de vencimiento tarjeta', 0, 1, 1, 1, 1, 1, '{}', 21),
(250, 1, 'cardexpyear', 'text', 'Año de vencimiento tarjeta', 0, 1, 1, 1, 1, 1, '{}', 22),
(251, 1, 'cardcvv', 'text', 'Card cvv', 0, 1, 1, 1, 1, 1, '{}', 23),
(252, 1, 'active', 'text', 'Active', 1, 1, 1, 1, 1, 1, '{}', 24),
(253, 1, 'activation_token', 'text', 'Activación Token', 1, 1, 1, 1, 1, 1, '{}', 25),
(254, 22, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(255, 22, 'nombre_imagen', 'text', 'Nombre Imagen', 0, 1, 1, 1, 1, 1, '{}', 2),
(256, 22, 'imagen', 'image', 'Imagen', 1, 1, 1, 1, 1, 1, '{}', 3),
(257, 22, 'mostrar', 'checkbox', 'Mostrar', 0, 1, 1, 1, 1, 1, '{}', 4),
(258, 22, 'created_at', 'timestamp', 'Fecha de creación', 0, 1, 1, 1, 0, 1, '{}', 5),
(259, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(260, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 7),
(261, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(262, 23, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(263, 23, 'nombre_producto_relacion', 'text', 'Nombre Producto Relacion', 0, 1, 1, 1, 1, 1, '{}', 3),
(264, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(265, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(266, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 6),
(267, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(268, 26, 'valor', 'text', 'Valor', 0, 1, 1, 1, 1, 1, '{}', 2),
(269, 26, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(270, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(271, 26, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 5),
(272, 15, 'descuento', 'text', 'Descuento', 0, 1, 1, 1, 1, 1, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-01-11 15:38:04', '2020-06-22 16:33:09'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-01-11 15:38:06', '2020-06-03 09:32:28'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(7, 'products', 'products', 'Producto', 'Productos', 'voyager-shop', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-01-12 00:10:44', '2020-06-22 12:28:18'),
(8, 'brandscategories', 'brandscategories', 'Categoría', 'Categorías', 'voyager-categories', 'App\\Brandscategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-01-12 00:21:27', '2020-06-22 16:22:25'),
(9, 'brands', 'brands', 'Marca', 'Marcas', 'voyager-receipt', 'App\\Brand', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-01-12 00:23:31', '2020-06-22 16:23:20'),
(10, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-window-list', 'App\\Slider', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-01-12 12:21:12', '2019-04-03 18:44:09'),
(11, 'dealers', 'dealers', 'Dealer', 'Dealers', 'voyager-truck', 'App\\Dealer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-01-12 13:56:36', '2019-01-12 13:56:36'),
(12, 'productsgroups', 'productsgroups', 'Productsgroup', 'Productsgroups', 'voyager-list', 'App\\Productsgroup', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-01-16 21:00:00', '2019-01-16 21:00:00'),
(13, 'orders', 'orders', 'Orden', 'Ordenes', 'voyager-basket', 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-02-05 06:59:18', '2020-06-22 12:48:29'),
(14, 'faqs', 'faqs', 'Faq', 'Faqs', 'voyager-question', 'App\\Faq', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-08 12:04:08', '2019-02-08 12:04:08'),
(15, 'flavors', 'flavors', 'Precio', 'Precios', NULL, 'App\\Flavor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-03-01 20:30:06', '2020-06-25 15:24:06'),
(22, 'instagramfeeds', 'instagramfeeds', 'Instagram feed', 'Instagram feeds', 'voyager-photos', 'App\\Instagramfeed', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-23 00:12:35', '2020-06-23 00:46:40'),
(23, 'presentaciones', 'presentaciones', 'Presentacione', 'Presentaciones', NULL, 'App\\Presentacione', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-23 00:57:11', '2020-06-23 00:57:11'),
(24, 'product_presentacion_pivote', 'product-presentacion-pivote', 'Product Presentacion Pivote', 'Product Presentacion Pivotes', NULL, 'App\\ProductPresentacionPivote', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-23 00:57:39', '2020-06-23 00:57:39'),
(25, 'presentacion_precio_pivote', 'presentacion-precio-pivote', 'Presentacion Precio Pivote', 'Presentacion Precio Pivotes', NULL, 'App\\PresentacionPrecioPivote', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-23 00:58:02', '2020-06-23 00:58:02'),
(26, 'precios', 'precios', 'Precio', 'Precios', NULL, 'App\\Precio', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-23 00:58:43', '2020-06-23 00:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `name`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'Exito', 'dealers/January2019/KfXm6fVZI5UHNMrlaaMT.png', '2019-01-14 16:12:09', '2019-01-18 14:35:06', NULL),
(6, 'Linio', 'dealers/January2019/t7yA9LGbslSCzLEUgH20.png', '2019-01-14 16:13:16', '2019-01-18 14:34:56', NULL),
(7, 'Olimpica', 'dealers/January2019/k6bAIrSnsVWbhviCFTsY.png', '2019-01-14 16:13:46', '2019-01-18 14:42:53', NULL),
(8, 'Homecenter', 'dealers/January2019/2ftuS6S1lwVEwTEORYWN.png', '2019-01-14 16:14:16', '2019-01-18 14:42:42', NULL),
(9, 'Home Sentry', 'dealers/January2019/CDBE98a0trnrM19lp2HK.png', '2019-01-15 20:51:32', '2019-01-18 14:34:19', NULL),
(10, 'Mercado Libr', 'dealers/January2019/iAQOOFrqwNuTu0gFsFK3.png', '2019-01-15 20:52:08', '2019-01-18 14:34:07', NULL),
(11, 'Jumbo', 'dealers/January2019/BIzQrUKd5ufGbJAJfOPC.png', '2019-01-15 20:52:31', '2019-01-18 14:29:00', NULL),
(12, 'Metro', 'dealers/January2019/GMUwJMU7s6KOdrpuOGEB.png', '2019-01-15 20:52:47', '2019-01-18 14:33:50', NULL),
(13, 'Easy', 'dealers/January2019/sKg8eWxvk4ybTFjzsiKV.png', '2019-01-15 20:53:01', '2019-01-18 14:36:32', NULL),
(14, 'Carrulla', 'dealers/January2019/6JqrDi638rV3POy3WJhy.png', '2019-01-19 06:11:28', '2019-01-19 06:11:28', NULL),
(15, 'DollarCity', 'dealers/January2019/dy83aPUBV8xWLF1eMmsB.png', '2019-01-19 06:11:48', '2019-01-19 06:11:48', NULL),
(16, 'Los 3 Elefantes', 'dealers/January2019/MZDdHUPvnD8ZV3uBlWAS.png', '2019-01-19 06:12:06', '2019-01-19 06:12:06', NULL),
(17, 'D1', 'dealers/January2019/DtADYB4XlhnWGMJoNhD3.png', '2019-01-19 06:12:19', '2019-01-19 06:18:06', NULL),
(18, 'La 14', 'dealers/January2019/J0jH3mbzCyTE82F7YprL.png', '2019-01-19 06:12:47', '2019-01-19 06:17:54', NULL),
(19, 'Oxxo', 'dealers/January2019/JS9kDPzU28rvRcngcs4O.png', '2019-01-19 06:13:18', '2019-01-19 06:17:42', NULL),
(20, 'Surtimax', 'dealers/January2019/MOTFc2eL96vjG6Dym0EJ.png', '2019-01-19 06:13:41', '2019-01-19 06:13:41', NULL),
(21, 'Colsubsidio', 'dealers/January2019/4YNdhhFrg6UerOYGIHrg.png', '2019-01-19 06:14:01', '2019-01-19 06:14:01', NULL),
(22, 'Super Inter', 'dealers/January2019/3zwmWKoLZ4jmkeq8b0nH.png', '2019-01-19 06:14:20', '2019-01-19 06:14:20', NULL),
(23, 'Panamericana', 'dealers/January2019/Q8ichrlIWa7brpFtQFHp.png', '2019-01-19 06:14:42', '2019-01-19 06:17:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '¿Como encargar un pedido?', '<p><span style=\"color: #232323; font-family: Poppins, sans-serif; font-size: 17.6px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, voluptas explicabo molestiae tempore natus velit sed aliquam ut! Culpa asperiores, error ullam qui! Commodi nobis distinctio aperiam totam perferendis quas.</span></p>', '2019-02-08 12:04:52', '2019-02-08 12:04:52', NULL),
(2, 'Cupones de pago y promociones', '<p><span style=\"color: #232323; font-family: Poppins, sans-serif; font-size: 17.6px;\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus, voluptas explicabo molestiae tempore natus velit sed aliquam ut! Culpa asperiores, error ullam qui! Commodi nobis distinctio aperiam totam perferendis quas.</span></p>', '2019-02-08 12:05:04', '2019-02-08 12:05:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flavors`
--

CREATE TABLE `flavors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flavors`
--

INSERT INTO `flavors` (`id`, `name`, `product_id`, `created_at`, `updated_at`, `deleted_at`, `price`, `descuento`) VALUES
(42, '500 mg', NULL, '2020-06-03 09:59:26', '2020-06-15 15:27:30', NULL, 50000, NULL),
(43, 'Una Tonelada', NULL, '2020-06-03 09:59:52', '2020-06-19 07:09:15', NULL, 1200000, NULL),
(44, 'Un bulto', NULL, '2020-06-03 10:00:30', '2020-06-15 15:27:04', NULL, 30000, NULL),
(45, '500 mg', 431, '2020-06-19 09:20:54', '2020-06-19 09:20:54', NULL, 14000, NULL),
(46, 'Bulto', NULL, '2020-06-19 09:21:33', '2020-06-25 15:25:04', NULL, 50000, 18000),
(47, '500 mg', NULL, '2020-06-19 22:15:52', '2020-06-25 15:24:50', NULL, 60000, 15000),
(48, '500 mg', NULL, '2020-06-20 16:43:41', '2020-06-25 15:24:38', NULL, 45000, 12000),
(49, '500 mg', 0, '2020-06-29 09:03:14', '2020-06-29 09:03:50', NULL, 60000, 20000),
(50, 'Unidad', NULL, '2020-06-29 09:46:36', '2020-06-29 09:46:36', NULL, 5000, 2000),
(51, '500 mg', NULL, '2020-06-29 09:49:20', '2020-06-29 09:49:20', NULL, 15000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `flavor_product_pivote`
--

CREATE TABLE `flavor_product_pivote` (
  `id` int(10) UNSIGNED NOT NULL,
  `flavor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flavor_product_pivote`
--

INSERT INTO `flavor_product_pivote` (`id`, `flavor_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 46, 396, NULL, NULL, NULL),
(2, 47, 396, NULL, NULL, NULL),
(3, 48, 397, NULL, NULL, NULL),
(4, 49, 398, NULL, NULL, NULL),
(5, 50, 399, NULL, NULL, NULL),
(6, 51, 400, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `instagramfeeds`
--

CREATE TABLE `instagramfeeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_imagen` text COLLATE utf8mb4_unicode_ci,
  `imagen` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mostrar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instagramfeeds`
--

INSERT INTO `instagramfeeds` (`id`, `nombre_imagen`, `imagen`, `mostrar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pernil de cerdo', 'instagramfeeds/June2020/Yx2N4uhctWnBZLYQQjCf.jpg', '1', '2020-06-23 00:22:00', '2020-06-23 00:24:36', NULL),
(2, 'Jamon pizza', 'instagramfeeds/June2020/fTEcj2gnPJ4Dur9vGaDb.jpg', '1', '2020-06-23 00:23:13', '2020-06-23 00:23:13', NULL),
(3, 'Jamon de pollo', 'instagramfeeds/June2020/fsbfeaW46LT3wcaLMZiw.jpg', '1', '2020-06-23 00:24:00', '2020-06-23 00:38:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kits`
--

CREATE TABLE `kits` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(11) DEFAULT NULL,
  `shop_link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `code` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci,
  `beneficios` longtext COLLATE utf8mb4_unicode_ci,
  `uso_sugerido` longtext COLLATE utf8mb4_unicode_ci,
  `advertencia` longtext COLLATE utf8mb4_unicode_ci,
  `sabores` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion_imagen` longtext COLLATE utf8mb4_unicode_ci,
  `brandscategories_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '999',
  `active` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kits_flavors`
--

CREATE TABLE `kits_flavors` (
  `id` int(10) UNSIGNED NOT NULL,
  `kit_id` int(11) DEFAULT NULL,
  `flavor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kits_flavors`
--

INSERT INTO `kits_flavors` (`id`, `kit_id`, `flavor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 21, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loteries`
--

CREATE TABLE `loteries` (
  `col1` int(11) NOT NULL,
  `col2` int(11) NOT NULL,
  `col3` int(11) NOT NULL,
  `col4` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id` int(11) NOT NULL,
  `sell` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `loteries`
--

INSERT INTO `loteries` (`col1`, `col2`, `col3`, `col4`, `id`, `sell`) VALUES
(7500, 3233, 6602, '1241', 2001, 0),
(7501, 3232, 6601, '1242', 2002, 0),
(7502, 3231, 6600, '1243', 2003, 0),
(7503, 3230, 6599, '1244', 2004, 0),
(7504, 3229, 6598, '1245', 2005, 0),
(7505, 3228, 6597, '1246', 2006, 0),
(7506, 3227, 6596, '1247', 2007, 0),
(7507, 3226, 6595, '1248', 2008, 0),
(7508, 3225, 6594, '1249', 2009, 0),
(7509, 3224, 6593, '1250', 2010, 0),
(7510, 3223, 6592, '1251', 2011, 0),
(7511, 3222, 6591, '1252', 2012, 0),
(7512, 3221, 6590, '1253', 2013, 0),
(7513, 3220, 6589, '1254', 2014, 0),
(7514, 3219, 6588, '1255', 2015, 0),
(7515, 3218, 6587, '1256', 2016, 0),
(7516, 3217, 6586, '1257', 2017, 0),
(7517, 3216, 6585, '1258', 2018, 0),
(7518, 3215, 6584, '1259', 2019, 0),
(7519, 3214, 6583, '1260', 2020, 0),
(7520, 3213, 6582, '1261', 2021, 0),
(7521, 3212, 6581, '1262', 2022, 0),
(7522, 3211, 6580, '1263', 2023, 0),
(7523, 3210, 6579, '1264', 2024, 0),
(7524, 3209, 6578, '1265', 2025, 0),
(7525, 3208, 6577, '1266', 2026, 0),
(7526, 3207, 6576, '1267', 2027, 0),
(7527, 3206, 6575, '1268', 2028, 0),
(7528, 3205, 6574, '1269', 2029, 0),
(7529, 3204, 6573, '1270', 2030, 0),
(7530, 3203, 6572, '1271', 2031, 0),
(7531, 3202, 6571, '1272', 2032, 0),
(7532, 3201, 6570, '1273', 2033, 0),
(7533, 3200, 6569, '1274', 2034, 0),
(7534, 3199, 6568, '1275', 2035, 0),
(7535, 3198, 6567, '1276', 2036, 0),
(7536, 3197, 6566, '1277', 2037, 0),
(7537, 3196, 6565, '1278', 2038, 0),
(7538, 3195, 6564, '1279', 2039, 0),
(7539, 3194, 6563, '1280', 2040, 0),
(7540, 3193, 6562, '1281', 2041, 0),
(7541, 3192, 6561, '1282', 2042, 0),
(7542, 3191, 6560, '1283', 2043, 0),
(7543, 3190, 6559, '1284', 2044, 0),
(7544, 3189, 6558, '1285', 2045, 0),
(7545, 3188, 6557, '1286', 2046, 0),
(7546, 3187, 6556, '1287', 2047, 0),
(7547, 3186, 6555, '1288', 2048, 0),
(7548, 3185, 6554, '1289', 2049, 0),
(7549, 3184, 6553, '1290', 2050, 0),
(7550, 3183, 6552, '1291', 2051, 0),
(7551, 3182, 6551, '1292', 2052, 0),
(7552, 3181, 6550, '1293', 2053, 0),
(7553, 3180, 6549, '1294', 2054, 0),
(7554, 3179, 6548, '1295', 2055, 0),
(7555, 3178, 6547, '1296', 2056, 0),
(7556, 3177, 6546, '1297', 2057, 0),
(7557, 3176, 6545, '1298', 2058, 0),
(7558, 3175, 6544, '1299', 2059, 0),
(7559, 3174, 6543, '1300', 2060, 0),
(7560, 3173, 6542, '1301', 2061, 0),
(7561, 3172, 6541, '1302', 2062, 0),
(7562, 3171, 6540, '1303', 2063, 0),
(7563, 3170, 6539, '1304', 2064, 0),
(7564, 3169, 6538, '1305', 2065, 0),
(7565, 3168, 6537, '1306', 2066, 0),
(7566, 3167, 6536, '1307', 2067, 0),
(7567, 3166, 6535, '1308', 2068, 0),
(7568, 3165, 6534, '1309', 2069, 0),
(7569, 3164, 6533, '1310', 2070, 0),
(7570, 3163, 6532, '1311', 2071, 0),
(7571, 3162, 6531, '1312', 2072, 0),
(7572, 3161, 6530, '1313', 2073, 0),
(7573, 3160, 6529, '1314', 2074, 0),
(7574, 3159, 6528, '1315', 2075, 0),
(7575, 3158, 6527, '1316', 2076, 0),
(7576, 3157, 6526, '1317', 2077, 0),
(7577, 3156, 6525, '1318', 2078, 0),
(7578, 3155, 6524, '1319', 2079, 0),
(7579, 3154, 6523, '1320', 2080, 0),
(7580, 3153, 6522, '1321', 2081, 0),
(7581, 3152, 6521, '1322', 2082, 0),
(7582, 3151, 6520, '1323', 2083, 0),
(7583, 3150, 6519, '1324', 2084, 0),
(7584, 3149, 6518, '1325', 2085, 0),
(7585, 3148, 6517, '1326', 2086, 0),
(7586, 3147, 6516, '1327', 2087, 0),
(7587, 3146, 6515, '1328', 2088, 0),
(7588, 3145, 6514, '1329', 2089, 0),
(7589, 3144, 6513, '1330', 2090, 0),
(7590, 3143, 6512, '1331', 2091, 0),
(7591, 3142, 6511, '1332', 2092, 0),
(7592, 3141, 6510, '1333', 2093, 0),
(7593, 3140, 6509, '1334', 2094, 0),
(7594, 3139, 6508, '1335', 2095, 0),
(7595, 3138, 6507, '1336', 2096, 0),
(7596, 3137, 6506, '1337', 2097, 0),
(7597, 3136, 6505, '1338', 2098, 0),
(7598, 3135, 6504, '1339', 2099, 0),
(7599, 3134, 6503, '1340', 2100, 0),
(7600, 3133, 6502, '1341', 2101, 0),
(7601, 3132, 6501, '1342', 2102, 0),
(7602, 3131, 6500, '1343', 2103, 0),
(7603, 3130, 6499, '1344', 2104, 0),
(7604, 3129, 6498, '1345', 2105, 0),
(7605, 3128, 6497, '1346', 2106, 0),
(7606, 3127, 6496, '1347', 2107, 0),
(7607, 3126, 6495, '1348', 2108, 0),
(7608, 3125, 6494, '1349', 2109, 0),
(7609, 3124, 6493, '1350', 2110, 0),
(7610, 3123, 6492, '1351', 2111, 0),
(7611, 3122, 6491, '1352', 2112, 0),
(7612, 3121, 6490, '1353', 2113, 0),
(7613, 3120, 6489, '1354', 2114, 0),
(7614, 3119, 6488, '1355', 2115, 0),
(7615, 3118, 6487, '1356', 2116, 0),
(7616, 3117, 6486, '1357', 2117, 0),
(7617, 3116, 6485, '1358', 2118, 0),
(7618, 3115, 6484, '1359', 2119, 0),
(7619, 3114, 6483, '1360', 2120, 0),
(7620, 3113, 6482, '1361', 2121, 0),
(7621, 3112, 6481, '1362', 2122, 0),
(7622, 3111, 6480, '1363', 2123, 0),
(7623, 3110, 6479, '1364', 2124, 0),
(7624, 3109, 6478, '1365', 2125, 0),
(7625, 3108, 6477, '1366', 2126, 0),
(7626, 3107, 6476, '1367', 2127, 0),
(7627, 3106, 6475, '1368', 2128, 0),
(7628, 3105, 6474, '1369', 2129, 0),
(7629, 3104, 6473, '1370', 2130, 0),
(7630, 3103, 6472, '1371', 2131, 0),
(7631, 3102, 6471, '1372', 2132, 0),
(7632, 3101, 6470, '1373', 2133, 0),
(7633, 3100, 6469, '1374', 2134, 0),
(7634, 3099, 6468, '1375', 2135, 0),
(7635, 3098, 6467, '1376', 2136, 0),
(7636, 3097, 6466, '1377', 2137, 0),
(7637, 3096, 6465, '1378', 2138, 0),
(7638, 3095, 6464, '1379', 2139, 0),
(7639, 3094, 6463, '1380', 2140, 0),
(7640, 3093, 6462, '1381', 2141, 0),
(7641, 3092, 6461, '1382', 2142, 0),
(7642, 3091, 6460, '1383', 2143, 0),
(7643, 3090, 6459, '1384', 2144, 0),
(7644, 3089, 6458, '1385', 2145, 0),
(7645, 3088, 6457, '1386', 2146, 0),
(7646, 3087, 6456, '1387', 2147, 0),
(7647, 3086, 6455, '1388', 2148, 0),
(7648, 3085, 6454, '1389', 2149, 0),
(7649, 3084, 6453, '1390', 2150, 0),
(7650, 3083, 6452, '1391', 2151, 0),
(7651, 3082, 6451, '1392', 2152, 0),
(7652, 3081, 6450, '1393', 2153, 0),
(7653, 3080, 6449, '1394', 2154, 0),
(7654, 3079, 6448, '1395', 2155, 0),
(7655, 3078, 6447, '1396', 2156, 0),
(7656, 3077, 6446, '1397', 2157, 0),
(7657, 3076, 6445, '1398', 2158, 0),
(7658, 3075, 6444, '1399', 2159, 0),
(7659, 3074, 6443, '1400', 2160, 0),
(7660, 3073, 6442, '1401', 2161, 0),
(7661, 3072, 6441, '1402', 2162, 0),
(7662, 3071, 6440, '1403', 2163, 0),
(7663, 3070, 6439, '1404', 2164, 0),
(7664, 3069, 6438, '1405', 2165, 0),
(7665, 3068, 6437, '1406', 2166, 0),
(7666, 3067, 6436, '1407', 2167, 0),
(7667, 3066, 6435, '1408', 2168, 0),
(7668, 3065, 6434, '1409', 2169, 0),
(7669, 3064, 6433, '1410', 2170, 0),
(7670, 3063, 6432, '1411', 2171, 0),
(7671, 3062, 6431, '1412', 2172, 0),
(7672, 3061, 6430, '1413', 2173, 0),
(7673, 3060, 6429, '1414', 2174, 0),
(7674, 3059, 6428, '1415', 2175, 0),
(7675, 3058, 6427, '1416', 2176, 0),
(7676, 3057, 6426, '1417', 2177, 0),
(7677, 3056, 6425, '1418', 2178, 0),
(7678, 3055, 6424, '1419', 2179, 0),
(7679, 3054, 6423, '1420', 2180, 0),
(7680, 3053, 6422, '1421', 2181, 0),
(7681, 3052, 6421, '1422', 2182, 0),
(7682, 3051, 6420, '1423', 2183, 0),
(7683, 3050, 6419, '1424', 2184, 0),
(7684, 3049, 6418, '1425', 2185, 0),
(7685, 3048, 6417, '1426', 2186, 0),
(7686, 3047, 6416, '1427', 2187, 0),
(7687, 3046, 6415, '1428', 2188, 0),
(7688, 3045, 6414, '1429', 2189, 0),
(7689, 3044, 6413, '1430', 2190, 0),
(7690, 3043, 6412, '1431', 2191, 0),
(7691, 3042, 6411, '1432', 2192, 0),
(7692, 3041, 6410, '1433', 2193, 0),
(7693, 3040, 6409, '1434', 2194, 0),
(7694, 3039, 6408, '1435', 2195, 0),
(7695, 3038, 6407, '1436', 2196, 0),
(7696, 3037, 6406, '1437', 2197, 0),
(7697, 3036, 6405, '1438', 2198, 0),
(7698, 3035, 6404, '1439', 2199, 0),
(7699, 3034, 6403, '1440', 2200, 0),
(7700, 3033, 6402, '1441', 2201, 0),
(7701, 3032, 6401, '1442', 2202, 0),
(7702, 3031, 6400, '1443', 2203, 0),
(7703, 3030, 6399, '1444', 2204, 0),
(7704, 3029, 6398, '1445', 2205, 0),
(7705, 3028, 6397, '1446', 2206, 0),
(7706, 3027, 6396, '1447', 2207, 0),
(7707, 3026, 6395, '1448', 2208, 0),
(7708, 3025, 6394, '1449', 2209, 0),
(7709, 3024, 6393, '1450', 2210, 0),
(7710, 3023, 6392, '1451', 2211, 0),
(7711, 3022, 6391, '1452', 2212, 0),
(7712, 3021, 6390, '1453', 2213, 0),
(7713, 3020, 6389, '1454', 2214, 0),
(7714, 3019, 6388, '1455', 2215, 0),
(7715, 3018, 6387, '1456', 2216, 0),
(7716, 3017, 6386, '1457', 2217, 0),
(7717, 3016, 6385, '1458', 2218, 0),
(7718, 3015, 6384, '1459', 2219, 0),
(7719, 3014, 6383, '1460', 2220, 0),
(7720, 3013, 6382, '1461', 2221, 0),
(7721, 3012, 6381, '1462', 2222, 0),
(7722, 3011, 6380, '1463', 2223, 0),
(7723, 3010, 6379, '1464', 2224, 0),
(7724, 3009, 6378, '1465', 2225, 0),
(7725, 3008, 6377, '1466', 2226, 0),
(7726, 3007, 6376, '1467', 2227, 0),
(7727, 3006, 6375, '1468', 2228, 0),
(7728, 3005, 6374, '1469', 2229, 0),
(7729, 3004, 6373, '1470', 2230, 0),
(7730, 3003, 6372, '1471', 2231, 0),
(7731, 3002, 6371, '1472', 2232, 0),
(7732, 3001, 6370, '1473', 2233, 0),
(7733, 3000, 6369, '1474', 2234, 0),
(7734, 2999, 6368, '1475', 2235, 0),
(7735, 2998, 6367, '1476', 2236, 0),
(7736, 2997, 6366, '1477', 2237, 0),
(7737, 2996, 6365, '1478', 2238, 0),
(7738, 2995, 6364, '1479', 2239, 0),
(7739, 2994, 6363, '1480', 2240, 0),
(7740, 2993, 6362, '1481', 2241, 0),
(7741, 2992, 6361, '1482', 2242, 0),
(7742, 2991, 6360, '1483', 2243, 0),
(7743, 2990, 6359, '1484', 2244, 0),
(7744, 2989, 6358, '1485', 2245, 0),
(7745, 2988, 6357, '1486', 2246, 0),
(7746, 2987, 6356, '1487', 2247, 0),
(7747, 2986, 6355, '1488', 2248, 0),
(7748, 2985, 6354, '1489', 2249, 0),
(7749, 2984, 6353, '1490', 2250, 0),
(7750, 2983, 6352, '1491', 2251, 0),
(7751, 2982, 6351, '1492', 2252, 0),
(7752, 2981, 6350, '1493', 2253, 0),
(7753, 2980, 6349, '1494', 2254, 0),
(7754, 2979, 6348, '1495', 2255, 0),
(7755, 2978, 6347, '1496', 2256, 0),
(7756, 2977, 6346, '1497', 2257, 0),
(7757, 2976, 6345, '1498', 2258, 0),
(7758, 2975, 6344, '1499', 2259, 0),
(7759, 2974, 6343, '1500', 2260, 0),
(7760, 2973, 6342, '1501', 2261, 0),
(7761, 2972, 6341, '1502', 2262, 0),
(7762, 2971, 6340, '1503', 2263, 0),
(7763, 2970, 6339, '1504', 2264, 0),
(7764, 2969, 6338, '1505', 2265, 0),
(7765, 2968, 6337, '1506', 2266, 0),
(7766, 2967, 6336, '1507', 2267, 0),
(7767, 2966, 6335, '1508', 2268, 0),
(7768, 2965, 6334, '1509', 2269, 0),
(7769, 2964, 6333, '1510', 2270, 0),
(7770, 2963, 6332, '1511', 2271, 0),
(7771, 2962, 6331, '1512', 2272, 0),
(7772, 2961, 6330, '1513', 2273, 0),
(7773, 2960, 6329, '1514', 2274, 0),
(7774, 2959, 6328, '1515', 2275, 0),
(7775, 2958, 6327, '1516', 2276, 0),
(7776, 2957, 6326, '1517', 2277, 0),
(7777, 2956, 6325, '1518', 2278, 0),
(7778, 2955, 6324, '1519', 2279, 0),
(7779, 2954, 6323, '1520', 2280, 0),
(7780, 2953, 6322, '1521', 2281, 0),
(7781, 2952, 6321, '1522', 2282, 0),
(7782, 2951, 6320, '1523', 2283, 0),
(7783, 2950, 6319, '1524', 2284, 0),
(7784, 2949, 6318, '1525', 2285, 0),
(7785, 2948, 6317, '1526', 2286, 0),
(7786, 2947, 6316, '1527', 2287, 0),
(7787, 2946, 6315, '1528', 2288, 0),
(7788, 2945, 6314, '1529', 2289, 0),
(7789, 2944, 6313, '1530', 2290, 0),
(7790, 2943, 6312, '1531', 2291, 0),
(7791, 2942, 6311, '1532', 2292, 0),
(7792, 2941, 6310, '1533', 2293, 0),
(7793, 2940, 6309, '1534', 2294, 0),
(7794, 2939, 6308, '1535', 2295, 0),
(7795, 2938, 6307, '1536', 2296, 0),
(7796, 2937, 6306, '1537', 2297, 0),
(7797, 2936, 6305, '1538', 2298, 0),
(7798, 2935, 6304, '1539', 2299, 0),
(7799, 2934, 6303, '1540', 2300, 0),
(7800, 2933, 6302, '1541', 2301, 0),
(7801, 2932, 6301, '1542', 2302, 0),
(7802, 2931, 6300, '1543', 2303, 0),
(7803, 2930, 6299, '1544', 2304, 0),
(7804, 2929, 6298, '1545', 2305, 0),
(7805, 2928, 6297, '1546', 2306, 0),
(7806, 2927, 6296, '1547', 2307, 0),
(7807, 2926, 6295, '1548', 2308, 0),
(7808, 2925, 6294, '1549', 2309, 0),
(7809, 2924, 6293, '1550', 2310, 0),
(7810, 2923, 6292, '1551', 2311, 0),
(7811, 2922, 6291, '1552', 2312, 0),
(7812, 2921, 6290, '1553', 2313, 0),
(7813, 2920, 6289, '1554', 2314, 0),
(7814, 2919, 6288, '1555', 2315, 0),
(7815, 2918, 6287, '1556', 2316, 0),
(7816, 2917, 6286, '1557', 2317, 0),
(7817, 2916, 6285, '1558', 2318, 0),
(7818, 2915, 6284, '1559', 2319, 0),
(7819, 2914, 6283, '1560', 2320, 0),
(7820, 2913, 6282, '1561', 2321, 0),
(7821, 2912, 6281, '1562', 2322, 0),
(7822, 2911, 6280, '1563', 2323, 0),
(7823, 2910, 6279, '1564', 2324, 0),
(7824, 2909, 6278, '1565', 2325, 0),
(7825, 2908, 6277, '1566', 2326, 0),
(7826, 2907, 6276, '1567', 2327, 0),
(7827, 2906, 6275, '1568', 2328, 0),
(7828, 2905, 6274, '1569', 2329, 0),
(7829, 2904, 6273, '1570', 2330, 0),
(7830, 2903, 6272, '1571', 2331, 0),
(7831, 2902, 6271, '1572', 2332, 0),
(7832, 2901, 6270, '1573', 2333, 0),
(7833, 2900, 6269, '1574', 2334, 0),
(7834, 2899, 6268, '1575', 2335, 0),
(7835, 2898, 6267, '1576', 2336, 0),
(7836, 2897, 6266, '1577', 2337, 0),
(7837, 2896, 6265, '1578', 2338, 0),
(7838, 2895, 6264, '1579', 2339, 0),
(7839, 2894, 6263, '1580', 2340, 0),
(7840, 2893, 6262, '1581', 2341, 0),
(7841, 2892, 6261, '1582', 2342, 0),
(7842, 2891, 6260, '1583', 2343, 0),
(7843, 2890, 6259, '1584', 2344, 0),
(7844, 2889, 6258, '1585', 2345, 0),
(7845, 2888, 6257, '1586', 2346, 0),
(7846, 2887, 6256, '1587', 2347, 0),
(7847, 2886, 6255, '1588', 2348, 0),
(7848, 2885, 6254, '1589', 2349, 0),
(7849, 2884, 6253, '1590', 2350, 0),
(7850, 2883, 6252, '1591', 2351, 0),
(7851, 2882, 6251, '1592', 2352, 0),
(7852, 2881, 6250, '1593', 2353, 0),
(7853, 2880, 6249, '1594', 2354, 0),
(7854, 2879, 6248, '1595', 2355, 0),
(7855, 2878, 6247, '1596', 2356, 0),
(7856, 2877, 6246, '1597', 2357, 0),
(7857, 2876, 6245, '1598', 2358, 0),
(7858, 2875, 6244, '1599', 2359, 0),
(7859, 2874, 6243, '1600', 2360, 0),
(7860, 2873, 6242, '1601', 2361, 0),
(7861, 2872, 6241, '1602', 2362, 0),
(7862, 2871, 6240, '1603', 2363, 0),
(7863, 2870, 6239, '1604', 2364, 0),
(7864, 2869, 6238, '1605', 2365, 0),
(7865, 2868, 6237, '1606', 2366, 0),
(7866, 2867, 6236, '1607', 2367, 0),
(7867, 2866, 6235, '1608', 2368, 0),
(7868, 2865, 6234, '1609', 2369, 0),
(7869, 2864, 6233, '1610', 2370, 0),
(7870, 2863, 6232, '1611', 2371, 0),
(7871, 2862, 6231, '1612', 2372, 0),
(7872, 2861, 6230, '1613', 2373, 0),
(7873, 2860, 6229, '1614', 2374, 0),
(7874, 2859, 6228, '1615', 2375, 0),
(7875, 2858, 6227, '1616', 2376, 0),
(7876, 2857, 6226, '1617', 2377, 0),
(7877, 2856, 6225, '1618', 2378, 0),
(7878, 2855, 6224, '1619', 2379, 0),
(7879, 2854, 6223, '1620', 2380, 0),
(7880, 2853, 6222, '1621', 2381, 0),
(7881, 2852, 6221, '1622', 2382, 0),
(7882, 2851, 6220, '1623', 2383, 0),
(7883, 2850, 6219, '1624', 2384, 0),
(7884, 2849, 6218, '1625', 2385, 0),
(7885, 2848, 6217, '1626', 2386, 0),
(7886, 2847, 6216, '1627', 2387, 0),
(7887, 2846, 6215, '1628', 2388, 0),
(7888, 2845, 6214, '1629', 2389, 0),
(7889, 2844, 6213, '1630', 2390, 0),
(7890, 2843, 6212, '1631', 2391, 0),
(7891, 2842, 6211, '1632', 2392, 0),
(7892, 2841, 6210, '1633', 2393, 0),
(7893, 2840, 6209, '1634', 2394, 0),
(7894, 2839, 6208, '1635', 2395, 0),
(7895, 2838, 6207, '1636', 2396, 0),
(7896, 2837, 6206, '1637', 2397, 0),
(7897, 2836, 6205, '1638', 2398, 0),
(7898, 2835, 6204, '1639', 2399, 0),
(7899, 2834, 6203, '1640', 2400, 0),
(7900, 2833, 6202, '1641', 2401, 0),
(7901, 2832, 6201, '1642', 2402, 0),
(7902, 2831, 6200, '1643', 2403, 0),
(7903, 2830, 6199, '1644', 2404, 0),
(7904, 2829, 6198, '1645', 2405, 0),
(7905, 2828, 6197, '1646', 2406, 0),
(7906, 2827, 6196, '1647', 2407, 0),
(7907, 2826, 6195, '1648', 2408, 0),
(7908, 2825, 6194, '1649', 2409, 0),
(7909, 2824, 6193, '1650', 2410, 0),
(7910, 2823, 6192, '1651', 2411, 0),
(7911, 2822, 6191, '1652', 2412, 0),
(7912, 2821, 6190, '1653', 2413, 0),
(7913, 2820, 6189, '1654', 2414, 0),
(7914, 2819, 6188, '1655', 2415, 0),
(7915, 2818, 6187, '1656', 2416, 0),
(7916, 2817, 6186, '1657', 2417, 0),
(7917, 2816, 6185, '1658', 2418, 0),
(7918, 2815, 6184, '1659', 2419, 0),
(7919, 2814, 6183, '1660', 2420, 0),
(7920, 2813, 6182, '1661', 2421, 0),
(7921, 2812, 6181, '1662', 2422, 0),
(7922, 2811, 6180, '1663', 2423, 0),
(7923, 2810, 6179, '1664', 2424, 0),
(7924, 2809, 6178, '1665', 2425, 0),
(7925, 2808, 6177, '1666', 2426, 0),
(7926, 2807, 6176, '1667', 2427, 0),
(7927, 2806, 6175, '1668', 2428, 0),
(7928, 2805, 6174, '1669', 2429, 0),
(7929, 2804, 6173, '1670', 2430, 0),
(7930, 2803, 6172, '1671', 2431, 0),
(7931, 2802, 6171, '1672', 2432, 0),
(7932, 2801, 6170, '1673', 2433, 0),
(7933, 2800, 6169, '1674', 2434, 0),
(7934, 2799, 6168, '1675', 2435, 0),
(7935, 2798, 6167, '1676', 2436, 0),
(7936, 2797, 6166, '1677', 2437, 0),
(7937, 2796, 6165, '1678', 2438, 0),
(7938, 2795, 6164, '1679', 2439, 0),
(7939, 2794, 6163, '1680', 2440, 0),
(7940, 2793, 6162, '1681', 2441, 0),
(7941, 2792, 6161, '1682', 2442, 0),
(7942, 2791, 6160, '1683', 2443, 0),
(7943, 2790, 6159, '1684', 2444, 0),
(7944, 2789, 6158, '1685', 2445, 0),
(7945, 2788, 6157, '1686', 2446, 0),
(7946, 2787, 6156, '1687', 2447, 0),
(7947, 2786, 6155, '1688', 2448, 0),
(7948, 2785, 6154, '1689', 2449, 0),
(7949, 2784, 6153, '1690', 2450, 0),
(7950, 2783, 6152, '1691', 2451, 0),
(7951, 2782, 6151, '1692', 2452, 0),
(7952, 2781, 6150, '1693', 2453, 0),
(7953, 2780, 6149, '1694', 2454, 0),
(7954, 2779, 6148, '1695', 2455, 0),
(7955, 2778, 6147, '1696', 2456, 0),
(7956, 2777, 6146, '1697', 2457, 0),
(7957, 2776, 6145, '1698', 2458, 0),
(7958, 2775, 6144, '1699', 2459, 0),
(7959, 2774, 6143, '1700', 2460, 0),
(7960, 2773, 6142, '1701', 2461, 0),
(7961, 2772, 6141, '1702', 2462, 0),
(7962, 2771, 6140, '1703', 2463, 0),
(7963, 2770, 6139, '1704', 2464, 0),
(7964, 2769, 6138, '1705', 2465, 0),
(7965, 2768, 6137, '1706', 2466, 0),
(7966, 2767, 6136, '1707', 2467, 0),
(7967, 2766, 6135, '1708', 2468, 0),
(7968, 2765, 6134, '1709', 2469, 0),
(7969, 2764, 6133, '1710', 2470, 0),
(7970, 2763, 6132, '1711', 2471, 0),
(7971, 2762, 6131, '1712', 2472, 0),
(7972, 2761, 6130, '1713', 2473, 0),
(7973, 2760, 6129, '1714', 2474, 0),
(7974, 2759, 6128, '1715', 2475, 0),
(7975, 2758, 6127, '1716', 2476, 0),
(7976, 2757, 6126, '1717', 2477, 0),
(7977, 2756, 6125, '1718', 2478, 0),
(7978, 2755, 6124, '1719', 2479, 0),
(7979, 2754, 6123, '1720', 2480, 0),
(7980, 2753, 6122, '1721', 2481, 0),
(7981, 2752, 6121, '1722', 2482, 0),
(7982, 2751, 6120, '1723', 2483, 0),
(7983, 2750, 6119, '1724', 2484, 0),
(7984, 2749, 6118, '1725', 2485, 0),
(7985, 2748, 6117, '1726', 2486, 0),
(7986, 2747, 6116, '1727', 2487, 0),
(7987, 2746, 6115, '1728', 2488, 0),
(7988, 2745, 6114, '1729', 2489, 0),
(7989, 2744, 6113, '1730', 2490, 0),
(7990, 2743, 6112, '1731', 2491, 0),
(7991, 2742, 6111, '1732', 2492, 0),
(7992, 2741, 6110, '1733', 2493, 0),
(7993, 2740, 6109, '1734', 2494, 0),
(7994, 2739, 6108, '1735', 2495, 0),
(7995, 2738, 6107, '1736', 2496, 0),
(7996, 2737, 6106, '1737', 2497, 0),
(7997, 2736, 6105, '1738', 2498, 0),
(7998, 2735, 6104, '1739', 2499, 0),
(7999, 2734, 6103, '1740', 2500, 0),
(8000, 2733, 6102, '1741', 1001, 0),
(8001, 2732, 6101, '1742', 1002, 0),
(8002, 2731, 6100, '1743', 1003, 0),
(8003, 2730, 6099, '1744', 1004, 0),
(8004, 2729, 6098, '1745', 1005, 0),
(8005, 2728, 6097, '1746', 1006, 0),
(8006, 2727, 6096, '1747', 1007, 0),
(8007, 2726, 6095, '1748', 1008, 0),
(8008, 2725, 6094, '1749', 1009, 0),
(8009, 2724, 6093, '1750', 1010, 0),
(8010, 2723, 6092, '1751', 1011, 0),
(8011, 2722, 6091, '1752', 1012, 0),
(8012, 2721, 6090, '1753', 1013, 0),
(8013, 2720, 6089, '1754', 1014, 0),
(8014, 2719, 6088, '1755', 1015, 0),
(8015, 2718, 6087, '1756', 1016, 0),
(8016, 2717, 6086, '1757', 1017, 0),
(8017, 2716, 6085, '1758', 1018, 0),
(8018, 2715, 6084, '1759', 1019, 0),
(8019, 2714, 6083, '1760', 1020, 0),
(8020, 2713, 6082, '1761', 1021, 0),
(8021, 2712, 6081, '1762', 1022, 0),
(8022, 2711, 6080, '1763', 1023, 0),
(8023, 2710, 6079, '1764', 1024, 0),
(8024, 2709, 6078, '1765', 1025, 0),
(8025, 2708, 6077, '1766', 1026, 0),
(8026, 2707, 6076, '1767', 1027, 0),
(8027, 2706, 6075, '1768', 1028, 0),
(8028, 2705, 6074, '1769', 1029, 0),
(8029, 2704, 6073, '1770', 1030, 0),
(8030, 2703, 6072, '1771', 1031, 0),
(8031, 2702, 6071, '1772', 1032, 0),
(8032, 2701, 6070, '1773', 1033, 0),
(8033, 2700, 6069, '1774', 1034, 0),
(8034, 2699, 6068, '1775', 1035, 0),
(8035, 2698, 6067, '1776', 1036, 0),
(8036, 2697, 6066, '1777', 1037, 0),
(8037, 2696, 6065, '1778', 1038, 0),
(8038, 2695, 6064, '1779', 1039, 0),
(8039, 2694, 6063, '1780', 1040, 0),
(8040, 2693, 6062, '1781', 1041, 0),
(8041, 2692, 6061, '1782', 1042, 0),
(8042, 2691, 6060, '1783', 1043, 0),
(8043, 2690, 6059, '1784', 1044, 0),
(8044, 2689, 6058, '1785', 1045, 0),
(8045, 2688, 6057, '1786', 1046, 0),
(8046, 2687, 6056, '1787', 1047, 0),
(8047, 2686, 6055, '1788', 1048, 0),
(8048, 2685, 6054, '1789', 1049, 0),
(8049, 2684, 6053, '1790', 1050, 0),
(8050, 2683, 6052, '1791', 1051, 0),
(8051, 2682, 6051, '1792', 1052, 0),
(8052, 2681, 6050, '1793', 1053, 0),
(8053, 2680, 6049, '1794', 1054, 0),
(8054, 2679, 6048, '1795', 1055, 0),
(8055, 2678, 6047, '1796', 1056, 0),
(8056, 2677, 6046, '1797', 1057, 0),
(8057, 2676, 6045, '1798', 1058, 0),
(8058, 2675, 6044, '1799', 1059, 0),
(8059, 2674, 6043, '1800', 1060, 0),
(8060, 2673, 6042, '1801', 1061, 0),
(8061, 2672, 6041, '1802', 1062, 0),
(8062, 2671, 6040, '1803', 1063, 0),
(8063, 2670, 6039, '1804', 1064, 0),
(8064, 2669, 6038, '1805', 1065, 0),
(8065, 2668, 6037, '1806', 1066, 0),
(8066, 2667, 6036, '1807', 1067, 0),
(8067, 2666, 6035, '1808', 1068, 0),
(8068, 2665, 6034, '1809', 1069, 0),
(8069, 2664, 6033, '1810', 1070, 0),
(8070, 2663, 6032, '1811', 1071, 0),
(8071, 2662, 6031, '1812', 1072, 0),
(8072, 2661, 6030, '1813', 1073, 0),
(8073, 2660, 6029, '1814', 1074, 0),
(8074, 2659, 6028, '1815', 1075, 0),
(8075, 2658, 6027, '1816', 1076, 0),
(8076, 2657, 6026, '1817', 1077, 0),
(8077, 2656, 6025, '1818', 1078, 0),
(8078, 2655, 6024, '1819', 1079, 0),
(8079, 2654, 6023, '1820', 1080, 0),
(8080, 2653, 6022, '1821', 1081, 0),
(8081, 2652, 6021, '1822', 1082, 0),
(8082, 2651, 6020, '1823', 1083, 0),
(8083, 2650, 6019, '1824', 1084, 0),
(8084, 2649, 6018, '1825', 1085, 0),
(8085, 2648, 6017, '1826', 1086, 0),
(8086, 2647, 6016, '1827', 1087, 0),
(8087, 2646, 6015, '1828', 1088, 0),
(8088, 2645, 6014, '1829', 1089, 0),
(8089, 2644, 6013, '1830', 1090, 0),
(8090, 2643, 6012, '1831', 1091, 0),
(8091, 2642, 6011, '1832', 1092, 0),
(8092, 2641, 6010, '1833', 1093, 0),
(8093, 2640, 6009, '1834', 1094, 0),
(8094, 2639, 6008, '1835', 1095, 0),
(8095, 2638, 6007, '1836', 1096, 0),
(8096, 2637, 6006, '1837', 1097, 0),
(8097, 2636, 6005, '1838', 1098, 0),
(8098, 2635, 6004, '1839', 1099, 0),
(8099, 2634, 6003, '1840', 1100, 0),
(8100, 2633, 6002, '1841', 1101, 0),
(8101, 2632, 6001, '1842', 1102, 0),
(8102, 2631, 6000, '1843', 1103, 0),
(8103, 2630, 5999, '1844', 1104, 0),
(8104, 2629, 5998, '1845', 1105, 0),
(8105, 2628, 5997, '1846', 1106, 0),
(8106, 2627, 5996, '1847', 1107, 0),
(8107, 2626, 5995, '1848', 1108, 0),
(8108, 2625, 5994, '1849', 1109, 0),
(8109, 2624, 5993, '1850', 1110, 0),
(8110, 2623, 5992, '1851', 1111, 0),
(8111, 2622, 5991, '1852', 1112, 0),
(8112, 2621, 5990, '1853', 1113, 0),
(8113, 2620, 5989, '1854', 1114, 0),
(8114, 2619, 5988, '1855', 1115, 0),
(8115, 2618, 5987, '1856', 1116, 0),
(8116, 2617, 5986, '1857', 1117, 0),
(8117, 2616, 5985, '1858', 1118, 0),
(8118, 2615, 5984, '1859', 1119, 0),
(8119, 2614, 5983, '1860', 1120, 0),
(8120, 2613, 5982, '1861', 1121, 0),
(8121, 2612, 5981, '1862', 1122, 0),
(8122, 2611, 5980, '1863', 1123, 0),
(8123, 2610, 5979, '1864', 1124, 0),
(8124, 2609, 5978, '1865', 1125, 0),
(8125, 2608, 5977, '1866', 1126, 0),
(8126, 2607, 5976, '1867', 1127, 0),
(8127, 2606, 5975, '1868', 1128, 0),
(8128, 2605, 5974, '1869', 1129, 0),
(8129, 2604, 5973, '1870', 1130, 0),
(8130, 2603, 5972, '1871', 1131, 0),
(8131, 2602, 5971, '1872', 1132, 0),
(8132, 2601, 5970, '1873', 1133, 0),
(8133, 2600, 5969, '1874', 1134, 0),
(8134, 2599, 5968, '1875', 1135, 0),
(8135, 2598, 5967, '1876', 1136, 0),
(8136, 2597, 5966, '1877', 1137, 0),
(8137, 2596, 5965, '1878', 1138, 0),
(8138, 2595, 5964, '1879', 1139, 0),
(8139, 2594, 5963, '1880', 1140, 0),
(8140, 2593, 5962, '1881', 1141, 0),
(8141, 2592, 5961, '1882', 1142, 0),
(8142, 2591, 5960, '1883', 1143, 0),
(8143, 2590, 5959, '1884', 1144, 0),
(8144, 2589, 5958, '1885', 1145, 0),
(8145, 2588, 5957, '1886', 1146, 0),
(8146, 2587, 5956, '1887', 1147, 0),
(8147, 2586, 5955, '1888', 1148, 0),
(8148, 2585, 5954, '1889', 1149, 0),
(8149, 2584, 5953, '1890', 1150, 0),
(8150, 2583, 5952, '1891', 1151, 0),
(8151, 2582, 5951, '1892', 1152, 0),
(8152, 2581, 5950, '1893', 1153, 0),
(8153, 2580, 5949, '1894', 1154, 0),
(8154, 2579, 5948, '1895', 1155, 0),
(8155, 2578, 5947, '1896', 1156, 0),
(8156, 2577, 5946, '1897', 1157, 0),
(8157, 2576, 5945, '1898', 1158, 0),
(8158, 2575, 5944, '1899', 1159, 0),
(8159, 2574, 5943, '1900', 1160, 0),
(8160, 2573, 5942, '1901', 1161, 0),
(8161, 2572, 5941, '1902', 1162, 0),
(8162, 2571, 5940, '1903', 1163, 0),
(8163, 2570, 5939, '1904', 1164, 0),
(8164, 2569, 5938, '1905', 1165, 0),
(8165, 2568, 5937, '1906', 1166, 0),
(8166, 2567, 5936, '1907', 1167, 0),
(8167, 2566, 5935, '1908', 1168, 0),
(8168, 2565, 5934, '1909', 1169, 0),
(8169, 2564, 5933, '1910', 1170, 0),
(8170, 2563, 5932, '1911', 1171, 0),
(8171, 2562, 5931, '1912', 1172, 0),
(8172, 2561, 5930, '1913', 1173, 0),
(8173, 2560, 5929, '1914', 1174, 0),
(8174, 2559, 5928, '1915', 1175, 0),
(8175, 2558, 5927, '1916', 1176, 0),
(8176, 2557, 5926, '1917', 1177, 0),
(8177, 2556, 5925, '1918', 1178, 0),
(8178, 2555, 5924, '1919', 1179, 0),
(8179, 2554, 5923, '1920', 1180, 0),
(8180, 2553, 5922, '1921', 1181, 0),
(8181, 2552, 5921, '1922', 1182, 0),
(8182, 2551, 5920, '1923', 1183, 0),
(8183, 2550, 5919, '1924', 1184, 0),
(8184, 2549, 5918, '1925', 1185, 0),
(8185, 2548, 5917, '1926', 1186, 0),
(8186, 2547, 5916, '1927', 1187, 0),
(8187, 2546, 5915, '1928', 1188, 0),
(8188, 2545, 5914, '1929', 1189, 0),
(8189, 2544, 5913, '1930', 1190, 0),
(8190, 2543, 5912, '1931', 1191, 0),
(8191, 2542, 5911, '1932', 1192, 0),
(8192, 2541, 5910, '1933', 1193, 0),
(8193, 2540, 5909, '1934', 1194, 0),
(8194, 2539, 5908, '1935', 1195, 0),
(8195, 2538, 5907, '1936', 1196, 0),
(8196, 2537, 5906, '1937', 1197, 0),
(8197, 2536, 5905, '1938', 1198, 0),
(8198, 2535, 5904, '1939', 1199, 0),
(8199, 2534, 5903, '1940', 1200, 0),
(8200, 2533, 5902, '1941', 1201, 0),
(8201, 2532, 5901, '1942', 1202, 0),
(8202, 2531, 5900, '1943', 1203, 0),
(8203, 2530, 5899, '1944', 1204, 0),
(8204, 2529, 5898, '1945', 1205, 0),
(8205, 2528, 5897, '1946', 1206, 0),
(8206, 2527, 5896, '1947', 1207, 0),
(8207, 2526, 5895, '1948', 1208, 0),
(8208, 2525, 5894, '1949', 1209, 0),
(8209, 2524, 5893, '1950', 1210, 0),
(8210, 2523, 5892, '1951', 1211, 0),
(8211, 2522, 5891, '1952', 1212, 0),
(8212, 2521, 5890, '1953', 1213, 0),
(8213, 2520, 5889, '1954', 1214, 0),
(8214, 2519, 5888, '1955', 1215, 0),
(8215, 2518, 5887, '1956', 1216, 0),
(8216, 2517, 5886, '1957', 1217, 0),
(8217, 2516, 5885, '1958', 1218, 0),
(8218, 2515, 5884, '1959', 1219, 0),
(8219, 2514, 5883, '1960', 1220, 0),
(8220, 2513, 5882, '1961', 1221, 0),
(8221, 2512, 5881, '1962', 1222, 0),
(8222, 2511, 5880, '1963', 1223, 0),
(8223, 2510, 5879, '1964', 1224, 0),
(8224, 2509, 5878, '1965', 1225, 0),
(8225, 2508, 5877, '1966', 1226, 0),
(8226, 2507, 5876, '1967', 1227, 0),
(8227, 2506, 5875, '1968', 1228, 0),
(8228, 2505, 5874, '1969', 1229, 0),
(8229, 2504, 5873, '1970', 1230, 0),
(8230, 2503, 5872, '1971', 1231, 0),
(8231, 2502, 5871, '1972', 1232, 0),
(8232, 2501, 5870, '1973', 1233, 0),
(8233, 2500, 5869, '1974', 1234, 0),
(8234, 4999, 5868, '1975', 1235, 0),
(8235, 4998, 5867, '1976', 1236, 0),
(8236, 4997, 5866, '1977', 1237, 0),
(8237, 4996, 5865, '1978', 1238, 0),
(8238, 4995, 5864, '1979', 1239, 0),
(8239, 4994, 5863, '1980', 1240, 0),
(8240, 4993, 5862, '1981', 1241, 0),
(8241, 4992, 5861, '1982', 1242, 0),
(8242, 4991, 5860, '1983', 1243, 0),
(8243, 4990, 5859, '1984', 1244, 0),
(8244, 4989, 5858, '1985', 1245, 0),
(8245, 4988, 5857, '1986', 1246, 0),
(8246, 4987, 5856, '1987', 1247, 0),
(8247, 4986, 5855, '1988', 1248, 0),
(8248, 4985, 5854, '1989', 1249, 0),
(8249, 4984, 5853, '1990', 1250, 0),
(8250, 4983, 5852, '1991', 1251, 0),
(8251, 4982, 5851, '1992', 1252, 0),
(8252, 4981, 5850, '1993', 1253, 0),
(8253, 4980, 5849, '1994', 1254, 0),
(8254, 4979, 5848, '1995', 1255, 0),
(8255, 4978, 5847, '1996', 1256, 0),
(8256, 4977, 5846, '1997', 1257, 0),
(8257, 4976, 5845, '1998', 1258, 0),
(8258, 4975, 5844, '1999', 1259, 0),
(8259, 4974, 5843, '2000', 1260, 0),
(8260, 4973, 5842, '2001', 1261, 0),
(8261, 4972, 5841, '2002', 1262, 0),
(8262, 4971, 5840, '2003', 1263, 0),
(8263, 4970, 5839, '2004', 1264, 0),
(8264, 4969, 5838, '2005', 1265, 0),
(8265, 4968, 5837, '2006', 1266, 0),
(8266, 4967, 5836, '2007', 1267, 0),
(8267, 4966, 5835, '2008', 1268, 0),
(8268, 4965, 5834, '2009', 1269, 0),
(8269, 4964, 5833, '2010', 1270, 0),
(8270, 4963, 5832, '2011', 1271, 0),
(8271, 4962, 5831, '2012', 1272, 0),
(8272, 4961, 5830, '2013', 1273, 0),
(8273, 4960, 5829, '2014', 1274, 0),
(8274, 4959, 5828, '2015', 1275, 0),
(8275, 4958, 5827, '2016', 1276, 0),
(8276, 4957, 5826, '2017', 1277, 0),
(8277, 4956, 5825, '2018', 1278, 0),
(8278, 4955, 5824, '2019', 1279, 0),
(8279, 4954, 5823, '2020', 1280, 0),
(8280, 4953, 5822, '2021', 1281, 0),
(8281, 4952, 5821, '2022', 1282, 0),
(8282, 4951, 5820, '2023', 1283, 0),
(8283, 4950, 5819, '2024', 1284, 0),
(8284, 4949, 5818, '2025', 1285, 0),
(8285, 4948, 5817, '2026', 1286, 0),
(8286, 4947, 5816, '2027', 1287, 0),
(8287, 4946, 5815, '2028', 1288, 0),
(8288, 4945, 5814, '2029', 1289, 0),
(8289, 4944, 5813, '2030', 1290, 0),
(8290, 4943, 5812, '2031', 1291, 0),
(8291, 4942, 5811, '2032', 1292, 0),
(8292, 4941, 5810, '2033', 1293, 0),
(8293, 4940, 5809, '2034', 1294, 0),
(8294, 4939, 5808, '2035', 1295, 0),
(8295, 4938, 5807, '2036', 1296, 0),
(8296, 4937, 5806, '2037', 1297, 0),
(8297, 4936, 5805, '2038', 1298, 0),
(8298, 4935, 5804, '2039', 1299, 0),
(8299, 4934, 5803, '2040', 1300, 0),
(8300, 4933, 5802, '2041', 1301, 0),
(8301, 4932, 5801, '2042', 1302, 0),
(8302, 4931, 5800, '2043', 1303, 0),
(8303, 4930, 5799, '2044', 1304, 0),
(8304, 4929, 5798, '2045', 1305, 0),
(8305, 4928, 5797, '2046', 1306, 0),
(8306, 4927, 5796, '2047', 1307, 0),
(8307, 4926, 5795, '2048', 1308, 0),
(8308, 4925, 5794, '2049', 1309, 0),
(8309, 4924, 5793, '2050', 1310, 0),
(8310, 4923, 5792, '2051', 1311, 0),
(8311, 4922, 5791, '2052', 1312, 0),
(8312, 4921, 5790, '2053', 1313, 0),
(8313, 4920, 5789, '2054', 1314, 0),
(8314, 4919, 5788, '2055', 1315, 0),
(8315, 4918, 5787, '2056', 1316, 0),
(8316, 4917, 5786, '2057', 1317, 0),
(8317, 4916, 5785, '2058', 1318, 0),
(8318, 4915, 5784, '2059', 1319, 0),
(8319, 4914, 5783, '2060', 1320, 0),
(8320, 4913, 5782, '2061', 1321, 0),
(8321, 4912, 5781, '2062', 1322, 0),
(8322, 4911, 5780, '2063', 1323, 0),
(8323, 4910, 5779, '2064', 1324, 0),
(8324, 4909, 5778, '2065', 1325, 0),
(8325, 4908, 5777, '2066', 1326, 0),
(8326, 4907, 5776, '2067', 1327, 0),
(8327, 4906, 5775, '2068', 1328, 0),
(8328, 4905, 5774, '2069', 1329, 0),
(8329, 4904, 5773, '2070', 1330, 0),
(8330, 4903, 5772, '2071', 1331, 0),
(8331, 4902, 5771, '2072', 1332, 0),
(8332, 4901, 5770, '2073', 1333, 0),
(8333, 4900, 5769, '2074', 1334, 0),
(8334, 4899, 5768, '2075', 1335, 0),
(8335, 4898, 5767, '2076', 1336, 0),
(8336, 4897, 5766, '2077', 1337, 0),
(8337, 4896, 5765, '2078', 1338, 0),
(8338, 4895, 5764, '2079', 1339, 0),
(8339, 4894, 5763, '2080', 1340, 0),
(8340, 4893, 5762, '2081', 1341, 0),
(8341, 4892, 5761, '2082', 1342, 0),
(8342, 4891, 5760, '2083', 1343, 0),
(8343, 4890, 5759, '2084', 1344, 0),
(8344, 4889, 5758, '2085', 1345, 0),
(8345, 4888, 5757, '2086', 1346, 0),
(8346, 4887, 5756, '2087', 1347, 0),
(8347, 4886, 5755, '2088', 1348, 0),
(8348, 4885, 5754, '2089', 1349, 0),
(8349, 4884, 5753, '2090', 1350, 0),
(8350, 4883, 5752, '2091', 1351, 0),
(8351, 4882, 5751, '2092', 1352, 0),
(8352, 4881, 5750, '2093', 1353, 0),
(8353, 4880, 5749, '2094', 1354, 0),
(8354, 4879, 5748, '2095', 1355, 0),
(8355, 4878, 5747, '2096', 1356, 0),
(8356, 4877, 5746, '2097', 1357, 0),
(8357, 4876, 5745, '2098', 1358, 0),
(8358, 4875, 5744, '2099', 1359, 0),
(8359, 4874, 5743, '2100', 1360, 0),
(8360, 4873, 5742, '2101', 1361, 0),
(8361, 4872, 5741, '2102', 1362, 0),
(8362, 4871, 5740, '2103', 1363, 0),
(8363, 4870, 5739, '2104', 1364, 0),
(8364, 4869, 5738, '2105', 1365, 0),
(8365, 4868, 5737, '2106', 1366, 0),
(8366, 4867, 5736, '2107', 1367, 0),
(8367, 4866, 5735, '2108', 1368, 0),
(8368, 4865, 5734, '2109', 1369, 0),
(8369, 4864, 5733, '2110', 1370, 0),
(8370, 4863, 5732, '2111', 1371, 0),
(8371, 4862, 5731, '2112', 1372, 0),
(8372, 4861, 5730, '2113', 1373, 0),
(8373, 4860, 5729, '2114', 1374, 0),
(8374, 4859, 5728, '2115', 1375, 0),
(8375, 4858, 5727, '2116', 1376, 0),
(8376, 4857, 5726, '2117', 1377, 0),
(8377, 4856, 5725, '2118', 1378, 0),
(8378, 4855, 5724, '2119', 1379, 0),
(8379, 4854, 5723, '2120', 1380, 0),
(8380, 4853, 5722, '2121', 1381, 0),
(8381, 4852, 5721, '2122', 1382, 0),
(8382, 4851, 5720, '2123', 1383, 0),
(8383, 4850, 5719, '2124', 1384, 0),
(8384, 4849, 5718, '2125', 1385, 0),
(8385, 4848, 5717, '2126', 1386, 0),
(8386, 4847, 5716, '2127', 1387, 0),
(8387, 4846, 5715, '2128', 1388, 0),
(8388, 4845, 5714, '2129', 1389, 0),
(8389, 4844, 5713, '2130', 1390, 0),
(8390, 4843, 5712, '2131', 1391, 0),
(8391, 4842, 5711, '2132', 1392, 0),
(8392, 4841, 5710, '2133', 1393, 0),
(8393, 4840, 5709, '2134', 1394, 0),
(8394, 4839, 5708, '2135', 1395, 0),
(8395, 4838, 5707, '2136', 1396, 0),
(8396, 4837, 5706, '2137', 1397, 0),
(8397, 4836, 5705, '2138', 1398, 0),
(8398, 4835, 5704, '2139', 1399, 0),
(8399, 4834, 5703, '2140', 1400, 0),
(8400, 4833, 5702, '2141', 1401, 0),
(8401, 4832, 5701, '2142', 1402, 0),
(8402, 4831, 5700, '2143', 1403, 0),
(8403, 4830, 5699, '2144', 1404, 0),
(8404, 4829, 5698, '2145', 1405, 0),
(8405, 4828, 5697, '2146', 1406, 0),
(8406, 4827, 5696, '2147', 1407, 0),
(8407, 4826, 5695, '2148', 1408, 0),
(8408, 4825, 5694, '2149', 1409, 0),
(8409, 4824, 5693, '2150', 1410, 0),
(8410, 4823, 5692, '2151', 1411, 0),
(8411, 4822, 5691, '2152', 1412, 0),
(8412, 4821, 5690, '2153', 1413, 0),
(8413, 4820, 5689, '2154', 1414, 0),
(8414, 4819, 5688, '2155', 1415, 0),
(8415, 4818, 5687, '2156', 1416, 0),
(8416, 4817, 5686, '2157', 1417, 0),
(8417, 4816, 5685, '2158', 1418, 0),
(8418, 4815, 5684, '2159', 1419, 0),
(8419, 4814, 5683, '2160', 1420, 0),
(8420, 4813, 5682, '2161', 1421, 0),
(8421, 4812, 5681, '2162', 1422, 0),
(8422, 4811, 5680, '2163', 1423, 0),
(8423, 4810, 5679, '2164', 1424, 0),
(8424, 4809, 5678, '2165', 1425, 0),
(8425, 4808, 5677, '2166', 1426, 0),
(8426, 4807, 5676, '2167', 1427, 0),
(8427, 4806, 5675, '2168', 1428, 0),
(8428, 4805, 5674, '2169', 1429, 0),
(8429, 4804, 5673, '2170', 1430, 0),
(8430, 4803, 5672, '2171', 1431, 0),
(8431, 4802, 5671, '2172', 1432, 0),
(8432, 4801, 5670, '2173', 1433, 0),
(8433, 4800, 5669, '2174', 1434, 0),
(8434, 4799, 5668, '2175', 1435, 0),
(8435, 4798, 5667, '2176', 1436, 0),
(8436, 4797, 5666, '2177', 1437, 0),
(8437, 4796, 5665, '2178', 1438, 0),
(8438, 4795, 5664, '2179', 1439, 0),
(8439, 4794, 5663, '2180', 1440, 0),
(8440, 4793, 5662, '2181', 1441, 0),
(8441, 4792, 5661, '2182', 1442, 0),
(8442, 4791, 5660, '2183', 1443, 0),
(8443, 4790, 5659, '2184', 1444, 0),
(8444, 4789, 5658, '2185', 1445, 0),
(8445, 4788, 5657, '2186', 1446, 0),
(8446, 4787, 5656, '2187', 1447, 0),
(8447, 4786, 5655, '2188', 1448, 0),
(8448, 4785, 5654, '2189', 1449, 0),
(8449, 4784, 5653, '2190', 1450, 0),
(8450, 4783, 5652, '2191', 1451, 0),
(8451, 4782, 5651, '2192', 1452, 0),
(8452, 4781, 5650, '2193', 1453, 0),
(8453, 4780, 5649, '2194', 1454, 0),
(8454, 4779, 5648, '2195', 1455, 0),
(8455, 4778, 5647, '2196', 1456, 0),
(8456, 4777, 5646, '2197', 1457, 0),
(8457, 4776, 5645, '2198', 1458, 0),
(8458, 4775, 5644, '2199', 1459, 0),
(8459, 4774, 5643, '2200', 1460, 0),
(8460, 4773, 5642, '2201', 1461, 0),
(8461, 4772, 5641, '2202', 1462, 0),
(8462, 4771, 5640, '2203', 1463, 0),
(8463, 4770, 5639, '2204', 1464, 0),
(8464, 4769, 5638, '2205', 1465, 0),
(8465, 4768, 5637, '2206', 1466, 0),
(8466, 4767, 5636, '2207', 1467, 0),
(8467, 4766, 5635, '2208', 1468, 0),
(8468, 4765, 5634, '2209', 1469, 0),
(8469, 4764, 5633, '2210', 1470, 0),
(8470, 4763, 5632, '2211', 1471, 0),
(8471, 4762, 5631, '2212', 1472, 0),
(8472, 4761, 5630, '2213', 1473, 0),
(8473, 4760, 5629, '2214', 1474, 0),
(8474, 4759, 5628, '2215', 1475, 0),
(8475, 4758, 5627, '2216', 1476, 0),
(8476, 4757, 5626, '2217', 1477, 0),
(8477, 4756, 5625, '2218', 1478, 0),
(8478, 4755, 5624, '2219', 1479, 0),
(8479, 4754, 5623, '2220', 1480, 0),
(8480, 4753, 5622, '2221', 1481, 0),
(8481, 4752, 5621, '2222', 1482, 0),
(8482, 4751, 5620, '2223', 1483, 0),
(8483, 4750, 5619, '2224', 1484, 0),
(8484, 4749, 5618, '2225', 1485, 0),
(8485, 4748, 5617, '2226', 1486, 0),
(8486, 4747, 5616, '2227', 1487, 0),
(8487, 4746, 5615, '2228', 1488, 0),
(8488, 4745, 5614, '2229', 1489, 0),
(8489, 4744, 5613, '2230', 1490, 0),
(8490, 4743, 5612, '2231', 1491, 0),
(8491, 4742, 5611, '2232', 1492, 0),
(8492, 4741, 5610, '2233', 1493, 0),
(8493, 4740, 5609, '2234', 1494, 0),
(8494, 4739, 5608, '2235', 1495, 0),
(8495, 4738, 5607, '2236', 1496, 0),
(8496, 4737, 5606, '2237', 1497, 0),
(8497, 4736, 5605, '2238', 1498, 0),
(8498, 4735, 5604, '2239', 1499, 0),
(8499, 4734, 5603, '2240', 1500, 0),
(8500, 4733, 5602, '2241', 1501, 0),
(8501, 4732, 5601, '2242', 1502, 0),
(8502, 4731, 5600, '2243', 1503, 0),
(8503, 4730, 5599, '2244', 1504, 0),
(8504, 4729, 5598, '2245', 1505, 0),
(8505, 4728, 5597, '2246', 1506, 0),
(8506, 4727, 5596, '2247', 1507, 0),
(8507, 4726, 5595, '2248', 1508, 0),
(8508, 4725, 5594, '2249', 1509, 0),
(8509, 4724, 5593, '2250', 1510, 0),
(8510, 4723, 5592, '2251', 1511, 0),
(8511, 4722, 5591, '2252', 1512, 0),
(8512, 4721, 5590, '2253', 1513, 0),
(8513, 4720, 5589, '2254', 1514, 0),
(8514, 4719, 5588, '2255', 1515, 0),
(8515, 4718, 5587, '2256', 1516, 0),
(8516, 4717, 5586, '2257', 1517, 0),
(8517, 4716, 5585, '2258', 1518, 0),
(8518, 4715, 5584, '2259', 1519, 0),
(8519, 4714, 5583, '2260', 1520, 0),
(8520, 4713, 5582, '2261', 1521, 0),
(8521, 4712, 5581, '2262', 1522, 0),
(8522, 4711, 5580, '2263', 1523, 0),
(8523, 4710, 5579, '2264', 1524, 0),
(8524, 4709, 5578, '2265', 1525, 0),
(8525, 4708, 5577, '2266', 1526, 0),
(8526, 4707, 5576, '2267', 1527, 0),
(8527, 4706, 5575, '2268', 1528, 0),
(8528, 4705, 5574, '2269', 1529, 0),
(8529, 4704, 5573, '2270', 1530, 0),
(8530, 4703, 5572, '2271', 1531, 0),
(8531, 4702, 5571, '2272', 1532, 0),
(8532, 4701, 5570, '2273', 1533, 0),
(8533, 4700, 5569, '2274', 1534, 0),
(8534, 4699, 5568, '2275', 1535, 0),
(8535, 4698, 5567, '2276', 1536, 0),
(8536, 4697, 5566, '2277', 1537, 0),
(8537, 4696, 5565, '2278', 1538, 0),
(8538, 4695, 5564, '2279', 1539, 0),
(8539, 4694, 5563, '2280', 1540, 0),
(8540, 4693, 5562, '2281', 1541, 0),
(8541, 4692, 5561, '2282', 1542, 0),
(8542, 4691, 5560, '2283', 1543, 0),
(8543, 4690, 5559, '2284', 1544, 0),
(8544, 4689, 5558, '2285', 1545, 0),
(8545, 4688, 5557, '2286', 1546, 0),
(8546, 4687, 5556, '2287', 1547, 0),
(8547, 4686, 5555, '2288', 1548, 0),
(8548, 4685, 5554, '2289', 1549, 0),
(8549, 4684, 5553, '2290', 1550, 0),
(8550, 4683, 5552, '2291', 1551, 0),
(8551, 4682, 5551, '2292', 1552, 0),
(8552, 4681, 5550, '2293', 1553, 0),
(8553, 4680, 5549, '2294', 1554, 0),
(8554, 4679, 5548, '2295', 1555, 0),
(8555, 4678, 5547, '2296', 1556, 0),
(8556, 4677, 5546, '2297', 1557, 0),
(8557, 4676, 5545, '2298', 1558, 0),
(8558, 4675, 5544, '2299', 1559, 0),
(8559, 4674, 5543, '2300', 1560, 0),
(8560, 4673, 5542, '2301', 1561, 0),
(8561, 4672, 5541, '2302', 1562, 0),
(8562, 4671, 5540, '2303', 1563, 0),
(8563, 4670, 5539, '2304', 1564, 0),
(8564, 4669, 5538, '2305', 1565, 0),
(8565, 4668, 5537, '2306', 1566, 0),
(8566, 4667, 5536, '2307', 1567, 0),
(8567, 4666, 5535, '2308', 1568, 0),
(8568, 4665, 5534, '2309', 1569, 0),
(8569, 4664, 5533, '2310', 1570, 0),
(8570, 4663, 5532, '2311', 1571, 0),
(8571, 4662, 5531, '2312', 1572, 0),
(8572, 4661, 5530, '2313', 1573, 0),
(8573, 4660, 5529, '2314', 1574, 0),
(8574, 4659, 5528, '2315', 1575, 0),
(8575, 4658, 5527, '2316', 1576, 0),
(8576, 4657, 5526, '2317', 1577, 0),
(8577, 4656, 5525, '2318', 1578, 0),
(8578, 4655, 5524, '2319', 1579, 0),
(8579, 4654, 5523, '2320', 1580, 0),
(8580, 4653, 5522, '2321', 1581, 0),
(8581, 4652, 5521, '2322', 1582, 0),
(8582, 4651, 5520, '2323', 1583, 0),
(8583, 4650, 5519, '2324', 1584, 0),
(8584, 4649, 5518, '2325', 1585, 0),
(8585, 4648, 5517, '2326', 1586, 0),
(8586, 4647, 5516, '2327', 1587, 0),
(8587, 4646, 5515, '2328', 1588, 0),
(8588, 4645, 5514, '2329', 1589, 0),
(8589, 4644, 5513, '2330', 1590, 0),
(8590, 4643, 5512, '2331', 1591, 0),
(8591, 4642, 5511, '2332', 1592, 0),
(8592, 4641, 5510, '2333', 1593, 0),
(8593, 4640, 5509, '2334', 1594, 0),
(8594, 4639, 5508, '2335', 1595, 0),
(8595, 4638, 5507, '2336', 1596, 0),
(8596, 4637, 5506, '2337', 1597, 0),
(8597, 4636, 5505, '2338', 1598, 0),
(8598, 4635, 5504, '2339', 1599, 0),
(8599, 4634, 5503, '2340', 1600, 0),
(8600, 4633, 5502, '2341', 1601, 0),
(8601, 4632, 5501, '2342', 1602, 0),
(8602, 4631, 5500, '2343', 1603, 0),
(8603, 4630, 5499, '2344', 1604, 0),
(8604, 4629, 5498, '2345', 1605, 0),
(8605, 4628, 5497, '2346', 1606, 0),
(8606, 4627, 5496, '2347', 1607, 0),
(8607, 4626, 5495, '2348', 1608, 0),
(8608, 4625, 5494, '2349', 1609, 0),
(8609, 4624, 5493, '2350', 1610, 0),
(8610, 4623, 5492, '2351', 1611, 0),
(8611, 4622, 5491, '2352', 1612, 0),
(8612, 4621, 5490, '2353', 1613, 0),
(8613, 4620, 5489, '2354', 1614, 0),
(8614, 4619, 5488, '2355', 1615, 0),
(8615, 4618, 5487, '2356', 1616, 0),
(8616, 4617, 5486, '2357', 1617, 0),
(8617, 4616, 5485, '2358', 1618, 0),
(8618, 4615, 5484, '2359', 1619, 0),
(8619, 4614, 5483, '2360', 1620, 0),
(8620, 4613, 5482, '2361', 1621, 0),
(8621, 4612, 5481, '2362', 1622, 0),
(8622, 4611, 5480, '2363', 1623, 0),
(8623, 4610, 5479, '2364', 1624, 0),
(8624, 4609, 5478, '2365', 1625, 0),
(8625, 4608, 5477, '2366', 1626, 0),
(8626, 4607, 5476, '2367', 1627, 0),
(8627, 4606, 5475, '2368', 1628, 0),
(8628, 4605, 5474, '2369', 1629, 0),
(8629, 4604, 5473, '2370', 1630, 0),
(8630, 4603, 5472, '2371', 1631, 0),
(8631, 4602, 5471, '2372', 1632, 0),
(8632, 4601, 5470, '2373', 1633, 0),
(8633, 4600, 5469, '2374', 1634, 0),
(8634, 4599, 5468, '2375', 1635, 0),
(8635, 4598, 5467, '2376', 1636, 0),
(8636, 4597, 5466, '2377', 1637, 0),
(8637, 4596, 5465, '2378', 1638, 0),
(8638, 4595, 5464, '2379', 1639, 0),
(8639, 4594, 5463, '2380', 1640, 0),
(8640, 4593, 5462, '2381', 1641, 0),
(8641, 4592, 5461, '2382', 1642, 0),
(8642, 4591, 5460, '2383', 1643, 0),
(8643, 4590, 5459, '2384', 1644, 0),
(8644, 4589, 5458, '2385', 1645, 0),
(8645, 4588, 5457, '2386', 1646, 0),
(8646, 4587, 5456, '2387', 1647, 0),
(8647, 4586, 5455, '2388', 1648, 0),
(8648, 4585, 5454, '2389', 1649, 0),
(8649, 4584, 5453, '2390', 1650, 0),
(8650, 4583, 5452, '2391', 1651, 0),
(8651, 4582, 5451, '2392', 1652, 0),
(8652, 4581, 5450, '2393', 1653, 0),
(8653, 4580, 5449, '2394', 1654, 0),
(8654, 4579, 5448, '2395', 1655, 0),
(8655, 4578, 5447, '2396', 1656, 0),
(8656, 4577, 5446, '2397', 1657, 0),
(8657, 4576, 5445, '2398', 1658, 0),
(8658, 4575, 5444, '2399', 1659, 0),
(8659, 4574, 5443, '2400', 1660, 0),
(8660, 4573, 5442, '2401', 1661, 0),
(8661, 4572, 5441, '2402', 1662, 0),
(8662, 4571, 5440, '2403', 1663, 0),
(8663, 4570, 5439, '2404', 1664, 0),
(8664, 4569, 5438, '2405', 1665, 0),
(8665, 4568, 5437, '2406', 1666, 0),
(8666, 4567, 5436, '2407', 1667, 0),
(8667, 4566, 5435, '2408', 1668, 0),
(8668, 4565, 5434, '2409', 1669, 0),
(8669, 4564, 5433, '2410', 1670, 0),
(8670, 4563, 5432, '2411', 1671, 0),
(8671, 4562, 5431, '2412', 1672, 0),
(8672, 4561, 5430, '2413', 1673, 0),
(8673, 4560, 5429, '2414', 1674, 0),
(8674, 4559, 5428, '2415', 1675, 0),
(8675, 4558, 5427, '2416', 1676, 0),
(8676, 4557, 5426, '2417', 1677, 0),
(8677, 4556, 5425, '2418', 1678, 0),
(8678, 4555, 5424, '2419', 1679, 0),
(8679, 4554, 5423, '2420', 1680, 0),
(8680, 4553, 5422, '2421', 1681, 0),
(8681, 4552, 5421, '2422', 1682, 0),
(8682, 4551, 5420, '2423', 1683, 0),
(8683, 4550, 5419, '2424', 1684, 0),
(8684, 4549, 5418, '2425', 1685, 0),
(8685, 4548, 5417, '2426', 1686, 0),
(8686, 4547, 5416, '2427', 1687, 0),
(8687, 4546, 5415, '2428', 1688, 0),
(8688, 4545, 5414, '2429', 1689, 0),
(8689, 4544, 5413, '2430', 1690, 0),
(8690, 4543, 5412, '2431', 1691, 0),
(8691, 4542, 5411, '2432', 1692, 0),
(8692, 4541, 5410, '2433', 1693, 0),
(8693, 4540, 5409, '2434', 1694, 0),
(8694, 4539, 5408, '2435', 1695, 0),
(8695, 4538, 5407, '2436', 1696, 0),
(8696, 4537, 5406, '2437', 1697, 0),
(8697, 4536, 5405, '2438', 1698, 0),
(8698, 4535, 5404, '2439', 1699, 0),
(8699, 4534, 5403, '2440', 1700, 0),
(8700, 4533, 5402, '2441', 1701, 0),
(8701, 4532, 5401, '2442', 1702, 0),
(8702, 4531, 5400, '2443', 1703, 0),
(8703, 4530, 5399, '2444', 1704, 0),
(8704, 4529, 5398, '2445', 1705, 0),
(8705, 4528, 5397, '2446', 1706, 0),
(8706, 4527, 5396, '2447', 1707, 0),
(8707, 4526, 5395, '2448', 1708, 0),
(8708, 4525, 5394, '2449', 1709, 0),
(8709, 4524, 5393, '2450', 1710, 0),
(8710, 4523, 5392, '2451', 1711, 0),
(8711, 4522, 5391, '2452', 1712, 0),
(8712, 4521, 5390, '2453', 1713, 0),
(8713, 4520, 5389, '2454', 1714, 0),
(8714, 4519, 5388, '2455', 1715, 0),
(8715, 4518, 5387, '2456', 1716, 0),
(8716, 4517, 5386, '2457', 1717, 0),
(8717, 4516, 5385, '2458', 1718, 0),
(8718, 4515, 5384, '2459', 1719, 0),
(8719, 4514, 5383, '2460', 1720, 0),
(8720, 4513, 5382, '2461', 1721, 0),
(8721, 4512, 5381, '2462', 1722, 0),
(8722, 4511, 5380, '2463', 1723, 0),
(8723, 4510, 5379, '2464', 1724, 0),
(8724, 4509, 5378, '2465', 1725, 0),
(8725, 4508, 5377, '2466', 1726, 0),
(8726, 4507, 5376, '2467', 1727, 0),
(8727, 4506, 5375, '2468', 1728, 0),
(8728, 4505, 5374, '2469', 1729, 0),
(8729, 4504, 5373, '2470', 1730, 0),
(8730, 4503, 5372, '2471', 1731, 0),
(8731, 4502, 5371, '2472', 1732, 0),
(8732, 4501, 5370, '2473', 1733, 0),
(8733, 4500, 5369, '2474', 1734, 0),
(8734, 4499, 5368, '2475', 1735, 0),
(8735, 4498, 5367, '2476', 1736, 0),
(8736, 4497, 5366, '2477', 1737, 0),
(8737, 4496, 5365, '2478', 1738, 0),
(8738, 4495, 5364, '2479', 1739, 0),
(8739, 4494, 5363, '2480', 1740, 0),
(8740, 4493, 5362, '2481', 1741, 0),
(8741, 4492, 5361, '2482', 1742, 0),
(8742, 4491, 5360, '2483', 1743, 0),
(8743, 4490, 5359, '2484', 1744, 0),
(8744, 4489, 5358, '2485', 1745, 0),
(8745, 4488, 5357, '2486', 1746, 0),
(8746, 4487, 5356, '2487', 1747, 0),
(8747, 4486, 5355, '2488', 1748, 0),
(8748, 4485, 5354, '2489', 1749, 0),
(8749, 4484, 5353, '2490', 1750, 0),
(8750, 4483, 5352, '2491', 1751, 0),
(8751, 4482, 5351, '2492', 1752, 0),
(8752, 4481, 5350, '2493', 1753, 0),
(8753, 4480, 5349, '2494', 1754, 0),
(8754, 4479, 5348, '2495', 1755, 0),
(8755, 4478, 5347, '2496', 1756, 0),
(8756, 4477, 5346, '2497', 1757, 0),
(8757, 4476, 5345, '2498', 1758, 0),
(8758, 4475, 5344, '2499', 1759, 0),
(8759, 4474, 5343, '0000', 1760, 0),
(8760, 4473, 5342, '0001', 1761, 0),
(8761, 4472, 5341, '0002', 1762, 0),
(8762, 4471, 5340, '0003', 1763, 0),
(8763, 4470, 5339, '0004', 1764, 0),
(8764, 4469, 5338, '0005', 1765, 0),
(8765, 4468, 5337, '0006', 1766, 0),
(8766, 4467, 5336, '0007', 1767, 0),
(8767, 4466, 5335, '0008', 1768, 0),
(8768, 4465, 5334, '0009', 1769, 0),
(8769, 4464, 5333, '0010', 1770, 0),
(8770, 4463, 5332, '0011', 1771, 0),
(8771, 4462, 5331, '0012', 1772, 0),
(8772, 4461, 5330, '0013', 1773, 0),
(8773, 4460, 5329, '0014', 1774, 0),
(8774, 4459, 5328, '0015', 1775, 0),
(8775, 4458, 5327, '0016', 1776, 0),
(8776, 4457, 5326, '0017', 1777, 0),
(8777, 4456, 5325, '0018', 1778, 0),
(8778, 4455, 5324, '0019', 1779, 0),
(8779, 4454, 5323, '0020', 1780, 0),
(8780, 4453, 5322, '0021', 1781, 0),
(8781, 4452, 5321, '0022', 1782, 0),
(8782, 4451, 5320, '0023', 1783, 0),
(8783, 4450, 5319, '0024', 1784, 0),
(8784, 4449, 5318, '0025', 1785, 0),
(8785, 4448, 5317, '0026', 1786, 0),
(8786, 4447, 5316, '0027', 1787, 0),
(8787, 4446, 5315, '0028', 1788, 0),
(8788, 4445, 5314, '0029', 1789, 0),
(8789, 4444, 5313, '0030', 1790, 0),
(8790, 4443, 5312, '0031', 1791, 0),
(8791, 4442, 5311, '0032', 1792, 0),
(8792, 4441, 5310, '0033', 1793, 0),
(8793, 4440, 5309, '0034', 1794, 0),
(8794, 4439, 5308, '0035', 1795, 0),
(8795, 4438, 5307, '0036', 1796, 0),
(8796, 4437, 5306, '0037', 1797, 0),
(8797, 4436, 5305, '0038', 1798, 0),
(8798, 4435, 5304, '0039', 1799, 0),
(8799, 4434, 5303, '0040', 1800, 0),
(8800, 4433, 5302, '0041', 1801, 0),
(8801, 4432, 5301, '0042', 1802, 0),
(8802, 4431, 5300, '0043', 1803, 0),
(8803, 4430, 5299, '0044', 1804, 0),
(8804, 4429, 5298, '0045', 1805, 0),
(8805, 4428, 5297, '0046', 1806, 0),
(8806, 4427, 5296, '0047', 1807, 0),
(8807, 4426, 5295, '0048', 1808, 0),
(8808, 4425, 5294, '0049', 1809, 0),
(8809, 4424, 5293, '0050', 1810, 0),
(8810, 4423, 5292, '0051', 1811, 0),
(8811, 4422, 5291, '0052', 1812, 0),
(8812, 4421, 5290, '0053', 1813, 0),
(8813, 4420, 5289, '0054', 1814, 0),
(8814, 4419, 5288, '0055', 1815, 0),
(8815, 4418, 5287, '0056', 1816, 0),
(8816, 4417, 5286, '0057', 1817, 0),
(8817, 4416, 5285, '0058', 1818, 0),
(8818, 4415, 5284, '0059', 1819, 0),
(8819, 4414, 5283, '0060', 1820, 0),
(8820, 4413, 5282, '0061', 1821, 0),
(8821, 4412, 5281, '0062', 1822, 0),
(8822, 4411, 5280, '0063', 1823, 0),
(8823, 4410, 5279, '0064', 1824, 0),
(8824, 4409, 5278, '0065', 1825, 0),
(8825, 4408, 5277, '0066', 1826, 0),
(8826, 4407, 5276, '0067', 1827, 0),
(8827, 4406, 5275, '0068', 1828, 0),
(8828, 4405, 5274, '0069', 1829, 0),
(8829, 4404, 5273, '0070', 1830, 0),
(8830, 4403, 5272, '0071', 1831, 0),
(8831, 4402, 5271, '0072', 1832, 0),
(8832, 4401, 5270, '0073', 1833, 0),
(8833, 4400, 5269, '0074', 1834, 0),
(8834, 4399, 5268, '0075', 1835, 0),
(8835, 4398, 5267, '0076', 1836, 0),
(8836, 4397, 5266, '0077', 1837, 0),
(8837, 4396, 5265, '0078', 1838, 0),
(8838, 4395, 5264, '0079', 1839, 0),
(8839, 4394, 5263, '0080', 1840, 0),
(8840, 4393, 5262, '0081', 1841, 0),
(8841, 4392, 5261, '0082', 1842, 0),
(8842, 4391, 5260, '0083', 1843, 0),
(8843, 4390, 5259, '0084', 1844, 0),
(8844, 4389, 5258, '0085', 1845, 0),
(8845, 4388, 5257, '0086', 1846, 0),
(8846, 4387, 5256, '0087', 1847, 0),
(8847, 4386, 5255, '0088', 1848, 0),
(8848, 4385, 5254, '0089', 1849, 0),
(8849, 4384, 5253, '0090', 1850, 0),
(8850, 4383, 5252, '0091', 1851, 0),
(8851, 4382, 5251, '0092', 1852, 0),
(8852, 4381, 5250, '0093', 1853, 0),
(8853, 4380, 5249, '0094', 1854, 0),
(8854, 4379, 5248, '0095', 1855, 0),
(8855, 4378, 5247, '0096', 1856, 0),
(8856, 4377, 5246, '0097', 1857, 0),
(8857, 4376, 5245, '0098', 1858, 0),
(8858, 4375, 5244, '0099', 1859, 0),
(8859, 4374, 5243, '0100', 1860, 0),
(8860, 4373, 5242, '0101', 1861, 0),
(8861, 4372, 5241, '0102', 1862, 0),
(8862, 4371, 5240, '0103', 1863, 0),
(8863, 4370, 5239, '0104', 1864, 0),
(8864, 4369, 5238, '0105', 1865, 0),
(8865, 4368, 5237, '0106', 1866, 0),
(8866, 4367, 5236, '0107', 1867, 0),
(8867, 4366, 5235, '0108', 1868, 0),
(8868, 4365, 5234, '0109', 1869, 0),
(8869, 4364, 5233, '0110', 1870, 0),
(8870, 4363, 5232, '0111', 1871, 0),
(8871, 4362, 5231, '0112', 1872, 0),
(8872, 4361, 5230, '0113', 1873, 0),
(8873, 4360, 5229, '0114', 1874, 0),
(8874, 4359, 5228, '0115', 1875, 0),
(8875, 4358, 5227, '0116', 1876, 0),
(8876, 4357, 5226, '0117', 1877, 0),
(8877, 4356, 5225, '0118', 1878, 0),
(8878, 4355, 5224, '0119', 1879, 0),
(8879, 4354, 5223, '0120', 1880, 0),
(8880, 4353, 5222, '0121', 1881, 0),
(8881, 4352, 5221, '0122', 1882, 0),
(8882, 4351, 5220, '0123', 1883, 0),
(8883, 4350, 5219, '0124', 1884, 0),
(8884, 4349, 5218, '0125', 1885, 0),
(8885, 4348, 5217, '0126', 1886, 0),
(8886, 4347, 5216, '0127', 1887, 0),
(8887, 4346, 5215, '0128', 1888, 0),
(8888, 4345, 5214, '0129', 1889, 0),
(8889, 4344, 5213, '0130', 1890, 0),
(8890, 4343, 5212, '0131', 1891, 0),
(8891, 4342, 5211, '0132', 1892, 0),
(8892, 4341, 5210, '0133', 1893, 0),
(8893, 4340, 5209, '0134', 1894, 0),
(8894, 4339, 5208, '0135', 1895, 0),
(8895, 4338, 5207, '0136', 1896, 0),
(8896, 4337, 5206, '0137', 1897, 0),
(8897, 4336, 5205, '0138', 1898, 0),
(8898, 4335, 5204, '0139', 1899, 0),
(8899, 4334, 5203, '0140', 1900, 0),
(8900, 4333, 5202, '0141', 1901, 0),
(8901, 4332, 5201, '0142', 1902, 0),
(8902, 4331, 5200, '0143', 1903, 0),
(8903, 4330, 5199, '0144', 1904, 0),
(8904, 4329, 5198, '0145', 1905, 0),
(8905, 4328, 5197, '0146', 1906, 0),
(8906, 4327, 5196, '0147', 1907, 0),
(8907, 4326, 5195, '0148', 1908, 0),
(8908, 4325, 5194, '0149', 1909, 0),
(8909, 4324, 5193, '0150', 1910, 0),
(8910, 4323, 5192, '0151', 1911, 0),
(8911, 4322, 5191, '0152', 1912, 0),
(8912, 4321, 5190, '0153', 1913, 0),
(8913, 4320, 5189, '0154', 1914, 0),
(8914, 4319, 5188, '0155', 1915, 0),
(8915, 4318, 5187, '0156', 1916, 0),
(8916, 4317, 5186, '0157', 1917, 0),
(8917, 4316, 5185, '0158', 1918, 0),
(8918, 4315, 5184, '0159', 1919, 0),
(8919, 4314, 5183, '0160', 1920, 0),
(8920, 4313, 5182, '0161', 1921, 0),
(8921, 4312, 5181, '0162', 1922, 0),
(8922, 4311, 5180, '0163', 1923, 0),
(8923, 4310, 5179, '0164', 1924, 0),
(8924, 4309, 5178, '0165', 1925, 0),
(8925, 4308, 5177, '0166', 1926, 0);
INSERT INTO `loteries` (`col1`, `col2`, `col3`, `col4`, `id`, `sell`) VALUES
(8926, 4307, 5176, '0167', 1927, 0),
(8927, 4306, 5175, '0168', 1928, 0),
(8928, 4305, 5174, '0169', 1929, 0),
(8929, 4304, 5173, '0170', 1930, 0),
(8930, 4303, 5172, '0171', 1931, 0),
(8931, 4302, 5171, '0172', 1932, 0),
(8932, 4301, 5170, '0173', 1933, 0),
(8933, 4300, 5169, '0174', 1934, 0),
(8934, 4299, 5168, '0175', 1935, 0),
(8935, 4298, 5167, '0176', 1936, 0),
(8936, 4297, 5166, '0177', 1937, 0),
(8937, 4296, 5165, '0178', 1938, 0),
(8938, 4295, 5164, '0179', 1939, 0),
(8939, 4294, 5163, '0180', 1940, 0),
(8940, 4293, 5162, '0181', 1941, 0),
(8941, 4292, 5161, '0182', 1942, 0),
(8942, 4291, 5160, '0183', 1943, 0),
(8943, 4290, 5159, '0184', 1944, 0),
(8944, 4289, 5158, '0185', 1945, 0),
(8945, 4288, 5157, '0186', 1946, 0),
(8946, 4287, 5156, '0187', 1947, 0),
(8947, 4286, 5155, '0188', 1948, 0),
(8948, 4285, 5154, '0189', 1949, 0),
(8949, 4284, 5153, '0190', 1950, 0),
(8950, 4283, 5152, '0191', 1951, 0),
(8951, 4282, 5151, '0192', 1952, 0),
(8952, 4281, 5150, '0193', 1953, 0),
(8953, 4280, 5149, '0194', 1954, 0),
(8954, 4279, 5148, '0195', 1955, 0),
(8955, 4278, 5147, '0196', 1956, 0),
(8956, 4277, 5146, '0197', 1957, 0),
(8957, 4276, 5145, '0198', 1958, 0),
(8958, 4275, 5144, '0199', 1959, 0),
(8959, 4274, 5143, '0200', 1960, 0),
(8960, 4273, 5142, '0201', 1961, 0),
(8961, 4272, 5141, '0202', 1962, 0),
(8962, 4271, 5140, '0203', 1963, 0),
(8963, 4270, 5139, '0204', 1964, 0),
(8964, 4269, 5138, '0205', 1965, 0),
(8965, 4268, 5137, '0206', 1966, 0),
(8966, 4267, 5136, '0207', 1967, 0),
(8967, 4266, 5135, '0208', 1968, 0),
(8968, 4265, 5134, '0209', 1969, 0),
(8969, 4264, 5133, '0210', 1970, 0),
(8970, 4263, 5132, '0211', 1971, 0),
(8971, 4262, 5131, '0212', 1972, 0),
(8972, 4261, 5130, '0213', 1973, 0),
(8973, 4260, 5129, '0214', 1974, 0),
(8974, 4259, 5128, '0215', 1975, 0),
(8975, 4258, 5127, '0216', 1976, 0),
(8976, 4257, 5126, '0217', 1977, 0),
(8977, 4256, 5125, '0218', 1978, 0),
(8978, 4255, 5124, '0219', 1979, 0),
(8979, 4254, 5123, '0220', 1980, 0),
(8980, 4253, 5122, '0221', 1981, 0),
(8981, 4252, 5121, '0222', 1982, 0),
(8982, 4251, 5120, '0223', 1983, 0),
(8983, 4250, 5119, '0224', 1984, 0),
(8984, 4249, 5118, '0225', 1985, 0),
(8985, 4248, 5117, '0226', 1986, 0),
(8986, 4247, 5116, '0227', 1987, 0),
(8987, 4246, 5115, '0228', 1988, 0),
(8988, 4245, 5114, '0229', 1989, 0),
(8989, 4244, 5113, '0230', 1990, 0),
(8990, 4243, 5112, '0231', 1991, 0),
(8991, 4242, 5111, '0232', 1992, 0),
(8992, 4241, 5110, '0233', 1993, 0),
(8993, 4240, 5109, '0234', 1994, 0),
(8994, 4239, 5108, '0235', 1995, 0),
(8995, 4238, 5107, '0236', 1996, 0),
(8996, 4237, 5106, '0237', 1997, 0),
(8997, 4236, 5105, '0238', 1998, 0),
(8998, 4235, 5104, '0239', 1999, 0),
(8999, 4234, 5103, '0240', 2000, 0),
(9000, 4233, 5102, '0241', 1, 0),
(9001, 4232, 5101, '0242', 2, 0),
(9002, 4231, 5100, '0243', 3, 0),
(9003, 4230, 5099, '0244', 4, 0),
(9004, 4229, 5098, '0245', 5, 0),
(9005, 4228, 5097, '0246', 6, 0),
(9006, 4227, 5096, '0247', 7, 0),
(9007, 4226, 5095, '0248', 8, 0),
(9008, 4225, 5094, '0249', 9, 0),
(9009, 4224, 5093, '0250', 10, 0),
(9010, 4223, 5092, '0251', 11, 0),
(9011, 4222, 5091, '0252', 12, 0),
(9012, 4221, 5090, '0253', 13, 0),
(9013, 4220, 5089, '0254', 14, 0),
(9014, 4219, 5088, '0255', 15, 0),
(9015, 4218, 5087, '0256', 16, 0),
(9016, 4217, 5086, '0257', 17, 0),
(9017, 4216, 5085, '0258', 18, 0),
(9018, 4215, 5084, '0259', 19, 0),
(9019, 4214, 5083, '0260', 20, 0),
(9020, 4213, 5082, '0261', 21, 0),
(9021, 4212, 5081, '0262', 22, 0),
(9022, 4211, 5080, '0263', 23, 0),
(9023, 4210, 5079, '0264', 24, 0),
(9024, 4209, 5078, '0265', 25, 0),
(9025, 4208, 5077, '0266', 26, 0),
(9026, 4207, 5076, '0267', 27, 0),
(9027, 4206, 5075, '0268', 28, 0),
(9028, 4205, 5074, '0269', 29, 0),
(9029, 4204, 5073, '0270', 30, 0),
(9030, 4203, 5072, '0271', 31, 0),
(9031, 4202, 5071, '0272', 32, 0),
(9032, 4201, 5070, '0273', 33, 0),
(9033, 4200, 5069, '0274', 34, 0),
(9034, 4199, 5068, '0275', 35, 0),
(9035, 4198, 5067, '0276', 36, 0),
(9036, 4197, 5066, '0277', 37, 0),
(9037, 4196, 5065, '0278', 38, 0),
(9038, 4195, 5064, '0279', 39, 0),
(9039, 4194, 5063, '0280', 40, 0),
(9040, 4193, 5062, '0281', 41, 0),
(9041, 4192, 5061, '0282', 42, 0),
(9042, 4191, 5060, '0283', 43, 0),
(9043, 4190, 5059, '0284', 44, 0),
(9044, 4189, 5058, '0285', 45, 0),
(9045, 4188, 5057, '0286', 46, 0),
(9046, 4187, 5056, '0287', 47, 0),
(9047, 4186, 5055, '0288', 48, 0),
(9048, 4185, 5054, '0289', 49, 0),
(9049, 4184, 5053, '0290', 50, 0),
(9050, 4183, 5052, '0291', 51, 0),
(9051, 4182, 5051, '0292', 52, 0),
(9052, 4181, 5050, '0293', 53, 0),
(9053, 4180, 5049, '0294', 54, 0),
(9054, 4179, 5048, '0295', 55, 0),
(9055, 4178, 5047, '0296', 56, 0),
(9056, 4177, 5046, '0297', 57, 0),
(9057, 4176, 5045, '0298', 58, 0),
(9058, 4175, 5044, '0299', 59, 0),
(9059, 4174, 5043, '0300', 60, 0),
(9060, 4173, 5042, '0301', 61, 0),
(9061, 4172, 5041, '0302', 62, 0),
(9062, 4171, 5040, '0303', 63, 0),
(9063, 4170, 5039, '0304', 64, 0),
(9064, 4169, 5038, '0305', 65, 0),
(9065, 4168, 5037, '0306', 66, 0),
(9066, 4167, 5036, '0307', 67, 0),
(9067, 4166, 5035, '0308', 68, 0),
(9068, 4165, 5034, '0309', 69, 0),
(9069, 4164, 5033, '0310', 70, 0),
(9070, 4163, 5032, '0311', 71, 0),
(9071, 4162, 5031, '0312', 72, 0),
(9072, 4161, 5030, '0313', 73, 0),
(9073, 4160, 5029, '0314', 74, 0),
(9074, 4159, 5028, '0315', 75, 0),
(9075, 4158, 5027, '0316', 76, 0),
(9076, 4157, 5026, '0317', 77, 0),
(9077, 4156, 5025, '0318', 78, 0),
(9078, 4155, 5024, '0319', 79, 0),
(9079, 4154, 5023, '0320', 80, 0),
(9080, 4153, 5022, '0321', 81, 0),
(9081, 4152, 5021, '0322', 82, 0),
(9082, 4151, 5020, '0323', 83, 0),
(9083, 4150, 5019, '0324', 84, 0),
(9084, 4149, 5018, '0325', 85, 0),
(9085, 4148, 5017, '0326', 86, 0),
(9086, 4147, 5016, '0327', 87, 0),
(9087, 4146, 5015, '0328', 88, 0),
(9088, 4145, 5014, '0329', 89, 0),
(9089, 4144, 5013, '0330', 90, 0),
(9090, 4143, 5012, '0331', 91, 0),
(9091, 4142, 5011, '0332', 92, 0),
(9092, 4141, 5010, '0333', 93, 0),
(9093, 4140, 5009, '0334', 94, 0),
(9094, 4139, 5008, '0335', 95, 0),
(9095, 4138, 5007, '0336', 96, 0),
(9096, 4137, 5006, '0337', 97, 0),
(9097, 4136, 5005, '0338', 98, 0),
(9098, 4135, 5004, '0339', 99, 0),
(9099, 4134, 5003, '0340', 100, 0),
(9100, 4133, 5002, '0341', 101, 0),
(9101, 4132, 5001, '0342', 102, 0),
(9102, 4131, 5000, '0343', 103, 0),
(9103, 4130, 6919, '0924', 104, 0),
(9104, 4129, 6918, '0925', 105, 0),
(9105, 4128, 6917, '0926', 106, 0),
(9106, 4127, 6916, '0927', 107, 0),
(9107, 4126, 6915, '0928', 108, 0),
(9108, 4125, 6914, '0929', 109, 0),
(9109, 4124, 6913, '0930', 110, 0),
(9110, 4123, 6912, '0931', 111, 0),
(9111, 4122, 6911, '0932', 112, 0),
(9112, 4121, 6910, '0933', 113, 0),
(9113, 4120, 6909, '0934', 114, 0),
(9114, 4119, 6908, '0935', 115, 0),
(9115, 4118, 6907, '0936', 116, 0),
(9116, 4117, 6906, '0937', 117, 0),
(9117, 4116, 6905, '0938', 118, 0),
(9118, 4115, 6904, '0939', 119, 0),
(9119, 4114, 6903, '0940', 120, 0),
(9120, 4113, 6902, '0941', 121, 0),
(9121, 4112, 6901, '0942', 122, 0),
(9122, 4111, 6900, '0943', 123, 0),
(9123, 4110, 6899, '0944', 124, 0),
(9124, 4109, 6898, '0945', 125, 0),
(9125, 4108, 6897, '0946', 126, 0),
(9126, 4107, 6896, '0947', 127, 0),
(9127, 4106, 6895, '0948', 128, 0),
(9128, 4105, 6894, '0949', 129, 0),
(9129, 4104, 6893, '0950', 130, 0),
(9130, 4103, 6892, '0951', 131, 0),
(9131, 4102, 6891, '0952', 132, 0),
(9132, 4101, 6890, '0953', 133, 0),
(9133, 4100, 6889, '0954', 134, 0),
(9134, 4099, 6888, '0955', 135, 0),
(9135, 4098, 6887, '0956', 136, 0),
(9136, 4097, 6886, '0957', 137, 0),
(9137, 4096, 6885, '0958', 138, 0),
(9138, 4095, 6884, '0959', 139, 0),
(9139, 4094, 6883, '0960', 140, 0),
(9140, 4093, 6882, '0961', 141, 0),
(9141, 4092, 6881, '0962', 142, 0),
(9142, 4091, 6880, '0963', 143, 0),
(9143, 4090, 6879, '0964', 144, 0),
(9144, 4089, 6878, '0965', 145, 0),
(9145, 4088, 6877, '0966', 146, 0),
(9146, 4087, 6876, '0967', 147, 0),
(9147, 4086, 6875, '0968', 148, 0),
(9148, 4085, 6874, '0969', 149, 0),
(9149, 4084, 6873, '0970', 150, 0),
(9150, 4083, 6872, '0971', 151, 0),
(9151, 4082, 6871, '0972', 152, 0),
(9152, 4081, 6870, '0973', 153, 0),
(9153, 4080, 6869, '0974', 154, 0),
(9154, 4079, 6868, '0975', 155, 0),
(9155, 4078, 6867, '0976', 156, 0),
(9156, 4077, 6866, '0977', 157, 0),
(9157, 4076, 6865, '0978', 158, 0),
(9158, 4075, 6864, '0979', 159, 0),
(9159, 4074, 6863, '0980', 160, 0),
(9160, 4073, 6862, '0981', 161, 0),
(9161, 4072, 6861, '0982', 162, 0),
(9162, 4071, 6860, '0983', 163, 0),
(9163, 4070, 6859, '0984', 164, 0),
(9164, 4069, 6858, '0985', 165, 0),
(9165, 4068, 6857, '0986', 166, 0),
(9166, 4067, 6856, '0987', 167, 0),
(9167, 4066, 6855, '0988', 168, 0),
(9168, 4065, 6854, '0989', 169, 0),
(9169, 4064, 6853, '0990', 170, 0),
(9170, 4063, 6852, '0991', 171, 0),
(9171, 4062, 6851, '0992', 172, 0),
(9172, 4061, 6850, '0993', 173, 0),
(9173, 4060, 6849, '0994', 174, 0),
(9174, 4059, 6848, '0995', 175, 0),
(9175, 4058, 6847, '0996', 176, 0),
(9176, 4057, 6846, '0997', 177, 0),
(9177, 4056, 6845, '0998', 178, 0),
(9178, 4055, 6844, '0999', 179, 0),
(9179, 4054, 6843, '1000', 180, 0),
(9180, 4053, 6842, '1001', 181, 0),
(9181, 4052, 6841, '1002', 182, 0),
(9182, 4051, 6840, '1003', 183, 0),
(9183, 4050, 6839, '1004', 184, 0),
(9184, 4049, 6838, '1005', 185, 0),
(9185, 4048, 6837, '1006', 186, 0),
(9186, 4047, 6836, '1007', 187, 0),
(9187, 4046, 6835, '1008', 188, 0),
(9188, 4045, 6834, '1009', 189, 0),
(9189, 4044, 6833, '1010', 190, 0),
(9190, 4043, 6832, '1011', 191, 0),
(9191, 4042, 6831, '1012', 192, 0),
(9192, 4041, 6830, '1013', 193, 0),
(9193, 4040, 6829, '1014', 194, 0),
(9194, 4039, 6828, '1015', 195, 0),
(9195, 4038, 6827, '1016', 196, 0),
(9196, 4037, 6826, '1017', 197, 0),
(9197, 4036, 6825, '1018', 198, 0),
(9198, 4035, 6824, '1019', 199, 0),
(9199, 4034, 6823, '1020', 200, 0),
(9200, 4033, 6822, '1021', 201, 0),
(9201, 4032, 6821, '1022', 202, 0),
(9202, 4031, 6820, '1023', 203, 0),
(9203, 4030, 6819, '1024', 204, 0),
(9204, 4029, 6818, '1025', 205, 0),
(9205, 4028, 6817, '1026', 206, 0),
(9206, 4027, 6816, '1027', 207, 0),
(9207, 4026, 6815, '1028', 208, 0),
(9208, 4025, 6814, '1029', 209, 0),
(9209, 4024, 6813, '1030', 210, 0),
(9210, 4023, 6812, '1031', 211, 0),
(9211, 4022, 6811, '1032', 212, 0),
(9212, 4021, 6810, '1033', 213, 0),
(9213, 4020, 6809, '1034', 214, 0),
(9214, 4019, 6808, '1035', 215, 0),
(9215, 4018, 6807, '1036', 216, 0),
(9216, 4017, 6806, '1037', 217, 0),
(9217, 4016, 6805, '1038', 218, 0),
(9218, 4015, 6804, '1039', 219, 0),
(9219, 4014, 6803, '1040', 220, 0),
(9220, 4013, 6802, '1041', 221, 0),
(9221, 4012, 6801, '1042', 222, 0),
(9222, 4011, 6800, '1043', 223, 0),
(9223, 4010, 6799, '1044', 224, 0),
(9224, 4009, 6798, '1045', 225, 0),
(9225, 4008, 6797, '1046', 226, 0),
(9226, 4007, 6796, '1047', 227, 0),
(9227, 4006, 6795, '1048', 228, 0),
(9228, 4005, 6794, '1049', 229, 0),
(9229, 4004, 6793, '1050', 230, 0),
(9230, 4003, 6792, '1051', 231, 0),
(9231, 4002, 6791, '1052', 232, 0),
(9232, 4001, 6790, '1053', 233, 0),
(9233, 4000, 6789, '1054', 234, 0),
(9234, 3999, 6788, '1055', 235, 0),
(9235, 3998, 6787, '1056', 236, 0),
(9236, 3997, 6786, '1057', 237, 0),
(9237, 3996, 6785, '1058', 238, 0),
(9238, 3995, 6784, '1059', 239, 0),
(9239, 3994, 6783, '1060', 240, 0),
(9240, 3993, 6782, '1061', 241, 0),
(9241, 3992, 6781, '1062', 242, 0),
(9242, 3991, 6780, '1063', 243, 0),
(9243, 3990, 6779, '1064', 244, 0),
(9244, 3989, 6778, '1065', 245, 0),
(9245, 3988, 6777, '1066', 246, 0),
(9246, 3987, 6776, '1067', 247, 0),
(9247, 3986, 6775, '1068', 248, 0),
(9248, 3985, 6774, '1069', 249, 0),
(9249, 3984, 6773, '1070', 250, 0),
(9250, 3983, 6772, '1071', 251, 0),
(9251, 3982, 6771, '1072', 252, 0),
(9252, 3981, 6770, '1073', 253, 0),
(9253, 3980, 6769, '1074', 254, 0),
(9254, 3979, 6768, '1075', 255, 0),
(9255, 3978, 6767, '1076', 256, 0),
(9256, 3977, 6766, '1077', 257, 0),
(9257, 3976, 6765, '1078', 258, 0),
(9258, 3975, 6764, '1079', 259, 0),
(9259, 3974, 6763, '1080', 260, 0),
(9260, 3973, 6762, '1081', 261, 0),
(9261, 3972, 6761, '1082', 262, 0),
(9262, 3971, 6760, '1083', 263, 0),
(9263, 3970, 6759, '1084', 264, 0),
(9264, 3969, 6758, '1085', 265, 0),
(9265, 3968, 6757, '1086', 266, 0),
(9266, 3967, 6756, '1087', 267, 0),
(9267, 3966, 6755, '1088', 268, 0),
(9268, 3965, 6754, '1089', 269, 0),
(9269, 3964, 6753, '1090', 270, 0),
(9270, 3963, 6752, '1091', 271, 0),
(9271, 3962, 6751, '1092', 272, 0),
(9272, 3961, 6750, '1093', 273, 0),
(9273, 3960, 6749, '1094', 274, 0),
(9274, 3959, 6748, '1095', 275, 0),
(9275, 3958, 6747, '1096', 276, 0),
(9276, 3957, 6746, '1097', 277, 0),
(9277, 3956, 6745, '1098', 278, 0),
(9278, 3955, 6744, '1099', 279, 0),
(9279, 3954, 6743, '1100', 280, 0),
(9280, 3953, 6742, '1101', 281, 0),
(9281, 3952, 6741, '1102', 282, 0),
(9282, 3951, 6740, '1103', 283, 0),
(9283, 3950, 6739, '1104', 284, 0),
(9284, 3949, 6738, '1105', 285, 0),
(9285, 3948, 6737, '1106', 286, 0),
(9286, 3947, 6736, '1107', 287, 0),
(9287, 3946, 6735, '1108', 288, 0),
(9288, 3945, 6734, '1109', 289, 0),
(9289, 3944, 6733, '1110', 290, 0),
(9290, 3943, 6732, '1111', 291, 0),
(9291, 3942, 6731, '1112', 292, 0),
(9292, 3941, 6730, '1113', 293, 0),
(9293, 3940, 6729, '1114', 294, 0),
(9294, 3939, 6728, '1115', 295, 0),
(9295, 3938, 6727, '1116', 296, 0),
(9296, 3937, 6726, '1117', 297, 0),
(9297, 3936, 6725, '1118', 298, 0),
(9298, 3935, 6724, '1119', 299, 0),
(9299, 3934, 6723, '1120', 300, 0),
(9300, 3933, 6722, '1121', 301, 0),
(9301, 3932, 6721, '1122', 302, 0),
(9302, 3931, 6720, '1123', 303, 0),
(9303, 3930, 6719, '1124', 304, 0),
(9304, 3929, 6718, '1125', 305, 0),
(9305, 3928, 6717, '1126', 306, 0),
(9306, 3927, 6716, '1127', 307, 0),
(9307, 3926, 6715, '1128', 308, 0),
(9308, 3925, 6714, '1129', 309, 0),
(9309, 3924, 6713, '1130', 310, 0),
(9310, 3923, 6712, '1131', 311, 0),
(9311, 3922, 6711, '1132', 312, 0),
(9312, 3921, 6710, '1133', 313, 0),
(9313, 3920, 6709, '1134', 314, 0),
(9314, 3919, 6708, '1135', 315, 0),
(9315, 3918, 6707, '1136', 316, 0),
(9316, 3917, 6706, '1137', 317, 0),
(9317, 3916, 6705, '1138', 318, 0),
(9318, 3915, 6704, '1139', 319, 0),
(9319, 3914, 6703, '1140', 320, 0),
(9320, 3913, 6702, '1141', 321, 0),
(9321, 3912, 6701, '1142', 322, 0),
(9322, 3911, 6700, '1143', 323, 0),
(9323, 3910, 6699, '1144', 324, 0),
(9324, 3909, 6698, '1145', 325, 0),
(9325, 3908, 6697, '1146', 326, 0),
(9326, 3907, 6696, '1147', 327, 0),
(9327, 3906, 6695, '1148', 328, 0),
(9328, 3905, 6694, '1149', 329, 0),
(9329, 3904, 6693, '1150', 330, 0),
(9330, 3903, 6692, '1151', 331, 0),
(9331, 3902, 6691, '1152', 332, 0),
(9332, 3901, 6690, '1153', 333, 0),
(9333, 3900, 6689, '1154', 334, 0),
(9334, 3899, 6688, '1155', 335, 0),
(9335, 3898, 6687, '1156', 336, 0),
(9336, 3897, 6686, '1157', 337, 0),
(9337, 3896, 6685, '1158', 338, 0),
(9338, 3895, 6684, '1159', 339, 0),
(9339, 3894, 6683, '1160', 340, 0),
(9340, 3893, 6682, '1161', 341, 0),
(9341, 3892, 6681, '1162', 342, 0),
(9342, 3891, 6680, '1163', 343, 0),
(9343, 3890, 6679, '1164', 344, 0),
(9344, 3889, 6678, '1165', 345, 0),
(9345, 3888, 6677, '1166', 346, 0),
(9346, 3887, 6676, '1167', 347, 0),
(9347, 3886, 6675, '1168', 348, 0),
(9348, 3885, 6674, '1169', 349, 0),
(9349, 3884, 6673, '1170', 350, 0),
(9350, 3883, 6672, '1171', 351, 0),
(9351, 3882, 6671, '1172', 352, 0),
(9352, 3881, 6670, '1173', 353, 0),
(9353, 3880, 6669, '1174', 354, 0),
(9354, 3879, 6668, '1175', 355, 0),
(9355, 3878, 6667, '1176', 356, 0),
(9356, 3877, 6666, '1177', 357, 0),
(9357, 3876, 6665, '1178', 358, 0),
(9358, 3875, 6664, '1179', 359, 0),
(9359, 3874, 6663, '1180', 360, 0),
(9360, 3873, 6662, '1181', 361, 0),
(9361, 3872, 6661, '1182', 362, 0),
(9362, 3871, 6660, '1183', 363, 0),
(9363, 3870, 6659, '1184', 364, 0),
(9364, 3869, 6658, '1185', 365, 0),
(9365, 3868, 6657, '1186', 366, 0),
(9366, 3867, 6656, '1187', 367, 0),
(9367, 3866, 6655, '1188', 368, 0),
(9368, 3865, 6654, '1189', 369, 0),
(9369, 3864, 6653, '1190', 370, 0),
(9370, 3863, 6652, '1191', 371, 0),
(9371, 3862, 6651, '1192', 372, 0),
(9372, 3861, 6650, '1193', 373, 0),
(9373, 3860, 6649, '1194', 374, 0),
(9374, 3859, 6648, '1195', 375, 0),
(9375, 3858, 6647, '1196', 376, 0),
(9376, 3857, 6646, '1197', 377, 0),
(9377, 3856, 6645, '1198', 378, 0),
(9378, 3855, 6644, '1199', 379, 0),
(9379, 3854, 6643, '1200', 380, 0),
(9380, 3853, 6642, '1201', 381, 0),
(9381, 3852, 6641, '1202', 382, 0),
(9382, 3851, 6640, '1203', 383, 0),
(9383, 3850, 6639, '1204', 384, 0),
(9384, 3849, 6638, '1205', 385, 0),
(9385, 3848, 6637, '1206', 386, 0),
(9386, 3847, 6636, '1207', 387, 0),
(9387, 3846, 6635, '1208', 388, 0),
(9388, 3845, 6634, '1209', 389, 0),
(9389, 3844, 6633, '1210', 390, 0),
(9390, 3843, 6632, '1211', 391, 0),
(9391, 3842, 6631, '1212', 392, 0),
(9392, 3841, 6630, '1213', 393, 0),
(9393, 3840, 6629, '1214', 394, 0),
(9394, 3839, 6628, '1215', 395, 0),
(9395, 3838, 6627, '1216', 396, 0),
(9396, 3837, 6626, '1217', 397, 0),
(9397, 3836, 6625, '1218', 398, 0),
(9398, 3835, 6624, '1219', 399, 0),
(9399, 3834, 6623, '1220', 400, 0),
(9400, 3833, 6622, '1221', 401, 0),
(9401, 3832, 6621, '1222', 402, 0),
(9402, 3831, 6620, '1223', 403, 0),
(9403, 3830, 6619, '1224', 404, 0),
(9404, 3829, 6618, '1225', 405, 0),
(9405, 3828, 6617, '1226', 406, 0),
(9406, 3827, 6616, '1227', 407, 0),
(9407, 3826, 6615, '1228', 408, 0),
(9408, 3825, 6614, '1229', 409, 0),
(9409, 3824, 6613, '1230', 410, 0),
(9410, 3823, 6612, '1231', 411, 0),
(9411, 3822, 6611, '1232', 412, 0),
(9412, 3821, 6610, '1233', 413, 0),
(9413, 3820, 6609, '1234', 414, 0),
(9414, 3819, 6608, '1235', 415, 0),
(9415, 3818, 6607, '1236', 416, 0),
(9416, 3817, 6606, '1237', 417, 0),
(9417, 3816, 6605, '1238', 418, 0),
(9418, 3815, 6604, '1239', 419, 0),
(9419, 3814, 6603, '1240', 420, 0),
(9420, 3813, 7204, '0639', 421, 0),
(9421, 3812, 7203, '0640', 422, 0),
(9422, 3811, 7202, '0641', 423, 0),
(9423, 3810, 7201, '0642', 424, 0),
(9424, 3809, 7200, '0643', 425, 0),
(9425, 3808, 7199, '0644', 426, 0),
(9426, 3807, 7198, '0645', 427, 0),
(9427, 3806, 7197, '0646', 428, 0),
(9428, 3805, 7196, '0647', 429, 0),
(9429, 3804, 7195, '0648', 430, 0),
(9430, 3803, 7194, '0649', 431, 0),
(9431, 3802, 7193, '0650', 432, 0),
(9432, 3801, 7192, '0651', 433, 0),
(9433, 3800, 7191, '0652', 434, 0),
(9434, 3799, 7190, '0653', 435, 0),
(9435, 3798, 7189, '0654', 436, 0),
(9436, 3797, 7188, '0655', 437, 0),
(9437, 3796, 7187, '0656', 438, 0),
(9438, 3795, 7186, '0657', 439, 0),
(9439, 3794, 7185, '0658', 440, 0),
(9440, 3793, 7184, '0659', 441, 0),
(9441, 3792, 7183, '0660', 442, 0),
(9442, 3791, 7182, '0661', 443, 0),
(9443, 3790, 7181, '0662', 444, 0),
(9444, 3789, 7180, '0663', 445, 0),
(9445, 3788, 7179, '0664', 446, 0),
(9446, 3787, 7178, '0665', 447, 0),
(9447, 3786, 7177, '0666', 448, 0),
(9448, 3785, 7176, '0667', 449, 0),
(9449, 3784, 7175, '0668', 450, 0),
(9450, 3783, 7174, '0669', 451, 0),
(9451, 3782, 7173, '0670', 452, 0),
(9452, 3781, 7172, '0671', 453, 0),
(9453, 3780, 7171, '0672', 454, 0),
(9454, 3779, 7170, '0673', 455, 0),
(9455, 3778, 7169, '0674', 456, 0),
(9456, 3777, 7168, '0675', 457, 0),
(9457, 3776, 7167, '0676', 458, 0),
(9458, 3775, 7166, '0677', 459, 0),
(9459, 3774, 7165, '0678', 460, 0),
(9460, 3773, 7164, '0679', 461, 0),
(9461, 3772, 7163, '0680', 462, 0),
(9462, 3771, 7162, '0681', 463, 0),
(9463, 3770, 7161, '0682', 464, 0),
(9464, 3769, 7160, '0683', 465, 0),
(9465, 3768, 7159, '0684', 466, 0),
(9466, 3767, 7158, '0685', 467, 0),
(9467, 3766, 7157, '0686', 468, 0),
(9468, 3765, 7156, '0687', 469, 0),
(9469, 3764, 7155, '0688', 470, 0),
(9470, 3763, 7154, '0689', 471, 0),
(9471, 3762, 7153, '0690', 472, 0),
(9472, 3761, 7152, '0691', 473, 0),
(9473, 3760, 7151, '0692', 474, 0),
(9474, 3759, 7150, '0693', 475, 0),
(9475, 3758, 7149, '0694', 476, 0),
(9476, 3757, 7148, '0695', 477, 0),
(9477, 3756, 7147, '0696', 478, 0),
(9478, 3755, 7146, '0697', 479, 0),
(9479, 3754, 7145, '0698', 480, 0),
(9480, 3753, 7144, '0699', 481, 0),
(9481, 3752, 7143, '0700', 482, 0),
(9482, 3751, 7142, '0701', 483, 0),
(9483, 3750, 7141, '0702', 484, 0),
(9484, 3749, 7140, '0703', 485, 0),
(9485, 3748, 7139, '0704', 486, 0),
(9486, 3747, 7138, '0705', 487, 0),
(9487, 3746, 7137, '0706', 488, 0),
(9488, 3745, 7136, '0707', 489, 0),
(9489, 3744, 7135, '0708', 490, 0),
(9490, 3743, 7134, '0709', 491, 0),
(9491, 3742, 7133, '0710', 492, 0),
(9492, 3741, 7132, '0711', 493, 0),
(9493, 3740, 7131, '0712', 494, 0),
(9494, 3739, 7130, '0713', 495, 0),
(9495, 3738, 7129, '0714', 496, 0),
(9496, 3737, 7128, '0715', 497, 0),
(9497, 3736, 7127, '0716', 498, 0),
(9498, 3735, 7126, '0717', 499, 0),
(9499, 3734, 7125, '0718', 500, 0),
(9500, 3733, 7124, '0719', 501, 0),
(9501, 3732, 7123, '0720', 502, 0),
(9502, 3731, 7122, '0721', 503, 0),
(9503, 3730, 7121, '0722', 504, 0),
(9504, 3729, 7120, '0723', 505, 0),
(9505, 3728, 7119, '0724', 506, 0),
(9506, 3727, 7118, '0725', 507, 0),
(9507, 3726, 7117, '0726', 508, 0),
(9508, 3725, 7116, '0727', 509, 0),
(9509, 3724, 7115, '0728', 510, 0),
(9510, 3723, 7114, '0729', 511, 0),
(9511, 3722, 7113, '0730', 512, 0),
(9512, 3721, 7112, '0731', 513, 0),
(9513, 3720, 7111, '0732', 514, 0),
(9514, 3719, 7110, '0733', 515, 0),
(9515, 3718, 7109, '0734', 516, 0),
(9516, 3717, 7108, '0735', 517, 0),
(9517, 3716, 7107, '0736', 518, 0),
(9518, 3715, 7106, '0737', 519, 0),
(9519, 3714, 7105, '0738', 520, 0),
(9520, 3713, 7104, '0739', 521, 0),
(9521, 3712, 7103, '0740', 522, 0),
(9522, 3711, 7102, '0741', 523, 0),
(9523, 3710, 7101, '0742', 524, 0),
(9524, 3709, 7100, '0743', 525, 0),
(9525, 3708, 7099, '0744', 526, 0),
(9526, 3707, 7098, '0745', 527, 0),
(9527, 3706, 7097, '0746', 528, 0),
(9528, 3705, 7096, '0747', 529, 0),
(9529, 3704, 7095, '0748', 530, 0),
(9530, 3703, 7094, '0749', 531, 0),
(9531, 3702, 7093, '0750', 532, 0),
(9532, 3701, 7092, '0751', 533, 0),
(9533, 3700, 7091, '0752', 534, 0),
(9534, 3699, 7090, '0753', 535, 0),
(9535, 3698, 7089, '0754', 536, 0),
(9536, 3697, 7088, '0755', 537, 0),
(9537, 3696, 7087, '0756', 538, 0),
(9538, 3695, 7086, '0757', 539, 0),
(9539, 3694, 7085, '0758', 540, 0),
(9540, 3693, 7084, '0759', 541, 0),
(9541, 3692, 7083, '0760', 542, 0),
(9542, 3691, 7082, '0761', 543, 0),
(9543, 3690, 7081, '0762', 544, 0),
(9544, 3689, 7080, '0763', 545, 0),
(9545, 3688, 7079, '0764', 546, 0),
(9546, 3687, 7078, '0765', 547, 0),
(9547, 3686, 7077, '0766', 548, 0),
(9548, 3685, 7076, '0767', 549, 0),
(9549, 3684, 7075, '0768', 550, 0),
(9550, 3683, 7074, '0769', 551, 0),
(9551, 3682, 7073, '0770', 552, 0),
(9552, 3681, 7072, '0771', 553, 0),
(9553, 3680, 7071, '0772', 554, 0),
(9554, 3679, 7070, '0773', 555, 0),
(9555, 3678, 7069, '0774', 556, 0),
(9556, 3677, 7068, '0775', 557, 0),
(9557, 3676, 7067, '0776', 558, 0),
(9558, 3675, 7066, '0777', 559, 0),
(9559, 3674, 7065, '0778', 560, 0),
(9560, 3673, 7064, '0779', 561, 0),
(9561, 3672, 7063, '0780', 562, 0),
(9562, 3671, 7062, '0781', 563, 0),
(9563, 3670, 7061, '0782', 564, 0),
(9564, 3669, 7060, '0783', 565, 0),
(9565, 3668, 7059, '0784', 566, 0),
(9566, 3667, 7058, '0785', 567, 0),
(9567, 3666, 7057, '0786', 568, 0),
(9568, 3665, 7056, '0787', 569, 0),
(9569, 3664, 7055, '0788', 570, 0),
(9570, 3663, 7054, '0789', 571, 0),
(9571, 3662, 7053, '0790', 572, 0),
(9572, 3661, 7052, '0791', 573, 0),
(9573, 3660, 7051, '0792', 574, 0),
(9574, 3659, 7050, '0793', 575, 0),
(9575, 3658, 7049, '0794', 576, 0),
(9576, 3657, 7048, '0795', 577, 0),
(9577, 3656, 7047, '0796', 578, 0),
(9578, 3655, 7046, '0797', 579, 0),
(9579, 3654, 7045, '0798', 580, 0),
(9580, 3653, 7044, '0799', 581, 0),
(9581, 3652, 7043, '0800', 582, 0),
(9582, 3651, 7042, '0801', 583, 0),
(9583, 3650, 7041, '0802', 584, 0),
(9584, 3649, 7040, '0803', 585, 0),
(9585, 3648, 7039, '0804', 586, 0),
(9586, 3647, 7038, '0805', 587, 0),
(9587, 3646, 7037, '0806', 588, 0),
(9588, 3645, 7036, '0807', 589, 0),
(9589, 3644, 7035, '0808', 590, 0),
(9590, 3643, 7034, '0809', 591, 0),
(9591, 3642, 7033, '0810', 592, 0),
(9592, 3641, 7032, '0811', 593, 0),
(9593, 3640, 7031, '0812', 594, 0),
(9594, 3639, 7030, '0813', 595, 0),
(9595, 3638, 7029, '0814', 596, 0),
(9596, 3637, 7028, '0815', 597, 0),
(9597, 3636, 7027, '0816', 598, 0),
(9598, 3635, 7026, '0817', 599, 0),
(9599, 3634, 7025, '0818', 600, 0),
(9600, 3633, 7024, '0819', 601, 0),
(9601, 3632, 7023, '0820', 602, 0),
(9602, 3631, 7022, '0821', 603, 0),
(9603, 3630, 7021, '0822', 604, 0),
(9604, 3629, 7020, '0823', 605, 0),
(9605, 3628, 7019, '0824', 606, 0),
(9606, 3627, 7018, '0825', 607, 0),
(9607, 3626, 7017, '0826', 608, 0),
(9608, 3625, 7016, '0827', 609, 0),
(9609, 3624, 7015, '0828', 610, 0),
(9610, 3623, 7014, '0829', 611, 0),
(9611, 3622, 7013, '0830', 612, 0),
(9612, 3621, 7012, '0831', 613, 0),
(9613, 3620, 7011, '0832', 614, 0),
(9614, 3619, 7010, '0833', 615, 0),
(9615, 3618, 7009, '0834', 616, 0),
(9616, 3617, 7008, '0835', 617, 0),
(9617, 3616, 7007, '0836', 618, 0),
(9618, 3615, 7006, '0837', 619, 0),
(9619, 3614, 7005, '0838', 620, 0),
(9620, 3613, 7004, '0839', 621, 0),
(9621, 3612, 7003, '0840', 622, 0),
(9622, 3611, 7002, '0841', 623, 0),
(9623, 3610, 7001, '0842', 624, 0),
(9624, 3609, 7000, '0843', 625, 0),
(9625, 3608, 6999, '0844', 626, 0),
(9626, 3607, 6998, '0845', 627, 0),
(9627, 3606, 6997, '0846', 628, 0),
(9628, 3605, 6996, '0847', 629, 0),
(9629, 3604, 6995, '0848', 630, 0),
(9630, 3603, 6994, '0849', 631, 0),
(9631, 3602, 6993, '0850', 632, 0),
(9632, 3601, 6992, '0851', 633, 0),
(9633, 3600, 6991, '0852', 634, 0),
(9634, 3599, 6990, '0853', 635, 0),
(9635, 3598, 6989, '0854', 636, 0),
(9636, 3597, 6988, '0855', 637, 0),
(9637, 3596, 6987, '0856', 638, 0),
(9638, 3595, 6986, '0857', 639, 0),
(9639, 3594, 6985, '0858', 640, 0),
(9640, 3593, 6984, '0859', 641, 0),
(9641, 3592, 6983, '0860', 642, 0),
(9642, 3591, 6982, '0861', 643, 0),
(9643, 3590, 6981, '0862', 644, 0),
(9644, 3589, 6980, '0863', 645, 0),
(9645, 3588, 6979, '0864', 646, 0),
(9646, 3587, 6978, '0865', 647, 0),
(9647, 3586, 6977, '0866', 648, 0),
(9648, 3585, 6976, '0867', 649, 0),
(9649, 3584, 6975, '0868', 650, 0),
(9650, 3583, 6974, '0869', 651, 0),
(9651, 3582, 6973, '0870', 652, 0),
(9652, 3581, 6972, '0871', 653, 0),
(9653, 3580, 6971, '0872', 654, 0),
(9654, 3579, 6970, '0873', 655, 0),
(9655, 3578, 6969, '0874', 656, 0),
(9656, 3577, 6968, '0875', 657, 0),
(9657, 3576, 6967, '0876', 658, 0),
(9658, 3575, 6966, '0877', 659, 0),
(9659, 3574, 6965, '0878', 660, 0),
(9660, 3573, 6964, '0879', 661, 0),
(9661, 3572, 6963, '0880', 662, 0),
(9662, 3571, 6962, '0881', 663, 0),
(9663, 3570, 6961, '0882', 664, 0),
(9664, 3569, 6960, '0883', 665, 0),
(9665, 3568, 6959, '0884', 666, 0),
(9666, 3567, 6958, '0885', 667, 0),
(9667, 3566, 6957, '0886', 668, 0),
(9668, 3565, 6956, '0887', 669, 0),
(9669, 3564, 6955, '0888', 670, 0),
(9670, 3563, 6954, '0889', 671, 0),
(9671, 3562, 6953, '0890', 672, 0),
(9672, 3561, 6952, '0891', 673, 0),
(9673, 3560, 6951, '0892', 674, 0),
(9674, 3559, 6950, '0893', 675, 0),
(9675, 3558, 6949, '0894', 676, 0),
(9676, 3557, 6948, '0895', 677, 0),
(9677, 3556, 6947, '0896', 678, 0),
(9678, 3555, 6946, '0897', 679, 0),
(9679, 3554, 6945, '0898', 680, 0),
(9680, 3553, 6944, '0899', 681, 0),
(9681, 3552, 6943, '0900', 682, 0),
(9682, 3551, 6942, '0901', 683, 0),
(9683, 3550, 6941, '0902', 684, 0),
(9684, 3549, 6940, '0903', 685, 0),
(9685, 3548, 6939, '0904', 686, 0),
(9686, 3547, 6938, '0905', 687, 0),
(9687, 3546, 6937, '0906', 688, 0),
(9688, 3545, 6936, '0907', 689, 0),
(9689, 3544, 6935, '0908', 690, 0),
(9690, 3543, 6934, '0909', 691, 0),
(9691, 3542, 6933, '0910', 692, 0),
(9692, 3541, 6932, '0911', 693, 0),
(9693, 3540, 6931, '0912', 694, 0),
(9694, 3539, 6930, '0913', 695, 0),
(9695, 3538, 6929, '0914', 696, 0),
(9696, 3537, 6928, '0915', 697, 0),
(9697, 3536, 6927, '0916', 698, 0),
(9698, 3535, 6926, '0917', 699, 0),
(9699, 3534, 6925, '0918', 700, 0),
(9700, 3533, 6924, '0919', 701, 0),
(9701, 3532, 6923, '0920', 702, 0),
(9702, 3531, 6922, '0921', 703, 0),
(9703, 3530, 6921, '0922', 704, 0),
(9704, 3529, 6920, '0923', 705, 0),
(9705, 3528, 7499, '0344', 706, 0),
(9706, 3527, 7498, '0345', 707, 0),
(9707, 3526, 7497, '0346', 708, 0),
(9708, 3525, 7496, '0347', 709, 0),
(9709, 3524, 7495, '0348', 710, 0),
(9710, 3523, 7494, '0349', 711, 0),
(9711, 3522, 7493, '0350', 712, 0),
(9712, 3521, 7492, '0351', 713, 0),
(9713, 3520, 7491, '0352', 714, 0),
(9714, 3519, 7490, '0353', 715, 0),
(9715, 3518, 7489, '0354', 716, 0),
(9716, 3517, 7488, '0355', 717, 0),
(9717, 3516, 7487, '0356', 718, 0),
(9718, 3515, 7486, '0357', 719, 0),
(9719, 3514, 7485, '0358', 720, 0),
(9720, 3513, 7484, '0359', 721, 0),
(9721, 3512, 7483, '0360', 722, 0),
(9722, 3511, 7482, '0361', 723, 0),
(9723, 3510, 7481, '0362', 724, 0),
(9724, 3509, 7480, '0363', 725, 0),
(9725, 3508, 7479, '0364', 726, 0),
(9726, 3507, 7478, '0365', 727, 0),
(9727, 3506, 7477, '0366', 728, 0),
(9728, 3505, 7476, '0367', 729, 0),
(9729, 3504, 7475, '0368', 730, 0),
(9730, 3503, 7474, '0369', 731, 0),
(9731, 3502, 7473, '0370', 732, 0),
(9732, 3501, 7472, '0371', 733, 0),
(9733, 3500, 7471, '0372', 734, 0),
(9734, 3499, 7470, '0373', 735, 0),
(9735, 3498, 7469, '0374', 736, 0),
(9736, 3497, 7468, '0375', 737, 0),
(9737, 3496, 7467, '0376', 738, 0),
(9738, 3495, 7466, '0377', 739, 0),
(9739, 3494, 7465, '0378', 740, 0),
(9740, 3493, 7464, '0379', 741, 0),
(9741, 3492, 7463, '0380', 742, 0),
(9742, 3491, 7462, '0381', 743, 0),
(9743, 3490, 7461, '0382', 744, 0),
(9744, 3489, 7460, '0383', 745, 0),
(9745, 3488, 7459, '0384', 746, 0),
(9746, 3487, 7458, '0385', 747, 0),
(9747, 3486, 7457, '0386', 748, 0),
(9748, 3485, 7456, '0387', 749, 0),
(9749, 3484, 7455, '0388', 750, 0),
(9750, 3483, 7454, '0389', 751, 0),
(9751, 3482, 7453, '0390', 752, 0),
(9752, 3481, 7452, '0391', 753, 0),
(9753, 3480, 7451, '0392', 754, 0),
(9754, 3479, 7450, '0393', 755, 0),
(9755, 3478, 7449, '0394', 756, 0),
(9756, 3477, 7448, '0395', 757, 0),
(9757, 3476, 7447, '0396', 758, 0),
(9758, 3475, 7446, '0397', 759, 0),
(9759, 3474, 7445, '0398', 760, 0),
(9760, 3473, 7444, '0399', 761, 0),
(9761, 3472, 7443, '0400', 762, 0),
(9762, 3471, 7442, '0401', 763, 0),
(9763, 3470, 7441, '0402', 764, 0),
(9764, 3469, 7440, '0403', 765, 0),
(9765, 3468, 7439, '0404', 766, 0),
(9766, 3467, 7438, '0405', 767, 0),
(9767, 3466, 7437, '0406', 768, 0),
(9768, 3465, 7436, '0407', 769, 0),
(9769, 3464, 7435, '0408', 770, 0),
(9770, 3463, 7434, '0409', 771, 0),
(9771, 3462, 7433, '0410', 772, 0),
(9772, 3461, 7432, '0411', 773, 0),
(9773, 3460, 7431, '0412', 774, 0),
(9774, 3459, 7430, '0413', 775, 0),
(9775, 3458, 7429, '0414', 776, 0),
(9776, 3457, 7428, '0415', 777, 0),
(9777, 3456, 7427, '0416', 778, 0),
(9778, 3455, 7426, '0417', 779, 0),
(9779, 3454, 7425, '0418', 780, 0),
(9780, 3453, 7424, '0419', 781, 0),
(9781, 3452, 7423, '0420', 782, 0),
(9782, 3451, 7422, '0421', 783, 0),
(9783, 3450, 7421, '0422', 784, 0),
(9784, 3449, 7420, '0423', 785, 0),
(9785, 3448, 7419, '0424', 786, 0),
(9786, 3447, 7418, '0425', 787, 0),
(9787, 3446, 7417, '0426', 788, 0),
(9788, 3445, 7416, '0427', 789, 0),
(9789, 3444, 7415, '0428', 790, 0),
(9790, 3443, 7414, '0429', 791, 0),
(9791, 3442, 7413, '0430', 792, 0),
(9792, 3441, 7412, '0431', 793, 0),
(9793, 3440, 7411, '0432', 794, 0),
(9794, 3439, 7410, '0433', 795, 0),
(9795, 3438, 7409, '0434', 796, 0),
(9796, 3437, 7408, '0435', 797, 0),
(9797, 3436, 7407, '0436', 798, 0),
(9798, 3435, 7406, '0437', 799, 0),
(9799, 3434, 7405, '0438', 800, 0),
(9800, 3433, 7404, '0439', 801, 0),
(9801, 3432, 7403, '0440', 802, 0),
(9802, 3431, 7402, '0441', 803, 0),
(9803, 3430, 7401, '0442', 804, 0),
(9804, 3429, 7400, '0443', 805, 0),
(9805, 3428, 7399, '0444', 806, 0),
(9806, 3427, 7398, '0445', 807, 0),
(9807, 3426, 7397, '0446', 808, 0),
(9808, 3425, 7396, '0447', 809, 0),
(9809, 3424, 7395, '0448', 810, 0),
(9810, 3423, 7394, '0449', 811, 0),
(9811, 3422, 7393, '0450', 812, 0),
(9812, 3421, 7392, '0451', 813, 0),
(9813, 3420, 7391, '0452', 814, 0),
(9814, 3419, 7390, '0453', 815, 0),
(9815, 3418, 7389, '0454', 816, 0),
(9816, 3417, 7388, '0455', 817, 0),
(9817, 3416, 7387, '0456', 818, 0),
(9818, 3415, 7386, '0457', 819, 0),
(9819, 3414, 7385, '0458', 820, 0),
(9820, 3413, 7384, '0459', 821, 0),
(9821, 3412, 7383, '0460', 822, 0),
(9822, 3411, 7382, '0461', 823, 0),
(9823, 3410, 7381, '0462', 824, 0),
(9824, 3409, 7380, '0463', 825, 0),
(9825, 3408, 7379, '0464', 826, 0),
(9826, 3407, 7378, '0465', 827, 0),
(9827, 3406, 7377, '0466', 828, 0),
(9828, 3405, 7376, '0467', 829, 0),
(9829, 3404, 7375, '0468', 830, 0),
(9830, 3403, 7374, '0469', 831, 0),
(9831, 3402, 7373, '0470', 832, 0),
(9832, 3401, 7372, '0471', 833, 0),
(9833, 3400, 7371, '0472', 834, 0),
(9834, 3399, 7370, '0473', 835, 0),
(9835, 3398, 7369, '0474', 836, 0),
(9836, 3397, 7368, '0475', 837, 0),
(9837, 3396, 7367, '0476', 838, 0),
(9838, 3395, 7366, '0477', 839, 0),
(9839, 3394, 7365, '0478', 840, 0),
(9840, 3393, 7364, '0479', 841, 0),
(9841, 3392, 7363, '0480', 842, 0),
(9842, 3391, 7362, '0481', 843, 0),
(9843, 3390, 7361, '0482', 844, 0),
(9844, 3389, 7360, '0483', 845, 0),
(9845, 3388, 7359, '0484', 846, 0),
(9846, 3387, 7358, '0485', 847, 0),
(9847, 3386, 7357, '0486', 848, 0),
(9848, 3385, 7356, '0487', 849, 0),
(9849, 3384, 7355, '0488', 850, 0),
(9850, 3383, 7354, '0489', 851, 0),
(9851, 3382, 7353, '0490', 852, 0),
(9852, 3381, 7352, '0491', 853, 0),
(9853, 3380, 7351, '0492', 854, 0),
(9854, 3379, 7350, '0493', 855, 0),
(9855, 3378, 7349, '0494', 856, 0),
(9856, 3377, 7348, '0495', 857, 0),
(9857, 3376, 7347, '0496', 858, 0),
(9858, 3375, 7346, '0497', 859, 0),
(9859, 3374, 7345, '0498', 860, 0),
(9860, 3373, 7344, '0499', 861, 0),
(9861, 3372, 7343, '0500', 862, 0),
(9862, 3371, 7342, '0501', 863, 0),
(9863, 3370, 7341, '0502', 864, 0),
(9864, 3369, 7340, '0503', 865, 0),
(9865, 3368, 7339, '0504', 866, 0),
(9866, 3367, 7338, '0505', 867, 0),
(9867, 3366, 7337, '0506', 868, 0),
(9868, 3365, 7336, '0507', 869, 0),
(9869, 3364, 7335, '0508', 870, 0),
(9870, 3363, 7334, '0509', 871, 0),
(9871, 3362, 7333, '0510', 872, 0),
(9872, 3361, 7332, '0511', 873, 0),
(9873, 3360, 7331, '0512', 874, 0),
(9874, 3359, 7330, '0513', 875, 0),
(9875, 3358, 7329, '0514', 876, 0),
(9876, 3357, 7328, '0515', 877, 0),
(9877, 3356, 7327, '0516', 878, 0),
(9878, 3355, 7326, '0517', 879, 0),
(9879, 3354, 7325, '0518', 880, 0),
(9880, 3353, 7324, '0519', 881, 0),
(9881, 3352, 7323, '0520', 882, 0),
(9882, 3351, 7322, '0521', 883, 0),
(9883, 3350, 7321, '0522', 884, 0),
(9884, 3349, 7320, '0523', 885, 0),
(9885, 3348, 7319, '0524', 886, 0),
(9886, 3347, 7318, '0525', 887, 0),
(9887, 3346, 7317, '0526', 888, 0),
(9888, 3345, 7316, '0527', 889, 0),
(9889, 3344, 7315, '0528', 890, 0),
(9890, 3343, 7314, '0529', 891, 0),
(9891, 3342, 7313, '0530', 892, 0),
(9892, 3341, 7312, '0531', 893, 0),
(9893, 3340, 7311, '0532', 894, 0),
(9894, 3339, 7310, '0533', 895, 0),
(9895, 3338, 7309, '0534', 896, 0),
(9896, 3337, 7308, '0535', 897, 0),
(9897, 3336, 7307, '0536', 898, 0),
(9898, 3335, 7306, '0537', 899, 0),
(9899, 3334, 7305, '0538', 900, 0),
(9900, 3333, 7304, '0539', 901, 0),
(9901, 3332, 7303, '0540', 902, 0),
(9902, 3331, 7302, '0541', 903, 0),
(9903, 3330, 7301, '0542', 904, 0),
(9904, 3329, 7300, '0543', 905, 0),
(9905, 3328, 7299, '0544', 906, 0),
(9906, 3327, 7298, '0545', 907, 0),
(9907, 3326, 7297, '0546', 908, 0),
(9908, 3325, 7296, '0547', 909, 0),
(9909, 3324, 7295, '0548', 910, 0),
(9910, 3323, 7294, '0549', 911, 0),
(9911, 3322, 7293, '0550', 912, 0),
(9912, 3321, 7292, '0551', 913, 0),
(9913, 3320, 7291, '0552', 914, 0),
(9914, 3319, 7290, '0553', 915, 0),
(9915, 3318, 7289, '0554', 916, 0),
(9916, 3317, 7288, '0555', 917, 0),
(9917, 3316, 7287, '0556', 918, 0),
(9918, 3315, 7286, '0557', 919, 0),
(9919, 3314, 7285, '0558', 920, 0),
(9920, 3313, 7284, '0559', 921, 0),
(9921, 3312, 7283, '0560', 922, 0),
(9922, 3311, 7282, '0561', 923, 0),
(9923, 3310, 7281, '0562', 924, 0),
(9924, 3309, 7280, '0563', 925, 0),
(9925, 3308, 7279, '0564', 926, 0),
(9926, 3307, 7278, '0565', 927, 0),
(9927, 3306, 7277, '0566', 928, 0),
(9928, 3305, 7276, '0567', 929, 0),
(9929, 3304, 7275, '0568', 930, 0),
(9930, 3303, 7274, '0569', 931, 0),
(9931, 3302, 7273, '0570', 932, 0),
(9932, 3301, 7272, '0571', 933, 0),
(9933, 3300, 7271, '0572', 934, 0),
(9934, 3299, 7270, '0573', 935, 0),
(9935, 3298, 7269, '0574', 936, 0),
(9936, 3297, 7268, '0575', 937, 0),
(9937, 3296, 7267, '0576', 938, 0),
(9938, 3295, 7266, '0577', 939, 0),
(9939, 3294, 7265, '0578', 940, 0),
(9940, 3293, 7264, '0579', 941, 0),
(9941, 3292, 7263, '0580', 942, 0),
(9942, 3291, 7262, '0581', 943, 0),
(9943, 3290, 7261, '0582', 944, 0),
(9944, 3289, 7260, '0583', 945, 0),
(9945, 3288, 7259, '0584', 946, 0),
(9946, 3287, 7258, '0585', 947, 0),
(9947, 3286, 7257, '0586', 948, 0),
(9948, 3285, 7256, '0587', 949, 0),
(9949, 3284, 7255, '0588', 950, 0),
(9950, 3283, 7254, '0589', 951, 0),
(9951, 3282, 7253, '0590', 952, 0),
(9952, 3281, 7252, '0591', 953, 0),
(9953, 3280, 7251, '0592', 954, 0),
(9954, 3279, 7250, '0593', 955, 0),
(9955, 3278, 7249, '0594', 956, 0),
(9956, 3277, 7248, '0595', 957, 0),
(9957, 3276, 7247, '0596', 958, 0),
(9958, 3275, 7246, '0597', 959, 0),
(9959, 3274, 7245, '0598', 960, 0),
(9960, 3273, 7244, '0599', 961, 0),
(9961, 3272, 7243, '0600', 962, 0),
(9962, 3271, 7242, '0601', 963, 0),
(9963, 3270, 7241, '0602', 964, 0),
(9964, 3269, 7240, '0603', 965, 0),
(9965, 3268, 7239, '0604', 966, 0),
(9966, 3267, 7238, '0605', 967, 0),
(9967, 3266, 7237, '0606', 968, 0),
(9968, 3265, 7236, '0607', 969, 0),
(9969, 3264, 7235, '0608', 970, 0),
(9970, 3263, 7234, '0609', 971, 0),
(9971, 3262, 7233, '0610', 972, 0),
(9972, 3261, 7232, '0611', 973, 0),
(9973, 3260, 7231, '0612', 974, 0),
(9974, 3259, 7230, '0613', 975, 0),
(9975, 3258, 7229, '0614', 976, 0),
(9976, 3257, 7228, '0615', 977, 0),
(9977, 3256, 7227, '0616', 978, 0),
(9978, 3255, 7226, '0617', 979, 0),
(9979, 3254, 7225, '0618', 980, 0),
(9980, 3253, 7224, '0619', 981, 0),
(9981, 3252, 7223, '0620', 982, 0),
(9982, 3251, 7222, '0621', 983, 0),
(9983, 3250, 7221, '0622', 984, 0),
(9984, 3249, 7220, '0623', 985, 0),
(9985, 3248, 7219, '0624', 986, 0),
(9986, 3247, 7218, '0625', 987, 0),
(9987, 3246, 7217, '0626', 988, 0),
(9988, 3245, 7216, '0627', 989, 0),
(9989, 3244, 7215, '0628', 990, 0),
(9990, 3243, 7214, '0629', 991, 0),
(9991, 3242, 7213, '0630', 992, 0),
(9992, 3241, 7212, '0631', 993, 0),
(9993, 3240, 7211, '0632', 994, 0),
(9994, 3239, 7210, '0633', 995, 0),
(9995, 3238, 7209, '0634', 996, 0),
(9996, 3237, 7208, '0635', 997, 0),
(9997, 3236, 7207, '0636', 998, 0),
(9998, 3235, 7206, '0637', 999, 0),
(9999, 3234, 7205, '0638', 1000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-01-11 15:38:04', '2019-01-11 15:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Escritorio', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2019-01-11 15:38:04', '2019-01-11 15:54:52', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2019-01-11 15:38:04', '2019-02-08 12:04:24', 'voyager.media.index', NULL),
(3, 1, 'Usuarios', '', '_self', 'voyager-person', '#000000', 15, 1, '2019-01-11 15:38:04', '2019-01-11 15:56:14', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 15, 2, '2019-01-11 15:38:04', '2019-01-12 00:51:30', 'voyager.roles.index', NULL),
(5, 1, 'Herramientas', '', '_self', 'voyager-tools', '#000000', NULL, 9, '2019-01-11 15:38:04', '2019-02-08 12:04:24', NULL, ''),
(6, 1, 'Constructor de menú', '', '_self', 'voyager-list', '#000000', 5, 1, '2019-01-11 15:38:04', '2019-01-11 15:56:42', 'voyager.menus.index', 'null'),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-01-11 15:38:04', '2019-01-12 00:51:23', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-01-11 15:38:04', '2019-01-12 00:51:23', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-01-11 15:38:04', '2019-01-12 00:51:23', 'voyager.bread.index', NULL),
(10, 1, 'Configuraciones', '', '_self', 'voyager-settings', '#000000', NULL, 10, '2019-01-11 15:38:04', '2019-02-08 12:04:24', 'voyager.settings.index', 'null'),
(11, 1, 'Categorias', '', '_self', 'voyager-categories', '#000000', 16, 1, '2019-01-11 15:38:06', '2019-01-11 15:55:51', 'voyager.categories.index', 'null'),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 16, 2, '2019-01-11 15:38:06', '2019-01-11 15:48:32', 'voyager.posts.index', NULL),
(13, 1, 'Páginas', '', '_self', 'voyager-file-text', '#000000', 16, 3, '2019-01-11 15:38:07', '2019-01-11 15:56:04', 'voyager.pages.index', 'null'),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-01-11 15:38:07', '2019-01-12 00:51:23', 'voyager.hooks', NULL),
(15, 1, 'Usuarios', '', '_self', 'voyager-people', '#000000', NULL, 2, '2019-01-11 15:46:24', '2020-06-23 00:13:19', NULL, ''),
(16, 1, 'Blog', '', '_self', 'voyager-news', '#000000', NULL, 7, '2019-01-11 15:48:05', '2020-06-23 00:13:19', NULL, ''),
(17, 1, 'Productos', '', '_self', 'voyager-shop', NULL, 20, 4, '2019-01-12 00:10:46', '2019-01-16 21:00:26', 'voyager.products.index', NULL),
(18, 1, 'Categorías', '', '_self', 'voyager-categories', '#000000', 20, 1, '2019-01-12 00:21:27', '2019-01-12 00:51:49', 'voyager.brandscategories.index', 'null'),
(19, 1, 'Marcas', '', '_self', 'voyager-receipt', '#000000', 20, 2, '2019-01-12 00:23:31', '2019-01-12 00:55:29', 'voyager.brands.index', 'null'),
(20, 1, 'Productos', '', '_self', 'voyager-shop', '#000000', NULL, 5, '2019-01-12 00:50:41', '2020-06-23 00:13:51', NULL, ''),
(21, 1, 'Carrusel', '', '_self', 'voyager-window-list', '#000000', 23, 1, '2019-01-12 12:21:14', '2019-01-12 15:35:11', 'voyager.sliders.index', 'null'),
(22, 1, 'Distribuidores', '', '_self', 'voyager-truck', '#000000', 23, 3, '2019-01-12 13:56:36', '2020-06-23 00:14:13', 'voyager.dealers.index', 'null'),
(23, 1, 'Home', '', '_self', 'voyager-home', '#000000', NULL, 6, '2019-01-12 15:34:46', '2020-06-23 00:13:51', NULL, ''),
(24, 1, 'Grupos', '', '_self', 'voyager-list', '#000000', 20, 3, '2019-01-16 21:00:00', '2019-01-16 21:00:37', 'voyager.productsgroups.index', 'null'),
(25, 1, 'Ventas', '', '_self', 'voyager-basket', '#000000', NULL, 3, '2019-02-05 06:59:18', '2020-06-23 00:13:19', 'voyager.orders.index', 'null'),
(26, 1, 'Faqs', '', '_self', 'voyager-question', NULL, NULL, 4, '2019-02-08 12:04:08', '2020-06-23 00:13:51', 'voyager.faqs.index', NULL),
(27, 1, 'Precios', '', '_self', 'voyager-cup', '#000000', 20, 5, '2019-03-01 20:30:06', '2020-06-23 00:13:19', 'voyager.flavors.index', 'null'),
(33, 1, 'Instagram feeds', '', '_self', 'voyager-photos', NULL, 23, 2, '2020-06-23 00:12:35', '2020-06-23 00:14:13', 'voyager.instagramfeeds.index', NULL),
(34, 1, 'Presentaciones', '', '_self', NULL, NULL, NULL, 11, '2020-06-23 00:57:12', '2020-06-23 00:57:12', 'voyager.presentaciones.index', NULL),
(35, 1, 'Product Presentacion Pivotes', '', '_self', NULL, NULL, NULL, 12, '2020-06-23 00:57:39', '2020-06-23 00:57:39', 'voyager.product-presentacion-pivote.index', NULL),
(36, 1, 'Presentacion Precio Pivotes', '', '_self', NULL, NULL, NULL, 13, '2020-06-23 00:58:02', '2020-06-23 00:58:02', 'voyager.presentacion-precio-pivote.index', NULL),
(37, 1, 'Precios', '', '_self', NULL, NULL, NULL, 14, '2020-06-23 00:58:43', '2020-06-23 00:58:43', 'voyager.precios.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payu_order_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `date` date DEFAULT NULL,
  `estadoTx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lapPaymentMethod` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pseBank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionState` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referenceCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TX_VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_pol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loteryNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stateCode` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `reference`, `payu_order_id`, `transaction_id`, `state`, `value`, `user_id`, `amount`, `created_at`, `updated_at`, `deleted_at`, `date`, `estadoTx`, `lapPaymentMethod`, `pseBank`, `extra1`, `cus`, `transactionState`, `currency`, `referenceCode`, `description`, `TX_VALUE`, `reference_pol`, `transactionId`, `loteryNumber`, `stateCode`) VALUES
(45, NULL, NULL, NULL, NULL, '44000', 51, NULL, '2020-06-03 15:31:42', '2020-06-03 15:31:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2v6VMci9mH4Lw23ZWFz', 'Compra de productos: Mango Deshidratada,Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(46, NULL, NULL, NULL, NULL, '0', 51, NULL, '2020-06-03 15:32:22', '2020-06-03 15:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2v6VMci9mH4Lw23ZWFz', 'Compra de productos: Mango Deshidratada,Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(47, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-03 16:09:07', '2020-06-03 16:09:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hjQbK6o35nnGuHVnhMj', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(48, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-04 17:25:40', '2020-06-04 17:25:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pPHan6BxcpEN3UvQHRk', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(49, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2020-06-04 18:19:09', '2020-06-04 18:19:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', NULL, NULL, NULL, NULL, NULL, 1),
(50, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-04 18:19:57', '2020-06-04 18:20:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(51, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-04 18:20:03', '2020-06-04 18:20:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(52, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-04 18:20:06', '2020-06-04 18:20:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(53, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-04 18:20:07', '2020-06-04 18:20:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(54, NULL, NULL, NULL, NULL, '0', 51, NULL, '2020-06-04 18:20:13', '2020-06-04 18:20:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(55, NULL, NULL, NULL, NULL, '0', 51, NULL, '2020-06-04 18:20:15', '2020-06-04 18:20:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(56, NULL, NULL, NULL, NULL, '0', 51, NULL, '2020-06-04 18:20:15', '2020-06-04 18:20:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZhRe4GT5aq2BGsIgLIJ', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(57, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-04 18:21:21', '2020-06-04 18:21:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1wcvrjwcK7xtjK2xOwu', 'Compra de productos: Color_Rojo.', NULL, NULL, NULL, NULL, 1),
(58, NULL, NULL, NULL, NULL, '32375', 51, NULL, '2020-06-05 15:20:31', '2020-06-05 15:20:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MCIpJNPXzhk4RV6G9pG', 'Compra de productos: Piña Deshidratada,Linasa Dorada En Pepa,Pistachos.', NULL, NULL, NULL, NULL, 1),
(59, NULL, NULL, NULL, NULL, '0', 51, NULL, '2020-06-05 15:21:19', '2020-06-05 15:21:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MCIpJNPXzhk4RV6G9pG', 'Compra de productos: Piña Deshidratada,Linasa Dorada En Pepa,Pistachos.', NULL, NULL, NULL, NULL, 1),
(60, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2020-06-07 00:40:53', '2020-06-07 00:40:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'I9QytyPne0RYvzQxqu9', NULL, NULL, NULL, NULL, NULL, 1),
(61, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2020-06-08 11:48:16', '2020-06-08 11:48:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BWPwow9PR7qE2GMaEPy', NULL, NULL, NULL, NULL, NULL, 1),
(62, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-08 11:49:30', '2020-06-08 11:53:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BWPwow9PR7qE2GMaEPy', 'Compra de productos: Piña Deshidratada.', NULL, NULL, NULL, NULL, 0),
(63, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2020-06-09 05:34:36', '2020-06-09 05:34:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'RXHBexlyDqdGBowdfai', NULL, NULL, NULL, NULL, NULL, 1),
(64, NULL, NULL, NULL, NULL, '22000', 51, NULL, '2020-06-09 15:05:28', '2020-06-09 15:05:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'B4WyXgpxS1bx7rnDEfi', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(65, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-11 00:59:08', '2020-06-11 00:59:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jCGMQbt3HlwVltWC3TZ', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(66, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-11 01:00:00', '2020-06-11 01:00:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6wyRneWCjviJgPXh67E', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(67, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-11 01:00:08', '2020-06-11 01:00:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6wyRneWCjviJgPXh67E', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(68, NULL, NULL, NULL, NULL, '0', 52, NULL, '2020-06-11 01:00:17', '2020-06-11 01:00:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6wyRneWCjviJgPXh67E', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(69, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-11 01:02:52', '2020-06-11 01:02:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QMQhRWbCRHv8UF9BeIt', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(70, NULL, NULL, NULL, NULL, '0', 52, NULL, '2020-06-11 01:02:56', '2020-06-11 01:02:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QMQhRWbCRHv8UF9BeIt', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(71, NULL, NULL, NULL, NULL, '0', 52, NULL, '2020-06-11 01:02:56', '2020-06-11 01:02:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QMQhRWbCRHv8UF9BeIt', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(72, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-11 01:04:49', '2020-06-11 01:04:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ehkdjManaFjzD8bvH12', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(73, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2020-06-11 04:57:58', '2020-06-11 04:57:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hqPRLqrGsMZnuXE1wDS', NULL, NULL, NULL, NULL, NULL, 1),
(74, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-15 04:46:50', '2020-06-15 04:46:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '72kNd4cTnMTJAtYteqI', 'Compra de productos: Mora Deshidratada.', NULL, NULL, NULL, NULL, 1),
(75, NULL, NULL, NULL, NULL, '22000', 52, NULL, '2020-06-15 20:34:10', '2020-06-15 20:34:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ZbJr6V1vWnP5UYcrdEp', 'Compra de productos: Mango Deshidratada.', NULL, NULL, NULL, NULL, 1),
(76, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2020-06-15 23:44:06', '2020-06-15 23:44:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SGtxMJW6CDvCXbshfy0', NULL, NULL, NULL, NULL, NULL, 1),
(77, NULL, NULL, NULL, NULL, '40000', 51, NULL, '2020-06-15 23:44:49', '2020-06-15 23:44:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SGtxMJW6CDvCXbshfy0', 'Compra de productos: Mango Deshidratada,Semilla de Amapola.', NULL, NULL, NULL, NULL, 1),
(78, NULL, NULL, NULL, NULL, '0', 51, NULL, '2020-06-15 23:45:53', '2020-06-15 23:45:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SGtxMJW6CDvCXbshfy0', 'Compra de productos: Mango Deshidratada,Semilla de Amapola.', NULL, NULL, NULL, NULL, 1),
(90, NULL, NULL, NULL, NULL, '50000', 52, NULL, '2020-06-22 11:24:42', '2020-06-22 11:24:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XmrYNIFPeSddd5HAUE7', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(91, NULL, NULL, NULL, NULL, '60000', 52, NULL, '2020-06-22 11:25:01', '2020-06-22 11:25:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2wv8z3aY163KEMlM1Nv', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(92, NULL, NULL, NULL, NULL, '60000', 52, NULL, '2020-06-22 11:25:04', '2020-06-22 11:25:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2wv8z3aY163KEMlM1Nv', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(93, NULL, NULL, NULL, NULL, '50000', 52, NULL, '2020-06-22 11:29:18', '2020-06-22 11:29:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6DTqx5FTLe3SNso5dKn', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(94, NULL, NULL, NULL, NULL, '60000', 52, NULL, '2020-06-22 11:29:48', '2020-06-22 11:29:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'XqEUlDqtIZZBMo19r15', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(95, NULL, NULL, NULL, NULL, '60000', 52, NULL, '2020-06-22 16:28:18', '2020-06-22 16:28:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'bYzvpihsBsSBmZMqKhr', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(96, NULL, NULL, NULL, NULL, '50000', 52, NULL, '2020-06-22 16:42:40', '2020-06-22 16:42:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gwMeCBkEBwxW5d4aNdt', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(97, NULL, NULL, NULL, NULL, '50000', 52, NULL, '2020-06-23 04:49:17', '2020-06-23 04:49:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BnYkT3ty7AAOy2bauRS', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(98, NULL, NULL, NULL, NULL, '50000', 52, NULL, '2020-06-23 11:26:08', '2020-06-23 11:26:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vqnf6d3ZroiFcfNuF3o', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(99, 'oM8JWwVcMgLdunI3ihu', NULL, NULL, NULL, '45000', 56, 1, '2020-06-25 22:28:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'oM8JWwVcMgLdunI3ihu', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(100, NULL, NULL, NULL, NULL, '60000', 56, NULL, '2020-06-25 22:33:36', '2020-06-25 22:33:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h0ZmbsGgxPRWnwGD8aS', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(101, NULL, NULL, NULL, NULL, '60000', 56, NULL, '2020-06-25 22:33:45', '2020-06-25 22:33:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h0ZmbsGgxPRWnwGD8aS', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(102, NULL, NULL, NULL, NULL, '60000', 56, NULL, '2020-06-25 22:34:09', '2020-06-25 22:34:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'h0ZmbsGgxPRWnwGD8aS', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(103, NULL, NULL, NULL, NULL, '50000', 54, NULL, '2020-06-25 23:03:22', '2020-06-25 23:03:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gZzWJryIUZh9Xh3u8SU', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(104, NULL, NULL, NULL, NULL, '50000', 54, NULL, '2020-06-25 23:03:23', '2020-06-25 23:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gZzWJryIUZh9Xh3u8SU', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(105, NULL, NULL, NULL, NULL, '50000', 54, NULL, '2020-06-25 23:03:23', '2020-06-25 23:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gZzWJryIUZh9Xh3u8SU', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(106, NULL, NULL, NULL, NULL, '50000', 54, NULL, '2020-06-25 23:03:23', '2020-06-25 23:03:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gZzWJryIUZh9Xh3u8SU', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(107, NULL, NULL, NULL, NULL, '50000', 54, NULL, '2020-06-25 23:03:24', '2020-06-25 23:03:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gZzWJryIUZh9Xh3u8SU', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(108, NULL, NULL, NULL, NULL, '50000', 54, NULL, '2020-06-25 23:03:32', '2020-06-25 23:03:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gZzWJryIUZh9Xh3u8SU', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(109, NULL, NULL, NULL, NULL, '32000', 54, NULL, '2020-06-26 00:26:39', '2020-06-26 00:26:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T3F5PhvJU3kBSSQpIET', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(110, NULL, NULL, NULL, NULL, '32000', 54, NULL, '2020-06-26 00:26:42', '2020-06-26 00:26:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T3F5PhvJU3kBSSQpIET', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(111, NULL, NULL, NULL, NULL, '32000', 54, NULL, '2020-06-26 00:26:52', '2020-06-26 00:26:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T3F5PhvJU3kBSSQpIET', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(112, NULL, NULL, NULL, NULL, '32000', 54, NULL, '2020-06-26 00:28:56', '2020-06-26 00:28:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T3F5PhvJU3kBSSQpIET', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(113, 'FqwvVXq3o9StAOKisui', NULL, NULL, NULL, NULL, 54, NULL, '2020-06-26 00:34:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FqwvVXq3o9StAOKisui', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(114, 'FqwvVXq3o9StAOKisui', NULL, NULL, NULL, NULL, 54, NULL, '2020-06-26 00:34:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'FqwvVXq3o9StAOKisui', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(115, NULL, NULL, NULL, NULL, '65000', 56, NULL, '2020-06-26 04:51:34', '2020-06-26 04:51:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '945OvjeXlLEVfv5Lvmo', 'Compra de productos: Mora Deshidratada,Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(116, '945OvjeXlLEVfv5Lvmo', NULL, NULL, NULL, '0', 56, 0, '2020-06-26 04:51:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '945OvjeXlLEVfv5Lvmo', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(117, 'ovBpd08X1KI4WlUb24Q', NULL, NULL, NULL, '33000', 54, 1, '2020-06-26 15:57:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ovBpd08X1KI4WlUb24Q', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(118, 'W7pYPoYA6CWvl6TU4cS', NULL, NULL, NULL, '78000', 56, 2, '2020-06-29 00:36:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'W7pYPoYA6CWvl6TU4cS', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(119, NULL, NULL, NULL, NULL, '78000', 57, NULL, '2020-06-29 14:19:24', '2020-06-29 14:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'lpaH6aRGXDPghCCy2UK', 'Compra de productos: Mora Deshidratada,Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(120, 'qMwcARutLwNIEpxlt4f', NULL, NULL, NULL, '40000', 57, 1, '2020-06-29 14:28:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qMwcARutLwNIEpxlt4f', 'Compra de productos', NULL, NULL, NULL, NULL, 1),
(121, NULL, NULL, NULL, NULL, '3000', 57, NULL, '2020-06-29 14:47:18', '2020-06-29 14:47:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'byYdT2LHHP9eETE4DaK', 'Compra de productos: Piña Deshidratada.', NULL, NULL, NULL, NULL, 1),
(122, NULL, NULL, NULL, NULL, '0', 57, NULL, '2020-06-29 14:47:23', '2020-06-29 14:47:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'byYdT2LHHP9eETE4DaK', 'Compra de productos: Piña Deshidratada.', NULL, NULL, NULL, NULL, 1),
(123, NULL, NULL, NULL, NULL, '10000', 57, NULL, '2020-06-29 14:49:39', '2020-06-29 14:49:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3GKgQ83akDc1wiM1rDu', 'Compra de productos: Color Rojo.', NULL, NULL, NULL, NULL, 1),
(124, NULL, NULL, NULL, NULL, '42000', 56, NULL, '2020-07-02 18:41:04', '2020-07-02 18:41:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VZ6gOKasCvQxiA1wx0l', 'Compra de productos: Color Rojo,Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1),
(125, NULL, NULL, NULL, NULL, '32000', 52, NULL, '2020-07-03 15:02:51', '2020-07-03 15:02:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pxIr9Xp4RMrgvuh5UoN', 'Compra de productos: Banano Deshidratdo.', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordersstates`
--

CREATE TABLE `ordersstates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `tamaños` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`, `quantity`, `tamaños`) VALUES
(1, 34, NULL, NULL, NULL, NULL, 1, NULL),
(2, 34, NULL, NULL, NULL, NULL, 1, NULL),
(3, 34, NULL, NULL, NULL, NULL, 1, NULL),
(4, 34, NULL, NULL, NULL, NULL, 1, NULL),
(5, 35, NULL, NULL, NULL, NULL, 1, NULL),
(6, 35, NULL, NULL, NULL, NULL, 1, NULL),
(7, 42, 248, NULL, NULL, NULL, 1, NULL),
(8, 42, 250, NULL, NULL, NULL, 1, NULL),
(9, 45, NULL, NULL, NULL, NULL, 1, NULL),
(10, 45, NULL, NULL, NULL, NULL, 1, NULL),
(11, 45, NULL, NULL, NULL, NULL, 1, NULL),
(12, 45, NULL, NULL, NULL, NULL, 1, NULL),
(13, 46, 249, NULL, NULL, NULL, 1, NULL),
(14, 46, 247, NULL, NULL, NULL, 1, NULL),
(15, 48, 244, NULL, NULL, NULL, 1, NULL),
(16, 49, 245, NULL, NULL, NULL, 1, NULL),
(17, 50, 245, NULL, NULL, NULL, 1, NULL),
(18, 50, 249, NULL, NULL, NULL, 1, NULL),
(19, 51, 245, NULL, NULL, NULL, 1, NULL),
(20, 51, 249, NULL, NULL, NULL, 1, NULL),
(21, 52, 246, NULL, NULL, NULL, 1, NULL),
(22, 54, 248, NULL, NULL, NULL, 1, NULL),
(23, 55, 246, NULL, NULL, NULL, 1, NULL),
(24, 56, 250, NULL, NULL, NULL, 1, NULL),
(25, 56, 246, NULL, NULL, NULL, 1, NULL),
(26, 57, 250, NULL, NULL, NULL, 1, NULL),
(27, 58, 250, NULL, NULL, NULL, 1, NULL),
(28, 60, 243, NULL, NULL, NULL, 1, NULL),
(29, 61, 250, NULL, NULL, NULL, 2, NULL),
(30, 62, 243, NULL, NULL, NULL, 1, NULL),
(31, 63, 248, NULL, NULL, NULL, 1, NULL),
(32, 66, 248, NULL, NULL, NULL, 1, NULL),
(33, 71, 248, NULL, NULL, NULL, 1, NULL),
(34, 72, 250, NULL, NULL, NULL, 1, NULL),
(35, 73, 250, NULL, NULL, NULL, 1, NULL),
(36, 74, 250, NULL, NULL, NULL, 1, NULL),
(37, 75, 250, NULL, NULL, NULL, 1, NULL),
(38, 76, 250, NULL, NULL, NULL, 1, NULL),
(39, 77, 250, NULL, NULL, NULL, 1, NULL),
(40, 78, 250, NULL, NULL, NULL, 1, NULL),
(41, 79, 250, NULL, NULL, NULL, 1, NULL),
(42, 80, 251, NULL, NULL, NULL, 1, NULL),
(43, 81, 250, NULL, NULL, NULL, 1, NULL),
(44, 82, 251, NULL, NULL, NULL, 2, NULL),
(45, 83, 250, NULL, NULL, NULL, 1, NULL),
(46, 84, 250, NULL, NULL, NULL, 1, NULL),
(47, 86, 251, NULL, NULL, NULL, 1, 'Chocolate'),
(48, 93, 251, NULL, NULL, NULL, 2, 'Vainilla,Chocolate,caramelo'),
(49, 94, 250, NULL, NULL, NULL, 1, ''),
(50, 96, 250, NULL, NULL, NULL, 1, ''),
(51, 97, 251, NULL, NULL, NULL, 2, NULL),
(52, 98, 250, NULL, NULL, NULL, 1, ''),
(53, 99, 250, NULL, NULL, NULL, 2, ''),
(54, 99, 251, NULL, NULL, NULL, 1, ''),
(55, 100, 250, NULL, NULL, NULL, 2, ''),
(56, 100, 251, NULL, NULL, NULL, 1, 'Chocolate,caramelo'),
(57, 102, 250, NULL, NULL, NULL, 1, ''),
(58, 102, 251, NULL, NULL, NULL, 1, 'Vainilla'),
(59, 103, 250, NULL, NULL, NULL, 1, ''),
(60, 104, 250, NULL, NULL, NULL, 1, ''),
(61, 105, 249, NULL, NULL, NULL, 3, ''),
(62, 107, 251, NULL, NULL, NULL, 2, 'caramelo'),
(63, 108, 250, NULL, NULL, NULL, 1, ''),
(64, 109, 268, NULL, NULL, NULL, 1, 'Chocolate'),
(65, 110, 268, NULL, NULL, NULL, 1, 'Chocolate'),
(66, 111, 268, NULL, NULL, NULL, 1, 'Chocolate'),
(67, 112, 268, NULL, NULL, NULL, 1, 'Chocolate'),
(68, 114, 268, NULL, NULL, NULL, 1, ''),
(69, 115, 268, NULL, NULL, NULL, 1, ''),
(70, 116, 259, NULL, NULL, NULL, 1, 'Watermelon'),
(71, 117, 260, NULL, NULL, NULL, 1, 'Vainilla'),
(72, 1, 256, NULL, NULL, NULL, 1, NULL),
(73, 2, 255, NULL, NULL, NULL, 1, 'Fruit Punch'),
(74, 3, 268, NULL, NULL, NULL, 1, ''),
(75, 4, 268, NULL, NULL, NULL, 1, NULL),
(76, 5, 268, NULL, NULL, NULL, 1, NULL),
(77, 6, 268, NULL, NULL, NULL, 1, NULL),
(78, 7, 255, NULL, NULL, NULL, 1, ''),
(79, 9, 254, NULL, NULL, NULL, 1, ''),
(80, 10, 356, NULL, NULL, NULL, 1, NULL),
(81, 11, 257, NULL, NULL, NULL, 1, NULL),
(82, 12, 256, NULL, NULL, NULL, 1, NULL),
(83, 13, 320, NULL, NULL, NULL, 1, ''),
(84, 14, 268, NULL, NULL, NULL, 1, NULL),
(85, 15, 270, NULL, NULL, NULL, 1, NULL),
(86, 16, 259, NULL, NULL, NULL, 1, NULL),
(87, 17, 259, NULL, NULL, NULL, 1, NULL),
(88, 18, 256, NULL, NULL, NULL, 2, NULL),
(89, 18, 254, NULL, NULL, NULL, 2, NULL),
(90, 19, 256, NULL, NULL, NULL, 2, NULL),
(91, 19, 254, NULL, NULL, NULL, 2, NULL),
(92, 21, 256, NULL, NULL, NULL, 2, NULL),
(93, 21, 254, NULL, NULL, NULL, 2, NULL),
(94, 23, 256, NULL, NULL, NULL, 2, NULL),
(95, 23, 254, NULL, NULL, NULL, 2, NULL),
(96, 24, 256, NULL, NULL, NULL, 2, NULL),
(97, 24, 254, NULL, NULL, NULL, 2, NULL),
(98, 25, 256, NULL, NULL, NULL, 2, NULL),
(99, 25, 254, NULL, NULL, NULL, 2, NULL),
(100, 26, 256, NULL, NULL, NULL, 2, NULL),
(101, 26, 254, NULL, NULL, NULL, 2, NULL),
(102, 27, 256, NULL, NULL, NULL, 1, NULL),
(103, 28, 253, NULL, NULL, NULL, 1, ''),
(104, 29, 253, NULL, NULL, NULL, 1, NULL),
(105, 30, 253, NULL, NULL, NULL, 4, NULL),
(106, 31, 356, NULL, NULL, NULL, 1, ''),
(107, 32, 356, NULL, NULL, NULL, 1, NULL),
(108, 33, 320, NULL, NULL, NULL, 1, NULL),
(109, 33, 254, NULL, NULL, NULL, 1, NULL),
(110, 34, 275, NULL, NULL, NULL, 1, NULL),
(111, 34, 273, NULL, NULL, NULL, 1, NULL),
(112, 34, 354, NULL, NULL, NULL, 1, NULL),
(113, 35, 262, NULL, NULL, NULL, 1, NULL),
(114, 36, 262, NULL, NULL, NULL, 1, NULL),
(115, 37, 273, NULL, NULL, NULL, 1, NULL),
(116, 38, 273, NULL, NULL, NULL, 1, NULL),
(117, 39, 274, NULL, NULL, NULL, 1, NULL),
(118, 40, 274, NULL, NULL, NULL, 1, NULL),
(119, 41, 256, NULL, NULL, NULL, 1, ''),
(120, 42, 253, NULL, NULL, NULL, 1, NULL),
(121, 43, 273, NULL, NULL, NULL, 1, ''),
(122, 44, 256, NULL, NULL, NULL, 2, ''),
(123, 45, 256, NULL, NULL, NULL, 2, NULL),
(124, 46, 255, NULL, NULL, NULL, 1, ''),
(125, 47, 262, NULL, NULL, NULL, 1, NULL),
(126, 48, 320, NULL, NULL, NULL, 1, NULL),
(127, 48, 254, NULL, NULL, NULL, 1, NULL),
(128, 49, 287, NULL, NULL, NULL, 1, NULL),
(129, 49, 256, NULL, NULL, NULL, 1, NULL),
(130, 50, 344, NULL, NULL, NULL, 1, NULL),
(131, 51, 356, NULL, NULL, NULL, 1, NULL),
(132, 51, 318, NULL, NULL, NULL, 1, NULL),
(133, 52, 364, NULL, NULL, NULL, 1, NULL),
(134, 53, 364, NULL, NULL, NULL, 1, NULL),
(135, 54, 260, NULL, NULL, NULL, 1, NULL),
(136, 55, 272, NULL, NULL, NULL, 1, ''),
(137, 56, 318, NULL, NULL, NULL, 1, NULL),
(138, 1, 367, NULL, NULL, NULL, 1, NULL),
(139, 2, 350, NULL, NULL, NULL, 1, NULL),
(140, 4, 282, NULL, NULL, NULL, 1, ''),
(141, 5, 282, NULL, NULL, NULL, 1, ''),
(142, 6, 282, NULL, NULL, NULL, 1, ''),
(143, 7, 256, NULL, NULL, NULL, 1, NULL),
(144, 8, 256, NULL, NULL, NULL, 1, NULL),
(145, 9, 369, NULL, NULL, NULL, 1, NULL),
(146, 10, 266, NULL, NULL, NULL, 1, NULL),
(147, 11, 266, NULL, NULL, NULL, 1, NULL),
(148, 12, 261, NULL, NULL, NULL, 1, NULL),
(149, 12, 354, NULL, NULL, NULL, 1, NULL),
(150, 13, 261, NULL, NULL, NULL, 1, NULL),
(151, 13, 354, NULL, NULL, NULL, 1, NULL),
(152, 14, 261, NULL, NULL, NULL, 1, NULL),
(153, 15, 254, NULL, NULL, NULL, 1, NULL),
(154, 16, 295, NULL, NULL, NULL, 1, NULL),
(155, 16, 354, NULL, NULL, NULL, 1, NULL),
(156, 17, 300, NULL, NULL, NULL, 1, ''),
(157, 18, 300, NULL, NULL, NULL, 1, ''),
(158, 19, 261, NULL, NULL, NULL, 1, NULL),
(159, 20, 261, NULL, NULL, NULL, 1, NULL),
(160, 21, 275, NULL, NULL, NULL, 1, ''),
(161, 22, 275, NULL, NULL, NULL, 1, ''),
(162, 23, 275, NULL, NULL, NULL, 1, NULL),
(163, 24, 275, NULL, NULL, NULL, 1, NULL),
(164, 25, 272, NULL, NULL, NULL, 1, NULL),
(165, 26, 374, NULL, NULL, NULL, 1, NULL),
(166, 26, 373, NULL, NULL, NULL, 1, NULL),
(167, 27, 375, NULL, NULL, NULL, 1, NULL),
(168, 28, 391, NULL, NULL, NULL, 1, ''),
(169, 29, 391, NULL, NULL, NULL, 1, ''),
(170, 30, 380, NULL, NULL, NULL, 1, NULL),
(171, 30, 261, NULL, NULL, NULL, 1, NULL),
(172, 31, 392, NULL, NULL, NULL, 1, NULL),
(173, 32, 253, NULL, NULL, NULL, 1, NULL),
(174, 32, 375, NULL, NULL, NULL, 1, NULL),
(175, 34, 391, NULL, NULL, NULL, 1, ''),
(176, 35, 274, NULL, NULL, NULL, 5, NULL),
(177, 35, 260, NULL, NULL, NULL, 5, NULL),
(178, 35, 295, NULL, NULL, NULL, 4, NULL),
(179, 36, 391, NULL, NULL, NULL, 2, NULL),
(180, 36, 394, NULL, NULL, NULL, 1, NULL),
(181, 37, 314, NULL, NULL, NULL, 1, NULL),
(182, 38, 391, NULL, NULL, NULL, 3, NULL),
(183, 39, 391, NULL, NULL, NULL, 2, NULL),
(184, 39, 394, NULL, NULL, NULL, 4, NULL),
(185, 40, 387, NULL, NULL, NULL, 1, NULL),
(186, 41, 387, NULL, NULL, NULL, 1, NULL),
(187, 42, 363, NULL, NULL, NULL, 3, NULL),
(188, 43, 394, NULL, NULL, NULL, 1, NULL),
(189, 43, 253, NULL, NULL, NULL, 1, NULL),
(190, 44, 394, NULL, NULL, NULL, 1, NULL),
(191, 45, 398, NULL, NULL, NULL, 1, NULL),
(192, 45, 397, NULL, NULL, NULL, 1, NULL),
(193, 47, 396, NULL, NULL, NULL, 2, NULL),
(194, 48, 398, NULL, NULL, NULL, 1, NULL),
(195, 50, 397, NULL, NULL, NULL, 6, NULL),
(196, 51, 397, NULL, NULL, NULL, 6, NULL),
(197, 53, 397, NULL, NULL, NULL, 6, NULL),
(198, 52, 397, NULL, NULL, NULL, 6, NULL),
(199, 57, 400, NULL, NULL, NULL, 27, NULL),
(200, 58, 399, NULL, NULL, NULL, 1, NULL),
(201, 58, 401, NULL, NULL, NULL, 1, NULL),
(202, 58, 406, NULL, NULL, NULL, 1, NULL),
(203, 62, 399, NULL, NULL, NULL, 2, NULL),
(204, 64, 398, NULL, NULL, NULL, 1, NULL),
(205, 65, 398, NULL, NULL, NULL, 3, NULL),
(206, 66, 398, NULL, NULL, NULL, 3, NULL),
(207, 67, 398, NULL, NULL, NULL, 3, NULL),
(208, 69, 398, NULL, NULL, NULL, 6, NULL),
(209, 72, 398, NULL, NULL, NULL, 4, NULL),
(210, 74, 397, NULL, NULL, NULL, 2, NULL),
(211, 75, 398, NULL, NULL, NULL, 3, NULL),
(212, 77, 398, NULL, NULL, NULL, 3, NULL),
(213, 77, 404, NULL, NULL, NULL, 3, NULL),
(214, 79, 397, NULL, NULL, NULL, 1, NULL),
(215, 79, 396, NULL, NULL, NULL, 1, NULL),
(216, 80, 397, NULL, NULL, NULL, 1, NULL),
(217, 80, 396, NULL, NULL, NULL, 1, NULL),
(218, 81, 397, NULL, NULL, NULL, 1, NULL),
(219, 81, 396, NULL, NULL, NULL, 1, NULL),
(220, 83, 397, NULL, NULL, NULL, 1, NULL),
(221, 82, 397, NULL, NULL, NULL, 1, NULL),
(222, 86, 397, NULL, NULL, NULL, 1, NULL),
(223, 87, 397, NULL, NULL, NULL, 1, NULL),
(224, 83, 396, NULL, NULL, NULL, 1, NULL),
(225, 87, 396, NULL, NULL, NULL, 1, NULL),
(226, 82, 396, NULL, NULL, NULL, 1, NULL),
(227, 86, 396, NULL, NULL, NULL, 1, NULL),
(228, 84, 397, NULL, NULL, NULL, 1, NULL),
(229, 84, 396, NULL, NULL, NULL, 1, NULL),
(230, 85, 397, NULL, NULL, NULL, 1, NULL),
(231, 85, 396, NULL, NULL, NULL, 1, NULL),
(232, 88, 397, NULL, NULL, NULL, 1, NULL),
(233, 88, 396, NULL, NULL, NULL, 1, NULL),
(234, 89, 397, NULL, NULL, NULL, 1, NULL),
(235, 89, 396, NULL, NULL, NULL, 1, NULL),
(236, 90, 396, NULL, NULL, NULL, 1, NULL),
(237, 91, 396, NULL, NULL, NULL, 1, NULL),
(238, 92, 396, NULL, NULL, NULL, 1, NULL),
(239, 93, 396, NULL, NULL, NULL, 1, NULL),
(240, 94, 396, NULL, NULL, NULL, 1, NULL),
(241, 95, 396, NULL, NULL, NULL, 1, NULL),
(242, 96, 396, NULL, NULL, NULL, 1, NULL),
(243, 97, 396, NULL, NULL, NULL, 1, NULL),
(244, 98, 396, NULL, NULL, NULL, 1, NULL),
(245, 99, 397, NULL, NULL, NULL, 1, '500 mg'),
(246, 100, 396, NULL, NULL, NULL, 1, NULL),
(247, 101, 396, NULL, NULL, NULL, 1, NULL),
(248, 102, 396, NULL, NULL, NULL, 1, NULL),
(249, 103, 396, NULL, NULL, NULL, 1, NULL),
(250, 104, 396, NULL, NULL, NULL, 1, NULL),
(251, 105, 396, NULL, NULL, NULL, 1, NULL),
(252, 106, 396, NULL, NULL, NULL, 1, NULL),
(253, 107, 396, NULL, NULL, NULL, 1, NULL),
(254, 108, 396, NULL, NULL, NULL, 1, NULL),
(255, 109, 396, NULL, NULL, NULL, 1, NULL),
(256, 110, 396, NULL, NULL, NULL, 1, NULL),
(257, 111, 396, NULL, NULL, NULL, 1, NULL),
(258, 112, 396, NULL, NULL, NULL, 1, NULL),
(259, 115, 397, NULL, NULL, NULL, 1, NULL),
(260, 115, 396, NULL, NULL, NULL, 1, NULL),
(261, 117, 397, NULL, NULL, NULL, 1, '500 mg'),
(262, 118, 397, NULL, NULL, NULL, 1, '500 mg'),
(263, 118, 396, NULL, NULL, NULL, 1, '500 mg'),
(264, 119, 397, NULL, NULL, NULL, 1, NULL),
(265, 119, 396, NULL, NULL, NULL, 1, NULL),
(266, 120, 398, NULL, NULL, NULL, 1, '500 mg'),
(267, 121, 399, NULL, NULL, NULL, 1, NULL),
(268, 123, 400, NULL, NULL, NULL, 1, NULL),
(269, 124, 400, NULL, NULL, NULL, 1, NULL),
(270, 124, 396, NULL, NULL, NULL, 1, NULL),
(271, 125, 396, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-01-11 15:38:07', '2019-01-11 15:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'androme91@gmail.com', '1rfRCB9ru6JKxT8Qz54Mp5uAXYFdrL1v0B0wFvRNNgeRC9eqm4hga7kPG1pV', '2020-06-19 11:57:00', '2020-06-19 11:57:00'),
(2, 'dufedalo@getnada.com', 'HBCGkzoJWoYqA8RHzSdkoiARoatoslif4tvF8tI12E09UX6nknUW2rn85Hmp', '2020-06-20 06:13:23', '2020-06-20 06:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(2, 'browse_bread', NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(3, 'browse_database', NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(4, 'browse_media', NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(5, 'browse_compass', NULL, '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(6, 'browse_menus', 'menus', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(7, 'read_menus', 'menus', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(8, 'edit_menus', 'menus', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(9, 'add_menus', 'menus', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(10, 'delete_menus', 'menus', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(11, 'browse_roles', 'roles', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(12, 'read_roles', 'roles', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(13, 'edit_roles', 'roles', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(14, 'add_roles', 'roles', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(15, 'delete_roles', 'roles', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(16, 'browse_users', 'users', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(17, 'read_users', 'users', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(18, 'edit_users', 'users', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(19, 'add_users', 'users', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(20, 'delete_users', 'users', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(21, 'browse_settings', 'settings', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(22, 'read_settings', 'settings', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(23, 'edit_settings', 'settings', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(24, 'add_settings', 'settings', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(25, 'delete_settings', 'settings', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(26, 'browse_categories', 'categories', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(27, 'read_categories', 'categories', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(28, 'edit_categories', 'categories', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(29, 'add_categories', 'categories', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(30, 'delete_categories', 'categories', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(31, 'browse_posts', 'posts', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(32, 'read_posts', 'posts', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(33, 'edit_posts', 'posts', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(34, 'add_posts', 'posts', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(35, 'delete_posts', 'posts', '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(36, 'browse_pages', 'pages', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(37, 'read_pages', 'pages', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(38, 'edit_pages', 'pages', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(39, 'add_pages', 'pages', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(40, 'delete_pages', 'pages', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(41, 'browse_hooks', NULL, '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(42, 'browse_products', 'products', '2019-01-12 00:10:45', '2019-01-12 00:10:45'),
(43, 'read_products', 'products', '2019-01-12 00:10:45', '2019-01-12 00:10:45'),
(44, 'edit_products', 'products', '2019-01-12 00:10:45', '2019-01-12 00:10:45'),
(45, 'add_products', 'products', '2019-01-12 00:10:45', '2019-01-12 00:10:45'),
(46, 'delete_products', 'products', '2019-01-12 00:10:45', '2019-01-12 00:10:45'),
(47, 'browse_brandscategories', 'brandscategories', '2019-01-12 00:21:27', '2019-01-12 00:21:27'),
(48, 'read_brandscategories', 'brandscategories', '2019-01-12 00:21:27', '2019-01-12 00:21:27'),
(49, 'edit_brandscategories', 'brandscategories', '2019-01-12 00:21:27', '2019-01-12 00:21:27'),
(50, 'add_brandscategories', 'brandscategories', '2019-01-12 00:21:27', '2019-01-12 00:21:27'),
(51, 'delete_brandscategories', 'brandscategories', '2019-01-12 00:21:27', '2019-01-12 00:21:27'),
(52, 'browse_brands', 'brands', '2019-01-12 00:23:31', '2019-01-12 00:23:31'),
(53, 'read_brands', 'brands', '2019-01-12 00:23:31', '2019-01-12 00:23:31'),
(54, 'edit_brands', 'brands', '2019-01-12 00:23:31', '2019-01-12 00:23:31'),
(55, 'add_brands', 'brands', '2019-01-12 00:23:31', '2019-01-12 00:23:31'),
(56, 'delete_brands', 'brands', '2019-01-12 00:23:31', '2019-01-12 00:23:31'),
(57, 'browse_sliders', 'sliders', '2019-01-12 12:21:13', '2019-01-12 12:21:13'),
(58, 'read_sliders', 'sliders', '2019-01-12 12:21:13', '2019-01-12 12:21:13'),
(59, 'edit_sliders', 'sliders', '2019-01-12 12:21:13', '2019-01-12 12:21:13'),
(60, 'add_sliders', 'sliders', '2019-01-12 12:21:13', '2019-01-12 12:21:13'),
(61, 'delete_sliders', 'sliders', '2019-01-12 12:21:13', '2019-01-12 12:21:13'),
(62, 'browse_dealers', 'dealers', '2019-01-12 13:56:36', '2019-01-12 13:56:36'),
(63, 'read_dealers', 'dealers', '2019-01-12 13:56:36', '2019-01-12 13:56:36'),
(64, 'edit_dealers', 'dealers', '2019-01-12 13:56:36', '2019-01-12 13:56:36'),
(65, 'add_dealers', 'dealers', '2019-01-12 13:56:36', '2019-01-12 13:56:36'),
(66, 'delete_dealers', 'dealers', '2019-01-12 13:56:36', '2019-01-12 13:56:36'),
(67, 'browse_productsgroups', 'productsgroups', '2019-01-16 21:00:00', '2019-01-16 21:00:00'),
(68, 'read_productsgroups', 'productsgroups', '2019-01-16 21:00:00', '2019-01-16 21:00:00'),
(69, 'edit_productsgroups', 'productsgroups', '2019-01-16 21:00:00', '2019-01-16 21:00:00'),
(70, 'add_productsgroups', 'productsgroups', '2019-01-16 21:00:00', '2019-01-16 21:00:00'),
(71, 'delete_productsgroups', 'productsgroups', '2019-01-16 21:00:00', '2019-01-16 21:00:00'),
(72, 'browse_orders', 'orders', '2019-02-05 06:59:18', '2019-02-05 06:59:18'),
(73, 'read_orders', 'orders', '2019-02-05 06:59:18', '2019-02-05 06:59:18'),
(74, 'edit_orders', 'orders', '2019-02-05 06:59:18', '2019-02-05 06:59:18'),
(75, 'add_orders', 'orders', '2019-02-05 06:59:18', '2019-02-05 06:59:18'),
(76, 'delete_orders', 'orders', '2019-02-05 06:59:18', '2019-02-05 06:59:18'),
(77, 'browse_faqs', 'faqs', '2019-02-08 12:04:08', '2019-02-08 12:04:08'),
(78, 'read_faqs', 'faqs', '2019-02-08 12:04:08', '2019-02-08 12:04:08'),
(79, 'edit_faqs', 'faqs', '2019-02-08 12:04:08', '2019-02-08 12:04:08'),
(80, 'add_faqs', 'faqs', '2019-02-08 12:04:08', '2019-02-08 12:04:08'),
(81, 'delete_faqs', 'faqs', '2019-02-08 12:04:08', '2019-02-08 12:04:08'),
(82, 'browse_flavors', 'flavors', '2019-03-01 20:30:06', '2019-03-01 20:30:06'),
(83, 'read_flavors', 'flavors', '2019-03-01 20:30:06', '2019-03-01 20:30:06'),
(84, 'edit_flavors', 'flavors', '2019-03-01 20:30:06', '2019-03-01 20:30:06'),
(85, 'add_flavors', 'flavors', '2019-03-01 20:30:06', '2019-03-01 20:30:06'),
(86, 'delete_flavors', 'flavors', '2019-03-01 20:30:06', '2019-03-01 20:30:06'),
(112, 'browse_instagramfeeds', 'instagramfeeds', '2020-06-23 00:12:35', '2020-06-23 00:12:35'),
(113, 'read_instagramfeeds', 'instagramfeeds', '2020-06-23 00:12:35', '2020-06-23 00:12:35'),
(114, 'edit_instagramfeeds', 'instagramfeeds', '2020-06-23 00:12:35', '2020-06-23 00:12:35'),
(115, 'add_instagramfeeds', 'instagramfeeds', '2020-06-23 00:12:35', '2020-06-23 00:12:35'),
(116, 'delete_instagramfeeds', 'instagramfeeds', '2020-06-23 00:12:35', '2020-06-23 00:12:35'),
(117, 'browse_presentaciones', 'presentaciones', '2020-06-23 00:57:11', '2020-06-23 00:57:11'),
(118, 'read_presentaciones', 'presentaciones', '2020-06-23 00:57:11', '2020-06-23 00:57:11'),
(119, 'edit_presentaciones', 'presentaciones', '2020-06-23 00:57:11', '2020-06-23 00:57:11'),
(120, 'add_presentaciones', 'presentaciones', '2020-06-23 00:57:11', '2020-06-23 00:57:11'),
(121, 'delete_presentaciones', 'presentaciones', '2020-06-23 00:57:11', '2020-06-23 00:57:11'),
(122, 'browse_product_presentacion_pivote', 'product_presentacion_pivote', '2020-06-23 00:57:39', '2020-06-23 00:57:39'),
(123, 'read_product_presentacion_pivote', 'product_presentacion_pivote', '2020-06-23 00:57:39', '2020-06-23 00:57:39'),
(124, 'edit_product_presentacion_pivote', 'product_presentacion_pivote', '2020-06-23 00:57:39', '2020-06-23 00:57:39'),
(125, 'add_product_presentacion_pivote', 'product_presentacion_pivote', '2020-06-23 00:57:39', '2020-06-23 00:57:39'),
(126, 'delete_product_presentacion_pivote', 'product_presentacion_pivote', '2020-06-23 00:57:39', '2020-06-23 00:57:39'),
(127, 'browse_presentacion_precio_pivote', 'presentacion_precio_pivote', '2020-06-23 00:58:02', '2020-06-23 00:58:02'),
(128, 'read_presentacion_precio_pivote', 'presentacion_precio_pivote', '2020-06-23 00:58:02', '2020-06-23 00:58:02'),
(129, 'edit_presentacion_precio_pivote', 'presentacion_precio_pivote', '2020-06-23 00:58:02', '2020-06-23 00:58:02'),
(130, 'add_presentacion_precio_pivote', 'presentacion_precio_pivote', '2020-06-23 00:58:02', '2020-06-23 00:58:02'),
(131, 'delete_presentacion_precio_pivote', 'presentacion_precio_pivote', '2020-06-23 00:58:02', '2020-06-23 00:58:02'),
(132, 'browse_precios', 'precios', '2020-06-23 00:58:43', '2020-06-23 00:58:43'),
(133, 'read_precios', 'precios', '2020-06-23 00:58:43', '2020-06-23 00:58:43'),
(134, 'edit_precios', 'precios', '2020-06-23 00:58:43', '2020-06-23 00:58:43'),
(135, 'add_precios', 'precios', '2020-06-23 00:58:43', '2020-06-23 00:58:43'),
(136, 'delete_precios', 'precios', '2020-06-23 00:58:43', '2020-06-23 00:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(72, 1),
(73, 1),
(74, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-11 15:38:06', '2019-01-11 15:38:06'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-01-11 15:38:06', '2019-01-11 15:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `precios`
--

CREATE TABLE `precios` (
  `id` int(10) UNSIGNED NOT NULL,
  `valor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `precios`
--

INSERT INTO `precios` (`id`, `valor`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20000, '2020-06-16 14:29:11', '2020-06-16 14:29:11', NULL),
(2, 50000, '2020-06-16 14:29:17', '2020-06-16 14:29:17', NULL),
(3, 120000, '2020-06-16 14:29:23', '2020-06-16 14:29:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `presentaciones`
--

CREATE TABLE `presentaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_producto_relacion` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presentaciones`
--

INSERT INTO `presentaciones` (`id`, `nombre`, `nombre_producto_relacion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bolsa 500 gr', 'bolsa 500 - Banano', '2020-06-16 14:32:10', '2020-06-16 14:32:10', NULL),
(2, 'Bulto', 'Bulto - Banano', '2020-06-16 14:32:32', '2020-06-16 14:32:32', NULL),
(3, 'Tonelada', 'Tonelada - banano', '2020-06-16 14:32:51', '2020-06-16 14:32:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `presentacion_precio_pivote`
--

CREATE TABLE `presentacion_precio_pivote` (
  `id` int(10) UNSIGNED NOT NULL,
  `presentacione_id` int(11) DEFAULT NULL,
  `precio_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presentacion_precio_pivote`
--

INSERT INTO `presentacion_precio_pivote` (`id`, `presentacione_id`, `precio_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL),
(3, 3, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(11) DEFAULT NULL,
  `shop_link` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `presentation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `code` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci,
  `beneficios` longtext COLLATE utf8mb4_unicode_ci,
  `uso_sugerido` longtext COLLATE utf8mb4_unicode_ci,
  `advertencia` longtext COLLATE utf8mb4_unicode_ci,
  `tamaños` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion_imagen` longtext COLLATE utf8mb4_unicode_ci,
  `brandscategories_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT '999',
  `active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `brand_id`, `shop_link`, `created_at`, `updated_at`, `deleted_at`, `slug`, `price`, `presentation`, `discount`, `code`, `images`, `beneficios`, `uso_sugerido`, `advertencia`, `tamaños`, `descripcion_imagen`, `brandscategories_id`, `order`, `active`) VALUES
(396, 'Banano Deshidratdo', '<p>Banano Deshidratdo de buena calidad y buen sabor.</p>', '[\"products\\/June2020\\/hIrHDJK3fd1Ahbdgsjut.jpg\",\"products\\/June2020\\/Cd3sFK60GhiqtLbX51nP.jpg\"]', 50, '1', '2020-06-03 09:44:50', '2020-06-10 16:42:59', NULL, 'banano-deshidratdo', 22000, '400 gr.', 0, '1232', NULL, '<p>hola hola</p>', '<p>sio</p>', '<p>lop</p>', '500 mg - Un Bulto - Una Tonelada', '<p>psps</p>', 29, 1, 1),
(397, 'Mora Deshidratada', '<p>Mora Deshidratada de la mejor calidad.</p>', '[\"products\\/June2020\\/kaL5PMhw9Y0cp3Pf8sbZ.jpg\",\"products\\/June2020\\/Ef009T5tnYsx1C9UUWO3.jpg\"]', 50, '1', '2020-06-03 10:02:18', '2020-06-17 22:37:19', NULL, 'mora-deshidratada', 22000, '500 MG - Un bulto - Una Tonelada', 0, '5263', NULL, NULL, NULL, NULL, 'bulto', NULL, 29, 2, 1),
(398, 'Mango Deshidratada', '<p>Mango Deshidratada</p>', '[\"products\\/June2020\\/16EFWr4R2T08QmkQyv0z.jpg\",\"products\\/June2020\\/pTEBCgzKEevxeTZFUPXn.jpg\"]', 50, '1', '2020-06-03 10:09:25', '2020-06-18 15:45:20', NULL, 'mango-deshidratada', 22000, '500 mg', 0, '9632', NULL, NULL, NULL, NULL, '500 mg - Un Bulto - Una Tonelada', NULL, 29, 3, 1),
(399, 'Piña Deshidratada', '<p>Pi&ntilde;a Deshidratada</p>', '[\"products\\/June2020\\/GMJwCnYsNeq7mikwR2p3.jpg\",\"products\\/June2020\\/bBNJOYsaF8NC5yLiBuMW.jpg\"]', 50, '1', '2020-06-03 10:10:09', '2020-06-18 16:18:46', NULL, 'pina-deshidratada', 22000, '500 mg', 0, '121', NULL, NULL, NULL, NULL, NULL, NULL, 29, 4, 1),
(400, 'Color Rojo', '<p><span style=\"box-sizing: border-box; color: #232323; font-size: 16px; font-family: Verdana, sans-serif;\"><span style=\"box-sizing: border-box;\">Color Rojo</span></span><span style=\"box-sizing: border-box; color: #232323; font-size: 16px; font-family: Verdana, sans-serif;\">&nbsp;de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/umL2wp39UzKzbNAV9bbP.jpg\",\"products\\/June2020\\/qcNKIQGm9nSCmb90ThHY.jpg\"]', 50, '1', '2020-06-03 10:53:01', '2020-06-18 16:34:19', NULL, 'color-rojo', 22000, '500 mg', 0, '1233', NULL, NULL, NULL, NULL, NULL, NULL, 31, 5, 1),
(403, 'Uvas Pasas', '<p><span style=\"font-family: Verdana, sans-serif;\">Uvas Pasas fruto seco de buena calidad</span></p>', '[\"products\\/June2020\\/MXofP5oHrIUYyIKomTRd.jpg\",\"products\\/June2020\\/Yls4cUWXYGazxFkbmDIn.jpg\"]', 50, '1', '2020-06-03 11:58:21', '2020-06-12 11:07:13', NULL, 'uvas-pasas', 9000, '500 mg', 0, '1213', NULL, '<p>Uvas_Pasas</p>', NULL, NULL, NULL, NULL, 28, 8, 1),
(404, 'Semilla de Amapola', '<p>Semillas de Amapola de textura y fragancia unica</p>', '[\"products\\/June2020\\/nxzAvVQLkLdpqCZtXHC9.jpg\",\"products\\/June2020\\/Z940YTJDYaJ2Oe7m9tQc.jpg\"]', 50, '1', '2020-06-03 12:08:16', '2020-06-11 16:51:09', NULL, 'semilla-de-amapola', 18000, '500 mg', 0, '1231', NULL, '<p>Uvas_Pasas</p>', NULL, NULL, NULL, NULL, 32, 10, 1),
(405, 'Avellanas', '<p>Avellanas fruto seco de buena calidad&nbsp; &nbsp;&nbsp;</p>', '[\"products\\/June2020\\/EzltWWnGzyPaw9F9dWgI.jpg\",\"products\\/June2020\\/ko97lAZv6rGzELPRMLQB.jpg\"]', 50, '1', '2020-06-03 12:09:00', '2020-06-12 10:43:30', NULL, 'avellanas', 12000, '500 mg', 0, '1231', NULL, '<p>Uvas_Pasas</p>', NULL, NULL, NULL, NULL, 28, 9, 1),
(408, 'Salvado De Trigo', '<p>Harina de salvado de trigo de buena calidad y textura</p>', '[\"products\\/June2020\\/xWGxNMmEu1RSqUevD6SB.jpg\",\"products\\/June2020\\/gGoEHSvQzANqD9wRgA3G.jpg\"]', 50, '0', '2020-06-11 12:37:01', '2020-06-18 12:41:12', NULL, 'salvado-de-trigo', 12000, '500 mg', 0, '001', NULL, NULL, NULL, NULL, NULL, NULL, 33, 1, 0),
(409, 'Salvado de Avena', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Harina de salvado de avena de buena calidad y textura&nbsp;</span></p>', '[\"products\\/June2020\\/SDF0aMdhuE6mrE9M1uSZ.png\",\"products\\/June2020\\/YW9UTmWaOAVhU5rH1eyE.jpg\"]', 50, '0', '2020-06-11 14:50:27', '2020-06-18 12:30:16', NULL, 'salvado-de-avena', 12000, '500 mg', 0, '002', NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 0),
(410, 'Harina de Psyllium', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Psyllium&nbsp;</span></span><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">de buena calidad y textura&nbsp;</span></p>', '[\"products\\/June2020\\/GWUH2ioK465amNbAbdkG.jpg\",\"products\\/June2020\\/nvKoG4Ab64bIkzLtgySx.jpg\"]', 50, '0', '2020-06-11 14:57:51', '2020-06-11 15:10:32', NULL, 'harina-de-psyllium', 12000, '500 mg', 0, '003', NULL, NULL, NULL, NULL, NULL, NULL, 33, 3, 0),
(411, 'Maizena', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;Maizena&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">de buena calidad y textura&nbsp;</span></p>', '[\"products\\/June2020\\/IiuYDw1m0gIghqs4txpK.jpg\",\"products\\/June2020\\/LGlyR821mbUACHJAqeNP.jpg\"]', 50, '0', '2020-06-11 15:02:19', '2020-06-19 09:18:15', NULL, 'maizena', 12000, '500 mg', 0, '004', NULL, NULL, NULL, NULL, NULL, NULL, 33, 4, 1),
(412, 'Maca Molida', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;Maca Molida&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">de buena calidad y textura&nbsp;</span></p>', '[\"products\\/June2020\\/Mqq3JQuU4HHnnymf26lR.jpg\",\"products\\/June2020\\/6pAPPiWvjZLMZ8o0zNPD.jpg\"]', 50, '0', '2020-06-11 15:07:37', '2020-06-18 12:22:16', NULL, 'maca-molida', 12000, '500 mg', 0, '005', NULL, NULL, NULL, NULL, NULL, NULL, 33, 5, 0),
(413, 'Linaza Molida', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\">Linaza Molida&nbsp;</span></span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">de buena calidad y textura&nbsp;</span></p>', '[\"products\\/June2020\\/pPchA8YRrx4XSsbkv6BJ.jpg\",\"products\\/June2020\\/tjV0pMr6CLWG55RF19yk.jpg\"]', 50, '0', '2020-06-11 15:13:31', '2020-06-11 15:16:14', NULL, 'linaza-molida', 12000, '500 mg', 0, '006', NULL, NULL, NULL, NULL, NULL, NULL, 33, 6, 0),
(414, 'Levadura De Cerveza', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"box-sizing: border-box;\"><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Levadura De Cerveza de buena calidad y textura&nbsp;</span></span></span></p>', '[\"products\\/June2020\\/eoK0gyo9sKkxITl2tDzx.jpg\",\"products\\/June2020\\/NRZi3pZMz7Hsq1NT0dOj.jpg\"]', 50, '0', '2020-06-11 15:23:04', '2020-06-18 10:40:07', NULL, 'levadura-de-cerveza', 12000, '500 mg', 0, '007', NULL, NULL, NULL, NULL, NULL, NULL, 33, 7, 0),
(415, 'Harina De Trigo Integral', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Trigo Integral&nbsp;de buena calidad y textura&nbsp;</span></span></span></span></span></p>', '[\"products\\/June2020\\/4mhEHdfHc3kAdgbPOWL5.png\",\"products\\/June2020\\/fI6hVeZYZtp5LclrGmYc.jpg\"]', 50, '0', '2020-06-11 15:26:05', '2020-06-18 17:00:55', NULL, 'harina-trigo-integral', 12000, '500 mg', 0, '008', NULL, NULL, NULL, NULL, NULL, NULL, 33, 8, 0),
(416, 'Harina De Soya', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Soya&nbsp;de buena calidad y textura&nbsp;</span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/yCVY7HmcDhEYkRafyB9e.jpg\",\"products\\/June2020\\/Y6FKRG4U0InBhPu12l99.jpg\"]', 50, '0', '2020-06-11 15:34:42', '2020-06-19 08:22:57', NULL, 'harina-soya', 12000, '500 mg', 0, '009', NULL, NULL, NULL, NULL, NULL, NULL, 33, 9, 0),
(417, 'Harina De Sorgo', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">Sorgo&nbsp;de buena calidad y textura&nbsp;</span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/5i0U9fTagInZUEoycxfU.jpg\",\"products\\/June2020\\/h8h17dJOA7hLAFJSY7cy.jpg\"]', 50, '0', '2020-06-11 15:41:36', '2020-06-19 08:22:32', NULL, 'harina-sorgo', 12000, '500 mg', 0, '010', NULL, NULL, NULL, NULL, NULL, NULL, 33, 10, 0),
(418, 'Harina De  Quinua', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Quinuade buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/ne1cUPigCbAtumEOGak3.jpg\",\"products\\/June2020\\/dYRUndju8K6fh5jheFAe.jpg\"]', 50, '0', '2020-06-11 15:44:02', '2020-06-18 17:03:17', NULL, 'harina-quinua', 12000, '500 mg', 0, '011', NULL, NULL, NULL, NULL, NULL, NULL, 33, 11, 0),
(419, 'Harina Porva', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Porva&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/Uj6FOkOKVCbbtZMIY5UQ.jpg\",\"products\\/June2020\\/l8bZWhEoqI08OVcShAU5.jpg\"]', 50, '0', '2020-06-11 15:49:44', '2020-06-18 10:37:34', NULL, 'harina-porva', 12000, '500 mg', 0, '012', NULL, NULL, NULL, NULL, NULL, NULL, 33, 12, 0),
(420, 'Harina De Garbanzo', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Garbanzo de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/SQfYnNGOTmLgP0x6gRlg.jpg\",\"products\\/June2020\\/doL8wyMukulczsJnVmf4.jpg\"]', 50, '0', '2020-06-11 15:52:27', '2020-06-19 08:17:24', NULL, 'harina-garbanzo', 12000, '500 mg', 0, '013', NULL, NULL, NULL, NULL, NULL, NULL, 33, 13, 0),
(421, 'Fenogreco Molido', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Fenogreco Molido de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/BXI4UXnhMgGK7huxiXK1.jpg\",\"products\\/June2020\\/y1Ny9YK4YU1T5nhih1BH.jpg\"]', 50, '0', '2020-06-11 15:55:36', '2020-06-18 10:33:18', NULL, 'fenogreco-molido', 12000, '500 mg', 0, '014', NULL, NULL, NULL, NULL, NULL, NULL, 33, 14, 0),
(422, 'Harina De Trigo', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Trigo de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/JW5zxvkyGNHeI5HTLO1L.jpg\",\"products\\/June2020\\/TOkuZbBwSIHb4VA01Wbi.jpg\"]', 50, '0', '2020-06-11 15:57:37', '2020-06-18 10:32:09', NULL, 'harina-de-trigo', 12000, '500 mg', 0, '015', NULL, NULL, NULL, NULL, NULL, NULL, 33, 15, 0),
(423, 'Harina De Platano', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Platano de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/kHl93suSr5MM5t6a7Qpi.jpg\",\"products\\/June2020\\/YTr1hOdOopuORXo11nm9.jpg\"]', 50, '0', '2020-06-11 16:04:20', '2020-06-18 10:31:25', NULL, 'harina-de-platano', 12000, '500 mg', 0, '016', NULL, NULL, NULL, NULL, NULL, NULL, 33, 16, 0),
(424, 'Harina De Lentejas', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Lentejas de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/BuNTxGJFdJJCzeqQTWDh.jpg\",\"products\\/June2020\\/tarrnYJDPV4ezfjvlaXz.jpg\"]', 50, '0', '2020-06-11 16:06:14', '2020-06-18 10:30:45', NULL, 'harina-de-lentejas', 12000, '500 mg', 0, '017', NULL, NULL, NULL, NULL, NULL, NULL, 33, 17, 0),
(425, 'Harina De Gluten', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Gluten de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/w7sYUC75tRiIKeggIcgy.jpg\",\"products\\/June2020\\/J0PNd9a5HPb39RWMl0ZF.jpg\"]', 50, '0', '2020-06-11 16:08:37', '2020-06-18 10:29:37', NULL, 'harina-de-gluten', 12000, '500 mg', 0, '018', NULL, NULL, NULL, NULL, NULL, NULL, 33, 18, 0),
(426, 'Harina  De Cevada', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Cevada de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/I0kD2EBqKc4cE0bnIRL1.png\",\"products\\/June2020\\/qkJxXEeXuuN5x0oSd3dE.jpg\"]', 50, '0', '2020-06-11 16:10:46', '2020-06-18 10:28:50', NULL, 'harina-cevada', 12000, '500 mg', 0, '019', NULL, NULL, NULL, NULL, NULL, NULL, 33, 19, 0),
(427, 'Harina De Arroz', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Arroz de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/619FtHEh4Pz3kSRbA1oK.jpg\",\"products\\/June2020\\/GjvIJIU8RfZeraEGQJFU.jpg\"]', 50, '0', '2020-06-11 16:14:32', '2020-06-18 10:27:29', NULL, 'harina-de-arroz', 12000, '500 mg', 0, '020', NULL, NULL, NULL, NULL, NULL, NULL, 33, 20, 0),
(428, 'Harina De Amaranto', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Amaranto de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/N9hBV74wmwCAj8X03bQm.jpg\",\"products\\/June2020\\/iL8N0QHQIZJ1rWkMHANA.jpg\"]', 50, '0', '2020-06-11 16:16:35', '2020-06-18 10:25:07', NULL, 'harina-de-amaranto', 12000, '500 mg', 0, '021', NULL, NULL, NULL, NULL, NULL, NULL, 33, 21, 0),
(429, 'Harina Alpiste', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Alpiste de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/quwgSyVjTFBINZTiEki5.jpg\",\"products\\/June2020\\/LRuMgZqHW1o3OhYEMtUq.jpg\"]', 50, '0', '2020-06-11 16:18:32', '2020-06-18 10:24:18', NULL, 'harina-alpiste', 12000, '500 mg', 0, '022', NULL, NULL, NULL, NULL, NULL, NULL, 33, 22, 0),
(430, 'Harina De Algarrobo', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Algarrobo de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/VyR8IGl4IE17XUJIY9Es.jpg\",\"products\\/June2020\\/Ahj1bxDn2SPwuSMHNKfa.jpg\"]', 50, '0', '2020-06-11 16:23:25', '2020-06-18 10:21:56', NULL, 'harina-algarrobo', 12000, '500 mg', 0, '023', NULL, NULL, NULL, NULL, NULL, NULL, 33, 23, 0),
(431, 'Harina De Arverja', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Harina de Arverja de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/VXiyQJOCa3MPdwEF6nOP.jpg\",\"products\\/June2020\\/VkBVmZItZPNE61OBveYZ.jpg\"]', 50, '0', '2020-06-11 16:27:12', '2020-06-19 09:49:12', NULL, 'harina-de-arverja', 12000, '500 mg', 5000, '024', NULL, NULL, NULL, NULL, NULL, NULL, 33, 24, 1),
(432, 'Germen De Trigo', '<p><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\">Germen de Trigo de&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-family: Roboto; font-size: 16px;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">buena calidad y textura&nbsp;</span></span></span></span></span></span></span></span></span></p>', '[\"products\\/June2020\\/CdCRZIb3EvTW62fZxY9A.jpg\",\"products\\/June2020\\/iet3PzzfPs1xdv9DvSwt.jpg\"]', 50, '0', '2020-06-11 16:33:48', '2020-06-11 16:35:08', NULL, 'germen-de-trigo', 12000, '500 mg', 0, '025', NULL, NULL, NULL, NULL, NULL, NULL, 33, 25, 0),
(433, 'Oregano Importado', '<p class=\"MsoNormal\">&nbsp;</p>\r\n<p class=\"MsoNormal\"><span style=\"font-size: 10.5pt; line-height: 107%; font-family: \'Verdana\',sans-serif; color: #444444; background: white; mso-ansi-language: ES-CO;\">Or&eacute;gano Importado de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/zcHXzc7Ohw0UT9EneqtD.jpg\",\"products\\/June2020\\/rcTQYSxyzqg4GpAQiOUO.jpg\"]', 50, '0', '2020-06-11 16:41:31', '2020-06-11 16:52:28', NULL, 'oregano-importado', 12000, '500 mg', 0, '026', NULL, NULL, NULL, NULL, NULL, NULL, 31, 26, 0),
(434, 'Nuez Pecan', '<p>Los mejores frutos secos para complementar la dieta</p>', '[\"products\\/June2020\\/VJTgwT2eRpMp3Q0CT55a.jpg\",\"products\\/June2020\\/LSaEyVCG2WTWtojHEo08.jpg\"]', 50, '0', '2020-06-11 17:14:30', '2020-06-18 10:10:47', NULL, 'nuez-pecan', 12000, '500 mg', 0, '027', NULL, NULL, NULL, NULL, NULL, NULL, 28, 27, 0),
(435, 'Quinua Pepa', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Semillas de Qinua en pepa de textura y fragancia unica</span></p>', '[\"products\\/June2020\\/u2SjBCzNuU8ZmerLkxug.jpg\",\"products\\/June2020\\/B1OcOh3HMjYZV0UqUNkj.jpg\"]', 50, '0', '2020-06-12 08:05:29', '2020-06-12 08:07:07', NULL, 'quinua-pepa', 12000, '500 mg', 0, '028', NULL, NULL, NULL, NULL, NULL, NULL, 32, 28, 0),
(436, 'Semillas De Calabaza', '<p><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Semillas de&nbsp;&nbsp;De Calabaza&nbsp;de textura y fragancia unica</span></span></p>', '[\"products\\/June2020\\/ytDPiD5K1trNZqLqJZiD.jpg\",\"products\\/June2020\\/IAuJQVBsBngNTMPEL3mO.jpg\"]', 50, '0', '2020-06-12 08:10:44', '2020-06-12 08:11:28', NULL, 'semillas-de-calabaza', 12000, '500 mg', 0, '029', NULL, NULL, NULL, NULL, NULL, NULL, 32, 29, 0),
(437, 'Ricostilla Molida', '<p><span style=\"font-family: Verdana, sans-serif;\">Ricostilla Molida</span><span style=\"font-family: Verdana, sans-serif;\">&nbsp;de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/5P7lpQhA4ztEiw0dC2yw.jpg\",\"products\\/June2020\\/mIhtB5F5NQ93wSBA9k4D.jpg\"]', 50, '0', '2020-06-12 08:14:49', '2020-06-12 08:15:44', NULL, 'ricostilla-molida', 12000, '500 mg', 0, '030', NULL, NULL, NULL, NULL, NULL, NULL, 31, 30, 0),
(438, 'Pistachos', '<p><span style=\"color: #232323; font-family: Verdana, sans-serif; font-size: 16px;\">Pistachos fruto seco de buena calidad</span></p>', '[\"products\\/June2020\\/Wi8lZkltervUVTjpHxvf.jpg\",\"products\\/June2020\\/neXwpMRxMpbvuzBWN7wU.jpg\"]', 50, '0', '2020-06-12 08:19:49', '2020-06-18 13:03:15', NULL, 'pistachos', 12000, '500 mg', 0, '031', NULL, NULL, NULL, NULL, NULL, NULL, 28, 31, 0),
(439, 'Linaza Dorada en Pepa', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Semillas de&nbsp; Linaza Dora de textura y fragancia unica</span></p>', '[\"products\\/June2020\\/0hMxLJQYYaLd0pegIujS.jpg\",\"products\\/June2020\\/d4i8C2GgvgowrBQtPXpk.jpg\"]', 50, '0', '2020-06-12 08:32:38', '2020-06-12 08:34:40', NULL, 'linaza-dorada-en-pepa', 12000, '500 mg', 0, '032', NULL, NULL, NULL, NULL, NULL, NULL, 32, 32, 0),
(440, 'Semilla de Chia', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Semillas de Chia de textura y fragancia unica</span></p>', '[\"products\\/June2020\\/gZe97A9jOa8NvyqXCtWT.jpg\",\"products\\/June2020\\/36BkKyYPpBGZ91YrxqXX.jpg\"]', 50, '0', '2020-06-12 08:40:44', '2020-06-12 08:41:08', NULL, 'semilla-de-chia', 12000, '500 mg', 0, '033', NULL, NULL, NULL, NULL, NULL, NULL, 32, 33, 0),
(441, 'Jengibre Molido', '<p><span style=\"font-family: Verdana, sans-serif;\">&nbsp;</span><span style=\"font-family: Verdana, sans-serif;\">Jengibre Molido&nbsp;</span><span style=\"font-family: Verdana, sans-serif;\">de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/busazWI4s4RGbcNBWDWD.jpg\",\"products\\/June2020\\/5UaMQi2n8PQ62zM9Gv2W.jpg\"]', 50, '0', '2020-06-12 08:46:13', '2020-06-12 08:47:08', NULL, 'jengibre-molido', 12000, '500 mg', 0, '034', NULL, NULL, NULL, NULL, NULL, NULL, 31, 34, 0),
(442, 'Maggi', '<p><span style=\"box-sizing: border-box; color: #232323; font-size: 16px; font-family: Verdana, sans-serif;\">&nbsp;Maggi</span><span style=\"box-sizing: border-box; color: #232323; font-size: 16px; font-family: Verdana, sans-serif;\">&nbsp;</span><span style=\"box-sizing: border-box; color: #232323; font-size: 16px; font-family: Verdana, sans-serif;\">de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/9cU2nLIOZkGWT3S9IHFi.jpg\",\"products\\/June2020\\/JB33kBDSr1Y79jbiW1Ts.jpg\"]', 50, '0', '2020-06-12 08:51:16', '2020-06-12 08:53:02', NULL, 'maggi', 12000, '500 mg', 0, '035', NULL, NULL, NULL, NULL, NULL, NULL, 31, 35, 0),
(443, 'Mani Picante', '<p>Man&iacute; Picante&nbsp;</p>', '[\"products\\/June2020\\/jm0UllaV1v8U6MsU6YxK.jpg\",\"products\\/June2020\\/EHqec1jJPqbLXnMsNqKt.jpg\"]', 50, '0', '2020-06-12 09:11:07', '2020-06-12 09:12:29', NULL, 'mani-picante', 12000, '500 mg', 0, '036', NULL, NULL, NULL, NULL, NULL, NULL, 28, 36, 0),
(444, 'Maní Sal', '<p>Man&iacute; Sal&nbsp;</p>', '[\"products\\/June2020\\/7hfmFBN7E2Hv3W8c270n.jpg\",\"products\\/June2020\\/aHCveDK2RpXOJNRprcgp.jpg\"]', 50, '0', '2020-06-12 09:15:17', '2020-06-12 09:15:42', NULL, 'mani-sal', 12000, '500 mg', 0, '037', NULL, NULL, NULL, NULL, NULL, NULL, 28, 37, 0),
(445, 'Maní Dulce', '<p>Man&iacute; Dulce</p>', '[\"products\\/June2020\\/TcNWzkao1mfLnXOxU5eI.jpg\",\"products\\/June2020\\/XmsVV2pd6VwngvzuNsrm.jpg\"]', 50, '1', '2020-06-12 09:37:58', '2020-06-15 18:35:35', NULL, 'mani-dulce', 12000, '500 mg', 0, '038', NULL, NULL, NULL, NULL, NULL, NULL, 28, 38, 0),
(446, 'Maní Natural', '<p>Man&iacute; Natural&nbsp;</p>', '[\"products\\/June2020\\/zDgrHQhRdPXa6eEZfL9s.jpg\",\"products\\/June2020\\/fqiTdOzYznOx9mCmtk01.jpg\"]', 50, '0', '2020-06-12 09:41:10', '2020-06-12 09:41:41', NULL, 'mani-natural', 12000, '500 mg', 0, '039', NULL, NULL, NULL, NULL, NULL, NULL, 28, 39, 0),
(447, 'Nuez Del  Brasil Partida', '<p>Nuez Brasil Partida</p>', '[\"products\\/June2020\\/raed12CUP3gTmEqj4mFm.jpg\",\"products\\/June2020\\/qO3K56W7MHh27zpd07PM.jpg\"]', 50, '0', '2020-06-12 09:54:21', '2020-06-18 15:24:18', NULL, 'nuez-brasil-partida', 12000, '500 mg', 0, '040', NULL, NULL, NULL, NULL, NULL, NULL, 28, 40, 0),
(448, 'Almendras', '<p>Almendras&nbsp;</p>', '[\"products\\/June2020\\/sS6tvALl8bolIaoWsRZ9.jpg\",\"products\\/June2020\\/jGy3Oy6TNd9ZY7nkOVKl.jpg\"]', 50, '0', '2020-06-12 09:58:34', '2020-06-12 09:59:35', NULL, 'almendras', 12000, '500 mg', 0, '041', NULL, NULL, NULL, NULL, NULL, NULL, 28, 41, 0),
(449, 'Ajo Sal', '<p><span style=\"box-sizing: border-box; color: #232323; font-size: 16px; font-family: Verdana, sans-serif;\">Ajo Sal de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/vkm1epzE15eZKYoGpf5U.jpg\",\"products\\/June2020\\/OjIVoo49hgwNRArh7y4O.jpg\"]', 50, '0', '2020-06-12 10:01:46', '2020-06-12 10:02:27', NULL, 'ajo-sal', 12000, '500 mg', 0, '042', NULL, NULL, NULL, NULL, NULL, NULL, 31, 42, 0),
(450, 'Amaranto Pepa', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Semillas de Amaranto en pepa&nbsp; de textura y fragancia unica</span></p>', '[\"products\\/June2020\\/UTJvcQs3tjZPaVCYYmUi.jpg\",\"products\\/June2020\\/ZjdAewd7Ecii0v3vj3Rk.jpg\"]', 50, '0', '2020-06-12 10:07:07', '2020-06-12 10:08:22', NULL, 'amaranto-pepa', 12000, '500 mg', 0, '043', NULL, NULL, NULL, NULL, NULL, NULL, 32, 43, 0),
(451, 'Cacahuate Tostado', '<p>Cacahuate</p>', '[\"products\\/June2020\\/vFOTD2hQf2Dpf9UTU1sY.jpg\",\"products\\/June2020\\/UpgqrR9kgYLRAyvEm6rt.jpg\"]', 50, '0', '2020-06-12 10:10:56', '2020-06-18 15:26:39', NULL, 'cacahuate', 12000, '500 mg', 0, '044', NULL, NULL, NULL, NULL, NULL, NULL, 28, 44, 0),
(452, 'Curcuma', '<p><span style=\"color: #232323; font-family: Verdana, sans-serif;\"><span style=\"font-size: 16px;\">Curcuma</span></span><span style=\"color: #232323; font-family: Verdana, sans-serif; font-size: 16px;\">&nbsp;de excelente textura y fragancia&nbsp;</span></p>', '[\"products\\/June2020\\/cq2fQfELkdc441fq6RB9.jpg\",\"products\\/June2020\\/jWScyKTFR7oV6lusqyk0.jpg\"]', 50, '0', '2020-06-12 10:16:30', '2020-06-12 10:17:51', NULL, 'curcuma', 12000, '500 mg', 0, '045', NULL, NULL, NULL, NULL, NULL, NULL, 31, 45, 0),
(453, 'Ciruela Pasa', '<p class=\"MsoNormal\"><span style=\"font-size: 10.5pt; line-height: 107%; font-family: \'Verdana\',sans-serif; color: #444444; background: white;\">Ciruela Pasa fruto seco de buena calidad</span></p>', '[\"products\\/June2020\\/A17bSz4nwqBGwqBxmMgQ.jpg\",\"products\\/June2020\\/bz23d2tSWBFBmXz87nSn.jpg\"]', 50, '0', '2020-06-12 10:45:24', '2020-06-12 10:48:09', NULL, 'ciruela-pasa', 12000, '500 mg', 0, '046', NULL, NULL, NULL, NULL, NULL, NULL, 28, 46, 0),
(454, 'Datiles', '<p class=\"MsoNormal\"><span style=\"font-size: 10.5pt; line-height: 107%; font-family: \'Verdana\',sans-serif; color: #444444; background: white;\">Datiles fruto seco de buena calidad</span></p>', '[\"products\\/June2020\\/fg0mpqcFJOwUp6FbrJQO.jpg\",\"products\\/June2020\\/UhiIAejInURkB0Bk8boJ.jpg\"]', 50, '0', '2020-06-12 10:50:06', '2020-06-12 10:53:40', NULL, 'datiles', 12000, '500 mg', 0, '047', NULL, NULL, NULL, NULL, NULL, NULL, 28, 47, 0),
(455, 'Avena Hojuelas', '<p>Avena Hojuelas&nbsp;</p>', '[\"products\\/June2020\\/YDPQ8RRz5SXOuWo7JK4s.jpg\"]', 50, '0', '2020-06-12 10:58:48', '2020-06-12 11:01:29', NULL, 'avena-hojuelas', 12000, '500 mg', 0, '048', NULL, NULL, NULL, NULL, NULL, NULL, 28, 48, 0),
(456, 'Almidón De Yuca Agrio', '<p><span style=\"color: #232323; font-family: Roboto; font-size: 16px;\">Harina de&nbsp;</span><span style=\"color: #232323; font-family: Roboto;\"><span style=\"font-size: 16px;\">Almid&oacute;n De Yuca Agrio&nbsp;de buena calidad y textura</span></span></p>', '[\"products\\/June2020\\/sLdTBSQVzzZSfj2obJCS.jpg\",\"products\\/June2020\\/x6MUTKsVBlLqKhw1IY5P.jpg\"]', 50, '0', '2020-06-12 11:03:09', '2020-06-18 15:35:06', NULL, 'almidon', 12000, '500 mg', 0, '049', NULL, NULL, NULL, NULL, NULL, NULL, 33, 49, 0),
(457, 'Nuez Macadamia', '<p class=\"MsoNormal\"><span style=\"font-size: 10.5pt; line-height: 107%; font-family: \'Verdana\',sans-serif; color: #444444; background: white;\">Nuez Macadamia&nbsp; fruto seco de buena calidad</span></p>', '[\"products\\/June2020\\/VRpTBKG33HuuSR9LlpC3.jpg\",\"products\\/June2020\\/fIhDjL4XaaEnl3iciDHT.jpg\"]', 50, '0', '2020-06-12 11:09:12', '2020-06-12 11:10:43', NULL, 'nuez-macadamia', 12000, '500 mg', 0, '050', NULL, NULL, NULL, NULL, NULL, NULL, 28, 50, 0),
(458, 'Fresa Deshidratada', '<p>Fresa Deshidratada 100% calidad</p>', '[\"products\\/June2020\\/UDFBWpC3oDNcWjIHVRpP.jpg\",\"products\\/June2020\\/XjmODmQ2uvcR2WFFxATQ.jpg\"]', 50, '0', '2020-06-18 16:25:09', '2020-06-20 17:55:15', NULL, 'fresa-deshidratada', 12000, '500 mg', 0, '051', NULL, NULL, NULL, NULL, NULL, NULL, 29, 51, 0);

-- --------------------------------------------------------

--
-- Table structure for table `productsgroups`
--

CREATE TABLE `productsgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productsgroups`
--

INSERT INTO `productsgroups` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Spillproof Latica Orgánica', '2019-01-16 21:02:02', '2019-01-17 13:50:38', NULL),
(2, 'Segundo Default', '2019-01-16 21:20:11', '2019-01-16 21:20:11', NULL),
(3, 'Tercero Default', '2019-01-16 21:20:55', '2019-01-16 21:20:55', NULL),
(4, 'Cuarto grupo', '2019-01-17 00:32:24', '2019-01-17 00:32:24', NULL),
(5, 'Carscents Latica Orgánica', '2019-01-17 13:51:14', '2019-01-17 13:51:14', NULL),
(6, 'Spray Citrus Splash / Orange Squeeze', '2019-01-17 14:11:30', '2019-01-17 14:11:30', NULL),
(7, 'Eliminador de olores en gel', '2019-01-17 14:16:06', '2019-01-17 14:16:06', NULL),
(8, 'Spray Eliminador de Olores', '2019-01-17 14:19:15', '2019-01-17 14:19:15', NULL),
(9, 'Power Bloc', '2019-01-17 14:21:08', '2019-01-17 14:21:08', NULL),
(10, 'Aroma Stones', '2019-01-17 14:24:15', '2019-01-17 14:24:15', NULL),
(11, 'Cool gel', '2019-01-17 14:26:00', '2019-01-17 14:26:00', NULL),
(12, 'Xtreme Gel', '2019-01-17 14:27:13', '2019-01-17 14:27:13', NULL),
(13, 'Xtra Organic', '2019-01-17 14:54:14', '2019-01-17 14:54:14', NULL),
(14, 'Vent Clip', '2019-01-17 14:54:55', '2019-01-17 14:54:55', NULL),
(15, 'Limpiador para llantas y rines', '2019-01-17 15:00:17', '2019-01-17 15:00:23', NULL),
(16, 'Ceras limpiadoras', '2019-01-17 15:04:43', '2019-01-17 15:04:43', NULL),
(17, 'Limpiador y Acondicionador de Cuero', '2019-01-17 15:16:28', '2019-01-17 15:16:28', NULL),
(18, 'Restaurador de Cuero', '2019-01-17 15:18:07', '2019-01-17 15:18:07', NULL),
(19, 'Limpiador de Alfombras', '2019-01-17 15:18:49', '2019-01-17 15:18:49', NULL),
(21, 'Shampoo con Cera', '2019-01-17 15:21:07', '2019-01-17 15:21:07', NULL),
(22, 'Siliconas Perfumadas', '2019-01-17 15:22:21', '2019-01-17 15:22:21', NULL),
(23, 'Cera', '2019-01-17 15:23:46', '2019-01-17 15:23:46', NULL),
(24, 'Lubricante mulitusos', '2019-01-17 15:33:37', '2019-01-17 15:33:37', NULL),
(25, 'Línea Bike', '2019-01-17 15:35:45', '2019-01-17 15:35:45', NULL),
(26, 'Aceites especiales', '2019-01-17 15:44:33', '2019-01-17 15:44:33', NULL),
(27, 'Despinchador de Llantas 12 oz', '2019-01-17 15:49:39', '2019-01-17 15:49:39', NULL),
(28, 'Despinchador de Llantas 16 oz', '2019-01-17 15:50:37', '2019-01-17 15:50:37', NULL),
(29, 'Sellador de llantas para todo tipo de carros', '2019-01-17 16:04:32', '2019-01-17 16:04:32', NULL),
(30, 'Sellador de llantas para bicicletas y motos', '2019-01-17 16:05:20', '2019-01-17 16:05:20', NULL),
(31, 'Inflador Multipropósito', '2019-01-17 16:05:50', '2019-01-17 16:06:28', NULL),
(32, 'Smart Shine', '2019-01-17 16:09:50', '2019-01-17 16:09:50', NULL),
(33, 'Guantes de Microfibra', '2019-01-17 16:10:26', '2019-01-17 16:10:26', NULL),
(34, 'Paños de microfibra', '2019-01-17 16:11:21', '2019-01-17 16:11:21', NULL),
(35, 'Pilas', '2019-01-17 16:23:57', '2019-01-17 16:23:57', NULL),
(36, 'Linternas', '2019-01-17 16:24:52', '2019-01-17 16:24:52', NULL),
(37, 'Little Trees', '2019-01-17 16:36:25', '2019-01-17 16:36:34', NULL),
(38, 'Vent Wrap', '2019-01-17 17:07:05', '2019-01-17 17:07:05', NULL),
(39, 'Pump Spray', '2019-01-17 17:26:51', '2019-01-17 17:26:51', NULL),
(40, 'Fresh Link', '2019-01-17 17:34:03', '2019-01-17 17:34:03', NULL),
(41, 'In a Can Aerosol', '2019-01-17 17:43:38', '2019-01-17 17:43:38', NULL),
(42, 'Fiber Can', '2019-01-17 17:53:16', '2019-01-17 17:53:16', NULL),
(43, 'Ambientadores Little Bottle', '2019-01-17 20:45:14', '2019-01-17 20:45:14', NULL),
(44, 'Vent Clip 1 pak', '2019-01-17 20:57:24', '2019-01-17 20:57:24', NULL),
(45, 'Vent Clip 2 pak', '2019-01-18 13:50:56', '2019-01-18 13:50:56', NULL),
(46, 'Ambientador para colgar', '2019-01-18 15:05:35', '2019-01-18 15:05:35', NULL),
(47, 'Varitas 18 ml', '2019-01-18 15:26:39', '2019-01-18 15:26:39', NULL),
(48, 'Pilas recargables', '2019-01-18 16:04:43', '2019-01-18 16:04:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_flavors`
--

CREATE TABLE `products_flavors` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `flavor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_flavors`
--

INSERT INTO `products_flavors` (`id`, `product_id`, `flavor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 251, 1, NULL, NULL, NULL),
(2, 251, 2, NULL, NULL, NULL),
(3, 251, 3, NULL, NULL, NULL),
(4, 251, 4, NULL, NULL, NULL),
(8, 249, 5, NULL, NULL, NULL),
(9, 252, 8, NULL, NULL, NULL),
(11, 254, 9, NULL, NULL, NULL),
(12, 255, 10, NULL, NULL, NULL),
(13, 256, 9, NULL, NULL, NULL),
(14, 257, 1, NULL, NULL, NULL),
(15, 258, 9, NULL, NULL, NULL),
(17, 261, 1, NULL, NULL, NULL),
(19, 263, 8, NULL, NULL, NULL),
(20, 262, 12, NULL, NULL, NULL),
(21, 260, 1, NULL, NULL, NULL),
(22, 266, 1, NULL, NULL, NULL),
(25, 271, 14, NULL, NULL, NULL),
(26, 272, 1, NULL, NULL, NULL),
(27, 273, 11, NULL, NULL, NULL),
(28, 274, 1, NULL, NULL, NULL),
(29, 275, 1, NULL, NULL, NULL),
(31, 277, 1, NULL, NULL, NULL),
(32, 277, 2, NULL, NULL, NULL),
(33, 278, 15, NULL, NULL, NULL),
(34, 279, 15, NULL, NULL, NULL),
(35, 267, 8, NULL, NULL, NULL),
(36, 268, 15, NULL, NULL, NULL),
(37, 269, 16, NULL, NULL, NULL),
(38, 270, 9, NULL, NULL, NULL),
(39, 280, 1, NULL, NULL, NULL),
(40, 281, 1, NULL, NULL, NULL),
(41, 282, 1, NULL, NULL, NULL),
(42, 282, 2, NULL, NULL, NULL),
(43, 283, 1, NULL, NULL, NULL),
(44, 284, 1, NULL, NULL, NULL),
(45, 285, 1, NULL, NULL, NULL),
(46, 286, 1, NULL, NULL, NULL),
(47, 286, 2, NULL, NULL, NULL),
(48, 288, 1, NULL, NULL, NULL),
(49, 289, 1, NULL, NULL, NULL),
(50, 290, 2, NULL, NULL, NULL),
(51, 291, 2, NULL, NULL, NULL),
(52, 292, 11, NULL, NULL, NULL),
(53, 295, 11, NULL, NULL, NULL),
(55, 287, 8, NULL, NULL, NULL),
(56, 298, 1, NULL, NULL, NULL),
(57, 299, 1, NULL, NULL, NULL),
(58, 300, 1, NULL, NULL, NULL),
(59, 301, 1, NULL, NULL, NULL),
(60, 302, 1, NULL, NULL, NULL),
(61, 303, 1, NULL, NULL, NULL),
(62, 304, 1, NULL, NULL, NULL),
(64, 308, 1, NULL, NULL, NULL),
(65, 309, 1, NULL, NULL, NULL),
(66, 310, 1, NULL, NULL, NULL),
(67, 311, 1, NULL, NULL, NULL),
(68, 305, 17, NULL, NULL, NULL),
(69, 313, 17, NULL, NULL, NULL),
(70, 306, 9, NULL, NULL, NULL),
(74, 317, 2, NULL, NULL, NULL),
(75, 318, 11, NULL, NULL, NULL),
(79, 323, 1, NULL, NULL, NULL),
(80, 320, 10, NULL, NULL, NULL),
(81, 324, 1, NULL, NULL, NULL),
(82, 325, 10, NULL, NULL, NULL),
(83, 321, 10, NULL, NULL, NULL),
(84, 327, 10, NULL, NULL, NULL),
(85, 322, 10, NULL, NULL, NULL),
(86, 328, 1, NULL, NULL, NULL),
(87, 329, 1, NULL, NULL, NULL),
(88, 330, 10, NULL, NULL, NULL),
(89, 331, 1, NULL, NULL, NULL),
(90, 332, 1, NULL, NULL, NULL),
(91, 333, 1, NULL, NULL, NULL),
(93, 335, 1, NULL, NULL, NULL),
(94, 336, 11, NULL, NULL, NULL),
(95, 340, 11, NULL, NULL, NULL),
(96, 341, 11, NULL, NULL, NULL),
(97, 342, 19, NULL, NULL, NULL),
(98, 343, 1, NULL, NULL, NULL),
(99, 344, 2, NULL, NULL, NULL),
(100, 334, 20, NULL, NULL, NULL),
(101, 339, 8, NULL, NULL, NULL),
(102, 345, 10, NULL, NULL, NULL),
(103, 346, 11, NULL, NULL, NULL),
(105, 348, 11, NULL, NULL, NULL),
(107, 350, 1, NULL, NULL, NULL),
(108, 355, 1, NULL, NULL, NULL),
(109, 356, 1, NULL, NULL, NULL),
(110, 357, 2, NULL, NULL, NULL),
(111, 358, 1, NULL, NULL, NULL),
(112, 362, 11, NULL, NULL, NULL),
(113, 347, 21, NULL, NULL, NULL),
(114, 349, 22, NULL, NULL, NULL),
(115, 351, 9, NULL, NULL, NULL),
(116, 352, 9, NULL, NULL, NULL),
(117, 353, 23, NULL, NULL, NULL),
(118, 354, 9, NULL, NULL, NULL),
(119, 359, 9, NULL, NULL, NULL),
(120, 360, 9, NULL, NULL, NULL),
(121, 361, 9, NULL, NULL, NULL),
(122, 363, 9, NULL, NULL, NULL),
(123, 364, 9, NULL, NULL, NULL),
(124, 365, 2, NULL, NULL, NULL),
(128, 366, 1, NULL, NULL, NULL),
(129, 367, 2, NULL, NULL, NULL),
(133, 370, 10, NULL, NULL, NULL),
(134, 371, 1, NULL, NULL, NULL),
(135, 372, 29, NULL, NULL, NULL),
(136, 375, 10, NULL, NULL, NULL),
(137, 375, 30, NULL, NULL, NULL),
(138, 382, 32, NULL, NULL, NULL),
(139, 383, 33, NULL, NULL, NULL),
(140, 387, 34, NULL, NULL, NULL),
(141, 308, 2, NULL, NULL, NULL),
(143, 389, 3, NULL, NULL, NULL),
(145, 389, 27, NULL, NULL, NULL),
(148, 389, 36, NULL, NULL, NULL),
(149, 253, 2, NULL, NULL, NULL),
(152, 316, 38, NULL, NULL, NULL),
(153, 355, 39, NULL, NULL, NULL),
(154, 259, 30, NULL, NULL, NULL),
(155, 259, 40, NULL, NULL, NULL),
(156, 314, 10, NULL, NULL, NULL),
(157, 307, 10, NULL, NULL, NULL),
(158, 390, 1, NULL, NULL, NULL),
(159, 391, 1, NULL, NULL, NULL),
(160, 392, 1, NULL, NULL, NULL),
(161, 273, 41, NULL, NULL, NULL),
(162, 276, 1, NULL, NULL, NULL),
(163, 275, 15, NULL, NULL, NULL),
(164, 395, 1, NULL, NULL, NULL),
(165, 397, 42, NULL, NULL, NULL),
(166, 397, 43, NULL, NULL, NULL),
(167, 397, 44, NULL, NULL, NULL),
(168, 398, 42, NULL, NULL, NULL),
(169, 398, 43, NULL, NULL, NULL),
(170, 398, 44, NULL, NULL, NULL),
(171, 399, 42, NULL, NULL, NULL),
(172, 399, 43, NULL, NULL, NULL),
(173, 399, 44, NULL, NULL, NULL),
(174, 400, 42, NULL, NULL, NULL),
(175, 401, 42, NULL, NULL, NULL),
(176, 402, 42, NULL, NULL, NULL),
(177, 396, 42, NULL, NULL, NULL),
(178, 396, 43, NULL, NULL, NULL),
(179, 403, 42, NULL, NULL, NULL),
(180, 404, 42, NULL, NULL, NULL),
(181, 405, 43, NULL, NULL, NULL),
(182, 406, 43, NULL, NULL, NULL),
(183, 407, 42, NULL, NULL, NULL),
(184, 408, 42, NULL, NULL, NULL),
(185, 409, 42, NULL, NULL, NULL),
(186, 410, 42, NULL, NULL, NULL),
(187, 411, 42, NULL, NULL, NULL),
(188, 412, 42, NULL, NULL, NULL),
(189, 413, 42, NULL, NULL, NULL),
(190, 414, 42, NULL, NULL, NULL),
(191, 415, 42, NULL, NULL, NULL),
(192, 416, 42, NULL, NULL, NULL),
(193, 417, 42, NULL, NULL, NULL),
(194, 418, 42, NULL, NULL, NULL),
(195, 419, 42, NULL, NULL, NULL),
(196, 420, 42, NULL, NULL, NULL),
(197, 421, 42, NULL, NULL, NULL),
(198, 422, 42, NULL, NULL, NULL),
(199, 423, 42, NULL, NULL, NULL),
(200, 424, 42, NULL, NULL, NULL),
(201, 425, 42, NULL, NULL, NULL),
(202, 426, 42, NULL, NULL, NULL),
(203, 427, 42, NULL, NULL, NULL),
(204, 428, 42, NULL, NULL, NULL),
(205, 429, 42, NULL, NULL, NULL),
(206, 430, 42, NULL, NULL, NULL),
(207, 431, 42, NULL, NULL, NULL),
(208, 432, 42, NULL, NULL, NULL),
(209, 433, 42, NULL, NULL, NULL),
(210, 434, 42, NULL, NULL, NULL),
(211, 435, 42, NULL, NULL, NULL),
(212, 436, 42, NULL, NULL, NULL),
(213, 437, 42, NULL, NULL, NULL),
(214, 438, 42, NULL, NULL, NULL),
(215, 439, 42, NULL, NULL, NULL),
(216, 440, 42, NULL, NULL, NULL),
(217, 441, 42, NULL, NULL, NULL),
(218, 442, 42, NULL, NULL, NULL),
(219, 443, 42, NULL, NULL, NULL),
(220, 444, 42, NULL, NULL, NULL),
(221, 445, 42, NULL, NULL, NULL),
(222, 446, 42, NULL, NULL, NULL),
(223, 447, 42, NULL, NULL, NULL),
(224, 448, 42, NULL, NULL, NULL),
(225, 449, 42, NULL, NULL, NULL),
(226, 450, 42, NULL, NULL, NULL),
(227, 451, 42, NULL, NULL, NULL),
(228, 452, 42, NULL, NULL, NULL),
(229, 405, 42, NULL, NULL, NULL),
(230, 453, 42, NULL, NULL, NULL),
(231, 454, 42, NULL, NULL, NULL),
(232, 455, 42, NULL, NULL, NULL),
(233, 456, 42, NULL, NULL, NULL),
(234, 457, 42, NULL, NULL, NULL),
(235, 404, 43, NULL, NULL, NULL),
(236, 404, 44, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_presentacion_pivote`
--

CREATE TABLE `product_presentacion_pivote` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `presentacione_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_presentacion_pivote`
--

INSERT INTO `product_presentacion_pivote` (`id`, `product_id`, `presentacione_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 396, 1, NULL, NULL, NULL),
(2, 396, 2, NULL, NULL, NULL),
(3, 396, 3, NULL, NULL, NULL),
(4, 397, 1, NULL, NULL, NULL),
(5, 397, 2, NULL, NULL, NULL),
(6, 458, 1, NULL, NULL, NULL),
(7, 458, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-01-11 15:38:04', '2019-01-11 15:38:04'),
(2, 'user', 'Normal User', '2019-01-11 15:38:04', '2019-01-11 15:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'La casa de los condimentos secos', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Venta de suplementos', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/March2019/6rkKYmwTK4JKIaKP71au.jpg', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Administración', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bienvenidos al portal de administración', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(11, 'site.contact', 'Donde se envían los mails de contacto', 'info@designingsolutions.com.co', NULL, 'text', 6, 'Site'),
(12, 'site.barra_superior', 'Barra Superior', 'Tenemos Pago Contra Entrega Para Bogota', NULL, 'text', 7, 'Site'),
(13, 'site.banner_home', 'Banner Home', 'settings/April2019/lelfkrSO1GBGJfkJTVB8.png', NULL, 'image', 9, 'Site'),
(14, 'site.url.descuento', 'url de descuento', 'https://www.google.com.co/', NULL, 'text', 8, 'Site'),
(15, 'site.insta_widget', 'Instagram Widget', 'https://www.instagram.com/p/BxsgunSB66v/', NULL, 'text', 10, 'Site'),
(16, 'site.default_image', 'Imagén Default para productos', 'settings/May2019/ng3zadWZzqd59evg1txL.png', NULL, 'image', 11, 'Site'),
(17, 'site.favicon', 'Favicon', 'settings/June2020/FJam8naWbR11QYRSh6CF.png', NULL, 'image', 12, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '1',
  `mobile` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`, `link`, `order`, `mobile`) VALUES
(7, 'sliders/May2020/KsihnNQwey4VbjUH381N.jpg', NULL, NULL, '2020-05-31 01:51:52', '2020-05-31 01:51:52', NULL, NULL, NULL, 0),
(8, 'sliders/June2020/v5s0X2T2ySgbAEHpz7T5.jpg', NULL, NULL, '2020-06-09 14:46:21', '2020-06-09 14:50:53', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suscriptions`
--

CREATE TABLE `suscriptions` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `suscriptions`
--

INSERT INTO `suscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'francogodoyalt@hotmail.com', '2019-05-25', '2019-05-25'),
(2, 'francogodoyal2t@hotmail.com', '2019-05-25', '2019-05-25'),
(3, 'francogod3oyal2t@hotmail.com', '2019-05-25', '2019-05-25'),
(4, 'asdas@asd.com', '2019-05-25', '2019-05-25'),
(5, 'a', '2019-05-25', '2019-05-25'),
(6, 'ad', '2019-05-25', '2019-05-25'),
(7, 'bad', '2019-05-25', '2019-05-25'),
(8, 'bada@asd.com', '2019-05-25', '2019-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-01-11 15:38:07', '2019-01-11 15:38:07'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-01-11 15:38:07', '2019-01-11 15:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardnumber` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardexpmonth` int(11) DEFAULT NULL,
  `cardexpyear` int(11) DEFAULT NULL,
  `cardcvv` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `activation_token` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `address`, `city`, `state`, `zip`, `country`, `phone`, `dni`, `cardname`, `cardnumber`, `cardexpmonth`, `cardexpyear`, `cardcvv`, `active`, `activation_token`) VALUES
(8, 2, 'German Martinez', 'germanfac1@gmail.com', 'users/default.png', NULL, '$2y$10$w.2adM49GsiUUuG8PR7LI.06QMzZnOwfAjoJutf3lhZQeA6kyQbr.', '8620R8TemoSxthHAPOr8X6XcnBFPw9MEYEU4PD33aolppi45KRfcjFzviYhN', NULL, '2019-02-20 13:22:23', '2019-02-20 13:22:23', 'carre 47 no 134 15', 'Bogota', 'Cundinamarca', '011571', NULL, '3143858926', '12', 'Carlos Andres Romero', '5306959463811064', 12, 2019, 302, 0, ''),
(51, 1, 'Carlos Andres Romero Ortiz', 'androme91@gmail.com', 'users/default.png', NULL, '$2y$10$c/I/Fhfhmy.F0DjqYtrncOnDzIBWprGobnAw/MCey74K/OcE..r76', 'Q5XlhkSG0Iz1yVbrIGskhvEvEvJHTge0FtlHWI8dvvB4GPT2sJytfT1ep79K', NULL, '2020-05-31 03:59:49', '2020-05-31 03:59:49', 'Calle 100 102-10', 'Bogota', NULL, NULL, NULL, '3204358842', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'NYUTC0kGar5Z3978tpjSOJPrmCfsX9JVno9v7Qa7WsHt2pWt6uKilUUifwVh'),
(52, 2, 'Carlos Romero', 'utam.cromero@gmail.com', 'users/default.png', NULL, '$2y$10$yMnIeuhDTWsgtHjd/cesJ.1VvjHDauNl.RwMSuiUCWNuDfyo0IlXC', NULL, NULL, '2020-06-01 00:52:40', '2020-06-01 00:52:40', 'calle 100 100', 'Bogota', NULL, NULL, NULL, '3211231232', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'hwb3chuWqaB7UdgfEoQ5zNbdIzbGTaTkR24KY4JTHiaB0DDOn5G5NJu1BLb1'),
(53, 2, 'Pedro Feras', 'segofyja@getnada.com', 'users/default.png', NULL, '$2y$10$AABPBUWlcaklT/JGsvbg.uL.W4PNLDVCnbCHof0eu8E7/QKHFGaC.', NULL, NULL, '2020-06-20 06:10:06', '2020-06-20 06:10:07', 'AV 43 ORIENTE', 'PUEBLA', NULL, NULL, NULL, '255555565', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'MlH7cAj9eDKPYjLVhuW5sHS3iACmfu53Z2x94w7u1HUy5pfOyBGAWJDEM9a6'),
(54, 2, 'Pedro Feras', 'dufedalo@getnada.com', 'users/default.png', NULL, '$2y$10$3qk3mcokCmLlRHBljqPB2O0IshDn8ITgAIpL4.Bnl.qjw/opq5OAa', NULL, NULL, '2020-06-20 06:10:53', '2020-06-20 06:10:53', 'AV 43 ORIENTE', 'PUEBLA', NULL, NULL, NULL, '255555565', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'VC0BUn5JYVWXT5rziyT1YE3lh86IhFf2GoRIJQY8mb76I8y0UNSYTm6VIKz2'),
(55, 2, 'CARLOS RIOS', 'comercial@desigingsolutions.com.co', 'users/default.png', NULL, '$2y$10$M17vPOb7PqYeXLi.TgGpj..WRwi6Uxl8k1SodrxBXjajnV5RDsPWa', NULL, NULL, '2020-06-20 21:30:50', '2020-06-20 21:30:50', 'Calle 56Bis No. 3A-43', 'BOGOTA', NULL, NULL, NULL, '3168776348', NULL, NULL, NULL, NULL, NULL, NULL, 0, '9sNtd9Gj6acp0iWo4ircUZnRIonq89ekaDR3V88WPetEVOIeZ54nYkFD5eej'),
(56, 2, 'Paola Vega', 'comercial@designingsolutions.com.co', 'users/default.png', NULL, '$2y$10$BfhdntylVFPFX3MLT0BSju4H34o7cAIMYIMcSM5VXGH.KxOvCPjta', NULL, NULL, '2020-06-20 21:40:17', '2020-06-20 22:09:47', 'Calle 56Bis No. 3A-43', 'BOGOTA', NULL, NULL, NULL, '3168776348', NULL, NULL, NULL, NULL, NULL, NULL, 0, '0Rdn4rryYmI50FiWGtsBaXZRZszJ2D2YYQciPkSufbf8usoSKEXpcO8lMhri'),
(57, 2, 'Alejandro Jimenez', 'safelings@gmail.com', 'users/default.png', NULL, '$2y$10$EAeQgZWxB.ZLSt160I8xI.lrPSs6jljuKqo4mGEo9Z76HYSDk3062', NULL, NULL, '2020-06-29 14:12:21', '2020-06-29 14:12:21', 'Carrera 57 No 134 15', 'Bogota', NULL, NULL, NULL, '3168637785', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'CxOa0c4axy9QlGoEZ14Ay8QwU3iarppZrNd6A0FhM9mSSJ6CYrlurkwBu2a2');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles_flavors`
--
ALTER TABLE `articles_flavors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brandscategories`
--
ALTER TABLE `brandscategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flavors`
--
ALTER TABLE `flavors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flavor_product_pivote`
--
ALTER TABLE `flavor_product_pivote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instagramfeeds`
--
ALTER TABLE `instagramfeeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kits_flavors`
--
ALTER TABLE `kits_flavors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loteries`
--
ALTER TABLE `loteries`
  ADD PRIMARY KEY (`col1`,`col2`,`col3`,`col4`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordersstates`
--
ALTER TABLE `ordersstates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `precios`
--
ALTER TABLE `precios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presentaciones`
--
ALTER TABLE `presentaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presentacion_precio_pivote`
--
ALTER TABLE `presentacion_precio_pivote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productsgroups`
--
ALTER TABLE `productsgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_flavors`
--
ALTER TABLE `products_flavors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_presentacion_pivote`
--
ALTER TABLE `product_presentacion_pivote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`),
  ADD KEY `role_user_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suscriptions`
--
ALTER TABLE `suscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articles_flavors`
--
ALTER TABLE `articles_flavors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `brandscategories`
--
ALTER TABLE `brandscategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flavors`
--
ALTER TABLE `flavors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `flavor_product_pivote`
--
ALTER TABLE `flavor_product_pivote`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `instagramfeeds`
--
ALTER TABLE `instagramfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kits`
--
ALTER TABLE `kits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kits_flavors`
--
ALTER TABLE `kits_flavors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `ordersstates`
--
ALTER TABLE `ordersstates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `precios`
--
ALTER TABLE `precios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `presentaciones`
--
ALTER TABLE `presentaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `presentacion_precio_pivote`
--
ALTER TABLE `presentacion_precio_pivote`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

--
-- AUTO_INCREMENT for table `productsgroups`
--
ALTER TABLE `productsgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `products_flavors`
--
ALTER TABLE `products_flavors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `product_presentacion_pivote`
--
ALTER TABLE `product_presentacion_pivote`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
