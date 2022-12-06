CREATE TABLE `biographies` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `is_public` bool NOT NULL DEFAULT false,
    `location_id` int unsigned NOT NULL,
    `position` text NOT NULL,
    `position_ja` text NOT NULL,
    `join` date NOT NULL,
    `leave` date NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `biography_user_id` (`user_id`),
    INDEX `biography_user_id_join` (`user_id`, `join`)
);

CREATE TABLE `categories` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` text NOT NULL,
    `name_ja` text NOT NULL,
    `emoji` varchar(15) NOT NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE `contacts` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `to_user_id` int unsigned NOT NULL,
    `name` text NOT NULL,
    `title` text NOT NULL,
    `detail` text NOT NULL,
    `mail` text NOT NULL,
    `ip` varchar(63) NOT NULL,
    `lang` text NOT NULL,
    `url` text NULL,
    `category` text NULL,
    `custom_title` text NULL,
    `custom_value` text NULL,
    `device_name` varchar(31) NULL,
    `os` varchar(15) NULL,
    `browser_name` varchar(15) NULL,
    `is_mobile` bool NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `contact_to_user_id` (`to_user_id`)
);

CREATE TABLE `links` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `name` text NOT NULL,
    `name_ja` text NOT NULL,
    `site_url` text NOT NULL,
    `favicon_url` text NULL,
    `category_id` int unsigned NOT NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `link_user_id` (`user_id`)
);

CREATE TABLE `locations` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `type` enum('univ', 'corp') NOT NULL,
    `name` text NOT NULL,
    `name_ja` text NOT NULL,
    `address` text NOT NULL,
    `address_ja` text NOT NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE `notices` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `discord_webhook` text NULL,
    `slack_webhook` text NULL,
    `mail` text NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `user_id` (`user_id`)
);

CREATE TABLE `products` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int unsigned NOT NULL,
    `name` text NOT NULL,
    `name_ja` text NOT NULL,
    `detail` text NOT NULL,
    `detail_ja` text NOT NULL,
    `site_url` text NOT NULL,
    `github_url` text NULL,
    `dev_time` date NOT NULL,
    `thumbnail` text NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `product_user_id` (`user_id`),
    INDEX `product_user_id_dev_time` (`user_id`, `dev_time`)
);

CREATE TABLE `sessions` (
    `session_token` char(36) NOT NULL,
    `user_id` int unsigned NOT NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `period` datetime NOT NULL,
    PRIMARY KEY (`session_token`),
    INDEX `session_user_id` (`user_id`)
);

CREATE TABLE `users` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `given_name` varchar(10) NOT NULL,
    `family_name` varchar(10) NOT NULL,
    `given_name_ja` varchar(10) NOT NULL,
    `family_name_ja` varchar(10) NOT NULL,
    `user_id` varchar(10) NOT NULL,
    `mail` varchar(254) NOT NULL,
    `birth_date` date NOT NULL,
    `location` text NOT NULL,
    `location_ja` text NOT NULL,
    `sso_token` text NOT NULL,
    `avatar_url` text NULL,
    `selected` bool NOT NULL DEFAULT false,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);
