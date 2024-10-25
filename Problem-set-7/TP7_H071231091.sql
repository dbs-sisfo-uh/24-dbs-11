#1
SELECT productcode, productname, buyprice
FROM products
WHERE buyprice > (SELECT AVG(buyprice) FROM products);

#2
SELECT orderNumber,orderDate
FROM orders 
JOIN customers ON orders.customerNumber = customers.customerNumber
WHERE customers.salesRepEmployeeNumber IN (
        SELECT employeeNumber
        FROM employees 
        JOIN offices ON employees.officeCode = offices.officeCode
        WHERE offices.city = 'Tokyo');


#3
SELECT customerName, orders.orderNumber, shippedDate, requiredDate, 
    GROUP_CONCAT(products.productname ORDER BY products.productName SEPARATOR ';') AS nama_produknya ,
    SUM(orderdetails.quantityOrdered) AS total_ordered,
    CONCAT(employees.firstName, ' ', employees.lastName) AS employeeName
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
JOIN customers ON orders.customerNumber = customers.customerNumber
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE orders.orderNumber IN (
        SELECT orderNumber 
        FROM orders 
        WHERE shippedDate > requiredDate )

#4
SELECT products.productName AS Nama_Produknya, productlines.productLine AS Kategori_Produknya, 
       SUM(orderdetails.quantityOrdered) AS Jumlah_Total_yang_Dipesan
FROM products
JOIN productlines ON products.productLine = productlines.productLine
JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE productlines.productLine IN (
      SELECT productlines.productLine
      FROM (SELECT productlines.productLine
         FROM products
            JOIN productlines ON products.productLine = productlines.productLine
            JOIN orderdetails ON products.productCode = orderdetails.productCode
            GROUP BY productlines.productLine
            ORDER BY SUM(orderdetails.quantityOrdered) DESC
            LIMIT 3) AS top_kategori)
GROUP BY 
    products.productName
ORDER BY 
    productlines.productLine,
    Jumlah_Total_yang_Dipesan DESC;















