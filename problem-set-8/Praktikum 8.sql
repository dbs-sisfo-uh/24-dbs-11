-- NAMA : ILHAM KURNIAWAN
-- NIM  : H071231024

-- Nomor 1
(SELECT productname, SUM(priceeach * quantityordered) AS TotalRevenue, "Pendapatan Tinggi" AS Pendapatan
FROM products
JOIN orderdetails USING(productcode)
JOIN orders USING(ordernumber)
WHERE MONTH(orderdate) = 9
GROUP BY productname
ORDER BY TotalRevenue DESC
LIMIT 5)

UNION

(SELECT productname, SUM(priceeach * quantityordered) AS TotalRevenue, "Pendapatan Pendek (kayak anu)" AS Pendapatan
FROM products
JOIN orderdetails USING(productcode)
JOIN orders USING(ordernumber)
WHERE MONTH(orderdate) = 9
GROUP BY productname
ORDER BY TotalRevenue ASC
LIMIT 5);

-- Nomor 2
SELECT productname
FROM products
WHERE productcode NOT IN(
	SELECT productcode 
	FROM orderdetails
	JOIN orders USING(ordernumber)
	WHERE customernumber IN(
		SELECT customernumber
		FROM customers
	JOIN orders USING(customernumber)
	GROUP BY customername
	HAVING COUNT(ordernumber) > 10

	INTERSECT 

	SELECT customernumber
	FROM customers
	JOIN orders USING(customernumber)
	JOIN orderdetails USING(ordernumber)
	JOIN products USING(productcode)
	WHERE buyprice > (
		SELECT AVG(buyprice)
		FROM products)));
		
		
-- Nomor 3
SELECT customername
FROM customers
JOIN payments USING(customernumber)
GROUP BY customername
HAVING SUM(amount) > 2 * (
SELECT  AVG(totalAverage)
FROM (
SELECT DISTINCT SUM(amount) AS totalAverage 
FROM payments
GROUP BY customernumber) AS hasil)

INTERSECT 

SELECT customername
FROM customers
JOIN orders USING(customernumber)
JOIN orderdetails USING(ordernumber)
JOIN products USING(productcode)
WHERE productline IN('Planes', 'Trains')
GROUP BY customername
HAVING SUM(quantityordered * priceeach) > 20000

-- Nomor 4
SELECT 
    o.orderDate AS 'Tanggal',
    c.customerNumber AS 'CustomerNumber',
    'Membayar Pesanan dan Memesan Barang' AS 'riwayat'
FROM orders o
JOIN customers c USING (customerNumber)
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
	JOIN customers c USING (customerNumber)
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)

UNION

SELECT 
    paymentDate, 
    customerNumber, 
    'Membayar Pesanan'  FROM payments
WHERE MONTH(paymentDate) = 09 AND YEAR(paymentDate) = 2003
AND paymentDate NOT IN (  
	SELECT p.paymentDate AS 'Tanggal'
	FROM orders o
	JOIN customers c USING (customerNumber)
	JOIN payments p ON o.orderDate = p.paymentDate
	HAVING MONTH(Tanggal) = 09 AND YEAR(Tanggal) = 2003
)
ORDER BY Tanggal;


-- Nomor 5
SELECT DISTINCT productcode
FROM products
JOIN orderdetails USING(productcode)
WHERE priceeach > (
SELECT  AVG(priceeach)
FROM orderdetails
JOIN orders USING(ordernumber)
WHERE orderdate
BETWEEN '2001-01-01' AND '2004-03-31')
AND quantityordered > 48
AND LEFT(productvendor, 1) IN('A', 'I', 'U', 'E', 'O')

EXCEPT 

SELECT DISTINCT productcode
FROM products
JOIN orderdetails USING(productcode)
JOIN orders USING(ordernumber)
JOIN customers USING(customernumber)
WHERE country IN('Japan', 'Germany', 'Italy')