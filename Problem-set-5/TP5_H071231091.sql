#1
SELECT distinct customerName AS namaKustomer, productName AS namaProduk,productDescription AS textDescription
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE products.productName LIKE '%Titanic%'
ORDER BY customers.customerName ASC;

#2	
SELECT customername,productname, status, orders.shippedDate
FROM customers 
JOIN orders ON customers.customernumber = orders.customerNumber
JOIN orderdetails ON  orders.ordernum`ber =orderdetails.ordernumber
JOIN products ON orderdetails.productcode = products.productcode
WHERE productname LIKE '%ferrari%' AND STATUS = 'shipped' AND shippedDate BETWEEN '2003-10-01' AND '2004-09-30' 
ORDER BY shippeddate DESC;

#3
SELECT supervisor.firstname AS Supervisor, employee.firstname AS Karyawan
FROM employees AS employee
JOIN employees AS supervisor ON employee.reportsTo = supervisor.employeeNumber
WHERE supervisor.firstname = 'Gerard'
ORDER BY employee.firstname ;



#4a


SELECT customername, paymentdate, firstname, amount
FROM customers 
JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN payments ON customers.customerNumber = payments.customerNumber
WHERE paymentdate LIKE '%_11_%'
ORDER BY amount DESC
#4b
LIMIT 1;

#4c

SELECT customername, productname
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE customername LIKE '%Corporate Gift Ideas Co.%';


SOAL
#1 TAMPILKAN KARYAWAN YANG TIDAK PUNYA SUPERVISOR

SELECT supervisor.firstname AS Supervisor,employee.firstname AS Karyawan
FROM employees AS employee
LEFT  JOIN employees AS supervisor ON employee.reportsTo = supervisor.employeeNumber
WHERE employee.firstname IS NULL  



SELECT employee.firstName AS Karyawan, supervisor.firstname AS Supervisor
FROM employees AS employee
LEFT JOIN employees AS supervisor ON employee.reportsTo = supervisor.employeeNumber
WHERE employee.reportsTo IS NULL;

#2 TAMPILKAN PELANGGAN YANG BELUM PERNAH MELAKUKAN PEMBAYARAN

SELECT customers.customername , payments.paymentdate
FROM customers
LEFT  JOIN payments ON customers.customernumber = payments.customerNumber
WHERE paymentdate IS NULL;
 












