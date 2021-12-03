select created_date, closed_date, agency, agency_name, complaint_type 
from `bigquery-public-data`.`new_york_311`.`311_service_requests`
where complaint_type = 'Rodent'