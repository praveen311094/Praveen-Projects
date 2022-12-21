/* DBMS - Database Organizing->Storing->Retrieving data 
RDBMS- Contains tables(collection of rows and columns)
Rows-Tuple
Columns-Attributes
*/

-- create database sql1;

create table my_info(
id int auto_increment,
lname varchar(15),
fname varchar(20),
status varchar(10),
phone_no numeric(15),
dob DATE,
primary key (id) 
);

insert into my_info(lname,fname,status,phone_no,dob)
values("Mr.","steve","M","123",'2000-2-2'),
("Mr.","Peter","M","121","2002-1-1"),
("Ms.","Senorita","S","143","2004-06-03")
;
select * from my_info;

create table table1
(
emp_id int not null auto_increment,
emp_name varchar(20),
city_code int(10),
primary key (emp_id)
);



create table emp1
(
roll_no int not null primary key,
address varchar(50),
emp_id int,
constraint fk
foreign key (emp_id)
references my_info (id)
)

select * from emp1;
select * from my_info;

insert into emp1(roll_no,address,emp_id)
values(1,'hyd','1'),
(2,'chennai','2'),
(3,'goa','3');

update my_info
set status="S",dob="2003-01-21"
where id='2';

#Alter, update, add, delete, drop, truncate, unique, not null, select, set, create 

alter table emp1
modify column address varchar(100); 

alter table emp1
add column profession varchar(200);

select * from emp1;

delete from emp1 where emp_id=2;

select * from my_info;

drop table table_name;

truncate table table_name;

select distinct column_name from table_name;

select count(distinct column_name) from table_name;

select * from emp1;
select * from my_info;

select distinct status from my_info;
select count(distinct status) from my_info;

select * from my_info
where id=3;

select * from my_info
order by id desc, phone_no desc;

select * from my_info
limit 2;

select * from my_info
where fname like 'P%r';

select * from my_info
where fname like '_t%';

Aggregate Functions:

select min(TransportationExpense) as LV from absentism;

select min(Distance to Work) as DTW from absentism where id=14;

select max(Age) from absentism;

select * from absentism
limit 10;

select Avg(salary) from salaries
limit 100;

select min(salary) from salaries;

select * from salaries;
select * from titles;

select count(emp_no),salary from salaries
group by salary
limit 10;
select * from salaries;


select * from departments;
select * from dept_emp;

SELECT 
    COUNT(Dept_name) AS CountDn
FROM
    employeedetails
GROUP BY Dept_name
ORDER BY CountDn desc;

select * from absentism;

select count(ID) as CID, Age from absentism
group by Children
having Age>30
order by CID desc;

#Inner Join#
select payment.customer_id, first_name, create_date
from customer
inner join payment
on payment.customer_id = customer.customer_id;

#Left Outer Join#
select payment.customer_id, first_name, create_date
from payment
right join customer
on payment.customer_id = customer.customer_id;

#Union#
select * from dept_emp
union
select * from dept_manager;

select * from dept_emp
union all
select * from dept_manager;

#Arithmetic Operators#
select 10+10;
select 10%10;

#Comparison Operators#
select * from payment;

select * from payment
where amount > 5.99;

select * from payment
where amount <> 5.99;

#Logical#

select * from payment
where customer_id = 2 OR amount = 10.99;

select * from payment
where customer_id = 2 AND amount = 4.99;

select * from payment
where customer_id IN(1,2) AND staff_id = 1 AND amount = 4.99;

select payment_id,amount,
case
when amount = 0.99 then 'low price'
when amount > 5.99 then 'high price'
else 'Avg price'
end as Price_details
from payment;

select address,district,city_id
from address
order by
case
when district is null then city_id
else district
end;


#Common Table Expression#

select * from payment;

with low_price as(
select * from payment where amount = 0.99)
select payment_id,customer_id from low_price
where customer_id in(1,2);

select payment_id,customer_id from payment
where amount = 0.99 and customer_id in(1,2); 

select title,description,length from film;

select * from film;

replace view film_view as
select title,length from film
where title like '%A';

select * from film_view;

create or replace view film_view2 as
select title,length from film
where title like 'A%K' and length >=24;

drop view film_view2;

select * from film_view2;

select distinct concat(first_name,' ',last_name) as emp_name,salary from employees
inner join salaries 
on employees.emp_no = salaries.emp_no;

select first_name as emp_name,emp_no,gender from employees
where emp_no in(select emp_no from employees);

select emp_no,salary from salaries
where salary = (select max(salary) from salaries);

select coalesce(' ',null,1,'pk',null);

select ifnull('praveen',0);
















        














