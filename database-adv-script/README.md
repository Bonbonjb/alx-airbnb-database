# Advanced SQL Join Queries

This file contains SQL queries that demonstrate mastery of various SQL join types. The queries operate on an "Airbnb style" relational database with tables such as `users`, `bookings`, `properties`, and `reviews`.

## Files

- **joins_queries.sql**: Contains the following join queries:
  - `INNER JOIN`: Retrieves bookings and the corresponding user.
  - `LEFT JOIN`: Retrieves all properties and any associated reviews (including those without reviews).
  - `FULL OUTER JOIN`: Retrieves all users and all bookings, even if some are unmatched.

## Technologies
- SQL (PostgreSQL / MySQL compatible with modification)
- Concepts covered: JOINs, NULL handling, UNION

## Usage

You can run the queries using a SQL client connected to your "Airbnb style" database.

```bash
mysql -u your_user -p < joins_queries.sql
