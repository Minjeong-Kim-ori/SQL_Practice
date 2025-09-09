-- Mysql은 pivot 함수 없음!! ->  조건문과 집계함수를 이용하여 pivot 구현
-- ROW_NUMBER()로 각 직업별로 번호를 매긴 후
-- 직업별로 조건문을 사용하여 이름을 뽑아낸 후
-- 번호별로 그룹화하여 직업별로 이름을 컬럼으로 변환
WITH sub_table AS (
    SELECT 
        name,
        occupation,
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS number
    FROM
        occupations
)

SELECT
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) as Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) as Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) as Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) as Actor
FROM
    sub_table
GROUP BY
    number
;    
