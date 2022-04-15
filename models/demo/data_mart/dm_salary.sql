WITH current_salary AS (
    WITH current_table AS (
        SELECT
            *,
            RANK() OVER(PARTITION BY id ORDER BY dag_ts DESC) AS rn
        FROM {{ ref("dw_manipulating_pii_fields") }}
    )

    SELECT * EXCEPT(rn)
    FROM current_table
    WHERE rn = 1
)

SELECT
    id,
    email,
    salary,
    bonus,
    total_compensation
FROM current_salary
