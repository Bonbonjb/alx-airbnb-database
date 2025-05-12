# Normalization of Airbnb Clone Database Design

## Objective
This document outlines the normalization steps taken to achieve **Third Normal Form (3NF)** for the Airbnb clone database to ensure data integrity, efficiency, and scalability.

## Step 1: First Normal Form (1NF)
- Ensured atomic values for all attributes (no repeating groups or arrays).
- Each row has a unique identifier (primary key).

## Step 2: Second Normal Form (2NF)
- Ensured compliance with **1NF**.
- Eliminated partial dependencies (non-key attributes depend on the entire composite key, not just part of it).

## Step 3: Third Normal Form (3NF)
- Ensured compliance with **2NF**.
- Eliminated transitive dependencies (non-key attributes do not depend on other non-key attributes).

### Review of Tables:
1. **User Table**: No non-key dependencies on other non-key attributes (3NF).
2. **Property Table**: No transitive dependencies (3NF).
3. **Booking Table**: Attributes depend only on the primary key (3NF).
4. **Payment Table**: No transitive dependencies (3NF).
5. **Review Table**: Non-key attributes depend on the primary key (3NF).
6. **Message Table**: No non-key dependencies on other non-key attributes (3NF).

## Conclusion
The database schema is now normalized to **3NF**, ensuring no redundancies and improved data integrity.
