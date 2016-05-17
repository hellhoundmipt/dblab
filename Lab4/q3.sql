SELECT hotel_name, MIN(start_date) AS reg_date FROM HOTELS h, PRICE p, SUITE s
WHERE  h.hotel_id = s.hotel_id
AND s.suite_id = p.suite_id
GROUP BY hotel_name
HAVING (DATEPART(yyyy,GETDATE())-DATEPART(yyyy,MIN(start_date))-
	CASE
	WHEN (DATEPART(mm,GETDATE())<DATEPART(mm,MIN(start_date))
	or (DATEPART(mm,GETDATE())=DATEPART(mm,MIN(start_date))
	and DATEPART(dd,GETDATE())<DATEPART(dd,MIN(start_date))))
	THEN 1
	ELSE 0
	END) < 3
AND (DATEPART(yyyy,GETDATE())-DATEPART(yyyy,MIN(start_date))-
	CASE
	WHEN (DATEPART(mm,GETDATE())<DATEPART(mm,MIN(start_date))
	or (DATEPART(mm,GETDATE())=DATEPART(mm,MIN(start_date))
	and DATEPART(dd,GETDATE())<DATEPART(dd,MIN(start_date))))
	THEN 1
	ELSE 0
	END) >= 1;

  --Все отели, цены на комнаты которых занесены 1-2 года назад
