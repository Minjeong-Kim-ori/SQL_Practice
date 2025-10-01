SELECT 
    FLOOR(SUM(total_bill)) AS sum_total_bill,
    FLOOR(AVG(total_bill)) AS avg_total_bill
FROM
    tips
WHERE 
    day = 'Sun'
    AND
    time = 'Dinner'
;