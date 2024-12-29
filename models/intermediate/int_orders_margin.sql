WITH

sales AS (
    SELECT * FROM {{ ref("int_sales_margin") }}
)

SELECT
    orders_id,
    date,
    ROUND(SUM(revenue),2) AS revenue,
    FLOOR(SUM(quantity)) AS quantity,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(margin),2) AS margin
FROM sales
GROUP BY orders_id, date
ORDER BY orders_id DESC