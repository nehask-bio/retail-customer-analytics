-- =========================================================
-- Sales Analysis
-- =========================================================


-- 1. Order status distribution

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;


-- 2. Delivered merchandise value summary

SELECT
    SUM(oi.price) AS delivered_merchandise_value,
    AVG(oi.price) AS average_delivered_item_price,
    MIN(oi.price) AS cheapest_delivered_item,
    MAX(oi.price) AS most_expensive_delivered_item
FROM order_items AS oi
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';

-- 3. Highest-value delivered orders

SELECT
    oi.order_id,
    SUM(oi.price) AS order_value
FROM order_items AS oi
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.order_id
ORDER BY order_value DESC
LIMIT 10;

-- 4. Average delivered order value

SELECT
    AVG(order_value) AS average_delivered_order_value
FROM (
    SELECT
        oi.order_id,
        SUM(oi.price) AS order_value
    FROM order_items AS oi
    INNER JOIN orders AS o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY oi.order_id
) AS delivered_order_totals;

-- 5. Delivered merchandise value by customer state

SELECT
    c.customer_state,
    SUM(oi.price) AS delivered_merchandise_value
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY delivered_merchandise_value DESC;

-- 6. Top product categories by delivered merchandise value

SELECT
    p.product_category_name,
    SUM(oi.price) AS delivered_merchandise_value
FROM order_items AS oi
INNER JOIN orders AS o
    ON oi.order_id = o.order_id
INNER JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY delivered_merchandise_value DESC
LIMIT 10;