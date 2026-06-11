{% snapshot snap_user_activity %}

{{
    config(
        target_schema='snapshots',
        unique_key='user_id',
        strategy='check',
        check_cols=[
            'total_ratings',
            'avg_rating_given',
            'user_lifetime_days',
            'days_since_last_rating',
            'activity_status'
        ],
        invalid_hard_deletes=True
    )
}}

select
    user_id,
    total_ratings,
    avg_rating_given,
    user_lifetime_days,
    days_since_last_rating,
    activity_status

from {{ ref('int_user_activity') }}

{% endsnapshot %}