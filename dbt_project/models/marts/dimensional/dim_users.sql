with src_rating as (

    select *
    from {{ ref('src_ratings') }}

)

select
    user_id,

    min(rated_at) as first_rating_date,

    max(rated_at) as latest_rating_date,

    count(*) as total_ratings,

    count(distinct movie_id) as distinct_movies_rated,

    round(avg(rating),2) as avg_ratings_given,

    datediff(
        day,
        max(rated_at),
        current_date()
    ) as days_since_last_rating,

    datediff(
        day,
        min(rated_at),
        max(rated_at)
    ) as user_lifetime_days

from src_rating
group by user_id