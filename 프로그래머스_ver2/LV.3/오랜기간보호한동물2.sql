SELECT
    o.animal_id,
    o.name
FROM
    animal_outs AS o
JOIN
    animal_ins AS i
ON
    o.animal_id = i.animal_id
ORDER BY
    DATEDIFF(o.datetime, i.datetime) DESC
LIMIT 2;