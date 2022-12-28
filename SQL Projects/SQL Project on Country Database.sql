-------------------------------- GUIDED PROJECT ON COUNTRY DATABASE ------------------------------------

-- 1. Get the list of the 3 most populated cities.

select * from cities;

select name, population from cities
group by name
order by population desc limit 3;

-- (OR)

SELECT * 
FROM `cities` 
ORDER BY `population` DESC 
LIMIT 3;

-- 2. Get the list of the 3 cities with the smallest surface.


select name, surface from cities
order by surface limit 3;

SELECT * 
FROM `cities` 
ORDER BY `surface` ASC 
LIMIT 3;

-- 3. Get the list of states whose department number starts with “97”.

select * from states;

select state_code,state_name from states
where state_code like '97%';

-- 4. Get the names of the 3 most populated cities, as well as the name of the associated state.

select * from cities;
select * from states;

select name,population,state_name from cities 
left join states on cities.city_state=states.state_code
group by name
order by population desc limit 3;

-- (OR)

select name,population,state_name from cities 
left join states on cities.city_state=states.state_code
group by name
order by population limit 3;	

-- 5. Get the list of the name of each State, associated with its code and the number of cities within these States, 
-- by sorting in order to get in priority the States which have the largest number of cities.


select state_code, state_name, count(cities.city_state) as cities_included from states,cities
where cities.city_state=states.state_code
group by state_code
order by cities_included desc;

-- (OR)

SELECT state_name, city_state, COUNT(*) AS nbr_items 
FROM `cities` 
LEFT JOIN states ON state_code = city_state
GROUP BY city_state
ORDER BY `nbr_items` DESC;

select * from cities;
select * from states;

-- 6. Get the list of the 3 largest States, in terms of surface area.

SELECT state_name, city_state, SUM(`surface`) AS state_surface 
FROM `cities` 
LEFT JOIN states ON state_code = city_state
GROUP BY city_state
ORDER BY state_surface DESC
LIMIT 3;

-- (OR)

select state_name, SUM(`surface`) AS state_surface from states left join
cities on state_code=city_state
GROUP BY city_state
order by state_surface desc limit 3;

select * from cities;
select * from states;

-- 7. Count the number of cities whose names begin with “San”.

select count(name) as cities from cities where name like 'San%';


-- 8. Get the list of cities whose surface is greater than the average surface.

select Avg(surface) as avg_surf from cities;

select * from cities;

select name from cities where surface > (select Avg(surface) from cities);

-- 9. Get the list of States with more than 1 million residents.

select name, sum(population) from cities
group by city_state
having sum(population)>1000000;

-- 10. Replace the dashes with a blank space, for all cities beginning with “SAN-” (inside the column containing the upper case names).

update cities
set name = replace(name, "-"," ")
where name like "SAN-%";
