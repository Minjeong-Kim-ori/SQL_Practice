SELECT
    h.hacker_id,
    h.name,
    SUM(s.max_score) AS sum_score
FROM
    hackers AS h 
JOIN (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM
        submissions 
    GROUP BY    
        hacker_id, challenge_id) AS s
ON h.hacker_id = s.hacker_id
GROUP BY
    h.hacker_id, h.name
HAVING
    SUM(s.max_score) > 0 
ORDER BY
    sum_score DESC, h.hacker_id
;