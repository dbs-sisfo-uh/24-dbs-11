-- soal 1
SELECT customerNumber, customerName, country, creditlimit
FROM customers
WHERE country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000
   OR   country != 'USA' AND creditLimit BETWEEN 100000 AND 200000
ORDER BY creditLimit DESC;

-- soal 2
SELECT productcode, productname, quantityinstock, buyprice FROM products
WHERE quantityinstock >=  1000 AND quantityinstock <=2000 AND 
buyprice < 50 OR  buyprice >150 
and productline !=  '%vintage%';

-- soal 3
SELECT productcode, productname, MSRP FROM products
WHERE productline  LIKE '%classic%' AND  buyprice > 50;

-- soal 4
SELECT ordernumber, orderdate, STATUS, customernumber FROM orders
WHERE ordernumber >10250 AND STATUS NOT IN  ('shipped','cancelled') AND 
orderdate BETWEEN '2004-01-01' AND '2005-12-31'; 



-- soal 5

SELECT ordernumber,orderlinenumber ,productcode, quantityordered, priceeach, quantityordered * priceeach  - (priceeach * quantityordered * 0.05)  
AS hasildiskon FROM orderdetails 
WHERE quantityordered > 50 AND priceeach > 100 AND 
productcode NOT LIKE 'S18%' ORDER BY hasildiskon DESC;



-- soal 


SELECT customerNumber,customerName, country
FROM customers
WHERE (customerName LIKE 'T%' OR customerName LIKE 'S%')
AND (customerName LIKE '%Inc.' OR customerName LIKE '%Corp.')
AND (country = 'USA' OR country = 'Canada')





