-- LEFT JOIN: Identify customers who have never made a purchase
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email,
    c.region,
    c.signup_date,
    c.customer_tier,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.signup_date DESC;