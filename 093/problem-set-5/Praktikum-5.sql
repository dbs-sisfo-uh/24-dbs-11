-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093

USE classicmodels;

-- NOMOR 1
SELECT DISTINCT 
    c.customerName AS 'Nama Kustomer', 
    p.productName AS 'Nama Produk', 
    p.productDescription AS 'Text Desciption'
FROM customers AS c
JOIN orders AS o 
	ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od 
	ON o.orderNumber = od.orderNumber
JOIN products AS p 
	ON od.productCode = p.productCodeemployees
WHERE 
    p.productName LIKE '%Titanic%'
ORDER BY 
    c.customerName;
    
    
-- NOMOR 2
SELECT 
	c.customerName, 
	p.productName,
	o.status,
	o.shippedDate
FROM customers AS c
JOIN orders AS o
	ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON od.productCode = p.productCode
WHERE 
	productName LIKE '%Ferrari%' AND
	STATUS = 'Shipped' AND 
	shippedDate >= '2003-10-01' AND shippedDate <='2004-10-01'
ORDER BY shippedDate DESC;


-- NOMOR 3
SELECT 
    s.firstName AS Supervisor,
    e.lastName AS Karyawan
FROM employees AS e
JOIN employees AS s 
	ON e.reportsTo = s.employeeNumber
WHERE 
    s.firstName = 'Gerard'
ORDER BY 
    e.lastName;


-- NOMOR 4
-- no. a
SELECT 
	c.customerName, 
	py.paymentDate,
	e.firstName AS 'employeeName',
	py.amount
FROM customers AS c
JOIN payments AS py
	ON c.customerNumber = py.customerNumber
JOIN employees AS e
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE MONTH(py.paymentDate) = '11';

-- no. b
SELECT 
	c.customerName, 
	py.paymentDate,
	e.firstName AS 'employeeName',
	py.amount
FROM customers AS c
JOIN payments AS py
	ON c.customerNumber = py.customerNumber
JOIN employees AS e
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE MONTH(py.paymentDate) = '11'
ORDER BY py.amount DESC
LIMIT 1;

-- no. c
SELECT 
	c.customerName, 
	p.productName
FROM customers AS c
JOIN orders AS o
	ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON od.productCode = p.productCode
WHERE customerName = 'Corporate Gift Ideas Co.';


-- NOMOR 5
-- Tampilkan Customer yang Belum Pernah Melakukan Pembayaran
SELECT 
    c.customerName,
    p.paymentDate
FROM customers AS c
LEFT JOIN payments AS p 
	ON c.customerNumber = p.customerNumber
WHERE 
    p.paymentDate IS NULL;


-- NOMOR 6
-- Tampilkan Produk yang Belum Pernah di Beli
SELECT 
    p.productName,
    od.orderNumber
FROM 
    products AS p
LEFT JOIN orderdetails AS od 
	ON p.productCode = od.productCode
WHERE 
    od.orderNumber IS NULL;     


	



