SELECT
    station_id,
    name,
    local,
    address
FROM
    station
WHERE
    local IN ('광진구','동작구','마포구','성동구','영등포구')
;