{{
    config(
        materialized='incremental',
        unique_key='tag_event_key'
    )
}}

with src_tags as (

    select *
    from {{ ref('src_tags') }}

)

select

    {{ dbt_utils.generate_surrogate_key(
        ['user_id','movie_id','tag','tagged_at']
    ) }} as tag_event_key,

    user_id,
    movie_id,

    initcap(trim(tag)) as tag_name,

    tagged_at,

    cast(tagged_at as date) as tag_date,

    current_timestamp() as loaded_at

from src_tags

{% if is_incremental() %}

where tagged_at >
(
    select coalesce(max(tagged_at), '1900-01-01'::timestamp)
    from {{ this }}
)

{% endif %}