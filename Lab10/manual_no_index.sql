--���������� �� ���������� � ���������� Sales Manager

SET STATISTICS IO ON;
SET STATISTICS TIME ON;

--������ ��� �������
SELECT * FROM Customers
WHERE Country = 'Portugal'
AND ContactTitle = 'Sales Manager'

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;