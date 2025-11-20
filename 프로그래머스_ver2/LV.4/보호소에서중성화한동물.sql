SELECT
    i.animal_id,
    i.animal_type,
    i.name
FROM
    animal_ins AS i
LEFT JOIN
    animal_outs AS o
ON
    i.animal_id = o.animal_id
WHERE
    i.sex_upon_intake LIKE '%Intact%' 
    AND 
    o.sex_upon_outcome NOT LIKE '%Intact%' 
ORDER BY
    i.animal_id
;