--Phantom
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION

INSERT INTO COUNTRY VALUES (10, 'Hakoona Matata');

COMMIT;