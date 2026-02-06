 -- Drop tables if they exist (for clean setup)
 -- I like to use this methods even in my early projects I used it

 DROP TABLE IF EXISTS orders;
 DROP TABLE IF EXISTS customers;
 DROP TABLE IF EXISTS products;

 CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    region VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL, 
    customer_tier VARCHAR(20) DEFAULT 'standard'
 );


 CREATE TABLE products (
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100) NOT NULL,
    category  VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK(price > 0),
    cost DECIMAL(10, 2) NOT NULL, 
    stock_quantity INT DEFAULT 0
 );


 CREATE TABLE orders (
    order_id INT PRIMARY KEY, 
    customer_id INT NOT NULL, 
    product_id INT NOT NULL, 
    order_date DATE NOT NULL, 
    quantity INT NOT NULL CHECK (quantity > 0),
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(30),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE CASCADE
 );

 CREATE INDEX idx_customer_region ON customer(region)
 CREATE INDEX idx_order_date ON orders(order_date)
 CREATE INDEX idx_order_customer ON orders(customer_id);
 CREATE INDEX idx_orders_product ON orders(product_id);

 COMMENT ON TABLE customers IS 'Stores customer demographic and registration information'
 COMMENT ON TABLE products IS 'Product catalog with pricing and inventory data';
 COMMENT ON TABLE orders IS 'Sales transaction linking customer to products';