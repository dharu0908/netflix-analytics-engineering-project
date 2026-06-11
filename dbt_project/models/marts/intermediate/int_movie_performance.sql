with movie_stats as (

    select
        r.movie_id,

        count(*) as total_ratings,
        count(distinct r.user_id) as unique_users,

        round(avg(r.rating), 2) as avg_rating,
        min(r.rating) as min_rating,
        max(r.rating) as max_rating,

        min(r.rated_at) as first_rating_date,
        max(r.rated_at) as last_rating_date,

        datediff(
            day,
            max(r.rated_at),
            current_date()
        ) as days_since_last_rating

    from {{ ref('fct_ratings') }} as r

    group by
        r.movie_id
    

),

final as (

    select
        m.movie_id,
        m.title,
        m.release_year,
        m.release_decade,

        s.total_ratings,
        s.unique_users,
        s.avg_rating,
        s.min_rating,
        s.max_rating,

        s.first_rating_date,
        s.last_rating_date,
        s.days_since_last_rating,

        {{ movie_ratings('s.avg_rating') }} as rating_segment

    from movie_stats as s

    inner join {{ ref('dim_movies') }} as m
        on s.movie_id = m.movie_id

)

select *
from final