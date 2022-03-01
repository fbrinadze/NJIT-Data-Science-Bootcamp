/*Activity
Independent Practice: IN, BETWEEN, and Aliases

IN
Teaching Example: Baseline query:
*/

SELECT title, rating
FROM film
WHERE title LIKE 'a%' AND rating IN ('G','PG','PG-13');
-- Note that double or single quotes can be used.

-- BETWEEN
-- Teaching Example: Baseline query:
SELECT title, rating
FROM film
WHERE rental_RATE BETWEEN 2 AND 4;
 
-- Aliases
-- Teaching Example:
SELECT first_name AS "First Name", last_name AS last
FROM customer
LIMIT 10;
-- Note: Since last is only one word, it does not require quotes for its alias.

-- IN
-- Select the title and rating of films that have a rental rate of less than $4 and are rated R or NC-17.
 -- Select the title and rating of films that begin with T and have a duration of 3, 5, or 7 days. Note that since duration is numerical, you do not need quotes.
 
-- BETWEEN
-- Select the title and duration of films that have a duration of between 90 and 120 minutes.
-- Select the film_id and title of films that have a film_id of between 100 and 201.
 
-- Aliases
-
