CREATE DATABASE library;
USE library;

CREATE TABLE authors (
id INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(100) NOT NULL
);

CREATE TABLE books (
id INT PRIMARY KEY AUTO_INCREMENT,
isbn VARCHAR(13),
title VARCHAR(100) NOT NULL,
author_id INT NOT NULL,
FOREIGN KEY (author_id) REFERENCES authors(id)
);

ALTER TABLE authors
ADD nationality VARCHAR(50) NOT NULL;

ALTER TABLE books
MODIFY isbn VARCHAR(100) UNIQUE;

SHOW TABLES;

CREATE TABLE members (
id INT AUTO_INCREMENT PRIMARY KEY ,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
phone_number CHAR(10) , 
join_date DATE NOT NULL,
membership_type VARCHAR(50) NOT NULL
);

CREATE TABLE borrowings (
id INT AUTO_INCREMENT PRIMARY KEY ,
member_id INT NOT NULL,
book_id INT NOT NULL ,
borrow_date DATE NOT NULL,
return_date DATE NULL,
FOREIGN KEY (member_id) REFERENCES members (id),
FOREIGN KEY (book_id) REFERENCES books (id),
);

