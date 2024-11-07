-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093

USE classicmodels

-- NOMOR 1 
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
	FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0,
	id_klub_tuan_rumah INT,
	id_klub_tamu INT,
	FOREIGN KEY (id_klub_tuan_rumah) REFERENCES klub(id),
	FOREIGN KEY (id_klub_tamu) REFERENCES klub(id)
)

ALTER TABLE pemain
ADD INDEX index_posisi(posisi);
 
ALTER TABLE klub
ADD INDEX index_kota_asal(kota_asal);

DESCRIBE pemain;
DESCRIBE klub;

SET autocommit = 0;

INSERT INTO klub(nama, kota_asal)
VALUES ('Real Madrid', 'Spanyol');

SELECT * FROM klub;

START TRANSACTION;

UPDATE klub 
SET nama = 'Atletico Madrid'
WHERE id = 2;

SELECT * FROM klub;

COMMIT;

UPDATE klub 
SET nama = 'Barcelona'
WHERE id = 1;

SELECT * FROM klub

ROLLBACK;



-- NOMOR 2
SELECT 
	c.customername,
	c.country,
	SUM(p.amount) AS totalPayment,
	COUNT(o.ordernumber) AS orderCount,
	MAX(p.paymentdate) AS lastPaymentDate,
	case 
		when SUM(p.amount) > 100000 then 'VIP'
		when SUM(p.amount) BETWEEN 5000 AND 10000 then 'Loyal'
		ELSE 'New'
	END AS 'status'
FROM customers c
LEFT JOIN orders o USING(customernumber)
LEFT JOIN payments p USING(customernumber)
GROUP BY customername;



-- NOMOR 3
SELECT 
	c.customerNumber,
	c.customerName,
	SUM(od.quantityordered) AS totalQuantity,
	case 
		when SUM(od.quantityOrdered) > (
		SELECT AVG(total) AS 'Mean Order'
		FROM (
			SELECT SUM(od.quantityOrdered) AS total
			FROM orderdetails od
			JOIN orders o USING(ordernumber)
			JOIN customers c USING(customernumber)
			GROUP BY c.customerNumber
			) AS subquery) then 'diatas rata-rata' 
	ELSE 'dibawah rata-rata'
	END AS 'Kategori Pembelian'
FROM customers c
JOIN orders o USING(customernumber)
JOIN orderdetails od USING(ordernumber)
GROUP BY c.customernumber
ORDER BY totalQuantity desc

	