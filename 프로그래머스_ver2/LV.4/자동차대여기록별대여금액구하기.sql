WITH discounts AS (
    SELECT 
        CAST(SUBSTRING_INDEX(duration_type, '일', 1) AS UNSIGNED) AS min_days,
        discount_rate
    FROM car_rental_company_discount_plan
    WHERE car_type = '트럭'
),

history AS (
    SELECT 
        h.history_id,
        h.car_id,
        DATEDIFF(h.end_date, h.start_date) + 1 AS rental_days,
        c.daily_fee
    FROM car_rental_company_rental_history AS h
    JOIN car_rental_company_car AS c 
        ON h.car_id = c.car_id
    WHERE c.car_type = '트럭'
),

joined AS (
    SELECT
        h.*,
        d.discount_rate,
        ROW_NUMBER() OVER (PARTITION BY h.history_id ORDER BY d.min_days DESC) AS rn
    FROM history AS h
    LEFT JOIN discounts AS d
        ON h.rental_days >= d.min_days
)


SELECT 
    history_id,
    ROUND(daily_fee * rental_days * (1 - IFNULL(discount_rate, 0) / 100)) AS fee
FROM
    joined
WHERE 
    rn = 1
ORDER BY 
    fee DESC, history_id DESC
;