-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093

-- NOMOR 1
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk', quantityInStock AS 'Jumlah Stok'
FROM products
WHERE quantityInStock <= 6000 AND quantityInStock >= 5000
ORDER BY quantityInStock;

-- NOMOR 2
SELECT orderNumber AS 'Nomor Pesanan', orderDate AS 'Tanggal Pemesanan', STATUS, customerNumber AS 'Nomor Pelanggan'
FROM orders
WHERE STATUS != 'shipped'
ORDER BY customerNumber;

-- NOMOR 3
SELECT employeenumber AS 'Nomor Karyawan', firstName, lastName, email, jobTitle AS 'Jabatan'
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName 
LIMIT 10;

-- NOMOR 4
SELECT productCode AS 'Kode Produk', productName AS 'Nama Produk', ProductLine AS 'Lini Produk', buyPrice AS 'Harga Beli'
FROM products
ORDER BY buyPrice DESC;
LIMIT 10 OFFSET 5;

-- NOMOR 5
SELECT DISTINCT country, city 
FROM customers;