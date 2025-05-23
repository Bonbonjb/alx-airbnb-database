# Optimization Report

## Objective

Optimize a query that retrieves booking, user, property, and payment details to improve performance.

---

## Original Query

```sql
SELECT b.id, u.id, u.name, p.id, p.name, pay.id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
