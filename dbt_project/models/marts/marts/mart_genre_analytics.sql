{{ config(
    materialized='table'
) }}

with base as (

    select *
    from {{ ref('int_genre_performance') }}

),

enriched as (

    select

        genre,

        avg_rating,
        total_ratings,
        distinct_users,
        distinct_movies,

        pct_total_ratings,
        pct_total_users,
        genre_rating_segment,

        -- engagement score (custom business metric)
        (
            total_ratings * 0.5 +
            distinct_users * 0.3 +
            avg_rating * 20 * 0.2
        ) as engagement_score,

        -- ranking by engagement
        dense_rank() over (
            order by
                total_ratings desc,
                avg_rating desc
        ) as popularity_rank,

        dense_rank() over (
            order by avg_rating desc,
                     total_ratings desc
        ) as quality_rank

    from base

)

select *
from enriched