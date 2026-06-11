-- Check for null movie IDs
SELECT *
FROM raw_movies
WHERE movieId IS NULL;

-- Check invalid ratings
SELECT *
FROM raw_ratings
WHERE rating < 0 OR rating > 5;

-- Duplicate check example
SELECT movieId, COUNT(*)
FROM raw_movies
GROUP BY movieId
HAVING COUNT(*) > 1;