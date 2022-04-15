
  SELECT
    ga_id, fullVisitorId, userId, geoNetwork, hits, STRUCT(socialEngagementType, ga_id) AS socialDetails
  FROM {{ source("raw_google_analytics", "sessions") }} AS ga

