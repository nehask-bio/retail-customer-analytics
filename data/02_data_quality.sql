-- =========================================================
-- Data Quality Checks
-- =========================================================


-- 1. Check total order rows and unique order IDs

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS unique_orders
FROM orders;


-- 2. Check total order-item rows and unique orders represented

SELECT
    COUNT(*) AS total_order_items,
    COUNT(DISTINCT order_id) AS unique_orders_in_items
FROM order_items;


-- 3. Check for sold items with missing product categories

SELECT
    COUNT(*) AS missing_category_rows
FROM order_items AS oi
INNER JOIN products AS p
    ON oi.product_id = p.product_id
WHERE p.product_category_name IS NULL;


-- Result observed during analysis:
-- 1,603 order-item rows have a missing product category.
-- 4. Check for delivered orders with a missing delivery date

SELECT
    COUNT(*) AS delivered_orders_missing_delivery_date
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NULL;

-- Result observed during analysis:
-- 8 delivered orders have a missing customer-delivery date.
