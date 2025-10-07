SELECT
    local,
    COUNT(type) AS num_stations
FROM
    station
GROUP BY
    local
ORDER BY
    num_stations
;