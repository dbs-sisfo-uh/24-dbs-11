-- NAMA	: ILHAM KURNIAWAN
-- NIM	: H071231024


-- Nomor 1
SELECT p.productcode,
		p.productname,
		p.buyprice
FROM products p
WHERE p.buyprice > (
 SELECT AVG(buyprice)FROM products
);

-- Nomor 2
SELECT o.ordernumber,
		 o.orderdate
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices f
ON e.officeCode = f.officeCode
WHERE f.officeCode = (
	SELECT officecode FROM offices
	WHERE city = 'tokyo'
);

-- Nomor 3
SELECT c.customerName,
	o.orderNumber,
	o.shippedDate, 
	o.requiredDate, 
	GROUP_CONCAT(p.productName SEPARATOR ', ') products,
	SUM(od.quantityOrdered) total_quantity_ordered,
	CONCAT(e.firstName, ' ', e.lastName) employeeName
FROM customers c
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o ON o.customerNumber = c.customerNumber
JOIN orderdetails od ON od.orderNumber = o.orderNumber
JOIN products p ON p.productCode = od.productCode
WHERE o.shippedDate > o.requiredDate
GROUP BY c.customerNumber, o.orderNumber;


-- Nomor 4
SELECT 
    products.productName AS Nama_Produk, 
    productlines.productLine AS Kategori_Produk, 
    SUM(orderdetails.quantityOrdered) AS Jumlah_Total_Dipesan
FROM products
JOIN productlines ON products.productLine = productlines.productLine
JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE productlines.productLine IN (SELECT productLine FROM (SELECT productlines.productLine
FROM products
JOIN  productlines ON products.productLine = productlines.productLine
JOIN orderdetails ON products.productCode = orderdetails.productCode
GROUP BY productlines.productLine 
ORDER BY SUM(orderdetails.quantityOrdered) DESC
LIMIT 3) AS top_product_lines)
GROUP BY products.productName, productlines.productLine
ORDER BY productlines.productLine, Jumlah_Total_Dipesan DESC;