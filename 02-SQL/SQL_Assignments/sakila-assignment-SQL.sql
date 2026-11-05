USE sakila;

SELECT * from actor;

SELECT * From customer;

-- 1. Get all customers whose first name starts with 'J' and who are active.-- 
SELECT * FROM customer
WHERE first_name LIKE 'J%' AND active = '1';

-- 2. Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
SELECT * from film
WHERE title LIKE '%ACTION%' OR description LIKE '%WAR%';

-- 3. List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
SELECT * from customer
WHERE last_name!='SMITH' AND first_name LIKE '%a';

-- 4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
SELECT * from film
WHERE rental_rate>3.0 AND replacement_cost IS NOT NULL;

-- 5. Count how many customers exist in each store who have active status = 1.
 SELECT count(customer_id), store_id
 FROM customer
 WHERE active= 1
 GROUP BY store_id; 
 
 -- 6. Show distinct film ratings available in the film table.
 SELECT DISTINCT rating
 FROM film;
 
 -- 7. Find the number of films for each rental duration where the average length is more than 100 minutes.
 SELECT rental_duration, COUNT(film_id), AVG(Length) AS avg_length
 FROM film
 GROUP BY rental_duration
 HAVING avg_length > 100;
 
 -- DATE CONCEPT --
 -- 8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
 SELECT DATE(payment_date), sum(amount), count(*) as total_payments
 FROM payment
 GROUP BY DATE(payment_date)
 HAVING count(*) > 100;

-- 9. Find customers whose email address is null or ends with '.org'.
SELECT first_name, last_name, email
FROM customer
WHERE email is NULL OR email LIKE '%.org';

-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
SELECT film_id, title, rental_rate, rating
FROM film
WHERE rating='PG' OR rating='G'
ORDER BY rental_rate desc;


-- was confused on this question too
-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
SELECT length, count(film_id) as film_count
FROM film
WHERE title LIKE 'T%'
GROUP BY length
HAVING count(film_id) >5;

-- 12. List all actors who have appeared in more than 10 films.
Select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as film_num
From actor a 
Join film_actor fa
ON fa.actor_id = a.actor_id
group by a.actor_id, a.first_name, a.last_name
Having count(fa.film_id)>10;


-- 13. Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.
Select film_id, title, rental_rate, length
From film
Order by rental_rate desc, length desc
Limit 5;




-- 14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.
Select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as rental_count
From customer c
join rental r
on r.customer_id=c.customer_id
group by c.customer_id, c.first_name, c.last_name
order by count(r.rental_id) desc;


---------------------------------
-- 15. List the film titles that have never been rented.
Select f.title
From film f Join inventory i
on f.film_id=i.film_id
Where i.store_id is NULL;
 
-- This is the concept of doing JOINS inside Joins meaning using multiple join in a single query
------------------ 




