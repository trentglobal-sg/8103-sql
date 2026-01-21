SELECT * FROM employees;   -- * means all columns

-- SELECT <col1>,<col2>,<col3> FROM <table>
SELECT firstName, lastName, email FROM employees;

-- SELECT WHAT ROWS
-- show all employees from office code 1
-- only the rows that matches the condition after the WHERE will be matched
SELECT * FROM employees WHERE officeCode = 1;

-- Find all customers with creditlimit more than 100K
SELECT * FROM customers WHERE creditLimit > 100000;

-- find orders made before the year 2004
SELECT * FROM orders WHERE orderDate < '2004-01-01';    

-- Find all employees with the word 'sales' in their job title
-- the % means wildcard, aka "anything"
SELECT * FROM employees WHERE jobTitle LIKE "%Sales%";  -- anythingSalesanything

-- find all orders where the comments contain the word "complaint"
SELECT * FROM orders WHERE comments LIKE "%complaint%";

-- find all the sales related job title people from office code 1
SELECT * FROM employees WHERE jobTitle LIKE "%sales%" AND officeCode = 1;

-- find all sales related people from office code and office code 2
SELECT * FROM employees WHERE (officeCode=1 OR officeCode=2) AND  jobTitle LIKE "%sales%";

-- SORT
-- by default, sort is in ascending order
SELECT * FROM employees ORDER BY firstName ASC;

-- descending order sort
SELECT * FROM employees ORDER BY lastName DESC;

-- LIMITS AND OFFSET
-- limit is how many results
SELECT * FROM employees LIMIT 5; -- Show the first five results
-- OFFSET: skip the first 5 employees. LIMIT 5: show the next 5
SELECT * FROM employees LIMIT 5 OFFSET 5 

-- INNER JOIN
-- show all employees' first name, last name, phone number, extension and their country
SELECT firstName, lastName, phone, extension, country FROM employees JOIN offices
 ON employees.officeCode = offices.officeCode

-- for each order, show the related order details. show the orderNumber, productCode, quantityOrdered and status
-- show the orders' table's orderNumber column
SELECT orders.orderNumber, productCode, quantityOrdered, status FROM orders JOIN orderdetails
 ON orders.orderNumber = orderdetails.orderNumber;

 
-- for each customer, show the name of the customer, and the email of the customer, 
-- and the first name, last name and email of the sales rep
SELECT customerName, firstName, lastName , employees.email 
FROM customers JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- count how many customers
SELECT COUNT(*)
FROM customers JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- INNER JOIN means for a row from the LHS table
-- to be in the results, it must find a row from the RHS table

-- LEFT JOIN MEANS THAT rows from the LHS are always included
SELECT customerName, firstName, lastName , employees.email 
FROM customers LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- RIGHT JOIN all rows of the right side of the table in the joined table
SELECT customerName, firstName, lastName , employees.email 
FROM customers RIGHT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- for customers in the USA, show their name, the sales rep's first name
-- last name and email
-- NOTE: The WHERE happened after the JOIN
SELECT customerName, firstName, lastName , employees.email, country
FROM customers LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE country = "USA";

-- JOIN, WHERE and ORDER BY
SELECT customerName, firstName, lastName , employees.email, country
FROM customers LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE country = "USA"
ORDER BY creditLimit DESC;

-- also show the top ten customers by their creditlimit
SELECT customerName, firstName, lastName , employees.email, country
FROM customers LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE country = "USA"
ORDER BY creditLimit DESC
LIMIT 10;

-- CURDATE()
-- returns the current date

-- Date diff and now()

-- create
CREATE TABLE employee (
  empId INTEGER PRIMARY KEY AUTO_INCREMENT,
  name TEXT NOT NULL,
  dept TEXT NOT NULL,
  joinedDate DATETIME
);

DESCRIBE employee;

-- insert
INSERT INTO EMPLOYEE (name, dept, joinedDate) 
       VALUES  ('Ava', 'Sales', "2026-01-19" );
       
INSERT INTO EMPLOYEE (name, dept, joinedDate) 
       VALUES  ('John', 'Sales', CURDATE());
       
INSERT INTO EMPLOYEE (name, dept, joinedDate) 
       VALUES  ('Alan', 'Sales', CURDATE() - 5);

SELECT * FROM EMPLOYEE WHERE DATEDIFF(CURDATE(), joinedDate) > 2


-- BACK TO THE CLASSICMODELS
-- Find payments made in the month of October in 2004
SELECT * FROM payments WHERE paymentDate >= "2004-10-01" AND paymentDate <="2004-10-31";

SELECT * FROM payments WHERE paymentDate BETWEEN "2004-10-01" AND "2004-10-10";

-- Find payments made in the month of October in 2004
SELECT YEAR(paymentDate), MONTH(paymentDate), DAY(paymentDate), amount FROM payments;

-- Find payments made in the month of October in 2004
SELECT * FROM payments WHERE YEAR(paymentDate) = 2004 AND MONTH(paymentDate) = 10;


-- AGGREGATE FUNCTIONS
-- those functions summarized a table

-- how many employees are there
SELECT COUNT(*) FROM employees;

SELECT SUM(amount) FROM payments;

SELECT AVG(amount) FROM payments;

SELECT AVG(creditLimit) FROM customers WHERE creditLimit > 0;

SELECT MAX(creditLimit) FROM customers

-- sub query to find customer with the max credit limit
SELECT * FROM customers WHERE creditLimit = 
    (SELECT MAX(creditLimit) FROM customers);

    -- for each country, how many offices there are
-- The form is: for a <category>, I want to know an <aggreate>
-- aggregate: sum, min, max, avg, count
-- Another form: you need a summary for each "something"
-- you group by something
-- Whatever you group by you must select
-- SELECT country, COUNT(*) FROM offices
-- GROUP BY country;

SELECT DISTINCT country FROM offices;

-- SELECT COUNT(*), <category> FROM <table> GROUP BY <category>
-- 1) MySQL will do a SELECT DISTINCT <category> FROM <table>
-- and find out the possible different values <category>
-- 2) Create one group per category
-- 3) go through all rows in the table and put each row in their group
-- 4) apply COUNT(*) to each group

-- For each office, shows how many sales rep there are
-- WHERE happens before GROUP BY
SELECT officeCode, COUNT(*) FROM employees
WHERE jobTitle = "Sales Rep"
GROUP BY officeCode;

-- For each country, show how many employees there are
SELECT country, COUNT(*) FROM employees JOIN offices
ON employees.officeCode = offices.officeCode
GROUP BY country

-- For each country, show how many sales rep there are
-- Show the country with the MOST employees first
SELECT country, COUNT(*) FROM employees JOIN offices
ON employees.officeCode = offices.officeCode
WHERE jobTitle = "Sales Rep"
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 3;

-- HAVING is like WHERE
-- WHERE filter rows
-- HAVING filter groups
-- For each country, show the avg creditLimit of all the customers there
-- and only show country where the average credit limit is at least 25K
SELECT country, AVG(creditLimit) FROM customers
GROUP BY country
HAVING AVG(creditLimit) >= 25000

-- show all customers that have made at least 3 payments and the number of times 
-- they have made payments
SELECT customerNumber, COUNT(*) FROM payments
GROUP BY customerNumber
HAVING COUNT(*) >= 3;


-- Show how much revenue is made in each of month of 2004

SELECT SUM(AMOUNT), MONTH(paymentDate), YEAR(paymentDate) FROM payments
WHERE YEAR(paymentDate) = 2004
GROUP BY MONTH(paymentDate), YEAR(paymentDate);


