SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 

BEGIN TRAN
Declare @aux_stars int

SELECT @aux_stars = stars FROM HOTELS
WHERE hotel_id = 1006

PRINT @aux_stars

WAITFOR DELAY '00:00:07'

SET @aux_stars = @aux_stars - 1

UPDATE HOTELS
SET stars = @aux_stars
WHERE hotel_id = 1006

COMMIT
SELECT @aux_stars = stars FROM HOTELS
WHERE hotel_id = 1006;

PRINT @aux_stars

UPDATE HOTELS
SET stars = 3
WHERE hotel_id = 1006
