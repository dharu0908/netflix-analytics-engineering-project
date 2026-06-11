with raw_genome_tags as 
(
    select *
from {{ source('movielens', 'genome_tags') }}
)

Select 
tagId as tag_id,
tag
from raw_genome_tags