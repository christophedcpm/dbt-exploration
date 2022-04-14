{{ config(materialized='table') }}


select *
from {{ source("raw-sbx", "employees") }}