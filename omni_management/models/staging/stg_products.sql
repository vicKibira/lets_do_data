{{
    config(materialized='view')
}}

WITH raw_products AS (
    SELECT 
       product_sku,
       product_name,
       unit_price,
       created_at,
       updated_at
    FROM {{source('omnichannel','products')}}
)
SELECT * FROM raw_products