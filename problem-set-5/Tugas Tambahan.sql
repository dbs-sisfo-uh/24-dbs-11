SELECT e1.firstName AS SuperVisor, e2.firstName AS Karyawan
FROM employees AS e1
RIGHT JOIN employees AS e2
	 ON e1.employeeNumber = e2.reportsTo
WHERE e1.firstname IS  NULL 

