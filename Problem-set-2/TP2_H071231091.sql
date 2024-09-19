-- nomor 1
SELECT productcode "KODE PRODUK", productname "NAMA PRODUK", quantityinstock "JUMLAH STOK" FROM products WHERE quantityinstock BETWEEN  5000 and 6000;
-- nomor 2
SELECT ordernumber "NOMOR PESANAN", orderdate "TANGGAL PESANAN", STATUS"STATUS", customernumber"NOMOR PELANGGAN" FROM orders WHERE STATUS != "Shipped" ORDER BY customernumber ASC;
-- nomor 3
SELECT employeenumber"NOMOR KARYAWAN", firstname, lastname, email, jobtitle"JABATAN" FROM employees WHERE jobtitle = "Sales rep" ORDER BY firstname ASC  LIMIT 10 ;
-- nomor 4
SELECT productcode "KODE PRODUK", productname"NAMA PRODUK", productline"LINI PRODUK", buyprice"HARGA BELI" FROM products ORDER BY buyprice DESC LIMIT 5,10;
-- nomor 5
SELECT DISTINCT country, city FROM  customers ORDER BY country,city ASC;