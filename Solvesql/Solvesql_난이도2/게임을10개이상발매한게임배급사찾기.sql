SELECT 
    c.name 
FROM
    games AS g 
JOIN
    companies AS c 
ON 
    g.publisher_id = c.company_id 
GROUP BY
    c.name
HAVING 
    COUNT(DISTINCT game_id) >= 10
;
