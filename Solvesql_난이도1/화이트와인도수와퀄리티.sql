SELECT
    color,
    pH,
    alcohol,
    quality
FROM 
    wines
WHERE
    color = 'white'
    AND
    quality >= 8
    AND
    alcohol <= 12
;