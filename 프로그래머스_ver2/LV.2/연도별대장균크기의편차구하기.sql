-- 코드를 작성해주세요
 
WITH max_size_year AS (
    SELECT 
        YEAR(differentiation_date) AS year,
        MAX(size_of_colony) AS max_size
    FROM 
        ecoli_data 
    GROUP BY 
        YEAR(differentiation_date)
)

SELECT
    YEAR(differentiation_date) AS year,
    m.max_size - size_of_colony AS year_dev,
    id
FROM
    ecoli_data AS e
JOIN
    max_size_year AS m
ON 
    YEAR(e.differentiation_date) = m.year
ORDER BY
    year, year_dev


-- 윈도우 함수
SELECT
    YEAR(differentiation_date) AS year,
    (MAX(size_of_colony) OVER (PARTITION BY YEAR(differentiation_date))) - size_of_colony AS year_dev,
    id
FROM
    ecoli_data
ORDER BY
    year, year_dev
;