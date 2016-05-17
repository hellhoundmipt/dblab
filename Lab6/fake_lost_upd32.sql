SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 

BEGIN TRAN
Declare @aux_stars int

SELECT @aux_stars = stars FROM HOTELS
WHERE hotel_id = 1006

PRINT @aux_stars

WAITFOR DELAY '00:00:01'

SET @aux_stars = @aux_stars + 10

UPDATE HOTELS
SET stars = @aux_stars
WHERE hotel_id = 1006

COMMIT
SELECT @aux_stars = stars FROM HOTELS
WHERE hotel_id = 1006

PRINT @aux_stars

WAITFOR DELAY '00:00:10'

SELECT @aux_stars = stars FROM HOTELS
WHERE hotel_id = 1006

PRINT @aux_stars

