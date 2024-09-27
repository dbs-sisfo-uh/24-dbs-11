-- soal 1
SELECT productCode AS 'kode produk',productName AS 'Nama Produk', quantityInStock AS 'Jumlah Stok' FROM products
WHERE quantityInStock BETWEEN 5000 AND 6000;
_
-- soal 2
SELECT orderNumber AS 'Nomor Pesanan', orderDate AS 'Tanggal Pesanan', STATUS , customerNumber AS 'nomor pelanggan' FROM orders
WHERE STATUS != 'shipped'
ORDER BY customerNumber ;
phpmyadmin
-- soal 3
SELECT employeeNumber AS 'nomor pelanggan', firstName , lastName, email, jobTitle 'jabatan' FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY firstName
LIMIT 10;

-- soal 4
SELECT productCode AS 'kode produk', productName 'nama produk', productLine AS 'lini produk', buyPrice AS 'harga beli' FROM products
ORDER BY buyPrice ASC 
LIMIT 10 OFFSET 5 ;

-- soal 5
SELECT DISTINCT country FROM customers
ORDER BY country, city ASC;

	

