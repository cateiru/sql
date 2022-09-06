-- entry

ALTER TABLE `entry` DROP `meeting_lat`;
ALTER TABLE `entry` DROP `meeting_lon`;
ALTER TABLE `entry` DROP `meet_date`;

-- shop

ALTER TABLE `shop`
    MODIFY `lat` FLOAT NOT NULL;
ALTER TABLE `shop`
    MODIFY `lon` FLOAT NOT NULL;

-- meet

ALTER TABLE `meet`
    ADD `approve_date` DATE;
