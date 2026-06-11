{% snapshot snap_movie_performance %}

{{
    config(
        target_schema='snapshots',
        unique_key='movie_id',
        strategy='check',
        check_cols=[
            'avg_rating',
            'total_ratings',
            'rating_segment'
        ],
        invalid_hard_deletes=True
    )
}}

select
    movie_id,
    avg_rating,
    total_ratings,
    rating_segment

from {{ ref('int_movie_performance') }}

{% endsnapshot %}