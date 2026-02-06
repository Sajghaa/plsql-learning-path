BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE orders CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE products CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE customers CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- CUSTOMERS TABLE

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    region VARCHAR2(50) NOT NULL,
    signup_date DATE NOT NULL,
    customer_tier VARCHAR2(20) DEFAULT 'standard'
);

-- PRODUCTS TABLE

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50) NOT NULL,
    price NUMBER(10,2) NOT NULL,
    cost NUMBER(10,2) NOT NULL,
    stock_quantity NUMBER DEFAULT 0,

    CONSTRAINT chk_products_price_positive
        CHECK (price > 0)
);

-- ORDERS TABLE

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    order_date DATE NOT NULL,
    quantity NUMBER NOT NULL,
    amount NUMBER(10,2) NOT NULL,
    payment_method VARCHAR2(30),

    CONSTRAINT chk_orders_quantity_positive
        CHECK (quantity > 0),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
        ON DELETE CASCADE
);

-- INDEXES

CREATE INDEX idx_customer_region ON customers(region);
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_order_customer ON orders(customer_id);
CREATE INDEX idx_orders_product ON orders(product_id);

-- COMMENTS

COMMENT ON TABLE customers IS 'Stores customer demographic and registration information';
COMMENT ON TABLE products IS 'Product catalog with pricing and inventory data';
COMMENT ON TABLE orders IS 'Sales transaction linking customer to products';