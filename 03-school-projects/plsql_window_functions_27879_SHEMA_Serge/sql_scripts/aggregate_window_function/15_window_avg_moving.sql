-- AGGREGATE WINDOW FUNCTION: 3-Month Moving Average
-- Purpose: Calculate moving average of monthly sales

SELECT
    TO_CHAR(TRUNC(order_date, 'MM'), 'YYYY-MM') AS month,
    SUM(amount) AS monthly_revenue,
    ROUND(
        AVG(SUM(amount)) OVER (
            ORDER BY TRUNC(order_date, 'MM')
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS three_month_moving_avg
FROM orders
GROUP BY TRUNC(order_date, 'MM')
ORDER BY month;