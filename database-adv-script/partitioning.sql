-- Step 1: Drop table if it exists
DROP TABLE IF EXISTS booking CASCADE;

-- Step 2: Create partitioned table
CREATE TABLE booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create monthly partitions (example for Jan to Mar 2024)
CREATE TABLE booking_2024_01 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE booking_2024_02 PARTITION OF booking
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE booking_2024_03 PARTITION OF booking
    FOR VALUES FROM ('2024-03-01') TO ('2024-04-01');


