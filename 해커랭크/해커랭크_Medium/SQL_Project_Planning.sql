WITH project_flag AS (
    SELECT
        start_date,
        end_date,
        LAG(end_date) over(ORDER BY start_date) AS prev_date, -- LAG: 이전 행의 값을 가져오는 함수
        CASE
            WHEN start_date = LAG(end_date) over(ORDER BY start_date) THEN 0 -- 시작일 = 이전 종료일이면 같은 그룹
            ELSE 1
        END AS conse_flag
    FROM
        projects
),
project_group AS (
SELECT
    *,
    SUM(conse_flag) OVER (ORDER BY start_date) AS project_group_id -- conse_flag 값을 하나씩 더해가면서 그룹화 / 누적합이 그대로 그룹 id가 됨
FROM 
    project_flag
)

SELECT
    MIN(start_date) AS start_date,
    MAX(end_date) AS end_date
FROM   
    project_group 
GROUP BY
    project_group_id
ORDER BY
    DATEDIFF(MAX(end_date), MIN(start_date)), MIN(start_date);
