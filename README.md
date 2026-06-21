# Netflix Analytics Engineering Platform

## Overview

Streaming platforms generate millions of user interactions every day, but raw ratings and tagging data provide limited business value without proper modeling and transformation.

This project transforms the MovieLens 20M dataset into a modern Analytics Engineering platform using AWS S3, Snowflake, dbt, Power BI, and GitHub Actions.

The solution follows industry-standard analytics engineering practices, including dimensional modeling, incremental processing, snapshots, data quality testing, analytics marts, and CI/CD automation.

The platform enables stakeholders to:

- Analyze movie performance
- Understand user engagement patterns
- Track genre trends
- Support recommendation strategies
- Deliver self-service analytics through curated marts and dashboards

---

## Business Problem

A streaming platform generates millions of ratings, tags, and movie interactions.

However, raw transactional data makes it difficult to answer business questions such as:

- Which movies perform best?
- Which genres drive engagement?
- Who are the most active users?
- What genres does each user prefer?
- Which movies should be recommended next?
- How has user behavior changed over time?

This project solves these challenges by building a scalable analytics platform that transforms raw interaction data into business-ready dimensional models and analytics marts.

---

## Dataset

### MovieLens 20M Dataset

| Metric | Value |
|----------|----------|
| Movies | 27,278 |
| Users | 138,493 |
| Ratings | 20,000,263 |
| Tags | 465,564 |
| Genome Tags | 1,128 |
| Genome Scores | 11M+ |

### Source Files

- movies.csv
- ratings.csv
- tags.csv
- links.csv
- genome-tags.csv
- genome-scores.csv

---

## Solution Architecture

The platform follows a modern Analytics Engineering architecture.

```text
MovieLens Dataset
        │
        ▼
AWS S3 Bucket
        │
        ▼
Snowflake External Stage
        │
        ▼
RAW Tables
        │
        ▼
dbt Sources
        │
        ▼
dbt Staging Models
        │
        ▼
dbt Intermediate Models
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

## Data Model

The warehouse follows a dimensional modeling approach.

### Fact Tables

- fct_ratings
- fct_tags

### Dimension Tables

- dim_movies
- dim_users
- dim_genome_tags

### Bridge Tables

- bridge_movie_genres

The bridge table resolves the many-to-many relationship between movies and genres and enables accurate genre-level analytics.

![Star Schema](docs/star_schema_simple.png)

---

## dbt Lineage

The transformation layer follows a layered dbt architecture.

### Source Layer

- src_movies
- src_ratings
- src_tags
- src_links
- src_genome_tags
- src_genome_scores

### Staging Layer

- Standardized source data
- Type casting
- Data cleansing
- Column renaming

### Intermediate Layer

- int_movie_performance
- int_user_activity
- int_user_genre_affinity
- int_genre_performance

### Dimensional Layer

- dim_movies
- dim_users
- dim_genome_tags

### Fact Layer

- fct_ratings
- fct_tags

### Analytics Mart Layer

- mart_movie_analytics
- mart_user_analytics
- mart_genre_analytics
- mart_recommendation

![dbt Lineage](docs/dbt_lineage.png)

---

## Data Quality Framework

The project includes a comprehensive data quality layer implemented through dbt tests.

### Validation Checks

- Unique key validation
- Null validation
- Relationship testing
- Accepted values testing
- Referential integrity checks

### Coverage

- 60+ dbt tests
- Fact table validation
- Dimension table validation
- Bridge table validation
- Mart validation

This ensures analytical consistency across all reporting layers.

---

## Incremental Processing

The ratings fact table is implemented as an incremental model.

Benefits:

- Faster pipeline execution
- Reduced Snowflake compute costs
- Scalable processing of new ratings
- Production-ready ELT design

Example:

```sql
{% if is_incremental() %}

where rating_timestamp >
(
    select max(rating_timestamp)
    from {{ this }}
)

