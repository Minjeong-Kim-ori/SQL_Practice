SELECT
    c.country,
    c.customer_id,
    o.order_date,
    o.order_id
FROM
    customers AS c 
JOIN
    orders AS o
ON 
    c.customer_id = o.customer_id
WHERE
    c.country = 'Singapore'
ORDER BY
    o.order_date DESC
; 