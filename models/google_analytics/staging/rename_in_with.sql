  WITH renamed_table AS (
    SELECT fullVisitorId, ga_id AS renamed
    FROM {{ source("raw_google_analytics", "sessions") }}
  )
  SELECT fullVisitorId, renamed
  FROM renamed_table