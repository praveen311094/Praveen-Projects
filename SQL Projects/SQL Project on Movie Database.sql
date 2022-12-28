-- // Praveen SQL 2 Mandatory Assignment //


use moviedb;

-- 1. Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.

select * from actors;
select * from movie_cast;
select * from movie;

  SELECT 
    act_fname as actor_firstname,
    act_lname as actor_lastname,
    role   
  FROM 
    actors 
	inner join movie_cast ON actors.act_id=movie_cast.act_id -- As we have act_id common column
	inner join movie ON movie_cast.mov_id=movie.mov_id -- after joining actors and movie cast tables we got mov_id in result table so here used inner join with movie table
  where movie.mov_title='Annie Hall'; -- //condition where movie title is Annie Hall//


-- 2. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
--    Return director first name, last name and movie title.

select * from director;
select * from movie_direction;
select * from movie_cast;
select * from movie;

select 
   dir_fname as 'director first name', 
   dir_lname as 'director last name', 
   mov_title as 'movie title'
from 
   director
   join movie_direction on director.dir_id = movie_direction.dir_id
   join movie_cast on movie_direction.mov_id = movie_cast.mov_id 
   join movie on movie_cast.mov_id = movie.mov_id
where mov_title='Eyes wide shut'; -- where clause to satisfy condition

-- 3. Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.

SELECT 
   dir_fname as 'director first name', 
   dir_lname as 'director last name', 
   mov_title as 'movie title'
FROM  director 
inner JOIN movie_direction 
  ON director.dir_id=movie_direction.dir_id
inner JOIN movie 
  ON movie_direction.mov_id=movie.mov_id
inner JOIN movie_cast   -- Used inner join to join tables in sequence of director,movie direction,movie and movie cast using common columns
  ON movie_cast.mov_id=movie.mov_id
  WHERE role='Sean Maguire'; -- where clause to satisfy condition

-- 4. Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year. 

select * from actors;
select * from movie_cast;
select * from movie;

SELECT 
   act_fname as 'actor first name', 
   act_lname as 'actor last name', 
   mov_title as 'movie title', 
   mov_year as 'release year'
FROM actors
inner JOIN movie_cast 
ON actors.act_id = movie_cast.act_id
inner JOIN movie   -- Used inner join to join tables in sequence of actors,movie_cast and movie tables using common columns
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year not between 1990 and 2000; -- where clause to satisfy condition


-- 5. Write a SQL query to find the directors with the number of genres of movies. Group the result set on director first name, last name and generic title. 
-- Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres of movies.

select * from director;
select * from movie_direction;
select * from movie_genres;
select * from genres;

SELECT 
dir_fname as 'director first name', 
dir_lname as 'director last name',
gen_title, -- for better understanding used genre title column as well 
count(gen_title) as number_of_genres_movies
FROM director
inner join movie_direction on director.dir_id = movie_direction.dir_id
inner join movie_genres on movie_direction.mov_id = movie_genres.mov_id
inner join genres on movie_genres.gen_id = genres.gen_id 
GROUP BY dir_fname, dir_lname,gen_title -- Using group by for counting number of genres of movies
ORDER BY dir_fname,dir_lname desc;  -- Using order by for sorting by descending 

-- We can use Natural Join which works similar to inner join as below

SELECT dir_fname,dir_lname, gen_title,count(gen_title) as number_of_genres_movies
FROM director
NATURAL JOIN movie_direction 
NATURAL JOIN movie_genres
NATURAL JOIN genres  
GROUP BY dir_fname, dir_lname,gen_title -- Using group by for counting number of genres of movies 
ORDER BY dir_fname,dir_lname desc;  -- Using order by for sorting by descending 


-- 6. Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

select 
mov_title as 'movie title',
mov_year as 'movie year',
gen_title as 'generic title'
from 
  movie
inner join movie_genres on movie.mov_id = movie_genres.mov_id
inner join genres on movie_genres.gen_id = genres.gen_id; -- Used inner join to join tables in sequence of movie,movie genres and genres tables using common columns

-- 7. Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director. 

select * from movie;
select * from movie_direction;
select * from director;

select 
mov_title as 'movie title',
mov_year as 'release year',
mov_dt_rel as 'date of release',
mov_time as 'duration',
dir_fname as 'director first name',
dir_lname as 'director last name'
from movie
inner join movie_direction on movie.mov_id = movie_direction.mov_id
inner join director on movie_direction.dir_id = director.dir_id
where mov_dt_rel < '1989-01-01' and mov_dt_rel != '0000-00-00'  -- Used less than operator to check before dates and also we have few movie date releases dates as zero format's so excluded using not equal to operator
order by mov_dt_rel desc; -- descending order 
 

-- 8. Write a SQL query to compute the average time and count the number of movies for each genre. Return genre title, average time and the number of movies for each genre.

select * from genres;
select * from movie_genres;
select * from movie;

select 
   gen_title as 'genre title',
   avg(mov_time) as 'average time',
   count(gen_title) as 'number of movies for each genre' -- count the number of genre title
from genres 
inner join movie_genres on genres.gen_id = movie_genres.gen_id
inner join movie on movie_genres.mov_id = movie.mov_id
group by gen_title; -- group by used for aggregate function count


-- 9.Write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.

select * from movie;
select * from movie_direction;
select * from director;
select * from movie_cast;
select * from actors;

SELECT 
mov_title as 'movie title', 
mov_year as 'movie year', 
dir_fname as 'director first name', 
dir_lname as 'director last name', 
act_fname as 'actor first name', 
act_lname as 'actor last name', 
role 
FROM  movie
NATURAL JOIN movie_direction
NATURAL JOIN movie_cast
NATURAL JOIN director
NATURAL JOIN actors  -- Natural join is similar to inner join
WHERE mov_time=(SELECT MIN(mov_time) FROM movie); -- MIN keyword used to find lowest movie duration from movie table -- where clause to satisfy condition

-- //End of Assignment