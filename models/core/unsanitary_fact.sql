with date as (
 
    select * from {{ ref('date_dim') }}
 
),
 
location as (
 
    select * from {{ ref('location_dim') }}
 
),
 
unsanitary_agency as (
 
    select * from {{ ref('unsanitary_agency_dim') }}
 
),
unsanitary_complaint as (
 
    select * from {{ ref('unsanitary_complaint_dim') }}
 
)
 
select DISTINCT * from date, location, unsanitary_agency, unsanitary_complaint
limit 5
