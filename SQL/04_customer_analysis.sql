
-- Customer Analysis



-- 1. Customer records by state

SELECT
    customer_state,
    COUNT(*) AS customer_records
FROM customers
GROUP BY customer_state
ORDER BY customer_records DESC;


-- 2. Orders by customer state

SELECT
    c.customer_state,
    COUNT(*) AS order_count
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY order_count DESC;


-- 3. Unique customers by state

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers
GROUP BY customer_state
ORDER BY unique_customers DESC;

-- 4. Repeat-customer summary

WITH customer_order_counts AS (
    SELECT
        customer_unique_id,
        COUNT(*) AS order_count
    FROM customers
    GROUP BY customer_unique_id
)

SELECT
    COUNT(*) AS unique_customers,
    COUNT(*) FILTER (
        WHERE order_count > 1
    ) AS repeat_customers,
    COUNT(*) FILTER (
        WHERE order_count = 1
    ) AS one_time_customers,
    ROUND(
        100.0
        * COUNT(*) FILTER (
            WHERE order_count > 1
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS repeat_purchase_rate_pct
FROM customer_order_counts;
