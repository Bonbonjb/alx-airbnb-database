-- Create User Table
CREATE TABLE Users (
    user_id UNIQUEIDENTIFIER PRIMARY KEY,
    first_name NVARCHAR(255) NOT NULL,
    last_name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    phone_number NVARCHAR(20),
    role NVARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at DATETIME DEFAULT GETDATE()
);

-- Create Property Table
CREATE TABLE Properties (
    property_id UNIQUEIDENTIFIER PRIMARY KEY,
    host_id UNIQUEIDENTIFIER NOT NULL,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    location NVARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

-- Create Booking Table
CREATE TABLE Bookings (
    booking_id UNIQUEIDENTIFIER PRIMARY KEY,
    property_id UNIQUEIDENTIFIER NOT NULL,
    user_id UNIQUEIDENTIFIER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Payment Table
CREATE TABLE Payments (
    payment_id UNIQUEIDENTIFIER PRIMARY KEY,
    booking_id UNIQUEIDENTIFIER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME DEFAULT GETDATE(),
    payment_method NVARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Create Review Table
CREATE TABLE Reviews (
    review_id UNIQUEIDENTIFIER PRIMARY KEY,
    property_id UNIQUEIDENTIFIER NOT NULL,
    user_id UNIQUEIDENTIFIER NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment NVARCHAR(MAX) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Message Table
CREATE TABLE Messages (
    message_id UNIQUEIDENTIFIER PRIMARY KEY,
    sender_id UNIQUEIDENTIFIER NOT NULL,
    recipient_id UNIQUEIDENTIFIER NOT NULL,
    message_body NVARCHAR(MAX) NOT NULL,
    sent_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);

-- Indexes for optimization
CREATE INDEX idx_user_email ON Users(email);
CREATE INDEX idx_property_host_id ON Properties(host_id);
CREATE INDEX idx_booking_property_id ON Bookings(property_id);
CREATE INDEX idx_booking_user_id ON Bookings(user_id);
CREATE INDEX idx_payment_booking_id ON Payments(booking_id);
CREATE INDEX idx_review_property_id ON Reviews(property_id);
CREATE INDEX idx_review_user_id ON Reviews(user_id);
CREATE INDEX idx_message_sender_id ON Messages(sender_id);
CREATE INDEX idx_message_recipient_id ON Messages(recipient_id);

