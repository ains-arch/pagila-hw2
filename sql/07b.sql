/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
LEFT JOIN customer c ON r.customer_id = c.customer_id
LEFT JOIN address a ON c.address_id = a.address_id
LEFT JOIN city ct ON a.city_id = ct.city_id
LEFT JOIN country cn ON ct.country_id = cn.country_id
WHERE f.film_id NOT IN (
    SELECT f2.film_id
    FROM film f2
    JOIN inventory i2 ON f2.film_id = i2.film_id
    JOIN rental r2 ON i2.inventory_id = r2.inventory_id
    JOIN customer c2 ON r2.customer_id = c2.customer_id
    JOIN address a2 ON c2.address_id = a2.address_id
    JOIN city ct2 ON a2.city_id = ct2.city_id
    JOIN country cn2 ON ct2.country_id = cn2.country_id
    WHERE cn2.country_id = 103
)
    AND i.film_id IS NOT NULL
ORDER BY f.title;
