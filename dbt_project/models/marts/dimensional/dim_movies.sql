with base as (

    select
        s.*,
        l.imdb_id,
        l.tmdb_id,

        trim(
            regexp_replace(s.title, '\\s*\\(\\d{4}\\)', '')
        ) as title_clean,

        regexp_substr(s.title, '\\((\\d{4})\\)', 1, 1, 'e', 1)::number as release_year

    from {{ ref('src_movies') }} s
    left join {{ ref('src_links') }} l
        on s.movie_id = l.movie_id

)

select
    {{ dbt_utils.generate_surrogate_key(['movie_id']) }} as movie_key,
    movie_id,
    title_clean as title,
    release_year,
    floor(release_year / 10) * 10 as release_decade,
    genres,
    imdb_id,
    tmdb_id,

    case when genres like '%Action%' then 1 else 0 end as is_action,
    case when genres like '%Comedy%' then 1 else 0 end as is_comedy,
    case when genres like '%Crime%' then 1 else 0 end as is_crime,
    case when genres like '%Drama%' then 1 else 0 end as is_drama,
    case when genres like '%Adventure%' then 1 else 0 end as is_adventure

from base