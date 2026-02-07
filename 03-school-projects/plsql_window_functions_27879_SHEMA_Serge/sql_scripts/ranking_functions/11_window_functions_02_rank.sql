-- WINDOW FUNCTION: RANK()
-- Purpose: Rank products per region by revenue

SELECT
    p.product_name,
    p.category,
    c.region,
    SUM(o.amount) AS total_revenue,

    RANK() OVER (
        PARTITION BY c.region
        ORDER BY SUM(o.amount) DESC
    ) AS rank_position

FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id

GROUP BY
    p.product_name,
    p.category,
    c.region

ORDER BY
    c.region,
    rank_position;