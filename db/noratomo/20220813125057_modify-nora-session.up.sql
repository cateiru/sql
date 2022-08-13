ALTER TABLE `nora_session`
    MODIFY `token` CHAR(64) NOT NULL;

ALTER TABLE `nora_session` DROP `total_questions`;
ALTER TABLE `nora_session` DROP `current_question`;
ALTER TABLE `nora_session` DROP `score`;

ALTER TABLE `nora_session`
    ADD `created` DATETIME NOT NULL;

ALTER TABLE `nora_session`
    ADD `period_date` DATETIME NOT NULL;

CREATE EVENT IF NOT EXISTS clear_nora_session
    ON SCHEDULE
        EVERY 1 HOUR
    COMMENT 'clear nora question session'
    DO
        DELETE FROM nora_session WHERE period_date < NOW();
