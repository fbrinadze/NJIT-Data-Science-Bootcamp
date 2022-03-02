/* Class 6 */
-- CREATE TABLE FROM ANOTHER TABLE
CREATE TABLE CUSTOMER_NAME as
	SELECT FIRST_NAME, LAST_NAME, EMAIL
	FROM customer
	WHERE EMAIL IS NOT NULL;

SELECT * from customer_name;

-- DROP TABLE customer_name;

DELETE from customer_name;

-- INSERT DATA FROM ONE TABLE TO ANOTHER

INSERT INTO customer_name (FIRST_NAME, LAST_NAME, EMAIL)
SELECT FIRST_NAME, LAST_NAME, EMAIL
FROM customer
WHERE EMAIL IS NOT NULL;

SELECT 
    *
FROM
    customer_name;

CREATE TABLE CUSTOMER_INFO AS SELECT c.first_name,
    c.last_name,
    a.address,
    a.district,
    ci.city,
    a.postal_code FROM
    CUSTOMER c
        INNER JOIN
    ADDRESS a ON c.address_id = a.address_id
        INNER JOIN
    city CI ON a.city_id = ci.city_id;

SELECT 
    *
FROM
    CUSTOMER_INFO;


-- Update & rollback
SET autocommit = ON;

update customer_info
set first_name = 'After'
WHERE last_name = 'SMITH';

ROLLBACK;

select * from customer_info where last_name = 'smith';

-- TEMP tables

CREATE temporary Table temp_customer_1
select * from customer
where address_id = 5;

SELECT * from temp_customer_1;

-- WITH statement
WITH demo_table AS
(select first_name, last_name from customer)
select * from demo_table;

-- Subquery
SELECT firstname, lastname, title, salary
from employees
WHERE salary = (SELECT max(salary) from employees);

SELECT firstname, lastname, title, salary
from employees
WHERE salary < (select avg(Salary) from employees)
ORDER BY salary DESC;

SELECT * from employees
where employeeid in (select employeeid from addresses where state = 'MA');

SELECT *
FROM ( 
	select c.customer_id, c.first_name, c.last_name, p.rental_id, p.amount
    from payment as p
    inner join customer c
    on c.customer_id = p.customer_id
) as base_table;

-- TESTing for NULLS

SELECT * FROM EMPLOYEES
where
middlename is null;

SELECT * FROM EMPLOYEES
where
middlename is NOT null;

SELECT firstname, middlename, lastname, ifnull(middlename, '*') as NEW_MIDDLE_NAME
FROM employees
order by MiddleName;










