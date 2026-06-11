{{ config(
    materialized='table'
) }}

with base as (

    select *
    from {{ ref('int_movie_performance') }}

),

ranked as (

    select

        movie_id,
        title,
        release_year,
        release_decade,

        total_ratings,
        unique_users,
        avg_rating,
        rating_segment,

        first_rating_date,
        last_rating_date,
        days_since_last_rating,

        
        dense_rank() over (
            order by total_ratings desc, avg_rating desc
        ) as popularity_rank,

       
        dense_rank() over (
            order by avg_rating desc, total_ratings desc
        ) as rating_rank,

       
        (
            total_ratings * 0.6 +
            avg_rating * 10 * 0.4
        ) as trending_score
    from base

)

select *
from ranked