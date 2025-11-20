SELECT
    p.product_id,
    p.product_name,
    p.price * o.total_amount AS total_sales
FROM
    food_product AS p
JOIN
    (SELECT
        product_id,
        SUM(amount) AS total_amount
    FROM
        food_order
    WHERE
        produce_date LIKE '2022-05%'
    GROUP BY
        product_id) AS o
ON  
    p.product_id = o.product_id

ORDER BY
    total_sales DESC, product_id
;