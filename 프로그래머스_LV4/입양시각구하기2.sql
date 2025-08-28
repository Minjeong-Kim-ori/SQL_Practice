-- 0시부터 23시까지를 강제로 생성해서 JOIN 해야함!!
-- RECURSIVE : 재귀 CTE 만드는 기능 / 자기 자신을 다시 호출해서 사용
WITH RECURSIVE HOURS AS (
    SELECT 
        0 AS HOUR
    UNION ALL
    SELECT 
        HOUR + 1
    FROM 
        HOURS
    WHERE 
        HOUR < 23)

SELECT
    H.HOUR AS 'HOUR',
    COUNT(O.ANIMAL_ID) AS 'COUNT'
FROM 
    HOURS AS H
LEFT JOIN
    ANIMAL_OUTS AS O
ON H.HOUR = HOUR(O.DATETIME)
GROUP BY
    H.HOUR
ORDER BY
    H.HOUR
;