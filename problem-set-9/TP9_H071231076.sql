CREATE DATABASE sepakbola;
USE sepakbola;

CREATE TABLE klub (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(20) NOT NULL 
);

CREATE TABLE pemain (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama_pemain VARCHAR(50) NOT NULL,
	posisi VARCHAR(20) NOT NULL,
	id_klub INT,
	FOREIGN KEY(id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_klub_tuan_rumah INT,
	FOREIGN KEY(id_klub_tuan_rumah) REFERENCES klub(id),
	id_klub_tamu INT,
	FOREIGN KEY (id_klub_tamu) REFERENCES klub(id),
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0
);

ALTER TABLE pemain
ADD INDEX index_posisi(posisi)

ALTER TABLE klub
ADD INDEX index_kota_asal(kota_asal)

DESCRIBE pertandingan;
DESCRIBE pemain;
DESCRIBE klub;
SHOW TABLES 

# Nomor 2
USE classicmodels

SELECT c.customername, c.country, SUM(p.amount) AS TotalPayment, 
count(o.ordernumber) AS 'orderCount', MAX(p.paymentdate) AS 'LastPaymentDate',
case
when SUM(p.amount) > 100000 then 'VIP'
when SUM(p.amount) BETWEEN 5000 AND 10000 then 'Loyal'
ELSE 'New'
END AS 'Status'
FROM customers c
	LEFT JOIN payments p
		USING(customernumber)
	LEFT JOIN orders o
		USING(customernumber)
GROUP BY c.customernumber
ORDER BY c.customername

# Nomor 3
SELECT c.customernumber, c.customername, SUM(od.quantityOrdered) AS totalQuantity,
case
 WHEN SUM(od.quantityOrdered) > (
 SELECT AVG(total_order_quantity) 
   FROM (
      SELECT SUM(od.quantityOrdered) AS total_order_quantity
      FROM orderdetails od
      JOIN orders o
      	USING(ordernumber)
      JOIN customers c
      	USING (customernumber)
      GROUP BY c.customerNumber
      ) AS subquery) THEN 'di atas rata-rata'
ELSE 'di bawah rata-rata'
END AS 'kategori pembelian'
FROM customers c
JOIN orders o
	USING (customernumber)
JOIN orderdetails od
	USING (ordernumber)
GROUP BY c.customernumber
ORDER BY `totalQuantity` DESC

# Soal Tambahan
START TRANSACTION ;
INSERT INTO klub(nama_klub, kota_asal)
VALUES ('Manchester United', 'Manchester')
COMMIT 

START TRANSACTION;
INSERT INTO klub(nama_klub, kota_asal)
VALUES ('Barca', 'Barcelona')

START TRANSACTION;
UPDATE klub
SET nama_klub = 'Persija'
WHERE nama_klub = 'Barca'
SELECT * FROM klub
ROLLBACK 
