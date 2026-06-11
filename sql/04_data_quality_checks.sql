-- Check row counts across tables
SELECT 'movies' AS table_name, COUNT(*) FROM raw_movies
UNION ALL
SELECT 'ratings', COUNT(*) FROM raw_ratings
UNION ALL
SELECT 'tags', COUNT(*) FROM raw_tags
UNION ALL
SELECT 'links', COUNT(*) FROM raw_links
UNION ALL
SELECT 'genome_tags', COUNT(*) FROM raw_genome_tags
UNION ALL
SELECT 'genome_scores', COUNT(*) FROM raw_genome_scores;