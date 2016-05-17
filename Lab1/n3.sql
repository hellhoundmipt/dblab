SELECT last_name, middle_initial, first_name FROM EMPLOYEE
	WHERE employee_id IN
	(SELECT salesperson_id FROM CUSTOMER, SALES_ORDER
		WHERE CUSTOMER.customer_id = SALES_ORDER.customer_id
		AND YEAR(order_date) = 1990
		GROUP BY salesperson_id
		HAVING COUNT(order_id) >= 5
		AND SUM(total) >= 1000)
