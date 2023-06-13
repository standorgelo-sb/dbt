
{{ config(materialized='view') }}

select 
event_date
, (SELECT ep.value.int_value FROM UNNEST(event_params) ep WHERE ep.key= 'ga_session_id') as sessionid
, user_pseudo_id
, MAX(1) AS first_visit
 FROM `sandbox-sd.ga4_RAW.events_20230606` 
 where event_name ='first_visit'
 GROUP BY 1,2,3