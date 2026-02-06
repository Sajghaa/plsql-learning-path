INSERT INTO customers (customer_id, first_name, last_name, email, region, signup_date, customer_tier) VALUES

(1, 'Sarah', 'Diana', 'sarah@gmail.com','North America', '2024-01-15','Premium'), 
(2, 'John', 'Smith', 'johnsmith250@gmail.com','North America', '2024-02-13','Standard'),
(3, 'Michael', 'Brown', 'michael@gmail.com','North America', '2024-03-10','Premium'),
(4, 'David', 'Wilson', 'david@gmail.com','North America', '2024-04-12','Standard'),
(5, 'Emily', 'Davis', 'emily@gmail.com','North America', '2024-05-15','Standard'),

(6, 'Maria', 'Garcia', 'maria@gmail.com','Europe', '2024-02-15','Premium'), 
(7, 'Mike', 'Miller', 'mike@gmail.com','Europe', '2024-03-25','Standard'),
(8, 'Emma', 'Jones', 'emma@gmail.com','Europe', '2024-01-05','Standard'),
(9, 'Taylor', 'Robert', 'taylor@gmail.com','Europe', '2024-04-05','Premium'),
(10, 'Sophia', 'Anderson', 'sophia@gmail.com','Europe', '2024-02-26','Standard'), 

(11, 'William', 'Thomas', 'william@gmail.com','Asia', '2024-03-05','Premium'), 
(12, 'Olivia', 'Jackson', 'olivia@gmail.com','Asia', '2024-01-25','Standard'),
(13, 'Daniel', 'White', 'daniel@gmail.com','Asia', '2024-02-10','Standard'),
(14, 'Ava', 'Harris', 'eva@gmail.com','Asia', '2024-03-18','Premium'),
(15, 'Joseph', 'Martin', 'joseph@gmail.com','Asia', '2024-04-01','Standard'),   

(16, 'Noah', 'Thompson', 'noah@gmail.com','Africa', '2024-04-02','Standard'),
(17, 'Isabella', 'Moore', 'isabella@gmail.com','Africa', '2024-05-02','Standard'),
(18, 'Rukara', 'jan', 'rukara@gmail.com','Africa', '2024-06-12','Standard'),
(19, 'Mumberendombe', 'kavaga', 'mumberendombe@gmail.com','Africa', '2024-07-22','Standard'),
(20, 'Mohammad', 'Amir', 'mohammd@gmail.com','Africa', '2024-08-13','Standard'),

-- The next is for customers with no orders(for LEFT JOIN demonstration)
(21, 'Pop', 'Smoke', 'pop@gmail.com','North America', '2024-09-02','Standard'),
(22, 'Billie', 'Jean', 'billie@gmail.com','Europe', '2024-04-11','Standard'),
(23, 'Ethan', 'Lee', 'ethan@gmail.com','Asia', '2024-05-02','Standard'),
(24, 'Kigeli', 'Francois', 'kigeli@gmail.com','Africa', '2024-07-22','Standard'),


INSERT INTO products(product_id, product_name, price, cost, stock_quantity) VALUES

(1, 'Smartphone X', 'Electronics', 899.99, 450.00, 50),
(2, 'Laptop Pro', 'Electronics', 1299.99, 700.00, 30),
(3, 'Wireless Earbuds', 'Electronics', 199.99, 80.00, 100),
(4, 'Smart Watch', 'Electronics', 299.99, 150.00, 75),
(5, 'Table Air', 'Electronics', 499.99, 250.00, 40),

(6, 'Coffee Maker', 'Home Appliances', 89.99, 40.00, 60),
(7, 'Blender Pro', 'Home Appliances', 129.99, 60.00, 45),
(8, 'Air Purifier', 'Home Appliances', 199.99, 90.00, 25),
(9, 'Robot Vacuum', 'Home Appliances', 349.99, 180.00, 20),
(10, 'Microwave Oven', 'Home Appliances', 159.99, 75.00, 35),

(11, 'Database Design', 'Books', 59.99, 20.00, 150),
(12, 'SQL Master', 'Books', 49.99, 15.00, 200),
(13, 'Data Analytics', 'Books', 69.99, 25.00, 120),

(14, 'T-Shirt Classic', 'Clothing', 24.99, 8.00, 300),
(15, 'jeans Regular', 'Clothing', 59.99, 20.00, 150),

(16, 'VR Headset', 'Electronics', 399.99, 200.00, 10),
(17, 'Gaming Console', 'Electronics', 499.99, 250.00, 15),
(18, 'Electric Kettle', 'Home Appliances', 49.99, 22.00, 30),
(19, 'Fiction Novel', 'Books', 19.99, 6.00, 100),
(20, 'Winter Jacket', 'Clothing', 149.99, 60.00, 25);


INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, amount, payment_method) VALUES
-- 01/2024 Orders
(1, 1, 1, '2024-01-20', 1, 899.99, 'Credit Card'),
(2, 2, 3, '2024-01-22', 2, 399.98, 'PayPal'),
(3, 3, 2, '2024-01-25', 1, 1299.99, 'Credit Card'),
(4, 4, 6, '2024-01-28', 1, 89.99, 'Debit Card'),
(5, 5, 11, '2024-01-30', 3, 179.97, 'Credit Card'),

-- 02/2024 orders

(6, 1, 4, '2024-02-05', 1, 299.99, 'Credit Card'),
(7, 2, 5, '2024-02-10', 1, 499.99, 'PayPal'),
(8, 3, 7, '2024-02-12', 2, 259.98, 'Credit Card'),
(9, 4, 9, '2024-02-15', 1, 349.99, 'Debit Card'),
(10, 5, 12, '2024-02-18', 4, 199.96, 'Credit Card'),
(11, 6, 1, '2024-02-20', 1, 899.99, 'Credit Card'),
(12, 7, 3, '2024-02-22', 3, 599.97, 'PayPal'),
(13, 8, 2, '2024-02-25', 1, 1299.99, 'Credit Card'),
(14, 9, 6, '2024-02-26', 2, 179.98, 'Debit Card'),
(15, 10, 11, '2024-02-28', 2, 119.98, 'Credit Card'),

-- 03/2024 orders

(16, 1, 2, '2024-03-05', 1, 1299.99, 'Credit Card'),
(17, 2, 8, '2024-03-08', 1, 199.99, 'PayPal'),
(18, 3, 10, '2024-03-10', 1, 159.99, 'Credit Card'),
(19, 4, 13, '2024-03-12', 2, 139.98, 'Debit Card'),
(20, 5, 14, '2024-03-15', 5, 124.95, 'Credit Card'),
(21, 6, 4, '2024-03-18', 1, 299.99, 'Credit Card'),
(22, 7, 5, '2024-03-20', 1, 499.99, 'PayPal'),
(23, 8, 7, '2024-03-22', 1, 129.99, 'Credit Card'),
(24, 9, 9, '2024-03-25', 1, 349.99, 'Debit Card'),
(25, 10, 12, '2024-03-28', 3, 149.97, 'Credit Card'),
(26, 11, 1, '2024-03-30', 1, 899.99, 'Credit Card'),

--04/2024 orders

(27, 11, 3, '2024-04-02', 2, 399.98, 'PayPal'),
(28, 12, 2, '2024-04-05', 1, 1299.99, 'Credit Card'),
(29, 13, 6, '2024-04-08', 1, 89.99, 'Debit Card'),
(30, 14, 11, '2024-04-10', 4, 239.96, 'Credit Card'),
(31, 15, 4, '2024-04-12', 1, 299.99, 'Credit Card'),
(32, 1, 15, '2024-04-15', 2, 119.98, 'Credit Card'),
(33, 2, 13, '2024-04-18', 1, 69.99, 'PayPal'),
(34, 3, 10, '2024-04-20', 1, 159.99, 'Credit Card'),
(35, 4, 8, '2024-04-22', 1, 199.99, 'Debit Card'),
(36, 5, 5, '2024-04-25', 1, 499.99, 'Credit Card'),

--our analytics for orders
(37, 1, 3, '2024-04-26', 1, 199.99, 'Credit Card'),
(38, 2, 6, '2024-04-27', 1, 89.99, 'PayPal'),
(39, 3, 11, '2024-04-28', 2, 119.98, 'Credit Card'),
(40, 4, 14, '2024-04-29', 3, 74.97, 'Debit Card'),
(41, 5, 2, '2024-04-30', 1, 1299.99, 'Credit Card'),
(42, 6, 7, '2024-05-01', 1, 129.99, 'Credit Card'),
(43, 7, 9, '2024-05-02', 1, 349.99, 'PayPal'),
(44, 8, 12, '2024-05-03', 2, 99.98, 'Credit Card'),
(45, 9, 1, '2024-05-04', 1, 899.99, 'Debit Card'),
(46, 10, 3, '2024-05-05', 2, 399.98, 'Credit Card'),
(47, 11, 10, '2024-05-06', 1, 159.99, 'Credit Card'),
(48, 12, 11, '2024-05-07', 3, 179.97, 'PayPal'),
(49, 13, 4, '2024-05-08', 1, 299.99, 'Credit Card'),
(50, 14, 5, '2024-05-09', 1, 499.99, 'Debit Card');



SELECT 'Customers' as table_name, COUNT(*) as record_count FROM customers
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders

-- Summary Statistics

SELECT 'Total Revenue' as metric, SUM(amount) as value FROM orders
UNION ALL
SELECT 'Total Orders', COUNT(*) FROM orders
UNION ALL
SELECT 'Average Order Value', ROUND(AVG(amount), 2) FROM orders
UNION ALL
SELECT 'Active Customer', COUNT(DISTINCT customer_id) FROM orders