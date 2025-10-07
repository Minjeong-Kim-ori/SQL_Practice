SELECT 
    year,
    UPPER(LEFT(city, 3)) AS 'city'
FROM 
    games
WHERE 
    year >= 2000
ORDER BY
    year DESC
;