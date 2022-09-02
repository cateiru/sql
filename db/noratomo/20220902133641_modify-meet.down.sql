CREATE INDEX `meet_shop_id_index` ON meet(shop_id);
CREATE INDEX `meet_find_id_index` ON meet(find_id);

ALTER TABLE `entry`
    MODIFY `is_closed` BOOLEAN NOT NULL;

ALTER TABLE `entry` DROP `is_matched`;


ALTER TABLE `meet`
    ADD `shop_id` INT UNSIGNED NOT NULL;
ALTER TABLE `meet`
    ADD `meet_date` DATE;
ALTER TABLE `meet`
    ADD `meet_place` VARCHAR(1024);

ALTER TABLE `meet` DROP `created`;

ALTER TABLE `meet`
    MODIFY `is_cancel` BOOLEAN NOT NULL;
ALTER TABLE `meet`
    MODIFY `is_slapstick` BOOLEAN NOT NULL;
ALTER TABLE `meet`
    MODIFY `find_id` INT UNSIGNED NOT NULL;
