SELECT 
    title
FROM 
    film 
WHERE 
    rating IN ('R','NC-17')
    AND
    RIGHT(title,1) NOT IN ('A','E','I','O','U')
;