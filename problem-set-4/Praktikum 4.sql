-- Nama : Ilham Kurniawan
-- NIM  : H071231024

-- No 1
SELECT customerNumber, customerName, country
FROM customers
WHERE (country = 'USA' AND creditLimit > 50000 AND creditLimit < 100000)
OR (country != 'USA' AND creditLimit BETWEEN 100000 AND 200000)
ORDER BY creditLimit DESC;

-- No 2
SELECT productCode, productName, quantityInStock, buyPrice
FROM products
WHERE quantityInStock BETWEEN 1000 AND 2000
AND (buyPrice < 50 OR buyPrice > 150) 
AND productLine != 'Vintage';

-- No 3
SELECT productCode, productName, MSRP
FROM products
WHERE productLine LIKE '%Classic%' AND buyPrice > 50;

-- No 4
SELECT orderNumber, orderDate, `status`, customerNumber
FROM orders
WHERE orderNumber > 10250 
AND `status` NOT IN ('Shipped', 'Cancelled')
AND orderDate BETWEEN '2004-01-01' AND '2005-12-31';

-- No 5
SELECT orderNumber, orderLineNumber, productCode, quantityOrdered, priceEach,
(quantityOrdered * priceEach - (quantityOrdered * priceEach * 0.05)) AS discountedTotalPrice
FROM orderdetails
WHERE quantityOrdered > 50
AND priceEach > 100
AND productCode NOT LIKE 'S18%'
ORDER BY discountedTotalPrice DESC;


-- Tugas Tambahan

-- Temukan semua produk di mana selisih antara MSRP dan buyPrice lebih besar dari 30% dari buyPrice,
-- tetapi hanya jika quantityInStock berada di antara 50 dan 100 unit. Tampilkan productCode, productName, MSRP, buyPrice, dan quantityInStock.

SELECT productCode, productName, MSRP, buyPrice, quantityInStock
FROM products
WHERE (MSRP - buyPrice) > (buyPrice * 0.3) AND (quantityInStock BETWEEN 50 AND 100);
