-- NAMA	: ILHAM KURNIAWAN
-- NIM	: H071231024


-- NOMOR 1
CREATE DATABASE sepakbola;

USE sepakbola;

CREATE TABLE klub (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nama_klub VARCHAR(50) NOT NULL,
	kota_asal VARCHAR(20) NOT NULL
);

CREATE TABLE pemain (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nama_pemain VARCHAR(50) NOT NULL,
	posisi VARCHAR(20) NOT NULL,
	id_klub INT NOT NULL,
	FOREIGN KEY(id_klub) REFERENCES klub(id)	
);

CREATE TABLE pertandingan (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_klub_tuan_rumah INT NOT NULL,
	FOREIGN KEY(id_klub_tuan_rumah) REFERENCES klub(id),
	tanggal_pertandingan DATE NOT NULL,
	skor_tuan_rumah INT DEFAULT 0,
	skor_tamu INT DEFAULT 0
);

CREATE INDEX index_posisi_pemain ON pemain(posisi);

CREATE INDEX index_kota_asal ON klub(kota_asal);




-- NOMOR 2
SELECT 
    c.customerName AS Nama_Pelanggan,
    c.country AS Negara_Asal,
    ROUND(SUM(p.amount), 2) AS Total_Pembayaran,
    COUNT(o.orderNumber) AS Jumlah_Pesanan,
    MAX(p.paymentDate) AS Tanggal_Pembayaran_Terakhir,
    CASE 
        WHEN SUM(p.amount) > 100000 THEN 'VIP'
        WHEN SUM(p.amount) BETWEEN 5000 AND 100000 THEN 'Loyal'
        ELSE 'New'
    END AS Status_Pelanggan
FROM 
    customers c
LEFT JOIN 
    payments p ON c.customerNumber = p.customerNumber
LEFT JOIN 
    orders o ON c.customerNumber = o.customerNumber
GROUP BY 
    c.customerName, c.country
ORDER BY 
    c.customerName;




-- NOMOR 3
SELECT customernumber,
	customername,
	SUM(quantityordered) total_quantity,
	case 
		when SUM(quantityordered) > (
			SELECT AVG(quantityordered) FROM orderdetails) then 'di atas rata-rata'
		ELSE 'di bawah rata-rata'
	END AS kategori_pembelian
FROM customers
JOIN orders USING(customernumber)
JOIN orderdetails USING(ordernumber)
GROUP BY customernumber
ORDER BY total_quantity DESC;	