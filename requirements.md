# Database Schema for Airbnb Clone

## 1. User
- `user_id` (PK)
- `username`
- `email`
- `password_hash`
- `first_name`
- `last_name`
- `phone_number`
- `created_at`
- `updated_at`

## 2. Property
- `property_id` (PK)
- `host_id` (FK → User.user_id)
- `name`
- `description`
- `location`
- `pricepernight`
- `created_at`
- `updated_at`

## 3. Booking
- `booking_id` (PK)
- `property_id` (FK → Property.property_id)
- `user_id` (FK → User.user_id)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`
