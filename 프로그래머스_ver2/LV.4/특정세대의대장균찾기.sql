SELECT
    e3.id
FROM
    ecoli_data AS e1
JOIN
    ecoli_data AS e2
ON
    e1.id = e2.parent_id
JOIN
    ecoli_data AS e3
ON
    e2.id = e3.parent_id
WHERE
    e1.parent_id IS NULL
ORDER BY
    e3.id
;