SELECT DISTINCT
{{ dbt_utils.surrogate_key(['incident_zip', 'borough', 'location_type']) }} AS location_dim_id, 
FORMAT_DATE("%Y%m%d", CAST(created_date as date)) as created_date,
incident_zip, 
borough, 
location_type,
latitude, 
longitude, 
FROM (
    SELECT DISTINCT SUBSTRING(CAST(created_date as string), 1, 10) AS created_date, Incident_zip, borough, Location_type, Latitude, Longitude 
    FROM `bigquery-public-data.new_york_311.311_service_requests` 
    WHERE complaint_type IN ('UNSANITARY CONDITION','Dirty Conditions', 'Dirty Condition', 'Rodent')
) 
