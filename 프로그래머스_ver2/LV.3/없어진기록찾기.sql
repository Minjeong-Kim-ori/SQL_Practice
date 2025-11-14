SELECT
    o.animal_id,
    o.name
FROM
    animal_outs AS o
LEFT JOIN
    animal_ins AS i
ON
    o.animal_id = i.animal_id
WHERE
    i.datetime IS NULL 
ORDER BY
    o.animal_id
;