-- number_of

ALTER TABLE `number_of`
    MODIFY `evaluations` MEDIUMINT UNSIGNED DEFAULT 0;

ALTER TABLE `number_of`
    MODIFY `meet` MEDIUMINT UNSIGNED DEFAULT 0;

ALTER TABLE `number_of`
    MODIFY `application` MEDIUMINT UNSIGNED DEFAULT 0;

ALTER TABLE `number_of`
    ADD `entry` MEDIUMINT UNSIGNED DEFAULT 0;


-- entry

ALTER TABLE `entry`
    ADD `request_people` INT UNSIGNED NOT NULL DEFAULT 0;

-- application

ALTER TABLE `application` DROP `body`;
ALTER TABLE `application` DROP `is_meeted`;

ALTER TABLE `application`
    ADD `is_met` BOOLEAN NOT NULL DEFAULT 0;
ALTER TABLE `application`
    ADD `is_closed` BOOLEAN NOT NULL DEFAULT 0;

ALTER TABLE `application`
    MODIFY `apply_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
