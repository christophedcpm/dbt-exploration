
  SELECT
    '{{ run_id }}' AS DAG_RUN,
    CURRENT_TIMESTAMP() AS DAG_TS,
    CONCAT(CAST(ga_id AS STRING), CAST(fullVisitorId AS STRING)) AS concat_id,
    [ga_id] AS ga_id,
    fullVisitorId,
    userId,
    socialEngagementType AS social,
    CONCAT(CAST(ga_id AS STRING), socialEngagementType) AS enc_id,
    STRUCT(totals.hits AS hit, totals.visits as vis) AS my_totals
  FROM {{ source("raw_google_analytics", "sessions") }} AS ga