{{
    config(materialized='view')
}}

WITH stg_dim_customers AS (
    SELECT 
       customer_id AS nk_customer_id,
       name AS dsc_name,
       date_of_birth AS dt_date_birth,
       email_address AS dsc_email_address,
       phone_number AS dsc_phone_number,
       country AS dsc_country,
       created_at AS dt_created_at,
       updated_at AS dt_updated_at
    FROM {{ref('stg_customers')}}
)
SELECT {{dbt_utils.generate_surrogate_key(['nk_customer_id'])}} AS sk_customer,
*
FROM stg_dim_customers