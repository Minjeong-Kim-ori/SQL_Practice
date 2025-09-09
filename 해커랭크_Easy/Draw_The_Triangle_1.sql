WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT 1 + n FROM cte WHERE n < 20
) -- 1부터 20까지 재귀함수 사용해서 생성

SELECT 
    REPEAT('* ', 21-n) -- 숫자만큼 * 반복하는 함수
FROM    
    cte
;