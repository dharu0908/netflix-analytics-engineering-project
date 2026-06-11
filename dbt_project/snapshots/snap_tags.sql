{% snapshot snap_tags %}


{{

    config (
        target_schema='snapshots',
        unique_key=['user_id','movie_id','tag'],
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalid_hard_deletes=True
    )
}}


Select 
{{dbt_utils.generate_surrogate_key(['user_id','movie_id','tag'])}} as raw_key,
user_id,
movie_id,
tag,
CAST(tagged_at as TIMESTAMP_NTZ) AS tag_timestamp
from
{{ref('src_tags')}}
LIMIT 100

{% endsnapshot %}