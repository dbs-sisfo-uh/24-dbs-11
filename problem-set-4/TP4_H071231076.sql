-- Nama : Adrian Tri Putra
-- NIM : H071231076
-- Tugas Praktikum 4

USE classicmodels
# Nomor 1
SELECT * FROM customers
SELECT customernumber, customername, country
FROM customers
WHERE 
	country = 'USA' AND creditlimit  > 50000 AND creditlimit <100000
	OR country != 'USA' AND creditlimit BETWEEN 100000 AND 200000
ORDER BY creditlimit DESC;

# Nomor 2
SELECT * FROM products
SELECT productcode, productname, quantityinstock, buyprice
FROM products
WHERE 
	quantityinstock BETWEEN 1000 AND 2000
	-- Tidak efisien AND productline != 'Vintage Cars' 
	AND productline NOT LIKE'%Vintage%' 
	AND  buyprice <50 OR buyprice >150

# Nomor 3
SELECT * FROM products
SELECT productcode, productname, msrp
FROM products
WHERE productline LIKE '%Classic%' AND buyprice >50

# Nomor 4
SELECT * FROM orders
SELECT ordernumber, orderdate, STATUS, customernumber
FROM orders
WHERE ordernumber >10250 
# Pake in
AND STATUS NOT IN ('Shipped', 'Cancelled')
-- Tidak efisien AND (STATUS != 'Shipped' AND  STATUS !='Cancelled')
AND orderdate BETWEEN '2004-01-01' AND '2005-12-31'

# Nomor 5
SELECT * from orderdetails
SELECT ordernumber, orderlinenumber, productcode, quantityordered, priceeach, 
priceeach * quantityordered * 0.95 AS discountedTotalPrice
FROM orderdetails
WHERE quantityordered >50 AND priceeach >100
	AND productcode NOT LIKE 'S18%' 
	ORDER BY discountedtotalprice DESC 






























































































