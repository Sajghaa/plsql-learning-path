SELECT 
    o.order_id,
    o.order_date,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.region,
    p.product_name,
    p.category,
    o.quantity,
    o.amount,
    o.payment_method
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC, o.order_id
FETCH FIRST 10 ROWS ONLY;