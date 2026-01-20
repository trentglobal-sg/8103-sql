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