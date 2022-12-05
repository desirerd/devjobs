/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `vacante_id` bigint unsigned NOT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidatos_user_id_foreign` (`user_id`),
  KEY `candidatos_vacante_id_foreign` (`vacante_id`),
  CONSTRAINT `candidatos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidatos_vacante_id_foreign` FOREIGN KEY (`vacante_id`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `salarios`;
CREATE TABLE `salarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vacantes`;
CREATE TABLE `vacantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salario_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_dia` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publicado` int NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacantes_salario_id_foreign` (`salario_id`),
  KEY `vacantes_categoria_id_foreign` (`categoria_id`),
  KEY `vacantes_user_id_foreign` (`user_id`),
  CONSTRAINT `vacantes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_salario_id_foreign` FOREIGN KEY (`salario_id`) REFERENCES `salarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 'ob0lu89uJiuKoDEzAzJu4co8S49XWE161zfxuwOh.pdf', '2022-12-03 00:34:46', '2022-12-03 00:34:46');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(2, 5, 1, 'hHyExVhZ9ytSulLMkVaJKlhY0HSwBXOTvgrN94WX.pdf', '2022-12-03 00:37:43', '2022-12-03 00:37:43');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(3, 5, 1, 'KO7dCgr0KxXuK1n31t8VKbQb4eJmdZ0mFWW8CWLa.pdf', '2022-12-03 00:38:32', '2022-12-03 00:38:32');
INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(4, 5, 1, 'SVWzVB7f4RpURJg0hkHqP61T4eFCT69VrGC1Kpc3.pdf', '2022-12-03 16:59:07', '2022-12-03 16:59:07'),
(5, 5, 1, 'k16eHvryaNthxJwtEvdbka1DDuD4wmv8BQniMifJ.pdf', '2022-12-03 17:25:28', '2022-12-03 17:25:28'),
(6, 5, 1, '6V3llAJcxu4ldUZom7YJBbHmLPk8f3fBVfuMfPHg.pdf', '2022-12-03 17:25:49', '2022-12-03 17:25:49'),
(7, 5, 1, 'vlwF5qK0OPG18ffB9OnerZpE1A9L5Z3GXjTcQ8C9.pdf', '2022-12-03 17:27:13', '2022-12-03 17:27:13'),
(8, 5, 1, 'mKfxaarVxyRDCyJtRJiv43MwyKYIRl4zWAGOqaGM.pdf', '2022-12-03 17:31:47', '2022-12-03 17:31:47'),
(9, 5, 6, 'PnGTKNmQU3HVM2rI4eiID9CJcq4qhYna7aEs2Gcw.pdf', '2022-12-03 18:51:30', '2022-12-03 18:51:30'),
(10, 5, 6, '4R5dIB82DmxapLxnDt5jpvRT4jQgsE6hGKMbd4tV.pdf', '2022-12-03 18:52:01', '2022-12-03 18:52:01');

INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Backend Developer', '2022-11-25 00:46:31', '2022-11-25 00:46:31');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(2, 'Front end Developer', '2022-11-25 00:46:31', '2022-11-25 00:46:31');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(3, 'Mobile Developer', '2022-11-25 00:46:32', '2022-11-25 00:46:32');
INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(4, 'Techlead', '2022-11-25 00:46:32', '2022-11-25 00:46:32'),
(5, 'UX / UI Design', '2022-11-25 00:46:32', '2022-11-25 00:46:32'),
(6, 'Software Architecture', '2022-11-25 00:46:32', '2022-11-25 00:46:32'),
(7, 'Devops', '2022-11-25 00:46:32', '2022-11-25 00:46:32');



INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_24_015808_add_rol_to_users_table', 2),
(18, '2022_11_24_123035_create_vacante_table', 3),
(19, '2022_11_24_172450_create_salarios_table', 3),
(20, '2022_11_24_180437_create_categorias_table', 3),
(21, '2022_11_24_192931_add_columns_to_vacantes_table', 3),
(22, '2022_12_02_233638_create_candidatos_table', 4),
(23, '2022_12_03_004648_create_notifications_table', 5);

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0924695a-914f-49c0-8a34-7beeb8ebb772', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":1,\"nombre_vacante\":\"Analista Php y Vue\",\"usuario_id\":5}', NULL, '2022-12-03 16:59:30', '2022-12-03 17:21:04');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('754441be-ff81-4c5c-aba1-8f471c81871d', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":1,\"nombre_vacante\":\"Analista Php y Vue\",\"usuario_id\":5}', NULL, '2022-12-03 17:25:51', '2022-12-03 17:25:59');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('80cbedcf-2ec6-4259-87e1-956e724ef4c3', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":1,\"nombre_vacante\":\"Analista Php y Vue\",\"usuario_id\":5}', NULL, '2022-12-03 17:25:51', '2022-12-03 17:32:01');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('97781e80-0363-4938-8b6b-41bd3474d624', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 7, '{\"id_vacante\":6,\"nombre_vacante\":\"Puesto de trabajo Usuario 2\",\"usuario_id\":5}', '2022-12-03 18:52:35', '2022-12-03 18:52:03', '2022-12-03 18:52:35'),
('d01d2430-2d6a-44fc-81fd-34188cb70ba4', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":1,\"nombre_vacante\":\"Analista Php y Vue\",\"usuario_id\":5}', NULL, '2022-12-03 17:25:51', '2022-12-03 17:25:59'),
('ed075ac1-c442-4aaa-8fa0-ee7a3511b932', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 5, '{\"id_vacante\":1,\"nombre_vacante\":\"Analista Php y Vue\",\"usuario_id\":5}', NULL, '2022-12-03 17:27:14', '2022-12-03 17:27:14'),
('f4e798f7-2f65-4e6e-bf7c-933b7b1deae7', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 7, '{\"id_vacante\":6,\"nombre_vacante\":\"Puesto de trabajo Usuario 2\",\"usuario_id\":5}', '2022-12-03 18:52:35', '2022-12-03 18:51:47', '2022-12-03 18:52:35');

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('correo@correo.com', '$2y$10$LHt1ilqVeFINud1.KeQWLueHJj3kLz79.yTqpGMYyfX4W7E0ZWeOO', '2022-11-24 01:16:12');




INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(1, '$0 - $499', '2022-11-25 00:46:27', '2022-11-25 00:46:27');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(2, '$500 - $749', '2022-11-25 00:46:30', '2022-11-25 00:46:30');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(3, '$750 - $999', '2022-11-25 00:46:30', '2022-11-25 00:46:30');
INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(4, '$1000 - $1499', '2022-11-25 00:46:31', '2022-11-25 00:46:31'),
(5, '$1500 - $1999', '2022-11-25 00:46:31', '2022-11-25 00:46:31'),
(6, '$2000 - $2499', '2022-11-25 00:46:31', '2022-11-25 00:46:31'),
(7, '$2500 - $2999', '2022-11-25 00:46:31', '2022-11-25 00:46:31'),
(8, '$3000 - $4999', '2022-11-25 00:46:31', '2022-11-25 00:46:31'),
(9, '+$5000', '2022-11-25 00:46:31', '2022-11-25 00:46:31');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(5, 'lolita', 'lolita@lolita.es', '2022-11-24 02:02:42', '$2y$10$xSTLVHJB/LHRNL471PUfHeasnyM1Daf6zIqL0.rHZYZanb5vz0Xt.', 'DBuI8wjhg6cGhv3NWm8eUosRMkqvYpIPSkoowJW1FaBKEC6jCDYtMXXWJ3cf', '2022-11-24 02:02:22', '2022-11-24 02:02:42', 1);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(6, 'user1', 'user1@user1.com', NULL, '$2y$10$DgyuCMRe7NCGTK9xf5OSIenbyB9JlQ7J.aHUoBUIwQbAcFDajZIFW', NULL, '2022-12-02 16:31:23', '2022-12-02 16:31:23', 1);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(7, 'usuario2', 'user2@user2.com', '2022-11-24 02:02:42', '$2y$10$xSTLVHJB/LHRNL471PUfHeasnyM1Daf6zIqL0.rHZYZanb5vz0Xt.', 'lNwQTYzxtJJ2Ctn1ozwdxHKZ5eDy66ZBZ9nLF9IDMR3qKAxTGXNLfInoemzF', '2022-11-24 02:02:22', '2022-11-24 02:02:42', 2);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(8, 'usuario3', 'user3@user3.com', '2022-11-24 02:02:42', '$2y$10$xSTLVHJB/LHRNL471PUfHeasnyM1Daf6zIqL0.rHZYZanb5vz0Xt.', '1PNXyHCYL8U52jbscHZJmOIYANG4fH3zdpqgYwaoA5gudX4GBgFxCP9X3Jp6', '2022-11-24 02:02:22', '2022-11-24 02:02:42', 2);

INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(1, '2022-11-25 01:01:52', '2022-11-29 17:30:54', 'Analista Php y Vue', 7, 1, 'Sony', '2022-11-30', 'Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue Analista Php y Vue .', '1kQqcqsheGGupIjGsYgggP1NO9wCmnr8prlbyx0y.jpg', 1, 5);
INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(3, '2022-11-25 01:06:46', '2022-11-25 01:06:46', 'Puesto desarrollador en Wordpress', 8, 2, 'Inditex', '2022-12-07', 'Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress Puesto desarrollador en Wordpress .', '6aRaRVmHhnuRqcB8z06typnu2CM8RolVWEA8bshQ.jpg', 1, 5);
INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(5, '2022-11-25 01:21:19', '2022-11-25 01:21:19', 'dfghdfgh', 4, 4, 'fasdfasd', '2022-12-03', 'a sdfasdf asdfasdfasdfasdf', '2BgsokpvkhPZJCipaQT10RnDJ9o4G7Ze3SX5s9lP.jpg', 1, 5);
INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(6, '2022-12-03 18:49:27', '2022-12-03 18:49:27', 'Puesto de trabajo Usuario 2', 5, 3, 'Samsung', '2022-12-28', 'Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción Descripción.', 'xPoRHzkCwfd46obUarhJMtfiM9B0SLriYVLyKtZc.jpg', 1, 7);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;