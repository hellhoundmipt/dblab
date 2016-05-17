IF OBJECT_ID ('del_hotel', 'TR') IS NOT NULL
   DROP TRIGGER del_hotel;
GO

CREATE TRIGGER [dbo].del_hotel
ON HOTELS INSTEAD OF DELETE
AS
	DELETE FROM PRICE
	WHERE suite_id IN
	(SELECT suite_id FROM SUITE s, deleted d
	WHERE s.hotel_id = d.hotel_id)

	DELETE FROM SUITE
	WHERE hotel_id IN
	(SELECT hotel_id FROM deleted)

	DELETE FROM FACILITIES
	WHERE  hotel_id IN
	(SELECT hotel_id FROM deleted)

	UPDATE REVIEW
	SET hotel_id = NULL
	WHERE hotel_id IN
	(SELECT hotel_id FROM deleted)

	DELETE FROM HOTELS
	WHERE hotel_id IN
	(SELECT hotel_id FROM deleted)

