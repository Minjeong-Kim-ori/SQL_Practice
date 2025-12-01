WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1
    FROM hours
    WHERE hour < 23
)
    
SELECT
    h.hour AS hour,
    COUNT(o.animal_id) AS count
FROM
    hours AS h
LEFT JOIN
    animal_outs AS o
ON
    h.hour = HOUR(o.datetime)
GROUP BY
    h.hour
ORDER BY
    hour
;