SELECT
    *
FROM
    movies
WHERE
    runtime >= 200
    AND
    directors IS NOT NULL
    AND
    language LIKE '%English%'
ORDER BY
    year DESC, title ASC
;