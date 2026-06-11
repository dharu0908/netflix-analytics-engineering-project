-- Create schema for raw data
CREATE SCHEMA IF NOT EXISTS MOVIELENS.RAW;

USE SCHEMA MOVIELENS.RAW;

-- Create external stage pointing to S3 bucket
CREATE OR REPLACE STAGE netflix_stage
URL = 's3://netflixdataset-dharu0908'
FILE_FORMAT = (
    TYPE = CSV
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);