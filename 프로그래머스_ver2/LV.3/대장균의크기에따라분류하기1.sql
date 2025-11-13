SELECT
    id,
    CASE
        WHEN size_of_colony <= 100 THEN 'LOW'
        WHEN size_of_colony <= 1000 THEN 'MEDIUM'
        WHEN size_of_colony > 1000 THEN 'HIGH'
    END AS size
FROM
    ecoli_data
ORDER BY
    id 
;