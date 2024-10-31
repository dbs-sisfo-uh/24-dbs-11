-- Nama : Adrian Tri Putra
-- NIM : H071231076
-- TUGAS PRAKTIKUM 8

USE classicmodels

# No 1		
(SELECT p.productName,
        SUM(od.priceEach * od.quantityOrdered) AS 'TotalRevenue',
        'Pendapatan Tertinggi' AS Pendapatan
 FROM products p
 	JOIN orderdetails od 
 		USING(productcode)
	 JOIN orders o 
	 	USING(ordernumber)
 WHERE MONTH(o.orderDate) = 9
 GROUP BY p.productName
 ORDER BY TotalRevenue DESC 
 LIMIT 5)
 
UNION   

(SELECT p.productName, 
        SUM(od.priceEach * od.quantityOrdered) AS 'TotalRevenue',
        'Pendapatan Terendah' AS Pendapatan
 FROM products p
	JOIN orderdetails od 
 		USING(productcode)
	 JOIN orders o 
	 	USING(ordernumber)
 WHERE MONTH(o.orderDate) = 9 
 GROUP BY p.productName
 ORDER BY TotalRevenue ASC  
 LIMIT 5);

# No 2
SELECT p.productName FROM products p 
WHERE p.productCode IN
(
SELECT p.productCode 
FROM products p

EXCEPT

SELECT od.productCode 
FROM orderdetails od
	JOIN orders o 
		USING (orderNumber)
	JOIN customers c 
		USING (customerNumber)
WHERE c.customerNumber IN (
    SELECT c.customerNumber
    FROM orders o
    JOIN customers c 
	 	USING (customerNumber)
    GROUP BY c.customerNumber
    HAVING COUNT(o.orderNumber) > 10
	 ))
    
    INTERSECT

    SELECT c.customerNumber 
    FROM customers c
    JOIN orders o 
	 	USING (customerNumber)
    JOIN orderdetails od 
	 	USING (orderNumber)
    WHERE od.priceEach > (SELECT AVG(priceEach) FROM orderdetails)
    GROUP BY c.customerNumber
))


# No 3
SELECT customername FROM customers c
JOIN payments py
	USING(customernumber)
GROUP BY c.customerName
HAVING SUM(py.amount) > 2 * (SELECT AVG(totalAmount)
FROM (SELECT DISTINCT SUM(amount) AS totalAmount FROM payments p2
	GROUP BY customerNumber
	) AS hasil
)

INTERSECT 

SELECT c.customerName FROM customers c
	JOIN orders o 
		USING(customernumber)
	JOIN orderdetails od 
		USING(ordernumber)
	JOIN products p 
		USING(productcode)
WHERE p.productLine IN ('Planes',  'Trains')
GROUP BY c.customerNumber
HAVING SUM(od.priceEach * od.quantityOrdered) > 20000;

# No 4
SELECT *
FROM (
		SELECT o.orderDate AS Tanggal, o.customernumber, "Membayar Pesanan dan Memesan Barang" AS Riwayat
		FROM orders o
		JOIN payments p 
		ON o.orderDate = p.paymentDate
		WHERE MONTH(o.orderDate) = 9 AND YEAR(o.orderDate) = 2003
		AND MONTH(p.paymentDate) = 9 AND YEAR(p.paymentDate) = 2003
		GROUP BY Tanggal

    	UNION

    (SELECT DISTINCT o.orderDate AS Tanggal,c.customerNumber, "Memesan Barang" AS Riwayat 
     FROM orders o
     JOIN customers c ON o.customerNumber = c.customerNumber
     WHERE MONTH(o.orderDate) = 9 AND YEAR(o.orderDate) = 2003)

    UNION

    (SELECT DISTINCT p.paymentDate AS Tanggal,c.customerNumber, "Membayar Barang" AS Riwayat 
     FROM payments p
     JOIN customers c ON p.customerNumber = c.customerNumber
     WHERE MONTH(p.paymentDate) = 9 AND YEAR(p.paymentDate) = 2003)
) AS CombinedResults
GROUP BY Tanggal;


# No 5
(SELECT productcode FROM products p
	JOIN orderdetails od
		USING(productcode)
	JOIN orders o
		USING(ordernumber)
	WHERE od.priceEach > (SELECT AVG(od.priceEach)
		FROM orderdetails od
		JOIN orders o
			USING(ordernumber)
		WHERE o.orderDate 
		BETWEEN '2001-01-01' AND '2004-03-31')
	AND od.quantityOrdered > 48
	AND LEFT(productvendor,1) IN('a', 'i', 'u', 'e', 'o')
	ORDER BY p.productCode)
	
	EXCEPT 
	
	(SELECT productcode FROM products p
		JOIN orderdetails od
			USING(productcode)
		JOIN orders o
			USING(ordernumber)
		JOIN customers c
			USING(customernumber)
	WHERE c.country IN ('Japan', 'Germany', 'Italy')
 )

	
