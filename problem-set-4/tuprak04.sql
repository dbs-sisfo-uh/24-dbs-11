USE classicmodels

SELECT * FROM customers

-- nomor 1
SELECT customernumber, customername, country, creditlimit
FROM customers
WHERE country = 'USA' AND creditlimit > 50000 AND creditlimit < 100000 
		OR country != 'USA' AND creditlimit BETWEEN  100000 AND 200000
ORDER BY creditlimit DESC;

-- nomor 2
SELECT * FROM products
SELECT productcode, productname, quantityinstock, buyprice
FROM products
WHERE quantityinstock BETWEEN 1000 AND 2000 
AND  buyprice < 50  OR  buyprice > 150
AND productline NOT LIKE "%vintage%" 

-- nomor 3
SELECT * FROM products
SELECT productcode, productname, msrp
FROM products
WHERE productline LIKE "%classic%" AND buyprice > 50

-- nomor 4
SELECT * FROM orders
SELECT ordernumber, orderdate, STATUS, customernumber
FROM orders
WHERE ordernumber > 10250 AND STATUS != "shipped" AND STATUS != "cancelled" 
AND orderdate BETWEEN "2004-01-01" AND "2005-12-31"

-- nomor 5
SELECT * FROM orderdetails
SELECT ordernumber, orderlinenumber, productcode, quantityordered, priceeach,
quantityOrdered * priceEach * 0.95 AS discountedTotalPrice
FROM orderdetails
WHERE quantityordered > 50 AND priceEach > 100 AND productcode NOT LIKE "s18%"
ORDER BY discountedtotalprice DESC


-- soal tambahan 2 nomor
-- soal 1
SELECT * FROM customers
SELECT customername, customernumber, country FROM customers
WHERE (customername LIKE "%auto%")
-- soal 2
SELECT customername, customernumber, country FROM customers
WHERE (customername LIKE "T%" OR customername LIKE  "S%") AND (customername  LIKE "%inc." OR customername LIKE "%corp.")
AND (country = "USA" OR country = "Canada");
