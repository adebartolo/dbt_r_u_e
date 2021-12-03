SELECT
{{ dbt_utils.surrogate_key(['incident_zip']) }} AS LocationsDimID,
incident_zip,
borough, 
location_type,
latitude,
longitude
FROM
( SELECT DISTINCT
incident_zip,
borough, 
location_type,
latitude,
longitude
FROM `bigquery-public-data.new_york_311.311_service_requests`
)