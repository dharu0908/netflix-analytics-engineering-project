with genome_scores as 
(
    select *
from {{ source('movielens', 'genome_scores') }}
)

Select 
movieId as movie_id,
tagId as tag_id,
relevance
from genome_scores
