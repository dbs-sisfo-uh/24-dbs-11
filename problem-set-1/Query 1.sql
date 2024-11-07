-- H071231076
-- Adrian Tri Putra

-- Nomor 1
CREATE DATABASE library;

USE library;

CREATE TABLE authors(
	id INT PRIMARY KEY AUTO_INCREMENT ,
	nama VARCHAR (100) NOT NULL
);

CREATE TABLE books(
	id INT PRIMARY KEY AUTO_INCREMENT,
	isbn VARCHAR (13) NOT NULL ,
	title VARCHAR (100) NOT NULL,
	author_id INT NOT NULL ,
	FOREIGN KEY(author_id) REFERENCES authors(id)
);

-- Nomor 2
ALTER TABLE authors
ADD nationality VARCHAR (50) NOT NULL ;

-- Nomor 3
ALTER TABLE books
ADD unique (isbn);

-- Nomor 4
SHOW TABLES;
DESCRIBE authors;
DESCRIBE books;

DROP TABLE authors;
DROP TABLE books;