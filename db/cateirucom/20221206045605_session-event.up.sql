CREATE EVENT IF NOT EXISTS clear_session ON SCHEDULE EVERY 1 HOUR COMMENT 'clear sessions table' DO
DELETE FROM
    sessions
WHERE
    period < NOW();
