IF OBJECT_ID ('test_view', 'V') IS NOT NULL
    DROP VIEW test_view;
GO

CREATE VIEW test_view
AS
SELECT r.review, IIF((t.first_name IS NOT NULL) AND (t.second_name IS NOT NULL), CONCAT(t.first_name, ' ', t.second_name), t.nickname) AS 'traveler', 
	h.hotel_name, r.review_date FROM HOTELS h, REVIEW r, TRAVELER t
WHERE h.hotel_id = r.hotel_id
AND r.traveler_id = t.traveler_id
GO
SELECT * FROM test_view;
GO
