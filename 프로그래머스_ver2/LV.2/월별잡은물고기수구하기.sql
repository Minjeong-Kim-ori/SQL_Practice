SELECT
    COUNT(*) AS fish_count,
    MONTH(time) AS month
FROM
    fish_info
GROUP BY
    MONTH(time)
ORDER BY
    month
;

-- 윈도우 함수 버전
SELECT DISTINCT 
    COUNT(*) OVER (PARTITION BY MONTH(time)) AS fish_count,
    MONTH(time) AS month
FROM
    fish_info
ORDER BY
    month
;