-- NAMA : ILHAM KURNIAWAN
-- NIM : H071231024

-- NO 1
INSERT INTO authors (`name`, nationality) 
VALUES ('Tere Liye', 'Indonesian'), 
('J.K. Rowling', 'British'), 
('Andrea Hirata', '');

SELECT * FROM authors;

SELECT id FROM authors
WHERE `name` = "Tere Liye";

SELECT id FROM authors
WHERE `name` = "J.K. Rowling";

SELECT id FROM authors
WHERE `name` = "Andrea Hirata";

INSERT INTO books (title, isbn, author_id, published_year, genre, copies_available) 
VALUES ('Ayah', 7040289780375, 66, 2015, 'Fiction', 15), 
('Bumi', 9780375704025, 64, 2014, 'Fantasy', 5), 
('Bulan', 8310371703024, 64, 2015, 'Fantasy', 3), 
("Harry Potter and The Philosopher's Stone", 9780747532699, 65, 1997, '', 10), 
('The Running Grave', 7210301703022, 65, 2016, 'Fiction', 11);

SELECT * FROM books;

INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type) 
VALUES ('John', 'Doe', 'john.doe@example.com', NULL, '2023-04-29', ''), 
('Alice', 'Johnson', 'alice.johnson@example.com', '1231231231', '2023-05-01', 'Standar'), 
('Bob', 'Williams', 'bob.williams@example.com', '3213214321', '2023-06-20', 'Premium');

SELECT * FROM members;

INSERT INTO borrowings (member_id, book_id, borrow_date, return_date) 
VALUES (61, 94, '2023-07-10', '2023-07-25'),
(63, 91, '2023-08-01', NULL),
(62, 95, '2023-09-06', '2023-09-09'), 
(62, 93, '2023-09-08', NULL), 
(63, 92, '2023-09-10', NULL);

SELECT id FROM members
WHERE first_name = 'John';

SELECT id FROM members
WHERE first_name = 'Alice';

SELECT id FROM members
WHERE first_name = 'Bob';


SELECT id FROM books
WHERE title = 'Ayah';

SELECT id FROM books
WHERE title = 'Bumi';

SELECT id FROM books
WHERE title = 'Bulan';

SELECT id FROM books
WHERE title = "Harry Potter and The Philosopher's Stone";

SELECT id FROM books
WHERE title = 'The Running Grave';

SELECT * FROM borrowings;

-- NO 2
UPDATE books
SET copies_available = copies_available - 1
WHERE title IN ('Ayah', 'Bulan', 'Bumi');

SELECT * FROM books;

-- NO 3

ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1;

ALTER TABLE borrowings
ADD FOREIGN KEY(member_id) REFERENCES member(id)
ON DELETE CASCADE;

UPDATE members
SET membership_type = 'Standar'
WHERE id = 63;

DELETE FROM members
WHERE id = 62;

SELECT * FROM members;

DELETE FROM members;
DELETE FROM books;
DELETE FROM authors;
DELETE FROM borrowings;