-- SQL Mandatory Project

-- Create Database grosvenor  -- To create Database


-- use grosvenor  -- To use the schema

-- create a table named hotel

create table hotel(hotel_no char(10) primary key,

 name varchar(20),

 address varchar(20)

 )engine=innodb;

-- insert values into hotel table

insert into hotel values('ht01', 'Grosvenor', 'London');
insert into hotel values('ht02', 'Grosvenor2', 'Liverpool');

SET GLOBAL FOREIGN_KEY_CHECKS=0; -- You can disable foreign key checks globally

SET FOREIGN_KEY_CHECKS=0;  -- is useful when you need to re-create the tables and load data in any parent-child order

-- create a table named room

create table room(

room_no numeric(3),

hotel_no varchar(10),

type varchar(10),

price decimal(5,2),

primary key (room_no, hotel_no),

foreign key (hotel_no) REFERENCES hotel(hotel_no)

)engine=innodb;--  InnoDB storage engine also provides the feature to use foreign keys that help in maintaining the consistency and integrity in MySQL databases.

-- insert values into hotel table

insert into room values(101, 'ht02', 'single', 40);

insert into room values(105, 'ht01', 'double', 75);

insert into room values(107, 'ht02', 'double', 60);

insert into room values(109, 'ht01', 'single', 40);

insert into room values(110, 'ht02', 'family', 100);

insert into room values(106, 'ht02', 'single', 40);

insert into room values(104, 'ht02', 'double', 60);

insert into room values(103, 'ht01', 'single', 40);

insert into room values(102, 'ht02', 'double', 60);

insert into room values(108, 'ht01', 'family', 90);



-- create a table named guest

create table guest(

guest_no numeric(5),

name varchar(20),

address varchar(50),

primary key (guest_no)

)engine=innodb;

-- insert values into guest table

insert into guest values(10001, 'Guest1', 'London');

insert into guest values(10002, 'Guest2', 'London');

insert into guest values(10003, 'Guest3', 'Liverpool');

insert into guest values(10004, 'Guest4', 'London');

insert into guest values(10005, 'Guest5', 'Liverpool');

insert into guest values(10006, 'Guest6', 'London');

insert into guest values(10007, 'Guest7', 'Liverpool');

insert into guest values(10008, 'Guest8', 'Liverpool');

insert into guest values(10009, 'Guest9', 'London');

insert into guest values(10010, 'Guest10', 'Liverpool');

-- create a table named booking

create table booking(

hotel_no varchar(10),

guest_no numeric(5),

date_from date,

date_to date,

room_no numeric(5),

primary key (hotel_no, guest_no, date_from),

foreign key (room_no, hotel_no) REFERENCES room(room_no, hotel_no),

foreign key (guest_no) REFERENCES guest(guest_no)

)engine=innodb;

-- insert values into booking table

