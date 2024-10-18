use classicmodels;

-- NOMOR 1 --
SELECT customerNumber, customerName, country
FROM customers
WHERE country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000
OR country <> 'USA' AND creditLimit BETWEEN 100000 AND 200000
ORDER BY creditLimit DESC;

-- NOMOR 2 --
SELECT productCode, productName, quantityInStock, buyPrice
FROM products
WHERE quantityInStock BETWEEN 1000 AND 2000
AND buyPrice < 50 OR buyPrice > 150
AND productLine NOT LIKE '% Vintage%';

-- NOMOR 3 --
SELECT productCode, productName, MSRP
FROM products
WHERE productLine LIKE 'classic%'
AND buyPrice > 50;

-- NOMOR 4 --
SELECT orderNumber, orderDate, status, customerNumber
FROM orders
WHERE orderNumber > 10250
AND status <> 'shipped' AND status <> 'cancelled'
AND orderDate BETWEEN '2003-12-31' AND '2005-12-31';

-- NOMOR 5 --
SELECT orderNumber, orderLineNumber, productCode, quantityOrdered, 
priceEach * quantityOrdered * 0.95 AS discountedTotalPrice
FROM orderdetails
WHERE quantityOrdered > 50 AND priceEach > 100
AND productCode NOT LIKE '%S18%'
ORDER BY discountedTotalPrice DESC;

