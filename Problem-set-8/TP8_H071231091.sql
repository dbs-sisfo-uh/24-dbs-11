#1
(SELECT productName, SUM(priceEach * quantityOrdered) AS Revenue, 'Pendapatan Tertinggi' AS Pendapatan
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
WHERE MONTH(orderDate) = 9
GROUP BY productName
ORDER BY Revenue DESC
LIMIT 5)

UNION

(SELECT productName, SUM(priceEach * quantityOrdered) AS Revenue, 
    'Pendapatan Terendah (kayak kamu)' AS Pendapatan
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
WHERE MONTH(orderDate) = 9
GROUP BY productName
ORDER BY Revenue ASC
LIMIT 5);

#2	
SELECT productName FROM products

EXCEPT 

(SELECT productName 
 FROM products
 JOIN orderdetails ON products.productCode = orderdetails.productCode
 JOIN orders ON orderdetails.orderNumber = orders.orderNumber
 JOIN customers ON orders.customerNumber = customers.customerNumber
 WHERE customers.customerNumber IN (
     SELECT customers.customerNumber 
     FROM customers
     JOIN orders ON customers.customerNumber = orders.customerNumber
     JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
     JOIN products ON orderdetails.productCode = products.productCode
     WHERE buyPrice > (SELECT AVG(buyPrice) FROM products)
     GROUP BY customers.customerNumber
     HAVING COUNT(DISTINCT orders.orderNumber) > 10
 ));


#3
SELECT customerName
FROM customers
JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customerName
HAVING SUM(amount) > 2 * (
    SELECT AVG(totalAverage)
    FROM (
        SELECT SUM(amount) AS totalAverage
        FROM payments
        GROUP BY customerNumber
    ) AS hasil
)

INTERSECT

SELECT customerName
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE productLine = 'Planes' OR productLine = 'Trains'
GROUP BY customerName
HAVING SUM(quantityOrdered * priceEach) > 20000;

#4
SELECT 
    o.orderDate AS 'Tanggal',
    c.customerNumber AS 'CustomerNumber',
    'Membayar Pesanan dan Memesan Barang' AS 'riwayat'
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
JOIN payments p ON o.orderDate = p.paymentDate
HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003

UNION

SELECT 
    orderDate, 
    customerNumber,
    'Memesan Barang' 
FROM orders
WHERE MONTH(orderDate) = 09 AND YEAR(orderDate) = 2003
AND orderDate NOT IN (  
	SELECT o.orderDate AS 'Tanggal'
	FROM orders o
	JOIN customers c ON o.customerNumber = c.customerNumber
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
UNION

SELECT 
    paymentDate, 
    customerNumber, 
    'Membayar Pesanan' 
FROM payments
WHERE MONTH(paymentDate) = 09 AND YEAR(paymentDate) = 2003
AND paymentDate NOT IN (  
	SELECT p.paymentDate AS 'Tanggal'
	FROM orders o
	JOIN customers c ON o.customerNumber = c.customerNumber
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
ORDER BY Tanggal;

#5
SELECT DISTINCT productCode 
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE priceEach > (
    SELECT AVG(priceEach) FROM orderdetails
    JOIN orders ON orderdetails.orderNumber = orders.orderNumber
    WHERE orderDate BETWEEN '2001-01-01' AND '2004-03-31'
)
AND quantityOrdered > 48
AND LEFT(productVendor, 1) IN ('A', 'I', 'U', 'E', 'O')

EXCEPT

SELECT DISTINCT productCode 
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
JOIN customers ON orders.customerNumber = customers.customerNumber
WHERE country IN ("Japan", "Germany", "Italy");
