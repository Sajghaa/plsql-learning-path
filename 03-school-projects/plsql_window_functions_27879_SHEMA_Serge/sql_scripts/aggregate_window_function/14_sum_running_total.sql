-- AGGREGATE WINDOW FUNCTION: SUM() OVER()
-- Purpose: Running total of monthly sales

SELECT 
    TO_CHAR(TRUNC(order_date, 'MM'), 'YYYY-MM') AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (ORDER BY TRUNC(order_date, 'MM')) AS running_total
FROM orders
GROUP BY TRUNC(order_date, 'MM')
ORDER BY month;