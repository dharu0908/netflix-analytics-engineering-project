WITH raw_ratings as (
select *
from {{ source('movielens', 'ratings') }} 
)

SELECT 
userId as user_id,
movieId as movie_id,
rating,
TO_TIMESTAMP_LTZ(timestamp) as rated_at
from raw_ratings
