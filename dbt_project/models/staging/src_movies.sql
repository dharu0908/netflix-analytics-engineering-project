with raw_movies as (
    select *
from {{ source('movielens', 'movies') }}
)

Select 
movieId as movie_id,
title,
genres
from raw_movies