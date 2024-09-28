ALTER TABLE books 
ADD published_year YEAR,
ADD genre VARCHAR (50),
ADD copies_available INT


SELECT * FROM books;
INSERT  INTO authors (NAME, nationality)  -- TABEL 1
VALUES ("tere liye", "indonesia"),
       ("J.K. Rowling", "British"),
       ("Andrea Hirata", NULL);
       
INSERT INTO books (ISBN, title, author_id, published_year, copies_available, genre) 
VALUES ('7040289780375', 'Ayah', 3, 2015, 15, 'Fiction'), 
       ('9780375704025', 'Bumi',1, 2014,5, 'Fantasy'), 
       ('8310371703024', 'Bulan', 1, 2015 , 3, 'Fantasy' ), 
       ('9780747532699', "Harry Potter and the Philosopher's Stone", 2, 1997, 10, ''),
       ('7210301703022', 'The Running Grave', 2, 2016, 11, 'Finction');
       
INSERT INTO members (first_name, last_name, email, phone_number, join_date, membership_type)
	VALUES("John","Doe","John.doe@example.com",NULL,'2023-04-29'," "),
			("Alice","Johnson","Alice.johnson@example.com",1231231231,'2023-05-01',"Standar"),
			("Bob","Williams","bob.williams@example.com",3213214321,'2023-06-20',"Premium");
			
INSERT INTO borrowings (member_id,book_id,borrow_date,return_date)
	VALUES(1,4,'2023-07-10','2023-07-25'),
			(3,1,'2023-08-01',NULL),
			(2,5,'2023-09-06','2023-09-09'),
			(2,3,'2023-09-08',NULL),
			(3,2,'2023-09-10',NULL);
			
UPDATE books
SET copies_available = 14
WHERE title = "ayah"

UPDATE books
SET copies_available = 4
WHERE title = "bumi"


UPDATE books
SET copies_available = 2
WHERE title = "bulan"

UPDATE members 
SET membership_type = "standar"
WHERE id = 3

DELETE from members
WHERE id = 2

SET FOREIGN_KEY_CHECKS =  0






















       

