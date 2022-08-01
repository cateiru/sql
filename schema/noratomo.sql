-- ユーザ情報

CREATE TABLE IF NOT EXISTS `user` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `display_name` VARCHAR(20),
    `mail` VARCHAR(254) UNIQUE NOT NULL,
    `profile` TEXT,
    `user_name` VARCHAR(64) UNIQUE NOT NULL,
    `age` INT(3) UNSIGNED,
    `gender` INT(1) NOT NULL,
    `is_ban` BOOLEAN DEFAULT 0,
    `is_penalty` BOOLEAN DEFAULT 0,
    `is_admin` BOOLEAN DEFAULT 0,
    `join_date` DATETIME NOT NULL,
    `avatar_url` TEXT,
    PRIMARY KEY (`id`)
);

-- ユーザの認証情報

CREATE TABLE IF NOT EXISTS `cert` (
    `user_id` INT UNSIGNED NOT NULL,
    `password` TEXT,
    `cateiru_sso_id` TEXT,
    PRIMARY KEY (`user_id`)
);

-- ログイン履歴

CREATE TABLE IF NOT EXISTS `login_history` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `ip_address` VARBINARY(16) NOT NULL,
    `device_name` VARCHAR(256),
    `os` VARCHAR(256),
    `is_phone` BOOLEAN,
    `is_tablet` BOOLEAN,
    `is_desktop` BOOLEAN,
    `browser_name` VARCHAR(256),
    `login_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
);

-- 通知

CREATE TABLE IF NOT EXISTS `notice` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `title` VARCHAR(512) NOT NULL,
    `text` TEXT,
    `url` VARCHAR(8190),
    `is_read` BOOLEAN,
    PRIMARY KEY (`id`)
);

-- メール送信履歴

CREATE TABLE IF NOT EXISTS `mail_post_history` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `mail` VARCHAR(254) NOT NULL,
    `user_id` INT UNSIGNED,
    `title` VARCHAR(512) NOT NULL,
    `body` TEXT NOT NULL,
    `body_html` TEXT,
    PRIMARY KEY (`id`)
);

-- ブロックしているユーザ

CREATE TABLE IF NOT EXISTS `block` (
    `user_id` INT UNSIGNED NOT NULL,
    `target_user` INT UNSIGNED NOT NULL
);

-- 報告

CREATE TABLE IF NOT EXISTS `report` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `target_user` INT UNSIGNED NOT NULL,
    `report_user` INT UNSIGNED NOT NULL,
    `reason` TEXT NOT NULL,
    `category` VARCHAR(256),
    PRIMARY KEY (`id`)
);

-- ユーザの数字統計（利用回数）

CREATE TABLE IF NOT EXISTS `number_of` (
    `user_id` INT UNSIGNED UNIQUE NOT NULL,
    `evaluations` MEDIUMINT UNSIGNED,
    `meet` MEDIUMINT UNSIGNED,
    `application` MEDIUMINT UNSIGNED,
    PRIMARY KEY (`user_id`)
);

-- ユーザの評価

CREATE TABLE IF NOT EXISTS `evaluation` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `target_user` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

-- セッショントークン

CREATE TABLE IF NOT EXISTS `session` (
    `session_token` VARCHAR(256) UNIQUE NOT NULL,
    `date` DATETIME NOT NULL,
    `period_date` DATETIME NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`session_token`)
);

-- リフレッシュトークン

CREATE TABLE IF NOT EXISTS `refresh` (
    `refresh_token` VARCHAR(256) UNIQUE NOT NULL,
    `session_token` VARCHAR(256) UNIQUE NOT NULL,
    `date` DATETIME NOT NULL,
    `period_date` DATETIME NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`refresh_token`)
);

-- 投稿エントリ

CREATE TABLE IF NOT EXISTS `entry` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `owner_user_id` INT UNSIGNED NOT NULL,
    `title` VARCHAR(512) NOT NULL,
    `shop_id` INT UNSIGNED NOT NULL,
    `number_of_people` INT UNSIGNED NOT NULL,
    `date` DATETIME NOT NULL,
    `body` TEXT,
    `is_closed` BOOLEAN NOT NULL,
    PRIMARY KEY (`id`)
);

-- 店情報

CREATE TABLE IF NOT EXISTS `shop` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `name` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `lat` FLOAT NOT NULL,
    `lon` FLOAT NOT NULL,
    `genre_name` TEXT NOT NULL,
    `genre_catch` TEXT,
    `gender` INT(1) NOT NULL,
    `site_url` TEXT NOT NULL,
    `photo_url` TEXT,
    `hotpepper_id` VARCHAR(64),
    PRIMARY KEY (`id`)
);

-- 会うとき

CREATE TABLE IF NOT EXISTS `meet` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `shop_id` INT UNSIGNED NOT NULL,
    `entry_id` INT UNSIGNED NOT NULL,
    `owner_id` INT UNSIGNED NOT NULL,
    `apply_user_id` INT UNSIGNED NOT NULL,
    `meet_date` DATE,
    `approve_date` DATE,
    `meet_place` VARCHAR(1024),
    `is_cancel` BOOLEAN NOT NULL,
    `is_slapstick` BOOLEAN NOT NULL,
    `find_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

