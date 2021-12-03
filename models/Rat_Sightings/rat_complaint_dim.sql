SELECT
{{ dbt_utils.surrogate_key(['complaint_type']) }} AS complaint_type_dim,
complaint_type,
descriptor as complaint_type_descriptor
FROM
( SELECT DISTINCT 
complaint_type,
descriptor
FROM `bigquery-public-data.new_york_311.311_service_requests`
where complaint_type = 'Rodent' 
)
