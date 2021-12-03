with date as (
 
    select * from {{ ref('date_dim') }}
 
),
 
location as (
 
    select * from {{ ref('location_dim') }}
 
),
 
rat_agency as (
 
select * from {{ ref('rat_agency_dim') }}
 
),
 
rat_complaint as (
 
select * from {{ ref('rat_complaint_dim') }}
 
),
 
unsanitary_agency as (
 
select * from {{ ref('unsanitary_agency_dim') }}
 
),
 
unsanitary_complaint as (
 
select * from {{ ref('unsanitary_complaint_dim') }}
 
)
select * from date, location, rat_agency, rat_complaint, unsanitary_agency, unsanitary_complaint
limit 5
