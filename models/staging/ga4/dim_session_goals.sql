
{{ config(materialized='view') }}

with base AS (
    select * from {{ ref ('stg_google_analytics_base')}}
)



, goals AS (
    select * from {{ ref ('stg_goals')}}
)


SELECT * FROM  base
LEFT JOIN GOALS 
USING(sessionid, user_pseudo_id)
