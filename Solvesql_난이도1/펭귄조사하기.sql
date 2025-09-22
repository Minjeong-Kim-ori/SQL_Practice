SELECT
    species,
    island
FROM
    penguins
GROUP BY
    island, species
ORDER BY
    island, species
;