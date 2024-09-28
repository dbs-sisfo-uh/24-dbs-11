-- nomor 1
INSERT INTO authors ( NAME, nationality)
VALUES ( 'Tere Liye', 'Indonesia'),
		 ( 'J.K Rowling', 'British'),
		 ( 'Andrea Hirata', '');
		 
SELECT * FROM authors
WHERE `name` = 'Tere Liye'

SELECT id FROM authors
WHERE `name` = 'Tere Liye'

SELECT id FROM authors
WHERE `name` = 'J.K. Rowling'

SELECT id FROM authors
WHERE `name` = 'Andrea Hirata'

INSERT INTO books (isbn, title,author_id, published_year, genre, copies_available)
VALUES (7040289780375, 'Ayah',3, '2015', 'Fiction', 15),
		 (9780375704025, 'Bumi',1, '2014', 'Fantasy', 5),
		 (8310371703024, 'Bulan',1, '2015', 'Fantasy', 3),
		 (9780747532699, 'Harry Potter and the Philosophers Stone',3, '1997', '',10),
		 (7210301703022, 'The Running Grave',3, '2016', 'Fiction', 11);
DELETE FROM books
SELECT * FROM books

SELECT * FROM members
INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES ('John', 'Doe', 'john.doe@example.com', NULL, '2023-04-29', ''),
		 ('Alice', 'Johnson', 'alice.johnson@example.com',1231231231 , '2023-05-01', 'Standar'),
		 ('Bob', 'Williams', 'bob.williams@example.com', 3213214321, '2023-06-20', 'Premium');

SELECT id FROM members
WHERE first_name = 'John' AND last_name = 'Doe';

SELECT id FROM members
WHERE first_name = 'Bob' AND last_name = 'Williams';

SELECT id FROM members
WHERE first_name = 'Alice' AND last_name = 'Johnson';

SELECT * FROM borrowings
INSERT INTO borrowings ( borrowing_id, member_id,book_id,borrow_date,return_date)
VALUES (1, 1, 4, '2023-07-10', '2023-07-25'),
(2, 3, 1, '2023-07-10', NULL),
(3, 2, 5, '2023-09-06', '2023-09-09'),
(4, 2, 3, '2023-09-08', NULL),
(5, 3, 2, '2023-09-10', NULL);


-- nomor 2
SELECT * FROM borrowings
WHERE return_date IS NULL

UPDATE books
SET copies_available = copies_available-1
WHERE id <= 3;

-- nomor 3
UPDATE members
SET membership_type = "Standar"
WHERE id = 11;

SELECT * FROM members

DELETE FROM members
WHERE id = 3;


ALTER TABLE orders
DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD FOREIGN KEY(product_id) REFERENCES product(id)
ON DELETE CASCADE;

