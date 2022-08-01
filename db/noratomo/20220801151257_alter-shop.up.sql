-- https://github.com/team-ful/noratomo/pull/124 に伴う変更

-- 変更

ALTER TABLE `shop`
    MODIFY `name` TEXT NOT NULL;

ALTER TABLE `shop`
    MODIFY `hotpepper_id` VARCHAR(64);

-- カラム削除

ALTER TABLE `shop` DROP `brand_name`;

ALTER TABLE `shop` DROP `country`;

ALTER TABLE `shop` DROP `prefecture`;

ALTER TABLE `shop` DROP `municipality`;

ALTER TABLE `shop` DROP `tel`;

ALTER TABLE `shop` DROP `genres`;

ALTER TABLE `shop` DROP `google_map_url`;

-- 追加

ALTER TABLE `shop`
    ADD `genre_name` TEXT NOT NULL;

ALTER TABLE `shop`
    ADD `genre_catch` TEXT;

ALTER TABLE `shop`
    ADD `photo_url` TEXT;
