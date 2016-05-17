IF OBJECT_ID ('del_hotel', 'TR') IS NOT NULL
   DROP TRIGGER del_hotel;
GO

CREATE TRIGGER [dbo].del_hotel
ON HOTELS INSTEAD OF DELETE
AS
IF @@ROWCOUNT = 1
BEGIN
	DECLARE @id INT
	SELECT @id = hotel_id FROM deleted

	DELETE FROM PRICE
	WHERE suite_id IN
	(SELECT suite_id FROM SUITE
	WHERE hotel_id = @id)

	DELETE FROM SUITE
	WHERE hotel_id = @id

	DELETE FROM FACILITIES
	WHERE  hotel_id = @id

	UPDATE REVIEW
	SET hotel_id = NULL
	WHERE hotel_id = @id

	DELETE FROM HOTELS
	WHERE hotel_id = @id

END

/*Каноническое задание: При удалении места отдыха удаляются все будущие тур-поездки 
в это место отдыха, а у уже совершенных тур-поездок идентификатор места отдыха заменяется на 0.
Моё: при удалении отеля удаляются все комнаты отеля с ценами на них и все удобства, а у комментариев
к отелям идентификатор отеля заменяется на NULL*/