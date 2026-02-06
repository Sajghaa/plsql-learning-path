-- FULL OUTER JOIN: Compare customers and products including unmatched records
SELECT 
    COALESCE(c.customer_id, 0) AS customer_id,
    COALESCE(c.first_name || ' ' || c.last_name, 'NO CUSTOMER') AS customer_name,
    COALESCE(c.region, 'N/A') AS region,
    COALESCE(p.product_id, 0) AS product_id,
    COALESCE(p.product_name, 'NO PRODUCT') AS product_name,
    COALESCE(p.category, 'N/A') AS category,
    o.order_id,
    o.order_date,
    o.quantity,
    o.amount
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN products p ON o.product_id = p.product_id
WHERE c.customer_id IS NULL 
   OR p.product_id IS NULL 
   OR o.order_id IS NULL
ORDER BY c.customer_id NULLS LAST, p.product_id NULLS LAST;