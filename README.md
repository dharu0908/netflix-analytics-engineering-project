# Netflix Analytics Engineering Platform

## Overview

This project transforms the MovieLens 20M dataset into a modern Analytics Engineering platform using AWS S3, Snowflake, dbt, SQL, Power BI, and GitHub Actions.

The platform converts raw movie ratings and user interactions into business-ready datasets that support movie analytics, user analytics, genre analysis, and recommendation-ready reporting.

---

## Architecture

```text
MovieLens Dataset
        │
        ▼
AWS S3
        │
        ▼
Snowflake
        │
        ▼
dbt
        │
        ▼
Fact & Dimension Models
        │
        ▼
Analytics Marts
        │
        ▼
Power BI Dashboards
```

---

## Technology Stack

| Layer | Technology |
|---------|------------|
| Storage | AWS S3 |
| Data Warehouse | Snowflake |
| Transformation | dbt |
| Analytics Engineering | SQL |
| Visualization | Power BI |
| Data Quality | dbt Tests |
| Historical Tracking | dbt Snapshots |
| CI/CD | GitHub Actions |
| Version Control | Git & GitHub |

---

## Dataset

MovieLens 20M Dataset

- 20M+ Ratings
- 465K+ Tags
- 27K+ Movies
- 138K+ Users

---

## Data Model

### Fact Tables

- fct_ratings
- fct_tags

### Dimension Tables

- dim_movies
- dim_users
- dim_genome_tags

### Bridge Table

- bridge_movie_genres

The bridge table enables accurate genre-level analytics by resolving the many-to-many relationship between movies and genres.

![Star Schema](docs/star_schema_simple.png)

---

## dbt Pipeline

### Sources

- src_movies
- src_ratings
- src_tags
- src_links

### Intermediate Models

- int_movie_performance
- int_user_activity
- int_user_genre_affinity
- int_genre_performance

### Analytics Marts

- mart_movie_analytics
- mart_user_analytics
- mart_genre_analytics
- mart_recommendation

![dbt Lineage](docs/dbt_lineage.png)

---

## Key Features

### Incremental Processing

Implemented incremental loading in `fct_ratings` to process only new ratings.

### Data Quality

Implemented 60+ dbt tests including:

- Unique tests
- Not null tests
- Relationship tests
- Accepted values tests

### Historical Tracking

Implemented dbt snapshots:

- snap_movie_performance
- snap_tags
- snap_user_activity

### CI/CD

Implemented GitHub Actions to automatically validate the dbt project on every push and pull request.

---

## Business Questions Answered

### Movie Analytics

- Which movies perform best?
- Which movies are trending?
- Which decades perform best?

### User Analytics

- Who are the most active users?
- Which users are becoming inactive?

### Genre Analytics

- Which genres drive engagement?
- Which genres receive the highest ratings?

### Recommendation Analytics

- User genre affinity analysis
- Similar audience identification
- Recommendation-ready datasets

---

## Dashboard Showcase

### Executive Dashboard

![Executive Dashboard](power_bi/screenshots/executive_dashboard.png)

### Movie Analytics Dashboard

![Movie Dashboard](power_bi/screenshots/movie_dashboard.png)

### User Analytics Dashboard

![User Dashboard](power_bi/screenshots/user_dashboard.png)

### Genre Analytics Dashboard

![Genre Dashboard](power_bi/screenshots/genre_dashboard.png)

---

## Project Outcomes

- Built an end-to-end Analytics Engineering platform using AWS S3, Snowflake, dbt, and Power BI.
- Processed over 20 million movie ratings and interactions.
- Implemented dimensional modeling using fact, dimension, and bridge tables.
- Developed incremental pipelines and historical snapshots.
- Created business-ready analytics marts.
- Automated validation using dbt tests and GitHub Actions.

---

## Skills Demonstrated

- Analytics Engineering
- Snowflake
- AWS S3
- dbt
- SQL
- Data Modeling
- Incremental ELT
- Data Quality Testing
- Snapshots
- Power BI
- GitHub Actions
