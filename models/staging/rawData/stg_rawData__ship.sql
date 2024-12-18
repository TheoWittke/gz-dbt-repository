with 

source as (

    select * from {{ source('rawData', 'ship') }}

),

renamed as (

    select
        orders_id,
        CAST (shipping_fee AS INT64) AS shipping_fee,
        logcost,
        ship_cost

    from source

)

select * from renamed
