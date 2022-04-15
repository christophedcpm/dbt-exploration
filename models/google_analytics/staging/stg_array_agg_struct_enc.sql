
  SELECT
    ga_id, fullVisitorId, ARRAY_AGG(STRUCT(ga_id, socialEngagementType)) AS socialDetails
  FROM {{ source("raw_google_analytics", "sessions") }} AS ga
  GROUP BY ga_id, fullVisitorId
