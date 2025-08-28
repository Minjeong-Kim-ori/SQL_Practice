-- 미리 프론트엔드 기술은 뭐가 있나 보기 
-- SELECT NAME FROM SKILLCODES WHERE CATEGORY = 'Front End';

-- SELECT
--      ID,
--      EMAIL,
--      FIRST_NAME,
--      LAST_NAME
--  FROM
--      DEVELOPERS 
--  WHERE
--      SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'JavaScript') > 0
--      OR
--      SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'React') > 0
--      OR
--      SKILL_CODE & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Vue') > 0
--  ORDER BY
--      ID ASC
--  ;

-- 이렇게 확인해서 하는건 lv4에서는 안봐주나봄...ㅜ 

WITH FRONT_END AS (
    SELECT SUM(CODE) AS TOTAL_CODE
        FROM SKILLCODES
        WHERE CATEGORY = 'Front End'
)

SELECT 
    ID, 
    EMAIL, 
    FIRST_NAME, 
    LAST_NAME
FROM 
    DEVELOPERS
WHERE 
    SKILL_CODE & (SELECT TOTAL_CODE FROM FRONT_END) > 0
ORDER BY 
    ID
;