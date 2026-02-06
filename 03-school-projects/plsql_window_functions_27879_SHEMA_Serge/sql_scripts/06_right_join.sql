-- RIGHT JOIN: Detect products with no sales activity
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.stock_quantity,
    o.order_id,
    o.order_date,
    o.quantity,
    o.amount
FROM orders o
RIGHT JOIN products p ON o.product_id = p.product_id
WHERE o.order_id IS NULL
ORDER BY p.price DESC;