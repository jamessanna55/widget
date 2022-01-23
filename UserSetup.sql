-- Set the session to pluggable db connetion.
-- ALTER SESSION SET container = xepdb1;

-- User setup
CREATE USER widget IDENTIFIED BY widget;

GRANT
    CREATE SESSION
TO widget;

GRANT
    CREATE TABLE,
    CREATE VIEW,
    CREATE PROCEDURE,
    CREATE SEQUENCE
TO widget;

GRANT
    UNLIMITED TABLESPACE
TO widget;