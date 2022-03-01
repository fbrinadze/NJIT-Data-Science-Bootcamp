SELECT c.customer_id, 
	   c.first_name, 
	   c.last_name, 
       p.amount, 
       p.payment_date

FROM customer c
inner join payment p
on c.customer_id = p.customer_id;

select firstname, lastname, title, salary
from
employees;

select *
from
departments;

SELECT e.FirstName, 
	   e.lastname, 
       e.title, 
       e.salary,
       d.firstname as child_firstname,
       d.lastname as child_lastname,
       d.gender as child_gender
FROM employees e
inner join 
dependents d
on
e.employeeid = d.employeeid;

select * from employeesdepartments;
/*alter table employeesdepartments 
modify column StartDate date;*/

SELECT e.employeeID,
	   e.firstname,
	   e.lastname,
	   e.title,
	   ed.startdate,
	   d.departmentname
FROM EMPLOYEEs e 
inner join employeesdepartments ed on e.employeeid = ed.employeeid
inner join departments d on ed.departmentid = d.departmentid;

select * from employees;

-- give me all employees who have children
SELECT e.FirstName, 
	   e.lastname, 
       e.title, 
       e.salary,
       d.firstname as child_firstname,
       d.lastname as child_lastname,
       d.gender as child_gender
FROM employees e
inner join 
dependents d
on
e.employeeid = d.employeeid;

-- give me all employees whether or not they have children
SELECT e.FirstName, 
	   e.lastname, 
       e.title, 
       e.salary,
       d.firstname as child_firstname,
       d.lastname as child_lastname,
       d.gender as child_gender
FROM employees e
left outer join 
dependents d
on
e.employeeid = d.employeeid;

select * from members;
select * from golfcarts;

select m.memberid,
	   g.cartid,
	   m.first,
       m.last,
       g.make,
       g.color,
       g.year
from members m
inner join
golfcarts g
on
m.memberid = g.memberid;

select m.memberid,
	   g.cartid,
	   m.first,
       m.last,
       g.make,
       g.color,
       g.year
from members m
left outer join
golfcarts g
on
m.memberid = g.memberid;

select m.memberid,
	   g.cartid,
	   m.first,
       m.last,
       g.make,
       g.color,
       g.year
from members m
full outer join
golfcarts g
on
m.memberid = g.memberid;


       
