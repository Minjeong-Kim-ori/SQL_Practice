SELECT 
    E.EMP_NO, 
    E.EMP_NAME,
    CASE
        WHEN S.AVG_SCORE >= 96 THEN 'S'
        WHEN S.AVG_SCORE >= 90 THEN 'A'
        WHEN S.AVG_SCORE >= 80 THEN 'B'
        ELSE 'C'
    END AS 'GRADE',
    CASE
        WHEN S.AVG_SCORE >= 96 THEN E.SAL*0.2
        WHEN S.AVG_SCORE >= 90 THEN E.SAL*0.15
        WHEN S.AVG_SCORE >= 80 THEN E.SAL*0.1
        ELSE E.SAL*0
    END AS 'BONUS'
FROM 
    HR_EMPLOYEES AS E
JOIN (SELECT 
          EMP_NO, 
          AVG(SCORE) AS AVG_SCORE
      FROM 
          HR_GRADE
      GROUP BY 
          EMP_NO) AS S
USING(EMP_NO)
ORDER BY 
    E.EMP_NO
;