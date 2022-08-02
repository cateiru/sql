-- https://github.com/team-ful/noratomo/pull/124 に伴う変更


ALTER TABLE `shop`
    MODIFY `name` VARCHAR(1024) NOT NULL;

ALTER TABLE `shop`
    MODIFY `hotpepper_id` VARCHAR(1024) NOT NULL;


ALTER TABLE `shop`
    ADD `brand_name` VARCHAR(1024) NOT NULL;

ALTER TABLE `shop`
    ADD `country` VARCHAR(1024) NOT NULL;

ALTER TABLE `shop`
    ADD `prefecture` VARCHAR(1024) NOT NULL;

ALTER TABLE `shop`
    ADD `municipality` VARCHAR(1024) NOT NULL;

ALTER TABLE `shop`
    ADD `tel` VARCHAR(255) NOT NULL;

ALTER TABLE `shop`
    ADD `genres` TEXT;

ALTER TABLE `shop`
    ADD `google_map_url` TEXT NOT NULL;



ALTER TABLE `shop`
    DROP `genre_name`;

ALTER TABLE `shop`
    DROP `genre_catch`;

ALTER TABLE `shop`
    DROP `photo_url`;
