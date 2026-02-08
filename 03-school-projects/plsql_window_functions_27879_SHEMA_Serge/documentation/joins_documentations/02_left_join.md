# LEFT JOIN Implementation

```sql
-- LEFT JOIN: Identify customers who have never made a purchase
-- Purpose: Find customers with no orders for re-engagement campaigns

SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email,
    c.region,
    c.signup_date,
    c.customer_tier,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.signup_date DESC;
```
## Screenshot of Results
Screenshots are available in the `screenshots/joins/` folder.

## Business Interpretation
It identifies 3 customers who have signed up for its service but have never made a purchase. These kinds of customers are considered to be excellent prospects for schemes offering "welcome" discounts to stimulate new purchases from them. This analysis assists in eliminating wastage that arises during customer acquisition.