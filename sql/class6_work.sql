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

-- activity 2.6.1
select * from country;

/* insert bara into country table */
-- TASK 1
INSERT INTO country (
code, 
name, 
continent, 
region, 
surfacearea, 
indepyear, 
population, 
lifeexpectancy, 
GNP, 
GNPOLD, 
LOCALNAME, 
GOVERnmentform,
headofstate, 
capital
)
VALUES (
'BAS',
'Basura',
'Oceania',
'Polynesia',
450,
2005,
65000,
80.0,
1300,
1150,
'Basura',
'Federal Republic',
'Auntie A.',
NULL
);

-- TASK 2
select * from country where code = 'BAS';
UPDATE country
SET lifeexpectancy = 79.9
WHERE code = 'BAS';

-- TASK 3
SELECT * FROM country c
ORDER by c.LifeExpectancy DESC
LIMIT 5;

/* Activity 2.6.2 */
-- Task 1
SELECT * from country;
# list 1: Independent countries
SELECT * from country c
WHERE c.IndepYear IS NOT NULL;

# list 2: Colonies
SELECT * from country c
WHERE c.IndepYear IS NULL;

-- Task 2
SELECT c.code, 
       c.name,
       cl.language as 'Language Spoken'
FROM country c
JOIN countrylanguage cl
ON c.Code = cl.CountryCode
WHERE c.name in ('American Samoa', 'Kiribati', 'Tonga');


/* Activity 2.6.3 */

-- Task 1
SELECT * FROM country
order by SurfaceArea ASC
LIMIT 1; -- Holy See (vatican city)

-- Task 2
SELECT * FROM country
where SurfaceArea < 1500 and GNP > (select avg(gnp) from country);

-- Task 3
SELECT * FROM country
where population >= (SELECT max(population) from country)
order by SurfaceArea ASC


