{{ config(materialized='table') }}
with user_base as (

    select *
    from {{ ref('int_user_activity') }}

),

user_genres as (

    select
        user_id,

        max(case when genre_rank = 1 then genre end) as first_choice_genre,

        max(case when genre_rank = 2 then genre end) as second_choice_genre

    from {{ ref('int_user_genre_affinity') }}

    where genre_rank in (1, 2)

    group by user_id

)

select

    u.user_id,

    u.total_ratings,
    u.distinct_movies_rated,
    u.avg_ratings_given,
    u.user_lifetime_days,
    u.days_since_last_rating,
    u.ratings_per_day,

    u.rating_segment,
    u.activity_status,

    g.first_choice_genre,
    g.second_choice_genre

from user_base u

left join user_genres g
    on u.user_id = g.user_id