CREATE DATABASE library;

USE library;

CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL
);

CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
	isbn CHAR(13) NOT NULL,
	title VARCHAR(100) NOT NULL,
	author_id INT NOT NULL,
	FOREIGN KEY(author_id) REFERENCES authors(id)
);

DESCRIBE books;

ALTER	TABLE authors
ADD nationality VARCHAR(50) NOT NULL;

ALTER TABLE books
ADD UNIQUE(isbn);

DESCRIBE authors;

ALTER TABLE books
MODIFY title VARCHAR(150) NOT NULL,
ADD published_id YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL;

CREATE TABLE members (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50)NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number VARCHAR(10),
	join_date DATE NOT NULL,
	membership_type VARCHAR(50) NOT NULL	
);

DESCRIBE members;

CREATE TABLE borrowings (
	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY(member_id) REFERENCES members(id),
	FOREIGN KEY(book_id) REFERENCES books(id)
);

DESCRIBE borrowings;

DROP DATABASE library;