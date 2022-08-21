-- number_of

ALTER TABLE `number_of`
    MODIFY `evaluations` MEDIUMINT UNSIGNED;

ALTER TABLE `number_of`
    MODIFY `meet` MEDIUMINT UNSIGNED;

ALTER TABLE `number_of`
    MODIFY `application` MEDIUMINT UNSIGNED

ALTER TABLE `number_of` DROP `entry`;

-- entry

ALTER TABLE `entry` DROP `request_people`;

-- application

ALTER TABLE `application`
    ADD `body` TEXT;
ALTER TABLE `application`
    ADD `is_meeted` BOOLEAN NOT NULL;

ALTER TABLE `application` DROP `is_met`;
ALTER TABLE `application` DROP `is_closed`;

ALTER TABLE `application`
    MODIFY `apply_date` DATETIME NOT NULL;
