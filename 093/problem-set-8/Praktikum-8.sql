-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093


USE classicmodels;

-- Nomor 1
(SELECT 
	productName, 
	SUM(priceEach * quantityOrdered) AS TotalRevenue, 
	'Pendapatan Tertinggi' AS Pendapatan
FROM products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
WHERE month(orderDate) = 9
GROUP by productName
ORDER BY TotalRevenue desc
LIMIT 5)

UNION

(SELECT 
	productName, 
	SUM(priceEach * quantityOrdered) AS TotalRevenue, 
	'Pendapatan Terendah (kayak kamu)' AS Pendapatan
FROM products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
WHERE month(orderDate) = 9
GROUP by productName
ORDER BY TotalRevenue
LIMIT 5);



-- NOMOR 2
SELECT productName FROM products

EXCEPT 

(SELECT productName FROM products
JOIN orderdetails USING (productCode)
JOIN orders USING (orderNumber)
JOIN customers c USING (customerNumber)
WHERE c.customerNumber IN (
	SELECT customerNumber FROM customers
	JOIN orders USING (customerNumber)
	JOIN orderdetails USING (orderNumber)
	JOIN products USING (productCode)
	where buyPrice > (SELECT AVG(buyPrice) FROM products)
	GROUP BY customerNumber
	HAVING COUNT(DISTINCT orderNumber) > 10));



-- NOMOR 3
SELECT customerName
FROM customers
JOIN payments USING (customerNumber)
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
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products USING (productCode)
WHERE productLine ='Planes' OR productLine = 'Trains'
GROUP BY customerName
HAVING SUM(quantityOrdered * priceEach) > 20000



-- NOMOR 4
SELECT `Tanggal`, customerNumber, GROUP_CONCAT(`riwayat` SEPARATOR ' dan ') AS `riwayat`
FROM (
	SELECT 
		orderDate AS `Tanggal`,
		customerNumber,
		'Memesan Barang' AS `riwayat`
	FROM orders
	WHERE MONTH(orderDate) =  9 AND YEAR(orderDate) = 2003

	UNION 

	SELECT 
		paymentDate AS `Tanggal`,
		customerNumber,
		'Membayar Pesanan' AS `riwayat`
	FROM payments
	WHERE MONTH(paymentDate) =  9 AND YEAR(paymentDate) = 2003
) AS subquery
GROUP BY `Tanggal`;



-- NOMOR 5
SELECT DISTINCT productCode FROM products
JOIN orderdetails USING(productCode)
WHERE priceEach > (
    SELECT AVG(priceEach) FROM orderdetails
    join orders USING(orderNumber)
    WHERE orderDate BETWEEN '2001-01-01' and '2004-03-31'
)
	AND quantityOrdered > 48
	AND LEFT(productVendor, 1) IN ('A', 'I', 'U', 'E', 'O')

EXCEPT

SELECT DISTINCT productCode FROM products
JOIN orderdetails USING(productCode)
JOIN orders USING(orderNumber)
JOIN customers using(customerNumber)
WHERE country IN ("Japan", "Germany", "Italy");





