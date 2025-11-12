SELECT
    i.animal_id,
    i.name
FROM
    animal_ins AS i
JOIN
    animal_outs AS o
ON
    i.animal_id = o.animal_id
WHERE
    i.datetime > o.datetime
ORDER BY
    i.datetime 
;