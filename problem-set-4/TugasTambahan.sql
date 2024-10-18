-- Tugas Tambahan
-- Adrian Tri Putra

SELECT * FROM customers
SELECT customernumber, customername, country
FROM customers
-- WHERE customername LIKE 'S%' AND customername LIKE '%inc'
WHERE (customername LIKE 'T%' OR customername LIKE 'S%') 
	AND (customername LIKE '%inc.' OR customername LIKE '%corp.')
	AND (country IN ('Canada', 'USA'))
