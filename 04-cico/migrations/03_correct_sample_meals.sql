USE cico_tracker;
-- drop the entire meals TABLE
-- and recreate it and reinsert
-- the rows for id to restart from 1
DROP TABLE meals;

CREATE TABLE meals (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
) ENGINE = INNODB;

INSERT INTO meals (name) VALUES 
    ("N/A"),
    ("Breakfast"),
    ("Lunch"),
    ("Dinner"),
    ("Snack");