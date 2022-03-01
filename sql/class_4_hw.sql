/*Activity
GROUP BY
To select groups:
*/
SELECT rating
FROM film
GROUP BY rating;

SELECT rental_rate, rating
FROM film
GROUP BY rental_rate, rating
ORDER BY rental_rate ASC;

-- To select aggregates into GROUP BY:

SELECT COUNT(title), rating
FROM film
GROUP BY rating;

SELECT COUNT(title) rental_rate, rating
FROM film
GROUP BY rental_rate, rating
ORDER BY rental_rate ASC;

-- ORDER BY cleans up groups nicely. Use it when you can!

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;

-- HAVING
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- Aggregate functions (e.g., SUM, MAX) must be filtered in HAVING, not WHERE.

/*HAVING vs. WHERE
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
WHERE be any non-aggregate filter.
GROUP BY customer_id
HAVING SUM(amount) > 100;
HAVING was made for aggregates.

Practice

Sample query:*/

SELECT col1, AGG(col2)
FROM table
WHERE filter // non-aggregate
GROUP BY col1
HAVING filter // aggregate
ORDER BY col1 (ASC/DESC)
;

/* grOUP BY
List the store_id in the staff table by using GROUP BY.
List the total number of staff members (staff_id) in each store by using GROUP BY.
List the store_id in the customer table by using GROUP BY.
List the total number of customers (customer_id) in each store by using GROUP BY.
Select the total number of titles, the rating, and the replacement cost from the film table. Group and order by both rating and replacement cost.
*/


select title, rating, replacement_cost
from film
group by rating,  replacement_cost
order by rating,  replacement_cost;

select store_id
from staff
GROUP by store_id;

select store_id, count(*)
from staff
GROUP by store_id;

select store_id, count(*) from customer
group by store_id;

/*HAVING
List the customer_id and total amount in the payment table. Group by customer_id, and return only results that have an average amount greater than 4.00. Order by customer_id.
List the customer_id and total amount in the payment table. Include only amounts greater than 1.00. Group by customer_id, and return only results that have an average amount greater than 4.00. Order by customer_id.
What value did you put for the WHERE keyword, and what value did you put for HAVING? Why?*/

select customer_id, amount
from payment
group by customer_id
having avg(amount) > 4.00;

select customer_id, amount
from payment
where amount > 1
group by customer_id
having avg(amount) > 1.00
order by customer_id;



