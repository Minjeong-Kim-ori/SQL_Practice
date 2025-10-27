SELECT
    mcdp_cd AS '진료과 코드',
    COUNT(*) AS '5월예약건수'
FROM
    appointment
WHERE
    apnt_ymd LIKE '2022-05%'
GROUP BY
    mcdp_cd
ORDER BY
    COUNT(*), mcdp_cd
;

-- 윈도우함수 버전 
SELECT
    DISTINCT mcdp_cd AS '진료과 코드',
    COUNT(*) OVER (PARTITION BY mcdp_cd) AS '5월예약건수'
FROM
    appointment
WHERE
    apnt_ymd LIKE '2022-05%'
ORDER BY
    5월예약건수, mcdp_cd
;