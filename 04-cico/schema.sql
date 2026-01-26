CREATE DATABASE cico_tracker;
USE cico_tracker;

CREATE TABLE food_entries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dateTime DATETIME NOT NULL,
    foodName VARCHAR(255) NOT NULL,
    calories INT NOT NULL,
    meal_id INT UNSIGNED NOT NULL,
    tags JSON,
    servingSize INT NOT NULL,
    unit VARCHAR(50) NOT NULL
);

CREATE TABLE meals (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    identifier VARCHAR(100)
) engine = INNODB;

INSERT INTO meals (name, identifier) VALUE 
    ("N/A", "n/a"),
    ("Breakfast", "breakfast"),
    ("Lunch", "lunch"),
    ("Dinner", "dinner"),
    ("Snack", "snack");

ALTER TABLE food_entries ADD CONSTRAINT fk_food_entries_meals
  FOREIGN KEY (meal_id) REFERENCES meals(id);