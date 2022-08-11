--Q1

SELECT *
FROM customer;

SELECT *
FROM address
WHERE district LIKE 'Texas';


SELECT c.first_name, c.last_name, a.district
FROM customer c
JOIN address a 
ON a.address_id = c.address_id
WHERE district LIKE 'Texas';
--answer: see table

--Q2
SELECT*
FROM payment;

SELECT*
FROM customer;

SELECT c.first_name, c.last_name, p.amount, count(amount)
FROM customer c
JOIN payment p
ON c.customer_id = p.customer_id 
WHERE amount > 6.99
GROUP BY c.first_name, c.last_name, p.amount;
--Answer: see table

--Q3
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) > 175;


SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);

--Answer: see table

--Q4
SELECT *
FROM city;

SELECT * 
FROM country c;

SELECT *
FROM customer;

SELECT *
FROM address;

SELECT cust.first_name
FROM customer cust
JOIN address a 
ON cust.address_id = a.address_id;

SELECT country
FROM country 
JOIN city
ON city.country_id = country.country_id
WHERE country LIKE 'Argentina';

SELECT cust.first_name, cust.last_name, country
FROM customer cust
JOIN address a 
ON cust.address_id = a.address_id 
JOIN city
ON city.city_id = a.city_id 
JOIN country 
ON country.country_id = city.country_id 
WHERE country LIKE 'Argentina'
GROUP BY cust.first_name, cust,last_name, country;
-- answer: 13 people, see chart

-- Q5
SELECT *
FROM film_category;

SELECT *
FROM film;

SELECT category_id , count(film.film_id)
FROM film
JOIN film_category 
ON film.film_id = film_category.film_id 
GROUP BY category_id
ORDER BY count(film.film_id) DESC
LIMIT 1;
--answer: 74, sports

--Q6
SELECT *
FROM film_actor;
SELECT *
FROM film;

SELECT fa.film_id, title, description, count(actor_id)
FROM film_actor fa
JOIN film
ON fa.film_id = film.film_id
GROUP BY fa.film_id, title, description
ORDER BY count(actor_id) desc;
--answer: Lambs cincinatti has 15 actors in it

--Q7
SELECT  a.first_name, a.last_name, count(film_id)
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY count(film_id);
--answer: emily dee in 14 films

--Q8
SELECT *
FROM city;
SELECT *
FROM country;

SELECT country, count(city_id)
FROM country
JOIN city
ON country.country_id = city.country_id 
GROUP BY country
ORDER BY count(city_id) DESC
LIMIT 1;
--answer: india has 60 cities

--Q9
SELECT *
FROM actor;
SELECT *
FROM film_actor;


SELECT  a.first_name, a.last_name, count(film_id)
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name
HAVING count(film_id) BETWEEN 23 AND 26
ORDER BY count(film_id);
-- answer: 55 actors between 23 and 26. see chart


