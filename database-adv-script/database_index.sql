-- 1. Query Without Index (Before Indexing): When you want to check how long this query takes before adding an index:

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 5;

-- 2. Add Index: Create an index for the frequently filtered column:

CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- 3. Query After Index: Run the same query again:

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 5;