insert into booking values('ht01', 10001, '2022-06-01', '2022-06-01', 101);
insert into booking values('ht01', 10002, '2022-06-01', '2022-06-06', 102);
insert into booking values('ht01', 10003, '2022-06-02', '2022-06-05', 103);
insert into booking values('ht01', 10004, '2022-06-03', '2022-06-04', 104);
insert into booking values('ht01', 10005, '2022-06-01', '2022-06-01', 105);
insert into booking values('ht01', 10006, '2022-06-01', '2022-06-02', 106);
insert into booking values('ht01', 10007, '2022-06-01', null, 107);
insert into booking values('ht01', 10008, '2022-06-04', '2022-06-04', 108);
insert into booking values('ht01', 10009, '2022-06-03', '2022-06-05', 109);
insert into booking values('ht01', 10010, '2022-06-05', '2022-06-06', 110);
insert into booking values('ht01', 10001, '2022-06-05', '2022-06-07', 101);
insert into booking values('ht01', 10002, '2022-06-07', '2022-06-08', 102);
insert into booking values('ht01', 10003, '2022-06-10', null, 103);
insert into booking values('ht01', 10004, '2022-06-10', '2022-06-11', 104);
insert into booking values('ht01', 10005, '2022-06-12', '2022-06-12', 105);
insert into booking values('ht01', 10006, '2022-06-10', '2022-06-12', 106);
insert into booking values('ht01', 10007, '2022-06-12', '2022-06-12', 107);
insert into booking values('ht01', 10008, '2022-06-13', null, 108);
insert into booking values('ht01', 10009, '2022-06-14', '2022-06-14', 109);
insert into booking values('ht01', 10010, '2022-06-13', '2022-06-14', 110);
insert into booking values('ht01', 10006, '2022-06-12', '2022-06-14', 106);
insert into booking values('ht01', 10007, '2022-06-10', '2022-06-14', 107);
insert into booking values('ht01', 10008, '2022-06-11', '2022-06-14', 108);
insert into booking values('ht01', 10009, '2022-06-10', '2022-06-15', 109);
insert into booking values('ht01', 10010, '2022-06-12', '2022-06-15', 110);
insert into booking values('ht02', 10001, '2022-06-13', null, 101);
insert into booking values('ht02', 10002, '2022-06-14', '2022-06-15', 102);
insert into booking values('ht02', 10003, '2022-06-14', '2022-06-17', 103);
insert into booking values('ht02', 10004, '2022-06-15', '2022-06-18', 104);
insert into booking values('ht02', 10005, '2022-06-15', '2022-06-20', 105);
insert into booking values('ht02', 10006, '2022-06-15', '2022-06-19', 106);
insert into booking values('ht02', 10007, '2022-06-17', '2022-06-18', 107);
insert into booking values('ht02', 10008, '2022-06-16', '2022-06-17', 108);
insert into booking values('ht02', 10009, '2022-06-17', '2022-06-18', 109);
insert into booking values('ht02', 10010, '2022-06-18', '2022-06-19', 110);
insert into booking values('ht02', 10001, '2022-06-19', null, 101);
insert into booking values('ht02', 10002, '2022-06-18', '2022-06-20', 102);
insert into booking values('ht02', 10003, '2022-06-18', '2022-06-20', 103);
insert into booking values('ht02', 10004, '2022-06-20', '2022-06-21', 104);
insert into booking values('ht02', 10005, '2022-06-21', '2022-06-22', 105);
insert into booking values('ht02', 10006, '2022-06-22', '2022-06-23', 106);
insert into booking values('ht02', 10007, '2022-06-23', '2022-06-24', 107);
insert into booking values('ht02', 10008, '2022-06-24', '2022-06-26', 108);
insert into booking values('ht02', 10009, '2022-06-25', '2022-06-26', 109);
insert into booking values('ht02', 10010, '2022-06-26', '2022-06-27', 110);
insert into booking values('ht02', 10006, '2022-06-27', '2022-06-29', 106);
insert into booking values('ht02', 10007, '2022-06-28', '2022-06-30', 107);
insert into booking values('ht02', 10008, '2022-07-01', '2022-07-02', 108);
insert into booking values('ht02', 10009, '2022-07-02', '2022-07-02', 109);
insert into booking values('ht02', 10010, '2022-07-03', '2022-07-03', 110);

-- use grosvenor;

-- Updating the table

SET SQL_SAFE_UPDATES=0;  -- to disable safe mode

UPDATE room SET price = price*1.05;

create table booking_old(

hotel_no varchar(10),

guest_no numeric(5),

date_from date,

date_to date,

room_no numeric(5),

primary key (hotel_no, guest_no, date_from),

foreign key (room_no, hotel_no) REFERENCES room(room_no, hotel_no),

foreign key (guest_no) REFERENCES guest(guest_no)

)engine=innodb;

-- insert values into booking_old table from booking table

INSERT INTO booking_old (SELECT * FROM booking WHERE date_to < '2022-06-30');

select * from booking_old;

DELETE FROM booking WHERE date_to < '2022-06-30';

select * from booking;

select * from room;
select * from hotel;
select * from guest;
select * from booking;

-- Simple Queries

-- 1. List full details of all hotels.

select * from hotel; -- To get all details from hotel table


-- 2. List full details of all hotels in London.

SELECT * FROM hotel WHERE address = 'london'; 

-- 3. List the names and addresses of all guests in London, alphabetically ordered by name.


SELECT name as Guest_name, address

 FROM guest

 WHERE address = 'london' 

ORDER BY name; -- TO get result on column name so using order by 


-- 4. List all double or family rooms with a price below £110.00 per night, in ascending order of price.

select * 
from room 
where price < 110 and type in('double','family')  -- IN operator allows you to specify multiple values in a WHERE clause
order by price;



-- 5. List the bookings for which no date_to has been specified.

select *
from booking
where date_to is null; -- is null shows null values in table



-- Aggregate Functions

-- 1. How many hotels are there?

select count(hotel_no) as hotels from hotel;

-- 2. What is the average price of a room?

select avg(price) from room; 

-- 3. What is the total revenue per night from all double rooms?

select * from room;

select sum(price) as total_revenue from room where type = 'double';

-- 4. How many different guests have made bookings for June?

select * from booking;


SELECT COUNT(DISTINCT guest_no) as Different_Guests -- COUNT () returns the number of records returned by a select query and distinct which returns unique values

 FROM booking;
 
 
--  Subqueries and Joins

-- 1. List the price and type of all rooms at the Grosvenor Hotel.

