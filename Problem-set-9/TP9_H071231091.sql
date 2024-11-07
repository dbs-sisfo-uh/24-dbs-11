#1
CREATE DATABASE SepakBola;
USE SepakBola;

	CREATE TABLE club (
	  id INT AUTO_INCREMENT PRIMARY KEY,
	  nama_club VARCHAR(50) NOT NULL,
	  kota_asal VARCHAR(20) NOT NULL 
	);
	
	CREATE TABLE pemain(
	   id INT AUTO_INCREMENT PRIMARY KEY,
	   nama_pemain VARCHAR(50) NOT NULL,
	   posisi VARCHAR (20) NOT NULL,
	   id_club INT, FOREIGN KEY (id_club) REFERENCES club(id)
	);
	
	CREATE TABLE pertandingan(
	  id INT AUTO_INCREMENT PRIMARY KEY,
	  id_club_tuan_rumah INT, FOREIGN KEY(id_club_tuan_rumah) REFERENCES pemain(id_club),
	  id_club_tamu INT, FOREIGN KEY(id_club_tamu) REFERENCES club(id),
	  tanggal_pertandingan DATE NOT NULL,
	  skor_tuan_rumah INT DEFAULT 0,
	  skor_tamu INT DEFAULT 0 	
	);
	
	
	INSERT INTO club (nama_club, kota_asal)
   VALUES
    ('Persija Jakarta', 'Jakarta'),
    ('Arema FC', 'Malang'),
    ('Persebaya Surabaya', 'Surabaya');
   
   INSERT INTO pemain (nama_pemain, posisi, id_club)
   VALUES
    ('Andritany Ardhiyasa', 'Kiper', 1),  
    ('Marko Simic', 'Penyerang', 1),       
    ('Cristian Gonzales', 'Penyerang', 2), 
    ('Evan Dimas', 'Gelandang', 3);         
    
   INSERT INTO pertandingan (id_club_tuan_rumah, id_club_tamu, tanggal_pertandingan, skor_tuan_rumah, skor_tamu)
   VALUES
    (1, 2, '2024-11-10', 3, 1),  
    (2, 3, '2024-11-12', 2, 2),  
    (3, 1, '2024-11-15', 1, 2); 

###################
SELECT * FROM club ;
SELECT * FROM pemain;

START TRANSACTION;
UPDATE club 
SET nama_club = 'MU'
WHERE id = '1'
COMMIT;

START TRANSACTION;
UPDATE club 
SET nama_club = 'A'
WHERE id = '2'
ROLLBACK;
#####################


ALTER TABLE pemain
ADD INDEX posisi (posisi);

ALTER TABLE club
ADD INDEX kota_asal (kota_asal);

DESCRIBE club;
DESCRIBE pemain;
DESCRIBE pertandingan;



#2
SELECT customerName,country,SUM(amount) AS jumlah_pembayarannya,COUNT(orderNumber) AS jumlah_berapa_kali_pesan,MAX(paymentDate) AS tanggal_pembayayan_yg_terakhir,
	case
		when SUM(amount) > 100000 then 'VIP'
		when SUM(amount) BETWEEN 5000 AND 100000 THEN 'Loyal'
		ELSE 'new'
	END AS 'statusnya'
FROM customers
left JOIN orders ON customers.customerNumber = orders.customerNumber
left JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY customerName;




#3
SELECT customers.customerNumber,customers.customerName,SUM(orderdetails.quantityOrdered) AS total_quantity,
    CASE
        WHEN SUM(orderdetails.quantityOrdered) > (
            SELECT AVG(totalnya) 
            FROM (
                SELECT SUM(orderdetails.quantityOrdered) AS totalnya
                FROM orderdetails
                JOIN orders ON orderdetails.orderNumber = orders.orderNumber
                JOIN customers ON orders.customerNumber = customers.customerNumber
                GROUP BY customers.customerNumber) AS hasil) THEN 'di atas rata-rata'
        ELSE 'di bawah rata-rata'
    END AS kategori_pembelian
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
GROUP BY customers.customerNumber
ORDER BY total_quantity DESC;




