
{{ config(materialized='view') }}


SELECT 
event_date
, (SELECT ep.value.int_value FROM UNNEST(event_params) ep WHERE ep.key= 'ga_session_id') as sessionid
, user_pseudo_id
, traffic_source.name
, traffic_source.medium
, traffic_source.source
 FROM `sandbox-sd.ga4_RAW.events_20230606` 