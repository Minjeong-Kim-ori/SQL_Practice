SELECT
    I.ID,
    N.FISH_NAME,
    I.LENGTH
FROM
    FISH_INFO AS I
JOIN
    FISH_NAME_INFO AS N USING(FISH_TYPE)
WHERE 
    (FISH_TYPE, LENGTH) IN (SELECT 
                                FISH_TYPE,
                                MAX(LENGTH) AS 'MAX_LENGTH'
                            FROM
                                FISH_INFO 
                            GROUP BY
                                FISH_TYPE)
ORDER BY
    ID
;