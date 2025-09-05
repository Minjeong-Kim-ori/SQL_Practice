SELECT
    MIN(age) AS 'min_age',
    MAX(age) AS 'max_age',
    MAX(age) - MIN(age) AS 'age_diff'
FROM
    records
;