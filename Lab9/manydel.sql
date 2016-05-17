SELECT * FROM HOTELS
SELECT * FROM REVIEW
SELECT * FROM SUITE

DELETE FROM HOTELS
WHERE hotel_id IN
	(SELECT hotel_id FROM HOTELS h, ADDRESS a, LOCALITY l, LOCALITY_TYPE lt
	WHERE lt.type_id = l.type
	AND a.locality_id = l.locality_id
	AND h.hotel_id = a.addr_id
	AND lt.name = 'City'
	)

SELECT * FROM HOTELS
SELECT * FROM REVIEW
SELECT * FROM SUITE