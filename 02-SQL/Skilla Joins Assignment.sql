-- 1. List all customers along with the films they have rented.
Select c.customer_id, c.first_name, c.last_name, f.title
From customer c
JOIN rental r
on c.customer_id=r.customer_id
Join inventory i
on r.inventory_id=i.inventory_id
join film f
on i.film_id=f.film_id;


-- 2. List all customers and show their rental count, including those who haven't rented any films.
select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as rental_count
From customer c
LEFT JOIN rental r
on c.customer_id=r.customer_id
group by c.customer_id, c.first_name, c.last_name;

-- 3. Show all films along with their category. Include films that don't have a category assigned.
Select f.film_id, f.title, c.category_id, c.name as category_name
From film f 
Left Join film_category fc
on f.film_id=fc.film_id
Left Join category c
on c.category_id=fc.category_id;

-- 4. Show all customers and staff emails from both customer and staff tables using a full outer join (simulate using LEFT + RIGHT + UNION).
Select c.customer_id, c.email as customer_email, s.staff_id, s.email as staff_email
From customer c
Left Join staff s
on c.email=s.email 
Union
Select c.customer_id, c.email as customer_email, s.staff_id, s.email as staff_email
From customer c
right join staff s
on c.email=s.email;


-- 5. Find all actors who acted in the film "ACADEMY DINOSAUR".
Select a.actor_id, a.first_name, a.last_name
From actor a
Join film_actor fa
on a.actor_id=fa.actor_id
Join film f
on fa.film_id=f.film_id
Where f.title='ACADEMY DINOSAUR';


-- 6. List all stores and the total number of staff members working in each store, even if a store has no staff.
Select s.store_id, count(st.staff_id) as t_staff
From store s
Left Join staff st
on s.store_id=st.store_id
Group by s.store_id;

-- 7. List the customers who have rented films more than 5 times. Include their name and total rental count.
Select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as total_rental
From customer c
Join rental r
on c.customer_id=r.customer_id
group by c.customer_id, c.first_name, c.last_name
Having count(r.rental_id)>2
order by total_rental desc;