{% endif %}
```

---

## Historical Tracking

Historical changes are tracked using dbt Snapshots.

### Snapshot Coverage

- User activity history
- Tag history
- Recommendation behavior

Benefits:

- Historical auditability
- Trend analysis
- Slowly changing dimension support

---

## Analytics Marts

Business-ready marts were created for self-service analytics.

### Movie Analytics

Answers:

- Which movies perform best?
- Which movies are trending?
- Which release decades perform best?

---

### User Analytics

Answers:

- Who are the most active users?
- How frequently do users rate movies?
- Which users are becoming inactive?

---

### Genre Analytics

Answers:

- Which genres drive engagement?
- Which genres receive the highest ratings?
- Which genres attract the largest audiences?

---

### Recommendation Analytics

Answers:

- What movie should be recommended next?
- Which users have similar preferences?
- Which genres should be prioritized?

---

## Dashboard Showcase

### Executive Dashboard

![Executive Dashboard](power_bi/screenshots/executive_dashboard.png)

### Movie Analytics Dashboard

![Movie Analytics](power_bi/screenshots/movie_dashboard.png)

### User Analytics Dashboard

![User Analytics](power_bi/screenshots/user_dashboard.png)

### Genre Analytics Dashboard

![Genre Analytics](power_bi/screenshots/genre_dashboard.png)

---

## Key Business Insights

### User Engagement

- A small percentage of users generate a large share of ratings.
- Long-tenured users interact with a broader range of genres.
- User activity gradually declines over time.

### Movie Performance

- Highly rated movies are not always the most popular.
- Trending score analysis helps identify movies balancing popularity and quality.
- Certain release decades consistently outperform others.

### Genre Analytics

- Drama and Comedy generate the highest engagement.
- Niche genres often receive higher average ratings.
- Genre preference patterns provide strong recommendation signals.

### Recommendation Analytics

- Users with similar genre affinity can be grouped together.
- Historical ratings and tagging behavior improve recommendation quality.
- Recommendation marts simplify downstream recommendation workflows.

---

## CI/CD Automation

GitHub Actions is used to automate dbt validation and testing.

### Automated Workflow

On every push and pull request:

- dbt deps
- dbt seed
- dbt run
- dbt test

Benefits:

- Continuous validation
- Automated quality checks
- Faster development cycles
- Reduced deployment risk

![GitHub Actions](docs/github_actions_success.png)

---

## Technical Highlights

### Data Engineering

- AWS S3 ingestion layer
- Snowflake external stages
- COPY INTO loading strategy
- Incremental processing

### Analytics Engineering

- Layered dbt architecture
- Sources
- Staging models
- Intermediate models
- Fact models
- Dimension models
- Analytics marts

### Data Modeling

- Star schema design
- Bridge table implementation
- Surrogate key generation
- Relationship modeling

### Data Quality

- 60+ dbt tests
- Automated validation
- CI/CD integration

### Reporting

- Power BI dashboards
- Executive reporting
- Self-service analytics

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

## Repository Structure

```text
netflix-analytics-engineering-platform/
│
├── models/
│   ├── staging/
│   ├── intermediate/
│   ├── dimensions/
│   ├── facts/
│   ├── bridge/
│   └── marts/
│
├── snapshots/
│
├── tests/
│
├── macros/
│
├── power_bi/
│   └── screenshots/
│
├── docs/
│   ├── dbt_lineage.png
│   ├── star_schema_simple.png
│   └── github_actions_success.png
│
├── .github/
│   └── workflows/
│
└── README.md
```

---

## Project Outcomes

This project demonstrates:

- End-to-end Analytics Engineering
- Cloud Data Warehousing using Snowflake
- Modern ELT development using dbt
- Dimensional Modeling
- Incremental Processing
- Data Quality Testing
- Historical Data Tracking
- Recommendation Analytics
- Dashboard Development
- CI/CD Automation using GitHub Actions

Most importantly, the platform transforms over 20 million user interactions into scalable, business-ready analytics that support reporting, user engagement analysis, genre performance analysis, and recommendation workflows.

---

## Skills Demonstrated

- Analytics Engineering
- Snowflake
- AWS S3
- dbt
- SQL
- Data Modeling
- Incremental ELT
- Dimensional Modeling
- Data Quality Testing
- Snapshots
- Power BI
- GitHub Actions
- Business Intelligence

---

## Dataset

MovieLens 20M Dataset

https://grouplens.org/datasets/movielens/20m/
