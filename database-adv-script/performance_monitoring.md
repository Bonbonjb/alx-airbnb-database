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

