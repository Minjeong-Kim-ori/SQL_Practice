SELECT 
    *
FROM 
    wines
WHERE
    quality >= 8 AND alcohol <= 12 AND color = 'red'
ORDER BY
    quality DESC, alcohol ASC
;