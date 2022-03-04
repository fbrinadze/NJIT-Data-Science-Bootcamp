/* activity 2.7.1 */
-- task 1
select c.name,
	   cl.language,
       cl.Percentage
from country c
join countrylanguage cl
on c.code = cl.countrycode
where cl.Percentage > 10.0
order by cl.percentage desc;

-- task 2
select ci.name, ci.population
from city ci
join country c
on ci.countrycode = c.code
where c.name = 'United States' and ci.population > 1000000
order by ci.population desc;

/* activity 2.7.2 */
-- task 1
create or replace view vw_leage_of_tiny_nations as
select c.name, ci.population
from country c
join city ci 
on c.code = ci.countrycode
where c.SurfaceArea < 1500;

select * from vw_leage_of_tiny_nations;

-- task 2
create or replace view vw_leage_of_tiny_nations as
select c.code, c.name, cl.language, c.population, c.headofstate
from country c
join countrylanguage cl
on c.code = cl.CountryCode
where c.GovernmentForm = 'Federal Republic';

select * from vw_leage_of_tiny_nations;

/* activity 2.7.3 */
-- task 1
/* stored procedure */
-- with delimiter
/* EXAMPLE: 
delimiter $
create procedure get_customer_names()
begin
	select distinct
		concat(first_name, ' ', last_name) as customer_name
	from customer;
end $

call get_customer_names();*/

delimiter $
create procedure get_country_list()
begin
	select code, name, continent, population, headofstate
    from country;
end $

call get_country_list();