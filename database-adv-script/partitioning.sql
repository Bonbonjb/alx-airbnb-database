CREATE PARTITION FUNCTION pf_booking_by_month (DATE)
AS RANGE LEFT FOR VALUES (
    '2024-01-31', 
    '2024-02-29', 
    '2024-03-31'
);

-- Create partition scheme
-- This assigns each range to a filegroup (use PRIMARY if unsure)
CREATE PARTITION SCHEME ps_booking_by_month
AS PARTITION pf_booking_by_month
ALL TO ([PRIMARY]);  -- or map to custom filegroups if available

CREATE TABLE bookings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    created_at DATETIME DEFAULT GETDATE()
)
ON ps_booking_by_month (start_date);  -- partitioning column