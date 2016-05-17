DECLARE @SafetyStockLevel int = 0
,@Uplift int = 5;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

BEGIN TRAN

SELECT stars FROM HOTELS
WHERE hotel_id = 1006;

SET @SafetyStockLevel = @SafetyStockLevel + @Uplift;
WAITFOR DELAY '00:00:05.000';

UPDATE HOTELS
SET stars = @SafetyStockLevel
WHERE hotel_id = 1006;

SELECT stars FROM HOTELS
WHERE hotel_id = 1006;

COMMIT TRAN;