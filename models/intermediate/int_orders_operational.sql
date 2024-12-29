WITH

sales AS (
    SELECT * FROM {{ref("int_orders_margin")}}
),

ship AS (
    SELECT * FROM {{ref("stg_rawData__ship")}}
)

SELECT
    *,
    ROUND(margin + shipping_fee - logcost - ship_cost,2) AS operational_margin
FROM sales AS sa
LEFT JOIN ship AS sh
USING(orders_id)