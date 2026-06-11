with raw_tags as (

select *
from {{ source('movielens', 'tags') }}
)

Select 
userId as user_id,
movieId as movie_id,
tag as tag, 
TO_TIMESTAMP_LTZ(timestamp) as tagged_at
from raw_tags 