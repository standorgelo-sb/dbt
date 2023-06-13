
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with google_analytics_base as (

    SELECT 
    DISTINCT
    event_date
    , (SELECT ep.value.int_value FROM UNNEST(event_params) ep WHERE ep.key= 'ga_session_id') as sessionid
    , user_pseudo_id
    FROM `sandbox-sd.ga4_RAW.events_20230606` 

)

select *
from google_analytics_base

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
