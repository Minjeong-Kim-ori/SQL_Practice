SELECT
    car_type,
    COUNT(*) AS cars
FROM
    car_rental_company_car
WHERE
    options LIKE '%시트%'
GROUP BY
    car_type
ORDER BY
    car_type
;

-- 윈도우 함수 버전
SELECT
    DISTINCT car_type,
    COUNT(*) OVER (PARTITION BY car_type) AS cars
FROM
    car_rental_company_car
WHERE
    options LIKE '%시트%'
ORDER BY
    car_type
;