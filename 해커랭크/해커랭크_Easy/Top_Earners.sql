SELECT
    months * salary AS earnings,
    COUNT(*)
FROM
    employee  
WHERE
    months * salary = (SELECT MAX(months * salary) FROM employee)
GROUP BY
    months * salary
;