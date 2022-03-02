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

-- DELETE from CUSTOMER_INFO;
DESCRIBE customer_info;


