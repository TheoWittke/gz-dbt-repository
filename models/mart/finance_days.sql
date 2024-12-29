WITH 

sales AS (
    SELECT * FROM {{ref("int_orders_operational")}}
)

SELECT
    date,
    FLOOR(COUNT(orders_id)) AS nb_transactions,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(AVG(revenue),2) AS avg_basket,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(shipping_fee),2) AS shipping_fee,
    ROUND(SUM(logcost),2) AS log_cost,
    FLOOR(SUM(quantity)) AS quantity
FROM sales
GROUP BY date ORDER BY date DESC