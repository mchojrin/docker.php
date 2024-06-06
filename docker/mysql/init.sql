-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 07-12-2023 a las 14:16:00
-- Versión del servidor: 5.7.42
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ruko`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_access_groups`
--

CREATE TABLE `app_access_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_ldap_default` tinyint(1) DEFAULT NULL,
  `ldap_filter` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_access_groups`
--

INSERT INTO `app_access_groups` (`id`, `name`, `is_default`, `is_ldap_default`, `ldap_filter`, `sort_order`, `notes`) VALUES
(4, 'Manager', 1, 0, '', 2, ''),
(5, 'Developer', 0, 0, '', 1, ''),
(6, 'Client', 0, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_access_rules`
--

CREATE TABLE `app_access_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL,
  `fields_id` int(10) UNSIGNED NOT NULL,
  `choices` text NOT NULL,
  `users_groups` text NOT NULL,
  `access_schema` text NOT NULL,
  `fields_view_only_access` text NOT NULL,
  `comments_access_schema` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_access_rules_fields`
--

CREATE TABLE `app_access_rules_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL,
  `fields_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_approved_items`
--

CREATE TABLE `app_approved_items` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `signature` text NOT NULL,
  `date_added` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_attachments`
--

CREATE TABLE `app_attachments` (
  `id` int(11) NOT NULL,
  `form_token` varchar(64) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` date NOT NULL,
  `container` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_backups`
--

CREATE TABLE `app_backups` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `is_auto` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(64) NOT NULL,
  `date_added` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_comments`
--

CREATE TABLE `app_comments` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `description` text NOT NULL,
  `attachments` text NOT NULL,
  `date_added` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_comments_access`
--

CREATE TABLE `app_comments_access` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `access_groups_id` int(11) NOT NULL,
  `access_schema` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_comments_access`
--

INSERT INTO `app_comments_access` (`id`, `entities_id`, `access_groups_id`, `access_schema`) VALUES
(4, 21, 6, 'view,create'),
(5, 21, 5, 'view,create'),
(6, 21, 4, 'view,create,update,delete'),
(7, 22, 5, 'view,create'),
(8, 22, 4, 'view,create,update,delete'),
(9, 23, 6, 'view,create'),
(10, 23, 4, 'view,create,update,delete'),
(11, 24, 5, 'view,create'),
(12, 24, 4, 'view,create,update,delete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_comments_forms_tabs`
--

CREATE TABLE `app_comments_forms_tabs` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_comments_history`
--

CREATE TABLE `app_comments_history` (
  `id` int(11) NOT NULL,
  `comments_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `fields_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_configuration`
--

CREATE TABLE `app_configuration` (
  `id` int(11) NOT NULL,
  `configuration_name` varchar(255) NOT NULL,
  `configuration_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_configuration`
--

INSERT INTO `app_configuration` (`id`, `configuration_name`, `configuration_value`) VALUES
(9, 'CFG_APP_NAME', 'r'),
(10, 'CFG_APP_SHORT_NAME', 'r'),
(11, 'CFG_APP_LOGO', ''),
(12, 'CFG_EMAIL_USE_NOTIFICATION', '1'),
(13, 'CFG_EMAIL_SUBJECT_LABEL', ''),
(14, 'CFG_EMAIL_AMOUNT_PREVIOUS_COMMENTS', '2'),
(15, 'CFG_EMAIL_COPY_SENDER', '0'),
(16, 'CFG_EMAIL_SEND_FROM_SINGLE', '0'),
(17, 'CFG_EMAIL_ADDRESS_FROM', 'noreply@noreply.com'),
(18, 'CFG_EMAIL_NAME_FROM', 'noreply'),
(19, 'CFG_EMAIL_USE_SMTP', '0'),
(20, 'CFG_EMAIL_SMTP_SERVER', ''),
(21, 'CFG_EMAIL_SMTP_PORT', ''),
(22, 'CFG_EMAIL_SMTP_ENCRYPTION', ''),
(23, 'CFG_EMAIL_SMTP_LOGIN', ''),
(24, 'CFG_EMAIL_SMTP_PASSWORD', ''),
(25, 'CFG_LDAP_USE', '0'),
(26, 'CFG_LDAP_SERVER_NAME', ''),
(27, 'CFG_LDAP_SERVER_PORT', ''),
(28, 'CFG_LDAP_BASE_DN', ''),
(29, 'CFG_LDAP_UID', ''),
(30, 'CFG_LDAP_USER', ''),
(31, 'CFG_LDAP_EMAIL_ATTRIBUTE', ''),
(32, 'CFG_LDAP_USER_DN', ''),
(33, 'CFG_LDAP_PASSWORD', ''),
(34, 'CFG_LOGIN_PAGE_HEADING', ''),
(35, 'CFG_LOGIN_PAGE_CONTENT', ''),
(36, 'CFG_APP_TIMEZONE', 'America/New_York'),
(37, 'CFG_APP_DATE_FORMAT', 'm/d/Y'),
(38, 'CFG_APP_DATETIME_FORMAT', 'm/d/Y H:i'),
(39, 'CFG_APP_ROWS_PER_PAGE', '10'),
(40, 'CFG_REGISTRATION_EMAIL_SUBJECT', ''),
(41, 'CFG_REGISTRATION_EMAIL_BODY', ''),
(42, 'CFG_PASSWORD_MIN_LENGTH', '5'),
(43, 'CFG_APP_LANGUAGE', 'english.php'),
(44, 'CFG_APP_SKIN', ''),
(45, 'CFG_PUBLIC_USER_PROFILE_FIELDS', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_custom_php`
--

CREATE TABLE `app_custom_php` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_folder` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` longtext NOT NULL,
  `notes` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_dashboard_pages`
--

CREATE TABLE `app_dashboard_pages` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `color` varchar(16) NOT NULL,
  `users_fields` text NOT NULL,
  `users_groups` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_dashboard_pages_sections`
--

CREATE TABLE `app_dashboard_pages_sections` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `grid` tinyint(1) NOT NULL,
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_emails_on_schedule`
--

CREATE TABLE `app_emails_on_schedule` (
  `id` int(11) NOT NULL,
  `date_added` bigint(20) UNSIGNED NOT NULL,
  `email_to` varchar(255) NOT NULL,
  `email_to_name` varchar(255) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `email_body` text NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `email_from_name` varchar(255) NOT NULL,
  `email_attachments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entities`
--

CREATE TABLE `app_entities` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `notes` text NOT NULL,
  `display_in_menu` tinyint(1) DEFAULT '0',
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_entities`
--

INSERT INTO `app_entities` (`id`, `parent_id`, `group_id`, `name`, `notes`, `display_in_menu`, `sort_order`) VALUES
(1, 0, 0, 'Users', '', 0, 10),
(21, 0, 0, 'Projects', '', 0, 1),
(22, 21, 0, 'Tasks', '', 0, 1),
(23, 21, 0, 'Tickets', '', 0, 2),
(24, 21, 0, 'Discussions', '', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entities_access`
--

CREATE TABLE `app_entities_access` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `access_groups_id` int(11) NOT NULL,
  `access_schema` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_entities_access`
--

INSERT INTO `app_entities_access` (`id`, `entities_id`, `access_groups_id`, `access_schema`) VALUES
(28, 21, 6, 'view_assigned'),
(29, 21, 5, 'view_assigned,reports'),
(30, 21, 4, 'view,create,update,delete,reports'),
(31, 22, 6, ''),
(32, 22, 5, 'view,create,update,reports'),
(33, 22, 4, 'view,create,update,delete,reports'),
(34, 23, 6, 'view_assigned,create,update,reports'),
(35, 23, 5, ''),
(36, 23, 4, 'view,create,update,delete,reports'),
(37, 24, 6, ''),
(38, 24, 5, 'view_assigned,create,update,delete,reports'),
(39, 24, 4, 'view,create,update,delete,reports');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entities_configuration`
--

CREATE TABLE `app_entities_configuration` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `configuration_name` varchar(255) NOT NULL,
  `configuration_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_entities_configuration`
--

INSERT INTO `app_entities_configuration` (`id`, `entities_id`, `configuration_name`, `configuration_value`) VALUES
(11, 1, 'menu_title', 'Users'),
(12, 1, 'listing_heading', 'Users'),
(13, 1, 'window_heading', 'User Info'),
(14, 1, 'insert_button', 'Add User'),
(15, 1, 'use_comments', '0'),
(25, 21, 'menu_title', ' Projects'),
(26, 21, 'listing_heading', ' Projects'),
(27, 21, 'window_heading', 'Project Info'),
(28, 21, 'insert_button', 'Add Project'),
(29, 21, 'email_subject_new_item', 'New Project:'),
(30, 21, 'use_comments', '1'),
(31, 21, 'email_subject_new_comment', 'New project comment:'),
(32, 22, 'menu_title', 'Tasks'),
(33, 22, 'listing_heading', 'Tasks'),
(34, 22, 'window_heading', 'Task Info'),
(35, 22, 'insert_button', 'Add Task'),
(36, 22, 'email_subject_new_item', 'New Task'),
(37, 22, 'use_comments', '1'),
(38, 22, 'email_subject_new_comment', 'New task comment:'),
(39, 23, 'menu_title', 'Tickets'),
(40, 23, 'listing_heading', 'Tickets'),
(41, 23, 'window_heading', 'Ticket Info'),
(42, 23, 'insert_button', 'Add Ticket'),
(43, 23, 'email_subject_new_item', 'New Ticket:'),
(44, 23, 'use_comments', '1'),
(45, 23, 'email_subject_new_comment', 'New ticket comment'),
(46, 24, 'menu_title', 'Discussions'),
(47, 24, 'listing_heading', 'Discussions'),
(48, 24, 'window_heading', 'Discussion Info'),
(49, 24, 'insert_button', 'Add Discussion'),
(50, 24, 'email_subject_new_item', 'New Discussion:'),
(51, 24, 'use_comments', '1'),
(52, 24, 'email_subject_new_comment', 'New discussion comment:'),
(53, 21, 'use_editor_in_comments', '0'),
(54, 22, 'use_editor_in_comments', '0'),
(55, 23, 'use_editor_in_comments', '0'),
(56, 24, 'use_editor_in_comments', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entities_groups`
--

CREATE TABLE `app_entities_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entities_menu`
--

CREATE TABLE `app_entities_menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `icon_color` varchar(7) NOT NULL,
  `bg_color` varchar(7) NOT NULL,
  `entities_list` text NOT NULL,
  `reports_list` text NOT NULL,
  `pages_list` text NOT NULL,
  `type` varchar(16) DEFAULT 'entity',
  `url` varchar(255) NOT NULL,
  `users_groups` text NOT NULL,
  `assigned_to` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_1`
--

CREATE TABLE `app_entity_1` (
  `id` int(11) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent_item_id` int(11) NOT NULL DEFAULT '0',
  `linked_id` int(11) NOT NULL DEFAULT '0',
  `date_added` bigint(20) NOT NULL DEFAULT '0',
  `date_updated` bigint(20) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `multiple_access_groups` varchar(64) NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '1',
  `field_5` tinyint(1) NOT NULL,
  `field_6` int(11) NOT NULL,
  `field_7` varchar(255) NOT NULL,
  `field_8` varchar(255) NOT NULL,
  `field_9` varchar(255) NOT NULL,
  `field_10` varchar(255) NOT NULL,
  `field_12` varchar(255) NOT NULL,
  `field_13` varchar(64) NOT NULL,
  `field_14` varchar(64) NOT NULL,
  `field_201` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_entity_1`
--

INSERT INTO `app_entity_1` (`id`, `client_id`, `parent_id`, `parent_item_id`, `linked_id`, `date_added`, `date_updated`, `created_by`, `sort_order`, `password`, `multiple_access_groups`, `is_email_verified`, `field_5`, `field_6`, `field_7`, `field_8`, `field_9`, `field_10`, `field_12`, `field_13`, `field_14`, `field_201`) VALUES
(1, 3004401, 0, 0, 0, 1700751247, 0, NULL, 0, '$P$EAx7AYShyhtaDO72hX.3qPDVev9A/S1', '', 1, 1, 0, 'Mauro', 'Chojrin', 'mauro.chojrin@leewayweb.com', 'user_1_1700751311.jpeg', 'root', 'english.php', 'blue', 1700751257);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_1_values`
--

CREATE TABLE `app_entity_1_values` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_21`
--

CREATE TABLE `app_entity_21` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `parent_item_id` int(11) DEFAULT '0',
  `linked_id` int(11) DEFAULT '0',
  `date_added` bigint(20) NOT NULL DEFAULT '0',
  `date_updated` bigint(20) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `field_156` text NOT NULL,
  `field_157` text NOT NULL,
  `field_158` text NOT NULL,
  `field_159` bigint(20) NOT NULL DEFAULT '0',
  `field_160` text NOT NULL,
  `field_161` text NOT NULL,
  `field_162` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_21_values`
--

CREATE TABLE `app_entity_21_values` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_22`
--

CREATE TABLE `app_entity_22` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `parent_item_id` int(11) DEFAULT '0',
  `linked_id` int(11) DEFAULT '0',
  `date_added` bigint(20) NOT NULL DEFAULT '0',
  `date_updated` bigint(20) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `field_167` text NOT NULL,
  `field_168` text NOT NULL,
  `field_169` text NOT NULL,
  `field_170` text NOT NULL,
  `field_171` text NOT NULL,
  `field_172` text NOT NULL,
  `field_173` varchar(64) NOT NULL,
  `field_174` varchar(64) NOT NULL,
  `field_175` bigint(20) NOT NULL DEFAULT '0',
  `field_176` bigint(20) NOT NULL DEFAULT '0',
  `field_177` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_22_values`
--

CREATE TABLE `app_entity_22_values` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_23`
--

CREATE TABLE `app_entity_23` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `parent_item_id` int(11) DEFAULT '0',
  `linked_id` int(11) DEFAULT '0',
  `date_added` bigint(20) NOT NULL DEFAULT '0',
  `date_updated` bigint(20) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `field_182` text NOT NULL,
  `field_183` text NOT NULL,
  `field_184` text NOT NULL,
  `field_185` text NOT NULL,
  `field_186` text NOT NULL,
  `field_194` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_23_values`
--

CREATE TABLE `app_entity_23_values` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_24`
--

CREATE TABLE `app_entity_24` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `parent_item_id` int(11) DEFAULT '0',
  `linked_id` int(11) DEFAULT '0',
  `date_added` bigint(20) NOT NULL DEFAULT '0',
  `date_updated` bigint(20) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `field_191` text NOT NULL,
  `field_192` text NOT NULL,
  `field_193` text NOT NULL,
  `field_195` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_entity_24_values`
--

CREATE TABLE `app_entity_24_values` (
  `id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_favorites`
--

CREATE TABLE `app_favorites` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_fields`
--

CREATE TABLE `app_fields` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `forms_tabs_id` int(11) NOT NULL,
  `comments_forms_tabs_id` int(11) NOT NULL DEFAULT '0',
  `forms_rows_position` varchar(255) NOT NULL,
  `type` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(64) NOT NULL,
  `is_heading` tinyint(1) DEFAULT '0',
  `tooltip` text NOT NULL,
  `tooltip_display_as` varchar(16) NOT NULL,
  `tooltip_in_item_page` tinyint(1) NOT NULL DEFAULT '0',
  `tooltip_item_page` text NOT NULL,
  `notes` text NOT NULL,
  `is_required` tinyint(1) DEFAULT '0',
  `required_message` text NOT NULL,
  `configuration` text NOT NULL,
  `sort_order` int(11) DEFAULT '0',
  `listing_status` tinyint(4) NOT NULL DEFAULT '0',
  `listing_sort_order` int(11) NOT NULL DEFAULT '0',
  `comments_status` tinyint(1) NOT NULL DEFAULT '0',
  `comments_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_fields`
--

INSERT INTO `app_fields` (`id`, `entities_id`, `forms_tabs_id`, `comments_forms_tabs_id`, `forms_rows_position`, `type`, `name`, `short_name`, `is_heading`, `tooltip`, `tooltip_display_as`, `tooltip_in_item_page`, `tooltip_item_page`, `notes`, `is_required`, `required_message`, `configuration`, `sort_order`, `listing_status`, `listing_sort_order`, `comments_status`, `comments_sort_order`) VALUES
(1, 1, 1, 0, '', 'fieldtype_action', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 0, 0, 0),
(2, 1, 1, 0, '', 'fieldtype_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 1, 0, 0),
(3, 1, 1, 0, '', 'fieldtype_date_added', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 0, 0, 0, 0),
(4, 1, 1, 0, '', 'fieldtype_created_by', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 0, 0, 0, 0),
(5, 1, 1, 0, '', 'fieldtype_user_status', '', '', NULL, '', '', 0, '', '', NULL, '', '', 0, 1, 7, 0, 0),
(6, 1, 1, 0, '', 'fieldtype_user_accessgroups', '', '', NULL, '', '', 0, '', '', NULL, '', '', 1, 1, 2, 0, 0),
(7, 1, 1, 0, '', 'fieldtype_user_firstname', '', '', NULL, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 3, 1, 4, 0, 0),
(8, 1, 1, 0, '', 'fieldtype_user_lastname', '', '', NULL, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 4, 1, 5, 0, 0),
(9, 1, 1, 0, '', 'fieldtype_user_email', '', '', NULL, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 6, 1, 6, 0, 0),
(10, 1, 1, 0, '', 'fieldtype_user_photo', '', '', NULL, '', '', 0, '', '', NULL, '', '', 5, 0, 0, 0, 0),
(12, 1, 1, 0, '', 'fieldtype_user_username', '', '', 1, '', '', 0, '', '', NULL, '', '{\"allow_search\":\"1\"}', 2, 1, 3, 0, 0),
(13, 1, 1, 0, '', 'fieldtype_user_language', '', '', 0, '', '', 0, '', '', 0, '', '', 7, 0, 0, 0, 0),
(14, 1, 1, 0, '', 'fieldtype_user_skin', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 0, 0, 0, 0),
(152, 21, 24, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0),
(153, 21, 24, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0),
(154, 21, 24, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 6, 0, 0),
(155, 21, 24, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 7, 0, 0),
(156, 21, 24, 0, '', 'fieldtype_dropdown', 'Priority', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-medium\"}', 0, 1, 2, 1, 0),
(157, 21, 24, 0, '', 'fieldtype_dropdown', 'Status', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-medium\"}', 1, 1, 4, 1, 1),
(158, 21, 24, 0, '', 'fieldtype_input', 'Name', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\"}', 2, 1, 3, 0, 0),
(159, 21, 24, 0, '', 'fieldtype_input_date', 'Start Date', '', 0, '', '', 0, '', '', 0, '', '', 3, 1, 5, 0, 0),
(160, 21, 24, 0, '', 'fieldtype_textarea_wysiwyg', 'Description', '', 0, '', '', 0, '', '', 0, '', '{\"allow_search\":\"1\"}', 4, 0, 0, 0, 0),
(161, 21, 25, 0, '', 'fieldtype_users', 'Team', '', 0, '', '', 0, '', '', 0, '', '{\"display_as\":\"checkboxes\"}', 0, 0, 0, 0, 0),
(162, 21, 24, 0, '', 'fieldtype_attachments', 'Attachments', '', 0, '', '', 0, '', '', 0, '', '', 5, 0, 0, 0, 0),
(163, 22, 26, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0),
(164, 22, 26, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0),
(165, 22, 26, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 10, 0, 0),
(166, 22, 26, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 11, 0, 0),
(167, 22, 26, 0, '', 'fieldtype_dropdown', 'Type', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-medium\"}', 1, 1, 3, 0, 0),
(168, 22, 26, 0, '', 'fieldtype_input', 'Name', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\"}', 2, 1, 4, 0, 0),
(169, 22, 26, 0, '', 'fieldtype_dropdown', 'Status', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\"}', 3, 1, 5, 1, 0),
(170, 22, 26, 0, '', 'fieldtype_dropdown', 'Priority', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-medium\"}', 4, 1, 2, 1, 1),
(171, 22, 26, 0, '', 'fieldtype_users', 'Assigned To', '', 0, '', '', 0, '', '', 0, '', '{\"display_as\":\"checkboxes\"}', 5, 1, 6, 0, 0),
(172, 22, 26, 0, '', 'fieldtype_textarea_wysiwyg', 'Description', '', 0, '', '', 0, '', '', 0, '', '{\"allow_search\":\"1\"}', 6, 0, 0, 0, 0),
(173, 22, 27, 0, '', 'fieldtype_input_numeric', 'Est. Time', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-small\",\"number_format\":\"2/./*\"}', 1, 1, 7, 0, 0),
(174, 22, 27, 0, '', 'fieldtype_input_numeric_comments', 'Work Hours', '', 0, '', '', 0, '', '', 0, '', '', 2, 1, 8, 1, 2),
(175, 22, 27, 0, '', 'fieldtype_input_date', 'Start Date', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0),
(176, 22, 27, 0, '', 'fieldtype_input_date', 'End Date', '', 0, '', '', 0, '', '', 0, '', '', 4, 1, 9, 0, 0),
(177, 22, 26, 0, '', 'fieldtype_attachments', 'Attachments', '', 0, '', '', 0, '', '', 0, '', '', 7, 0, 0, 0, 0),
(178, 23, 28, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0),
(179, 23, 28, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0),
(180, 23, 28, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 6, 0, 0),
(181, 23, 28, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 7, 0, 0),
(182, 23, 28, 0, '', 'fieldtype_grouped_users', 'Department', '', 0, '', '', 0, '', '', 1, '', '', 0, 1, 4, 1, 0),
(183, 23, 28, 0, '', 'fieldtype_dropdown', 'Type', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\"}', 2, 1, 2, 1, 1),
(184, 23, 28, 0, '', 'fieldtype_input', 'Subject', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\"}', 3, 1, 3, 0, 0),
(185, 23, 28, 0, '', 'fieldtype_textarea_wysiwyg', 'Description', '', 0, '', '', 0, '', '', 0, '', '{\"allow_search\":\"1\"}', 4, 0, 0, 0, 0),
(186, 23, 28, 0, '', 'fieldtype_dropdown', 'Status', '', 0, '', '', 0, '', '', 1, '', '{\"width\":\"input-large\"}', 1, 1, 5, 1, 2),
(187, 24, 29, 0, '', 'fieldtype_action', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 0, 0, 0),
(188, 24, 29, 0, '', 'fieldtype_id', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 1, 0, 0),
(189, 24, 29, 0, '', 'fieldtype_date_added', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 4, 0, 0),
(190, 24, 29, 0, '', 'fieldtype_created_by', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 1, 5, 0, 0),
(191, 24, 29, 0, '', 'fieldtype_input', 'Name', '', 1, '', '', 0, '', '', 1, '', '{\"allow_search\":\"1\",\"width\":\"input-xlarge\"}', 1, 1, 3, 0, 0),
(192, 24, 29, 0, '', 'fieldtype_textarea_wysiwyg', 'Description', '', 0, '', '', 0, '', '', 0, '', '{\"allow_search\":\"1\"}', 2, 0, 0, 0, 0),
(193, 24, 29, 0, '', 'fieldtype_dropdown', 'Status', '', 0, '', '', 0, '', '', 0, '', '{\"width\":\"input-medium\"}', 0, 1, 2, 1, 0),
(194, 23, 28, 0, '', 'fieldtype_attachments', 'Attachments', '', 0, '', '', 0, '', '', 0, '', '', 5, 0, 0, 0, 0),
(195, 24, 29, 0, '', 'fieldtype_attachments', 'Attachments', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0),
(196, 1, 1, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0),
(197, 21, 24, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0),
(198, 22, 26, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0),
(199, 23, 28, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0),
(200, 24, 29, 0, '', 'fieldtype_parent_item_id', '', '', NULL, '', '', 0, '', '', NULL, '', '', NULL, 1, 100, 0, 0),
(201, 1, 1, 0, '', 'fieldtype_user_last_login_date', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 0, 0, 0, 0),
(202, 1, 1, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0),
(203, 21, 24, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0),
(204, 22, 26, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0),
(205, 23, 28, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0),
(206, 24, 29, 0, '', 'fieldtype_date_updated', '', '', 0, '', '', 0, '', '', 0, '', '', 3, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_fields_access`
--

CREATE TABLE `app_fields_access` (
  `id` int(11) NOT NULL,
  `access_groups_id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `access_schema` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_fields_choices`
--

CREATE TABLE `app_fields_choices` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `fields_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `bg_color` varchar(16) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `users` text NOT NULL,
  `value` varchar(64) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_fields_choices`
--

INSERT INTO `app_fields_choices` (`id`, `parent_id`, `fields_id`, `is_active`, `name`, `is_default`, `bg_color`, `sort_order`, `users`, `value`, `filename`) VALUES
(34, 0, 156, 1, 'Urgent', 0, '', 1, '', '', ''),
(35, 0, 156, 1, 'High', 0, '', 2, '', '', ''),
(37, 0, 157, 1, 'New', 0, '', 1, '', '', ''),
(38, 0, 157, 1, 'Open', 0, '', 2, '', '', ''),
(39, 0, 157, 1, 'Waiting', 0, '', 3, '', '', ''),
(40, 0, 157, 1, 'Closed', 0, '', 4, '', '', ''),
(41, 0, 157, 1, 'Canceled', 0, '', 5, '', '', ''),
(42, 0, 167, 1, 'Task', 1, '', 1, '', '', ''),
(43, 0, 167, 1, 'Change', 0, '', 2, '', '', ''),
(44, 0, 167, 1, 'Bug', 0, '#ff7a00', 3, '', '', ''),
(45, 0, 167, 1, 'Idea', 0, '', 0, '', '', ''),
(46, 0, 169, 1, 'New', 1, '', 0, '', '', ''),
(47, 0, 169, 1, 'Open', 0, '', 2, '', '', ''),
(48, 0, 169, 1, 'Waiting', 0, '', 3, '', '', ''),
(49, 0, 169, 1, 'Done', 0, '', 4, '', '', ''),
(50, 0, 169, 1, 'Closed', 0, '', 5, '', '', ''),
(51, 0, 169, 1, 'Paid', 0, '', 6, '', '', ''),
(52, 0, 169, 1, 'Canceled', 0, '', 7, '', '', ''),
(53, 0, 170, 1, 'Urgent', 0, '#ff0000', 1, '', '', ''),
(54, 0, 170, 1, 'High', 0, '', 2, '', '', ''),
(55, 0, 170, 1, 'Medium', 1, '', 3, '', '', ''),
(56, 0, 182, 1, 'Support', 0, '', 0, '', '', ''),
(57, 0, 183, 1, 'Request a Change', 0, '', 1, '', '', ''),
(58, 0, 183, 1, 'Report a Bug', 0, '', 2, '', '', ''),
(59, 0, 183, 1, 'Ask a Question', 0, '', 3, '', '', ''),
(60, 0, 186, 1, 'New', 1, '', 0, '', '', ''),
(61, 0, 186, 1, 'Open', 0, '', 2, '', '', ''),
(62, 0, 186, 1, 'Waiting On Client', 0, '', 3, '', '', ''),
(63, 0, 186, 1, 'Closed', 0, '', 4, '', '', ''),
(64, 0, 186, 1, 'Canceled', 0, '', 5, '', '', ''),
(65, 0, 193, 1, 'Open', 0, '', 1, '', '', ''),
(66, 0, 193, 1, 'Closed', 0, '', 2, '', '', ''),
(67, 0, 193, 1, 'New', 1, '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_filters_panels`
--

CREATE TABLE `app_filters_panels` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_active_filters` tinyint(1) NOT NULL,
  `position` varchar(16) NOT NULL,
  `users_groups` text NOT NULL,
  `width` tinyint(1) NOT NULL,
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_filters_panels_fields`
--

CREATE TABLE `app_filters_panels_fields` (
  `id` int(11) NOT NULL,
  `panels_id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `width` varchar(16) NOT NULL,
  `height` varchar(16) NOT NULL,
  `display_type` varchar(32) NOT NULL,
  `search_type_match` tinyint(1) NOT NULL,
  `exclude_values` text NOT NULL,
  `exclude_values_not_in_listing` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_forms_fields_rules`
--

CREATE TABLE `app_forms_fields_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL,
  `fields_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `choices` text NOT NULL,
  `visible_fields` text NOT NULL,
  `hidden_fields` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_forms_rows`
--

CREATE TABLE `app_forms_rows` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `forms_tabs_id` int(11) NOT NULL,
  `columns` tinyint(4) NOT NULL,
  `column1_width` tinyint(4) NOT NULL,
  `column2_width` tinyint(4) NOT NULL,
  `column3_width` tinyint(4) NOT NULL,
  `column4_width` tinyint(4) NOT NULL,
  `column5_width` tinyint(4) NOT NULL,
  `column6_width` tinyint(4) NOT NULL,
  `field_name_new_row` tinyint(1) NOT NULL,
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_forms_tabs`
--

CREATE TABLE `app_forms_tabs` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_forms_tabs`
--

INSERT INTO `app_forms_tabs` (`id`, `entities_id`, `parent_id`, `is_folder`, `name`, `description`, `sort_order`) VALUES
(1, 1, 0, 0, 'Info', '', 0),
(24, 21, 0, 0, 'Info', '', 0),
(25, 21, 0, 0, 'Team', '', 1),
(26, 22, 0, 0, 'Info', '', 0),
(27, 22, 0, 0, 'Time', '', 1),
(28, 23, 0, 0, 'Info', '', 0),
(29, 24, 0, 0, 'Info', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_global_lists`
--

CREATE TABLE `app_global_lists` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_global_lists_choices`
--

CREATE TABLE `app_global_lists_choices` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `lists_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `bg_color` varchar(16) NOT NULL,
  `value` varchar(64) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `users` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_global_vars`
--

CREATE TABLE `app_global_vars` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_folder` tinyint(1) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_help_pages`
--

CREATE TABLE `app_help_pages` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `description` text NOT NULL,
  `color` varchar(16) NOT NULL,
  `position` varchar(16) NOT NULL,
  `users_groups` text NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_holidays`
--

CREATE TABLE `app_holidays` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_image_map_labels`
--

CREATE TABLE `app_image_map_labels` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `choices_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_image_map_markers`
--

CREATE TABLE `app_image_map_markers` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_image_map_markers_nested`
--

CREATE TABLE `app_image_map_markers_nested` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_items_export_templates`
--

CREATE TABLE `app_items_export_templates` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `templates_fields` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_listing_highlight_rules`
--

CREATE TABLE `app_listing_highlight_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `entities_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `fields_id` int(10) UNSIGNED NOT NULL,
  `fields_values` text NOT NULL,
  `bg_color` varchar(7) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_listing_sections`
--

CREATE TABLE `app_listing_sections` (
  `id` int(11) NOT NULL,
  `listing_types_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fields` text NOT NULL,
  `display_as` varchar(16) NOT NULL,
  `display_field_names` tinyint(1) NOT NULL,
  `text_align` varchar(16) NOT NULL,
  `width` varchar(16) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_listing_types`
--

CREATE TABLE `app_listing_types` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_default` tinyint(4) NOT NULL,
  `width` smallint(6) NOT NULL,
  `settings` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_logs`
--

CREATE TABLE `app_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `users_id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `log_type` varchar(16) NOT NULL,
  `date_added` int(11) NOT NULL,
  `http_url` varchar(255) NOT NULL,
  `is_ajax` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `seconds` decimal(11,4) NOT NULL,
  `errno` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `linenum` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_mind_map`
--

CREATE TABLE `app_mind_map` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) DEFAULT NULL,
  `fields_id` int(11) DEFAULT NULL,
  `reports_id` int(11) DEFAULT NULL,
  `mm_id` varchar(64) NOT NULL,
  `mm_parent_id` varchar(64) NOT NULL,
  `mm_text` varchar(255) NOT NULL,
  `mm_layout` varchar(16) NOT NULL,
  `mm_shape` varchar(16) NOT NULL,
  `mm_side` varchar(16) NOT NULL,
  `mm_color` varchar(16) NOT NULL,
  `mm_icon` varchar(32) NOT NULL,
  `mm_collapsed` varchar(1) NOT NULL,
  `mm_value` varchar(64) NOT NULL,
  `mm_items_id` int(11) DEFAULT '0',
  `parent_entity_item_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_nested_entities_menu`
--

CREATE TABLE `app_nested_entities_menu` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `name` varchar(64) NOT NULL,
  `entities` varchar(255) NOT NULL,
  `icon` varchar(64) NOT NULL,
  `icon_color` varchar(10) NOT NULL,
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_portlets`
--

CREATE TABLE `app_portlets` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `users_id` int(11) NOT NULL,
  `is_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_records_visibility_rules`
--

CREATE TABLE `app_records_visibility_rules` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `users_groups` text NOT NULL,
  `merged_fields` text NOT NULL,
  `merged_fields_empty_values` text NOT NULL,
  `notes` text NOT NULL,
  `mysql_query` text NOT NULL,
  `php_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_reports`
--

CREATE TABLE `app_reports` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `reports_type` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `menu_icon` varchar(64) NOT NULL,
  `icon_color` varchar(7) NOT NULL,
  `bg_color` varchar(7) NOT NULL,
  `in_menu` tinyint(1) NOT NULL DEFAULT '0',
  `in_dashboard` tinyint(4) NOT NULL DEFAULT '0',
  `in_dashboard_counter` tinyint(1) NOT NULL DEFAULT '0',
  `in_dashboard_icon` tinyint(1) NOT NULL,
  `in_dashboard_counter_color` varchar(16) NOT NULL,
  `in_dashboard_counter_bg_color` varchar(16) NOT NULL,
  `in_dashboard_counter_fields` varchar(255) NOT NULL,
  `dashboard_counter_hide_count` tinyint(1) NOT NULL DEFAULT '0',
  `dashboard_counter_hide_zero_count` tinyint(1) NOT NULL,
  `dashboard_counter_sum_by_field` int(11) NOT NULL,
  `in_header` tinyint(1) NOT NULL DEFAULT '0',
  `in_header_autoupdate` tinyint(1) NOT NULL,
  `dashboard_sort_order` int(11) DEFAULT NULL,
  `header_sort_order` int(11) NOT NULL DEFAULT '0',
  `dashboard_counter_sort_order` int(11) NOT NULL DEFAULT '0',
  `listing_order_fields` text NOT NULL,
  `users_groups` text NOT NULL,
  `assigned_to` text NOT NULL,
  `displays_assigned_only` tinyint(1) NOT NULL DEFAULT '0',
  `parent_entity_id` int(11) NOT NULL DEFAULT '0',
  `parent_item_id` int(11) NOT NULL DEFAULT '0',
  `fields_in_listing` text NOT NULL,
  `rows_per_page` int(11) NOT NULL DEFAULT '0',
  `notification_days` varchar(32) NOT NULL,
  `notification_time` varchar(255) NOT NULL,
  `listing_type` varchar(16) NOT NULL,
  `listing_col_width` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_reports`
--

INSERT INTO `app_reports` (`id`, `parent_id`, `entities_id`, `created_by`, `reports_type`, `name`, `description`, `menu_icon`, `icon_color`, `bg_color`, `in_menu`, `in_dashboard`, `in_dashboard_counter`, `in_dashboard_icon`, `in_dashboard_counter_color`, `in_dashboard_counter_bg_color`, `in_dashboard_counter_fields`, `dashboard_counter_hide_count`, `dashboard_counter_hide_zero_count`, `dashboard_counter_sum_by_field`, `in_header`, `in_header_autoupdate`, `dashboard_sort_order`, `header_sort_order`, `dashboard_counter_sort_order`, `listing_order_fields`, `users_groups`, `assigned_to`, `displays_assigned_only`, `parent_entity_id`, `parent_item_id`, `fields_in_listing`, `rows_per_page`, `notification_days`, `notification_time`, `listing_type`, `listing_col_width`) VALUES
(59, 0, 21, 0, 'default', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', ''),
(61, 0, 22, 0, 'default', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', ''),
(63, 0, 23, 0, 'default', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', ''),
(66, 0, 21, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', ''),
(67, 0, 1, 1, 'entity', '', '', '', '', '', 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, NULL, 0, 0, '', '', '', 0, 0, 0, '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_reports_filters`
--

CREATE TABLE `app_reports_filters` (
  `id` int(11) NOT NULL,
  `reports_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `filters_values` text NOT NULL,
  `filters_condition` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_reports_filters`
--

INSERT INTO `app_reports_filters` (`id`, `reports_id`, `fields_id`, `filters_values`, `filters_condition`, `is_active`) VALUES
(68, 59, 157, '37,38,39', 'include', 1),
(70, 61, 169, '46,47,48', 'include', 1),
(72, 63, 186, '60,61,62', 'include', 1),
(73, 66, 157, '37,38,39', 'include', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_reports_filters_templates`
--

CREATE TABLE `app_reports_filters_templates` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `filters_values` text NOT NULL,
  `filters_condition` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_reports_groups`
--

CREATE TABLE `app_reports_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `menu_icon` varchar(64) NOT NULL,
  `icon_color` varchar(7) NOT NULL,
  `bg_color` varchar(7) NOT NULL,
  `in_menu` tinyint(1) NOT NULL,
  `in_dashboard` tinyint(1) NOT NULL,
  `sort_order` smallint(6) NOT NULL,
  `counters_list` text NOT NULL,
  `reports_list` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `is_common` tinyint(1) NOT NULL DEFAULT '0',
  `users_groups` text NOT NULL,
  `assigned_to` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_reports_sections`
--

CREATE TABLE `app_reports_sections` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `count_columns` tinyint(1) NOT NULL DEFAULT '2',
  `reports_groups_id` int(11) NOT NULL,
  `report_left` varchar(64) NOT NULL,
  `report_right` varchar(64) NOT NULL,
  `sort_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_sessions`
--

CREATE TABLE `app_sessions` (
  `sesskey` varchar(32) NOT NULL,
  `expiry` bigint(20) UNSIGNED NOT NULL,
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_sessions`
--

INSERT INTO `app_sessions` (`sesskey`, `expiry`, `value`) VALUES
('5b9167f7af3d78effa35162ea54f73c5', 1700756758, 'uploadify_attachments|a:0:{}uploadify_attachments_queue|a:0:{}alerts|O:6:\"alerts\":1:{s:8:\"messages\";a:0:{}}app_send_to|N;app_session_token|s:10:\"x3BO17iDT8\";app_current_users_filter|a:0:{}app_previously_logged_user|i:0;two_step_verification_info|a:1:{s:10:\"is_checked\";b:1;}app_email_verification_code|s:0:\"\";app_force_print_template|N;app_current_version|s:5:\"3.4.4\";app_selected_items|a:0:{}listing_page_keeper|a:0:{}user_roles_dropdown_change_holder|a:0:{}app_subentity_form_items|a:0:{}app_subentity_form_items_deleted|a:0:{}app_logged_users_id|s:1:\"1\";');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_alerts`
--

CREATE TABLE `app_users_alerts` (
  `id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(16) NOT NULL,
  `location` varchar(16) NOT NULL,
  `start_date` bigint(20) UNSIGNED NOT NULL,
  `end_date` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` text NOT NULL,
  `users_groups` text NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_alerts_viewed`
--

CREATE TABLE `app_users_alerts_viewed` (
  `users_id` int(11) NOT NULL,
  `alerts_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_configuration`
--

CREATE TABLE `app_users_configuration` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `configuration_name` varchar(255) NOT NULL,
  `configuration_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_users_configuration`
--

INSERT INTO `app_users_configuration` (`id`, `users_id`, `configuration_name`, `configuration_value`) VALUES
(1, 1, 'disable_notification', ''),
(2, 1, 'disable_internal_notification', ''),
(3, 1, 'disable_highlight_unread', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_filters`
--

CREATE TABLE `app_users_filters` (
  `id` int(11) NOT NULL,
  `reports_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `fields_in_listing` text NOT NULL,
  `listing_order_fields` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_login_log`
--

CREATE TABLE `app_users_login_log` (
  `id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `date_added` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app_users_login_log`
--

INSERT INTO `app_users_login_log` (`id`, `users_id`, `username`, `identifier`, `is_success`, `date_added`) VALUES
(5, 0, 'root', '172.22.0.1', 0, 1700751255),
(6, 1, 'root', '172.22.0.1', 1, 1700751257);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_notifications`
--

CREATE TABLE `app_users_notifications` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` varchar(16) NOT NULL,
  `date_added` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_users_search_settings`
--

CREATE TABLE `app_users_search_settings` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `reports_id` int(11) NOT NULL,
  `configuration_name` varchar(255) NOT NULL,
  `configuration_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user_filters_values`
--

CREATE TABLE `app_user_filters_values` (
  `id` int(11) NOT NULL,
  `filters_id` int(11) NOT NULL,
  `reports_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `filters_values` text NOT NULL,
  `filters_condition` varchar(64) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user_roles`
--

CREATE TABLE `app_user_roles` (
  `id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user_roles_access`
--

CREATE TABLE `app_user_roles_access` (
  `id` int(11) NOT NULL,
  `user_roles_id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `access_schema` varchar(255) NOT NULL,
  `comments_access` varchar(64) NOT NULL,
  `fields_access` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_user_roles_to_items`
--

CREATE TABLE `app_user_roles_to_items` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `entities_id` int(11) NOT NULL,
  `items_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_access_groups`
--
ALTER TABLE `app_access_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_access_rules`
--
ALTER TABLE `app_access_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_access_rules_fields`
--
ALTER TABLE `app_access_rules_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_approved_items`
--
ALTER TABLE `app_approved_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_users_id` (`users_id`);

--
-- Indices de la tabla `app_attachments`
--
ALTER TABLE `app_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_backups`
--
ALTER TABLE `app_backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`);

--
-- Indices de la tabla `app_comments`
--
ALTER TABLE `app_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Indices de la tabla `app_comments_access`
--
ALTER TABLE `app_comments_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_access_groups_id` (`access_groups_id`);

--
-- Indices de la tabla `app_comments_forms_tabs`
--
ALTER TABLE `app_comments_forms_tabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_comments_history`
--
ALTER TABLE `app_comments_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comments_id` (`comments_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_configuration`
--
ALTER TABLE `app_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_custom_php`
--
ALTER TABLE `app_custom_php`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indices de la tabla `app_dashboard_pages`
--
ALTER TABLE `app_dashboard_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_sections_id` (`sections_id`);

--
-- Indices de la tabla `app_dashboard_pages_sections`
--
ALTER TABLE `app_dashboard_pages_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_emails_on_schedule`
--
ALTER TABLE `app_emails_on_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_entities`
--
ALTER TABLE `app_entities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group_id` (`group_id`);

--
-- Indices de la tabla `app_entities_access`
--
ALTER TABLE `app_entities_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_access_groups_id` (`access_groups_id`);

--
-- Indices de la tabla `app_entities_configuration`
--
ALTER TABLE `app_entities_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_entities_groups`
--
ALTER TABLE `app_entities_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_entities_menu`
--
ALTER TABLE `app_entities_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indices de la tabla `app_entity_1`
--
ALTER TABLE `app_entity_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_parent_item_id` (`parent_item_id`),
  ADD KEY `idx_client_id` (`client_id`);

--
-- Indices de la tabla `app_entity_1_values`
--
ALTER TABLE `app_entity_1_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_items_fields_id` (`items_id`,`fields_id`),
  ADD KEY `idx_value_id` (`value`);

--
-- Indices de la tabla `app_entity_21`
--
ALTER TABLE `app_entity_21`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_parent_item_id` (`parent_item_id`);

--
-- Indices de la tabla `app_entity_21_values`
--
ALTER TABLE `app_entity_21_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_items_fields_id` (`items_id`,`fields_id`),
  ADD KEY `idx_value_id` (`value`);

--
-- Indices de la tabla `app_entity_22`
--
ALTER TABLE `app_entity_22`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_parent_item_id` (`parent_item_id`);

--
-- Indices de la tabla `app_entity_22_values`
--
ALTER TABLE `app_entity_22_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_items_fields_id` (`items_id`,`fields_id`),
  ADD KEY `idx_value_id` (`value`);

--
-- Indices de la tabla `app_entity_23`
--
ALTER TABLE `app_entity_23`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_parent_item_id` (`parent_item_id`);

--
-- Indices de la tabla `app_entity_23_values`
--
ALTER TABLE `app_entity_23_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_items_fields_id` (`items_id`,`fields_id`),
  ADD KEY `idx_value_id` (`value`);

--
-- Indices de la tabla `app_entity_24`
--
ALTER TABLE `app_entity_24`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_parent_item_id` (`parent_item_id`);

--
-- Indices de la tabla `app_entity_24_values`
--
ALTER TABLE `app_entity_24_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_items_fields_id` (`items_id`,`fields_id`),
  ADD KEY `idx_value_id` (`value`);

--
-- Indices de la tabla `app_favorites`
--
ALTER TABLE `app_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_Id` (`items_id`);

--
-- Indices de la tabla `app_fields`
--
ALTER TABLE `app_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_form_tabs_id` (`forms_tabs_id`),
  ADD KEY `idx_comments_forms_tabs_id` (`comments_forms_tabs_id`),
  ADD KEY `idx_type` (`type`);

--
-- Indices de la tabla `app_fields_access`
--
ALTER TABLE `app_fields_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_access_groups_id` (`access_groups_id`);

--
-- Indices de la tabla `app_fields_choices`
--
ALTER TABLE `app_fields_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indices de la tabla `app_filters_panels`
--
ALTER TABLE `app_filters_panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_filters_panels_fields`
--
ALTER TABLE `app_filters_panels_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_panels_id` (`panels_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_forms_fields_rules`
--
ALTER TABLE `app_forms_fields_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_forms_rows`
--
ALTER TABLE `app_forms_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `forms_tabs_id` (`forms_tabs_id`);

--
-- Indices de la tabla `app_forms_tabs`
--
ALTER TABLE `app_forms_tabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_global_lists`
--
ALTER TABLE `app_global_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_global_lists_choices`
--
ALTER TABLE `app_global_lists_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_lists_id` (`lists_id`) USING BTREE;

--
-- Indices de la tabla `app_global_vars`
--
ALTER TABLE `app_global_vars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indices de la tabla `app_help_pages`
--
ALTER TABLE `app_help_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_holidays`
--
ALTER TABLE `app_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_image_map_labels`
--
ALTER TABLE `app_image_map_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_map_id` (`map_id`),
  ADD KEY `idx_choices_id` (`choices_id`);

--
-- Indices de la tabla `app_image_map_markers`
--
ALTER TABLE `app_image_map_markers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_map_id` (`map_id`);

--
-- Indices de la tabla `app_image_map_markers_nested`
--
ALTER TABLE `app_image_map_markers_nested`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`) USING BTREE;

--
-- Indices de la tabla `app_items_export_templates`
--
ALTER TABLE `app_items_export_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cidx` (`entities_id`,`users_id`) USING BTREE;

--
-- Indices de la tabla `app_listing_highlight_rules`
--
ALTER TABLE `app_listing_highlight_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `entities_id` (`entities_id`),
  ADD KEY `fields_id` (`fields_id`);

--
-- Indices de la tabla `app_listing_sections`
--
ALTER TABLE `app_listing_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing_types_id` (`listing_types_id`);

--
-- Indices de la tabla `app_listing_types`
--
ALTER TABLE `app_listing_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_logs`
--
ALTER TABLE `app_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`),
  ADD KEY `idx_date_added` (`date_added`),
  ADD KEY `idx_ip_address` (`ip_address`),
  ADD KEY `idx_log_type` (`log_type`);

--
-- Indices de la tabla `app_mind_map`
--
ALTER TABLE `app_mind_map`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_reports_id` (`reports_id`);

--
-- Indices de la tabla `app_nested_entities_menu`
--
ALTER TABLE `app_nested_entities_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_portlets`
--
ALTER TABLE `app_portlets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`,`users_id`);

--
-- Indices de la tabla `app_records_visibility_rules`
--
ALTER TABLE `app_records_visibility_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_reports`
--
ALTER TABLE `app_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_parent_entity_id` (`parent_entity_id`),
  ADD KEY `idx_parent_item_id` (`parent_item_id`),
  ADD KEY `idx_reports_type` (`reports_type`),
  ADD KEY `idx_in_dashboard` (`in_dashboard`),
  ADD KEY `idx_in_dashboard_counter` (`in_dashboard_counter`);

--
-- Indices de la tabla `app_reports_filters`
--
ALTER TABLE `app_reports_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reports_id` (`reports_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_reports_filters_templates`
--
ALTER TABLE `app_reports_filters_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cidx` (`fields_id`,`users_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_reports_groups`
--
ALTER TABLE `app_reports_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Indices de la tabla `app_reports_sections`
--
ALTER TABLE `app_reports_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reports_groups_id` (`reports_groups_id`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Indices de la tabla `app_sessions`
--
ALTER TABLE `app_sessions`
  ADD PRIMARY KEY (`sesskey`),
  ADD KEY `idx_expiry` (`expiry`);

--
-- Indices de la tabla `app_users_alerts`
--
ALTER TABLE `app_users_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Indices de la tabla `app_users_alerts_viewed`
--
ALTER TABLE `app_users_alerts_viewed`
  ADD KEY `idx_ueser_alerts` (`users_id`,`alerts_id`);

--
-- Indices de la tabla `app_users_configuration`
--
ALTER TABLE `app_users_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`);

--
-- Indices de la tabla `app_users_filters`
--
ALTER TABLE `app_users_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reports_id` (`reports_id`),
  ADD KEY `idx_users_id` (`users_id`);

--
-- Indices de la tabla `app_users_login_log`
--
ALTER TABLE `app_users_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`);

--
-- Indices de la tabla `app_users_notifications`
--
ALTER TABLE `app_users_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_uei` (`users_id`,`entities_id`) USING BTREE,
  ADD KEY `idx_created_by` (`created_by`) USING BTREE;

--
-- Indices de la tabla `app_users_search_settings`
--
ALTER TABLE `app_users_search_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_id` (`users_id`),
  ADD KEY `idx_users_reports_id` (`users_id`,`reports_id`),
  ADD KEY `idx_reports_id` (`reports_id`) USING BTREE;

--
-- Indices de la tabla `app_user_filters_values`
--
ALTER TABLE `app_user_filters_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_filters_id` (`filters_id`),
  ADD KEY `idx_reports_id` (`reports_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- Indices de la tabla `app_user_roles`
--
ALTER TABLE `app_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_entities_id` (`entities_id`);

--
-- Indices de la tabla `app_user_roles_access`
--
ALTER TABLE `app_user_roles_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fields_id` (`fields_id`),
  ADD KEY `idx_user_roles_id` (`user_roles_id`),
  ADD KEY `entities_id` (`entities_id`);

--
-- Indices de la tabla `app_user_roles_to_items`
--
ALTER TABLE `app_user_roles_to_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_roles_id` (`roles_id`),
  ADD KEY `idx_users_id` (`users_id`),
  ADD KEY `idx_items_id` (`items_id`),
  ADD KEY `idx_entities_id` (`entities_id`),
  ADD KEY `idx_fields_id` (`fields_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_access_groups`
--
ALTER TABLE `app_access_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `app_access_rules`
--
ALTER TABLE `app_access_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_access_rules_fields`
--
ALTER TABLE `app_access_rules_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_approved_items`
--
ALTER TABLE `app_approved_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_attachments`
--
ALTER TABLE `app_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_backups`
--
ALTER TABLE `app_backups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_comments`
--
ALTER TABLE `app_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_comments_access`
--
ALTER TABLE `app_comments_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `app_comments_forms_tabs`
--
ALTER TABLE `app_comments_forms_tabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_comments_history`
--
ALTER TABLE `app_comments_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_configuration`
--
ALTER TABLE `app_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `app_custom_php`
--
ALTER TABLE `app_custom_php`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_dashboard_pages`
--
ALTER TABLE `app_dashboard_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_dashboard_pages_sections`
--
ALTER TABLE `app_dashboard_pages_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_emails_on_schedule`
--
ALTER TABLE `app_emails_on_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entities`
--
ALTER TABLE `app_entities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `app_entities_access`
--
ALTER TABLE `app_entities_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `app_entities_configuration`
--
ALTER TABLE `app_entities_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `app_entities_groups`
--
ALTER TABLE `app_entities_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entities_menu`
--
ALTER TABLE `app_entities_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_1`
--
ALTER TABLE `app_entity_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `app_entity_1_values`
--
ALTER TABLE `app_entity_1_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_21`
--
ALTER TABLE `app_entity_21`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_21_values`
--
ALTER TABLE `app_entity_21_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_22`
--
ALTER TABLE `app_entity_22`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_22_values`
--
ALTER TABLE `app_entity_22_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_23`
--
ALTER TABLE `app_entity_23`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_23_values`
--
ALTER TABLE `app_entity_23_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_24`
--
ALTER TABLE `app_entity_24`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_entity_24_values`
--
ALTER TABLE `app_entity_24_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_favorites`
--
ALTER TABLE `app_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_fields`
--
ALTER TABLE `app_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de la tabla `app_fields_access`
--
ALTER TABLE `app_fields_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_fields_choices`
--
ALTER TABLE `app_fields_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `app_filters_panels`
--
ALTER TABLE `app_filters_panels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_filters_panels_fields`
--
ALTER TABLE `app_filters_panels_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_forms_fields_rules`
--
ALTER TABLE `app_forms_fields_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_forms_rows`
--
ALTER TABLE `app_forms_rows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_forms_tabs`
--
ALTER TABLE `app_forms_tabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `app_global_lists`
--
ALTER TABLE `app_global_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_global_lists_choices`
--
ALTER TABLE `app_global_lists_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_global_vars`
--
ALTER TABLE `app_global_vars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_help_pages`
--
ALTER TABLE `app_help_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_holidays`
--
ALTER TABLE `app_holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_image_map_labels`
--
ALTER TABLE `app_image_map_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_image_map_markers`
--
ALTER TABLE `app_image_map_markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_image_map_markers_nested`
--
ALTER TABLE `app_image_map_markers_nested`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_items_export_templates`
--
ALTER TABLE `app_items_export_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_listing_highlight_rules`
--
ALTER TABLE `app_listing_highlight_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_listing_sections`
--
ALTER TABLE `app_listing_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_listing_types`
--
ALTER TABLE `app_listing_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_mind_map`
--
ALTER TABLE `app_mind_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_nested_entities_menu`
--
ALTER TABLE `app_nested_entities_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_portlets`
--
ALTER TABLE `app_portlets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_records_visibility_rules`
--
ALTER TABLE `app_records_visibility_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_reports`
--
ALTER TABLE `app_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `app_reports_filters`
--
ALTER TABLE `app_reports_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `app_reports_filters_templates`
--
ALTER TABLE `app_reports_filters_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_reports_groups`
--
ALTER TABLE `app_reports_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_reports_sections`
--
ALTER TABLE `app_reports_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_users_alerts`
--
ALTER TABLE `app_users_alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_users_configuration`
--
ALTER TABLE `app_users_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `app_users_filters`
--
ALTER TABLE `app_users_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_users_login_log`
--
ALTER TABLE `app_users_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `app_users_notifications`
--
ALTER TABLE `app_users_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_users_search_settings`
--
ALTER TABLE `app_users_search_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_user_filters_values`
--
ALTER TABLE `app_user_filters_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_user_roles`
--
ALTER TABLE `app_user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_user_roles_access`
--
ALTER TABLE `app_user_roles_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `app_user_roles_to_items`
--
ALTER TABLE `app_user_roles_to_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
