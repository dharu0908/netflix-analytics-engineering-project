  With src_movies as (
    Select * from {{ref('src_movies')}}
  )

 SELECT
    movie_id,
    TRIM(value) AS genre
FROM src_movies,
TABLE(SPLIT_TO_TABLE(genres, '|'))