USE classicmodels;
-- nomor 1
SELECT 
customerName,
    CONCAT(contactFirstName, ' ', contactLastName) AS salesRep,
    (creditLimit - SUM(p.amount)) AS remainingCredit
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS p
USING (customerNumber)
GROUP BY customerName, salesRep, creditLimit
HAVING remainingCredit > 0
ORDER BY customerName;

-- nomor 2
SELECT 
    p.productName 'Nama Produk',
    GROUP_CONCAT(DISTINCT c.customerName) 'Nama Customer',
    COUNT(DISTINCT c.customerNumber) 'Jumlah Customer',
    SUM(od.quantityOrdered) 'Total Quantitas'
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
JOIN orders AS o
USING (orderNumber)
JOIN customers AS c
USING (customerNumber)
GROUP BY p.productName
ORDER BY p.productName;

-- nomor 3
SELECT 
    CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
    COUNT(DISTINCT c.customerNumber) AS totalCustomers
FROM employees AS e
JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
ORDER BY totalCustomers DESC;

-- nomor 4
SELECT 
    CONCAT(e.firstName, ' ', e.lastName) AS `Nama Karyawan`,
    p.productName AS `Nama Produk`,
    SUM(od.quantityOrdered) AS `Jumlah Pesanan`
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
JOIN orders
USING (orderNumber)
JOIN customers AS c
USING (customerNumber)
RIGHT JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices AS oi
USING (officeCode)
WHERE oi.country LIKE "Australia"
GROUP BY p.productName, `Nama Karyawan`
ORDER BY `Jumlah Pesanan` DESC;


-- nomor 5
SELECT 
    c.customerName AS 'Nama Pelanggan',
    p.productName AS 'Nama Produk',
    COUNT(p.productLine) AS 'Banyak Jenis Produk'
FROM customers c
JOIN orders o 
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products p 
USING (productCode)
WHERE (o.shippedDate IS NULL)
GROUP BY (c.customerName);
