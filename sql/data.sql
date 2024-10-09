CREATE TABLE customers (
 customer_id INTEGER PRIMARY KEY,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(100) NOT NULL,
 phone_number VARCHAR(15),
 driver_licence_number VARCHAR(20),
 address VARCHAR(200),
 date_of_birth DATE NOT NULL
);

CREATE TABLE vehicles (
 vehicle_id INTEGER PRIMARY KEY,
 manufacturer_name VARCHAR(50),
 model_name VARCHAR(50),
 year_of_manufacture INTEGER NOT NULL,
 licence_plate VARCHAR(15) NOT NULL,
 vehicle_type VARCHAR(20) NOT NULL,
 rental_price_per_day DECIMAL(10, 2) NOT NULL,
 mileage INTEGER,
 vehicle_is_available BOOLEAN NOT NULL
);

CREATE TABLE rentals (
 rental_id INTEGER PRIMARY KEY,
 customer_id INTEGER NOT NULL,
 vehicle_id INTEGER NOT NULL,
 rental_location_id INTEGER NOT NULL,
 rental_start_date DATE NOT NULL,
 rental_end_date DATE NOT NULL,
 rental_cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE payments (
 payment_id INTEGER PRIMARY KEY,
 rental_id INTEGER NOT NULL,
 payment_date DATE NOT NULL,
 payment_method VARCHAR(20) NOT NULL,
 amount_paid DECIMAL(10, 2) NOT NULL,
 rental_is_paid BOOLEAN NOT NULL
);

CREATE TABLE rental_location (
 rental_location_id INTEGER PRIMARY KEY,
 branch_name VARCHAR(50) NOT NULL,
 address VARCHAR(200) NOT NULL,
 phone_number VARCHAR(15),
 manager_name VARCHAR(50)
);

CREATE TABLE maintenance (
 maintenance_id INTEGER PRIMARY KEY,
 vehicle_id INTEGER NOT NULL,
 service_date DATE NOT NULL,
 service_description VARCHAR(200) NOT NULL,
 cost DECIMAL(10, 2) NOT NULL
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone_number, driver_licence_number, address, date_of_birth) 
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', 'D1234567', '123 Elm St, Springfield', '1985-03-22'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', 'S7654321', '456 Oak St, Springfield', '1990-07-15'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', 'J9876543', '789 Pine St, Springfield', '1982-11-30'),
(4, 'Bob', 'Williams', 'bob.williams@example.com', '555-4321', 'W6543210', '135 Maple St, Springfield', '1979-05-05'),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', '555-6789', 'B0123456', '246 Birch St, Springfield', '1987-09-12');

INSERT INTO vehicles (vehicle_id, manufacturer_name, model_name, year_of_manufacture, licence_plate, vehicle_type, rental_price_per_day, mileage, vehicle_is_available) 
VALUES
(1, 'Toyota', 'Camry', 2020, 'ABC1234', 'Sedan', 50.00, 15000, TRUE),
(2, 'Honda', 'Civic', 2019, 'DEF5678', 'Sedan', 45.00, 20000, TRUE),
(3, 'Ford', 'F-150', 2021, 'GHI9012', 'Truck', 75.00, 5000, TRUE),
(4, 'Chevrolet', 'Malibu', 2022, 'JKL3456', 'Sedan', 55.00, 8000, TRUE),
(5, 'BMW', 'X5', 2020, 'MNO7890', 'SUV', 90.00, 12000, TRUE);

INSERT INTO rentals (rental_id, customer_id, vehicle_id, rental_location_id, rental_start_date, rental_end_date, rental_cost) 
VALUES
(1, 1, 1, 1, '2024-09-01', '2024-09-07', 350.00),
(2, 2, 2, 2, '2024-09-03', '2024-09-10', 315.00),
(3, 3, 3, 3, '2024-09-05', '2024-09-12', 525.00),
(4, 4, 4, 4, '2024-09-07', '2024-09-14', 385.00),
(5, 5, 5, 5, '2024-09-10', '2024-09-17', 630.00);

INSERT INTO payments (payment_id, rental_id, payment_date, payment_method, amount_paid, rental_is_paid) 
VALUES
(1, 1, '2024-09-02', 'Credit Card', 350.00, TRUE),
(2, 2, '2024-09-04', 'Debit Card', 315.00, FALSE),
(3, 3, '2024-09-06', 'Credit Card', 525.00, TRUE),
(4, 4, '2024-09-08', 'Cash', 385.00, FALSE),
(5, 5, '2024-09-11', 'Credit Card', 630.00, FALSE);

INSERT INTO rental_location (rental_location_id, branch_name, address, phone_number, manager_name) 
VALUES
(1, 'Downtown Branch', '100 Main St, Springfield', '555-0001', 'Linda Green'),
(2, 'East Side Branch', '200 Elm St, Springfield', '555-0002', 'Mark Brown'),
(3, 'West End Branch', '300 Oak St, Springfield', '555-0003', 'Susan White'),
(4, 'North Side Branch', '400 Pine St, Springfield', '555-0004', 'Tom Black'),
(5, 'South Branch', '500 Maple St, Springfield', '555-0005', 'Emily Jones');

INSERT INTO maintenance (maintenance_id, vehicle_id, service_date, service_description, cost) 
VALUES
(1, 1, '2024-05-01', 'Oil Change', 50.00),
(2, 2, '2024-06-01', 'Tire Rotation', 60.00),
(3, 3, '2024-07-01', 'Brake Inspection', 75.00),
(4, 4, '2024-08-01', 'Engine Tune-Up', 100.00),
(5, 5, '2024-09-01', 'Transmission Service', 120.00);


