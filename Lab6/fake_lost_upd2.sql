SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN TRANSACTION 

UPDATE HOTELS SET stars = a + 1 FROM AUX WHERE hotel_id = 1006

COMMIT