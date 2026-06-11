with movie_genres as (
Select * from {{ref('src_movies')}}
)

SELECT
    movie_id,
    TRIM(value) AS genre
FROM movie_genres,
LATERAL SPLIT_TO_TABLE(genres, '|')