with bridge_movie_genres as (
    Select * from {{ref('bridge_movie_genres')}}
),

fct_ratings as (
    Select * from {{ref('fct_ratings')}}
)


select
    genre,

    round(avg(r.rating), 2) as avg_rating,

    count(*) as total_ratings,
    count(distinct r.user_id) as distinct_users,
    count(distinct b.movie_id) as distinct_movies,

    round(
        count(*) * 100.0
        / (
            select count(*)
            from bridge_movie_genres b
            join fct_ratings r
                on b.movie_id = r.movie_id
            where b.genre != '(no genres listed)'
        ),
        2
    ) as pct_total_ratings,

    round(
        count(distinct r.user_id) * 100.0
        / (
            select count(distinct r.user_id)
            from bridge_movie_genres b
            join fct_ratings r
                on b.movie_id = r.movie_id
            where b.genre != '(no genres listed)'
        ),
        2
    ) as pct_total_users,
    case
    when avg_rating >= 4.0 then 'Excellent'
    when avg_rating >= 3.5 then 'Good'
    when avg_rating >= 3.0 then 'Average'
    else 'Poor'
end as genre_rating_segment

from bridge_movie_genres b

join fct_ratings r
    on b.movie_id = r.movie_id

where b.genre != '(no genres listed)'

group by
    genre