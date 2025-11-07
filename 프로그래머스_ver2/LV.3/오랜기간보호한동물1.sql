SELECT
    i.name,
    i.datetime
FROM
    animal_ins AS i
LEFT JOIN
    animal_outs AS o
ON
    i.animal_id = o.animal_id
WHERE
    o.datetime IS NULL
ORDER BY
    i.datetime ASC
LIMIT 3
;