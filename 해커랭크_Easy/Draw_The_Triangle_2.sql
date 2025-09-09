WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT 1 + n FROM cte WHERE n < 20
)

SELECT 
    REPEAT('* ', n)
FROM    
    cte
;