-- nomor 1
SELECT DISTINCT customername AS namakustomer, productname AS namaproduk, textdescription
FROM customers
JOIN orders 
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
JOIN products
ON orderdetails.productCode = products.productCode
JOIN productlines
ON products.productLine = productlines.productLine
WHERE productname LIKE '%titanic%'
ORDER BY customername ASC;

-- nomor 2
SELECT customername, productname, STATUS, shippeddate
FROM customers
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.ordernumber = orderdetails.orderNumber
JOIN products
ON orderdetails.productCode = products.productCode
WHERE productname LIKE '%ferrari%'
AND STATUS LIKE '%shipped%'
AND shippeddate BETWEEN '2003-10-01' AND '2004-10-01'
ORDER BY shippeddate DESC;

-- nomor 3
SELECT * FROM employees
SELECT s.firstname AS supervisor, k.firstname AS karyawan
FROM employees AS s
JOIN employees AS k
ON s.employeeNumber = k.reportsTo
WHERE s.firstname LIKE '%gerard%'
ORDER BY k.firstname;

-- nomor 4
-- A
SELECT c.customerName, p.paymentDate, e.firstName AS employeeName, p.amount
FROM customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE paymentDate LIKE '_____11%';

-- B
SELECT c.customerName, p.paymentDate, e.firstName AS employeeName, p.amount
FROM payments AS p
JOIN customers AS c
ON c.customerNumber = p.customerNumber
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.paymentDate LIKE '_____11%'
ORDER BY p.amount DESC 
LIMIT 1;

-- C
SELECT c.customerName, p.productName
FROM customers AS c
JOIN orders AS o
ON o.customerNumber = c.customerNumber
JOIN orderdetails AS d
ON o.orderNumber = d.orderNumber
JOIN products AS p
ON d.productCode = p.productCode
WHERE c.customerName LIKE  '%Corporate Gift Ideas Co.%';

-- soal tambahan
-- tampilkan karyawan yang tidak memiliki supervisor
SELECT s.firstname AS supervisor, k.firstname AS karyawan
FROM employees AS k
LEFT JOIN employees AS s
ON s.employeeNumber = k.reportsTo
WHERE s.employeeNumber IS NULL;

-- tampilkan product yang belum pernah di pesan
SELECT o.ordernumber, p.productName
FROM products AS p
LEFT JOIN orderdetails AS o
ON p.productCode = o.productCode
WHERE o.ordernumber IS NULL;

SELECT * FROM orderdetails