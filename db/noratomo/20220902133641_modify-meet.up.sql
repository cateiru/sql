DROP INDEX `meet_shop_id_index` ON meet;
DROP INDEX `meet_find_id_index` ON meet;

ALTER TABLE `entry`
    MODIFY `is_closed` BOOLEAN NOT NULL DEFAULT 0;

ALTER TABLE `entry`
    ADD `is_matched` BOOLEAN NOT NULL DEFAULT 0;


ALTER TABLE `meet` DROP `shop_id`;
ALTER TABLE `meet` DROP `meet_date`;
ALTER TABLE `meet` DROP `meet_place`;

ALTER TABLE `meet`
    ADD `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `meet`
    MODIFY `is_cancel` BOOLEAN NOT NULL DEFAULT 0;
ALTER TABLE `meet`
    MODIFY `is_slapstick` BOOLEAN NOT NULL DEFAULT 0;
ALTER TABLE `meet`
    MODIFY `find_id` TEXT NOT NULL;
