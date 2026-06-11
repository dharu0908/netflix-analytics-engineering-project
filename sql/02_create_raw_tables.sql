-- RAW MOVIES TABLE
CREATE OR REPLACE TABLE raw_movies (
    movieId INTEGER,
    title STRING,
    genres STRING
);

-- RAW RATINGS TABLE
CREATE OR REPLACE TABLE raw_ratings (
    userId INTEGER,
    movieId INTEGER,
    rating FLOAT,
    timestamp INTEGER
);

-- RAW TAGS TABLE
CREATE OR REPLACE TABLE raw_tags (
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp INTEGER
);

-- RAW LINKS TABLE
CREATE OR REPLACE TABLE raw_links (
    movieId INTEGER,
    imdbId INTEGER,
    tmdbId INTEGER
);

-- RAW GENOME TAGS
CREATE OR REPLACE TABLE raw_genome_tags (
    tagId INTEGER,
    tag STRING
);

-- RAW GENOME SCORES
CREATE OR REPLACE TABLE raw_genome_scores (
    movieId INTEGER,
    tagId INTEGER,
    relevance FLOAT
);