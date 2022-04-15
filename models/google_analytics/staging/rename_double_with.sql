
  WITH renamed_table AS (
    WITH x as (
      SELECT
      * EXCEPT(hits),
      ARRAY(SELECT AS STRUCT h.* FROM UNNEST(hits) h WHERE (NOT h.type='APPVIEW')) AS hits
      FROM {{ source("raw_google_analytics", "sessions") }}
    )
    SELECT fullVisitorId, channelGrouping AS renamed
    FROM x
    WHERE ARRAY_LENGTH(hits)>0
    )
  SELECT fullVisitorId, renamed
  FROM renamed_table
