-- Phantom
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

BEGIN TRANSACTION

SELECT * FROM COUNTRY
WHERE country_id > 6

SELECT * FROM COUNTRY
WHERE country_id > 6

COMMIT;