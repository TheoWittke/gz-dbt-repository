WITH 

sales AS (
    SELECT * FROM {{ref("int_orders_operational")}}
)

SELECT * FROM sales