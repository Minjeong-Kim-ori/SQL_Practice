-- MySQL 에서는 중앙값 함수는 없음! 따라서 PERCENT_RANK() 함수를 이용하여 중앙값 구하기
SELECT
    ROUND(lat_n,4)
FROM
    (SELECT
         lat_n,
         PERCENT_RANK() OVER (ORDER BY lat_n) AS percent
     FROM
         station) AS percent_table
WHERE
    percent = 0.5
;