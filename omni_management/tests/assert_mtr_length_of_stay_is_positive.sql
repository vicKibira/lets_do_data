SELECT 
    sk_customer,
    sk_channel,
    SUM(mtr_length_of_stay_days) AS mtr_length_of_stay_days
FROM {{ref('fct_visit_history')}}
GROUP BY sk_customer,sk_channel,mtr_length_of_stay_days
HAVING mtr_length_of_stay_days < 0