DROP DATABASE IF EXISTS `loglooker`;
CREATE DATABASE `loglooker`;
USE `loglooker`;

CREATE TABLE `players` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`player_id` VARCHAR(20) NOT NULL UNIQUE,
    `player_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `raids` (
	`id` bigint NOT NULL AUTO_INCREMENT,
    `raid_id` VARCHAR(30) NOT NULL UNIQUE,
    `raid_name` VARCHAR(50) NOT NULL,
    `expansion` VARCHAR(50),
    `version` VARCHAR(50),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `bosses` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`boss_id` VARCHAR(30) NOT NULL UNIQUE,
    `boss_name` VARCHAR(50) NOT NULL,
    `raid_db_id` bigint NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`raid_db_id`) REFERENCES `raids` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `encounters` (
	`id` bigint NOT NULL AUTO_INCREMENT,
    `boss_db_id` bigint NOT NULL,
    `start_time` DATETIME NOT NULL,
    `end_time` DATETIME NOT NULL,
    `duration` INT,
    `result` BOOLEAN NOT NULL,
    `log_file_name` VARCHAR(255),
    `comp_hash` VARCHAR(64),
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`boss_db_id`) REFERENCES `bosses`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `player_fight_stats` (
	`id` bigint NOT NULL AUTO_INCREMENT,
    `player_db_id` bigint NOT NULL,
    `encounter_db_id` bigint NOT NULL,
	`total_damage` DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    `total_healing` DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    `deaths` smallint NOT NULL DEFAULT 0,
    `spells_cast_total` INT NOT NULL DEFAULT 0,
    `downtime` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`player_db_id`) REFERENCES `players`(`id`),
    CONSTRAINT FOREIGN KEY (`encounter_db_id`) REFERENCES `encounters`(`id`),
    UNIQUE (`player_db_id`, `encounter_db_id`)
)DROP DATABASE IF EXISTS `loglooker`;
CREATE DATABASE `loglooker`;
USE `loglooker`;

CREATE TABLE `players` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`player_id` VARCHAR(20) NOT NULL UNIQUE,
    `player_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `raids` (
	`id` bigint NOT NULL AUTO_INCREMENT,
    `raid_id` VARCHAR(30) NOT NULL UNIQUE,
    `raid_name` VARCHAR(50) NOT NULL,
    `expansion` VARCHAR(50),
    `version` VARCHAR(50),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `bosses` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`boss_id` VARCHAR(30) NOT NULL UNIQUE,
    `boss_name` VARCHAR(50) NOT NULL,
    `raid_id` bigint NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`raid_id`) REFERENCES `raids` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `encounters` (
	`id` bigint NOT NULL AUTO_INCREMENT,
    `boss_id` VARCHAR(30) NOT NULL,
    `date` VARCHAR(10) NOT NULL,
    `start_time` DATETIME NOT NULL,
    `end_time` DATETIME NOT NULL,
    `duration` INT,
    `result` BOOLEAN NOT NULL,
    `log_file_name` VARCHAR(255),
    `comp_hash` VARCHAR(64),
    PRIMARY KEY (`id`),
    CONSTRAINT FOREIGN KEY (`boss_id`) REFERENCES `bosses`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
    
    
    
    