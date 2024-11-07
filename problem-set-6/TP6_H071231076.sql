-- Nama : Adrian Tri Putra
-- NIM : H071231076
-- Tugas Praktikum 6
USE classicmodels

# Nomor 1
SELECT c.customername, CONCAT(e.firstname,' ', e.lastname) AS salesrep, 
c.creditlimit - SUM(p.amount) AS remainingcredit
FROM customers AS c
	JOIN employees AS e
		ON e.employeeNumber = c.salesRepEmployeeNumber
	JOIN payments AS p
		USING (customernumber)
GROUP BY 
    c.customerName
HAVING 
    remainingCredit > 0
ORDER BY c.customername

# Nomor 2
SELECT pr.productname AS 'Nama produk', 
GROUP_CONCAT(c.customerName ORDER BY c.customername) AS 'Nama Customer',
COUNT(DISTINCT c.customerName) AS 'Jumlah Customer', SUM(od.quantityordered)
FROM products AS pr
	JOIN orderdetails AS od
		USING (productcode)
	JOIN orders AS o
		USING (ordernumber)
	JOIN customers AS c
		USING (customernumber)
GROUP BY pr.productName
ORDER BY pr.productname

# Nomor 3
SELECT CONCAT(e.firstName,' ', e.lastName) AS employeeName,
COUNT(c.customerName) AS totalcustomers
FROM employees AS e
JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.firstName, e.lastName
ORDER BY `totalcustomers` DESC 

# Nomor 4
SELECT CONCAT(e.firstName,' ',e.lastName) AS 'Nama Karyawan',
pr.productname AS 'Nama Produk',
SUM(od.quantityOrdered) AS 'Jumlah Pesanan'
FROM products AS pr
	JOIN orderdetails AS od
		USING (productcode)
	JOIN orders AS o
		USING (ordernumber)
	JOIN customers AS c
		USING (customernumber)
	RIGHT JOIN employees AS e
		ON e.employeeNumber = c.salesRepEmployeeNumber
	JOIN offices AS oc
		ON e.officeCode = oc.officeCode
WHERE oc.country = 'Australia'
GROUP BY e.firstName, e.lastName, pr.productname
ORDER BY `Jumlah Pesanan` DESC 

# Nomor 5
SELECT c.customerName AS "Nama Pelanggan", 
    GROUP_CONCAT(pr.productName ORDER BY pr.productName SEPARATOR ', ') AS "Nama Produk", 
    COUNT(DISTINCT pr.productcode) AS 'Banyak Jenis Produk'
FROM customers AS c
	JOIN orders AS o
		USING (customernumber)
	JOIN orderdetails AS od
		USING (ordernumber)
	JOIN products AS pr
	 USING (productcode)
WHERE o.shippeddate IS NULL
GROUP BY c.customerName