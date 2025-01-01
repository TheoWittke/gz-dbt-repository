WITH

products AS (
    SELECT * FROM {{ ref("stg_rawData__product") }}
),

sales AS (
    SELECT * FROM {{ ref("stg_rawData__sales") }}
)

SELECT
    date_date AS date,
    orders_id,
    sales.products_id AS products_id,
    revenue,
    quantity,
    ROUND(purchase_price * quantity,2) AS purchase_cost,
    ROUND(revenue - purchase_price * quantity,2) AS margin
FROM sales
LEFT JOIN products AS prod
ON sales.products_id = prod.products_id