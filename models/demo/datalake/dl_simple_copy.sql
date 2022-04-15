select *
from {{ ref("stg_simple_copy") }}
