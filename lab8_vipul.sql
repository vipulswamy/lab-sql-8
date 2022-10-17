/*
1. Write a query to display for each store its store ID, city, and country.
*/

SELECT ct.country, b.city, s.store_id FROM sakila.store as s
JOIN sakila.address as a
ON s.address_id = a.address_id
JOIN sakila.city as b
ON b.city_id = a.city_id
JOIN sakila.country as ct
ON ct.country_id = b.country_id;

/*
2. Write a query to display how much business, in dollars, each store brought in.
*/

Select s.store_id, count(p.amount) as total_amount from sakila.store as s
Join sakila.staff as st
on s.store_id = st.store_id
join sakila.payment as p
on st.staff_id = p.staff_id
Group by store_id;

/*
3. Which film categories are longest?
*/
SELECT c.name, avg(f.length) as avg_length from sakila.category as c 
JOIN sakila.film_category as fc
on fc.category_id = c.category_id
join sakila.film as f
on fc.film_id = f.film_id
Group by c.name;

/*
4. Display the most frequently rented movies in descending order.
*/
SELECT c.name, avg(f.length) as avg_length from sakila.category as c 
JOIN sakila.film_category as fc
on fc.category_id = c.category_id
join sakila.film as f
on fc.film_id = f.film_id
Group by c.name;
/*
5. List the top five genres in gross revenue in descending order.
*/
/*
6. Is "Academy Dinosaur" available for rent from Store 1?
*/

SELECT i.store_id, f.title, count(i.film_id) as existing
FROM sakila.film as f
JOIN sakila.inventory as i
ON f.film_id = i.film_id
JOIN sakila.rental as r
ON r.inventory_id = i.inventory_id
WHERE f.title LIKE "Academy Dinosaur" AND i.store_id = 1
ORDER BY f.title;

/*
7. Get all pairs of actors that worked together.
*/
SELECT f.title AS film_title,
concat(a1.first_name," ", a1.last_name) AS first_actor,
concat(a2.first_name," ", a2.last_name) AS second_actor
FROM sakila.film f
JOIN film_actor fa1
ON f.film_id=fa1.film_id
JOIN sakila.actor a1
ON fa1.actor_id=a1.actor_id
JOIN sakila.film_actor fa2
ON f.film_id=fa2.film_id
JOIN sakila.actor a2
ON fa2.actor_id=a2.actor_id
WHERE fa1.actor_id <> fa2.actor_id
ORDER BY f.film_id;
/*
8. Get all pairs of customers that have rented the same film more than 3 times.
*/
/*
9. For each film, list actor that has acted in more films.
*/
select fa.actor_id, f.title, a.last_name, count(fa.actor_id) as films_total
from sakila.film_actor as fa
join sakila.film as f
on f.film_id = fa.film_id
join sakila.actor as a
on fa.actor_id = a.actor_id
group by fa.actor_id
having films_total >= 1
order by films_total DESC;