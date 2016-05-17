DECLARE @SafetyStockLevel int = 0
,@Uplift int = 100;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED 

BEGIN TRAN

SELECT stars FROM HOTELS
WHERE hotel_id = 1006;

SET @SafetyStockLevel = @SafetyStockLevel + @Uplift;

UPDATE HOTELS
SET stars = @SafetyStockLevel
WHERE hotel_id = 1006;
SELECT stars FROM HOTELS
WHERE hotel_id = 1006;
COMMIT TRAN;