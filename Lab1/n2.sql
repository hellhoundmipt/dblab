SELECT last_name, middle_initial, first_name FROM EMPLOYEE, JOB 
	WHERE CAST(DATEDIFF (YEAR, hire_date, GETDATE()) AS DECIMAL) < 5
	AND IIF(commission IS NOT NULL, salary + commission, salary) > 1500
	AND JOB."function" = 'salesperson'