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

/*������������ �������: ��� �������� ����� ������ ��������� ��� ������� ���-������� 
� ��� ����� ������, � � ��� ����������� ���-������� ������������� ����� ������ ���������� �� 0.
��: ��� �������� ����� ��������� ��� ������� ����� � ������ �� ��� � ��� ��������, � � ������������
� ������ ������������� ����� ���������� �� NULL*/