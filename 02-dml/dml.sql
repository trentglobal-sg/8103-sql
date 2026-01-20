-- DML: data manipulation language
-- INSERT INTO <table> (<col1>, <col2>) VALUES (<val1>, <val2>)
INSERT INTO books (title) VALUES ("Romance of the Three Kingdoms");

INSERT INTO authors (first_name, last_name, date_of_birth) VALUES ("Guanzhong", "Luo", "1330-01-01");
INSERT INTO authors (first_name, last_name) VALUES ("Geogre R.", "Martin");

-- See all the rows in a table
-- SELECT * FROM authors;  
-- The * means all the columns

-- Batch inserts: insert more than one row at a time
INSERT INTO authors (first_name, last_name) VALUES ("Russell", "Lee"), ("JRR", "Tolkien");
INSERT INTO books (title) VALUES ("Fellowship of the Ring"), ("The Two Towers" ), ("The Return of the King");
-- Insert FK
INSERT INTO authors_books (book_id, author_id) 
       VALUES (2, 4), (3, 4), (4,4);

-- UPDATE
-- UPDATE <table> SET <col1>=<value1>, <col2>=<value2>, <col..n>=<value..n> WHERE <condition for the row to change>
-- If we don't put the WHERE, all the rows got changed
-- Change Luo's date of birth to 1330-11-11
UPDATE authors SET date_of_birth="1330-11-11" WHERE author_id = 1;

-- Change two or more columns
-- Change first_name to Rus and last name to Li for russel lee
UPDATE authors SET first_name="Rus", last_name="Li" WHERE author_id = 3;

-- DELETE
-- DELETE FROM <table> WHERE <condition for the row to be deleted>
-- Deleting author with author_id 3
DELETE FROM authors WHERE author_id = 3;