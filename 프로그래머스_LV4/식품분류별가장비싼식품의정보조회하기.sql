-- WHERE 서브쿼리 
SELECT
    CATEGORY,
    PRICE AS 'MAX_PRICE',
    PRODUCT_NAME
FROM
    FOOD_PRODUCT 
WHERE
    (CATEGORY, PRICE) IN (SELECT 
                              CATEGORY,
                              MAX(PRICE)
                          FROM 
                              FOOD_PRODUCT
                          WHERE 
                              CATEGORY IN ('과자','국','김치','식용유')
                          GROUP BY
                              CATEGORY)
ORDER BY
    MAX_PRICE DESC
;


-- WITH 절 사용
-- 왜 WITH에서 카테고리별 최고가의 PRODUCT_ID를 구해서 쓰면 틀릴까....? ㅜ
WITH MAX_PRODUCT AS (SELECT
                            CATEGORY,
                            MAX(PRICE) AS 'M_PRICE'
                        FROM
                            FOOD_PRODUCT
                        WHERE
                            CATEGORY IN ('과자','국','김치','식용유')
                        GROUP BY
                            CATEGORY)

SELECT
    CATEGORY,
    PRICE AS 'MAX_PRICE',
    PRODUCT_NAME
FROM
    FOOD_PRODUCT 
WHERE
    (CATEGORY, PRICE) IN (SELECT 
                              CATEGORY, M_PRICE
                          FROM 
                              MAX_PRODUCT)
ORDER BY
    MAX_PRICE DESC
;