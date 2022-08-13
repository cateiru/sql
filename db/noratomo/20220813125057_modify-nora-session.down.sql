ALTER TABLE `nora_session`
    MODIFY `token` INT UNSIGNED NOT NULL;

ALTER TABLE `nora_session`
    ADD `total_questions` SMALLINT NOT NULL;
ALTER TABLE `nora_session`
    ADD `current_question` SMALLINT NOT NULL;
ALTER TABLE `nora_session`
    ADD `score` INT UNSIGNED NOT NULL;

ALTER TABLE `nora_session` DROP `created`;
ALTER TABLE `nora_session` DROP `period_date`;

DROP EVENT IF EXISTS `clear_nora_session`;
