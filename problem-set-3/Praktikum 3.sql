-- NAMA : ILHAM KURNIAWAN
-- NIM : H071231024


-- NO 1
INSERT INTO authors VALUES (1, 'Tere Liye', 'Indonesian'), (2, 'J.K. Rowling', 'British'), (3, 'Andrea Hirata', '');

SELECT * FROM authors;

INSERT INTO books VALUES (1, 'Ayah', 7040289780375, 3, 2015, 'Fiction', 15), (2, 'Bumi', 9780375704025, 1, 2014, 'Fantasy', 5), (3, 'Bulan', 8310371703024, 1, 2015, 'Fantasy', 3), (4, "Harry Potter and The Philosopher's Stone", 9780747532699, 2, 1997, '', 10), (5, 'The Running Grave', 7210301703022, 2, 2016, 'Fiction', 11);

SELECT * FROM books;

INSERT INTO members VALUES (1, 'John', 'Doe', 'john.doe@example.com', NULL, '2023-04-29', ''), (2, 'Alice', 'Johnson', 'alice.johnson@example.com', '1231231231', '2023-05-01', 'Standar'), (3, 'Bob', 'Williams', 'bob.williams@example.com', '3213214321', '2023-06-20', 'Premium');

SELECT * FROM members;

INSERT INTO borrowings VALUES (1, 1, 4, '2023-07-10', '2023-07-25'), (2, 3, 1, '2023-08-01', NULL), (3, 2, 5, '2023-09-06', '2023-09-09'), (4, 2, 3, '2023-09-08', NULL), (5, 3, 2, '2023-09-10', NULL);

SELECT * FROM borrowings;


-- NO 2
UPDATE books
SET copies_available = copies_available - 1
WHERE title = 'Ayah';

UPDATE books
SET copies_available = copies_available - 1
WHERE title = 'Bulan';

UPDATE books
SET copies_available = copies_available - 1
WHERE title = 'Bumi';

SELECT * FROM books;


-- NO 3
ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1;

ALTER TABLE borrowings
ADD CONSTRAINT borrowings_ibfk_1
FOREIGN KEY (member_id) REFERENCES members(id)
ON DELETE CASCADE;

DELETE FROM members
WHERE membership_type = 'Standar';

UPDATE members
SET membership_type = 'Standar'
WHERE membership_type = 'Premium';

SELECT * FROM members;

-- DELETE FROM members;
-- DELETE FROM books;
-- DELETE FROM authors;
-- DELETE FROM borrowings;
