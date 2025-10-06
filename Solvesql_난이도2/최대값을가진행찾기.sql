SELECT 
    id 
FROM
    points 
WHERE 
    x = (SELECT MAX(x) FROM points)
    OR
    y = (SELECT MAX(y) FROM points)
ORDER BY
    id
;