--���������� �� ���������� � ���������� Sales Manager

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

CREATE CLUSTERED INDEX customer_country_index ON Customers(country)

--������ � ��������
SELECT * FROM Customers
WHERE Country = 'Portugal'
AND ContactTitle = 'Sales Manager'

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;

DROP INDEX customer_country_index ON Customers
