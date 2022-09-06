-- 破壊的変更を行うため、一度entry関連のテーブルをクリアにしてしまう
-- 本番環境は関係者しか使用していないため、影響はない

TRUNCATE TABLE `entry`;
TRUNCATE TABLE `shop`;
TRUNCATE TABLE `application`;
TRUNCATE TABLE `meet`;
TRUNCATE TABLE `number_of`;

-- entry

ALTER TABLE `entry`
    ADD `meeting_lat` DOUBLE NOT NULL;
ALTER TABLE `entry`
    ADD `meeting_lon` DOUBLE NOT NULL;
ALTER TABLE `entry`
    ADD `meet_date` DATETIME NOT NULL;

-- shop

ALTER TABLE `shop`
    MODIFY `lat` DOUBLE NOT NULL;
ALTER TABLE `shop`
    MODIFY `lon` DOUBLE NOT NULL;

-- meet

ALTER TABLE `meet`
    DROP `approve_date`;
