-- Drop database if exists
DROP DATABASE IF EXISTS ecommerce_store;

-- Create database
CREATE DATABASE ecommerce_store;
USE ecommerce_store;

-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
INSERT INTO customers (customer_id, country) VALUES
(1001, 'United States'),
(1002, 'United Kingdom'),
(1003, 'Canada'),
(1004, 'Germany'),
(1005, 'France'),
(1006, 'Australia'),
(1007, 'Italy'),
(1008, 'Spain'),
(1009, 'Netherlands'),
(1010, 'Brazil'),
(1011, 'Nigeria'),
(1012, 'Nigeria');

INSERT INTO products (product_id, product_name, unit_price) VALUES
('P001', 'Wireless Mouse', 15.99),
('P002', 'USB Keyboard', 12.49),
('P003', 'HD Monitor 24"', 129.99),
('P004', 'Laptop Stand', 34.95),
('P005', 'Webcam 1080p', 49.99),
('P006', 'Gaming Chair', 199.99),
('P007', 'External HDD 1TB', 59.99),
('P008', 'Bluetooth Speaker', 24.99),
('P009', 'Smartwatch', 89.99),
('P010', 'Desk Lamp', 19.99);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
('O1001', 1001, '2025-12-01 10:15:00'),
('O1002', 1002, '2025-12-01 11:30:00'),
('O1003', 1003, '2025-12-02 09:45:00'),
('O1004', 1004, '2025-12-02 14:20:00'),
('O1005', 1005, '2025-12-03 16:00:00'),
('O1006', 1006, '2025-12-03 17:10:00'),
('O1007', 1007, '2025-12-04 12:05:00'),
('O1008', 1008, '2025-12-04 13:30:00'),
('O1009', 1009, '2025-12-05 09:20:00'),
('O1010', 1010, '2025-12-05 10:50:00'),
('O1011', 1011, '2025-12-06 11:15:00'),
('O1012', 1012, '2025-12-06 15:45:00'),
('O1013', 1003, '2025-12-07 08:30:00'),
('O1014', 1004, '2025-12-07 14:10:00'),
('O1015', 1005, '2025-12-08 16:55:00');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
('O1001', 'P001', 2),
('O1001', 'P004', 1),
('O1002', 'P002', 1),
('O1002', 'P005', 2),
('O1003', 'P003', 1),
('O1003', 'P010', 3),
('O1004', 'P006', 1),
('O1004', 'P009', 1),
('O1005', 'P007', 2),
('O1005', 'P008', 1),
('O1006', 'P001', 1),
('O1006', 'P002', 2),
('O1007', 'P003', 1),
('O1007', 'P004', 2),
('O1008', 'P005', 1),
('O1008', 'P006', 1),
('O1009', 'P007', 1),
('O1009', 'P008', 2),
('O1010', 'P009', 1),
('O1010', 'P010', 1),
('O1011', 'P001', 3),
('O1012', 'P002', 1),
('O1011', 'P007', 1),
('O1012', 'P008', 1),
('O1013', 'P009', 1),
('O1014', 'P010', 2),
('O1015', 'P005', 2),
('O1015', 'P006', 1),
('O1013', 'P003', 2),
('O1014', 'P004', 1);
