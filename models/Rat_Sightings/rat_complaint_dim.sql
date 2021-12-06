SELECT
{{ dbt_utils.surrogate_key(['complaint_type']) }} AS complaint_dim_id,
complaint_type,
descriptor 
FROM
( SELECT DISTINCT 
complaint_type,
descriptor
FROM `bigquery-public-data.new_york_311.311_service_requests`
where complaint_type = 'Rodent' 
)
