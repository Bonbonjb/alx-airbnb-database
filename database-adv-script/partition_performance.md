# Partitioning Performance Report

## Objective
Optimize query performance on the large `booking` table using PostgreSQL range partitioning on the `start_date` column.

## Implementation
Used native PostgreSQL partitioning with:
```sql
PARTITION BY RANGE (start_date)

