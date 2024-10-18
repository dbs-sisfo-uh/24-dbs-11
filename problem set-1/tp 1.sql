CREATE DATABASE library;

USE library;

CREATE TABLE authors(
	id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE books(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(100) NOT NULL,
    isbn char (13) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

ALTER TABLE authors 
ADD nationality VARCHAR (50) NOT NULL ;

ALTER TABLE books
MODIFY isbn CHAR (13) UNIQUE NOT NULL ;



ALTER TABLE books 
ADD published_year DATE NOT NULL ,
ADD ganre VARCHAR(50) NOT NULL ,
ADD coples_available INT NOT NULL ;

CREATE TABLE members (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    lats_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number CHAR(10),
    join_date DATE NOT NULL,
    membership_type VARCHAR(50) NOT NULL
);

CREATE TABLE borrowings (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES members(id),
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES books(id),
    borrow_date DATE NOT NULL,
    return_date DATE
);


DESCRIBE authors;
DESCRIBE books;
DESCRIBE borrowings;
DESCRIBE members;

    
    


    
    

    