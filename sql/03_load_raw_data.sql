-- Load Movies
COPY INTO raw_movies
FROM @netflix_stage/movies.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1);

-- Load Ratings
COPY INTO raw_ratings
FROM @netflix_stage/ratings.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1);

-- Load Tags
COPY INTO raw_tags
FROM @netflix_stage/tags.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1);

-- Load Links
COPY INTO raw_links
FROM @netflix_stage/links.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1);

-- Load Genome Tags
COPY INTO raw_genome_tags
FROM @netflix_stage/genome-tags.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1);

-- Load Genome Scores
COPY INTO raw_genome_scores
FROM @netflix_stage/genome-scores.csv
FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE';