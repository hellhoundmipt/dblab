--Unrepeated read

SET TRANSACTION ISOLATION LEVEL READ COMMITTED

BEGIN TRANSACTION
Select stars FROM HOTELS 
WHERE hotel_id = 1006

Select stars FROM HOTELS 
WHERE hotel_id = 1006

COMMIT