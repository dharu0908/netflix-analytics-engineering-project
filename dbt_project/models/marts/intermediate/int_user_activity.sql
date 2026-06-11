with users as (

    select *
    from {{ ref('dim_users') }}

)

select
    user_id,

    first_rating_date,
    latest_rating_date,

    total_ratings,
    distinct_movies_rated,
    avg_ratings_given,

    user_lifetime_days,
    days_since_last_rating,

    round(
        total_ratings
        / nullif(user_lifetime_days, 0),
        2
    ) as ratings_per_day,

    {{ rating_segment('avg_ratings_given') }} as rating_segment,

    {{ user_activity_by_days('days_since_last_rating') }} as activity_status

from users