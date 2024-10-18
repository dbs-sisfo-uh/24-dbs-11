-- nomor 1
SELECT 
	 c.customerName, 
    CONCAT(s.firstName, ' ', s.lastName) AS salesRepName, 
    c.creditLimit - SUM(p.amount) AS remainingCredit
FROM customers AS c
JOIN employees AS s 
ON c.salesRepEmployeeNumber = s.employeeNumber
JOIN payments AS p 
ON c.customerNumber = p.customerNumber
GROUP BY c.customerName, salesRepName, c.creditLimit
HAVING remainingCredit >= 0
ORDER BY c.customerName;

-- nomor 2
SELECT
   p.productName AS Nama_Produk,
   GROUP_CONCAT(DISTINCT c.customerName SEPARATOR '|') AS Nama_Costumer,
   COUNT(DISTINCT c.customerNumber) AS Jumlah_Costumer,
   SUM(od.quantityOrdered) AS Total_Quantitas
FROM products AS p
JOIN orderdetails AS od 
ON od.productCode = p.productCode
JOIN orders AS o ON o.orderNumber = od.orderNumber
JOIN customers AS c ON c.customerNumber = o.customerNumber
GROUP BY p.productName
ORDER BY p.productName ASC;


-- nomor 3
SELECT 
    CONCAT(e.firstname, ' ', e.lastname) AS employeeName, 
    COUNT(c.customerNumber) AS totalCustomers  
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
ORDER BY totalCustomers DESC;

-- nomor 4
SELECT CONCAT(e.firstName,' ',e.lastName) AS "Nama_Karyawan",
		 p.productName AS "Nama Produk",
		 SUM(od.quantityOrdered) AS "Jumlah_Pesanan"
FROM products p
JOIN orderdetails od USING(productCode)
JOIN orders o USING(orderNumber)
JOIN customers c USING(customerNumber)
RIGHT JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices OF USING(officeCode)
WHERE Of.country = 'Australia'
GROUP BY e.employeeNumber,p.productName
ORDER BY SUM(od.quantityOrdered) DESC;

SELECT * FROM products

-- nomor 5
SELECT c.customerName,
		 GROUP_CONCAT(p.productName ORDER BY p.productName) AS "Nama_Produk",
		 COUNT(p.productName) AS "Banyak_Jenis_Produk"
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
WHERE o.shippedDate IS NULL
GROUP BY c.customerName;



-- tugas tambahan
-- tampilkan jumlah pelanggan pada tiap kota yang jumlahnya lebih dari 3
SELECT city, COUNT(*) jumlah
FROM customers
GROUP BY city
HAVING jumlah > 3

---- tampilkan jumlah pelanggan pada tiap kota
SELECT city, COUNT(*) jumlah
FROM customers
GROUP BY city 


-- tampilkan produk dan total kuantitas yang terjual
SELECT p.productname, SUM(od.quantityOrdered)
FROM products p
JOIN orderdetails od
ON p.productcode = od.productCode
GROUP BY p.productname;