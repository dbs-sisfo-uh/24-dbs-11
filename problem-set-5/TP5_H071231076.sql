-- Nama : Adrian Tri Putra
-- NIM : H071231076
USE classicmodels

# Nomor 1
SELECT DISTINCT customers.customerName AS 'namaKustomer',  
products.productName AS 'namaProduk', productlines.textDescription
FROM customers
	JOIN orders
		ON customers.customernumber = orders.customerNumber
	JOIN orderdetails
		ON orderdetails.ordernumber = orders.orderNumber
	JOIN products
		ON products.productCode = orderdetails.productCode
	JOIN productlines
		ON productlines.productLine = products.productLine
WHERE products.productName LIKE '%Titanic%'
ORDER BY customers.customerName

# Nomor 2
SELECT customers.customerName, products.productName,
orders.`status`, orders.shippedDate
FROM customers
	JOIN orders
		ON customers.customernumber = orders.customerNumber
	JOIN orderdetails
		ON orderdetails.ordernumber = orders.orderNumber
	JOIN products
		ON products.productCode = orderdetails.productCode
WHERE products.productname LIKE '%Ferrari%' AND 
orders.`status` = 'Shipped' AND 
shippeddate BETWEEN '2003-10-01' AND '2004-10-01'
ORDER BY requireddate DESC 

# Nomor 3 
SELECT * FROM employees
SELECT e1.firstName AS SuperVisor, e2.firstName AS Karyawan
FROM employees AS e1
INNER JOIN employees AS e2
	 ON e1.employeeNumber = e2.reportsTo 
WHERE e1.firstName = 'Gerard'
ORDER BY e2.firstName;

# Nomor 4
-- bagian a
SELECT customers.customerName, payments.paymentDate,
employees.firstName, payments.amount
FROM payments
	JOIN customers
		ON payments.customerNumber = customers.customerNumber
	JOIN employees
		ON employees.employeeNumber = customers.salesRepEmployeeNumber
WHERE payments.paymentDate LIKE '%_11_%'

-- bagian b
SELECT customers.customerName, payments.paymentDate,
employees.firstName, payments.amount
FROM payments
	JOIN customers
		ON payments.customerNumber = customers.customerNumber
	JOIN employees
		ON employees.employeeNumber = customers.salesRepEmployeeNumber
ORDER BY amount DESC LIMIT 1

-- bagian c
SELECT customers.customerName, products.productName
FROM customers
	JOIN orders
		ON customers.customernumber = orders.customerNumber
	JOIN orderdetails
		ON orderdetails.ordernumber = orders.orderNumber
	JOIN products
		ON products.productCode = orderdetails.productCode
WHERE customers.customerName = 'Corporate Gift Ideas Co.'

