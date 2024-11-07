-- Nama : Adrian Tri Putra
-- NIM : H071231076
USE classicmodels

# Nomor 1
SELECT productcode, productname, buyprice FROM products
WHERE buyprice > (SELECT AVG(buyprice) FROM products)
GROUP BY productcode

# Nomor 2
SELECT o.ordernumber, o.orderdate
FROM orders AS o
	JOIN customers AS c
		USING (customernumber)
WHERE c.salesRepEmployeeNumber IN (
	SELECT employeenumber FROM employees
	JOIN offices AS of
		USING (officecode)
	WHERE OF.city = 'Tokyo'
)

# Nomor 3
SELECT c.customername, o.ordernumber, o.shippeddate,
o.requireddate, p.productname, SUM(quantityordered) AS 'total quantitas order',
GROUP_CONCAT(e.firstname, ' ', e.lastName) AS 'employeeName'
FROM employees AS e
	JOIN customers AS c
		ON e.employeeNumber = c.salesRepEmployeeNumber
	JOIN orders AS o
		USING (customernumber)
	JOIN orderdetails AS od
		USING (ordernumber)
	JOIN products AS p
		USING (productcode)
WHERE o.shippedDate > o.requireddate 
GROUP BY c.customername, o.ordernumber, o.shippeddate, o.requireddate, p.productname, e.firstname, e.lastName
ORDER BY o.shippedDate DESC 
LIMIT 1;

SELECT c.customerName, o.orderNumber, o.shippedDate, o.requiredDate, GROUP_CONCAT(p.productName) AS 'products',
	SUM(od.quantityOrdered) AS 'total_quantity_ordered',
	CONCAT(e.firstName, ' ', e.lastName) AS 'employeeName'
FROM customers AS c
	JOIN orders AS o
		USING(customerNumber)
	JOIN orderdetails AS od
		USING(orderNumber)
	JOIN products AS p
		USING(productCode)
	JOIN employees AS e
		ON c.salesRepEmployeeNumber = e.employeeNumber
	WHERE o.orderNumber IN (
		SELECT o2.orderNumber
		FROM orders AS o2
		WHERE o2.requiredDate < o2.shippedDate
)

# Nomor 4
SELECT p.productName, p.productLine, SUM(od.quantityOrdered) AS 'total_quantity_ordered'
FROM products AS p
JOIN orderdetails AS od
	USING(productCode)
WHERE p.productLine IN (
		SELECT productLine
		FROM (
			SELECT productLine
			FROM products
				JOIN orderdetails
					USING (productCode)
			GROUP BY productLine
			ORDER BY SUM(quantityOrdered) DESC
			LIMIT 3
		) AS top_product
)
GROUP BY p.productName
ORDER BY p.productLine, total_quantity_ordered DESC;
