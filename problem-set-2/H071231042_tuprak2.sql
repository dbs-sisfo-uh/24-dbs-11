-- soal 1
SELECT productCode, productName, quantityInStock FROM products

WHERE quantityInStock > 5000 AND quantityInStock < 6000

-- soal 2
SELECT orderNumber, orderDate, STATUS, customerNumber FROM orders
WHERE STATUS != 'shipped';

-- soal 3
SELECT employeeNumber, firstName, lastName, email, jobTitle FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;

-- soal 4
SELECT productCode, productName, productLine, buyPrice FROM products
ORDER BY buyPrice
LIMIT 5,10;

-- soal 5
SELECT DISTINCT country, city FROM customers
ORDER BY country, city ASC;
