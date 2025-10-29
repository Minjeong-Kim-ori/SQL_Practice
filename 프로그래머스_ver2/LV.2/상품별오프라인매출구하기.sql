SELECT
    product_code,
    SUM(price * sales_amount) AS sales
FROM
    product AS p
JOIN
    offline_sale AS o
ON 
    p.product_id = o.product_id
GROUP BY
    product_code
ORDER BY
    sales DESC, product_code
;