{{
    config(materialized='view')
    
}}

with raw_channels AS (
    SELECT 
       channel_id,
       channel_name,
       created_at,
       updated_at
    FROM {{source('omnichannel','channels')}}
)
SELECT * FROM raw_channels