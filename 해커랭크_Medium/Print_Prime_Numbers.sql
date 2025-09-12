-- 먼저 2부터 시작하는 숫자 테이블 생성
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM numbers WHERE num + 1 < 1000
)

SELECT 
    GROUP_CONCAT(num SEPARATOR '&') AS prime_num -- 결과를 &로 연결하여 하나의 문자열로 반환
FROM
    numbers AS n
WHERE
    NOT EXISTS (
        SELECT 1
        FROM numbers AS n2
        WHERE n2.num < n.num AND n.num % n2.num = 0 -- 소수인지 판별 / 나보다 이전 숫자로 나눴을 때 나누어떨어지는 경우에는 소수 아님! 
    )
;