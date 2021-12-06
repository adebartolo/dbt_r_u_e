with date as (
 
    select * from {{ ref('date_dim') }}
 
),
 
location as (
 
    select * from {{ ref('location_dim') }}
 
),
 
rat_agency as (
 
    select * from {{ ref('rat_agency_dim') }}
 
),
rat_complaint_type as (
 
    select * from {{ ref('rat_complaint_dim') }}
 
)
 
select DISTINCT * from date, location, rat_agency, rat_complaint_type
limit 5
