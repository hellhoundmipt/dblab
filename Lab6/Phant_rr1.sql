-- Phantom
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION

SELECT * FROM COUNTRY
WHERE country_id > 6

SELECT * FROM COUNTRY
WHERE country_id > 6

COMMIT;