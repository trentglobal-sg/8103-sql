INSERT INTO food_entries (dateTime, foodName, calories, meal, tags, servingSize, unit)
       VALUES('2026-01-21', 'Chicken Rice', 1000, "lunch", '["healthy", "low-carb"]', 1, "serving");

DELETE FROM food_entries WHERE id = 5;

UPDATE food_entries SET dateTime="2026-01-22",
                        foodName="Kaya Toast",
                        calories=900,
                        meal="breakfast",
                        tags='["vegetarian"]',
                        servingSize=2,
                        unit="toast"
                     WHERE id =1;