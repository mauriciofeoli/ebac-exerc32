-- Total de filmes e categorias
SELECT COUNT(*) AS total_records
FROM (
    SELECT f.film_id, c.category_id
    FROM film AS f
    INNER JOIN film_category AS fc ON fc.film_id = f.film_id
    INNER JOIN category AS c ON c.category_id = fc.category_id
) AS film_categories;

-- Total de atores
SELECT COUNT(*) AS total_records
FROM (
    SELECT a.actor_id
    FROM actor AS a
    LEFT JOIN film_actor AS fa ON fa.actor_id = a.actor_id
    GROUP BY a.actor_id
) AS actors_with_film_count;

-- Total de atores em filmes longos
SELECT COUNT(*) AS total_records
FROM (
    SELECT a.actor_id
    FROM actor AS a
    INNER JOIN film_actor AS fa ON fa.actor_id = a.actor_id
    INNER JOIN film AS f ON f.film_id = fa.film_id
    WHERE f.length > 120
    GROUP BY a.actor_id
) AS actors_in_long_films;
