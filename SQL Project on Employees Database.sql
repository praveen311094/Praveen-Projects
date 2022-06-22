create database praveen; -- creating database

use praveen; -- selecting database

-- SQL 1 - Mandatory Assignment

# 1. Write a SQL query to find the salaries of all employees

select employee_id, first_name, last_name, salary from employees; -- selected salary column from employees table


# 2. Write a SQL query to find the unique designations of the employees. Return job name.

select distinct job_id, job_title as 'Designation' from jobs; -- using distinct keyword we can show different designations of the employees


# 3. write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.


select CONCAT(first_name, ' ', last_name) AS employee_name, -- Using concat to join both first and last name along with space to print as employee_name
CONCAT('$ ',round(Salary*1.15, 2)) AS Salary FROM Employees; 


# 4. Write a SQL query to list the employee's name and job name as a format of "Employee & Job". 

select concat(a.first_name, a.last_name,'     ',  b.job_title) as "Employee & job"
from employees a
LEFT OUTER JOIN -- It combines the two table but prefer the rows of the first table and add all the rows from the first table to the resulted table
jobs b 
on a.job_id = b.job_id; -- ON keyword is used to specify the condition and join the tables


# 5. Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.

SELECT employee_id,
CONCAT(first_name, ' ', last_name) AS employee_name,
       salary,
       date_format(hire_date, '%M %d,%Y') as hire_date -- %M- Full month name, %d- leading with zero, %Y- Four digits year
FROM employees;


# 6. Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.

select first_name, last_name, length(TRIM(CONCAT(first_name,last_name))) as employee_name_length from employees; -- It will print result only length of characters except spaces of each employee

-- Second way to show result:
select TRIM(CONCAT(first_name,last_name)) AS employee_name,
LENGTH(CONCAT(first_name, last_name)) AS len
 from employees; --  It will prints results along with each employee name
 
 -- Third way to show result:
 select (char_length(first_name)+char_length(last_name)) as 'employee name length' from employees; -- adding character length for both first and last name using + operator 

    
# 7. Write a SQL query to find the employee ID, salary, and commission of all the employees. 

select * from employees;

select employee_id, salary, (commission_pct*100) as commission from employees; -- Commission is calculated from the commission_pct column which is salary * commission_pct


# 8. Write a SQL query to find the unique department with jobs. Return department ID, Job name. 

select distinct department_id, job_id as 'Job' from employees;


# 9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees.

SELECT * FROM employees WHERE hire_date<('1991-1-1'); -- Using where clause to filter out and less than operator to check who joined before year


# 10. Write a SQL query to compute the average salary of those employees who work as ‘shipping clerk’. Return average salary.

select round(avg(salary),2) as 'average salary'from employees where job_id = "sh_clerk"; -- Used where clause and filtered out the job id matching shipping clerk

