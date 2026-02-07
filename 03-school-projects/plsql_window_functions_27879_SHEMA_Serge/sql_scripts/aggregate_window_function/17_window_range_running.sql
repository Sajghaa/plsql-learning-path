-- Window Functions - SUM, AVG (RANGE)

SELECT
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date
        RANGE BETWEEN INTERVAL '7' DAY PRECEDING AND CURRENT ROW
    ) AS seven_day_running_total,
    ROUND(
        AVG(amount) OVER (
            ORDER BY order_date
            RANGE BETWEEN INTERVAL '30' DAY PRECEDING AND CURRENT ROW
        ), 2
    ) AS thirty_day_moving_avg
FROM orders
WHERE order_date >= DATE '2024-03-01'
ORDER BY order_date
FETCH FIRST 10 ROWS ONLY;