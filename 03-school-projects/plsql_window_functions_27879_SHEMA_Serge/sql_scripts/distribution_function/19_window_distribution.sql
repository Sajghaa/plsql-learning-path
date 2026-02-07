-- Window Functions - Distribution
-- File: window_distribution.sql
-- Purpose: Customer segmentation using NTILE, CUME_DIST, PERCENT_RANK

WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        c.region,
        c.customer_tier,
        SUM(o.amount) AS total_spent,
        COUNT(o.order_id) AS order_count
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.region, c.customer_tier
)
SELECT 
    customer_id,
    customer_name,
    region,
    customer_tier,
    total_spent,
    order_count,
    NTILE(4) OVER (ORDER BY total_spent DESC NULLS LAST) AS spending_quartile,
    CASE 
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC NULLS LAST) = 1 THEN 'Top Spender'
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC NULLS LAST) = 2 THEN 'High Spender'
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC NULLS LAST) = 3 THEN 'Medium Spender'
        WHEN NTILE(4) OVER (ORDER BY total_spent DESC NULLS LAST) = 4 THEN 'Low Spender'
        ELSE 'No Purchases'
    END AS customer_segment
FROM customer_spending
ORDER BY total_spent DESC NULLS LAST;

-- 2. CUME_DIST(): Cumulative distribution of customer spending
WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer_name,
        SUM(o.amount) AS total_spent
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_id,
    customer_name,
    total_spent,
    ROUND(CUME_DIST() OVER (ORDER BY total_spent) * 100, 2) AS cumulative_percentage,
    CASE 
        WHEN CUME_DIST() OVER (ORDER BY total_spent) <= 0.25 THEN 'Top 25%'
        WHEN CUME_DIST() OVER (ORDER BY total_spent) <= 0.50 THEN 'Top 50%'
        WHEN CUME_DIST() OVER (ORDER BY total_spent) <= 0.75 THEN 'Top 75%'
        ELSE 'Bottom 25%'
    END AS percentile_group
FROM customer_spending
ORDER BY total_spent DESC;

-- 3. PERCENT_RANK(): Relative rank within region
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.region,
    SUM(o.amount) AS total_spent,
    ROUND(PERCENT_RANK() OVER (PARTITION BY c.region ORDER BY SUM(o.amount) DESC) * 100, 2) AS region_percentile
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.region
HAVING SUM(o.amount) IS NOT NULL
ORDER BY c.region, total_spent DESC;