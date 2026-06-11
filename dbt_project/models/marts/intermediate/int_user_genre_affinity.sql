select

    r.user_id,

    g.genre,

    count(*) as total_ratings,

    round(avg(r.rating),2) as avg_rating,

    count(distinct r.movie_id) as movies_rated_in_genre,

    row_number() over (
        partition by r.user_id
        order by avg(r.rating) desc,
                 count(*) desc
    ) as genre_rank

from {{ ref('fct_ratings') }} r

join {{ ref('bridge_movie_genres') }} g
    on r.movie_id = g.movie_id

where g.genre != '(no genres listed)'

group by
    r.user_id,
    g.genre