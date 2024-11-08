-- nomor 1
SELECT p.productcode,
		p.productname,
		p.buyprice
FROM products p
WHERE p.buyprice > (
 SELECT AVG(buyprice)FROM products
);

-- nomor 2
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

-- nomor 3
SELECT 
	c.customername,
	o.ordernumber,
	o.shippeddate, 
	o.requireddate, 
	GROUP_CONCAT(p.productname ORDER BY p.productName SEPARATOR '; ') AS 'products', 
	SUM(od.quantityordered) AS total_ordered,
	CONCAT(e.firstname, ' ', e.lastname) AS 'employeeName'
FROM products p
JOIN orderdetails od USING(productcode)
JOIN orders o USING(ordernumber)
JOIN customers c USING(customernumber)
JOIN employees e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE 
	o.shippedDate > o.requiredDate 
	AND o.orderNumber IN
		(SELECT ordernumber FROM orders
		WHERE shippeddate > requireddate)  
GROUP BY customername, ordernumber;



-- nomor 4
SELECT 
    products.productName AS Nama_Produk, 
    productlines.productLine AS Kategori_Produk, 
    SUM(orderdetails.quantityOrdered) AS Jumlah_Total_Dipesan
FROM products
JOIN productlines 
ON products.productLine = productlines.productLine
JOIN orderdetails 
ON products.productCode = orderdetails.productCode
WHERE productlines.productLine 
IN (SELECT productLine FROM (SELECT productlines.productLine
FROM products
JOIN  productlines
ON products.productLine = productlines.productLine
JOIN orderdetails 
ON products.productCode = orderdetails.productCode
GROUP BY productlines.productLine 
ORDER BY SUM(orderdetails.quantityOrdered) DESC
LIMIT 3) AS top_product_lines)
GROUP BY products.productName, productlines.productLine
ORDER BY productlines.productLine, Jumlah_Total_Dipesan DESC