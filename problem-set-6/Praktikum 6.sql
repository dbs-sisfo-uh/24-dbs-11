-- NAMA	: ILHAM KURNIAWAN
-- NIM	: H071231024


-- Nomor 1
SELECT
	c.customerName,
	CONCAT(e.firstName, ' ', e.lastName) AS salesRep,
	c.creditLimit - SUM(p.amount) AS remainingCredit
FROM customers AS c
JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS p ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
HAVING remainingCredit >= 0
ORDER BY c.customerName;


-- Nomor 2
SELECT
	p.productName AS 'Nama Produk',
	GROUP_CONCAT(c.customerName ORDER BY c.customerName ASC) AS 'Nama Customer',
	COUNT(DISTINCT c.customerName) AS 'Jumlah Customer',
	SUM(od.quantityOrdered) AS 'Total Quantitas'
FROM products AS p
JOIN orderdetails AS od USING(productCode)
JOIN orders AS o USING(orderNumber)
JOIN customers AS c USING(customerNumber)
GROUP BY p.productName;


-- Nomor 3
SELECT
	CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName',
	COUNT(c.customerName) AS 'totalCustomer'
FROM employees AS e
JOIN customers AS c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY `employeeName`
ORDER BY `totalCustomer` DESC;


-- Nomor 4
SELECT
	CONCAT(e.firstName, ' ', e.lastName) AS 'Nama Karyawan',
	p.productName AS 'Nama Produk',
	SUM(od.quantityOrdered) AS 'Jumlah Pesanan' 
FROM products p
RIGHT JOIN orderdetails od ON od.productCode = p.productCode
RIGHT JOIN orders o ON o.orderNumber = od.orderNumber
RIGHT JOIN customers c ON c.customerNumber = o.customerNumber
RIGHT JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN offices ofc ON ofc.officeCode = e.officeCode
WHERE e.officeCode = 6
GROUP BY `Nama Karyawan`, `Nama Produk`
ORDER BY `Jumlah Pesanan` DESC;


-- Nomor 5
SELECT
	c.customerName AS 'Nama Pelanggan',
	GROUP_CONCAT(p.productName ORDER BY p.productName ASC) AS 'Nama Produk',
	COUNT(od.productCode)
FROM customers AS c
JOIN orders AS o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products AS p USING(productCode) 
WHERE o.shippedDate IS NULL
GROUP BY `Nama Pelanggan`;