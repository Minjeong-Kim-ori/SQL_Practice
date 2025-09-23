-- shortest city name
SELECT 
    city,
    LENGTH(city)
FROM
    station
ORDER BY
    LENGTH(city) ASC, city ASC
LIMIT 1
;

-- longest city name
SELECT 
    city,
    LENGTH(city)
FROM
    station
ORDER BY
    LENGTH(city) DESC, city ASC
LIMIT 1
;