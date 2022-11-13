CREATE TABLE `sessions` (
    `session_token` CHAR (36) NOT NULL,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `period` DATETIME NOT NULL,
    PRIMARY KEY (`session_token`),
    INDEX `session_user_id` (`user_id`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE `contacts` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `to_user_id` INT (10) UNSIGNED NOT NULL,
    `name` TEXT NOT NULL,
    `title` TEXT NOT NULL,
    `detail` TEXT NOT NULL,
    `mail` TEXT NOT NULL,
    `ip` VARCHAR (16) NOT NULL,
    `lang` TEXT NOT NULL,
    `url` TEXT,
    `category` TEXT,
    `custom_title` TEXT,
    `custom_value` TEXT,
    `device_name` VARCHAR (31) DEFAULT NULL,
    `os` VARCHAR (15) DEFAULT NULL,
    `browser_name` VARCHAR (15) DEFAULT NULL,
    `is_mobile` TINYINT (1) DEFAULT NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `contact_to_user_id` (`to_user_id`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE `links` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `name` TEXT NOT NULL,
    `name_ja` TEXT NOT NULL,
    `site_url` TEXT NOT NULL,
    `favicon_url` TEXT NOT NULL,
    `category_id` INT (10) UNSIGNED NOT NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `link_user_id` (`user_id`)
);

CREATE TABLE `biographies` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `is_public` TINYINT (1) NOT NULL DEFAULT 0,
    `location_id` INT (10) UNSIGNED NOT NULL,
    `position` TEXT NOT NULL,
    `position_ja` TEXT NOT NULL,
    `join` DATE NOT NULL,
    `leave` DATE DEFAULT NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `biography_user_id` (`user_id`),
    INDEX `biography_user_id_join` (`user_id`, `join`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE `notices` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `discord_webhook` TEXT,
    `slack_webhook` TEXT,
    `mail` TEXT,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `user_id` (`user_id`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE `categories` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `name_ja` TEXT NOT NULL,
    `emoji` CHAR (1) NOT NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE `locations` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` ENUM ('univ', 'corp') NOT NULL,
    `name` TEXT NOT NULL,
    `name_ja` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `address_ja` TEXT NOT NULL,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE `products` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT (10) UNSIGNED NOT NULL,
    `name` TEXT NOT NULL,
    `name_ja` TEXT NOT NULL,
    `detail` TEXT NOT NULL,
    `detail_ja` TEXT NOT NULL,
    `site_url` TEXT NOT NULL,
    `github_url` TEXT,
    `dev_time` DATE NOT NULL,
    `thumbnail` TEXT,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `product_user_id` (`user_id`),
    INDEX `product_user_id_dev_time` (`user_id`, `dev_time`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE `users` (
    `id` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `given_name` VARCHAR (10) NOT NULL,
    `family_name` VARCHAR (10) NOT NULL,
    `given_name_ja` VARCHAR (10) NOT NULL,
    `family_name_ja` VARCHAR (10) NOT NULL,
    `user_id` VARCHAR (10) NOT NULL,
    `mail` VARCHAR (254) NOT NULL,
    `birth_date` DATE NOT NULL,
    `location` TEXT NOT NULL,
    `location_ja` TEXT NOT NULL,
    `sso_token` TEXT NOT NULL,
    `avatar_url` TEXT,
    `selected` TINYINT (1) NOT NULL DEFAULT 0,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` DATETIME ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;
