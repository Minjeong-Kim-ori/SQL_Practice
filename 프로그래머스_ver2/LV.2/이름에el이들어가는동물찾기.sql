SELECT
    animal_id,
    name
FROM
    animal_ins
WHERE
    animal_type = 'Dog'
    AND
    name LIKE '%el%'
ORDER BY
    name
;