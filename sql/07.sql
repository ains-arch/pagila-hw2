/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */
SELECT title
FROM film
WHERE film_id NOT IN (
    SELECT DISTINCT f.film_id
    FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    LEFT JOIN customer c ON r.customer_id = c.customer_id
    LEFT JOIN address a ON c.address_id = a.address_id
    LEFT JOIN city ct ON a.city_id = ct.city_id
    LEFT JOIN country cn ON ct.country_id = cn.country_id
    WHERE cn.country = 'United States' OR i.film_id IS NULL
)
ORDER BY title;
