
/*
1. What query would you run to get all the customers inside city_id = 312? Your query should returm customer
	first name, last name, email, and address.
*/

SELECT first_name, last_name, email, address.address, address2 from customer
LEFT JOIN address ON address.address_id = customer.address_id
WHERE city_id = 312;


/*    
2. What query would you run to get all comedy films? Your query would return film title, description, release year,
rating, special features and genre.
*/

SELECT title, description, release_year, rating, special_features, category.name as genre from film
LEFT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'comedy';

/*
3. What query would you run to get all the films joined by actor_id=5? Your query shoud return the film title,
description and release year.
*/

SELECT title, film.description, film.release_year from film
LEFT JOIN film_actor ON film_actor.film_id = film.film_id
WHERE actor_id = 5;

/*
4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)?
Your query should return customer first name, last name, email, and address.
*/

SELECT first_name, last_name, email, address.address, address.address2 from customer
LEFT JOIN address ON address.address_id = customer.address_id
LEFT JOIN store ON store.store_id = customer.store_id
WHERE customer.store_id = 1 AND (city_id = 1 OR city_id = 42 OR city_id = 312 OR city_id = 459);

/*
5. What query would you run to get all the films with a rating = G and special feature = behind the scenes, joined
by actor_id = 15? Your query shoud return the film title, description, release year, rate and special feature.
*/

SELECT title, description, release_year, rating, special_features FROM film
LEFT JOIN film_actor ON film_actor.film_id = film.film_id
LEFT JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE rating = 'G' AND actor.actor_id = '15'  AND film.special_features LIKE '%behind the scenes%';

/*
6. What query would you run to get all the actors that joined in the film_id = 369? Your query should return the
first_name, last name and last_update of the actors.
*/

SELECT actor.first_name, actor.last_name, actor.last_update FROM actor
LEFT JOIN film_actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.film_id = 369;

/*
7. What query would you run to get all drama films with a rental rate of 2.99 ? Your query should return film title,
description, release year, rating, special features and genre.
*/

SELECT title, description, release_year, rating, special_features, category.name AS genre FROM film
LEFT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'drama' AND rental_rate = 2.99;

/*
8. What query would you run to get all the action films joined by SANDRA KILMER. Your query should return film
title, description, release year, rating, special features, genre and actor's first name and last name.

*/

SELECT title, description, release_year, rating, special_features,category.name AS genre, concat(actor.first_name,' ', actor.last_name) AS actor_name  FROM film
LEFT JOIN film_actor ON film_actor.film_id = film.film_id
LEFT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
LEFT JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name = 'SANDRA' AND actor.last_name = 'KILMER' AND category.name = 'action';
