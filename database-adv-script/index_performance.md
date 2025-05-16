# Index Performance Analysis

The document outlines the performance impact of adding indexes to high-usage columns in the `users`, `bookings`, and `properties` tables.

## Before Adding Indexes

You can run the following query to retrieve bookings for a specific user:

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 5;




