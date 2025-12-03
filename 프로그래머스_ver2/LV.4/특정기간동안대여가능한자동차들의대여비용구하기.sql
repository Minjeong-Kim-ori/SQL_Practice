WITH price_con_car AS (
SELECT
    c.car_id,
    c.car_type,
    FLOOR(c.daily_fee * (1 - d.discount_rate / 100) * 30) AS total_fee
FROM
    car_rental_company_car AS c
JOIN
    car_rental_company_discount_plan AS d
ON
    c.car_type = d.car_type
WHERE
    c.car_type IN ('SUV','세단')
    AND
    d.duration_type = '30일 이상'
    AND
    c.daily_fee * (1 - d.discount_rate / 100) * 30 BETWEEN 500000 AND 2000000
)

SELECT DISTINCT 
    p.car_id,
    p.car_type,
    p.total_fee AS fee
FROM
    price_con_car AS p
JOIN
    car_rental_company_rental_history AS h
ON
    p.car_id = h.car_id
WHERE
    p.car_id NOT IN (SELECT car_id 
                   FROM car_rental_company_rental_history
                   WHERE start_date <= '2022-11-30' AND end_date >= '2022-11-01')
ORDER BY
    fee DESC, car_type, car_id DESC
;
