-- event
CREATE EVENT IF NOT EXISTS clear_session ON SCHEDULE EVERY 1 HOUR COMMENT 'clear sessions table' DO
DELETE FROM
    session
WHERE
    period_date < NOW();

CREATE EVENT IF NOT EXISTS clear_refresh_session ON SCHEDULE EVERY 1 HOUR COMMENT 'clear refresh sessions table' DO
DELETE FROM
    refresh
WHERE
    period_date < NOW();

CREATE EVENT IF NOT EXISTS clear_nora_session ON SCHEDULE EVERY 1 HOUR COMMENT 'clear nora question session' DO
DELETE FROM
    nora_session
WHERE
    period_date < NOW();

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
CREATE INDEX `meet_entry_id_index` ON meet(entry_id);
