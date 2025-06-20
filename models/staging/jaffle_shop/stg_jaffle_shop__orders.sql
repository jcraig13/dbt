-- source input

WITH source as
(
    SELECT *
    FROM {{ source('jaffle_shop', 'orders') }}
),
-- final CTE
renamed as (
    SELECT
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _etl_loaded_at
    from source
)
SELECT * 
FROM renamed