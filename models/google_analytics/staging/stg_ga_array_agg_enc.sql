
  SELECT
    ga_id,
    fullVisitorId,
    ARRAY_AGG(socialEngagementType) AS social
  FROM {{ source("raw_google_analytics", "sessions") }} AS ga
  GROUP BY ga_id, fullVisitorId

