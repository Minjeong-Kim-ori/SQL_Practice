SELECT 
    day,
    time,
    size
FROM
    tips
WHERE
    total_bill = (SELECT MAX(total_bill) FROM tips)
;