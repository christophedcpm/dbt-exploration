
  WITH renamed_table AS (
    WITH x as (
      SELECT
      * EXCEPT(hits),
      ARRAY(SELECT AS STRUCT h.* FROM UNNEST(hits) h WHERE (NOT h.type='APPVIEW')) AS hits
      FROM {{ source("raw_google_analytics", "sessions") }}
    )
    SELECT
      fullVisitorId,
      device.deviceCategory AS device,
      trafficSource.campaign AS campaign
    FROM x
    WHERE ARRAY_LENGTH(hits)>0
    )
  SELECT
    fullVisitorId,
    device,
    campaign
  FROM renamed_table
