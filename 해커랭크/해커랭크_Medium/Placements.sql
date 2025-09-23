SELECT
    s.name
FROM
    students AS s
JOIN
    friends AS f 
ON s.id = f.id
JOIN
    packages AS p 
ON f.id = p.id
JOIN
    packages AS p2
ON f.friend_id = p2.id
WHERE
    p.salary < p2.salary
ORDER BY
    p2.salary
;