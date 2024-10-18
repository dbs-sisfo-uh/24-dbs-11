-- NAMA : ILHAM KURNIAWAN
-- NIM  : H071231024

-- No 1
SELECT DISTINCT c.customerName AS namaKostumer,
p.productName AS namaProduk,
p.productDescription AS textDescription
FROM customers AS c
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
JOIN products AS p ON od.productCode = p.productCode
WHERE p.productName LIKE '%Titanic%'
ORDER BY c.customerName ASC;


-- No 2
SELECT c.customerName,
p.productName,
o.`status`,
o.shippedDate
FROM customers AS c
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
JOIN products AS p ON od.productCode = p.productCode
WHERE
p.productName LIKE '%Ferrari%'
AND o.`status` = 'Shipped'
AND o.shippedDate BETWEEN '2003-10-01' AND '2004-09-30'
ORDER BY o.shippedDate DESC;


-- No 3
SELECT e1.firstName AS Supervisor,
e2.firstName AS Karyawan
FROM employees AS e1
JOIN employees AS e2 ON e1.employeeNumber = e2.reportsTo
WHERE e1.firstName LIKE 'Gerard%'
ORDER BY e2.firstName ASC;


-- No 4a)
SELECT c.customerName,
p.paymentDate,
e.firstName AS employeeName,
p.amount
FROM customers AS c
JOIN payments AS p ON c.customerNumber = p.customerNumber
JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%11-__';


-- No 4b)
SELECT c.customerName,
p.paymentDate,
e.firstName AS employeeName,
p.amount
FROM customers AS c
JOIN payments AS p ON c.customerNumber = p.customerNumber
JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '%11-__'
ORDER BY p.amount DESC
LIMIT 1;


-- No 4c)
SELECT c.customerName,
pr.productName
FROM customers AS c
JOIN payments AS p ON c.customerNumber = p.customerNumber
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
JOIN products AS pr ON od.productCode = pr.productCode
WHERE c.customerName LIKE 'Corporate%'
AND p.paymentDate LIKE '%11-__';


-- Tugas Tambahan TP5

-- No 1 - Menampilkan Karyawan yang tidak memiliki atasan
SELECT employeeNumber, firstName, jobTitle, reportsTo
FROM employees
WHERE reportsTo IS NULL;


-- No 2 - Menampilkan Produk yang belum pernah di order oleh kustomer
SELECT p.productCode, p.productName
FROM products AS p
LEFT JOIN orderdetails AS od ON p.productCode = od.productCode
WHERE od.productCode IS NULL;