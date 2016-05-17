SELECT TOP 2 WITH TIES COUNT(c.comment_id) AS number, h.hotel_name FROM HOTELS h, REVIEW r, COMMENTS c
WHERE h.hotel_id = r.hotel_id
AND r.review_id = c.review_id
GROUP BY h.hotel_name
ORDER BY number DESC;

--Два самых комментируемых отеля
