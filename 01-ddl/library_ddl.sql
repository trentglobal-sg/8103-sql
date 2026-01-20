-- only create the library database if it doesn't exist yet
CREATE DATABASE IF NOT EXISTS library;

USE library;

-- all SQL keywords are case insensitive but table names and column names are case sensitive
-- syntax for columns in a table
-- <col name> <data type> <options>
CREATE TABLE IF NOT EXISTS books (
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS authors (
    author_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE 
) ENGINE = INNODB;

-- create the columns first
CREATE TABLE IF NOT EXISTS authors_books (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    author_id INT UNSIGNED NOT NULL
) ENGINE = INNODB;

-- create a fk between authors and the authors_books
-- hence the constraint name is (by my convention)
-- authors_authors_books
ALTER TABLE authors_books ADD CONSTRAINT fk_authors_authors_books
 FOREIGN KEY(author_id) REFERENCES authors(author_id);

ALTER TABLE authors_books ADD CONSTRAINT fk_books_authors_books
 FOREIGN KEY(book_id) REFERENCES books(book_id);

CREATE TABLE IF NOT EXISTS editions (
 edition_id INT UNSIGNED,
 ISBN VARCHAR(10) UNIQUE,
 book_id INT UNSIGNED NOT NULL
) ENGINE = INNODB;