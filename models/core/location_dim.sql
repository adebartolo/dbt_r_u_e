SELECT DISTINCT
{{ dbt_utils.surrogate_key(['incident_zip', 'borough', 'location_type']) }} AS location_dim_id, 
incident_zip, 
borough, 
location_type,
latitude, 
longitude, 
FROM (
    SELECT DISTINCT Incident_zip, borough, Location_type, Latitude, Longitude 
    FROM `bigquery-public-data.new_york_311.311_service_requests` 
    WHERE complaint_type IN ('UNSANITARY CONDITION','Dirty Conditions', 'Dirty Condition', 'Rodent')
) 
