SELECT 
    g.year,
    g.season,
    g.city
FROM
    games AS g 
JOIN 
    records AS r 
ON 
    g.id = r.game_id
WHERE 
    r.athlete_id = (SELECT id FROM athletes WHERE name = 'Yu-Na Kim')
ORDER BY
    g.year DESC
;