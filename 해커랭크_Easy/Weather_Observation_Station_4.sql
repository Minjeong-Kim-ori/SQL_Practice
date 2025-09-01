SELECT
    COUNT(*) - COUNT(DISTINCT city)
FROM
    station
;