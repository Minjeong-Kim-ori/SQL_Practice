SELECT
    COUNT(*) AS total,
    COUNT(sex) AS sex_notnull,
    COUNT(*) - COUNT(sex) AS sex_null
FROM
    penguins
;