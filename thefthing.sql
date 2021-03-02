-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "thefthing" -----------------------------
CREATE DATABASE IF NOT EXISTS `thefthing` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `thefthing`;
-- ---------------------------------------------------------


-- CREATE TABLE "customers" ------------------------------------
CREATE TABLE `customers`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`gender` TinyInt( 1 ) NOT NULL,
	`is_married` TinyInt( 1 ) NOT NULL,
	`address` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`created_at` DateTime NULL,
	`updated_at` DateTime NULL,
	`deleted_at` DateTime NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `customers_email_unique` UNIQUE( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "failed_jobs" ----------------------------------
CREATE TABLE `failed_jobs`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`uuid` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`connection` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`queue` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`payload` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`exception` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`failed_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `failed_jobs_uuid_unique` UNIQUE( `uuid` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE TABLE "migrations" -----------------------------------
CREATE TABLE `migrations`( 
	`id` Int( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`migration` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`batch` Int( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "password_resets" ------------------------------
CREATE TABLE `password_resets`( 
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`token` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users`( 
	`id` BigInt( 0 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email_verified_at` Timestamp NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`remember_token` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
	`created_at` Timestamp NULL,
	`updated_at` Timestamp NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `users_email_unique` UNIQUE( `email` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- -------------------------------------------------------------


-- CREATE INDEX "password_resets_email_index" ------------------
CREATE INDEX `password_resets_email_index` USING BTREE ON `password_resets`( `email` );
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


