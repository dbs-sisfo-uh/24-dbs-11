#1
SELECT 
    customers.customerName,
    CONCAT(employees.firstName, ' ', employees.lastName) AS salesRep,
    customers.creditLimit - SUM(payments.amount) AS remainingCredit
FROM customers
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN payments USING(customerNumber)
GROUP BY customers.customerName
HAVING remainingCredit > 0;

SELECT 
    customers.customerName,
    CONCAT(employees.firstName, ' ', employees.lastName) AS salesRep,
    customers.creditLimit - SUM(payments.amount) AS remainingCredit
FROM customers
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customers.customerName
HAVING remainingCredit > 0;


#2
SELECT 
    products.productName AS NamaProduk,
    customers.customerName AS NamaCustomer,
    COUNT(DISTINCT customers.customerNumber) AS JumlahCustomer,
    SUM(orderdetails.quantityOrdered) AS TotalProdukDipesan
FROM 
    products
JOIN 
    orderdetails ON products.productCode = orderdetails.productCode
JOIN 
    orders ON orderdetails.orderNumber = orders.orderNumber
JOIN 
    customers ON orders.customerNumber = customers.customerNumber
GROUP BY 
    products.productName
ORDER BY products.productName 
    
#3
SELECT CONCAT(employees.firstName, ' ', employees.lastName) AS employeeName,
       COUNT(customers.customerNumber) AS TotalCustomers
FROM employees
JOIN customers ON employees.employeeNumber  = customers.salesRepEmployeeNumber
GROUP BY employees.employeeNumber
ORDER BY TotalCustomers DESC;


#4
SELECT 
    CONCAT(employees.firstName, ' ', employees.lastName) AS "Nama Karyawan",
    products.productName AS "Nama Produk",
    SUM(orderdetails.quantityOrdered) AS "Jumlah Pesanan"
FROM products
JOIN orderdetails ON products.productCode = orderdetails.productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
JOIN customers ON orders.customerNumber = customers.customerNumber
RIGHT JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN offices ON employees.officeCode = offices.officeCode
WHERE offices.country = 'Australia'
GROUP BY employees.employeeNumber, products.productName
ORDER BY SUM(quantityOrdered) DESC;


#5
SELECT customers.customerName,
       GROUP_CONCAT(products.productName ORDER BY products.productName) AS "Nama Produk",
       COUNT(products.productName) AS "Banyak Jenis Produk"
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE orders.shippedDate IS NULL
GROUP BY customers.customerName;

#TUGAS TAMBAHAN
#1 
SELECT customers.country , AVG(payments.amount)
FROM customers 
JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customers.country

#2
SELECT year( orders.orderDate) AS Tahun, 
       SUM(orderdetails.quantityOrdered * orderdetails.priceeach) AS jumlah_pemasukannya
FROM orders
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
GROUP BY year(orders.orderDate)





