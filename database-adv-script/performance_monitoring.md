# Performance Monitoring Report

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments to improve efficiency.

---

## 1. Query Monitored

I selected a frequently used query that fetches confirmed bookings within a specific date range:

```sql
SELECT * FROM booking
WHERE start_date BETWEEN '2024-02-01' AND '2024-02-28'
  AND status = 'confirmed';


## 2. Tools Used
EXPLAIN ANALYZE to inspect the query execution plan.

Partitioning on start_date (implemented earlier).

Indexing strategy.

## 3. Bottlenecks Identified
The original query triggered a sequential scan on the entire booking table.

Due to lack of indexing on the filtering columns (status, start_date), performance degraded significantly on large datasets.

Partition pruning was not effective due to missing proper indexing.

## 4. Changes Implemented
- Partitioning
We partitioned the booking table by range on the start_date column to allow the database to skip scanning irrelevant partitions.

- Indexing
We created a composite index to support the WHERE clause:

```sql
CREATE INDEX idx_booking_status_start_date
ON booking (status, start_date);
