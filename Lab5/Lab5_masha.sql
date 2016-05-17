USE jralnya1;

IF OBJECT_ID ('category_view', 'V') IS NOT NULL
    DROP VIEW category_view;
GO
CREATE VIEW category_view
AS
SELECT c.category_name AS Category, COUNT(distinct d.dish_id) AS Quantity, AVG(p.list_price) AS 'Average price', AVG(cnt) AS 'Average orders daily' FROM
	(SELECT c.category_id AS category, COUNT(so.order_id) AS cnt FROM SALES_ORDER so, CATEGORY c, DISH d, ITEM i
	WHERE c.category_id = d.category
	AND d.dish_id = i.dish_id
	AND i.order_id = so.order_id
	GROUP BY so.order_date, c.category_id) AS county,
	dish d, category c, price p
WHERE c.category_id = d.category
AND p.dish_id = d.dish_id
AND county.category = c.category_id
GROUP BY c.category_name
GO
SELECT * FROM category_view;
GO 

IF OBJECT_ID ('organization_view', 'V') IS NOT NULL
    DROP VIEW organization_view;
GO
CREATE VIEW organization_view
AS
SELECT o.organization_name AS 'Organization', COUNT(distinct c.name) AS 'cnt', AVG(total_sum) AS 'Average expenses on meals' FROM ORGANIZATION o, CUSTOMER c,
	(SELECT c.customer_id, c.org_id AS cust_org, SUM(total) AS total_sum FROM ITEM i, SALES_ORDER so, CUSTOMER c
	WHERE i.order_id = so.order_id
	AND c.customer_id = so.customer_id
	GROUP BY c.customer_id, c.org_id
	) AS customer_sum
WHERE c.org_id = o.organization_id
AND customer_sum.cust_org = o.organization_id
AND c.customer_id IN
	(SELECT c.customer_id FROM CUSTOMER c, SALES_ORDER so,
		(SELECT c.customer_id AS cust, COUNT(order_id) AS meal_cnt FROM SALES_ORDER so, CUSTOMER c
		WHERE c.customer_id = so.customer_id
		GROUP BY DATEPART(mm, so.order_date), c.customer_id
		) AS aux
	WHERE c.customer_id = so.customer_id
	GROUP BY c.customer_id
	HAVING AVG(aux.meal_cnt) > 0		
	)
GROUP BY o.organization_name
GO
SELECT * FROM organization_view
GO

IF OBJECT_ID ('client_view', 'V') IS NOT NULL
    DROP VIEW client_view;
GO

CREATE VIEW client_view
AS
SELECT c.name AS 'Name', COUNT(distinct so.order_id) AS 'Count of meals', AVG(total) AS 'Average order cost' FROM CUSTOMER c, SALES_ORDER so, ITEM i
WHERE so.customer_id = c.customer_id
AND i.order_id = so.order_id
GROUP BY c.name
GO
SELECT * FROM client_view