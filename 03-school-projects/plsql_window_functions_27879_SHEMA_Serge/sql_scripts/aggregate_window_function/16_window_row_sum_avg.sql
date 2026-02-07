-- Window Functions - SUM, AVG, MIN, MAX (ROWS)

SELECT
    TRUNC(order_date, 'MM') AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (
        ORDER BY TRUNC(order_date, 'MM')
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    ROUND(
        AVG(SUM(amount)) OVER (
            ORDER BY TRUNC(order_date, 'MM')
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS running_avg,
    MIN(SUM(amount)) OVER (
        ORDER BY TRUNC(order_date, 'MM')
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS min_to_date,
    MAX(SUM(amount)) OVER (
        ORDER BY TRUNC(order_date, 'MM')
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS max_to_date
FROM orders
GROUP BY TRUNC(order_date, 'MM')
ORDER BY month;