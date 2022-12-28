                       -- CAPSTONE PROJECT ON CLEAN DATA OF BANK MARKETING DATASET--

-- Created Database bank_marketing

select * from bank_data;

-- 1. Write an SQL query to identify the age group which is taking more loan and then calculate the sum of all of the balances of it?

select age, sum(balance) from bank_data
where loan='yes'
order by sum(balance) desc;


-- 2. Write an SQL query to calculate for each record if a loan has been taken less than 100, 
-- then  calculate the fine of 15% of the current balance and create a temp table and   
-- then add the amount for each month from that temp table? 

select * from bank_data
where loan='yes' and balance<100;

select *,
case
when balance<100 and loan='yes' then balance*0.15
end as Fine_Value
from bank1;                                                -- Used case statement to create new column 'Fine_value'

create temporary table bank1 select * from bank_data;    -- Created temp table from original table

select * from bank1;

with temp1 as (select *,                                        
case                                                                   
when balance<100 and loan='yes' then balance*0.15
end as Fine_Value
from bank1)
select age, month, balance, loan, sum(Fine_Value) from temp1       -- added the amount for each month from that temp table
group by month;                                                     



-- 3. Write an SQL query to calculate each age group along with each department's highest balance record? 

select * from bank_data;

select age, job, max(balance) from bank_data
group by job
order by max(balance) desc;



-- 4 Write an SQL query to find which profession has taken more loan along with age?

select age,job,loan, max(balance) as more_loan from bank_data         
where loan='yes';



-- 5. Write an SQL query to calculate each month's total balance and then calculate in which month the highest amount of transaction was performed?

select month, sum(balance) as Total_Balance from bank_data
group by month                                                              -- Categories data into each month    group by -- groups or divides data
order by Total_Balance desc limit 1;                                         -- To get highest transaction    order by -- sorts data   



-- 6. Write an SQL query to find the secondary highest education, where duration is more than 150. 
-- The query should contain only married people, and then calculate the interest amount? (Formula interest => balance*15%). 

select education,duration,marital,balance, balance*1.15 as Interest_Amount from bank_data  -- Multiplied with 1.15(15%) to balance to get Interest amount
where education='secondary' and marital='married'
having duration>150;


-- END OF PROJECT











