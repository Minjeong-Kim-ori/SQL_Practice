SELECT
    CASE
        WHEN MONTH(differentiation_date) BETWEEN 1 AND 3 THEN '1Q'
        WHEN MONTH(differentiation_date) BETWEEN 4 AND 6 THEN '2Q'
        WHEN MONTH(differentiation_date) BETWEEN 7 AND 9 THEN '3Q'
        ELSE '4Q'
    END AS quarter,
    COUNT(*) AS ecoli_count
FROM
    ecoli_data
GROUP BY
    quarter
ORDER BY
    quarter
;

-- quarter 함수!!
SELECT  
    CONCAT(QUARTER(differentiation_date),'Q') AS quarter,
    COUNT(*) AS ecoli_count
FROM    
    ecoli_data
GROUP BY
    quarter
ORDER BY
    quarter 
;