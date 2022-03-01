/* Name: Felix Brinadze
   Email: felix.brinadze@gmail.com
   Description: Module 5 Lesson Companion 
*/

/* Lesson Companion Module 5 */
-- Lesson:1 | Joins

SELECT f.title,
       l.name as language_of_film
FROM film f
inner join
language l 
on
f.language_id = l.language_id
where f.rating = 'G';
-- 178

SELECT a.address, 
       c.city,
       co.country
FROM address a
INNER JOIN city c
ON a.city_id = c.city_id
JOIN country CO
on
c.country_id = co.country_id
where co.country = 'United States';

SELECT a.address, 
       c.city,
       co.country
FROM address a
JOIN city c
ON a.city_id = c.city_id
INNER JOIN country CO
on
c.country_id = co.country_id;

SELECT a.first_name,
	   a.last_name,
       f.title
FROM actor a
INNER JOIN film_actor ac
ON a.actor_id = ac.actor_id
JOIN film f
ON ac.film_id = f.film_id
WHERE a.first_name like 'S%';
-- 375

SELECT count(*)
FROM customer c
JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
on
a.city_id = ci.city_id
JOIN country CO
on
ci.country_id = co.country_id
WHERE CO.country = 'UNITED STATES'
-- 36









	