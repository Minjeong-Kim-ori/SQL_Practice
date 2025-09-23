SELECT
    s.hacker_id,
    h.name
FROM
    submissions AS s
LEFT JOIN    
    hackers AS h 
ON s.hacker_id = h.hacker_id
LEFT JOIN
    challenges AS c
ON s.challenge_id = c.challenge_id
LEFT JOIN   
    difficulty AS d
ON c.difficulty_level = d.difficulty_level
WHERE
    s.score = d.score
GROUP BY
    s.hacker_id, h.name
HAVING
    COUNT(*) >= 2
ORDER BY
    COUNT(s.hacker_id) DESC, s.hacker_id ASC
;