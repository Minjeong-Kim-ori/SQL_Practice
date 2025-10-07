SELECT 
    total_bill,
    tip,
    ROUND(tip / total_bill * 100,2) AS tip_ratio,
    sex,
    smoker,
    size
FROM 
    tips
WHERE
    total_bill >= 30
ORDER BY
    tip_ratio DESC
;