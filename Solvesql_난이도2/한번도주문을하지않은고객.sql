SELECT 
    c.id 
FROM
    customers AS c
LEFT JOIN
    orders AS o 
ON c.id = o.customer_id
WHERE 
    o.id IS NULL 
ORDER BY
    c.id
;