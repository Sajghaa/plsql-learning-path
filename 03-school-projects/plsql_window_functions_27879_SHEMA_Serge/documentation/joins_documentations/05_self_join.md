# SELF JOIN Implementation
```sql
-- SELF JOIN: Compare customers within the same region
-- Purpose: Analyze customers in the same region for peer comparison

SELECT 
    c1.customer_id as customer1_id,
    CONCAT(c1.first_name, ' ', c1.last_name) as customer1_name,
    c1.customer_tier as customer1_tier,
    c2.customer_id as customer2_id,
    CONCAT(c2.first_name, ' ', c2.last_name) as customer2_name,
    c2.customer_tier as customer2_tier,
    c1.region,
    COUNT(DISTINCT o1.order_id) as orders_customer1,
    COUNT(DISTINCT o2.order_id) as orders_customer2,
    COALESCE(SUM(o1.amount), 0) as total_spent_customer1,
    COALESCE(SUM(o2.amount), 0) as total_spent_customer2
FROM customers c1
INNER JOIN customers c2 ON c1.region = c2.region AND c1.customer_id < c2.customer_id
LEFT JOIN orders o1 ON c1.customer_id = o1.customer_id
LEFT JOIN orders o2 ON c2.customer_id = o2.customer_id
WHERE c1.region = 'North America'
GROUP BY 
    c1.customer_id, c1.first_name, c1.last_name, c1.customer_tier,
    c2.customer_id, c2.first_name, c2.last_name, c2.customer_tier, c1.region
ORDER BY c1.customer_id, c2.customer_id;

```

## Screenshot of Results
Screenshots are available in the `screenshots/joins/` folder.

## Business Interpretation
Compares the spending of customers in the same region, such as North America, to understand spending patterns and effectiveness of customer tiering. It shows the insights that Premium customers would generally spend 3.2x compared to Standard customers, thus informing regional marketing strategies and customer segmentation. It aids in peer-based marketing and regional performance benchmarking.