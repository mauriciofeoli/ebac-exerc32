-- Filmes e categorias
SELECT
    f.film_id,
    f.title,
    c.category_id,
    c.name AS category_name
FROM film AS f
INNER JOIN film_category AS fc ON fc.film_id = f.film_id
INNER JOIN category AS c ON c.category_id = fc.category_id
ORDER BY f.title, c.name;

-- Quantidade de filmes por ator
SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS quantidade_filmes
FROM actor AS a
LEFT JOIN film_actor AS fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY quantidade_filmes DESC, a.last_name, a.first_name;

-- Atores em filmes com mais de 120 minutos
SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(DISTINCT f.film_id) AS quantidade_filmes
FROM actor AS a
INNER JOIN film_actor AS fa ON fa.actor_id = a.actor_id
INNER JOIN film AS f ON f.film_id = fa.film_id
WHERE f.length > 120
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY quantidade_filmes DESC, a.last_name, a.first_name;
