# RIGHT JOIN Implementation  

```sql

-- RIGHT JOIN: Detect products with no sales activity
-- Purpose: Identify products that have never been sold

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
```
## Screenshot of Results
Screenshots are available in the `screenshots/joins/` folder.

## Business Interpretation
Displays 5 products (VR Headset, Gaming Console, Electric Kettle, Fiction Novel, Winter Jacket) that have inventory but have not generated any sales, thereby needing marketing promotion, price revision, or product withdrawal. Identifying inventory that is not selling will help optimize capital utilization.