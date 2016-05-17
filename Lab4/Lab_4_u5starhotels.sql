SELECT hotel_name, stars FROM HOTELS
WHERE stars = 5; 

UPDATE HOTELS
SET stars = 4 
WHERE stars = 5
AND hotel_id IN (SELECT hotel_id from HOTELS
				WHERE NOT hotel_id IN (SELECT h.hotel_id FROM HOTELS h, FACILITIES f
						WHERE f.name = 'live music'
						AND f.hotel_id = h.hotel_id
						GROUP BY h.hotel_id));

SELECT hotel_name, stars FROM HOTELS
WHERE stars = 5;

--Если отель пятизвёздочный и у него нет опции "живая музыка", то присваиваем отелю 4 звезды 