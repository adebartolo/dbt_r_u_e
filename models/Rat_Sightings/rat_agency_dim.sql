SELECT
{{ dbt_utils.surrogate_key(['agency_name']) }} AS agency_dim_id,
agency,
agency_name
FROM
( SELECT DISTINCT agency_name, agency
FROM `bigquery-public-data.new_york_311.311_service_requests`
where complaint_type = 'Rodent' 
)