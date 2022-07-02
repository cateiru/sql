-- https://github.com/team-ful/noratomo/pull/89 に伴う変更
-- typoの修正と、IPv6対応

ALTER TABLE `login_history`
    RENAME COLUMN `blowser_name` TO `browser_name`;

ALTER TABLE `login_history`
    MODIFY `ip_address` VARBINARY(16) NOT NULL;
