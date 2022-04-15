select
    *,
    CURRENT_DATETIME() as DAG_TS
from {{ ref("stg_simple_copy") }}
