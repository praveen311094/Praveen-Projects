-- You and your business partner were recently approached by another local business owner who is interested in purchasing your dvd rental store. 
-- He primarily owns restaurants so he has a lot of questions about your business. His offer seems generous, so you are going to answer them.



-- Use MySQL workbench to leverage your SQL skills to attract your potential acquirer’s questions. 
-- Each question will require you to write a multi-table SQL query and join at least two tables.



--  1. My partner and I want to come by each of the stores in person and meet the managers. 
-- Please send over the managers’ names at each store, with the full address of each property (street address, district, city, and country).

 -- address, city, country, store
 
 select * from staff;
 select * from address;
 select * from country;
 select * from city;
 
select first_name as manager_first_name,last_name as manager_last_name, address as street_address,district,city,country
from staff,address,city,country 
where staff.staff_id=address.address_id and city.country_id=country.country_id and address.city_id=city.city_id;

--  2. I would like to get a better understanding of all of the inventory that would come along with the business.
--  Please pull together a list of each inventory item you have stocked, including the 
--  store_id number, the inventory_id , the name of the film, the film’s rating, its rental rate and replacement cost.

select * from inventory;
select * from film;

select store_id,inventory_id, title as name_of_film, rating,rental_rate, replacement_cost
from film, inventory
where inventory.film_id=film.film_id;

--  3. From the same list of films you just pulled, please roll that data up and provide a summary level overview of your inventory. 
-- We would like to know how many inventory items you have with each rating at each store.

select * from film;
select * from inventory;
select * from store;

select store_id, rating, count(rating) as inventory_items
from film, inventory
where inventory.film_id=film.film_id
group by rating,store_id;

--  4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. 
-- We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store. 
-- We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.

select * from category;
select * from film_category;
select * from store;
select * from film;
select * from inventory;

select
	store_id,
    category.name as category,
    count(inventory.inventory_id) as films,
    avg(film.replacement_cost) as avg_replacement_cost,
    sum(film.replacement_cost) as total_replacement_cost
from inventory
	left join film on inventory.film_id = film.film_id
    left join film_category on film.film_id = film_category.film_id
    left join category on category.category_id = film_category.category_id
group by
	store_id,
	category.name
order by
	sum(film.replacement_cost) desc;
    

--  5. We want to make sure you folks have a good handle on who your customers are. 
-- Please provide a list of all customer names, which store they go to, whether or not they are currently active, 
-- and their full addresses street address, city, and country.


select * from customer;
select * from address;
select * from city;
select * from country;

select first_name,last_name,store_id,customer.active as status, address, city,country from customer
left join address on customer.address_id=address.address_id
left join city on address.city_id=city.city_id
left join country on city.country_id=country.country_id;

-- 6. We would like to understand how much your customers are spending with you, and also to know who your most valuable customers are. 
-- Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. 
-- It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.

select * from customer;
select * from payment;
select * from rental;

select first_name,last_name,count(rental.rental_id) as total_rentals,sum(payment.amount) as total_payment_amount from customer
left join rental on customer.customer_id = rental.customer_id
left join payment on rental.rental_id = payment.rental_id
group by first_name,last_name
order by total_payment_amount desc;

select first_name,last_name,count(rental.rental_id) as total_rentals,sum(payment.amount) as total_payment_amount from customer,payment,rental
where customer.customer_id = rental.customer_id and rental.rental_id = payment.rental_id
group by first_name,last_name
order by total_payment_amount desc;

--  7. Need seperate counts of inventory items held at each of your two stores.

select * from inventory;
select * from store;

Select store.store_id as store, count(inventory.inventory_id) as inventory_items from inventory
left join store on inventory.store_id=store.store_id
group by store.store_id;

select 
	store_id,
	count(inventory_id) as inventory_items
from inventory	
group by store_id;

-- 8. Need a count of active customers for each of your stores separately.

select * from customer;

select	
	store_id,
    count(customer_id) as active_customers
from customer
where active = 1
group by store_id;

-- 9. Like to understand the replacement cost of your film. Provide replacement cost for film that is least expensive
-- to replace, the most expensive to replace, and the average of all films you carry.

select * from film;

select min(replacement_cost) as least_exp, max(replacement_cost) as most_exp, avg(replacement_cost) as avg_exp from film;

-- 10. Provide average payment processed as well as the maximum payment you have processed.


