{{
    config(materialized='view')
}}

WITH stg_dim_channel AS(
    SELECT 
       channel_id AS nk_channel_id,
       channel_name AS dsc_channel_name,
       created_at AS dt_created_at,
       updated_at AS dt_updated_at
    FROM {{ref('stg_channels')}}
)
SELECT 
   {{dbt_utils.generate_surrogate_key(['nk_channel_id'])}} AS sk_channel,
   *
FROM stg_dim_channel