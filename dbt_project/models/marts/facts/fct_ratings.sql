{{
    config(
        materialized='incremental',
        unique_key='rating_key'
    )
}}

with src_ratings as (

    select *
    from {{ ref('src_ratings') }}

)

select

    {{ dbt_utils.generate_surrogate_key(
        ['user_id', 'movie_id', 'rated_at']
    ) }} as rating_key,

    user_id,

    movie_id,

    rating,

    rated_at,

    cast(rated_at as date) as rating_date,

    extract(year from rated_at) as rating_year,

    extract(month from rated_at) as rating_month,

    current_timestamp() as loaded_at

from src_ratings

{% if is_incremental() %}

where rated_at >
(
    select coalesce(max(rated_at), '1900-01-01'::timestamp)
    from {{ this }}
)

{% endif %}