-- nomor 1
CREATE DATABASE sepakBola;

USE sepakBola;

CREATE TABLE klub(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_pemain VARCHAR(50) NOT NULL,
    posisi VARCHAR(20) NOT NULL,
    id_klub INT,
    FOREIGN KEY (id_klub) REFERENCES klub(id)
);

CREATE TABLE pertandingan(
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_klub_tuan_rumah INT,
	id_klub_tamu INT,
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT(0),
	skor_tamu INT DEFAULT(0),
	FOREIGN KEY(id_klub_tuan_rumah) REFERENCES pemain(id_klub),
	FOREIGN KEY(id_klub_tamu) REFERENCES klub(id)
);

-- sepakbola
START TRANSACTION;
 
INSERT INTO klub (nama_klub, kota_asal) 
VALUES ('Persija', 'Jakarta'),
		 ('Arema FC', 'Malang'),
		 ('Persebaya', 'Surabaya'),
		 ('PSM Makassar', 'Makassar'),
		 ('Bali United', 'Bali');
		 
INSERT INTO pemain (nama_pemain, posisi, id_klub) 
VALUES ('Evan Dimas', 'Midfielder', 1),
		 ('Riko Simanjuntak', 'Forward', 1),
		 ('Hanif Sjahbandi', ' Defender', 2),
		 ('Makan Konate', ' Midfielder', 2),
		 ('David da Silva', 'Forward', 3),
		 ('Irfan Jaya', 'Forward', 4),
		 ('Rizky Pellu','Midfielder', 4),
		 ('Ilija Spasojevic','Forward', 5),
		 ('Andhika Wijaya','Defender', 5);
INSERT INTO pertandingan (id_klub_tuan_rumah, id_klub_tamu, tanggal_pertandingan, skor_tuan_rumah, skor_tamu)
VALUES (1, 2, 2024-09-10, 2, 1),
		 (3, 4, 2024-09-12, 1, 1),
		 (5, 1, 2024-09-15, 0, 3),
		 (2, 5, 2024-09-20, 1, 2),
		 (4, 3, 2024-09-25, 2, 0);
COMMIT;
-------- p
SELECT * FROM klub ;
SELECT * FROM pemain;
SELECT * FROM pertandingan;

--------- p

-- nomor 2
SELECT
    customerName,
    country,
    SUM(amount) AS totalPayment,
    COUNT(orderNumber) AS orderCount,
    MAX(paymentDate) AS LastPaymentDate,
    case
        -- when customerName = 'Atelier graphique' then 'Loyal'
        when SUM(amount) > 100000 then 'VIP'
        when SUM(amount) >  5000 AND 100000 then 'Loyal'
        ELSE 'New'
    END AS status
FROM customers
LEFT JOIN orders USING (customerNumber)
LEFT JOIN payments USING (customerNumber)
GROUP BY customerName;


-- nomor 3
SELECT
	customerNumber,
	customerName,
	SUM(quantityOrdered) AS total_quantity,
	case
		when SUM(quantityOrdered)  > (SELECT AVG(quantityOrdered) FROM orderdetails) then 'di atas rata-rata'
		ELSE 'di bawah rata-rata'
	END AS kategori_pembelian
FROM customers
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
GROUP by customerNumber
ORDER BY total_quantity DESC;