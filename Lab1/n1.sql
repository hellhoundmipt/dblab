SELECT description FROM PRODUCT
	WHERE product_id IN
		(SELECT product_id FROM PRICE
		GROUP BY product_id
		HAVING MAX(DATEDIFF(YEAR, start_date, GETDATE())) > 3)