-- SELF JOIN: Customers Within the Same Region
-- Purpose: Compare customers in the same region

SELECT
    c1.customer_id AS customer1_id,
    c1.first_name || ' ' || c1.last_name AS customer1_name,
    c1.customer_tier AS customer1_tier,

    c2.customer_id AS customer2_id,
    c2.first_name || ' ' || c2.last_name AS customer2_name,
    c2.customer_tier AS customer2_tier,

    c1.region,

    COUNT(DISTINCT o1.order_id) AS orders_customer1,
    COUNT(DISTINCT o2.order_id) AS orders_customer2,

    NVL(SUM(o1.amount), 0) AS total_spent_customer1,
    NVL(SUM(o2.amount), 0) AS total_spent_customer2

FROM customers c1
JOIN customers c2
    ON c1.region = c2.region
   AND c1.customer_id < c2.customer_id

LEFT JOIN orders o1
    ON c1.customer_id = o1.customer_id

LEFT JOIN orders o2
    ON c2.customer_id = o2.customer_id

-- Example filter 
WHERE c1.region = 'North America'

GROUP BY
    c1.customer_id, c1.first_name, c1.last_name, c1.customer_tier,
    c2.customer_id, c2.first_name, c2.last_name, c2.customer_tier,
    c1.region

ORDER BY
    c1.customer_id,
    c2.customer_id;
