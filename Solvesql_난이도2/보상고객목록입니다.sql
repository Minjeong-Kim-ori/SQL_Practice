SELECT
    order_date,
    order_id,
    customer_name
FROM
    orders
WHERE
    order_date BETWEEN '2018-04-01' AND '2018-04-05'
ORDER BY
    order_date, order_id
;