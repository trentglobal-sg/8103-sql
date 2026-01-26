USE cico_tracker;

ALTER TABLE food_entries ADD COLUMN meal_id INT UNSIGNED;

ALTER TABLE food_entries DROP COLUMN meal;