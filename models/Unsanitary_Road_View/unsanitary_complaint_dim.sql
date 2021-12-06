SELECT
{{ dbt_utils.surrogate_key(['complaint_type']) }} AS complaint_dim_id,
FORMAT_DATE("%Y%m%d", CAST(created_date as date)) as unsanitary_complaint_date,
complaint_type,
descriptor 
FROM
( SELECT DISTINCT 
complaint_type,
descriptor, SUBSTRING(CAST(created_date as string), 1, 10) AS created_date
FROM `bigquery-public-data.new_york_311.311_service_requests`
where complaint_type = 'UNSANITARY CONDITION' OR complaint_type = 'Dirty Conditions' 
OR complaint_type = 'Dirty Condition' 
)
where created_date >= '20180101'