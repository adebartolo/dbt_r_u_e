SELECT
{{ dbt_utils.surrogate_key(['agency_name']) }} AS agency_dim_id,
FORMAT_DATE("%Y%m%d", CAST(created_date as date)) as complaint_date,
agency,
agency_name
FROM
( SELECT DISTINCT agency, agency_name, SUBSTRING(CAST(created_date as string), 1, 10) AS created_date
FROM `bigquery-public-data.new_york_311.311_service_requests`
where complaint_type = 'Rodent'
)
where created_date >= '20180101'