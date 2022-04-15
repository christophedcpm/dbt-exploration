WITH current_dwh AS (
    WITH current_table AS (
        SELECT
            *,
            RANK() OVER(PARTITION BY id ORDER BY dag_ts DESC) AS rn
        FROM {{ ref("dw_simple_copy") }}
    )

    SELECT * EXCEPT(rn)
    FROM current_table
    WHERE rn = 1
)

SELECT *
FROM current_dwh
