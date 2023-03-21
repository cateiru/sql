
CREATE TABLE `contact_defaults` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `name` text NULL,
    `email` text NULL,
    `url` text NULL,
    `category` text NULL,
    `custom_title` text NULL,
    `description` text NULL,
    `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) CHARSET utf8mb4 COLLATE utf8mb4_bin;
