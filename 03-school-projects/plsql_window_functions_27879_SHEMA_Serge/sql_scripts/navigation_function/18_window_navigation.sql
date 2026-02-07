-- Window Functions - Navigation (LAG, LEAD)
-- File: window_navigation.sql
-- Purpose: Period-to-period comparison and growth

-- Step 1: Calculate monthly sales
WITH monthly_sales AS (
    SELECT 
        TRUNC(order_date, 'MM') AS month,
        SUM(amount) AS monthly_revenue
    FROM orders
    GROUP BY TRUNC(order_date, 'MM')
)

-- Step 2: Add LAG, LEAD, FIRST_VALUE, LAST_VALUE
SELECT
    month,
    monthly_revenue,
    
    -- Compare with previous month
    LAG(monthly_revenue, 1) OVER (ORDER BY month) AS previous_month_revenue,
    monthly_revenue - LAG(monthly_revenue, 1) OVER (ORDER BY month) AS monthly_change,
    ROUND(
        ((monthly_revenue - LAG(monthly_revenue, 1) OVER (ORDER BY month)) /
         NULLIF(LAG(monthly_revenue, 1) OVER (ORDER BY month), 0)) * 100, 2
    ) AS monthly_growth_percentage,
    
    -- Forecast next month based on trend
    LEAD(monthly_revenue, 1) OVER (ORDER BY month) AS next_month_forecast,
    LEAD(monthly_revenue, 1) OVER (ORDER BY month) - monthly_revenue AS forecasted_change,
    
    -- Best and worst months
    FIRST_VALUE(monthly_revenue) OVER (ORDER BY monthly_revenue DESC) AS best_month_revenue,
    LAST_VALUE(monthly_revenue) OVER (
        ORDER BY monthly_revenue DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS worst_month_revenue

FROM monthly_sales
ORDER BY month;