USE classicmodels

SELECT customernumber, YEAR(paymentdate) AS 'Tahun', 
MAX(amount) AS 'Pembayaran Tertinggi'
FROM payments
GROUP BY customernumber,`Tahun`

SELECT p.productline, AVG(o.quantityOrdered) AS 'rata-rata'
FROM products AS p
	JOIN orderdetails AS o
		USING (productcode)
GROUP BY productline