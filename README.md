# Ecommerce Store SQL Project

## Project Overview
This project demonstrates SQL skills using a synthetic e-commerce dataset.
It includes customers, products, orders, and order items to simulate a real online retail store.

## Key Skills Demonstrated:**
- Creating relational database schema
- Writing SELECT queries with WHERE conditions
- Using JOINs to combine tables
- Aggregations with GROUP BY
- Ordering and limiting results
- Advanced queries with subqueries and calculations

---

## Database Schema

### Customers Table
- customer_id (INT): Unique ID for each customer
- country (VARCHAR): Customer's country

### Products Table
- product_id (VARCHAR): Unique product code
- product_name (VARCHAR): Name of the product
- unit_price (DECIMAL): Price per unit

### Orders Table
- order_id (VARCHAR): Unique order code
- customer_id (INT): Reference to customers
- order_date (DATETIME): Date of the order

### Order Items Table
- order_item_id (INT, AUTO_INCREMENT): Primary key
- order_id (VARCHAR): Reference to orders
- product_id (VARCHAR): Reference to products
- quantity (INT): Number of units purchased

---

## Sample SQL Queries

-- List all customers and their countries
SELECT * FROM customers;

-- Orders made by Nigerian customer (ID 1011)
SELECT * FROM orders
WHERE customer_id = 1011;

-- Orders with customer country
SELECT o.order_id, o.customer_id, c.country
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Total quantity sold per product
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Total value per order, sorted descending
SELECT o.order_id, SUM(oi.quantity * p.unit_price) AS total_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
ORDER BY total_order_value DESC;

---

## How to Run
1. Clone the repository  
2. Open MySQL Workbench  
3. Open `schema.sql` and execute it to create the database and insert sample data  
4. Run the SQL queries listed above to explore the data  

---

## Notes
- Dataset is synthetic for practice purposes  
- Queries demonstrate real-world SQL use cases
