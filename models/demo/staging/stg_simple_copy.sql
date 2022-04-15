select *
from {{ source("raw-sbx", "employees") }}
