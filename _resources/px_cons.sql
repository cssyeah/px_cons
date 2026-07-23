-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table px_cons.cons_action_logs
CREATE TABLE IF NOT EXISTS `cons_action_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `item_id` int NOT NULL DEFAULT '0',
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_action_logs: ~4 rows (approximately)
INSERT INTO `cons_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
	(1, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{"action":"login","userid":42,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=42","app":"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR"}', '2026-07-23 06:25:53', 'com_users', 42, 0, 'COM_ACTIONLOGS_DISABLED'),
	(2, 'PLG_ACTIONLOG_JOOMLA_GUIDEDTOURS_TOURSKIPPED', '{"id":12,"title":"Welcome to Joomla!","state":"skipped","step":1,"userid":42,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=42"}', '2026-07-23 06:25:55', 'com_guidedtours.state', 42, 12, 'COM_ACTIONLOGS_DISABLED'),
	(3, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{"action":"install","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":252,"name":"PLG_SYSTEM_PIXEL","extension_name":"PLG_SYSTEM_PIXEL","userid":42,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=42"}', '2026-07-23 06:27:32', 'com_installer', 42, 252, 'COM_ACTIONLOGS_DISABLED'),
	(4, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{"action":"checkin","type":"PLG_ACTIONLOG_JOOMLA_TYPE_USER","id":42,"title":"admin","itemlink":"index.php?option=com_users&task=user.edit&id=42","userid":42,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=42","table":"#__extensions"}', '2026-07-23 06:27:47', 'com_checkin', 42, 42, 'COM_ACTIONLOGS_DISABLED'),
	(5, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED', '{"action":"publish","type":"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN","id":252,"title":"PLG_SYSTEM_PIXEL","itemlink":"index.php?option=com_plugins&task=plugin.edit&extension_id=252","userid":42,"username":"admin","accountlink":"index.php?option=com_users&task=user.edit&id=42"}', '2026-07-23 06:27:47', 'com_plugins.plugin', 42, 252, 'COM_ACTIONLOGS_DISABLED');

-- Dumping structure for table px_cons.cons_action_logs_extensions
CREATE TABLE IF NOT EXISTS `cons_action_logs_extensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_action_logs_extensions: ~21 rows (approximately)
INSERT INTO `cons_action_logs_extensions` (`id`, `extension`) VALUES
	(1, 'com_banners'),
	(2, 'com_cache'),
	(3, 'com_categories'),
	(4, 'com_config'),
	(5, 'com_contact'),
	(6, 'com_content'),
	(7, 'com_installer'),
	(8, 'com_media'),
	(9, 'com_menus'),
	(10, 'com_messages'),
	(11, 'com_modules'),
	(12, 'com_newsfeeds'),
	(13, 'com_plugins'),
	(14, 'com_redirect'),
	(15, 'com_tags'),
	(16, 'com_templates'),
	(17, 'com_users'),
	(18, 'com_checkin'),
	(19, 'com_scheduler'),
	(20, 'com_fields'),
	(21, 'com_guidedtours');

-- Dumping structure for table px_cons.cons_action_logs_users
CREATE TABLE IF NOT EXISTS `cons_action_logs_users` (
  `user_id` int unsigned NOT NULL,
  `notify` tinyint unsigned NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_action_logs_users: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_action_log_config
CREATE TABLE IF NOT EXISTS `cons_action_log_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_action_log_config: ~23 rows (approximately)
INSERT INTO `cons_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
	(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
	(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
	(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
	(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
	(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
	(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
	(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
	(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
	(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
	(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
	(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
	(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
	(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
	(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
	(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
	(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
	(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
	(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
	(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
	(20, 'task', 'com_scheduler.task', 'id', 'title', '#__scheduler_tasks', 'PLG_ACTIONLOG_JOOMLA'),
	(21, 'field', 'com_fields.field', 'id', 'title', '#__fields', 'PLG_ACTIONLOG_JOOMLA'),
	(22, 'guidedtour', 'com_guidedtours.state', 'id', 'title', '#__guidedtours', 'PLG_ACTIONLOG_JOOMLA'),
	(23, 'contact', 'com_contact.form', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA');

-- Dumping structure for table px_cons.cons_assets
CREATE TABLE IF NOT EXISTS `cons_assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_assets: ~92 rows (approximately)
INSERT INTO `cons_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
	(1, 0, 0, 183, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.api":{"8":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
	(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
	(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
	(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(8, 1, 17, 38, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.edit":{"4":1},"core.edit.state":{"5":1},"core.execute.transition":{"6":1,"5":1}}'),
	(9, 1, 39, 40, 1, 'com_cpanel', 'com_cpanel', '{}'),
	(10, 1, 41, 42, 1, 'com_installer', 'com_installer', '{"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
	(11, 1, 43, 46, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1}}'),
	(12, 11, 44, 45, 2, 'com_languages.language.1', 'English (en-GB)', '{}'),
	(13, 1, 47, 48, 1, 'com_login', 'com_login', '{}'),
	(14, 1, 49, 50, 1, 'com_mails', 'com_mails', '{}'),
	(15, 1, 51, 52, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
	(16, 1, 53, 56, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1}}'),
	(17, 1, 57, 58, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
	(18, 1, 59, 132, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1}}'),
	(19, 1, 133, 136, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(20, 1, 137, 138, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1}}'),
	(21, 1, 139, 140, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1}}'),
	(23, 1, 141, 142, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1}}'),
	(24, 1, 147, 150, 1, 'com_users', 'com_users', '{"core.admin":{"7":1}}'),
	(26, 1, 151, 152, 1, 'com_wrapper', 'com_wrapper', '{}'),
	(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{}'),
	(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
	(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
	(30, 19, 134, 135, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
	(32, 24, 148, 149, 2, 'com_users.category.7', 'Uncategorised', '{}'),
	(33, 1, 153, 154, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
	(34, 1, 155, 156, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
	(35, 1, 157, 158, 1, 'com_tags', 'com_tags', '{}'),
	(36, 1, 159, 160, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
	(37, 1, 161, 162, 1, 'com_ajax', 'com_ajax', '{}'),
	(38, 1, 163, 164, 1, 'com_postinstall', 'com_postinstall', '{}'),
	(39, 18, 60, 61, 2, 'com_modules.module.1', 'Main Menu', '{}'),
	(40, 18, 62, 63, 2, 'com_modules.module.2', 'Login', '{}'),
	(41, 18, 64, 65, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
	(42, 18, 66, 67, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
	(43, 18, 68, 69, 2, 'com_modules.module.8', 'Toolbar', '{}'),
	(44, 18, 70, 71, 2, 'com_modules.module.9', 'Notifications', '{}'),
	(45, 18, 72, 73, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
	(46, 18, 74, 75, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
	(49, 18, 80, 81, 2, 'com_modules.module.15', 'Title', '{}'),
	(50, 18, 82, 83, 2, 'com_modules.module.16', 'Login Form', '{}'),
	(51, 18, 84, 85, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
	(52, 18, 86, 87, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
	(53, 18, 90, 91, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
	(54, 16, 54, 55, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
	(55, 18, 94, 95, 2, 'com_modules.module.87', 'Sample Data', '{}'),
	(56, 8, 20, 37, 2, 'com_content.workflow.1', 'COM_WORKFLOW_BASIC_WORKFLOW', '{}'),
	(57, 56, 21, 22, 3, 'com_content.stage.1', 'COM_WORKFLOW_BASIC_STAGE', '{}'),
	(58, 56, 23, 24, 3, 'com_content.transition.1', 'UNPUBLISH', '{}'),
	(59, 56, 25, 26, 3, 'com_content.transition.2', 'PUBLISH', '{}'),
	(60, 56, 27, 28, 3, 'com_content.transition.3', 'TRASH', '{}'),
	(61, 56, 29, 30, 3, 'com_content.transition.4', 'ARCHIVE', '{}'),
	(62, 56, 31, 32, 3, 'com_content.transition.5', 'FEATURE', '{}'),
	(63, 56, 33, 34, 3, 'com_content.transition.6', 'UNFEATURE', '{}'),
	(64, 56, 35, 36, 3, 'com_content.transition.7', 'PUBLISH_AND_FEATURE', '{}'),
	(65, 1, 143, 144, 1, 'com_privacy', 'com_privacy', '{}'),
	(66, 1, 145, 146, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
	(67, 18, 76, 77, 2, 'com_modules.module.88', 'Latest Actions', '{}'),
	(68, 18, 78, 79, 2, 'com_modules.module.89', 'Privacy Dashboard', '{}'),
	(70, 18, 88, 89, 2, 'com_modules.module.103', 'Site', '{}'),
	(71, 18, 92, 93, 2, 'com_modules.module.104', 'System', '{}'),
	(72, 18, 96, 97, 2, 'com_modules.module.91', 'System Dashboard', '{}'),
	(73, 18, 98, 99, 2, 'com_modules.module.92', 'Content Dashboard', '{}'),
	(74, 18, 100, 101, 2, 'com_modules.module.93', 'Menus Dashboard', '{}'),
	(75, 18, 102, 103, 2, 'com_modules.module.94', 'Components Dashboard', '{}'),
	(76, 18, 104, 105, 2, 'com_modules.module.95', 'Users Dashboard', '{}'),
	(77, 18, 106, 107, 2, 'com_modules.module.99', 'Frontend Link', '{}'),
	(78, 18, 108, 109, 2, 'com_modules.module.100', 'Messages', '{}'),
	(79, 18, 110, 111, 2, 'com_modules.module.101', 'Post Install Messages', '{}'),
	(80, 18, 112, 113, 2, 'com_modules.module.102', 'User Status', '{}'),
	(82, 18, 114, 115, 2, 'com_modules.module.105', '3rd Party', '{}'),
	(83, 18, 116, 117, 2, 'com_modules.module.106', 'Help Dashboard', '{}'),
	(84, 18, 118, 119, 2, 'com_modules.module.107', 'Privacy Requests', '{}'),
	(85, 18, 120, 121, 2, 'com_modules.module.108', 'Privacy Status', '{}'),
	(86, 18, 122, 123, 2, 'com_modules.module.96', 'Popular Articles', '{}'),
	(87, 18, 124, 125, 2, 'com_modules.module.97', 'Recently Added Articles', '{}'),
	(88, 18, 126, 127, 2, 'com_modules.module.98', 'Logged-in Users', '{}'),
	(89, 18, 128, 129, 2, 'com_modules.module.90', 'Login Support', '{}'),
	(90, 1, 165, 172, 1, 'com_scheduler', 'com_scheduler', '{}'),
	(91, 1, 173, 174, 1, 'com_associations', 'com_associations', '{}'),
	(92, 1, 175, 176, 1, 'com_categories', 'com_categories', '{}'),
	(93, 1, 177, 178, 1, 'com_fields', 'com_fields', '{}'),
	(94, 1, 179, 180, 1, 'com_workflow', 'com_workflow', '{}'),
	(95, 1, 181, 182, 1, 'com_guidedtours', 'com_guidedtours', '{}'),
	(96, 18, 130, 131, 2, 'com_modules.module.109', 'Guided Tours', '{}'),
	(97, 90, 166, 167, 2, 'com_scheduler.task.1', 'Rotate Logs', '{}'),
	(98, 90, 168, 169, 2, 'com_scheduler.task.2', 'Session GC', '{}'),
	(99, 90, 170, 171, 2, 'com_scheduler.task.3', 'Update Notification', '{}');

-- Dumping structure for table px_cons.cons_associations
CREATE TABLE IF NOT EXISTS `cons_associations` (
  `id` int NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_associations: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_banners
CREATE TABLE IF NOT EXISTS `cons_banners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL DEFAULT '0',
  `type` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int NOT NULL DEFAULT '0',
  `impmade` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `clickurl` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_banners: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_banner_clients
CREATE TABLE IF NOT EXISTS `cons_banner_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `own_prefix` tinyint NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint NOT NULL DEFAULT '-1',
  `track_clicks` tinyint NOT NULL DEFAULT '-1',
  `track_impressions` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_banner_clients: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_banner_tracks
CREATE TABLE IF NOT EXISTS `cons_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int unsigned NOT NULL,
  `banner_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_banner_tracks: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_categories
CREATE TABLE IF NOT EXISTS `cons_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_categories: ~6 rows (approximately)
INSERT INTO `cons_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
	(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '{}', '', '', '{}', 42, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 0, '*', 1),
	(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":"","workflow_id":"use_default"}', '', '', '{"author":"","robots":""}', 42, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 0, '*', 1),
	(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 0, '*', 1),
	(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 0, '*', 1),
	(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 0, '*', 1),
	(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 0, '*', 1);

-- Dumping structure for table px_cons.cons_contact_details
CREATE TABLE IF NOT EXISTS `cons_contact_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `catid` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_contact_details: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_content
CREATE TABLE IF NOT EXISTS `cons_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `ordering` int NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_content: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_contentitem_tag_map
CREATE TABLE IF NOT EXISTS `cons_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- Dumping data for table px_cons.cons_contentitem_tag_map: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_content_frontpage
CREATE TABLE IF NOT EXISTS `cons_content_frontpage` (
  `content_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_content_frontpage: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_content_rating
CREATE TABLE IF NOT EXISTS `cons_content_rating` (
  `content_id` int NOT NULL DEFAULT '0',
  `rating_sum` int unsigned NOT NULL DEFAULT '0',
  `rating_count` int unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_content_rating: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_content_types
CREATE TABLE IF NOT EXISTS `cons_content_types` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_content_types: ~14 rows (approximately)
INSERT INTO `cons_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
	(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"ArticleTable","prefix":"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_user_id":"created_by","core_created_by_alias":"created_by_alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"asset_id", "note":"note"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits", "ordering"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"} ]}'),
	(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"ContactTable","prefix":"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"} ] }'),
	(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"NewsfeedTable","prefix":"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"} ]}'),
	(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerDate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "asset_id":"null"}, "special":{}}', '', ''),
	(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"TagTable","prefix":"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
	(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"BannerTable","prefix":"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
	(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"ClientTable","prefix":"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
	(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"NoteTable","prefix":"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
	(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"CategoryTable","prefix":"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"Joomla\\\\CMS\\\\Table\\\\","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"tags","targetTable":"#__tags","targetColumn":"id","displayColumn":"title"}]}'),
	(14, 'Module', 'com_modules.module', '{"special":{"dbtable":"#__modules","key":"id","type":"Module","prefix":"Joomla\\\\CMS\\\\Table\\\\"}}', '', '{}', '', '{"formFile":"administrator\\/components\\/com_modules\\/forms\\/module.xml", "hideFields":["checked_out", "checked_out_time", "publish_up", "publish_down"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"checked_out", "targetTable":"#__users", "targetColumn":"id", "displayColumn":"name"}]}');

-- Dumping structure for table px_cons.cons_extensions
CREATE TABLE IF NOT EXISTS `cons_extensions` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL DEFAULT '0' COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '1',
  `protected` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `locked` tinyint NOT NULL DEFAULT '0' COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int DEFAULT '0',
  `state` int DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_extensions: ~251 rows (approximately)
INSERT INTO `cons_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
	(1, 0, 'com_wrapper', 'component', 'com_wrapper', '', '', 1, 1, 1, 0, 1, '{"name":"com_wrapper","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Wrapper","filename":"wrapper"}', '', '', NULL, NULL, 0, 0, NULL),
	(2, 0, 'com_admin', 'component', 'com_admin', '', '', 1, 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Admin"}', '', '', NULL, NULL, 0, 0, NULL),
	(3, 0, 'com_banners', 'component', 'com_banners', '', '', 1, 1, 1, 0, 1, '{"name":"com_banners","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Banners","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', NULL, NULL, 0, 0, NULL),
	(4, 0, 'com_cache', 'component', 'com_cache', '', '', 1, 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Cache"}', '', '', NULL, NULL, 0, 0, NULL),
	(5, 0, 'com_categories', 'component', 'com_categories', '', '', 1, 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"2007-12","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Categories"}', '', '', NULL, NULL, 0, 0, NULL),
	(6, 0, 'com_checkin', 'component', 'com_checkin', '', '', 1, 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Checkin"}', '', '', NULL, NULL, 0, 0, NULL),
	(7, 0, 'com_contact', 'component', 'com_contact', '', '', 1, 1, 1, 0, 1, '{"name":"com_contact","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Contact","filename":"contact"}', '{"contact_layout":"_:default","show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_tags":"1","show_info":"1","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_image":"1","show_misc":"1","image":"","allow_vcard":"0","show_articles":"0","articles_display_num":"10","show_profile":"0","show_user_custom_fields":["-1"],"show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"0","maxLevel":"-1","show_subcat_desc":"1","show_empty_categories":"0","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_subcat_desc_cat":"1","show_empty_categories_cat":"0","show_cat_items_cat":"1","filter_field":"0","show_pagination_limit":"0","show_headings":"1","show_image_heading":"0","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_pagination":"2","show_pagination_results":"1","initial_sort":"ordering","captcha":"","show_email_form":"1","show_email_copy":"0","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_feed_link":"1","sef_ids":1,"custom_fields_enable":"1"}', '', NULL, NULL, 0, 0, NULL),
	(8, 0, 'com_cpanel', 'component', 'com_cpanel', '', '', 1, 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"2007-06","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Cpanel"}', '', '', NULL, NULL, 0, 0, NULL),
	(9, 0, 'com_installer', 'component', 'com_installer', '', '', 1, 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Installer"}', '{"cachetimeout":"6","minimum_stability":"4"}', '', NULL, NULL, 0, 0, NULL),
	(10, 0, 'com_languages', 'component', 'com_languages', '', '', 1, 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Languages"}', '{"administrator":"en-GB","site":"en-GB"}', '', NULL, NULL, 0, 0, NULL),
	(11, 0, 'com_login', 'component', 'com_login', '', '', 1, 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Login"}', '', '', NULL, NULL, 0, 0, NULL),
	(12, 0, 'com_media', 'component', 'com_media', '', '', 1, 1, 0, 1, 1, '{"name":"com_media","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Media","filename":"media"}', '{"upload_maxsize":"10","file_path":"files","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","restrict_uploads_extensions":"bmp,gif,jpg,jpeg,png,webp,avif,ico,mp3,m4a,mp4a,ogg,mp4,mp4v,mpeg,mov,odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv","check_mime":"1","image_extensions":"bmp,gif,jpg,png,jpeg,webp,avif","audio_extensions":"mp3,m4a,mp4a,ogg","video_extensions":"mp4,mp4v,mpeg,mov,webm","doc_extensions":"odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,image\\/webp,image\\/avif,audio\\/ogg,audio\\/mpeg,audio\\/mp4,video\\/mp4,video\\/webm,video\\/mpeg,video\\/quicktime,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip"}', '', NULL, NULL, 0, 0, NULL),
	(13, 0, 'com_menus', 'component', 'com_menus', '', '', 1, 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Menus","filename":"menus"}', '{"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":""}', '', NULL, NULL, 0, 0, NULL),
	(14, 0, 'com_messages', 'component', 'com_messages', '', '', 1, 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Messages"}', '', '', NULL, NULL, 0, 0, NULL),
	(15, 0, 'com_modules', 'component', 'com_modules', '', '', 1, 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Modules","filename":"modules"}', '', '', NULL, NULL, 0, 0, NULL),
	(16, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', '', 1, 1, 1, 0, 1, '{"name":"com_newsfeeds","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Newsfeeds","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1","sef_ids":1}', '', NULL, NULL, 0, 0, NULL),
	(17, 0, 'com_plugins', 'component', 'com_plugins', '', '', 1, 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Plugins"}', '', '', NULL, NULL, 0, 0, NULL),
	(18, 0, 'com_templates', 'component', 'com_templates', '', '', 1, 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Templates"}', '{"template_positions_display":"0","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png,webp","source_formats":"txt,less,ini,xml,js,php,css,scss,sass,json","font_formats":"woff,woff2,ttf,otf","compressed_formats":"zip","difference":"SideBySide"}', '', NULL, NULL, 0, 0, NULL),
	(19, 0, 'com_content', 'component', 'com_content', '', '', 1, 1, 0, 1, 1, '{"name":"com_content","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Content","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","info_block_position":"0","info_block_show_title":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_associations":"0","flags":"1","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_readmore":"1","show_readmore_title":"1","readmore_limit":100,"show_tags":"1","record_hits":"1","show_hits":"1","show_noauth":"0","urls_position":0,"captcha":"","show_publishing_options":"1","show_article_options":"1","show_configure_edit_options":"1","show_permissions":"1","show_associations_edit":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_category_heading_title_text":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":1,"blog_class_leading":"","num_intro_articles":4,"blog_class":"","num_columns":1,"multi_column_order":"0","num_links":4,"show_subcategory_content":"0","link_intro_image":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","display_num":"10","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0","sef_ids":1,"custom_fields_enable":"1","workflow_enabled":"0"}', '', NULL, NULL, 0, 0, NULL),
	(20, 0, 'com_config', 'component', 'com_config', '', '', 1, 1, 0, 1, 1, '{"name":"com_config","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Config","filename":"config"}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', NULL, NULL, 0, 0, NULL),
	(21, 0, 'com_redirect', 'component', 'com_redirect', '', '', 1, 1, 0, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Redirect"}', '', '', NULL, NULL, 0, 0, NULL),
	(22, 0, 'com_users', 'component', 'com_users', '', '', 1, 1, 0, 1, 1, '{"name":"com_users","type":"component","creationDate":"2006-04","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Users","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"0","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"12","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', NULL, NULL, 0, 0, NULL),
	(23, 0, 'com_finder', 'component', 'com_finder', '', '', 1, 1, 0, 0, 1, '{"name":"com_finder","type":"component","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Finder","filename":"finder"}', '{"enabled":"0","show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_autosuggest":"1","show_suggested_query":"1","show_explained_query":"1","show_advanced":"1","show_advanced_tips":"1","expand_advanced":"0","show_date_filters":"0","sort_order":"relevance","sort_direction":"desc","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stem":"1","stemmer":"snowball","enable_logging":"0"}', '', NULL, NULL, 0, 0, NULL),
	(24, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', '', 1, 1, 0, 1, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2012 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.3","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Joomlaupdate"}', '{"updatesource":"default","customurl":"","autoupdate_status":0,"autoupdate":0,"minimum_stability":"4","update_token":"92g8JD286WhRdjst6DsljxLLP52Ds7DGAPbqDlwY"}', '', NULL, NULL, 0, 0, NULL),
	(25, 0, 'com_tags', 'component', 'com_tags', '', '', 1, 1, 1, 0, 1, '{"name":"com_tags","type":"component","creationDate":"2013-12","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Tags","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_description":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', NULL, NULL, 0, 0, NULL),
	(26, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', '', 1, 1, 1, 0, 1, '{"name":"com_contenthistory","type":"component","creationDate":"2013-05","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Contenthistory","filename":"contenthistory"}', '', '', NULL, NULL, 0, 0, NULL),
	(27, 0, 'com_ajax', 'component', 'com_ajax', '', '', 1, 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"2013-08","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","changelogurl":"","filename":"ajax"}', '', '', NULL, NULL, 0, 0, NULL),
	(28, 0, 'com_postinstall', 'component', 'com_postinstall', '', '', 1, 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"2013-09","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Postinstall"}', '', '', NULL, NULL, 0, 0, NULL),
	(29, 0, 'com_fields', 'component', 'com_fields', '', '', 1, 1, 1, 0, 1, '{"name":"com_fields","type":"component","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 0, 0, NULL),
	(30, 0, 'com_associations', 'component', 'com_associations', '', '', 1, 1, 1, 0, 1, '{"name":"com_associations","type":"component","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_ASSOCIATIONS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Associations"}', '', '', NULL, NULL, 0, 0, NULL),
	(31, 0, 'com_privacy', 'component', 'com_privacy', '', '', 1, 1, 1, 0, 1, '{"name":"com_privacy","type":"component","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"COM_PRIVACY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Privacy","filename":"privacy"}', '', '', NULL, NULL, 0, 0, NULL),
	(32, 0, 'com_actionlogs', 'component', 'com_actionlogs', '', '', 1, 1, 1, 0, 1, '{"name":"com_actionlogs","type":"component","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"COM_ACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Actionlogs"}', '{"ip_logging":0,"csv_delimiter":",","loggable_extensions":["com_banners","com_cache","com_categories","com_checkin","com_config","com_contact","com_content","com_fields","com_guidedtours","com_installer","com_media","com_menus","com_messages","com_modules","com_newsfeeds","com_plugins","com_redirect","com_scheduler","com_tags","com_templates","com_users"]}', '', NULL, NULL, 0, 0, NULL),
	(33, 0, 'com_workflow', 'component', 'com_workflow', '', '', 1, 1, 0, 1, 1, '{"name":"com_workflow","type":"component","creationDate":"2017-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_WORKFLOW_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Workflow"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(34, 0, 'com_mails', 'component', 'com_mails', '', '', 1, 1, 1, 1, 1, '{"name":"com_mails","type":"component","creationDate":"2019-01","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"COM_MAILS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Mails"}', '', '', NULL, NULL, 0, 0, NULL),
	(35, 0, 'com_scheduler', 'component', 'com_scheduler', '', '', 1, 1, 1, 0, 1, '{"name":"com_scheduler","type":"component","creationDate":"2021-07","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1.0","description":"COM_SCHEDULER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Scheduler"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(36, 0, 'com_guidedtours', 'component', 'com_guidedtours', '', '', 1, 1, 0, 0, 1, '{"name":"com_guidedtours","type":"component","creationDate":"2023-02","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.3.0","description":"COM_GUIDEDTOURS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Component\\\\Guidedtours"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(37, 0, 'lib_joomla', 'library', 'joomla', '', '', 0, 1, 1, 1, 1, '{"name":"lib_joomla","type":"library","creationDate":"2008-01","author":"Joomla! Project","copyright":"(C) 2008 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","filename":"joomla"}', '', '', NULL, NULL, 0, 0, NULL),
	(38, 0, 'lib_phpass', 'library', 'phpass', '', '', 0, 1, 1, 1, 1, '{"name":"lib_phpass","type":"library","creationDate":"2004-01","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"https:\\/\\/www.openwall.com\\/phpass\\/","version":"0.5.1","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","changelogurl":"","filename":"phpass"}', '', '', NULL, NULL, 0, 0, NULL),
	(39, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_archive","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesArchive","filename":"mod_articles_archive"}', '', '', NULL, NULL, 0, 0, NULL),
	(40, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_latest","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesLatest","filename":"mod_articles_latest"}', '', '', NULL, NULL, 0, 0, NULL),
	(41, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_popular","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesPopular","filename":"mod_articles_popular"}', '', '', NULL, NULL, 0, 0, NULL),
	(42, 0, 'mod_banners', 'module', 'mod_banners', '', '', 0, 1, 1, 0, 1, '{"name":"mod_banners","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Banners","filename":"mod_banners"}', '', '', NULL, NULL, 0, 0, NULL),
	(43, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', '', 0, 1, 1, 0, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Breadcrumbs","filename":"mod_breadcrumbs"}', '', '', NULL, NULL, 0, 0, NULL),
	(44, 0, 'mod_custom', 'module', 'mod_custom', '', '', 0, 1, 1, 0, 1, '{"name":"mod_custom","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Custom","filename":"mod_custom"}', '', '', NULL, NULL, 0, 0, NULL),
	(45, 0, 'mod_feed', 'module', 'mod_feed', '', '', 0, 1, 1, 0, 1, '{"name":"mod_feed","type":"module","creationDate":"2005-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Feed","filename":"mod_feed"}', '', '', NULL, NULL, 0, 0, NULL),
	(46, 0, 'mod_footer', 'module', 'mod_footer', '', '', 0, 1, 1, 0, 1, '{"name":"mod_footer","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Footer","filename":"mod_footer"}', '', '', NULL, NULL, 0, 0, NULL),
	(47, 0, 'mod_login', 'module', 'mod_login', '', '', 0, 1, 1, 0, 1, '{"name":"mod_login","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Login","filename":"mod_login"}', '', '', NULL, NULL, 0, 0, NULL),
	(48, 0, 'mod_menu', 'module', 'mod_menu', '', '', 0, 1, 1, 0, 1, '{"name":"mod_menu","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Menu","filename":"mod_menu"}', '', '', NULL, NULL, 0, 0, NULL),
	(49, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_news","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesNews","filename":"mod_articles_news"}', '', '', NULL, NULL, 0, 0, NULL),
	(50, 0, 'mod_random_image', 'module', 'mod_random_image', '', '', 0, 1, 1, 0, 1, '{"name":"mod_random_image","type":"module","creationDate":"2006-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\RandomImage","filename":"mod_random_image"}', '', '', NULL, NULL, 0, 0, NULL),
	(51, 0, 'mod_related_items', 'module', 'mod_related_items', '', '', 0, 1, 1, 0, 1, '{"name":"mod_related_items","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\RelatedItems","filename":"mod_related_items"}', '', '', NULL, NULL, 0, 0, NULL),
	(52, 0, 'mod_stats', 'module', 'mod_stats', '', '', 0, 1, 1, 0, 1, '{"name":"mod_stats","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Stats","filename":"mod_stats"}', '', '', NULL, NULL, 0, 0, NULL),
	(53, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', '', 0, 1, 1, 0, 1, '{"name":"mod_syndicate","type":"module","creationDate":"2006-05","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Syndicate","filename":"mod_syndicate"}', '', '', NULL, NULL, 0, 0, NULL),
	(54, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', '', 0, 1, 1, 0, 1, '{"name":"mod_users_latest","type":"module","creationDate":"2009-12","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\UsersLatest","filename":"mod_users_latest"}', '', '', NULL, NULL, 0, 0, NULL),
	(55, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', '', 0, 1, 1, 0, 1, '{"name":"mod_whosonline","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Whosonline","filename":"mod_whosonline"}', '', '', NULL, NULL, 0, 0, NULL),
	(56, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', '', 0, 1, 1, 0, 1, '{"name":"mod_wrapper","type":"module","creationDate":"2004-10","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Wrapper","filename":"mod_wrapper"}', '', '', NULL, NULL, 0, 0, NULL),
	(57, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_category","type":"module","creationDate":"2010-02","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesCategory","filename":"mod_articles_category"}', '', '', NULL, NULL, 0, 0, NULL),
	(58, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', '', 0, 1, 1, 0, 1, '{"name":"mod_articles_categories","type":"module","creationDate":"2010-02","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\ArticlesCategories","filename":"mod_articles_categories"}', '', '', NULL, NULL, 0, 0, NULL),
	(59, 0, 'mod_languages', 'module', 'mod_languages', '', '', 0, 1, 1, 0, 1, '{"name":"mod_languages","type":"module","creationDate":"2010-02","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Languages","filename":"mod_languages"}', '', '', NULL, NULL, 0, 0, NULL),
	(60, 0, 'mod_finder', 'module', 'mod_finder', '', '', 0, 1, 0, 0, 1, '{"name":"mod_finder","type":"module","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Finder","filename":"mod_finder"}', '', '', NULL, NULL, 0, 0, NULL),
	(61, 0, 'mod_articles', 'module', 'mod_articles', '', '', 0, 1, 0, 0, 1, '{"name":"mod_articles","type":"module","creationDate":"2024-07","author":"Joomla! Project","copyright":"(C) 2024 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.2.0","description":"MOD_ARTICLES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Articles","filename":"mod_articles"}', '', '', NULL, NULL, 0, 0, NULL),
	(62, 0, 'mod_custom', 'module', 'mod_custom', '', '', 1, 1, 1, 0, 1, '{"name":"mod_custom","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Custom","filename":"mod_custom"}', '', '', NULL, NULL, 0, 0, NULL),
	(63, 0, 'mod_feed', 'module', 'mod_feed', '', '', 1, 1, 1, 0, 1, '{"name":"mod_feed","type":"module","creationDate":"2005-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Feed","filename":"mod_feed"}', '', '', NULL, NULL, 0, 0, NULL),
	(64, 0, 'mod_latest', 'module', 'mod_latest', '', '', 1, 1, 1, 0, 1, '{"name":"mod_latest","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Latest","filename":"mod_latest"}', '', '', NULL, NULL, 0, 0, NULL),
	(65, 0, 'mod_logged', 'module', 'mod_logged', '', '', 1, 1, 1, 0, 1, '{"name":"mod_logged","type":"module","creationDate":"2005-01","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Logged","filename":"mod_logged"}', '', '', NULL, NULL, 0, 0, NULL),
	(66, 0, 'mod_login', 'module', 'mod_login', '', '', 1, 1, 1, 0, 1, '{"name":"mod_login","type":"module","creationDate":"2005-03","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Login","filename":"mod_login"}', '', '', NULL, NULL, 0, 0, NULL),
	(67, 0, 'mod_loginsupport', 'module', 'mod_loginsupport', '', '', 1, 1, 1, 0, 1, '{"name":"mod_loginsupport","type":"module","creationDate":"2019-06","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_LOGINSUPPORT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Loginsupport","filename":"mod_loginsupport"}', '', '', NULL, NULL, 0, 0, NULL),
	(68, 0, 'mod_menu', 'module', 'mod_menu', '', '', 1, 1, 1, 0, 1, '{"name":"mod_menu","type":"module","creationDate":"2006-03","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Menu","filename":"mod_menu"}', '', '', NULL, NULL, 0, 0, NULL),
	(69, 0, 'mod_popular', 'module', 'mod_popular', '', '', 1, 1, 1, 0, 1, '{"name":"mod_popular","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Popular","filename":"mod_popular"}', '', '', NULL, NULL, 0, 0, NULL),
	(70, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', '', 1, 1, 1, 0, 1, '{"name":"mod_quickicon","type":"module","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Quickicon","filename":"mod_quickicon"}', '', '', NULL, NULL, 0, 0, NULL),
	(71, 0, 'mod_frontend', 'module', 'mod_frontend', '', '', 1, 1, 1, 0, 1, '{"name":"mod_frontend","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_FRONTEND_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Frontend","filename":"mod_frontend"}', '', '', NULL, NULL, 0, 0, NULL),
	(72, 0, 'mod_messages', 'module', 'mod_messages', '', '', 1, 1, 1, 0, 1, '{"name":"mod_messages","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Messages","filename":"mod_messages"}', '', '', NULL, NULL, 0, 0, NULL),
	(73, 0, 'mod_post_installation_messages', 'module', 'mod_post_installation_messages', '', '', 1, 1, 1, 0, 1, '{"name":"mod_post_installation_messages","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\PostInstallationMessages","filename":"mod_post_installation_messages"}', '', '', NULL, NULL, 0, 0, NULL),
	(74, 0, 'mod_user', 'module', 'mod_user', '', '', 1, 1, 1, 0, 1, '{"name":"mod_user","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_USER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\User","filename":"mod_user"}', '', '', NULL, NULL, 0, 0, NULL),
	(75, 0, 'mod_title', 'module', 'mod_title', '', '', 1, 1, 1, 0, 1, '{"name":"mod_title","type":"module","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Title","filename":"mod_title"}', '', '', NULL, NULL, 0, 0, NULL),
	(76, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', '', 1, 1, 1, 0, 1, '{"name":"mod_toolbar","type":"module","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Toolbar","filename":"mod_toolbar"}', '', '', NULL, NULL, 0, 0, NULL),
	(77, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', '', 1, 1, 1, 0, 1, '{"name":"mod_multilangstatus","type":"module","creationDate":"2011-09","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\MultilangStatus","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', NULL, NULL, 0, 0, NULL),
	(78, 0, 'mod_version', 'module', 'mod_version', '', '', 1, 1, 1, 0, 1, '{"name":"mod_version","type":"module","creationDate":"2012-01","author":"Joomla! Project","copyright":"(C) 2012 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Version","filename":"mod_version"}', '{"cache":"0"}', '', NULL, NULL, 0, 0, NULL),
	(79, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', '', 1, 1, 1, 0, 1, '{"name":"mod_stats_admin","type":"module","creationDate":"2004-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\StatsAdmin","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', NULL, NULL, 0, 0, NULL),
	(80, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', '', 0, 1, 1, 0, 1, '{"name":"mod_tags_popular","type":"module","creationDate":"2013-01","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\TagsPopular","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', NULL, NULL, 0, 0, NULL),
	(81, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', '', 0, 1, 1, 0, 1, '{"name":"mod_tags_similar","type":"module","creationDate":"2013-01","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\TagsSimilar","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', NULL, NULL, 0, 0, NULL),
	(82, 0, 'mod_sampledata', 'module', 'mod_sampledata', '', '', 1, 1, 1, 0, 1, '{"name":"mod_sampledata","type":"module","creationDate":"2017-07","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"MOD_SAMPLEDATA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Sampledata","filename":"mod_sampledata"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(83, 0, 'mod_latestactions', 'module', 'mod_latestactions', '', '', 1, 1, 1, 0, 1, '{"name":"mod_latestactions","type":"module","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"MOD_LATESTACTIONS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\LatestActions","filename":"mod_latestactions"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(84, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', '', '', 1, 1, 1, 0, 1, '{"name":"mod_privacy_dashboard","type":"module","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\PrivacyDashboard","filename":"mod_privacy_dashboard"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(85, 0, 'mod_submenu', 'module', 'mod_submenu', '', '', 1, 1, 1, 0, 1, '{"name":"mod_submenu","type":"module","creationDate":"2006-02","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\Submenu","filename":"mod_submenu"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(86, 0, 'mod_privacy_status', 'module', 'mod_privacy_status', '', '', 1, 1, 1, 0, 1, '{"name":"mod_privacy_status","type":"module","creationDate":"2019-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"MOD_PRIVACY_STATUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\PrivacyStatus","filename":"mod_privacy_status"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(87, 0, 'mod_guidedtours', 'module', 'mod_guidedtours', '', '', 1, 1, 1, 0, 1, '{"name":"mod_guidedtours","type":"module","creationDate":"2023-02","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.3.0","description":"MOD_GUIDEDTOURS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Module\\\\GuidedTours","filename":"mod_guidedtours"}', '{}', '', NULL, NULL, 0, 0, NULL),
	(88, 0, 'plg_actionlog_joomla', 'plugin', 'joomla', '', 'actionlog', 0, 1, 1, 0, 1, '{"name":"plg_actionlog_joomla","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Actionlog\\\\Joomla","filename":"joomla"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(89, 0, 'plg_api-authentication_basic', 'plugin', 'basic', '', 'api-authentication', 0, 0, 1, 0, 1, '{"name":"plg_api-authentication_basic","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Basic","filename":"basic"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(90, 0, 'plg_api-authentication_token', 'plugin', 'token', '', 'api-authentication', 0, 1, 1, 0, 1, '{"name":"plg_api-authentication_token","type":"plugin","creationDate":"2019-11","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Token","filename":"token"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(91, 0, 'plg_authentication_cookie', 'plugin', 'cookie', '', 'authentication', 0, 1, 1, 0, 1, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"2013-07","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Authentication\\\\Cookie","filename":"cookie"}', '', '', NULL, NULL, 1, 0, NULL),
	(92, 0, 'plg_authentication_joomla', 'plugin', 'joomla', '', 'authentication', 0, 1, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Authentication\\\\Joomla","filename":"joomla"}', '', '', NULL, NULL, 2, 0, NULL),
	(93, 0, 'plg_authentication_ldap', 'plugin', 'ldap', '', 'authentication', 0, 0, 1, 0, 1, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Authentication\\\\Ldap","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', NULL, NULL, 3, 0, NULL),
	(94, 0, 'plg_behaviour_compat6', 'plugin', 'compat6', '', 'behaviour', 0, 0, 1, 0, 1, '{"name":"plg_behaviour_compat6","type":"plugin","creationDate":"2025-04","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.0.0","description":"PLG_COMPAT6_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Behaviour\\\\Compat6","filename":"compat6"}', '{"classes_aliases":"0","legacy_classes":"1"}', '', NULL, NULL, 1, 0, NULL),
	(95, 0, 'plg_behaviour_taggable', 'plugin', 'taggable', '', 'behaviour', 0, 1, 1, 0, 1, '{"name":"plg_behaviour_taggable","type":"plugin","creationDate":"2015-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Behaviour\\\\Taggable","filename":"taggable"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(96, 0, 'plg_behaviour_versionable', 'plugin', 'versionable', '', 'behaviour', 0, 1, 1, 0, 1, '{"name":"plg_behaviour_versionable","type":"plugin","creationDate":"2015-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Behaviour\\\\Versionable","filename":"versionable"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(97, 0, 'plg_captcha_powcaptcha', 'plugin', 'powcaptcha', '', 'captcha', 0, 1, 1, 0, 1, '{"name":"plg_captcha_powcaptcha","type":"plugin","creationDate":"2025-12","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.0","description":"PLG_CAPTCHA_POWCAPTCHA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Captcha\\\\POWCaptcha","filename":"powcaptcha"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(98, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', '', 'content', 0, 0, 1, 0, 1, '{"name":"plg_content_confirmconsent","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\ConfirmConsent","filename":"confirmconsent"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(99, 0, 'plg_content_contact', 'plugin', 'contact', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_contact","type":"plugin","creationDate":"2014-01","author":"Joomla! Project","copyright":"(C) 2014 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Contact","filename":"contact"}', '', '', NULL, NULL, 2, 0, NULL),
	(100, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\EmailCloak","filename":"emailcloak"}', '{"mode":"1"}', '', NULL, NULL, 3, 0, NULL),
	(101, 0, 'plg_content_fields', 'plugin', 'fields', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_fields","type":"plugin","creationDate":"2017-02","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_CONTENT_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 4, 0, NULL),
	(102, 0, 'plg_content_finder', 'plugin', 'finder', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_finder","type":"plugin","creationDate":"2011-12","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Finder","filename":"finder"}', '', '', NULL, NULL, 5, 0, NULL),
	(103, 0, 'plg_content_joomla', 'plugin', 'joomla', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_joomla","type":"plugin","creationDate":"2010-11","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Joomla","filename":"joomla"}', '', '', NULL, NULL, 6, 0, NULL),
	(104, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\LoadModule","filename":"loadmodule"}', '{"style":"xhtml"}', '', NULL, NULL, 7, 0, NULL),
	(105, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\PageBreak","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', NULL, NULL, 8, 0, NULL),
	(106, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', '', 'content', 0, 1, 1, 0, 1, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"2006-01","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\PageNavigation","filename":"pagenavigation"}', '{"position":"1"}', '', NULL, NULL, 9, 0, NULL),
	(107, 0, 'plg_content_vote', 'plugin', 'vote', '', 'content', 0, 0, 1, 0, 1, '{"name":"plg_content_vote","type":"plugin","creationDate":"2005-11","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Content\\\\Vote","filename":"vote"}', '', '', NULL, NULL, 10, 0, NULL),
	(108, 0, 'plg_editors-xtd_article', 'plugin', 'article', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"2009-10","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Article","filename":"article"}', '', '', NULL, NULL, 1, 0, NULL),
	(109, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_contact","type":"plugin","creationDate":"2016-10","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Contact","filename":"contact"}', '', '', NULL, NULL, 2, 0, NULL),
	(110, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_fields","type":"plugin","creationDate":"2017-02","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 3, 0, NULL),
	(111, 0, 'plg_editors-xtd_image', 'plugin', 'image', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"2004-08","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Image","filename":"image"}', '', '', NULL, NULL, 4, 0, NULL),
	(112, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_menu","type":"plugin","creationDate":"2016-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Menu","filename":"menu"}', '', '', NULL, NULL, 5, 0, NULL),
	(113, 0, 'plg_editors-xtd_module', 'plugin', 'module', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"2015-10","author":"Joomla! Project","copyright":"(C) 2015 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\Module","filename":"module"}', '', '', NULL, NULL, 6, 0, NULL),
	(114, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"2004-08","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\PageBreak","filename":"pagebreak"}', '', '', NULL, NULL, 7, 0, NULL),
	(115, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', '', 'editors-xtd', 0, 1, 1, 0, 1, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"2006-03","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\EditorsXtd\\\\ReadMore","filename":"readmore"}', '', '', NULL, NULL, 8, 0, NULL),
	(116, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', '', 'editors', 0, 1, 1, 0, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"https:\\/\\/codemirror.net\\/","version":"6.0.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Editors\\\\CodeMirror","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', NULL, NULL, 1, 0, NULL),
	(117, 0, 'plg_editors_none', 'plugin', 'none', '', 'editors', 0, 1, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"2005-09","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Editors\\\\None","filename":"none"}', '', '', NULL, NULL, 2, 0, NULL),
	(118, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', '', 'editors', 0, 1, 1, 0, 1, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-08","author":"Tiny Technologies, Inc","copyright":"Tiny Technologies, Inc","authorEmail":"N\\/A","authorUrl":"https:\\/\\/www.tiny.cloud","version":"8.6.0","description":"PLG_TINY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Editors\\\\TinyMCE","filename":"tinymce"}', '{"configuration":{"toolbars":{"2":{"toolbar1":["bold","underline","strikethrough","|","undo","redo","|","bullist","numlist","|","pastetext"]},"1":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","blocks","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","code","|","hr","table","|","subscript","superscript","|","charmap","pastetext","preview"]},"0":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","styles","|","blocks","fontfamily","fontsize","|","searchreplace","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","image","|","code","|","forecolor","backcolor","|","fullscreen","|","table","|","subscript","superscript","|","charmap","emoticons","media","hr","ltr","rtl","|","cut","copy","paste","pastetext","|","visualchars","visualblocks","nonbreaking","blockquote","jtemplate","|","print","preview","codesample","insertdatetime","removeformat","language","abbr","abbr_remove"]}},"setoptions":{"2":{"access":["1"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"1":{"access":["6","2"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"0","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"0":{"access":["7","4","8"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""}}},"sets_amount":3,"html_height":"550px","html_width":"100%"}', '', NULL, NULL, 3, 0, NULL),
	(119, 0, 'plg_extension_finder', 'plugin', 'finder', '', 'extension', 0, 1, 1, 0, 1, '{"name":"plg_extension_finder","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_EXTENSION_FINDER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\Finder","filename":"finder"}', '', '', NULL, NULL, 1, 0, NULL),
	(120, 0, 'plg_extension_joomla', 'plugin', 'joomla', '', 'extension', 0, 1, 1, 0, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"2010-05","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\Joomla","filename":"joomla"}', '', '', NULL, NULL, 2, 0, NULL),
	(121, 0, 'plg_extension_joomlaupdate', 'plugin', 'joomlaupdate', '', 'extension', 0, 1, 1, 0, 1, '{"name":"plg_extension_joomlaupdate","type":"plugin","creationDate":"2025-02","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.0.0","description":"PLG_EXTENSION_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\Joomlaupdate","filename":"joomlaupdate"}', '', '', NULL, NULL, 3, 0, NULL),
	(122, 0, 'plg_extension_namespacemap', 'plugin', 'namespacemap', '', 'extension', 0, 1, 1, 1, 1, '{"name":"plg_extension_namespacemap","type":"plugin","creationDate":"2017-05","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Extension\\\\NamespaceMap","filename":"namespacemap"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(123, 0, 'plg_fields_calendar', 'plugin', 'calendar', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_calendar","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CALENDAR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Calendar","filename":"calendar"}', '', '', NULL, NULL, 1, 0, NULL),
	(124, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_checkboxes","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Checkboxes","filename":"checkboxes"}', '', '', NULL, NULL, 2, 0, NULL),
	(125, 0, 'plg_fields_color', 'plugin', 'color', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_color","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_COLOR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Color","filename":"color"}', '', '', NULL, NULL, 3, 0, NULL),
	(126, 0, 'plg_fields_editor', 'plugin', 'editor', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_editor","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_EDITOR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Editor","filename":"editor"}', '{"buttons":0,"width":"100%","height":"250px","filter":"\\\\Joomla\\\\CMS\\\\Component\\\\ComponentHelper::filterText"}', '', NULL, NULL, 4, 0, NULL),
	(127, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_imagelist","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Imagelist","filename":"imagelist"}', '', '', NULL, NULL, 5, 0, NULL),
	(128, 0, 'plg_fields_integer', 'plugin', 'integer', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_integer","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_INTEGER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Integer","filename":"integer"}', '{"multiple":"0","first":"1","last":"100","step":"1"}', '', NULL, NULL, 6, 0, NULL),
	(129, 0, 'plg_fields_list', 'plugin', 'list', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_list","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_LIST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\ListField","filename":"list"}', '', '', NULL, NULL, 7, 0, NULL),
	(130, 0, 'plg_fields_media', 'plugin', 'media', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_media","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_MEDIA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Media","filename":"media"}', '', '', NULL, NULL, 8, 0, NULL),
	(131, 0, 'plg_fields_note', 'plugin', 'note', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_note","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.0.0","description":"PLG_FIELDS_NOTE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Note","filename":"note"}', '{"class":"alert alert-info","heading":"h4"}', '', NULL, NULL, 9, 0, NULL),
	(132, 0, 'plg_fields_number', 'plugin', 'number', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_number","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.0.0","description":"PLG_FIELDS_NUMBER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Number","filename":"number"}', '{"min":"1.0","max":"100.0","step":"0.1","currency":"0","symbol":"","position":"0","decimals":"2"}', '', NULL, NULL, 10, 0, NULL),
	(133, 0, 'plg_fields_radio', 'plugin', 'radio', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_radio","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_RADIO_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Radio","filename":"radio"}', '', '', NULL, NULL, 11, 0, NULL),
	(134, 0, 'plg_fields_sql', 'plugin', 'sql', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_sql","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_SQL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\SQL","filename":"sql"}', '', '', NULL, NULL, 12, 0, NULL),
	(135, 0, 'plg_fields_subform', 'plugin', 'subform', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_subform","type":"plugin","creationDate":"2017-06","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_FIELDS_SUBFORM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Subform","filename":"subform"}', '', '', NULL, NULL, 13, 0, NULL),
	(136, 0, 'plg_fields_text', 'plugin', 'text', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_text","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Text","filename":"text"}', '', '', NULL, NULL, 14, 0, NULL),
	(137, 0, 'plg_fields_textarea', 'plugin', 'textarea', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_textarea","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Textarea","filename":"textarea"}', '{"rows":10,"cols":10,"maxlength":"","filter":"\\\\Joomla\\\\CMS\\\\Component\\\\ComponentHelper::filterText"}', '', NULL, NULL, 15, 0, NULL),
	(138, 0, 'plg_fields_url', 'plugin', 'url', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_url","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_URL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\Url","filename":"url"}', '', '', NULL, NULL, 16, 0, NULL),
	(139, 0, 'plg_fields_user', 'plugin', 'user', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_user","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\User","filename":"user"}', '', '', NULL, NULL, 17, 0, NULL),
	(140, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', '', 'fields', 0, 1, 1, 0, 1, '{"name":"plg_fields_usergrouplist","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Fields\\\\UsergroupList","filename":"usergrouplist"}', '', '', NULL, NULL, 18, 0, NULL),
	(141, 0, 'plg_filesystem_local', 'plugin', 'local', '', 'filesystem', 0, 1, 1, 0, 1, '{"name":"plg_filesystem_local","type":"plugin","creationDate":"2017-04","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Filesystem\\\\Local","filename":"local"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(142, 0, 'plg_finder_categories', 'plugin', 'categories', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_categories","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Categories","filename":"categories"}', '', '', NULL, NULL, 1, 0, NULL),
	(143, 0, 'plg_finder_contacts', 'plugin', 'contacts', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Contacts","filename":"contacts"}', '', '', NULL, NULL, 2, 0, NULL),
	(144, 0, 'plg_finder_content', 'plugin', 'content', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_content","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Content","filename":"content"}', '', '', NULL, NULL, 3, 0, NULL),
	(145, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Newsfeeds","filename":"newsfeeds"}', '', '', NULL, NULL, 4, 0, NULL),
	(146, 0, 'plg_finder_tags', 'plugin', 'tags', '', 'finder', 0, 1, 1, 0, 1, '{"name":"plg_finder_tags","type":"plugin","creationDate":"2013-02","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Finder\\\\Tags","filename":"tags"}', '', '', NULL, NULL, 5, 0, NULL),
	(147, 0, 'plg_installer_folderinstaller', 'plugin', 'folderinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_folderinstaller","type":"plugin","creationDate":"2016-05","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Folder","filename":"folderinstaller"}', '', '', NULL, NULL, 2, 0, NULL),
	(148, 0, 'plg_installer_override', 'plugin', 'override', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_override","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Override","filename":"override"}', '', '', NULL, NULL, 4, 0, NULL),
	(149, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"2016-05","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Package","filename":"packageinstaller"}', '', '', NULL, NULL, 1, 0, NULL),
	(150, 0, 'plg_installer_urlinstaller', 'plugin', 'urlinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_urlinstaller","type":"plugin","creationDate":"2016-05","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Url","filename":"urlinstaller"}', '', '', NULL, NULL, 3, 0, NULL),
	(151, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', '', 'installer', 0, 1, 1, 0, 1, '{"name":"plg_installer_webinstaller","type":"plugin","creationDate":"2017-04","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Installer\\\\Web","filename":"webinstaller"}', '{"tab_position":"1"}', '', NULL, NULL, 5, 0, NULL),
	(152, 0, 'plg_media-action_crop', 'plugin', 'crop', '', 'media-action', 0, 1, 1, 0, 1, '{"name":"plg_media-action_crop","type":"plugin","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\MediaAction\\\\Crop","filename":"crop"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(153, 0, 'plg_media-action_resize', 'plugin', 'resize', '', 'media-action', 0, 1, 1, 0, 1, '{"name":"plg_media-action_resize","type":"plugin","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\MediaAction\\\\Resize","filename":"resize"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(154, 0, 'plg_media-action_rotate', 'plugin', 'rotate', '', 'media-action', 0, 1, 1, 0, 1, '{"name":"plg_media-action_rotate","type":"plugin","creationDate":"2017-01","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\MediaAction\\\\Rotate","filename":"rotate"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(155, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_actionlogs","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Actionlogs","filename":"actionlogs"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(156, 0, 'plg_privacy_consents', 'plugin', 'consents', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_consents","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Consents","filename":"consents"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(157, 0, 'plg_privacy_contact', 'plugin', 'contact', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_contact","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Contact","filename":"contact"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(158, 0, 'plg_privacy_content', 'plugin', 'content', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_content","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Content","filename":"content"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(159, 0, 'plg_privacy_message', 'plugin', 'message', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_message","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\Message","filename":"message"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(160, 0, 'plg_privacy_user', 'plugin', 'user', '', 'privacy', 0, 1, 1, 0, 1, '{"name":"plg_privacy_user","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_PRIVACY_USER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Privacy\\\\User","filename":"user"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(161, 0, 'plg_quickicon_autoupdate', 'plugin', 'autoupdate', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_autoupdate","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.4.0","description":"PLG_QUICKICON_AUTOUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Autoupdate","filename":"autoupdate"}', '', '', NULL, NULL, 1, 0, NULL),
	(162, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Joomlaupdate","filename":"joomlaupdate"}', '', '', NULL, NULL, 2, 0, NULL),
	(163, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Extensionupdate","filename":"extensionupdate"}', '', '', NULL, NULL, 3, 0, NULL),
	(164, 0, 'plg_quickicon_overridecheck', 'plugin', 'overridecheck', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_overridecheck","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\OverrideCheck","filename":"overridecheck"}', '', '', NULL, NULL, 4, 0, NULL),
	(165, 0, 'plg_quickicon_downloadkey', 'plugin', 'downloadkey', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_downloadkey","type":"plugin","creationDate":"2019-10","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Downloadkey","filename":"downloadkey"}', '', '', NULL, NULL, 5, 0, NULL),
	(166, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_privacycheck","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\PrivacyCheck","filename":"privacycheck"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(167, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_phpversioncheck","type":"plugin","creationDate":"2016-08","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\PhpVersionCheck","filename":"phpversioncheck"}', '', '', NULL, NULL, 7, 0, NULL),
	(168, 0, 'plg_quickicon_eos', 'plugin', 'eos', '', 'quickicon', 0, 1, 1, 0, 1, '{"name":"plg_quickicon_eos","type":"plugin","creationDate":"2023-05","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.4.0","description":"PLG_QUICKICON_EOS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Quickicon\\\\Eos","filename":"eos"}', '', '', NULL, NULL, 8, 0, NULL),
	(169, 0, 'plg_sampledata_blog', 'plugin', 'blog', '', 'sampledata', 0, 1, 1, 0, 1, '{"name":"plg_sampledata_blog","type":"plugin","creationDate":"2017-07","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\SampleData\\\\Blog","filename":"blog"}', '', '', NULL, NULL, 1, 0, NULL),
	(170, 0, 'plg_sampledata_multilang', 'plugin', 'multilang', '', 'sampledata', 0, 1, 1, 0, 1, '{"name":"plg_sampledata_multilang","type":"plugin","creationDate":"2018-07","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\SampleData\\\\MultiLanguage","filename":"multilang"}', '', '', NULL, NULL, 2, 0, NULL),
	(171, 0, 'plg_schemaorg_article', 'plugin', 'article', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_article","type":"plugin","creationDate":"2024-01","author":"Joomla! Project","copyright":"(C) 2024 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.1.0","description":"PLG_SCHEMAORG_ARTICLE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Article","filename":"article"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(172, 0, 'plg_schemaorg_blogposting', 'plugin', 'blogposting', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_blogposting","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_BLOGPOSTING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\BlogPosting","filename":"blogposting"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(173, 0, 'plg_schemaorg_book', 'plugin', 'book', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_book","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_BOOK_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Book","filename":"book"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(174, 0, 'plg_schemaorg_event', 'plugin', 'event', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_event","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_EVENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Event","filename":"event"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(175, 0, 'plg_schemaorg_jobposting', 'plugin', 'jobposting', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_jobposting","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_JOBPOSTING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\JobPosting","filename":"jobposting"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(176, 0, 'plg_schemaorg_organization', 'plugin', 'organization', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_organization","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_ORGANIZATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Organization","filename":"organization"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(177, 0, 'plg_schemaorg_person', 'plugin', 'person', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_person","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_PERSON_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Person","filename":"person"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(178, 0, 'plg_schemaorg_recipe', 'plugin', 'recipe', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_recipe","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SCHEMAORG_RECIPE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Recipe","filename":"recipe"}', '{}', '', NULL, NULL, 8, 0, NULL),
	(179, 0, 'plg_schemaorg_custom', 'plugin', 'custom', '', 'schemaorg', 0, 1, 1, 0, 1, '{"name":"plg_schemaorg_custom","type":"plugin","creationDate":"2024-03","author":"Joomla! Project","copyright":"(C) 2024 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.1.0","description":"PLG_SCHEMAORG_CUSTOM_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Schemaorg\\\\Custom","filename":"custom"}', '{}', '', NULL, NULL, 9, 0, NULL),
	(180, 0, 'plg_system_accessibility', 'plugin', 'accessibility', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_accessibility","type":"plugin","creationDate":"2020-02-15","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Accessibility","filename":"accessibility"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(181, 0, 'plg_system_actionlogs', 'plugin', 'actionlogs', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_actionlogs","type":"plugin","creationDate":"2018-05","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\ActionLogs","filename":"actionlogs"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(182, 0, 'plg_system_cache', 'plugin', 'cache', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"2007-02","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Cache","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', NULL, NULL, 3, 0, NULL),
	(183, 0, 'plg_system_debug', 'plugin', 'debug', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_debug","type":"plugin","creationDate":"2006-12","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Debug","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', NULL, NULL, 4, 0, NULL),
	(184, 0, 'plg_system_fields', 'plugin', 'fields', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_fields","type":"plugin","creationDate":"2016-03","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_SYSTEM_FIELDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Fields","filename":"fields"}', '', '', NULL, NULL, 5, 0, NULL),
	(185, 0, 'plg_system_highlight', 'plugin', 'highlight', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_highlight","type":"plugin","creationDate":"2011-08","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Highlight","filename":"highlight"}', '', '', NULL, NULL, 6, 0, NULL),
	(186, 0, 'plg_system_httpheaders', 'plugin', 'httpheaders', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_httpheaders","type":"plugin","creationDate":"2017-10","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Httpheaders","filename":"httpheaders"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(187, 0, 'plg_system_jooa11y', 'plugin', 'jooa11y', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_jooa11y","type":"plugin","creationDate":"2022-02","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Jooa11y","filename":"jooa11y"}', '', '', NULL, NULL, 8, 0, NULL),
	(188, 0, 'plg_system_languagecode', 'plugin', 'languagecode', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"2011-11","author":"Joomla! Project","copyright":"(C) 2011 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\LanguageCode","filename":"languagecode"}', '', '', NULL, NULL, 9, 0, NULL),
	(189, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"2010-07","author":"Joomla! Project","copyright":"(C) 2010 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\LanguageFilter","filename":"languagefilter"}', '', '', NULL, NULL, 10, 0, NULL),
	(190, 0, 'plg_system_log', 'plugin', 'log', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"2007-04","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Log","filename":"log"}', '', '', NULL, NULL, 11, 0, NULL),
	(191, 0, 'plg_system_logout', 'plugin', 'logout', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"2009-04","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Logout","filename":"logout"}', '', '', NULL, NULL, 12, 0, NULL),
	(192, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_privacyconsent","type":"plugin","creationDate":"2018-04","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\PrivacyConsent","filename":"privacyconsent"}', '{}', '', NULL, NULL, 14, 0, NULL),
	(193, 0, 'plg_system_redirect', 'plugin', 'redirect', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"2009-04","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Redirect","filename":"redirect"}', '', '', NULL, NULL, 15, 0, NULL),
	(194, 0, 'plg_system_remember', 'plugin', 'remember', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"2007-04","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Remember","filename":"remember"}', '', '', NULL, NULL, 16, 0, NULL),
	(195, 0, 'plg_system_schedulerunner', 'plugin', 'schedulerunner', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_schedulerunner","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\ScheduleRunner","filename":"schedulerunner"}', '{}', '', NULL, NULL, 17, 0, NULL),
	(196, 0, 'plg_system_schemaorg', 'plugin', 'schemaorg', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_schemaorg","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_SYSTEM_SCHEMAORG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Schemaorg","filename":"schemaorg"}', '{}', '', NULL, NULL, 18, 0, NULL),
	(197, 0, 'plg_system_sef', 'plugin', 'sef', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_sef","type":"plugin","creationDate":"2007-12","author":"Joomla! Project","copyright":"(C) 2007 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Sef","filename":"sef"}', '{"domain":"","indexphp":"1","trailingslash":"0","enforcesuffix":"1","strictrouting":"1"}', '', NULL, NULL, 19, 0, NULL),
	(198, 0, 'plg_system_shortcut', 'plugin', 'shortcut', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_shortcut","type":"plugin","creationDate":"2022-06","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Shortcut","filename":"shortcut"}', '{}', '', NULL, NULL, 21, 0, NULL),
	(199, 0, 'plg_system_skipto', 'plugin', 'skipto', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_skipto","type":"plugin","creationDate":"2020-02","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Skipto","filename":"skipto"}', '{}', '', NULL, NULL, 22, 0, NULL),
	(200, 0, 'plg_system_stats', 'plugin', 'stats', '', 'system', 0, 0, 1, 0, 1, '{"name":"plg_system_stats","type":"plugin","creationDate":"2013-11","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Stats","filename":"stats"}', '{"mode":3,"lastrun":1784787957,"unique_id":"53cb98973c2aeb5441e535c9e23f5138197299de","interval":12}', '', NULL, NULL, 23, 0, NULL),
	(201, 0, 'plg_system_task_notification', 'plugin', 'tasknotification', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_task_notification","type":"plugin","creationDate":"2021-09","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\TaskNotification","filename":"tasknotification"}', '', '', NULL, NULL, 24, 0, NULL),
	(202, 0, 'plg_system_webauthn', 'plugin', 'webauthn', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_webauthn","type":"plugin","creationDate":"2019-07-02","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_SYSTEM_WEBAUTHN_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Webauthn","filename":"webauthn"}', '{}', '', NULL, NULL, 26, 0, NULL),
	(203, 0, 'plg_task_check_files', 'plugin', 'checkfiles', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_check_files","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_TASK_CHECK_FILES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\Checkfiles","filename":"checkfiles"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(204, 0, 'plg_task_deleteactionlogs', 'plugin', 'deleteactionlogs', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_deleteactionlogs","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_DELETEACTIONLOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\DeleteActionLogs","filename":"deleteactionlogs"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(205, 0, 'plg_task_globalcheckin', 'plugin', 'globalcheckin', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_globalcheckin","type":"plugin","creationDate":"2023-06-22","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_GLOBALCHECKIN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\Globalcheckin","filename":"globalcheckin"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(206, 0, 'plg_task_requests', 'plugin', 'requests', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_requests","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_TASK_REQUESTS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\Requests","filename":"requests"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(207, 0, 'plg_task_privacyconsent', 'plugin', 'privacyconsent', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_privacyconsent","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_PRIVACYCONSENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\PrivacyConsent","filename":"privacyconsent"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(208, 0, 'plg_task_rotatelogs', 'plugin', 'rotatelogs', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_rotatelogs","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_ROTATELOGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\RotateLogs","filename":"rotatelogs"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(209, 0, 'plg_task_sessiongc', 'plugin', 'sessiongc', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_sessiongc","type":"plugin","creationDate":"2023-08","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_SESSIONGC_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\SessionGC","filename":"sessiongc"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(210, 0, 'plg_task_site_status', 'plugin', 'sitestatus', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_site_status","type":"plugin","creationDate":"2021-08","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1","description":"PLG_TASK_SITE_STATUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\SiteStatus","filename":"sitestatus"}', '{}', '', NULL, NULL, 8, 0, NULL),
	(211, 0, 'plg_task_updatenotification', 'plugin', 'updatenotification', '', 'task', 0, 1, 1, 0, 1, '{"name":"plg_task_updatenotification","type":"plugin","creationDate":"2023-07","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.0.0","description":"PLG_TASK_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Task\\\\UpdateNotification","filename":"updatenotification"}', '{}', '', NULL, NULL, 9, 0, NULL),
	(212, 0, 'plg_multifactorauth_totp', 'plugin', 'totp', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_totp","type":"plugin","creationDate":"2013-08","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Totp","filename":"totp"}', '', '', NULL, NULL, 1, 0, NULL),
	(213, 0, 'plg_multifactorauth_yubikey', 'plugin', 'yubikey', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_yubikey","type":"plugin","creationDate":"2013-09","author":"Joomla! Project","copyright":"(C) 2013 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Yubikey","filename":"yubikey"}', '', '', NULL, NULL, 2, 0, NULL),
	(214, 0, 'plg_multifactorauth_webauthn', 'plugin', 'webauthn', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_webauthn","type":"plugin","creationDate":"2022-05","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Webauthn","filename":"webauthn"}', '', '', NULL, NULL, 3, 0, NULL),
	(215, 0, 'plg_multifactorauth_email', 'plugin', 'email', '', 'multifactorauth', 0, 1, 1, 0, 1, '{"name":"plg_multifactorauth_email","type":"plugin","creationDate":"2022-05","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Email","filename":"email"}', '', '', NULL, NULL, 4, 0, NULL),
	(216, 0, 'plg_multifactorauth_fixed', 'plugin', 'fixed', '', 'multifactorauth', 0, 0, 1, 0, 1, '{"name":"plg_multifactorauth_fixed","type":"plugin","creationDate":"2022-05","author":"Joomla! Project","copyright":"(C) 2022 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.2.0","description":"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Multifactorauth\\\\Fixed","filename":"fixed"}', '', '', NULL, NULL, 5, 0, NULL),
	(217, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', '', 'user', 0, 0, 1, 0, 1, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"2009-08","author":"Joomla! Project","copyright":"(C) 2009 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\ContactCreator","filename":"contactcreator"}', '{"autowebpage":"","category":"4","autopublish":"0"}', '', NULL, NULL, 1, 0, NULL),
	(218, 0, 'plg_user_joomla', 'plugin', 'joomla', '', 'user', 0, 1, 1, 0, 1, '{"name":"plg_user_joomla","type":"plugin","creationDate":"2006-12","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Joomla","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', NULL, NULL, 2, 0, NULL),
	(219, 0, 'plg_user_profile', 'plugin', 'profile', '', 'user', 0, 0, 1, 0, 1, '{"name":"plg_user_profile","type":"plugin","creationDate":"2008-01","author":"Joomla! Project","copyright":"(C) 2008 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Profile","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', NULL, NULL, 3, 0, NULL),
	(220, 0, 'plg_user_terms', 'plugin', 'terms', '', 'user', 0, 0, 1, 0, 1, '{"name":"plg_user_terms","type":"plugin","creationDate":"2018-06","author":"Joomla! Project","copyright":"(C) 2018 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_USER_TERMS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Terms","filename":"terms"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(221, 0, 'plg_user_token', 'plugin', 'token', '', 'user', 0, 1, 1, 0, 1, '{"name":"plg_user_token","type":"plugin","creationDate":"2019-11","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.9.0","description":"PLG_USER_TOKEN_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\User\\\\Token","filename":"token"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(222, 0, 'plg_webservices_banners', 'plugin', 'banners', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_banners","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Banners","filename":"banners"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(223, 0, 'plg_webservices_config', 'plugin', 'config', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_config","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Config","filename":"config"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(224, 0, 'plg_webservices_contact', 'plugin', 'contact', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_contact","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Contact","filename":"contact"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(225, 0, 'plg_webservices_content', 'plugin', 'content', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_content","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Content","filename":"content"}', '{}', '', NULL, NULL, 4, 0, NULL),
	(226, 0, 'plg_webservices_installer', 'plugin', 'installer', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_installer","type":"plugin","creationDate":"2020-06","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Installer","filename":"installer"}', '{}', '', NULL, NULL, 5, 0, NULL),
	(227, 0, 'plg_webservices_joomlaupdate', 'plugin', 'joomlaupdate', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_joomlaupdate","type":"plugin","creationDate":"2025-03","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"5.4.0","description":"PLG_WEBSERVICES_JOOMLAUPDATE_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Joomlaupdate","filename":"joomlaupdate"}', '{}', '', NULL, NULL, 6, 0, NULL),
	(228, 0, 'plg_webservices_languages', 'plugin', 'languages', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_languages","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Languages","filename":"languages"}', '{}', '', NULL, NULL, 7, 0, NULL),
	(229, 0, 'plg_webservices_media', 'plugin', 'media', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_media","type":"plugin","creationDate":"2021-05","author":"Joomla! Project","copyright":"(C) 2021 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.1.0","description":"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Media","filename":"media"}', '{}', '', NULL, NULL, 8, 0, NULL),
	(230, 0, 'plg_webservices_menus', 'plugin', 'menus', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_menus","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Menus","filename":"menus"}', '{}', '', NULL, NULL, 9, 0, NULL),
	(231, 0, 'plg_webservices_messages', 'plugin', 'messages', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_messages","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Messages","filename":"messages"}', '{}', '', NULL, NULL, 10, 0, NULL),
	(232, 0, 'plg_webservices_modules', 'plugin', 'modules', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_modules","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Modules","filename":"modules"}', '{}', '', NULL, NULL, 11, 0, NULL),
	(233, 0, 'plg_webservices_newsfeeds', 'plugin', 'newsfeeds', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_newsfeeds","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Newsfeeds","filename":"newsfeeds"}', '{}', '', NULL, NULL, 12, 0, NULL),
	(234, 0, 'plg_webservices_plugins', 'plugin', 'plugins', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_plugins","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Plugins","filename":"plugins"}', '{}', '', NULL, NULL, 13, 0, NULL),
	(235, 0, 'plg_webservices_privacy', 'plugin', 'privacy', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_privacy","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Privacy","filename":"privacy"}', '{}', '', NULL, NULL, 14, 0, NULL),
	(236, 0, 'plg_webservices_redirect', 'plugin', 'redirect', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_redirect","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Redirect","filename":"redirect"}', '{}', '', NULL, NULL, 15, 0, NULL),
	(237, 0, 'plg_webservices_tags', 'plugin', 'tags', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_tags","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Tags","filename":"tags"}', '{}', '', NULL, NULL, 16, 0, NULL),
	(238, 0, 'plg_webservices_templates', 'plugin', 'templates', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_templates","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Templates","filename":"templates"}', '{}', '', NULL, NULL, 17, 0, NULL),
	(239, 0, 'plg_webservices_users', 'plugin', 'users', '', 'webservices', 0, 1, 1, 0, 1, '{"name":"plg_webservices_users","type":"plugin","creationDate":"2019-09","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WEBSERVICES_USERS_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\WebServices\\\\Users","filename":"users"}', '{}', '', NULL, NULL, 18, 0, NULL),
	(240, 0, 'plg_workflow_featuring', 'plugin', 'featuring', '', 'workflow', 0, 1, 1, 0, 1, '{"name":"plg_workflow_featuring","type":"plugin","creationDate":"2020-03","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Workflow\\\\Featuring","filename":"featuring"}', '{}', '', NULL, NULL, 1, 0, NULL),
	(241, 0, 'plg_workflow_notification', 'plugin', 'notification', '', 'workflow', 0, 1, 1, 0, 1, '{"name":"plg_workflow_notification","type":"plugin","creationDate":"2020-05","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Workflow\\\\Notification","filename":"notification"}', '{}', '', NULL, NULL, 2, 0, NULL),
	(242, 0, 'plg_workflow_publishing', 'plugin', 'publishing', '', 'workflow', 0, 1, 1, 0, 1, '{"name":"plg_workflow_publishing","type":"plugin","creationDate":"2020-03","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.0.0","description":"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\Workflow\\\\Publishing","filename":"publishing"}', '{}', '', NULL, NULL, 3, 0, NULL),
	(243, 0, 'plg_system_guidedtours', 'plugin', 'guidedtours', '', 'system', 0, 1, 1, 0, 1, '{"name":"plg_system_guidedtours","type":"plugin","creationDate":"2023-02","author":"Joomla! Project","copyright":"(C) 2023 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"4.3.0","description":"PLG_SYSTEM_GUIDEDTOURS_DESCRIPTION","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\GuidedTours","filename":"guidedtours"}', '{}', '', NULL, NULL, 15, 0, NULL),
	(244, 0, 'atum', 'template', 'atum', '', '', 1, 1, 1, 0, 1, '{"name":"atum","type":"template","creationDate":"2016-09","author":"Joomla! Project","copyright":"(C) 2016 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ATUM_XML_DESCRIPTION","group":"","changelogurl":"","inheritable":true,"filename":"templateDetails"}', '', '', NULL, NULL, 0, 0, NULL),
	(245, 0, 'cassiopeia', 'template', 'cassiopeia', '', '', 0, 1, 1, 0, 1, '{"name":"cassiopeia","type":"template","creationDate":"2017-02","author":"Joomla! Project","copyright":"(C) 2017 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_CASSIOPEIA_XML_DESCRIPTION","group":"","changelogurl":"","inheritable":true,"filename":"templateDetails"}', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","colorName":"colors_standard","fluidContainer":"0","stickyHeader":0,"backTop":0}', '', NULL, NULL, 0, 0, NULL),
	(246, 0, 'cassiopeia_extended', 'template', 'cassiopeia_extended', '', '', 0, 1, 1, 0, 1, '{"name":"cassiopeia_extended","type":"template","creationDate":"2025-07","author":"Joomla! Project","copyright":"(C) 2025 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_CASSIOPEIA_EXTENDED_XML_DESCRIPTION","group":"","changelogurl":"","inheritable":false,"parent":"cassiopeia","filename":"templateDetails"}', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","systemFontBody":"","systemFontHeading":"","colorName":"colors_standard","fluidContainer":"0","stickyHeader":"0","backTop":"0","colorSettings":"0","headerbg":"rgb(193, 205, 207)","headercolor":"rgb(23, 23, 23)","bodybg":"rgb(254, 254, 254)","bodycolor":"rgb(23, 23, 23)","linkcolor":"rgb(29, 121, 137)","linkcolorh":"rgb(14, 59, 67)","btnbg":"rgb(206, 60, 55)","btnbgh":"rgb(131, 35, 32)","btncolor":"rgb(254, 254, 254)","btncolorh":"rgb(254, 254, 254)","footerbg":"rgb(29, 121, 137)","footercolor":"rgb(254, 254, 254)","fontSettings":"0","bodysize":"1","h1size":"2","h2size":"1.7","h3size":"1.5"}', '', NULL, NULL, 0, 0, NULL),
	(247, 0, 'files_joomla', 'file', 'joomla', '', '', 0, 1, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"2026-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.2","description":"FILES_JOOMLA_XML_DESCRIPTION","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(248, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', '', 0, 1, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"2026-07","author":"Joomla! Project","copyright":"(C) 2019 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.2.1","description":"en-GB language pack","group":"","changelogurl":"","filename":"pkg_en-GB"}', '', '', NULL, NULL, 0, 0, NULL),
	(249, 248, 'English (en-GB)', 'language', 'en-GB', '', '', 0, 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2026-07","author":"Joomla! Project","copyright":"(C) 2006 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.2","description":"en-GB site language","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(250, 248, 'English (en-GB)', 'language', 'en-GB', '', '', 1, 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2026-07","author":"Joomla! Project","copyright":"(C) 2005 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.2","description":"en-GB administrator language","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(251, 248, 'English (en-GB)', 'language', 'en-GB', '', '', 3, 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2026-07","author":"Joomla! Project","copyright":"(C) 2020 Open Source Matters, Inc.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"6.1.2","description":"en-GB api language","group":"","changelogurl":""}', '', '', NULL, NULL, 0, 0, NULL),
	(252, 0, 'PLG_SYSTEM_PIXEL', 'plugin', 'pixel', '', 'system', 0, 1, 1, 0, 0, '{"name":"PLG_SYSTEM_PIXEL","type":"plugin","creationDate":"May 3rd, 2024","author":"Pixel Framework","copyright":"All Rights Reserved.","authorEmail":"","authorUrl":"","version":"1.1.4","description":"PLG_SYSTEM_PIXEL_DESC","group":"","changelogurl":"","namespace":"Joomla\\\\Plugin\\\\System\\\\Pixel","filename":"pixel"}', '{}', '', NULL, NULL, 0, 0, NULL);

-- Dumping structure for table px_cons.cons_fields
CREATE TABLE IF NOT EXISTS `cons_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `only_use_in_subform` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_fields: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_fields_categories
CREATE TABLE IF NOT EXISTS `cons_fields_categories` (
  `field_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_fields_categories: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_fields_groups
CREATE TABLE IF NOT EXISTS `cons_fields_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `access` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_fields_groups: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_fields_values
CREATE TABLE IF NOT EXISTS `cons_fields_values` (
  `field_id` int unsigned NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_fields_values: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_filters
CREATE TABLE IF NOT EXISTS `cons_finder_filters` (
  `filter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `params` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_filters: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_links
CREATE TABLE IF NOT EXISTS `cons_finder_links` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '1',
  `state` int NOT NULL DEFAULT '1',
  `access` int NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int NOT NULL,
  `object` mediumblob,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_language` (`language`),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_links: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_links_terms
CREATE TABLE IF NOT EXISTS `cons_finder_links_terms` (
  `link_id` int unsigned NOT NULL,
  `term_id` int unsigned NOT NULL,
  `weight` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_links_terms: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_logging
CREATE TABLE IF NOT EXISTS `cons_finder_logging` (
  `searchterm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int NOT NULL DEFAULT '1',
  `results` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5sum`),
  KEY `searchterm` (`searchterm`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_logging: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_taxonomy
CREATE TABLE IF NOT EXISTS `cons_finder_taxonomy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `access` tinyint unsigned NOT NULL DEFAULT '1',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_level` (`level`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_taxonomy: ~0 rows (approximately)
INSERT INTO `cons_finder_taxonomy` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `state`, `access`, `language`) VALUES
	(1, 0, 0, 1, 0, '', 'ROOT', 'root', 1, 1, '*');

-- Dumping structure for table px_cons.cons_finder_taxonomy_map
CREATE TABLE IF NOT EXISTS `cons_finder_taxonomy_map` (
  `link_id` int unsigned NOT NULL,
  `node_id` int unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_taxonomy_map: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_terms
CREATE TABLE IF NOT EXISTS `cons_finder_terms` (
  `term_id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_stem` (`stem`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_terms: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_finder_terms_common
CREATE TABLE IF NOT EXISTS `cons_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_terms_common: ~174 rows (approximately)
INSERT INTO `cons_finder_terms_common` (`term`, `language`, `custom`) VALUES
	('a', 'en', 0),
	('about', 'en', 0),
	('above', 'en', 0),
	('after', 'en', 0),
	('again', 'en', 0),
	('against', 'en', 0),
	('all', 'en', 0),
	('am', 'en', 0),
	('an', 'en', 0),
	('and', 'en', 0),
	('any', 'en', 0),
	('are', 'en', 0),
	('aren\'t', 'en', 0),
	('as', 'en', 0),
	('at', 'en', 0),
	('be', 'en', 0),
	('because', 'en', 0),
	('been', 'en', 0),
	('before', 'en', 0),
	('being', 'en', 0),
	('below', 'en', 0),
	('between', 'en', 0),
	('both', 'en', 0),
	('but', 'en', 0),
	('by', 'en', 0),
	('can\'t', 'en', 0),
	('cannot', 'en', 0),
	('could', 'en', 0),
	('couldn\'t', 'en', 0),
	('did', 'en', 0),
	('didn\'t', 'en', 0),
	('do', 'en', 0),
	('does', 'en', 0),
	('doesn\'t', 'en', 0),
	('doing', 'en', 0),
	('don\'t', 'en', 0),
	('down', 'en', 0),
	('during', 'en', 0),
	('each', 'en', 0),
	('few', 'en', 0),
	('for', 'en', 0),
	('from', 'en', 0),
	('further', 'en', 0),
	('had', 'en', 0),
	('hadn\'t', 'en', 0),
	('has', 'en', 0),
	('hasn\'t', 'en', 0),
	('have', 'en', 0),
	('haven\'t', 'en', 0),
	('having', 'en', 0),
	('he', 'en', 0),
	('he\'d', 'en', 0),
	('he\'ll', 'en', 0),
	('he\'s', 'en', 0),
	('her', 'en', 0),
	('here', 'en', 0),
	('here\'s', 'en', 0),
	('hers', 'en', 0),
	('herself', 'en', 0),
	('him', 'en', 0),
	('himself', 'en', 0),
	('his', 'en', 0),
	('how', 'en', 0),
	('how\'s', 'en', 0),
	('i', 'en', 0),
	('i\'d', 'en', 0),
	('i\'ll', 'en', 0),
	('i\'m', 'en', 0),
	('i\'ve', 'en', 0),
	('if', 'en', 0),
	('in', 'en', 0),
	('into', 'en', 0),
	('is', 'en', 0),
	('isn\'t', 'en', 0),
	('it', 'en', 0),
	('it\'s', 'en', 0),
	('its', 'en', 0),
	('itself', 'en', 0),
	('let\'s', 'en', 0),
	('me', 'en', 0),
	('more', 'en', 0),
	('most', 'en', 0),
	('mustn\'t', 'en', 0),
	('my', 'en', 0),
	('myself', 'en', 0),
	('no', 'en', 0),
	('nor', 'en', 0),
	('not', 'en', 0),
	('of', 'en', 0),
	('off', 'en', 0),
	('on', 'en', 0),
	('once', 'en', 0),
	('only', 'en', 0),
	('or', 'en', 0),
	('other', 'en', 0),
	('ought', 'en', 0),
	('our', 'en', 0),
	('ours', 'en', 0),
	('ourselves', 'en', 0),
	('out', 'en', 0),
	('over', 'en', 0),
	('own', 'en', 0),
	('same', 'en', 0),
	('shan\'t', 'en', 0),
	('she', 'en', 0),
	('she\'d', 'en', 0),
	('she\'ll', 'en', 0),
	('she\'s', 'en', 0),
	('should', 'en', 0),
	('shouldn\'t', 'en', 0),
	('so', 'en', 0),
	('some', 'en', 0),
	('such', 'en', 0),
	('than', 'en', 0),
	('that', 'en', 0),
	('that\'s', 'en', 0),
	('the', 'en', 0),
	('their', 'en', 0),
	('theirs', 'en', 0),
	('them', 'en', 0),
	('themselves', 'en', 0),
	('then', 'en', 0),
	('there', 'en', 0),
	('there\'s', 'en', 0),
	('these', 'en', 0),
	('they', 'en', 0),
	('they\'d', 'en', 0),
	('they\'ll', 'en', 0),
	('they\'re', 'en', 0),
	('they\'ve', 'en', 0),
	('this', 'en', 0),
	('those', 'en', 0),
	('through', 'en', 0),
	('to', 'en', 0),
	('too', 'en', 0),
	('under', 'en', 0),
	('until', 'en', 0),
	('up', 'en', 0),
	('very', 'en', 0),
	('was', 'en', 0),
	('wasn\'t', 'en', 0),
	('we', 'en', 0),
	('we\'d', 'en', 0),
	('we\'ll', 'en', 0),
	('we\'re', 'en', 0),
	('we\'ve', 'en', 0),
	('were', 'en', 0),
	('weren\'t', 'en', 0),
	('what', 'en', 0),
	('what\'s', 'en', 0),
	('when', 'en', 0),
	('when\'s', 'en', 0),
	('where', 'en', 0),
	('where\'s', 'en', 0),
	('which', 'en', 0),
	('while', 'en', 0),
	('who', 'en', 0),
	('who\'s', 'en', 0),
	('whom', 'en', 0),
	('why', 'en', 0),
	('why\'s', 'en', 0),
	('with', 'en', 0),
	('won\'t', 'en', 0),
	('would', 'en', 0),
	('wouldn\'t', 'en', 0),
	('you', 'en', 0),
	('you\'d', 'en', 0),
	('you\'ll', 'en', 0),
	('you\'re', 'en', 0),
	('you\'ve', 'en', 0),
	('your', 'en', 0),
	('yours', 'en', 0),
	('yourself', 'en', 0),
	('yourselves', 'en', 0);

-- Dumping structure for table px_cons.cons_finder_tokens
CREATE TABLE IF NOT EXISTS `cons_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_stem` (`stem`),
  KEY `idx_context` (`context`),
  KEY `idx_language` (`language`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_tokens: 0 rows
/*!40000 ALTER TABLE `cons_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `cons_finder_tokens` ENABLE KEYS */;

-- Dumping structure for table px_cons.cons_finder_tokens_aggregate
CREATE TABLE IF NOT EXISTS `cons_finder_tokens_aggregate` (
  `term_id` int unsigned NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL DEFAULT '0',
  `context` tinyint unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL DEFAULT '0',
  `total_weight` float unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_tokens_aggregate: 0 rows
/*!40000 ALTER TABLE `cons_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cons_finder_tokens_aggregate` ENABLE KEYS */;

-- Dumping structure for table px_cons.cons_finder_types
CREATE TABLE IF NOT EXISTS `cons_finder_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_finder_types: ~5 rows (approximately)
INSERT INTO `cons_finder_types` (`id`, `title`, `mime`) VALUES
	(1, 'Category', ''),
	(2, 'Contact', ''),
	(3, 'Article', ''),
	(4, 'News Feed', ''),
	(5, 'Tag', '');

-- Dumping structure for table px_cons.cons_guidedtours
CREATE TABLE IF NOT EXISTS `cons_guidedtours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uid` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `access` int unsigned NOT NULL DEFAULT '0',
  `autostart` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`published`),
  KEY `idx_language` (`language`),
  KEY `idx_uid` (`uid`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_guidedtours: ~12 rows (approximately)
INSERT INTO `cons_guidedtours` (`id`, `title`, `uid`, `description`, `ordering`, `extensions`, `url`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`, `published`, `language`, `note`, `access`, `autostart`) VALUES
	(1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_TITLE', 'joomla-guidedtours', 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_DESCRIPTION', 1, '["com_guidedtours"]', 'administrator/index.php?option=com_guidedtours&view=tours', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_TITLE', 'joomla-guidedtoursteps', 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_DESCRIPTION', 2, '["com_guidedtours"]', 'administrator/index.php?option=com_guidedtours&view=tours', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_TITLE', 'joomla-articles', 'COM_GUIDEDTOURS_TOUR_ARTICLES_DESCRIPTION', 3, '["com_content","com_categories"]', 'administrator/index.php?option=com_content&view=articles', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_TITLE', 'joomla-categories', 'COM_GUIDEDTOURS_TOUR_CATEGORIES_DESCRIPTION', 4, '["com_content","com_categories"]', 'administrator/index.php?option=com_categories&view=categories&extension=com_content', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(5, 'COM_GUIDEDTOURS_TOUR_MENUS_TITLE', 'joomla-menus', 'COM_GUIDEDTOURS_TOUR_MENUS_DESCRIPTION', 5, '["com_menus"]', 'administrator/index.php?option=com_menus&view=menus', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(6, 'COM_GUIDEDTOURS_TOUR_TAGS_TITLE', 'joomla-tags', 'COM_GUIDEDTOURS_TOUR_TAGS_DESCRIPTION', 6, '["com_tags"]', 'administrator/index.php?option=com_tags&view=tags', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(7, 'COM_GUIDEDTOURS_TOUR_BANNERS_TITLE', 'joomla-banners', 'COM_GUIDEDTOURS_TOUR_BANNERS_DESCRIPTION', 7, '["com_banners"]', 'administrator/index.php?option=com_banners&view=banners', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_TITLE', 'joomla-contacts', 'COM_GUIDEDTOURS_TOUR_CONTACTS_DESCRIPTION', 8, '["com_contact"]', 'administrator/index.php?option=com_contact&view=contacts', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_TITLE', 'joomla-newsfeeds', 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_DESCRIPTION', 9, '["com_newsfeeds"]', 'administrator/index.php?option=com_newsfeeds&view=newsfeeds', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_TITLE', 'joomla-smartsearch', 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_DESCRIPTION', 10, '["com_finder"]', 'administrator/index.php?option=com_finder&view=filters', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(11, 'COM_GUIDEDTOURS_TOUR_USERS_TITLE', 'joomla-users', 'COM_GUIDEDTOURS_TOUR_USERS_DESCRIPTION', 11, '["com_users"]', 'administrator/index.php?option=com_users&view=users', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 0),
	(12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_TITLE', 'joomla-welcome', 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_DESCRIPTION', 12, '["com_cpanel"]', 'administrator/index.php', '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL, 1, '*', '', 1, 1);

-- Dumping structure for table px_cons.cons_guidedtour_steps
CREATE TABLE IF NOT EXISTS `cons_guidedtour_steps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tour_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `interactive_type` int NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_tour` (`tour_id`),
  KEY `idx_state` (`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_guidedtour_steps: ~117 rows (approximately)
INSERT INTO `cons_guidedtour_steps` (`id`, `tour_id`, `title`, `published`, `description`, `ordering`, `position`, `target`, `type`, `interactive_type`, `url`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`, `language`, `note`, `params`) VALUES
	(1, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_DESCRIPTION', 1, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_guidedtours&view=tours', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(2, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_DESCRIPTION', 2, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(3, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_DESCRIPTION', 3, 'top', '#jform_url', 2, 2, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(4, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_DESCRIPTION', 4, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(5, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_DESCRIPTION', 5, 'top', 'joomla-field-fancy-select .choices', 2, 3, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(6, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_AUTOSTART_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_AUTOSTART_DESCRIPTION', 6, 'bottom', '#jform_autostart0', 2, 3, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(7, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_DESCRIPTION', 7, 'top', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(8, 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_DESCRIPTION', 8, 'bottom', '', 0, 1, 'administrator/index.php?option=com_guidedtours&view=tour&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(9, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_DESCRIPTION', 9, 'top', '#toursList tbody tr:nth-last-of-type(1) td:nth-of-type(5) .btn', 2, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(10, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_DESCRIPTION', 10, 'bottom', '.button-new', 2, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(11, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_DESCRIPTION', 11, 'bottom', '#jform_title', 2, 2, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(12, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_DESCRIPTION', 12, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(13, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_DESCRIPTION', 13, 'bottom', '#jform_published', 2, 3, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(14, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_DESCRIPTION', 14, 'top', '#jform_position', 2, 3, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(15, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_DESCRIPTION', 15, 'top', '#jform_target', 2, 3, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(16, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_DESCRIPTION', 16, 'top', '#jform_type', 2, 3, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(17, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_DESCRIPTION', 17, 'bottom', '#save-group-children-save .button-save', 2, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(18, 2, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_DESCRIPTION', 18, 'bottom', '', 0, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(19, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_DESCRIPTION', 19, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_content&view=articles', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(20, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_DESCRIPTION', 20, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(21, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_DESCRIPTION', 21, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(22, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_DESCRIPTION', 22, 'bottom', '#jform_articletext,#jform_articletext_ifr', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(23, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_DESCRIPTION', 23, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(24, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_DESCRIPTION', 24, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(25, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_DESCRIPTION', 25, 'bottom', '#jform_featured0', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(26, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_DESCRIPTION', 26, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(27, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_DESCRIPTION', 27, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(28, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_DESCRIPTION', 28, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(29, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_DESCRIPTION', 29, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(30, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_DESCRIPTION', 30, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(31, 3, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_DESCRIPTION', 31, 'bottom', '', 0, 1, 'administrator/index.php?option=com_content&view=article&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(32, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_DESCRIPTION', 32, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_categories&view=categories&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(33, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_DESCRIPTION', 33, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(34, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_DESCRIPTION', 34, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(35, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_DESCRIPTION', 35, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(36, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_DESCRIPTION', 36, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(37, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_DESCRIPTION', 37, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(38, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_DESCRIPTION', 38, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(39, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_DESCRIPTION', 39, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(40, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_DESCRIPTION', 40, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(41, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_DESCRIPTION', 41, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(42, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_DESCRIPTION', 42, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(43, 4, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_DESCRIPTION', 43, 'bottom', '', 0, 1, 'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(44, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_DESCRIPTION', 44, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_menus&view=menus', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(45, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_DESCRIPTION', 45, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(46, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_DESCRIPTION', 46, 'top', '#jform_menutype', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(47, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_DESCRIPTION', 47, 'top', '#jform_menudescription', 2, 2, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(48, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_DESCRIPTION', 48, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(49, 5, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_DESCRIPTION', 49, 'bottom', '', 0, 1, 'administrator/index.php?option=com_menus&view=menu&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(50, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_DESCRIPTION', 50, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_tags&view=tags', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(51, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_DESCRIPTION', 51, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(52, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_DESCRIPTION', 52, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(53, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_DESCRIPTION', 53, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(54, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_DESCRIPTION', 54, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(55, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_DESCRIPTION', 55, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(56, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_DESCRIPTION', 56, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(57, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_DESCRIPTION', 57, 'top', '#jform_note', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(58, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_DESCRIPTION', 58, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(59, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_DESCRIPTION', 59, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(60, 6, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_DESCRIPTION', 60, 'bottom', '', 0, 1, 'administrator/index.php?option=com_tags&view=tag&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(61, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_DESCRIPTION', 61, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_banners&view=banners', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(62, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_DESCRIPTION', 62, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(63, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_DESCRIPTION', 63, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(64, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_DESCRIPTION', 64, 'bottom', '.col-lg-9', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(65, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_DESCRIPTION', 65, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(66, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_DESCRIPTION', 66, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(67, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_DESCRIPTION', 67, 'bottom', '#jform_sticky1', 2, 3, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(68, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_DESCRIPTION', 68, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(69, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_DESCRIPTION', 69, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(70, 7, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_DESCRIPTION', 70, 'bottom', '', 0, 1, 'administrator/index.php?option=com_banners&view=banner&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(71, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_DESCRIPTION', 71, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_contact&view=contacts', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(72, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_DESCRIPTION', 72, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(73, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_DESCRIPTION', 73, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(74, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_DESCRIPTION', 74, 'bottom', '.col-lg-9', 0, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(75, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_DESCRIPTION', 75, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(76, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_DESCRIPTION', 76, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(77, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_DESCRIPTION', 77, 'bottom', '#jform_featured0', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(78, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_DESCRIPTION', 78, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(79, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_DESCRIPTION', 79, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(80, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_DESCRIPTION', 80, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(81, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_DESCRIPTION', 81, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(82, 8, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_DESCRIPTION', 82, 'bottom', '', 0, 1, 'administrator/index.php?option=com_contact&view=contact&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(83, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_DESCRIPTION', 83, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeeds', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(84, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_DESCRIPTION', 84, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(85, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_DESCRIPTION', 85, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(86, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_DESCRIPTION', 86, 'bottom', '#jform_link', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(87, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_DESCRIPTION', 87, 'bottom', '#jform_description,#jform_description_ifr', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(88, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_DESCRIPTION', 88, 'bottom', '#jform_published', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(89, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_DESCRIPTION', 89, 'top', 'joomla-field-fancy-select .choices[data-type=select-one]', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(90, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_DESCRIPTION', 90, 'bottom', '#jform_access', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(91, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_DESCRIPTION', 91, 'top', 'joomla-field-fancy-select .choices[data-type=select-multiple]', 2, 3, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(92, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_DESCRIPTION', 92, 'top', '#jform_version_note', 2, 2, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(93, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_DESCRIPTION', 93, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(94, 9, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_DESCRIPTION', 94, 'bottom', '', 0, 1, 'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(95, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_DESCRIPTION', 95, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_finder&view=filters', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(96, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_DESCRIPTION', 96, 'bottom', '#jform_title', 2, 2, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(97, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_DESCRIPTION', 97, 'bottom', '#jform_alias', 2, 2, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(98, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_DESCRIPTION', 98, 'bottom', '.col-lg-9', 0, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(99, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_DESCRIPTION', 99, 'bottom', '#jform_state', 2, 3, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(100, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_DESCRIPTION', 100, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(101, 10, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_DESCRIPTION', 101, 'bottom', '', 0, 1, 'administrator/index.php?option=com_finder&view=filter&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(102, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_DESCRIPTION', 102, 'bottom', '.button-new', 2, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(103, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_DESCRIPTION', 103, 'bottom', '#jform_name', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(104, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_DESCRIPTION', 104, 'bottom', '#jform_username', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(105, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_DESCRIPTION', 105, 'bottom', '#jform_password', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(106, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_DESCRIPTION', 106, 'bottom', '#jform_password2', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(107, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_DESCRIPTION', 107, 'bottom', '#jform_email', 2, 2, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(108, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_DESCRIPTION', 108, 'top', '#jform_sendEmail0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(109, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_DESCRIPTION', 109, 'top', '#jform_block0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(110, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_DESCRIPTION', 110, 'top', '#jform_requireReset0', 2, 3, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(111, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_DESCRIPTION', 111, 'bottom', '#save-group-children-save .button-save', 2, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(112, 11, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_DESCRIPTION', 112, 'bottom', '', 0, 1, 'administrator/index.php?option=com_users&view=user&layout=edit', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(113, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_MENUS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_MENUS_DESCRIPTION', 113, 'right', '#sidebarmenu', 0, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(114, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_QUICKACCESS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_QUICKACCESS_DESCRIPTION', 114, 'center', '', 0, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(115, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_NOTIFICATIONS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_NOTIFICATIONS_DESCRIPTION', 115, 'left', '.quickicons-for-update_quickicon .card', 0, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(116, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_TOPBAR_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_TOPBAR_DESCRIPTION', 116, 'bottom', '#header', 0, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL),
	(117, 12, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_FINALWORDS_TITLE', 1, 'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_FINALWORDS_DESCRIPTION', 117, 'right', '#sidebarmenu nav > ul:first-of-type > li:last-child', 0, 1, '', '2026-07-23 06:25:05', 42, '2026-07-23 06:25:05', 42, NULL, NULL, '*', '', NULL);

-- Dumping structure for table px_cons.cons_history
CREATE TABLE IF NOT EXISTS `cons_history` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int unsigned NOT NULL DEFAULT '0',
  `character_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  `is_current` tinyint NOT NULL DEFAULT '0',
  `is_legacy` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_history: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_languages
CREATE TABLE IF NOT EXISTS `cons_languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_languages: ~0 rows (approximately)
INSERT INTO `cons_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
	(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- Dumping structure for table px_cons.cons_mail_templates
CREATE TABLE IF NOT EXISTS `cons_mail_templates` (
  `template_id` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlbody` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`template_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_mail_templates: ~33 rows (approximately)
INSERT INTO `cons_mail_templates` (`template_id`, `extension`, `language`, `subject`, `body`, `htmlbody`, `attachments`, `params`) VALUES
	('com_actionlogs.notification', 'com_actionlogs', '', 'COM_ACTIONLOGS_EMAIL_SUBJECT', 'COM_ACTIONLOGS_EMAIL_BODY', 'COM_ACTIONLOGS_EMAIL_HTMLBODY', '', '{"tags":["messages","message","date","extension","username","ip_address"]}'),
	('com_config.test_mail', 'com_config', '', 'COM_CONFIG_SENDMAIL_SUBJECT', 'COM_CONFIG_SENDMAIL_BODY', '', '', '{"tags":["sitename","method"]}'),
	('com_contact.mail', 'com_contact', '', 'COM_CONTACT_ENQUIRY_SUBJECT', 'COM_CONTACT_ENQUIRY_TEXT', '', '', '{"tags":["sitename","name","email","subject","body","url","customfields"]}'),
	('com_contact.mail.copy', 'com_contact', '', 'COM_CONTACT_COPYSUBJECT_OF', 'COM_CONTACT_COPYTEXT_OF', '', '', '{"tags":["sitename","name","email","subject","body","url","customfields","contactname"]}'),
	('com_joomlaupdate.update.failed', 'com_joomlaupdate', '', 'COM_JOOMLAUPDATE_UPDATE_FAILED_MAIL_SUBJECT', 'COM_JOOMLAUPDATE_UPDATE_FAILED_MAIL_BODY', '', '', '{"tags":["newversion","oldversion","sitename","url"]}'),
	('com_joomlaupdate.update.success', 'com_joomlaupdate', '', 'COM_JOOMLAUPDATE_UPDATE_SUCCESS_MAIL_SUBJECT', 'COM_JOOMLAUPDATE_UPDATE_SUCCESS_MAIL_BODY', '', '', '{"tags":["newversion","oldversion","sitename","url"]}'),
	('com_messages.new_message', 'com_messages', '', 'COM_MESSAGES_NEW_MESSAGE', 'COM_MESSAGES_NEW_MESSAGE_BODY', '', '', '{"tags":["subject","message","fromname","sitename","siteurl","fromemail","toname","toemail"]}'),
	('com_privacy.notification.admin.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.notification.admin.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.notification.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.notification.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('com_privacy.userdataexport', 'com_privacy', '', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY', '', '', '{"tags":["sitename","url"]}'),
	('com_users.massmail.mail', 'com_users', '', 'COM_USERS_MASSMAIL_MAIL_SUBJECT', 'COM_USERS_MASSMAIL_MAIL_BODY', '', '', '{"tags":["subject","body","subjectprefix","bodysuffix"]}'),
	('com_users.password_reset', 'com_users', '', 'COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT', 'COM_USERS_EMAIL_PASSWORD_RESET_BODY', '', '', '{"tags":["name","email","sitename","link_text","link_html","token"]}'),
	('com_users.registration.admin.new_notification', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY', '', '', '{"tags":["name","sitename","siteurl","username"]}'),
	('com_users.registration.admin.verification_request', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","email","username","activate"]}'),
	('com_users.registration.user.admin_activated', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","siteurl","username"]}'),
	('com_users.registration.user.admin_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW', '', '', '{"tags":["name","sitename","activate","siteurl","username"]}'),
	('com_users.registration.user.admin_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","activate","siteurl","username","password_clear"]}'),
	('com_users.registration.user.registration_mail', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY_NOPW', '', '', '{"tags":["name","sitename","siteurl","username"]}'),
	('com_users.registration.user.registration_mail_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY', '', '', '{"tags":["name","sitename","siteurl","username","password_clear"]}'),
	('com_users.registration.user.self_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW', '', '', '{"tags":["name","sitename","activate","siteurl","username"]}'),
	('com_users.registration.user.self_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY', '', '', '{"tags":["name","sitename","activate","siteurl","username","password_clear"]}'),
	('com_users.reminder', 'com_users', '', 'COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT', 'COM_USERS_EMAIL_USERNAME_REMINDER_BODY', '', '', '{"tags":["name","username","sitename","email","link_text","link_html"]}'),
	('plg_content_joomla.newarticle', 'plg_content_joomla', '', 'PLG_CONTENT_JOOMLA_NEW_ARTICLE_SUBJECT', 'PLG_CONTENT_JOOMLA_NEW_ARTICLE_BODY', '', '', '{"tags":["sitename","name","email","title","url"]}'),
	('plg_multifactorauth_email.mail', 'plg_multifactorauth_email', '', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY', '', '', '{"tags":["code","sitename","siteurl","username","email","fullname"]}'),
	('plg_system_tasknotification.failure_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY', '', '', '{"tags": ["task_id", "task_title", "exit_code", "exec_data_time", "task_output"]}'),
	('plg_system_tasknotification.fatal_recovery_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY', '', '', '{"tags": ["task_id", "task_title"]}'),
	('plg_system_tasknotification.orphan_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY', '', '', '{"tags": ["task_id", "task_title"]}'),
	('plg_system_tasknotification.success_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY', '', '', '{"tags":["task_id", "task_title", "exec_data_time", "task_output"]}'),
	('plg_task_privacyconsent.request.reminder', 'plg_task_privacyconsent', '', 'PLG_TASK_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT', 'PLG_TASK_PRIVACYCONSENT_EMAIL_REMIND_BODY', '', '', '{"tags":["sitename","url","tokenurl","formurl","token"]}'),
	('plg_task_updatenotification.mail', 'plg_task_updatenotification', '', 'PLG_TASK_UPDATENOTIFICATION_EMAIL_SUBJECT', 'PLG_TASK_UPDATENOTIFICATION_EMAIL_BODY', '', '', '{"tags":["newversion","curversion","sitename","url","link","releasenews"]}'),
	('plg_user_joomla.mail', 'plg_user_joomla', '', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY', '', '', '{"tags":["name","sitename","url","username","password","email"]}');

-- Dumping structure for table px_cons.cons_menu
CREATE TABLE IF NOT EXISTS `cons_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int unsigned DEFAULT NULL COMMENT 'FK to #__users.id',
  `checked_out_time` datetime DEFAULT NULL COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_menu: ~22 rows (approximately)
INSERT INTO `cons_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`, `publish_up`, `publish_down`) VALUES
	(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, NULL, NULL, 0, 0, '', 0, '', 0, 43, 0, '*', 0, NULL, NULL),
	(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 3, NULL, NULL, 0, 0, 'class:bookmark', 0, '', 1, 10, 0, '*', 1, NULL, NULL),
	(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners&view=banners', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1, NULL, NULL),
	(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&view=categories&extension=com_banners', 'component', 1, 2, 2, 5, NULL, NULL, 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1, NULL, NULL),
	(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1, NULL, NULL),
	(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1, NULL, NULL),
	(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 7, NULL, NULL, 0, 0, 'class:address-book', 0, '', 11, 20, 0, '*', 1, NULL, NULL),
	(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact&view=contacts', 'component', 1, 7, 2, 7, NULL, NULL, 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1, NULL, NULL),
	(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&view=categories&extension=com_contact', 'component', 1, 7, 2, 5, NULL, NULL, 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1, NULL, NULL),
	(10, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 16, NULL, NULL, 0, 0, 'class:rss', 0, '', 23, 28, 0, '*', 1, NULL, NULL),
	(11, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds&view=newsfeeds', 'component', 1, 10, 2, 16, NULL, NULL, 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1, NULL, NULL),
	(12, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&view=categories&extension=com_newsfeeds', 'component', 1, 10, 2, 5, NULL, NULL, 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1, NULL, NULL),
	(13, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 23, NULL, NULL, 0, 0, 'class:search-plus', 0, '', 29, 38, 0, '*', 1, NULL, NULL),
	(14, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags&view=tags', 'component', 1, 1, 1, 25, NULL, NULL, 0, 1, 'class:tags', 0, '', 39, 40, 0, '', 1, NULL, NULL),
	(15, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations&view=associations', 'component', 1, 1, 1, 30, NULL, NULL, 0, 0, 'class:language', 0, '', 21, 22, 0, '*', 1, NULL, NULL),
	(16, 'main', 'mod_menu_fields', 'Contact Custom Fields', '', 'contact/Custom Fields', 'index.php?option=com_fields&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 16, 17, 0, '*', 1, NULL, NULL),
	(17, 'main', 'mod_menu_fields_group', 'Contact Custom Fields Group', '', 'contact/Custom Fields Group', 'index.php?option=com_fields&view=groups&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1, NULL, NULL),
	(18, 'main', 'com_finder_index', 'Smart-Search-Index', '', 'Smart Search/Index', 'index.php?option=com_finder&view=index', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder', 0, '', 30, 31, 0, '*', 1, NULL, NULL),
	(19, 'main', 'com_finder_maps', 'Smart-Search-Maps', '', 'Smart Search/Maps', 'index.php?option=com_finder&view=maps', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-maps', 0, '', 32, 33, 0, '*', 1, NULL, NULL),
	(20, 'main', 'com_finder_filters', 'Smart-Search-Filters', '', 'Smart Search/Filters', 'index.php?option=com_finder&view=filters', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-filters', 0, '', 34, 35, 0, '*', 1, NULL, NULL),
	(21, 'main', 'com_finder_searches', 'Smart-Search-Searches', '', 'Smart Search/Searches', 'index.php?option=com_finder&view=searches', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-searches', 0, '', 36, 37, 0, '*', 1, NULL, NULL),
	(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","blog_class_leading":"","blog_class":"","num_leading_articles":"1","num_intro_articles":"3","num_links":"0","link_intro_image":"","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","info_block_position":"","info_block_show_title":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_associations":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_image_css":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"1","page_heading":"","pageclass_sfx":"","menu-meta_description":"","robots":""}', 41, 42, 1, '*', 0, NULL, NULL);

-- Dumping structure for table px_cons.cons_menu_types
CREATE TABLE IF NOT EXISTS `cons_menu_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0',
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_menu_types: ~0 rows (approximately)
INSERT INTO `cons_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`, `ordering`) VALUES
	(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0, 1);

-- Dumping structure for table px_cons.cons_messages
CREATE TABLE IF NOT EXISTS `cons_messages` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int unsigned NOT NULL DEFAULT '0',
  `user_id_to` int unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `priority` tinyint unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_messages: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_messages_cfg
CREATE TABLE IF NOT EXISTS `cons_messages_cfg` (
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_messages_cfg: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_modules
CREATE TABLE IF NOT EXISTS `cons_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `ordering` int NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_modules: ~36 rows (approximately)
INSERT INTO `cons_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
	(1, 39, 'Main Menu', '', '', 1, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
	(2, 40, 'Login', '', '', 1, 'login', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '', 1, '*'),
	(3, 41, 'Popular Articles', '', '', 6, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(8, 43, 'Toolbar', '', '', 1, 'toolbar', NULL, NULL, NULL, NULL, 1, 'mod_toolbar', 3, 1, '', 1, '*'),
	(9, 44, 'Notifications', '', '', 3, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 3, 1, '{"context":"update_quickicon","header_icon":"icon-sync","show_jupdate":"1","show_eupdate":"1","show_oupdate":"1","show_privacy":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(12, 46, 'Admin Menu', '', '', 1, 'menu', NULL, NULL, NULL, NULL, 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
	(15, 49, 'Title', '', '', 1, 'title', NULL, NULL, NULL, NULL, 1, 'mod_title', 3, 1, '', 1, '*'),
	(16, 50, 'Login Form', '', '', 7, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
	(17, 51, 'Breadcrumbs', '', '', 1, 'breadcrumbs', NULL, NULL, NULL, NULL, 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"","showComponent":"1","separator":"","cache":"0","cache_time":"0","cachemode":"itemid"}', 0, '*'),
	(79, 52, 'Multilanguage status', '', '', 2, 'status', NULL, NULL, NULL, NULL, 1, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(86, 53, 'Joomla Version', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_version', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
	(87, 55, 'Sample Data', '', '', 1, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_sampledata', 6, 1, '{"bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(88, 67, 'Latest Actions', '', '', 3, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latestactions', 6, 1, '{"bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(89, 68, 'Privacy Dashboard', '', '', 5, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 6, 1, '{"bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(90, 89, 'Login Support', '', '', 1, 'sidebar', NULL, NULL, NULL, NULL, 1, 'mod_loginsupport', 1, 1, '{"forum_url":"https://forum.joomla.org/","documentation_url":"https://docs.joomla.org/","news_url":"https://www.joomla.org/announcements.html","automatic_title":1,"prepare_content":1,"layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
	(91, 72, 'System Dashboard', '', '', 1, 'cpanel-system', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"system","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(92, 73, 'Content Dashboard', '', '', 1, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"content","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(93, 74, 'Menus Dashboard', '', '', 1, 'cpanel-menus', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"menus","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(94, 75, 'Components Dashboard', '', '', 1, 'cpanel-components', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"components","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(95, 76, 'Users Dashboard', '', '', 1, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"users","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":"","style":"System-none"}', 1, '*'),
	(96, 86, 'Popular Articles', '', '', 3, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(97, 87, 'Recently Added Articles', '', '', 4, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(98, 88, 'Logged-in Users', '', '', 2, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0", "bootstrap_size": "12","header_tag":"h2"}', 1, '*'),
	(99, 77, 'Frontend Link', '', '', 5, 'status', NULL, NULL, NULL, NULL, 1, 'mod_frontend', 1, 1, '', 1, '*'),
	(100, 78, 'Messages', '', '', 4, 'status', NULL, NULL, NULL, NULL, 1, 'mod_messages', 3, 1, '', 1, '*'),
	(101, 79, 'Post Install Messages', '', '', 3, 'status', NULL, NULL, NULL, NULL, 1, 'mod_post_installation_messages', 3, 1, '', 1, '*'),
	(102, 80, 'User Status', '', '', 6, 'status', NULL, NULL, NULL, NULL, 1, 'mod_user', 3, 1, '', 1, '*'),
	(103, 70, 'Site', '', '', 1, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{"context":"site_quickicon","header_icon":"icon-desktop","show_users":"1","show_articles":"1","show_categories":"1","show_media":"1","show_menuItems":"1","show_modules":"1","show_plugins":"1","show_templates":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(104, 71, 'System', '', '', 2, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{"context":"system_quickicon","header_icon":"icon-wrench","show_global":"1","show_checkin":"1","show_cache":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(105, 82, '3rd Party', '', '', 4, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{"context":"mod_quickicon","header_icon":"icon-boxes","load_plugins":"1","layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(106, 83, 'Help Dashboard', '', '', 1, 'cpanel-help', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{"menutype":"*","preset":"help","layout":"_:default","moduleclass_sfx":"","style":"System-none","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(107, 84, 'Privacy Requests', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"cachemode":"static","style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(108, 85, 'Privacy Status', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_status', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":1,"cache_time":900,"cachemode":"static","style":"0","module_tag":"div","bootstrap_size":"12","header_tag":"h2","header_class":""}', 1, '*'),
	(109, 96, 'Guided Tours', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_guidedtours', 1, 1, '', 1, '*');

-- Dumping structure for table px_cons.cons_modules_menu
CREATE TABLE IF NOT EXISTS `cons_modules_menu` (
  `moduleid` int NOT NULL DEFAULT '0',
  `menuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_modules_menu: ~39 rows (approximately)
INSERT INTO `cons_modules_menu` (`moduleid`, `menuid`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0),
	(12, 0),
	(14, 0),
	(15, 0),
	(16, 0),
	(17, 0),
	(79, 0),
	(86, 0),
	(87, 0),
	(88, 0),
	(89, 0),
	(90, 0),
	(91, 0),
	(92, 0),
	(93, 0),
	(94, 0),
	(95, 0),
	(96, 0),
	(97, 0),
	(98, 0),
	(99, 0),
	(100, 0),
	(101, 0),
	(102, 0),
	(103, 0),
	(104, 0),
	(105, 0),
	(106, 0),
	(107, 0),
	(108, 0),
	(109, 0);

-- Dumping structure for table px_cons.cons_newsfeeds
CREATE TABLE IF NOT EXISTS `cons_newsfeeds` (
  `catid` int NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint NOT NULL DEFAULT '0',
  `numarticles` int unsigned NOT NULL DEFAULT '1',
  `cache_time` int unsigned NOT NULL DEFAULT '3600',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  `rtl` tinyint NOT NULL DEFAULT '0',
  `access` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_newsfeeds: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_overrider
CREATE TABLE IF NOT EXISTS `cons_overrider` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_overrider: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_postinstall_messages
CREATE TABLE IF NOT EXISTS `cons_postinstall_messages` (
  `postinstall_message_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_postinstall_messages: ~5 rows (approximately)
INSERT INTO `cons_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
	(1, 247, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
	(2, 247, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
	(3, 247, 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION', 'plg_system_httpheaders', 1, 'action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_condition', '4.0.0', 1),
	(4, 247, 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION', 'com_users', 1, 'action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_condition', '4.2.0', 1),
	(5, 247, 'COM_JOOMLAUPDATE_POSTINSTALL_MSG_AUTOMATED_UPDATES_TITLE', 'COM_JOOMLAUPDATE_POSTINSTALL_MSG_AUTOMATED_UPDATES_DESCRIPTION', 'COM_JOOMLAUPDATE_POSTINSTALL_MSG_AUTOMATED_UPDATES_ACTION', 'com_joomlaupdate', 1, 'action', 'admin://components/com_joomlaupdate/postinstall/autoupdate.php', 'com_joomlaupdate_postinstall_autoupdate_action', 'admin://components/com_joomlaupdate/postinstall/autoupdate.php', 'com_joomlaupdate_postinstall_autoupdate_condition', '5.4.0', 1);

-- Dumping structure for table px_cons.cons_privacy_consents
CREATE TABLE IF NOT EXISTS `cons_privacy_consents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint NOT NULL DEFAULT '0',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_privacy_consents: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_privacy_requests
CREATE TABLE IF NOT EXISTS `cons_privacy_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_privacy_requests: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_redirect_links
CREATE TABLE IF NOT EXISTS `cons_redirect_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `published` tinyint NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modified` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_redirect_links: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_scheduler_logs
CREATE TABLE IF NOT EXISTS `cons_scheduler_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tasktype` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `duration` decimal(5,3) NOT NULL,
  `jobid` int unsigned NOT NULL,
  `taskid` int unsigned NOT NULL,
  `exitcode` int NOT NULL,
  `lastdate` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `nextdate` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  PRIMARY KEY (`id`),
  KEY `idx_taskname` (`taskname`),
  KEY `idx_tasktype` (`tasktype`),
  KEY `idx_lastdate` (`lastdate`),
  KEY `idx_nextdate` (`nextdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_scheduler_logs: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_scheduler_tasks
CREATE TABLE IF NOT EXISTS `cons_scheduler_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text COLLATE utf8mb4_unicode_ci COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint NOT NULL DEFAULT '0',
  `last_exit_code` int NOT NULL DEFAULT '0' COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int DEFAULT '0' COMMENT 'Count of successful triggers',
  `times_failed` int DEFAULT '0' COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0' COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint NOT NULL DEFAULT '0' COMMENT 'If 1, the task is only accessible via CLI',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_state` (`state`),
  KEY `idx_last_exit` (`last_exit_code`),
  KEY `idx_next_exec` (`next_execution`),
  KEY `idx_locked` (`locked`),
  KEY `idx_priority` (`priority`),
  KEY `idx_cli_exclusive` (`cli_exclusive`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_scheduler_tasks: ~3 rows (approximately)
INSERT INTO `cons_scheduler_tasks` (`id`, `asset_id`, `title`, `type`, `execution_rules`, `cron_rules`, `state`, `last_exit_code`, `last_execution`, `next_execution`, `times_executed`, `times_failed`, `locked`, `priority`, `ordering`, `cli_exclusive`, `params`, `note`, `created`, `created_by`, `checked_out`, `checked_out_time`) VALUES
	(1, 97, 'Rotate Logs', 'rotation.logs', '{"rule-type":"interval-days","interval-days":"30","exec-day":"23","exec-time":"06:00"}', '{"type":"interval","exp":"P30D"}', 1, 0, NULL, '2026-08-22 06:00:00', 0, 0, NULL, 0, 0, 0, '{"individual_log":false,"log_file":"","notifications":{"success_mail":"0","failure_mail":"1","fatal_failure_mail":"1","orphan_mail":"1"},"logstokeep":1}', NULL, '2026-07-23 06:25:04', 42, NULL, NULL),
	(2, 98, 'Session GC', 'session.gc', '{"rule-type":"interval-hours","interval-hours":"24","exec-day":"01","exec-time":"06:00"}', '{"type":"interval","exp":"PT24H"}', 1, 0, NULL, '2026-07-24 06:00:00', 0, 0, NULL, 0, 0, 0, '{"individual_log":false,"log_file":"","notifications":{"success_mail":"0","failure_mail":"1","fatal_failure_mail":"1","orphan_mail":"1"},"enable_session_gc":1,"enable_session_metadata_gc":1}', NULL, '2026-07-23 06:25:04', 42, NULL, NULL),
	(3, 99, 'Update Notification', 'update.notification', '{"rule-type":"interval-hours","interval-hours":"24","exec-day":"01","exec-time":"06:00"}', '{"type":"interval","exp":"PT24H"}', 1, 0, NULL, '2026-07-24 06:00:00', 0, 0, NULL, 0, 0, 0, '{"individual_log":false,"log_file":"","notifications":{"success_mail":"0","failure_mail":"1","fatal_failure_mail":"1","orphan_mail":"1"},"email":"","language_override":""}', NULL, '2026-07-23 06:25:04', 42, NULL, NULL);

-- Dumping structure for table px_cons.cons_schemaorg
CREATE TABLE IF NOT EXISTS `cons_schemaorg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemId` int unsigned DEFAULT NULL,
  `context` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schemaType` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schema` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_schemaorg: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_schemas
CREATE TABLE IF NOT EXISTS `cons_schemas` (
  `extension_id` int NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_schemas: ~0 rows (approximately)
INSERT INTO `cons_schemas` (`extension_id`, `version_id`) VALUES
	(247, '6.1.0-2026-03-13');

-- Dumping structure for table px_cons.cons_session
CREATE TABLE IF NOT EXISTS `cons_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint unsigned DEFAULT NULL,
  `guest` tinyint unsigned DEFAULT '1',
  `time` int NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_session: ~2 rows (approximately)
INSERT INTO `cons_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
	(_binary 0x3573323866726c696e763336313462353463726c63386e32746a, 0, 1, 1784787942, 'joomla|s:700:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzg0Nzg3OTQyO3M6NDoibGFzdCI7aToxNzg0Nzg3OTQyO3M6Mzoibm93IjtpOjE3ODQ3ODc5NDI7fXM6NToidG9rZW4iO3M6MzI6IjIyODEzYmVkOGRhNmM2NGYxNzQwMTg0MTNhMmEzNzdjIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 0, ''),
	(_binary 0x3631623734617061637137723675386a7035766138747070306a, 1, 0, 1784788072, 'joomla|s:1528:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjY6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjQxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTc4NDc4Nzk0OTtzOjQ6Imxhc3QiO2k6MTc4NDc4ODA3MjtzOjM6Im5vdyI7aToxNzg0Nzg4MDcyO31zOjU6InRva2VuIjtzOjMyOiI2MTVmOTE5ZGU1ZDYxNWJmYmI0MTc1OGYyMTE5NGExNSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoyOntzOjEzOiJjb21faW5zdGFsbGVyIjtPOjg6InN0ZENsYXNzIjozOntzOjc6Im1lc3NhZ2UiO3M6MDoiIjtzOjE3OiJleHRlbnNpb25fbWVzc2FnZSI7czowOiIiO3M6MTI6InJlZGlyZWN0X3VybCI7Tjt9czoxMToiY29tX3BsdWdpbnMiO086ODoic3RkQ2xhc3MiOjE6e3M6NzoicGx1Z2lucyI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo2OiJmaWx0ZXIiO2E6NTp7czo2OiJzZWFyY2giO3M6NToicGl4ZWwiO3M6NzoiZW5hYmxlZCI7czowOiIiO3M6NjoiZm9sZGVyIjtzOjA6IiI7czo3OiJlbGVtZW50IjtzOjA6IiI7czo2OiJhY2Nlc3MiO3M6MDoiIjt9czo0OiJsaXN0IjthOjQ6e3M6MTI6ImZ1bGxvcmRlcmluZyI7czoxMDoiZm9sZGVyIEFTQyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo5OiJzb3J0VGFibGUiO3M6NjoiZm9sZGVyIjtzOjE0OiJkaXJlY3Rpb25UYWJsZSI7czozOiJBU0MiO31zOjEwOiJsaW1pdHN0YXJ0IjtpOjA7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6NDI7fXM6OToiY29tX3VzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjExOiJtZmFfY2hlY2tlZCI7aToxO31zOjg6Im92ZXJyaWRlIjtPOjg6InN0ZENsYXNzIjowOnt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 42, 'admin');

-- Dumping structure for table px_cons.cons_tags
CREATE TABLE IF NOT EXISTS `cons_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_tags: ~0 rows (approximately)
INSERT INTO `cons_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
	(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '', '', '', '', 42, '2026-07-23 06:25:03', '', 42, '2026-07-23 06:25:03', '', '', 0, '*', 1, NULL, NULL);

-- Dumping structure for table px_cons.cons_template_overrides
CREATE TABLE IF NOT EXISTS `cons_template_overrides` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension_id` int DEFAULT '0',
  `state` tinyint NOT NULL DEFAULT '0',
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_extension_id` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_template_overrides: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_template_styles
CREATE TABLE IF NOT EXISTS `cons_template_styles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint NOT NULL DEFAULT '0',
  `parent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_template_styles: ~3 rows (approximately)
INSERT INTO `cons_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `inheritable`, `parent`, `params`) VALUES
	(10, 'atum', 1, '1', 'Atum - Default', 1, '', '{"hue":"hsl(214, 63%, 20%)","bg-light":"#f0f4fb","text-dark":"#495057","text-light":"#ffffff","link-color":"#2a69b8","special-color":"#001b4c","colorScheme":"os","monochrome":"0","loginLogo":"","loginLogoAlt":"","logoBrandLarge":"","logoBrandLargeAlt":"","logoBrandSmall":"","logoBrandSmallAlt":""}'),
	(11, 'cassiopeia', 0, '1', 'Cassiopeia - Default', 1, '', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","colorName":"colors_standard","fluidContainer":"0","stickyHeader":0,"backTop":0}'),
	(12, 'cassiopeia_extended', 0, '0', 'Cassiopeia Extended - Default', 0, 'cassiopeia', '{"brand":"1","logoFile":"","siteTitle":"","siteDescription":"","useFontScheme":"0","systemFontBody":"","systemFontHeading":"","colorName":"colors_standard","fluidContainer":"0","stickyHeader":"0","backTop":"0","colorSettings":"0","headerbg":"rgb(193, 205, 207)","headercolor":"rgb(23, 23, 23)","bodybg":"rgb(254, 254, 254)","bodycolor":"rgb(23, 23, 23)","linkcolor":"rgb(29, 121, 137)","linkcolorh":"rgb(14, 59, 67)","btnbg":"rgb(206, 60, 55)","btnbgh":"rgb(131, 35, 32)","btncolor":"rgb(254, 254, 254)","btncolorh":"rgb(254, 254, 254)","footerbg":"rgb(29, 121, 137)","footercolor":"rgb(254, 254, 254)","fontSettings":"0","bodysize":"1","h1size":"2","h2size":"1.7","h3size":"1.5"}');

-- Dumping structure for table px_cons.cons_tuf_metadata
CREATE TABLE IF NOT EXISTS `cons_tuf_metadata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `root` text COLLATE utf8mb4_unicode_ci,
  `targets` text COLLATE utf8mb4_unicode_ci,
  `snapshot` text COLLATE utf8mb4_unicode_ci,
  `timestamp` text COLLATE utf8mb4_unicode_ci,
  `mirrors` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Secure TUF Updates';

-- Dumping data for table px_cons.cons_tuf_metadata: ~0 rows (approximately)
INSERT INTO `cons_tuf_metadata` (`id`, `update_site_id`, `root`, `targets`, `snapshot`, `timestamp`, `mirrors`) VALUES
	(1, 1, '{"signed":{"_type":"root","spec_version":"1.0","version":14,"expires":"2027-08-20T08:56:59Z","keys":{"00e432b504508246e2bd536dd6c13e55e8b3256f0be9f767fae26da6c2a28663":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"250f8d293c49817a83909dead96ad82b62f7ac16844cf589f8d2f0e0b15cab21"}},"07eb082f367c034a95878687f6648aa76d93652b6ee73e58817053d89af6c44f":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"9b2af2d9b9727227735253d795bd27ea8f0e294a5f3603e822dc5052b44802b9"}},"179d107f20a2354ac5bd9a1f32a2df1763c0059617f0c132bebeb4816a1a8637":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"159a4195cbafce2bb959f09ab2b36a2127b8967f94d389f65f1e7892fccfe8b8"}},"192ad7343e7d431533d9577fd957b6f924680177db4dc6c0e146dad6810a90a4":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"042b66e1431a1f5c2c15b4a16ea60f23f466851b58e9ff057dbfc2a5e0d821d1"}},"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"a18e5ebabc19d5d5984b601a292ece61ba3662ab2d071dc520da5bd4f8948799"}},"273e94e5477e306ad6de75be1524860e219e265ff9a57c81ababd0691e45706c":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"1cb6702338830ef1c9e76a022fed27172d475bbaace754d8141ebc96dad8b15f"}},"284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"546cdff30cc1ad6dd5f3d1e173672d94bd61a9507199af064142f70cde8de4e3"}},"2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"cb0a7a131961a20edea051d6dc2b091fb650bd399bd8514adb67b3c60db9f8f9"}},"31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"589d029a68b470deff1ca16dbf3eea6b5b3fcba0ae7bb52c468abc7fb058b2a2"}},"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"6043c8bacc76ac5c9750f45454dd865c6ca1fc57d69e14cc192cfd420f6a66a9"}},"9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"a4b8509488f1c29ab0b1f610e7452fbec78b4f33f1fba5a418d6ff087c567429"}},"a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"ea764b0b475b3c396627ac6689cbd8f54a5f93e87b6f5e3eb44a7ccafb542ff3"}},"a599a27a3ec4d520059c591338759dc401006b1c4cb1db85a286e667253d28b6":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"45e416d24d13a60ace5ab028827d5cfc8ba177bb9466bf2acd8efa6e3547911a"}},"ba3914be50eea8ecf6d5e7a8d3564dbbad99415d9cc229b9ee081ed86f69f803":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"1cbfa7dcac9659e5a8a946ec999bd28f53b451e38ce5827980bed2686098cf19"}},"bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"6eb44460e5914e8e0df726ddb90bd1f3771b8ce5af19b40fb01ac5a85b023a6f"}},"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"ad1950e117b29ebe7a38635a2e574123e07571e4f9a011783e053b5f15d2562a"}},"ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e":{"keytype":"ed25519","scheme":"ed25519","keyid_hash_algorithms":["sha256","sha512"],"keyval":{"public":"5d451915bc2b93a0e4e4745bc6a8b292d58996d50e0fb66c78c7827152a65879"}}},"roles":{"root":{"keyids":["1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669","2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e","192ad7343e7d431533d9577fd957b6f924680177db4dc6c0e146dad6810a90a4"],"threshold":1},"snapshot":{"keyids":["07eb082f367c034a95878687f6648aa76d93652b6ee73e58817053d89af6c44f","2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e","ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e","e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b","bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9","9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe","273e94e5477e306ad6de75be1524860e219e265ff9a57c81ababd0691e45706c","00e432b504508246e2bd536dd6c13e55e8b3256f0be9f767fae26da6c2a28663","179d107f20a2354ac5bd9a1f32a2df1763c0059617f0c132bebeb4816a1a8637","a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1","192ad7343e7d431533d9577fd957b6f924680177db4dc6c0e146dad6810a90a4","a599a27a3ec4d520059c591338759dc401006b1c4cb1db85a286e667253d28b6","284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481","ba3914be50eea8ecf6d5e7a8d3564dbbad99415d9cc229b9ee081ed86f69f803"],"threshold":1},"targets":{"keyids":["31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3","ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e","e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b","bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9","9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe","273e94e5477e306ad6de75be1524860e219e265ff9a57c81ababd0691e45706c","00e432b504508246e2bd536dd6c13e55e8b3256f0be9f767fae26da6c2a28663","179d107f20a2354ac5bd9a1f32a2df1763c0059617f0c132bebeb4816a1a8637","a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1","284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481"],"threshold":1},"timestamp":{"keyids":["9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc"],"threshold":1}},"consistent_snapshot":true},"signatures":[{"keyid":"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669","sig":"4d6f71aaa9abcb9a04abf5e91fae73e60773e1d707db3978d039db1c21ccc95d79bcced7d959e46f860a93eccc21cc22eb2efa2fb9192b77306bd274c5605302"}]}', '{"signed":{"_type":"targets","spec_version":"1.0","version":103,"expires":"2026-10-21T13:44:44Z","targets":{"Joomla_5.1.2-Stable-Upgrade_Package.zip":{"length":28134889,"hashes":{"sha512":"d6b46cdedb9b31d01a607fe4c2f3a830a3265ed6ae5c0cb7b0f836b1b016ee7c639bd8948df00baf1b61a87f2fc71368a80b39e67ef9ec2b8842ee0ab09a620f"},"custom":{"client":"site","description":"Joomla! 5.1.2 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-1-2/Joomla_5.1.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.1.2/Joomla_5.1.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.1.2/Joomla_5.1.2-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5909-joomla-5-1-2-and-joomla-4-4-6-security-and-bug-fix-release.html","title":"Joomla! 5.1.2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.1.2","php_minimum":"8.1.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.1.2"}},"Joomla_5.4.1-Stable-Update_Package.zip":{"length":30009045,"hashes":{"sha512":"aeddd1143cd574ff3f6e9bc7d7c67bf5d21dc1b404d98498a691b1fff12f5d245b48424f97155f20e2807e4ee2c1aed7313fae3ab8c0d27a08a20947c166c43e"},"custom":{"client":"site","description":"Joomla! 5.4.1 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-1/Joomla_5.4.1-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.1/Joomla_5.4.1-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.1/Joomla_5.4.1-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5941-joomla-6-0-1-and-5-4-1-bugfix-release.html","title":"Joomla! 5.4.1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.1","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.1"}},"Joomla_5.4.2-Stable-Update_Package.zip":{"length":30316442,"hashes":{"sha512":"e83add95a43103ec2d6ccada9e33a29fa6feb2d8e27b6bd16376f4a75d9b588c029b1f24c97b0772e3a6eb0e20d2b8e0e3526cf2af242d90c280ef63abeddaa9"},"custom":{"client":"site","description":"Joomla! 5.4.2 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-2/Joomla_5.4.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.2/Joomla_5.4.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.2/Joomla_5.4.2-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5942-joomla-6-0-2-and-5-4-2-security-bugfix-release.html","title":"Joomla! 5.4.2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.2","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.2"}},"Joomla_5.4.3-Stable-Update_Package.zip":{"length":30403970,"hashes":{"sha512":"63901b3cca37a59fe8028e0adb01eda3bb3669dc410c21b1ab7cb040997980c75d2d52b242d053800a542f4d60cf6a15e5fdabc963014c35aef80f6b8b02857f"},"custom":{"client":"site","description":"Joomla! 5.4.3 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-3/Joomla_5.4.3-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.3/Joomla_5.4.3-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.3/Joomla_5.4.3-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5943-joomla-6-0-3-and-5-4-3-bugfix-release.html","title":"Joomla! 5.4.3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.3","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.3"}},"Joomla_5.4.4-Stable-Update_Package.zip":{"length":30488702,"hashes":{"sha512":"56497e3c1bf1b9b21e8149a15e36dd1590f6adffd13b38005af40afdf2a33761fbacc9628c5ea6b0e21eb04fb1ca20ca9bc96b2add4b626ed0b567f43994a65e"},"custom":{"client":"site","description":"Joomla! 5.4.4 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-4/Joomla_5.4.4-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.4/Joomla_5.4.4-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.4/Joomla_5.4.4-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5944-joomla-6-0-4-5-4-4-security-bugfix-release.html","title":"Joomla! 5.4.4 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.4","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.4"}},"Joomla_5.4.5-Stable-Update_Package.zip":{"length":30498375,"hashes":{"sha512":"c4ebb9a6782c6ef1a3fe58231b78dbf301e212f0f33325e2a17e8014331dab5dee99ebaf2f90eb3e795d1c24ddc55d9485dba095e3f76d0780a80d0f61204ef2"},"custom":{"client":"site","description":"Joomla! 5.4.5 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-5/Joomla_5.4.5-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.5/Joomla_5.4.5-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.5/Joomla_5.4.5-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5951-joomla-5-4-5-bugfix-release.html","title":"Joomla! 5.4.5 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.5","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.5"}},"Joomla_5.4.5-rc1-Release_Candidate-Update_Package.zip":{"length":30498394,"hashes":{"sha512":"902e15b690f8bb33de3d139bc861362bd9f073fef506ce150bdc0f29bf8bde6c10aefa0518bb4f57f39576117913cddf59a8c325c7a517c21d7b6b1aea48aee8"},"custom":{"client":"site","description":"Joomla! 5.4.5-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.5-rc1/Joomla_5.4.5-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/5.4.5-rc1","title":"Joomla! 5.4.5-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.5-rc1","php_minimum":"8.1.0","channel":"5.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.5-rc1"}},"Joomla_5.4.6-Stable-Update_Package.zip":{"length":31661279,"hashes":{"sha512":"40d8b14c59c9af7ad098247a70d195c307f31597365cc4b5133b7ffc896c236b3266b45fc6c05879624c96e7f1af26b66ef3c371482b54b130b9faa65622f2fd"},"custom":{"client":"site","description":"Joomla! 5.4.6 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-6/Joomla_5.4.6-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.6/Joomla_5.4.6-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.6/Joomla_5.4.6-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5954-joomla-6-1-1-5-4-6-security-bugfix-release.html","title":"Joomla! 5.4.6 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.6","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.6"}},"Joomla_5.4.6-rc1-Release_Candidate-Update_Package.zip":{"length":31656827,"hashes":{"sha512":"e327d1ce0979ad1b10d46d7ba30abd55bd61299d0ac627f99d00310a84f45811573cf153976b0f32d2047c2d9ad72fd59d42594617439ec7250aff7e85801c97"},"custom":{"client":"site","description":"Joomla! 5.4.6-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.6-rc1/Joomla_5.4.6-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/5.4.6-rc1","title":"Joomla! 5.4.6-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.6-rc1","php_minimum":"8.1.0","channel":"5.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.6-rc1"}},"Joomla_5.4.7-Stable-Update_Package.zip":{"length":31851429,"hashes":{"sha512":"e1abbac01fe804d4eb64b1327ace9db4356e39a8782ab547b5257be308ea9215badec27821eae936b9a2db2f120fc175357f54ac3ca5af2313ec2af52eb44223"},"custom":{"client":"site","description":"Joomla! 5.4.7 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla5/5-4-7/Joomla_5.4.7-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.7/Joomla_5.4.7-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/5.4.7/Joomla_5.4.7-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5955-joomla-6-1-2-5-4-7-security-bugfix-release.html","title":"Joomla! 5.4.7 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.7","php_minimum":"8.1.0","channel":"5.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.7"}},"Joomla_5.4.7-rc1-Release_Candidate-Update_Package.zip":{"length":31847733,"hashes":{"sha512":"e70bdb5ceceb837fe99ee49ca0bbc0f7bfeade3e024dba5a90a8d84e56079c13a231a93dcb6d637b6b07b22e7d98c8f894fc6a2de614f0544f48550c3e15506b"},"custom":{"client":"site","description":"Joomla! 5.4.7-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/5.4.7-rc1/Joomla_5.4.7-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/5.4.7-rc1","title":"Joomla! 5.4.7-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 5.4.7-rc1","php_minimum":"8.1.0","channel":"5.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"11.0"},"targetplatform":{"name":"joomla","version":"(5\\\\.[0-4])|^(4\\\\.4)"},"type":"file","version":"5.4.7-rc1"}},"Joomla_6.0.1-Stable-Update_Package.zip":{"length":30247182,"hashes":{"sha512":"38f8dd3ff1fd48b9973193a4484591b3b9f4a7516eb7640ff1687d84c81d4dc8cd05f6f58b9f48172bae41a466442f4a5af4a23e3d63869aeb1b05f4fdd6512e"},"custom":{"client":"site","description":"Joomla! 6.0.1 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-0-1/Joomla_6.0.1-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.0.1/Joomla_6.0.1-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.0.1/Joomla_6.0.1-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5941-joomla-6-0-1-and-5-4-1-bugfix-release.html","title":"Joomla! 6.0.1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.0.1","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.0.1"}},"Joomla_6.0.2-Stable-Update_Package.zip":{"length":30555623,"hashes":{"sha512":"c0cff255fcf8e0359453c18365f4906afcce115981a5114e3388da583ad192bde320c8bdd191cd8ca4e55ad5585c9c4cd098c2e1661d8a109d37b94340e4b6a6"},"custom":{"client":"site","description":"Joomla! 6.0.2 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-0-2/Joomla_6.0.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.0.2/Joomla_6.0.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.0.2/Joomla_6.0.2-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5942-joomla-6-0-2-and-5-4-2-security-bugfix-release.html","title":"Joomla! 6.0.2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.0.2","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.0.2"}},"Joomla_6.0.3-Stable-Update_Package.zip":{"length":30645479,"hashes":{"sha512":"212a681935d260925cbb15e0fa4d9c9e40978aa32ab7137ff1e0775be26eaa6634317521ec8a411aed3f76990758cbe4dcec3c86186458238dc45f8a3886e5dc"},"custom":{"client":"site","description":"Joomla! 6.0.3 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-0-3/Joomla_6.0.3-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.0.3/Joomla_6.0.3-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.0.3/Joomla_6.0.3-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5943-joomla-6-0-3-and-5-4-3-bugfix-release.html","title":"Joomla! 6.0.3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.0.3","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.0.3"}},"Joomla_6.0.4-Stable-Update_Package.zip":{"length":30730380,"hashes":{"sha512":"39de3d222482dc1d6ba3041c9cbfb259dbf17762d917af59906c1c5c43b5da5016d5fb54d788f8b866fb473e4b57e3f1780db74be115300c181897c75e38c2e5"},"custom":{"client":"site","description":"Joomla! 6.0.4 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-0-4/Joomla_6.0.4-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.0.4/Joomla_6.0.4-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.0.4/Joomla_6.0.4-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5944-joomla-6-0-4-5-4-4-security-bugfix-release.html","title":"Joomla! 6.0.4 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.0.4","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.0.4"}},"Joomla_6.1.0-Stable-Update_Package.zip":{"length":31441199,"hashes":{"sha512":"e066487307a7952450d4f37ce97a576ae185728793d081c98416db9bb2a830fa4cfea0c5f6c7828bb91523cd26d6120c0d5111fc39962fa71cd875a8983c2c1a"},"custom":{"client":"site","description":"Joomla! 6.1.0 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-1-0/Joomla_6.1.0-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0/Joomla_6.1.0-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.1.0/Joomla_6.1.0-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5950-joomla-6-1-is-here.html","title":"Joomla! 6.1.0 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0"}},"Joomla_6.1.0-alpha2-Alpha-Full_Package.zip":{"length":33107068,"hashes":{"sha512":"be9711e1bda18981f077369105399eff9e8ab9203cad43d2c5385689e32db7bc6e11f3b5e406194dd9c2d7f5892bb92c6702cf5436badf3d971150ffcfda0a72"},"custom":{"client":"site","description":"Joomla! 6.1.0-alpha2 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-alpha2/Joomla_6.1.0-alpha2-Alpha-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://developer.joomla.org/news/1015-joomla-6-1-alpha2-see-how-its-coming-together.html","title":"Joomla! 6.1.0-alpha2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-alpha2","php_minimum":"8.3.0","channel":"6.x","stability":"Alpha","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-alpha2"}},"Joomla_6.1.0-alpha2-Alpha-Update_Package.zip":{"length":30736927,"hashes":{"sha512":"388790c8b32f624e5b33531f4a41eefa85b5273e76e20a847b01c7eaa59367939317581e5f75ade6c024f25894740c9651ce2faaa330ac8a7fb863434c170879"},"custom":{"client":"site","description":"Joomla! 6.1.0-alpha2 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-alpha2/Joomla_6.1.0-alpha2-Alpha-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://developer.joomla.org/news/1015-joomla-6-1-alpha2-see-how-its-coming-together.html","title":"Joomla! 6.1.0-alpha2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-alpha2","php_minimum":"8.3.0","channel":"6.x","stability":"Alpha","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-alpha2"}},"Joomla_6.1.0-alpha3-Alpha-Full_Package.zip":{"length":33216519,"hashes":{"sha512":"16eb1fb81ef4b0c2f3ebca14538945d291623f544d77946e556fc2f17561bda55c256be4f56c0f5034609bbc10e7dcbf0995691b0cd613f5dc58658fe964333b"},"custom":{"client":"site","description":"Joomla! 6.1.0-alpha3 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-alpha3/Joomla_6.1.0-alpha3-Alpha-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://developer.joomla.org/news/1018-joomla-6-1-alpha3-wrapping-up-the-alpha-phase.html","title":"Joomla! 6.1.0-alpha3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-alpha3","php_minimum":"8.3.0","channel":"6.x","stability":"Alpha","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-alpha3"}},"Joomla_6.1.0-alpha3-Alpha-Update_Package.zip":{"length":30842460,"hashes":{"sha512":"9290f78cdba43c0bbb4e9b812a1e06cd548e6a4e14b51529d50d5acab3fdb4f7ab5cc6828655596159af41962b51f5a14008a26f06e3f9c5b3781f309cb52a19"},"custom":{"client":"site","description":"Joomla! 6.1.0-alpha3 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-alpha3/Joomla_6.1.0-alpha3-Alpha-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://developer.joomla.org/news/1018-joomla-6-1-alpha3-wrapping-up-the-alpha-phase.html","title":"Joomla! 6.1.0-alpha3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-alpha3","php_minimum":"8.3.0","channel":"6.x","stability":"Alpha","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-alpha3"}},"Joomla_6.1.0-beta3-Beta-Update_Package.zip":{"length":31413826,"hashes":{"sha512":"9f03df89f3112706026cd9e99f4e3e1cc46a706db8492957e093ae416aadc568b422bcebbf74d45ffc07072d011c0d64e64e9891adcc3f56326da22ccb62d449"},"custom":{"client":"site","description":"Joomla! 6.1.0-beta3 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-beta3/Joomla_6.1.0-beta3-Beta-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://developer.joomla.org/news/1026-joomla-6-1-beta3-help-make-it-stable.html","title":"Joomla! 6.1.0-beta3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-beta3","php_minimum":"8.3.0","channel":"6.x","stability":"Beta","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-beta3"}},"Joomla_6.1.0-rc1-Release_Candidate-Update_Package.zip":{"length":31432633,"hashes":{"sha512":"6b06981c9e3dc2f0345fc7ef6372d14fa4d84f5f8f424465139dd0ec9c596cf297a554a61b0bcbe02d1c4b494f5e8f1abb821f715222f1f3610045ea7c5f60cc"},"custom":{"client":"site","description":"Joomla! 6.1.0-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-rc1/Joomla_6.1.0-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/news/5945-joomla-6-1-release-candidate-test-the-final-package.html","title":"Joomla! 6.1.0-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-rc1","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-rc1"}},"Joomla_6.1.0-rc2-Release_Candidate-Update_Package.zip":{"length":31433359,"hashes":{"sha512":"b9b85aa048c26face653f9fb62f4ca28c294fa2a9c643aed73b581742d07db6d9d0b3169b4f7a437d1b233fe4771e0efe6395280a22139afa0a459908ba5d9b3"},"custom":{"client":"site","description":"Joomla! 6.1.0-rc2 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-rc2/Joomla_6.1.0-rc2-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5949-joomla-6-1-release-candidate-2-test-the-final-package.html","title":"Joomla! 6.1.0-rc2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-rc2","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-rc2"}},"Joomla_6.1.0-rc3-Release_Candidate-Update_Package.zip":{"length":31441220,"hashes":{"sha512":"5e66b9407f56f0d5d948a85743872e034a1e45b2d8b0cd876cbedb16edcfe39a32f95172677e2a12514a062aae8e1eb94ca3612ea1adb757c3911865cf2e242b"},"custom":{"client":"site","description":"Joomla! 6.1.0-rc3 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.0-rc3/Joomla_6.1.0-rc3-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5952-joomla-6-1-release-candidate-3-test-the-final-package.html","title":"Joomla! 6.1.0-rc3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.0-rc3","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.0-rc3"}},"Joomla_6.1.1-Stable-Update_Package.zip":{"length":32594982,"hashes":{"sha512":"17deb752b2b3cfa828d9537bc216cfd48202f60fba9cee7e40998fc69012a0089144a0f9468fef0010ccd202da63638a1d5dc130726d23f15b96defe49e65685"},"custom":{"client":"site","description":"Joomla! 6.1.1 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-1-1/Joomla_6.1.1-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.1/Joomla_6.1.1-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.1.1/Joomla_6.1.1-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5954-joomla-6-1-1-5-4-6-security-bugfix-release.html","title":"Joomla! 6.1.1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.1","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.1"}},"Joomla_6.1.1-rc1-Release_Candidate-Update_Package.zip":{"length":32593613,"hashes":{"sha512":"92ecff9ab0d49f82954709c781ba899899ac51d53c755b02f020d8c4b4c1947c8640519d2e1467ffdef53809ede6382f0da8255ae537ab38aea02be3dec421ca"},"custom":{"client":"site","description":"Joomla! 6.1.1-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.1-rc1/Joomla_6.1.1-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/6.1.1-rc1","title":"Joomla! 6.1.1-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.1-rc1","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.1-rc1"}},"Joomla_6.1.2-Stable-Update_Package.zip":{"length":32955671,"hashes":{"sha512":"92583e1301ddd9b8715fec76b1157ca8d7f2201d6e7e53127d307c430c1e78a0a32d8db552540fb15bb899fc5fb2ca0e91c18537b6034c408742e0148973576b"},"custom":{"client":"site","description":"Joomla! 6.1.2 Release","downloads":[{"url":"https://downloads.joomla.org/cms/joomla6/6-1-2/Joomla_6.1.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.2/Joomla_6.1.2-Stable-Update_Package.zip","format":"zip","type":"full"},{"url":"https://update.joomla.org/releases/6.1.2/Joomla_6.1.2-Stable-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://www.joomla.org/announcements/release-news/5955-joomla-6-1-2-5-4-7-security-bugfix-release.html","title":"Joomla! 6.1.2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.2","php_minimum":"8.3.0","channel":"6.x","stability":"Stable","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.2"}},"Joomla_6.1.2-rc1-Release_Candidate-Update_Package.zip":{"length":32944838,"hashes":{"sha512":"d006b3e855dfbed2dde9e4cdaccbac53a3fdee1c5ad6912a8a77fc29579dcb3119d1845d712c2272e51a95414619684baa76dbc83690ed716d6b0b261abfcc2a"},"custom":{"client":"site","description":"Joomla! 6.1.2-rc1 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.2-rc1/Joomla_6.1.2-rc1-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/6.1.2-rc1","title":"Joomla! 6.1.2-rc1 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.2-rc1","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.2-rc1"}},"Joomla_6.1.2-rc2-Release_Candidate-Update_Package.zip":{"length":32947291,"hashes":{"sha512":"e55782640120cabe47188b443a57f9a178b15fc140a6aef65226298ed2b0e16d88d82ccae2f9be9fd70a00a6582f429a16e5e39fe9b95a4858f48b2a39b36455"},"custom":{"client":"site","description":"Joomla! 6.1.2-rc2 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.2-rc2/Joomla_6.1.2-rc2-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/tag/6.1.2-rc2","title":"Joomla! 6.1.2-rc2 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.2-rc2","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.2-rc2"}},"Joomla_6.1.2-rc3-Release_Candidate-Update_Package.zip":{"length":32951517,"hashes":{"sha512":"b846e7b89c3dde8fe81e59b4a6664dea72197d1a6ca2e10a6318417ab8439268c57e17c0ff89361e4afbdfc1510321874a711cdd9684fcf9ce842ece1638789e"},"custom":{"client":"site","description":"Joomla! 6.1.2-rc3 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.1.2-rc3/Joomla_6.1.2-rc3-Release_Candidate-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://github.com/joomla/joomla-cms/releases/edit/6.1.2-rc3","title":"Joomla! 6.1.2-rc3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.1.2-rc3","php_minimum":"8.3.0","channel":"6.x","stability":"RC","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.1.2-rc3"}},"Joomla_6.2.0-alpha3-Alpha-Update_Package.zip":{"length":32173625,"hashes":{"sha512":"b966f0cd9b89ebd29066f333333cd98e27f889f5bb03248bc13c4aae4df34916b03b7f3779b2e0b2c325ba46c3a479cec163d5c141ebf2df94db86611dfc7d16"},"custom":{"client":"site","description":"Joomla! 6.2.0-alpha3 Release","downloads":[{"url":"https://github.com/joomla/joomla-cms/releases/download/6.2.0-alpha3/Joomla_6.2.0-alpha3-Alpha-Update_Package.zip","format":"zip","type":"full"}],"element":"joomla","infourl":{"url":"https://developer.joomla.org/news/1067-joomla-6-2-alpha3-one-step-closer-to-beta.html","title":"Joomla! 6.2.0-alpha3 Release"},"maintainer":"Joomla! Production Department","maintainerurl":"https://www.joomla.org","name":"Joomla! 6.2.0-alpha3","php_minimum":"8.3.0","channel":"6.x","stability":"Alpha","supported_databases":{"mariadb":"10.4","mysql":"8.0.13","postgresql":"12.0"},"targetplatform":{"name":"joomla","version":"(6\\\\.[0-4])|^(5\\\\.4)"},"type":"file","version":"6.2.0-alpha3"}}}},"signatures":[{"keyid":"284c8164fd395e9178dc66929787f0650cda6acff0fd769ef697203d7553c481","sig":"a3bcc158d80f437c695e986e8b66dab6fd5f10c85635d1de65518ef45d8fcab9be2f973d00f17d2a71d524c0ce84ce8c88ffef575ed60c457729f28d23af4003"},{"keyid":"a1a4b7fdbeedfdeff12d7776de098a2f8de8d2ab7bfe10062a281b3819b078c1","sig":"c935be15e7cbd457d7068f874ae7675a2f6bb2a0e0e744dcd01bfed9f4bc95e6a5d1877679c88fd6379c38cb50f23368f3297749e63dbba0285e042428ac0309"}]}', '{"signed":{"_type":"snapshot","spec_version":"1.0","version":116,"expires":"2027-02-16T15:38:43Z","meta":{"targets.json":{"length":33969,"hashes":{"sha512":"aea90ba150aaf3b655bd4caf6e7cc1d39ead7c2264e13990474f9dd39c9dce38a1ae6da1cdc9dadd591688879f548ecd91fee9a1799bede3128447ce934f6bf5"},"version":103}}},"signatures":[{"keyid":"ba3914be50eea8ecf6d5e7a8d3564dbbad99415d9cc229b9ee081ed86f69f803","sig":"b6dfa4e181db8b902becfcebce20752f5a99da6fc93adbfb79accfa59b951cadf95852c17581be1cdfade958585428fea3d414bdd011e1e962ad181c8212fc04"}]}', '{"signed":{"_type":"timestamp","spec_version":"1.0","version":1161,"expires":"2026-07-25T01:22:29Z","meta":{"snapshot.json":{"length":534,"hashes":{"sha512":"29efeb645c32f9b0f6daf1a8e64a42ce4b9e862519a9a73bbde8d150f175d3d04d3c6269fcbe91888a41816735ded8cfe81fa9ae49d084b44e087bbc1703bf9d"},"version":116}}},"signatures":[{"keyid":"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc","sig":"4ed0cbf78e02bc9b24fd1cf27ecd93bb1ed5acc23f6b16efe3e3391828d4736166feee2692f2dc4553ce6a315de3c85cc78e42e0039f91709f00c0743c1d9d05"}]}', NULL);

-- Dumping structure for table px_cons.cons_ucm_base
CREATE TABLE IF NOT EXISTS `cons_ucm_base` (
  `ucm_id` int unsigned NOT NULL,
  `ucm_item_id` int NOT NULL,
  `ucm_type_id` int NOT NULL,
  `ucm_language_id` int NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_ucm_base: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_ucm_content
CREATE TABLE IF NOT EXISTS `cons_ucm_content` (
  `core_content_id` int unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci,
  `core_state` tinyint NOT NULL DEFAULT '0',
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int unsigned DEFAULT NULL,
  `core_access` int unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci,
  `core_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'ID from the individual type table',
  `asset_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci,
  `core_urls` text COLLATE utf8mb4_unicode_ci,
  `core_hits` int unsigned NOT NULL DEFAULT '0',
  `core_version` int unsigned NOT NULL DEFAULT '1',
  `core_ordering` int NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci,
  `core_catid` int unsigned NOT NULL DEFAULT '0',
  `core_type_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- Dumping data for table px_cons.cons_ucm_content: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_updates
CREATE TABLE IF NOT EXISTS `cons_updates` (
  `update_id` int NOT NULL AUTO_INCREMENT,
  `update_site_id` int DEFAULT '0',
  `extension_id` int DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

-- Dumping data for table px_cons.cons_updates: ~51 rows (approximately)
INSERT INTO `cons_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `changelogurl`, `extra_query`) VALUES
	(1, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/af-ZA_details.xml', '', '', ''),
	(2, 2, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/be-BY_details.xml', '', '', ''),
	(3, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/bg-BG_details.xml', '', '', ''),
	(4, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/ca-ES_details.xml', '', '', ''),
	(5, 2, 0, 'Chinese, Simplified', '', 'pkg_zh-CN', 'package', '', 0, '6.0.1.4', '', 'https://update.joomla.org/language/details6/zh-CN_details.xml', '', '', ''),
	(6, 2, 0, 'Chinese, Traditional', '', 'pkg_zh-TW', 'package', '', 0, '6.0.4.1', '', 'https://update.joomla.org/language/details6/zh-TW_details.xml', '', '', ''),
	(7, 2, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '6.0.3.2', '', 'https://update.joomla.org/language/details6/hr-HR_details.xml', '', '', ''),
	(8, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/cs-CZ_details.xml', '', '', ''),
	(9, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/da-DK_details.xml', '', '', ''),
	(10, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/nl-NL_details.xml', '', '', ''),
	(11, 2, 0, 'English, Australia', '', 'pkg_en-AU', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/en-AU_details.xml', '', '', ''),
	(12, 2, 0, 'English, Canada', '', 'pkg_en-CA', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/en-CA_details.xml', '', '', ''),
	(13, 2, 0, 'English, New Zealand', '', 'pkg_en-NZ', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/en-NZ_details.xml', '', '', ''),
	(14, 2, 0, 'English, USA', '', 'pkg_en-US', 'package', '', 0, '6.1.1.2', '', 'https://update.joomla.org/language/details6/en-US_details.xml', '', '', ''),
	(15, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/et-EE_details.xml', '', '', ''),
	(16, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/fi-FI_details.xml', '', '', ''),
	(17, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/nl-BE_details.xml', '', '', ''),
	(18, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/fr-FR_details.xml', '', '', ''),
	(19, 2, 0, 'French, Canada', '', 'pkg_fr-CA', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/fr-CA_details.xml', '', '', ''),
	(20, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/ka-GE_details.xml', '', '', ''),
	(21, 2, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/de-DE_details.xml', '', '', ''),
	(22, 2, 0, 'German, Austria', '', 'pkg_de-AT', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/de-AT_details.xml', '', '', ''),
	(23, 2, 0, 'German, Liechtenstein', '', 'pkg_de-LI', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/de-LI_details.xml', '', '', ''),
	(24, 2, 0, 'German, Luxembourg', '', 'pkg_de-LU', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/de-LU_details.xml', '', '', ''),
	(25, 2, 0, 'German, Switzerland', '', 'pkg_de-CH', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/de-CH_details.xml', '', '', ''),
	(26, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/el-GR_details.xml', '', '', ''),
	(27, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/hu-HU_details.xml', '', '', ''),
	(28, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/it-IT_details.xml', '', '', ''),
	(29, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/ja-JP_details.xml', '', '', ''),
	(30, 2, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '6.0.4.1', '', 'https://update.joomla.org/language/details6/lo-LA_details.xml', '', '', ''),
	(31, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/lv-LV_details.xml', '', '', ''),
	(32, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/lt-LT_details.xml', '', '', ''),
	(33, 2, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/ms-MY_details.xml', '', '', ''),
	(34, 2, 0, 'Norwegian Bokmål', '', 'pkg_nb-NO', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/nb-NO_details.xml', '', '', ''),
	(35, 2, 0, 'Persian Farsi', '', 'pkg_fa-IR', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/fa-IR_details.xml', '', '', ''),
	(36, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '6.0.0.1', '', 'https://update.joomla.org/language/details6/pl-PL_details.xml', '', '', ''),
	(37, 2, 0, 'Portuguese, Brazil', '', 'pkg_pt-BR', 'package', '', 0, '6.0.3.1', '', 'https://update.joomla.org/language/details6/pt-BR_details.xml', '', '', ''),
	(38, 2, 0, 'Portuguese, Portugal', '', 'pkg_pt-PT', 'package', '', 0, '6.1.0.1', '', 'https://update.joomla.org/language/details6/pt-PT_details.xml', '', '', ''),
	(39, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '6.0.0.1', '', 'https://update.joomla.org/language/details6/ro-RO_details.xml', '', '', ''),
	(40, 2, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/ru-RU_details.xml', '', '', ''),
	(41, 2, 0, 'Serbian, Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '6.1.1.1', '', 'https://update.joomla.org/language/details6/sr-RS_details.xml', '', '', ''),
	(42, 2, 0, 'Serbian, Latin', '', 'pkg_sr-YU', 'package', '', 0, '6.0.4.1', '', 'https://update.joomla.org/language/details6/sr-YU_details.xml', '', '', ''),
	(43, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '6.1.0.1', '', 'https://update.joomla.org/language/details6/sk-SK_details.xml', '', '', ''),
	(44, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/sl-SI_details.xml', '', '', ''),
	(45, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/es-ES_details.xml', '', '', ''),
	(46, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/sv-SE_details.xml', '', '', ''),
	(47, 2, 0, 'Tamil, India', '', 'pkg_ta-IN', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/ta-IN_details.xml', '', '', ''),
	(48, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '6.0.0.2', '', 'https://update.joomla.org/language/details6/th-TH_details.xml', '', '', ''),
	(49, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '6.1.2.3', '', 'https://update.joomla.org/language/details6/tr-TR_details.xml', '', '', ''),
	(50, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/uk-UA_details.xml', '', '', ''),
	(51, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '6.1.2.1', '', 'https://update.joomla.org/language/details6/cy-GB_details.xml', '', '', '');

-- Dumping structure for table px_cons.cons_update_sites
CREATE TABLE IF NOT EXISTS `cons_update_sites` (
  `update_site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT '0',
  `last_check_timestamp` bigint DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

-- Dumping data for table px_cons.cons_update_sites: ~3 rows (approximately)
INSERT INTO `cons_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`, `checked_out`, `checked_out_time`) VALUES
	(1, 'Joomla! Core', 'tuf', 'https://update.joomla.org/cms/', 1, 1784787965, '', NULL, NULL),
	(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_6.xml', 1, 1784787909, '', NULL, NULL),
	(3, 'Joomla! Update Component', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1784787965, '', NULL, NULL),
	(4, '', 'extension', '', 1, 0, '', NULL, NULL);

-- Dumping structure for table px_cons.cons_update_sites_extensions
CREATE TABLE IF NOT EXISTS `cons_update_sites_extensions` (
  `update_site_id` int NOT NULL DEFAULT '0',
  `extension_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

-- Dumping data for table px_cons.cons_update_sites_extensions: ~3 rows (approximately)
INSERT INTO `cons_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
	(1, 247),
	(2, 248),
	(3, 24),
	(4, 252);

-- Dumping structure for table px_cons.cons_usergroups
CREATE TABLE IF NOT EXISTS `cons_usergroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_usergroups: ~9 rows (approximately)
INSERT INTO `cons_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
	(1, 0, 1, 18, 'Public'),
	(2, 1, 8, 15, 'Registered'),
	(3, 2, 9, 14, 'Author'),
	(4, 3, 10, 13, 'Editor'),
	(5, 4, 11, 12, 'Publisher'),
	(6, 1, 4, 7, 'Manager'),
	(7, 6, 5, 6, 'Administrator'),
	(8, 1, 16, 17, 'Super Users'),
	(9, 1, 2, 3, 'Guest');

-- Dumping structure for table px_cons.cons_users
CREATE TABLE IF NOT EXISTS `cons_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint NOT NULL DEFAULT '0',
  `sendEmail` tinyint DEFAULT '0',
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset` tinyint NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_users: ~0 rows (approximately)
INSERT INTO `cons_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`, `authProvider`) VALUES
	(42, 'Super User', 'admin', 'no-reply@gmail.com', '$2y$10$iR50OaVFoLSNClVlw36eheF0Y49xiKfyPcNmB8rVc/jMqEuvHFUNq', 0, 1, '2026-07-23 06:25:06', '2026-07-23 06:25:53', '0', '', NULL, 0, '', '', 0, '');

-- Dumping structure for table px_cons.cons_user_keys
CREATE TABLE IF NOT EXISTS `cons_user_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_user_keys: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_user_mfa
CREATE TABLE IF NOT EXISTS `cons_user_mfa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `options` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `tries` int NOT NULL DEFAULT '0',
  `last_try` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';

-- Dumping data for table px_cons.cons_user_mfa: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_user_notes
CREATE TABLE IF NOT EXISTS `cons_user_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `catid` int unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint NOT NULL DEFAULT '0',
  `checked_out` int unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `modified_user_id` int unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_user_notes: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_user_profiles
CREATE TABLE IF NOT EXISTS `cons_user_profiles` (
  `user_id` int NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- Dumping data for table px_cons.cons_user_profiles: ~0 rows (approximately)
INSERT INTO `cons_user_profiles` (`user_id`, `profile_key`, `profile_value`, `ordering`) VALUES
	(42, 'guidedtour.id.12', '{"state":"skipped"}', 0);

-- Dumping structure for table px_cons.cons_user_usergroup_map
CREATE TABLE IF NOT EXISTS `cons_user_usergroup_map` (
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_user_usergroup_map: ~0 rows (approximately)
INSERT INTO `cons_user_usergroup_map` (`user_id`, `group_id`) VALUES
	(42, 8);

-- Dumping structure for table px_cons.cons_viewlevels
CREATE TABLE IF NOT EXISTS `cons_viewlevels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_viewlevels: ~5 rows (approximately)
INSERT INTO `cons_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
	(1, 'Public', 0, '[1]'),
	(2, 'Registered', 2, '[6,2,8]'),
	(3, 'Special', 3, '[6,3,8]'),
	(5, 'Guest', 1, '[9]'),
	(6, 'Super Users', 4, '[8]');

-- Dumping structure for table px_cons.cons_webauthn_credentials
CREATE TABLE IF NOT EXISTS `cons_webauthn_credentials` (
  `id` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User handle',
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential source data, JSON format',
  PRIMARY KEY (`id`(100)),
  KEY `user_id` (`user_id`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_webauthn_credentials: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_workflows
CREATE TABLE IF NOT EXISTS `cons_workflows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL,
  `modified_by` int NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_extension` (`extension`),
  KEY `idx_default` (`default`),
  KEY `idx_created` (`created`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified` (`modified`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_workflows: ~0 rows (approximately)
INSERT INTO `cons_workflows` (`id`, `asset_id`, `published`, `title`, `description`, `extension`, `default`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`) VALUES
	(1, 56, 1, 'COM_WORKFLOW_BASIC_WORKFLOW', '', 'com_content.article', 1, 1, '2026-07-23 06:25:04', 42, '2026-07-23 06:25:04', 42, NULL, NULL);

-- Dumping structure for table px_cons.cons_workflow_associations
CREATE TABLE IF NOT EXISTS `cons_workflow_associations` (
  `item_id` int NOT NULL DEFAULT '0' COMMENT 'Extension table id value',
  `stage_id` int NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`extension`),
  KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_stage_id` (`stage_id`),
  KEY `idx_extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_workflow_associations: ~0 rows (approximately)

-- Dumping structure for table px_cons.cons_workflow_stages
CREATE TABLE IF NOT EXISTS `cons_workflow_stages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `position` text COLLATE utf8mb4_unicode_ci,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`workflow_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_workflow_stages: ~0 rows (approximately)
INSERT INTO `cons_workflow_stages` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `default`, `position`, `checked_out_time`, `checked_out`) VALUES
	(1, 57, 1, 1, 1, 'COM_WORKFLOW_BASIC_STAGE', '', 1, NULL, NULL, NULL);

-- Dumping structure for table px_cons.cons_workflow_transitions
CREATE TABLE IF NOT EXISTS `cons_workflow_transitions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int DEFAULT '0',
  `ordering` int NOT NULL DEFAULT '0',
  `workflow_id` int NOT NULL,
  `published` tinyint NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_stage_id` int NOT NULL,
  `to_stage_id` int NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_from_stage_id` (`from_stage_id`),
  KEY `idx_to_stage_id` (`to_stage_id`),
  KEY `idx_workflow_id` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table px_cons.cons_workflow_transitions: ~7 rows (approximately)
INSERT INTO `cons_workflow_transitions` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `from_stage_id`, `to_stage_id`, `options`, `checked_out_time`, `checked_out`) VALUES
	(1, 58, 1, 1, 1, 'UNPUBLISH', '', -1, 1, '{"publishing":"0"}', NULL, NULL),
	(2, 59, 2, 1, 1, 'PUBLISH', '', -1, 1, '{"publishing":"1"}', NULL, NULL),
	(3, 60, 3, 1, 1, 'TRASH', '', -1, 1, '{"publishing":"-2"}', NULL, NULL),
	(4, 61, 4, 1, 1, 'ARCHIVE', '', -1, 1, '{"publishing":"2"}', NULL, NULL),
	(5, 62, 5, 1, 1, 'FEATURE', '', -1, 1, '{"featuring":"1"}', NULL, NULL),
	(6, 63, 6, 1, 1, 'UNFEATURE', '', -1, 1, '{"featuring":"0"}', NULL, NULL),
	(7, 64, 7, 1, 1, 'PUBLISH_AND_FEATURE', '', -1, 1, '{"publishing":"1","featuring":"1"}', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
