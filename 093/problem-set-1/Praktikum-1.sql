-- NAMA : MUH. TEGAR ADYAKSA
-- NIM  : H071231093


CREATE DATABASE library;  

USE library;

-- NOMOR 1
CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100) NOT NULL
);

CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
	isbn CHAR(13) NOT NULL,
	title VARCHAR(100) NOT NULL, 
	author_id INT NOT NULL,  
	FOREIGN KEY(author_id) REFERENCES authors(id)  
);                                                

-- NOMOR 2
ALTER TABLE authors
ADD COLUMN nationality VARCHAR(50) NOT NULL;                      

-- NOMOR 3
ALTER TABLE books
ADD CONSTRAINT UNIQUE (isbn);                     

-- NOMOR 4
SHOW TABLES;
DESCRIBE authors;
DESCRIBE books;                                   

-- Membuat Tabel Members
CREATE TABLE members (                            
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE NOT NULL, 
	membership_date VARCHAR(50) NOT NULL
)                                                 

-- Menambahkan Variabel Baru Ke Books
ALTER TABLE books
MODIFY title VARCHAR(150) NOT NULL;
ADD published_year YEAR NOT NULL,
ADD genre VARCHAR(50) NOT NULL,
ADD copies_available INT NOT NULL;                         

-- Membuat Tabel Borrowings
CREATE TABLE borrowings (
	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY(member_id) REFERENCES members(id),
	FOREIGN KEY(book_id) REFERENCES BOOKS(id)
)

SHOW TABLES;
DESCRIBE members;
DESCRIBE borrowings;

-- menghapus tabel untuk menguji soal satu per satu
DROP TABLE IF EXISTS borrowings;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS authors;                    



	
