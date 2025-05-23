# Partitioning Performance Report

## Objective
Improve performance of date range queries on the large `bookings` table by partitioning it using Microsoft SQL Server’s partitioning features.

## Strategy
Used **partition function**, **partition scheme**, and **range partitioning** based on the `start_date` column:

- Partitioned by month-end dates for Q1 2024.
- All partitions mapped to the PRIMARY filegroup.

## Performance Result

We ran a query fetching records for February 2024:

```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2024-02-01' AND '2024-02-28';
