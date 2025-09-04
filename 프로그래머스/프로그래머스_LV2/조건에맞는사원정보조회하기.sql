-- SELECT SUM(G.SCORE) AS SCORE, G.EMP_NO, E.EMP_NAME, E.POSITION, E.EMAIL
-- FROM HR_DEPARTMENT AS D
-- JOIN HR_EMPLOYEES AS E
-- ON D.DEPT_ID = E.DEPT_ID
-- JOIN HR_GRADE AS G
-- ON E.EMP_NO = G.EMP_NO
-- GROUP BY G.EMP_NO
-- ORDER BY SUM(G.SCORE) DESC
-- LIMIT 1
-- ;
-- 처음 풀 땐 왜 join 두번 했을까...?

SELECT 
    SUM(G.SCORE) AS SCORE,  -- 2022 상/하반기 점수 합하기
    EMP_NO,
    EMP_NAME,
    POSITION,
    EMAIL
FROM
    HR_EMPLOYEES AS E
JOIN 
    HR_GRADE AS G USING(EMP_NO)
WHERE 
    G.YEAR = '2022'
GROUP BY
    EMP_NO    
ORDER BY
    SCORE DESC
LIMIT 1
;

-- 최고점이 동일한 사원이 여러명 있었다면??
SELECT 
    SUM(G.SCORE) AS SCORE,
    E.EMP_NO,
    E.EMP_NAME,
    E.POSITION,
    E.EMAIL
FROM
    HR_EMPLOYEES AS E
JOIN 
    HR_GRADE AS G USING(EMP_NO)    
WHERE 
    G.YEAR = '2022'
GROUP BY
    EMP_NO   
HAVING -- 3. 사원의 2022 점수합계가 '최고점수'와 동일한 경우만 필터
    SUM(G.SCORE) = (SELECT 
                        MAX(SUM_SCORE) AS MAX_SUM -- 2. 사원별 점수합계에서 '최고점수'만 선택
                    FROM (SELECT
                                EMP_NO,
                                SUM(SCORE) AS SUM_SCORE
                            FROM
                                HR_GRADE 
                            WHERE 
                                YEAR = '2022'
                            GROUP BY
                                EMP_NO) AS M_SCORE) -- 1. HR_GRADE 테이블에서 2022년, 사원별 점수합계 구하고
;
    
