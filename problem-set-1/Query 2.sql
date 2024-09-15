-- H071231076
-- Adrian Tri Putra

-- Nomor 5
ALTER TABLE books
ADD  published_year year NOT NULL,
ADD genre VARCHAR (50) NOT NULL,
ADD copies_available INT NOT NULL,
MODIFY title VARCHAR (150) NOT NULL


DESCRIBE books;
DROP books;

CREATE TABLE members(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (100) UNIQUE KEY NOT NULL,
	phone_number CHAR (10),
	join_date DATE NOT NULL,
	membership_type VARCHAR(50) NOT NULL
);

DESCRIBE members;
DROP members;

CREATE TABLE borrowings(
	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE ,
	FOREIGN KEY (member_id) REFERENCES members(id),
	FOREIGN KEY (book_id) REFERENCES books(id)
);

DESCRIBE borrowings;
DROP borrowings;