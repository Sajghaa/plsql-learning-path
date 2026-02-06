-- CROSS JOIN: Show all possible customer-product combinations
SELECT 
    c.customer_id,
    SUBSTR(c.first_name, 1, 1) || '. ' || c.last_name AS customer_initials,
    p.product_id,
    SUBSTR(p.product_name, 1, 20) AS product_short_name,
    p.category
FROM customers c
CROSS JOIN products p
WHERE c.region = 'Europe' AND p.category = 'Electronics'
ORDER BY c.customer_id, p.product_id
FETCH FIRST 10 ROWS ONLY; 