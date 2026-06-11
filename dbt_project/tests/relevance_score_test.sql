Select 
movie_id,
tag_id,
relevance_score

from {{ref('fct_genome_scores')}}
where relevance_score<=0