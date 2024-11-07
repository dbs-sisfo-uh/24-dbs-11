# Nama : Adrian Tri Putra
# NIM : H071231076

USE library
# Nomor 1
SELECT id, nama FROM authors
WHERE nama = 'J.K. Rowling
'
INSERT INTO authors (nama, nationality)
VALUES ('Tere Liye', 'Indonesian'), 
('J.K. Rowling', 'British'), 
('Andrea hirata', '')
SELECT * FROM authors


SELECT isbn, title, author_id
FROM books
WHERE title = 'Harry Potter and the Philosopher's Stone';

INSERT INTO books (isbn, title, author_id, published_year, genre, copies_available) 
VALUES ('7040289780375', 'Ayah', 3, 2015, 'Fiction', 15),
('9780375704025', 'Bumi', 1, 2014, 'Fantasy', 5),
('8310371703024', 'Bulan', 1, 2015, 'Fantasy', 3),
('9780747532699', "Harry Potter and the Philosopher's Stone", 2, 1997, '', 10),
('7210301703022', 'The Running Grave', 2, 2016, 'Fiction', 11)
SELECT * FROM books

SELECT id, email, join_date, membership_type
FROM members;

INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
VALUES
('John', 'Doe', 'John.doe@example.com', NULL, '2023-04-29', ''),
('Alice', 'Johnson', 'alice.johnson@example.com', '1231231231', '2023-05-01', 'Standard'),
('Bob', 'Williams', 'bob.williams@example.com', '3213214321', '2023-06-20', 'Premium');
SELECT * FROM members

SELECT * FROM borrowings
WHERE member_id IN(1);

INSERT INTO borrowings(member_id, book_id, borrow_date, return_date)
VALUES (1, 4, "2023-07-10", "2023-07-25"),
	(3, 1, "2023-08-01", NULL),
	(2, 5, "2023-09-06", "2023-09-09"),
	(2, 3, "2023-09-10", NULL),
	(3, 2, "2023-09-10", NULL);
SELECT * FROM borrowings

# Nomor 2
SELECT * FROM books;
SELECT book_id FROM borrowings
WHERE return_date IS NULL;
UPDATE books
SET copies_available = copies_available - 1
WHERE id = 1 OR id = 2 OR id = 3
SELECT * FROM books

UPDATE books
SET copies_available = copies_available - 1
WHERE title IN ('Ayah', 'Bulan', 'Bumi');

# Nomor 3
UPDATE members
SET membership_type = 'standard'
WHERE email IN ('bob.williams@example.com');

ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1;

ALTER TABLE borrowings
ADD CONSTRAINT borrowings_ibfk_1
FOREIGN KEY (member_id) REFERENCES members(id)
ON DELETE CASCADE;
SELECT * FROM borrowings

DELETE FROM members
WHERE email IN ('alice.johnson@example.com');
SELECT * FROM members

