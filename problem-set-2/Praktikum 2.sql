-- Nama : Ilham Kurniawan
-- Nim : H071231024 

-- No 1
SELECT productcode AS 'Kode Produk', productname AS 'Nama Produk', quantityinstock AS 'Jumlah Produk'
FROM products
WHERE quantityinstock BETWEEN 5000 AND 6000
ORDER BY quantityinstock ASC;

-- No 2
SELECT ordernumber AS 'Nomor Pesanan', orderdate AS 'Tanggal Pesanan', `status`, customernumber AS 'Nomor Pelanggan'
FROM orders
WHERE `status` != "Shipped"
ORDER BY customernumber ASC;

-- No 3
SELECT employeenumber AS 'Nomor Karyawan', firstname, lastname, email, jobtitle AS 'Jabatan'
FROM employees
WHERE jobtitle = "Sales Rep"
ORDER BY firstname
LIMIT 10;

-- No 4
SELECT productcode AS 'Kode Produk', productname AS 'Nama Produk', productline AS 'Lini Produk', buyprice AS 'Harga Beli'
FROM products
ORDER BY buyprice DESC
LIMIT 5,10;

-- No 5
SELECT DISTINCT country, city
FROM customers
ORDER BY country, city;

