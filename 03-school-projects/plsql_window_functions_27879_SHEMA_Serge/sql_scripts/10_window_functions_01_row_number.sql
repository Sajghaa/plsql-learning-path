-- 1a. ROW_NUMBER(): Assign unique sequential numbers per region
WITH revenue_per_product AS (
    SELECT
        p.product_name,
        p.category,
        c.region,
        SUM(o.amount) AS total_revenue
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN products p ON o.product_id = p.product_id
    GROUP BY p.product_name, p.category, c.region
)
SELECT
    product_name,
    category,
    region,
    total_revenue,
    ROW_NUMBER() OVER (
        PARTITION BY region
        ORDER BY total_revenue DESC
    ) AS row_num
FROM revenue_per_product
ORDER BY region, row_num;