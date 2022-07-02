ALTER TABLE `login_history`
    RENAME COLUMN `browser_name` TO `blowser_name`;

ALTER TABLE `login_history`
    MODIFY `ip_address` INT(10) UNSIGNED NOT NULL;
