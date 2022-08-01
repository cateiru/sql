-- user table
DROP INDEX `user_name_index` ON user(;
DROP INDEX `mail_index` ON user;

-- login_history table
DROP INDEX `login_history_user_id_index` ON login_history;
DROP INDEX `login_history_ip_address_index` ON login_history;

-- notice table
DROP INDEX `notice_user_id_index` ON notice;

-- mail_post_history table
DROP INDEX `mail_post_history_mail_index` ON mail_post_history;
DROP INDEX `mail_post_history_user_id_index` ON mail_post_history;

-- block table
DROP INDEX `block_user_id_index` ON block;
DROP INDEX `block_target_user_id_index` ON block;

-- report table
DROP INDEX `report_target_user_index` ON report;
DROP INDEX `report_report_user_index` ON report;

-- session table
DROP INDEX `session_user_id_index` ON session;

-- refresh table
DROP INDEX `refresh_session_token_index` ON refresh;
DROP INDEX `refresh_user_id_index` ON refresh;

-- entry table
DROP INDEX `entry_owner_user_id_index` ON entry;
DROP INDEX `entry_shop_id_index` ON entry;

-- shop table
DROP INDEX `shop_hotpepper_index` ON shop;

-- meet table
DROP INDEX `meet_shop_id_index` ON meet;
DROP INDEX `meet_entry_id_index` ON meet;
DROP INDEX `meet_owner_id_index` ON meet;
DROP INDEX `meet_apply_user_id_index` ON meet;
DROP INDEX `meet_find_id_index` ON meet;

-- application table
DROP INDEX `application_shop_id_index` ON application;
DROP INDEX `application_user_id_index` ON application;
DROP INDEX `application_entry_id_index` ON application;

-- ban table
DROP INDEX `ban_ip_address_index` ON ban;
DROP INDEX `ban_mail_index` ON ban;
