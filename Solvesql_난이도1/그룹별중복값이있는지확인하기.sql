SELECT 
    quartet,
    x,
    COUNT(x) AS 'cnt'
FROM  
    points
GROUP BY
    quartet, x
HAVING
    COUNT(*) >= 2
;