-- 行くリクエスト

CREATE TABLE IF NOT EXISTS `application` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `shop_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `entry_id` INT UNSIGNED NOT NULL,
    `body` TEXT,
    `apply_date` DATETIME NOT NULL,
    `is_meeted` BOOLEAN NOT NULL,
    PRIMARY KEY (`id`)
);

-- Banユーザ

CREATE TABLE IF NOT EXISTS `ban` (
    `ip_address` INT(10) UNSIGNED NOT NULL,
    `mail` VARCHAR(254) NOT NULL
);

-- 野良認証のセッション情報

CREATE TABLE IF NOT EXISTS `nora_session` (
    `token` INT UNSIGNED NOT NULL,
    `total_questions` SMALLINT NOT NULL,
    `current_question` SMALLINT NOT NULL,
    `score` INT UNSIGNED NOT NULL,
    `question_ids` TEXT NOT NULL,
    PRIMARY KEY (`token`)
);

-- 野良認証の問題

CREATE TABLE IF NOT EXISTS `nora_question` (
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
    `question_title` TEXT NOT NULL,
    `answers` TEXT NOT NULL,
    `current_answer_index` SMALLINT NOT NULL,
    `score` INT NOT NULL,
    PRIMARY KEY (`id`)
);

-- event


CREATE EVENT IF NOT EXISTS clear_session
    ON SCHEDULE
        EVERY 1 HOUR
    COMMENT 'clear sessions table'
    DO
        DELETE FROM session WHERE period_date < NOW();

CREATE EVENT IF NOT EXISTS clear_refresh_session
    ON SCHEDULE
        EVERY 1 HOUR
    COMMENT 'clear refresh sessions table'
    DO
        DELETE FROM refresh WHERE period_date < NOW();

-- index

-- user table
CREATE UNIQUE INDEX `user_name_index` ON user(user_name);
CREATE UNIQUE INDEX `mail_index` ON user(mail);

-- login_history table
CREATE INDEX `login_history_user_id_index` ON login_history(user_id);
CREATE INDEX `login_history_ip_address_index` ON login_history(ip_address);

-- notice table
CREATE INDEX `notice_user_id_index` ON notice(user_id);

-- mail_post_history table
CREATE INDEX `mail_post_history_mail_index` ON mail_post_history(mail);
CREATE INDEX `mail_post_history_user_id_index` ON mail_post_history(user_id);

-- block table
CREATE INDEX `block_user_id_index` ON block(user_id);
CREATE INDEX `block_target_user_id_index` ON block(target_user);

-- report table
CREATE INDEX `report_target_user_index` ON report(target_user);
CREATE INDEX `report_report_user_index` ON report(report_user);

-- session table
CREATE INDEX `session_user_id_index` ON session(user_id);

-- refresh table
CREATE INDEX `refresh_session_token_index` ON refresh(session_token);
CREATE INDEX `refresh_user_id_index` ON refresh(user_id);

-- entry table
CREATE INDEX `entry_owner_user_id_index` ON entry(owner_user_id);
CREATE INDEX `entry_shop_id_index` ON entry(shop_id);

-- shop table
CREATE UNIQUE INDEX `shop_hotpepper_index` ON shop(hotpepper_id);

-- meet table
CREATE INDEX `meet_shop_id_index` ON meet(shop_id);
CREATE INDEX `meet_entry_id_index` ON meet(entry_id);
CREATE INDEX `meet_owner_id_index` ON meet(owner_id);
CREATE INDEX `meet_apply_user_id_index` ON meet(apply_user_id);
CREATE INDEX `meet_find_id_index` ON meet(find_id);

-- application table
CREATE INDEX `application_shop_id_index` ON application(shop_id);
CREATE INDEX `application_user_id_index` ON application(user_id);
CREATE INDEX `application_entry_id_index` ON application(entry_id);

-- ban table
CREATE INDEX `ban_ip_address_index` ON ban(ip_address);
CREATE INDEX `ban_mail_index` ON ban(mail);