-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093

USE classicmodels;

-- NOMOR 1
SELECT 
	productcode, 
	productname, 
	buyprice
FROM products
WHERE buyprice > 
	(SELECT AVG(buyprice)
	FROM products)
ORDER BY buyprice desc; 


-- NOMOR 2
SELECT 
	o.ordernumber, 
	o.orderdate
FROM orders o
JOIN customers c USING(customernumber)
JOIN employees e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices os USING(officecode)
WHERE os.city =
	(SELECT city FROM offices
	WHERE city = 'Tokyo');
	

-- NOMOR 3
SELECT 
	c.customername,
	o.ordernumber,
	o.shippeddate, 
	o.requireddate, 
	GROUP_CONCAT(p.productname SEPARATOR '; ') AS 'products', 
	SUM(od.quantityordered) AS total_ordered,
	CONCAT(e.firstname, ' ', e.lastname) AS 'employeeName'
FROM products p
JOIN orderdetails od USING(productcode)
JOIN orders o USING(ordernumber)
JOIN customers c USING(customernumber)
JOIN employees e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE o.orderNumber IN
		(SELECT ordernumber FROM orders
		WHERE shippeddate > requireddate)  
GROUP BY customername, ordernumber;


-- NOMOR 4
SELECT 
	p.productname, 
	p.productline, 
	SUM(od.quantityordered) AS TotalQuantity
FROM products p
JOIN orderdetails od USING(productcode)
WHERE p.productLine IN
	(SELECT top3.productline
	FROM (SELECT 
		p.productline,
		SUM(od.quantityordered) 
	FROM products p
	JOIN orderdetails od USING(productcode)
	GROUP BY productline
	ORDER BY sum(od.quantityordered) DESC
	LIMIT 3) AS top3)
GROUP BY p.productName
ORDER BY p.productLine, TotalQuantity DESC;