select avg(amount) as avg_payment,max(amount) as max_payment from payment;

-- 11. Provide list of all customer identification values, with count of rentals they have made all-time,
--  with your highest volume customers at the top of the list.

select * from customer;
select * from rental;

select 
	customer_id,
    count(rental_id) as nuumber_of_rentals
from rental
group by customer_id
order by count(rental_id) desc;

select 
	customer_id,
    count(rental_id) as nuumber_of_rentals
from rental

-- 12. Pull a list of each inventory item you have stocked, including the store_id number, the inventory_id, 
-- name of the film, the film's rating, its rental rate and replacement cost

select * from film;
select * from inventory; 

select store_id, inventory_id, title, rating,rental_rate, replacement_cost from inventory
	left join film on inventory.film_id = film.film_id
    group by inventory_id;

select
	inventory.store_id,
    inventory.inventory_id,
    film.title,
    film.rating,
    film.rental_rate,
    film.replacement_cost
from inventory
	left join film on inventory.film_id = film.film_id;
    
    -- 13. Provide list of advisor and investor names in one table. Could you please note whether they are an investor 
    -- or an advisor, and for the investors, it would be good to include which company they work with 

select * from advisor;
select * from investor;

select 'first_name','last_name' as advisor,'first_name','last_name' as investor from
advisor,investor
group by advisor_id,investor_id;

select
	'investor' as type,
    first_name,
    last_name,
    company_name
from investor
union
select
		'advisor' as type,
        first_name,
        last_name,
        null
from advisor;


-- 14. We will need a list of all staff members, including their first and last names, email addresses, and the store identification number where they work. 

select first_name,last_name,email,store_id from staff;

-- 15. We will need separate counts of inventory items held at each of your two stores.

select store_id, count(inventory_id) as inventory_items from inventory group by store_id;

-- 16. We will need a count of active customers for each of your stores. Separately, please. 

select * from customer;

select store_id,count(customer_id) as active_cust from customer where active=1 group by store_id;

-- 17. In order to assess the liability of a data breach, we will need you to provide a count of all customer email addresses stored in the database. 

select count(email) from customer;

-- 18. We are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future. 
-- Please provide a count of unique film titles you have in inventory at each store and then provide a count of the unique categories of films you provide. 


select * from category;
select * from inventory;

select
	store_id,
	count(distinct film_id) as unique_films
from inventory
group by store_id; 

select 
	count(distinct name) as unique_categories
from category;  

-- 19. Please provide a list of all customer identification values, with a count of rentals they have made all-time, with your highest volume of customers at the top of the list.

select * from customer;
select * from rental;

	select customer_id,count(rental_id) as rentals from rental 
	group by customer_id
	order by count(rental_id) desc;



-- 20. Do we have actors in the actor table that share the full name and if yes display those shared names.(***************)

select * from actor;

select actor_id from actor;

SELECT COUNT(DISTINCT first_name || last_name)
From actor;

SELECT DISTINCT a1.first_name , a1.last_name
FROM actor a1 JOIN actor a2
ON a1.actor_id <> a2.actor_id AND a1.first_name = a2.first_name AND a1.last_name = a2.last_name;


-- 21. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.

select * from payment;

select customer_id, sum(amount) from payment
where staff_id = 2
group by customer_id
having sum(amount)>=110;

-- 22. How many films begin with the letter J?

select * from film;

select count(title) as films from film
where title like 'J%';

-- 23. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

select first_name,last_name,customer_id from customer
where first_name like 'E%' and address_id < 500
order by customer_id desc limit 1;

-- 24. How many films have the word Truman somewhere in the title?

select count(title) from film
where title like "%Truman%";

-- 25. Display the total amount paid by all customers in the payment table.

select * from payment;

select sum(amount) from payment;

-- 26. Display the total amount paid by each customer in the payment table.

select customer_id, sum(amount) from payment
group by customer_id;

-- 27. What is the highest total_payment done?

select customer_id, sum(amount) as total_payment from payment
group by customer_id
order by total_payment desc limit 1;

-- 28. Which customers have not rented any movies so far

select * from customer;
select * from rental;

select customer_id, first_name, last_name from customer where
customer_id not in(select distinct customer_id from rental);

-- 29. How many payment transactions were greater than $5.00?

select count(amount) from payment
where amount>5;

--END OF PROJECT--
