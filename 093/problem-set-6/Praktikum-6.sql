-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093

USE classicmodels;

-- NOMOR 1
SELECT 
    c.customerName AS 'Nama Pelanggan',
    CONCAT(e.firstName, ' ', e.lastName) AS salesRep,
    (c.creditLimit - SUM(p.amount)) AS 'Credit Tersisa'
FROM customers c
JOIN payments p USING (customerNumber)
JOIN employees e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY c.customerName
HAVING `Credit Tersisa` > 0
ORDER BY c.customerName;


-- NOMOR 2
SELECT 
	p.productName AS 'Nama Produk',
	GROUP_CONCAT(DISTINCT c.customerName ORDER BY c.customerName SEPARATOR ', ') AS 'Nama Customer',
	COUNT(DISTINCT c.customerNumber) AS 'Jumlah Customer',
	SUM(od.quantityOrdered) AS 'Total Kuantitas'
FROM products p
JOIN orderdetails od USING (productCode)
JOIN orders o USING (orderNumber)
JOIN customers c USING (customerNumber)
GROUP BY p.productName
ORDER BY p.productName;


-- NOMOR 3
SELECT 
	CONCAT(e.firstName, ' ', e.lastName) AS 'Nama Karyawan',
	COUNT(c.customernumber) AS 'Total Pelanggan'
FROM employees e
JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY `Nama Karyawan`
ORDER BY `Total Pelanggan` DESC;


-- NOMOR 4
SELECT 
    CONCAT(e.firstName, ' ', e.lastName) AS 'Nama Karyawan',
    p.productName AS 'Nama Produk',
    SUM(od.quantityOrdered) AS 'Jumlah Pesanan'
FROM products p
JOIN orderdetails od USING(productcode)
JOIN orders o USING(ordernumber)
JOIN customers c USING(customernumber)
RIGHT JOIN employees e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices os USING(officecode)
WHERE os.country = 'Australia'
GROUP BY `Nama Karyawan`, `Nama Produk`
ORDER BY `Jumlah Pesanan` DESC;


-- NOMOR 5
SELECT 
	c.customername AS 'Nama Pelanggan',
	group_concat(p.productname ORDER BY productname SEPARATOR ', ') AS 'Nama Produk',
	count(p.productname) AS 'Banyak Jenis Produk'
FROM customers c
JOIN orders o USING(customernumber)
JOIN orderdetails od USING(ordernumber)
JOIN products p USING(productcode)
WHERE o.shippeddate IS NULL 
GROUP BY `Nama Pelanggan`;


-- NOMOR 6
SELECT 
	c.customername AS 'Nama Pelanggan',
	YEAR(o.orderdate) AS 'Tahun Order',
	SUM(od.quantityordered) AS 'Jumlah Pesanan'
FROM customers c
JOIN orders o USING(customernumber)
JOIN orderdetails od USING(ordernumber)
GROUP BY c.customerName, YEAR(o.orderDate);


-- NOMOR 7
SELECT 
	productvendor,
	AVG(buyprice)
FROM products
GROUP BY productvendor
HAVING AVG(buyprice) > 50; 


 

	