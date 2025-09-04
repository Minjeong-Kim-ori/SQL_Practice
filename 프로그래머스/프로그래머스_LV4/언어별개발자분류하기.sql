-- 코드를 작성해주세요
-- 다른 사람 코드로 공부하기(우선 이해 잘되는 걸로)
-- 기술별 GRADE 구분해놓기
WITH GRADE_DEVELOPERS AS (
    SELECT
        CASE
            WHEN SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE CATEGORY = 'Front End') > 0 
                AND SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME = 'Python') > 0
            THEN 'A'
            WHEN SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE NAME = 'C#') > 0
            THEN 'B'
            WHEN SKILL_CODE & (SELECT SUM(CODE) FROM SKILLCODES WHERE CATEGORY = 'Front End') > 0
            THEN 'C'
            ELSE NULL
        END AS 'GRADE',
        ID, 
        EMAIL
    FROM
        DEVELOPERS
    )

SELECT 
    *
FROM 
    GRADE_DEVELOPERS
WHERE 
    GRADE IS NOT NULL
ORDER BY 
    GRADE ASC, ID ASC
;