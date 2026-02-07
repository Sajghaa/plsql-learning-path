-- WINDOW FUNCTION: PERCENT_RANK()
-- Purpose: Show relative rank of products by revenue

SELECT 
    p.product_name,
    SUM(o.amount) AS total_revenue,
    ROUND(
        PERCENT_RANK() OVER (ORDER BY SUM(o.amount) DESC) * 100,
        2
    ) AS percent_rank_position
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY percent_rank_position;