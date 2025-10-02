SELECT 
    mt.measured_at AS today,
    mn.measured_at AS next_day,
    mt.pm10,
    mn.pm10 AS next_pm10
FROM
    measurements AS mt 
JOIN 
    measurements AS mn 
ON 
    DATE_ADD(mt.measured_at, INTERVAL 1 DAY)= mn.measured_at
WHERE
    mt.pm10 < mn.pm10
;