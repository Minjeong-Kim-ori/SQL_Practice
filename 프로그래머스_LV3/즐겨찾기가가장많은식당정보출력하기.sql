WITH MAX_REST AS (
    SELECT 
        FOOD_TYPE, 
        MAX(FAVORITES) AS 'TOP_FAVORITES' 
     FROM 
        REST_INFO 
     GROUP BY 
        FOOD_TYPE
)

SELECT
    I.FOOD_TYPE,
    I.REST_ID,
    I.REST_NAME,
    I.FAVORITES
FROM 
    REST_INFO AS I
JOIN 
    MAX_REST AS M
ON
    I.FOOD_TYPE = M.FOOD_TYPE 
    AND
    I.FAVORITES = M.TOP_FAVORITES
ORDER BY
    I.FOOD_TYPE DESC
;

-- 이건 왜 안될까?
-- SELECT
--     FOOD_TYPE,
--     REST_ID,
--     REST_NAME,
--     TOP_FAVORITES AS FAVORITES
-- FROM
--     (SELECT 
--         REST_ID, 
--         FOOD_TYPE, 
--         REST_NAME, 
--         MAX(FAVORITES) AS 'TOP_FAVORITES' 
--      FROM 
--         REST_INFO 
--      GROUP BY 
--         FOOD_TYPE) AS MAX_REST
-- ORDER BY
--     FOOD_TYPE DESC
-- ;