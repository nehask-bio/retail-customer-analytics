
-- Advanced Analysis



-- 1. Monthly delivered merchandise value

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS merchandise_value
FROM orders AS o
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- 2. Average delivered order value using a CTE

WITH delivered_order_totals AS (
    SELECT
        oi.order_id,
        SUM(oi.price) AS order_value
    FROM order_items AS oi
    INNER JOIN orders AS o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.order_id
)

SELECT
    AVG(order_value) AS average_delivered_order_value
FROM delivered_order_totals;

-- 3. Rank product categories by delivered merchandise value

SELECT
    p.product_category_name,
    SUM(oi.price) AS delivered_merchandise_value,
    RANK() OVER (
        ORDER BY SUM(oi.price) DESC
    ) AS category_rank
FROM order_items AS oi
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
INNER JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY category_rank;

-- 4. Month-on-month delivered merchandise value growth

WITH monthly_values AS (
    SELECT
        DATE_TRUNC(
            'month',
            o.order_purchase_timestamp
        ) AS month,
        SUM(oi.price) AS merchandise_value
    FROM orders AS o
    INNER JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
      AND o.order_purchase_timestamp >= '2017-01-01'
    GROUP BY month
),

monthly_comparison AS (
    SELECT
        month,
        merchandise_value,
        LAG(merchandise_value) OVER (
            ORDER BY month
        ) AS previous_month_value
    FROM monthly_values
)

SELECT
    month,
    merchandise_value,
    previous_month_value,
    ROUND(
        100.0
        * (
            merchandise_value
            - previous_month_value
        )
        / NULLIF(previous_month_value, 0),
        2
    ) AS growth_pct
FROM monthly_comparison
ORDER BY month;
