# Nama: Adrian Tri Putra
# NIM: H071231076
# TP2

# Soal 1
SELECT productcode, productname, quantityinstock FROM products
WHERE quantityinstock >= 5000 AND quantityinstock <= 6000; 

# Soal 2
SELECT ordernumber, orderdate, STATUS, customernumber FROM orders
WHERE STATUS != "shipped" ORDER BY ordernumber ASC ;

# Soal 3
SELECT employeenumber, firstname, lastname, email, jobtitle FROM employees
WHERE jobtitle = "Sales Rep" ORDER BY firstname LIMIT 10;

# Soal 4
SELECT productcode, productname, productline, buyprice FROM products
ORDER BY buyprice DESC LIMIT 5, 10;

# Soal 5
SELECT distinct country, city FROM customers ORDER BY country, city;

