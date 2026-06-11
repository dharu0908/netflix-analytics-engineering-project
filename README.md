# 🎬 Netflix Analytics Engineering Platform

## Overview

An end-to-end Analytics Engineering project built using AWS S3, Snowflake, dbt, SQL, and Power BI.

This platform transforms the MovieLens dataset into a modern analytics solution using dimensional modeling, dbt transformations, data quality testing, snapshots, reusable macros, and interactive dashboards.

The project answers business questions around user engagement, movie performance, genre analytics, and recommendation insights.

---

# 🚀 Architecture

The platform follows a modern analytics engineering architecture:

MovieLens Dataset → AWS S3 → Snowflake → dbt → Analytics Marts → Power BI

![Architecture](docs/architecture.png)

---

# 🛠 Technology Stack

| Layer | Technology |
|---------|------------|
| Storage | AWS S3 |
| Data Warehouse | Snowflake |
| Transformation | dbt |
| Analytics Engineering | SQL |
| Visualization | Power BI |
| Version Control | Git & GitHub |

---

# 📊 Dataset

MovieLens 20M Dataset

### Source Files

- movies.csv
- ratings.csv
- tags.csv
- links.csv
- genome-tags.csv
- genome-scores.csv

### Dataset Statistics

- 20M+ Ratings
- 465K+ Tags
- 27K+ Movies
- 138K+ Users

---

# 🌐 dbt Lineage

The transformation layer was built using dbt and follows a layered architecture:

- Sources
- Staging Models
- Intermediate Models
- Fact Tables
- Dimension Tables
- Analytics Marts
- Snapshots

![dbt Lineage](docs/dbt_lineage.png)

---

# ⭐ Data Model

The warehouse follows a dimensional modeling approach.

### Fact Tables

- fct_ratings
- fct_tags

### Dimension Tables

- dim_users
- dim_movies
- dim_genome_tags

### Bridge Table

- bridge_movie_genres

The bridge table resolves the many-to-many relationship between movies and genres.

![Star Schema](docs/star_schema.png)

---

# 🏗 Data Pipeline

## Raw Layer

- raw_movies
- raw_ratings
- raw_tags
- raw_links
- raw_genome_tags
- raw_genome_scores

## Staging Layer

- src_movies
- src_ratings
- src_tags
- src_links
- src_genome_tags
- src_genome_scores

## Intermediate Layer

- int_movie_performance
- int_user_activity
- int_user_genre_affinity
- int_genre_performance

## Dimensions

- dim_movies
- dim_users
- dim_genome_tags

## Facts

- fct_ratings
- fct_tags

## Analytics Marts

- mart_movie_analytics
- mart_user_analytics
- mart_genre_analytics
- mart_recommendation

---

# ❓ Business Questions Solved

## User Analytics

- Who are the most active users?
- How often do users rate movies?
- What genres does each user prefer?
- Which users are becoming inactive?

## Movie Analytics

- Which movies are most popular?
- Which movies have the highest ratings?
- Which movies are trending?
- Which decades produce the strongest movie performance?

## Genre Analytics

- Which genres receive the highest ratings?
- Which genres drive the most engagement?
- Which genres attract the largest audiences?

## Recommendation Analytics

- What movie should be recommended next?
- Which users have similar tastes?

---

# 📈 Dashboard Showcase

## Executive Dashboard

Provides a high-level overview of platform performance.

KPIs:

- Total Users
- Total Movies
- Total Ratings
- Average Ratings Per User

Insights:

- Movie Rating Distribution
- Highest Rated Genres
- User Activity Distribution
- Movie Catalog Distribution by Decade

![Executive Dashboard](power_bi/screenshots/executive_dashboard.png)

---

## Movie Analytics Dashboard

Answers:

- Which movies are most popular?
- Which movies have the highest ratings?
- Which movies are trending?

![Movie Dashboard](power_bi/screenshots/movie_dashboard.png)

---

## User Analytics Dashboard

Answers:

- Who are the most active users?
- Which users are becoming inactive?
- How long do users remain engaged?

![User Dashboard](power_bi/screenshots/user_dashboard.png)

---

## Genre Analytics Dashboard

Answers:

- Which genres perform best?
- Which genres drive engagement?

![Genre Dashboard](power_bi/screenshots/genre_dashboard.png)

---

# 🔍 Technical Highlights

## Data Engineering

- AWS S3 ingestion layer
- Snowflake cloud warehouse
- External stages and COPY commands

## Analytics Engineering

- Layered dbt architecture
- Sources
- Staging models
- Intermediate models
- Fact and dimension modeling
- Analytics marts

## Data Quality

- 60+ dbt tests
- Relationship validation
- Accepted values checks
- Null handling

## Historical Tracking

- dbt snapshots
- User activity tracking
- Movie performance tracking

## Business Intelligence

- Executive reporting
- User analytics
- Movie analytics
- Genre analytics
- Recommendation analytics

---

# 💡 Key Design Decisions

### Genre Bridge Table

Implemented a bridge table to correctly model the many-to-many relationship between movies and genres.

### Trending Score

Created a custom trending score combining movie popularity and rating quality.

### Analytics Marts

Built domain-specific marts to separate business logic from reporting logic.

### Layered dbt Architecture

Implemented staging, intermediate, fact, dimension, and mart layers to improve maintainability and scalability.

---

# 📁 Repository Structure

```text
netflix-analytics-engineering-platform/
│
├── README.md
│
├── docs/
│   ├── architecture.png
│   ├── dbt_lineage.png
│   └── star_schema.png
│
├── powerbi/
│   ├── Netflix_Analytics.pbix
│   └── screenshots/
│       ├── executive_dashboard.png
│       ├── movie_dashboard.png
│       ├── user_dashboard.png
│       └── genre_dashboard.png
│
├── dbt_project/
│   ├── models/
│   ├── macros/
│   ├── snapshots/
│   ├── tests/
│   └── dbt_project.yml
│
└── sql/
    └── snowflake_ingestion.sql
```

---

# 🚀 Future Enhancements

- GitHub Actions CI/CD
- Snowflake Tasks & Streams
- Real-Time Data Ingestion
- Recommendation Engine Enhancements
- Data Freshness Monitoring

---

# 📚 Skills Demonstrated

- Analytics Engineering
- Snowflake
- AWS S3
- dbt
- SQL
- Data Modeling
- Data Quality Testing
- Snapshots
- Power BI
- Business Intelligence
