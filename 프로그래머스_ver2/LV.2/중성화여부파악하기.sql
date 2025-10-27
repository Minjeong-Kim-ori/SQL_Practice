SELECT
    animal_id,
    name,
    IF(sex_upon_intake LIKE 'Neutered%' OR sex_upon_intake LIKE 'Spayed%', 'O', 'X') AS '중성화'
FROM
    animal_ins
ORDER BY
    animal_id
;