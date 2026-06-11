with raw_links as (
select *
from {{ source('movielens', 'links') }}
) 

Select 
movieId as movie_id,
imdbId as imdb_id,
tmdbId as tmdb_id
from raw_links