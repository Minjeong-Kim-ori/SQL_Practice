WITH day_sales_ranked AS (
SELECT 
    *,
    RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS rnk
FROM
    tips)

SELECT 
    total_bill,
    tip,
    sex,
    smoker,
    day,
    time,
    size
FROM
    day_sales_ranked
WHERE
    rnk = 1
;

-- WITH day_sales_ranked AS (
--     SELECT 
--         t.*,
--         RANK() OVER (PARTITION BY day ORDER BY total_bill DESC) AS rnk
--     FROM tips AS t  -- tips테이블에 별칭 t 붙여놓으면 아래에서 rnk 제외한 컬럼 지정하기 쉬움 

-- SELECT 
--     t.*   -- rnk 빼고 원래 tips 테이블의 컬럼만
-- FROM 
--     day_sales_ranked t
-- WHERE 
--     rnk = 1;