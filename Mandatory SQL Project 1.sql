USE mavenmovies;

SHOW tables;

-- Mandatory Project Questions

-- 1. Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names.

SELECT CONCAT(first_name,last_name) AS full_name, (LENGTH(CONCAT(first_name,last_name))) AS lengths FROM actor
LIMIT 10;

-- 2. List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.

SELECT CONCAT(first_name,' ',last_name) AS full_names ,LENGTH(CONCAT(first_name,' ',last_name)) AS length, awards FROM actor_award
WHERE awards = 'Oscar'; 

#OR#

SELECT CONCAT(first_name,' ',last_name) AS full_names ,LENGTH(CONCAT(first_name,' ',last_name)) AS length, awards FROM actor_award
WHERE awards LIKE '%Oscar%';

-- 3. Find the actors who have acted in the film ‘Frost Head.’

SELECT first_name,last_name,title FROM actor
INNER JOIN film_actor 
USING(actor_id)
INNER JOIN film
USING(film_id)
WHERE title = 'Frost Head';

-- 4. Pull all the films acted by the actor ‘Will Wilson’.

SELECT title ,first_name,last_name FROM actor
INNER JOIN film_actor 
USING(actor_id)
INNER JOIN film
USING(film_id)
WHERE first_name = 'Will' AND last_name = 'Wilson';

-- 5. Pull all the films which were rented and return them in the month of May.

SELECT title, return_date,rental_date FROM film
INNER JOIN inventory
USING(film_id)
INNER JOIN rental
USING(inventory_id)
WHERE EXTRACT(MONTH FROM return_date) = 5 AND MONTH(rental_date) = 5;

-- 6. Pull all the films with ‘Comedy’ category.

SELECT title,name FROM film
INNER JOIN film_category
USING(film_id)
INNER JOIN category
USING(category_id)
WHERE name = 'Comedy';



