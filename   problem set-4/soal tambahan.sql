-- nomor1
SELECT productCode, productName,buyPrice,(buyPrice * 0.9) AS discountedPrice
FROM products
WHERE (buyPrice * 0.9) > 50;

-- nomor2
SELECT customerNumber,customerName,country
FROM customers
WHERE customerName LIKE '%Auto%';
