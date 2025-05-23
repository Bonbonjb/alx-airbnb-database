-- Initial unoptimized query with WHERE clause to simulate realistic filtering
EXPLAIN
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    pay.status = 'completed' AND p.city = 'Nairobi';

-- Sample query to view data after EXPLAIN
SELECT * FROM bookings;

-- Re-run the query with the same WHERE clause (no EXPLAIN)
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    pay.status = 'completed' AND p.city = 'Nairobi';

-- Create indexes to optimize performance
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_payment_booking_id ON payments(booking_id);
CREATE INDEX idx_payment_status ON payments(status);
CREATE INDEX idx_property_city ON properties(city);

-- Optimized version with reduced columns and same filter
EXPLAIN
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    pay.status = 'completed' AND p.city = 'Nairobi';


