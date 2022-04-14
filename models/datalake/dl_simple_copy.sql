{{ config(materialized='table') }}


select *
from {{ ref("stg_simple_copy") }}