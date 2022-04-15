
  SELECT ga_id, fullVisitorId, socialEngagementType AS social, geoNetwork.country AS country_code
  FROM {{ source("raw_google_analytics", "sessions") }} AS ga
