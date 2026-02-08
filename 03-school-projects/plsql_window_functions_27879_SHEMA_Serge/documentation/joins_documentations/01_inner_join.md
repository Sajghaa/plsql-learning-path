# INNER JOIN Implementation

```sql
-- INNER JOIN: Retrieve complete sales transactions
-- Purpose: Get all successful orders with customer and product details

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

```
## Screenshot of Result
Screenshots are available in the `screenshots/joins/` folder.

## Business Interpretation
This INNER JOIN statement provides an overview of all successful transactions. Here, we are looking at which customers have bought which products, over what period of time, and how much each product was sold for. This is crucial in sales reporting as well as in analyzing customer activities. In this query, we are filtering out incomplete information.
