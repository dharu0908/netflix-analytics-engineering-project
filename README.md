# Netflix Analytics Engineering Platform

## Overview

Streaming platforms generate millions of user interactions every day, but raw ratings and tagging data provide limited business value without proper modeling and transformation.

This project transforms the MovieLens 20M dataset into a modern Analytics Engineering platform using AWS S3, Snowflake, dbt, Power BI, and GitHub Actions.

The solution follows industry-standard analytics engineering practices including dimensional modeling, incremental processing, snapshots, data quality testing, analytics marts, and CI/CD automation.

The platform enables stakeholders to:

- Analyze movie performance
- Understand user engagement patterns
- Track genre trends
- Support recommendation strategies
- Deliver self-service analytics through curated marts and dashboards

---

## Business Problem

Streaming platforms collect millions of ratings, tags, and movie interactions.

However, raw transactional datasets make it difficult to answer business questions such as:

- Which movies perform best?
- Which genres drive the most engagement?
- Who are the most active users?
- What genres does each user prefer?
- Which users are becoming inactive?
- What movies should be recommended next?

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

### Bridge Table

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

### Intermediate Layer

- int_movie_performance
- int_user_activity
- int_user_genre_affinity
- int_genre_performance

### Fact Layer

- fct_ratings
- fct_tags

### Dimension Layer

- dim_movies
- dim_users
- dim_genome_tags

### Analytics Mart Layer

- mart_movie_analytics
- mart_user_analytics
- mart_genre_analytics
- mart_recommendation

![dbt Lineage](docs/dbt_lineage.png)

---

## Data Quality Framework

The project includes a comprehensive data quality framework implemented using dbt tests.

### Validation Checks

- Unique key validation
- Not null validation
- Relationship testing
- Accepted values testing
- Referential integrity checks

### Coverage

- 60+ dbt tests
- Fact table validation
- Dimension table validation
- Bridge table validation
- Analytics mart validation

This ensures analytical consistency across all reporting layers.

---

## Incremental Processing

The ratings fact table is implemented as an incremental model.

Benefits include:

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
- Recommendation tracking

Benefits:

- Historical auditability
- Trend analysis
- Slowly changing dimension support

---

## Analytics Marts

Business-ready marts were created to support self-service analytics.

### Movie Analytics

Answers:

- Which movies perform best?
- Which movies are trending?
- Which decades produce the strongest movie performance?

### User Analytics

Answers:

- Who are the most active users?
- How frequently do users rate movies?
- Which users are becoming inactive?

### Genre Analytics

Answers:

- Which genres drive engagement?
- Which genres receive the highest ratings?
- Which genres attract the largest audiences?

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

![Movie Dashboard](power_bi/screenshots/movie_dashboard.png)

### User Analytics Dashboard

![User Dashboard](power_bi/screenshots/user_dashboard.png)

### Genre Analytics Dashboard

![Genre Dashboard](power_bi/screenshots/genre_dashboard.png)

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

- Drama and Comedy drive the highest engagement.
- Niche genres attract fewer users but achieve higher average ratings.
- Genre preferences provide strong signals for recommendation systems.

### Recommendation Analytics

- Users with similar genre preferences can be grouped together.
- Historical ratings and tagging behavior improve recommendation quality.
- Recommendation marts simplify downstream recommendation workflows.

---

## Technical Highlights

### Data Engineering

- AWS S3 ingestion layer
- Snowflake external stages
- COPY INTO ingestion
- Incremental loading

### Analytics Engineering

- Layered dbt architecture
- Source models
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
- Relationship testing
- Snapshot auditing

### DevOps & Automation

- GitHub Actions CI/CD pipeline
- Automated project validation
- Repository structure verification
- Continuous integration checks

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

## Project Structure

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
│   └── star_schema_simple.png
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
