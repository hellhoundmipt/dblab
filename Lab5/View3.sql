IF OBJECT_ID ('facility_view', 'V') IS NOT NULL
    DROP VIEW facility_view;
GO

CREATE VIEW facility_view
AS
SELECT distinct f.name AS 'Facility', COUNT(hid) AS 'Cnt of hotels with this facility in Roma' FROM FACILITIES f, 
	(SELECT h.hotel_id AS hid FROM HOTELS h, ADDRESS a, LOCALITY l
	WHERE h.hotel_id = a.addr_id
	AND a.locality_id = l.locality_id
	AND l.name = 'Roma'
	) AS aux
WHERE aux.hid = f.hotel_id
GROUP BY f.name
GO
SELECT * FROM facility_view;
GO

SELECT AVG([Cnt of hotels with this facility in Roma]) AS 'Average' FROM facility_view