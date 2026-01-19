-- DDL = data definition language (aka the language to create the structures)
-- DML = data manipulation lanaguge (aka how to do CRUD)
-- DQL = data query language (aka how to search in databases)
-- a comment  in SQL is double dashes
CREATE DATABASE swimming_coach;

-- show all databases in the server
SHOW DATABASES;

-- switch to the new database
USE swimming_coach;

-- create the parents table
CREATE TABLE parents (
-- <column name> <data type> <options>
    parent_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
) engine = innodb;

-- show all tables in the database
SHOW TABLES;

CREATE TABLE students (
    student_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45),
    swimming_level TINYINT,
    dob DATETIME
) engine = innodb;

-- see the columns and data types of a table
DESCRIBE students;

-- ALTER TABLE: the command for adding, modifying and deleting columns from a table
ALTER TABLE students ADD COLUMN parent_id INT UNSIGNED NOT NULL;

-- Set students.parent_id as a foregin key
ALTER TABLE students ADD CONSTRAINT fk_parents_students
  FOREIGN KEY (parent_id) REFERENCES parents(parent_id)
  ON DELETE CASCADE
  ON DELETE RESTRICT;

  -- ALTER TABLE: remove a column from a table
  ALTER TABLE students DROP COLUMN swimming_level;

  -- ALTER TABLE: modify column
  ALTER TABLE parents MODIFY COLUMN first_name VARCHAR(45) NOT NULL;

  -- INSERT SOME PARENTS (DML)
  INSERT INTO parents (first_name, last_name) VALUES ("Ah Kow", "Tan");

  -- SEE ALL ROWS FROM A TABLE (DQL)
  SELECT * FROM parents;

  INSERT INTO students (first_name, last_name, dob, parent_id) VALUES ("Ah Mew", "Tan", "2020-10-01", 1);