select * from room;

select price,type 
from room
where hotel_no = (select hotel_no from hotel where name = 'grosvenor');  -- Using sub-query to get hotel_no

-- 2. List all guests currently staying at the Grosvenor Hotel.

select * from booking;
select * from hotel;
select * from guest;

SELECT * FROM guest
WHERE guest_no = (SELECT guest_no FROM booking 
WHERE date_from <= CURRENT_DATE and date_to >= CURRENT_DATE -- we can use any date in place of current date which gives relevant output
AND hotel_no = (SELECT hotel_no FROM hotel WHERE name = 'Grosvenor'));


select current_date; -- it returns current date

-- 3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, 
-- if the room is occupied.

SELECT r.* FROM room r 
LEFT JOIN  
(SELECT g.name, h.hotel_no, b.room_no FROM Guest g, Booking b, Hotel h -- taking multiple tables at once 

WHERE g.guest_no = b.guest_no AND b.hotel_no = h.hotel_no AND 

h.name= 'Grosvenor' AND -- Using And operator to use multiple conditions in order to check

b.date_from <= CURRENT_DATE AND b.date_to >= CURRENT_DATE) AS k

ON r.hotel_no = k.hotel_no AND r.room_no = k.room_no;


-- 4. What is the total income from bookings for the Grosvenor Hotel today?

SELECT SUM(price) FROM booking b, room r, hotel h

WHERE (b.date_from <= CURRENT_DATE AND

b.date_to >= CURRENT_DATE) AND

r.hotel_no = h.hotel_no AND r.room_no = b.room_no AND name = 'Grosvenor';

-- 5. List the rooms that are currently unoccupied at the Grosvenor Hotel.

SELECT * FROM room r

WHERE room_no NOT IN

(SELECT room_no FROM booking b, hotel h

WHERE (date_from <= CURRENT_DATE AND

date_to >= CURRENT_DATE) AND

b.hotel_no = h.hotel_no AND name = 'Grosvenor');

-- 6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?

SELECT SUM(price) FROM room r  -- Using sum function for getting total price

WHERE room_no NOT IN  -- MySQL NOT IN() makes sure that the expression proceeded does not have any of the values present in the arguments.

(SELECT room_no FROM booking b, hotel h

WHERE (date_from <= CURRENT_DATE AND

date_to >= CURRENT_DATE) AND

b.hotel_no = h.hotel_no AND name = 'Grosvenor');

-- Grouping

-- 1. List the number of rooms in each hotel.

select * from room;

SELECT hotel_no, COUNT(room_no) AS count FROM room  -- The AS statement is used to create a table from an existing table

GROUP BY hotel_no;

-- 2. List the number of rooms in each hotel in London.

SELECT hotel.hotel_no, COUNT(room_no)

 AS count FROM hotel, room

WHERE room.hotel_no = hotel.hotel_no

 AND address = 'london'

GROUP BY hotel_no;

-- 3. What is the average number of bookings for each hotel in June?

SELECT AVG(N) AS Average FROM

 (SELECT hotel_no, COUNT(hotel_no) AS N

FROM booking b

 WHERE (b.date_from >= '2022-06-01' AND b.date_from <= '2022-06-30')

GROUP BY hotel_no) as G;

-- Using between operator

select * from booking;

SELECT AVG(N) AS Average FROM

 (SELECT hotel_no, COUNT(hotel_no) AS N

FROM booking b

 WHERE date_from between '2022-06-01' and '2022-06-30'

GROUP BY hotel_no) as G;

-- 4. What is the most commonly booked room type for each hotel in London?

SELECT MAX(R) AS Most_Common  -- using MAX operator for most common types of room booked

FROM (SELECT type AS R

FROM booking b, hotel h, room r

WHERE r.room_no = b.room_no AND b.hotel_no = h.hotel_no AND

h.address = 'london'

GROUP BY type) AS G;

-- 5. What is the lost income from unoccupied rooms at each hotel today?

SELECT hotel_no, SUM(price) FROM room r

WHERE room_no NOT IN

(SELECT room_no FROM booking b, hotel h

WHERE (date_from <= CURRENT_DATE AND

date_to >= CURRENT_DATE) AND

b.hotel_no = h.hotel_no)

GROUP BY hotel_no;


-- Get the top 3 costliest single rooms and double rooms in a single query

-- or result set

select * from room;

(select * from room where type IN('single') 
order by price desc limit 1,3 )
union
(select * from room where type IN('double')
order by price desc
limit 1,3);

(select * from room
where type IN ('single')
ORDER BY PRICE DESC LIMIT 0,3 )
UNION
(select * from room
where type IN ('double')
ORDER BY PRICE DESC LIMIT 0,3) ;




