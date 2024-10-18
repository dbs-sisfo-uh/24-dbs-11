-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093

USE classicmodels;

-- NOMOR 1
SELECT customerNumber, customerName, country, creditLimit
FROM customers;

SELECT 
	customerNumber, 
	customerName, 
	country
FROM customers
WHERE (country = 'USA' and creditLimit > 50000 AND creditLimit < 100000) OR
		(country != 'USA' AND creditLimit BETWEEN 100000 AND 200000)
ORDER BY creditLimit DESC;


-- NOMOR 2
SELECT productCode, productName, productLine, quantityInStock, buyPrice
FROM products;

SELECT 
	productCode, 
	productName, 
	quantityInStock, 
	buyPrice
FROM products
WHERE (quantityInStock BETWEEN 1000 and 2000) AND 
		(buyPrice > 150 or buyPrice < 50) AND 
		productLine NOT LIKE '%Vintage%';
		
		
-- NOMOR 3
SELECT productCode, productName, productLine, buyPrice, MSRP 
FROM products;

SELECT 
	productCode, 
	productName, 
	MSRP 
FROM products
WHERE productLine LIKE ('%Classic%') AND 
		buyPrice > 50;

		
-- NOMOR 4
SELECT orderNumber, orderDate, status, customerNumber
FROM orders;

SELECT 
    orderNumber, 
    orderDate, 
    status, 
    customerNumber
FROM orders
WHERE (orderNumber > 10250) AND 
      (status != 'Shipped' AND status != 'Cancelled') AND 
      (orderDate BETWEEN '2004-01-01' AND '2005-12-31');

		

-- NOMOR 5 
SELECT * FROM orderdetails;

SELECT
	orderNumber,
	orderLineNumber,
	productCode,
	quantityOrdered,
	priceEach,
	(priceEach * quantityOrdered * 0.95) AS 'DiscountedTotalPrice'
FROM orderdetails
WHERE quantityOrdered > 50 AND 
		priceEach > 100 AND 
		productCode NOT LIKE '%S18%'
ORDER BY DiscountedTotalPrice DESC;


-- NOMOR 6
SELECT 
	customerNumber, 
	customerName, 
	country
FROM customers
WHERE (country LIKE '%USA%' OR country LIKE '%Canada%') AND 
		(customerName LIKE 'T%' OR customerName LIKE 'S%') AND 
		(customerName LIKE '%Inc.' OR customerName LIKE '%Corp.');
		

	


		


