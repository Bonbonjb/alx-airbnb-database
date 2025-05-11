# ER Diagram - Airbnb Clone Database

## Objective
This document outlines the entity-relationship (ER) design for the Airbnb clone database, following normalization principles and production-level standards.

## Entities and Relationships

### 1. User
- `user_id` (PK)
- `first_name`
- `last_name`
- `email` (UNIQUE)
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at`

### 2. Property
- `property_id` (PK)
- `host_id` (FK → User.user_id)
- `name`
- `description`
- `location`
- `pricepernight`
- `created_at`
- `updated_at`

### 3. Booking
- `booking_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

### 4. Payment
- `payment_id` (PK)
- `booking_id` (FK → Booking.booking_id)
- `amount`
- `payment_date`
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 5. Review
- `review_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `rating` (INTEGER, 1-5)
- `comment`
- `created_at`

### 6. Message
- `message_id` (PK)
- `sender_id` (FK → User.user_id)
- `recipient_id` (FK → User.user_id)
- `message_body`
- `sent_at`

## Relationships Summary

- A **User** can own multiple **Properties** (1:N).
- A **User** can book multiple **Properties** (1:N).
- A **Property** can have multiple **Bookings** (1:N).
- A **Booking** is linked to one **Payment** (1:1).
- A **User** can review multiple **Properties** (1:N).
- A **Property** can have multiple **Reviews** (1:N).
- A **User** can send and receive multiple **Messages** (1:N).

## ER Diagram
See the corresponding ERD image:  
 `ERD/airbnb-erd-diagram.png`



