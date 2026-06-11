{{ config(
    materialized='table'
) }}

with user_pref as (

    select
        user_id,
        genre,
        genre_rank
    from {{ ref('int_user_genre_affinity') }}
    where genre_rank <= 2   -- top 2 preferences

),

top_movies as (

    select
        m.movie_id,
        m.title,
        g.genre,
        m.avg_rating,
        m.total_ratings,
        m.rating_segment,
        m.release_decade,

        -- scoring function 
        (
            m.avg_rating * 0.6 +
            ln(1 + m.total_ratings) * 0.3 +
            case when m.days_since_last_rating <= 30 then 1 else 0 end * 0.1
        ) as recommendation_score

    from {{ ref('int_movie_performance') }} m

    join {{ ref('bridge_movie_genres') }} g
        on m.movie_id = g.movie_id

    where g.genre != '(no genres listed)'

),

user_seen as (

    select distinct user_id, movie_id
    from {{ ref('fct_ratings') }}

),

candidate_pool as (

    select
        u.user_id,
        t.movie_id,
        t.title,
        t.genre,
        t.avg_rating,
        t.total_ratings,
        t.rating_segment,
        t.recommendation_score

    from user_pref u

    join top_movies t
        on u.genre = t.genre

    left join user_seen s
        on u.user_id = s.user_id
        and t.movie_id = s.movie_id

    where s.movie_id is null   -- exclude watched movies

),

final_ranked as (

    select
        *,
        row_number() over (
            partition by user_id
            order by recommendation_score desc
        ) as recommendation_rank

    from candidate_pool

)

select
    user_id,
    movie_id,
    title,
    genre,
    avg_rating,
    total_ratings,
    recommendation_score,
    recommendation_rank

from final_ranked

where recommendation_rank <= 10

