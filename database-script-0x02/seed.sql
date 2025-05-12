-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', 'hashed_password1', '0712345678', 'guest', CURRENT_TIMESTAMP),
(2, 'Bob', 'Smith', 'bob@example.com', 'hashed_password2', '0723456789', 'host', CURRENT_TIMESTAMP),
(3, 'Carol', 'Mwangi', 'carol@example.com', 'hashed_password3', '0734567890', 'guest', CURRENT_TIMESTAMP);

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
(1, 2, 'Ocean View Apartment', 'A beautiful apartment facing the beach.', 'Mombasa', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 2, 'Mountain Cabin', 'Cozy cabin with a fireplace and mountain views.', 'Naivasha', 90.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(1, 1, 1, '2025-06-01', '2025-06-04', 360.00, 'confirmed', CURRENT_TIMESTAMP),
(2, 2, 3, '2025-07-10', '2025-07-15', 450.00, 'pending', CURRENT_TIMESTAMP);

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(1, 1, 360.00, CURRENT_TIMESTAMP, 'credit_card'),
(2, 2, 450.00, CURRENT_TIMESTAMP, 'paypal');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
(1, 1, 1, 5, 'Fantastic location and clean home!', CURRENT_TIMESTAMP),
(2, 2, 3, 4, 'Nice getaway spot but a bit remote.', CURRENT_TIMESTAMP);

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
(1, 1, 2, 'Is the Ocean View Apartment available in June?', CURRENT_TIMESTAMP),
(2, 3, 2, 'Hello Bob, I loved the cabin! Thanks again!', CURRENT_TIMESTAMP);
