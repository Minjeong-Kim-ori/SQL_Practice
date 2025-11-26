SELECT 
    DISTINCT c1.cart_id
FROM
    cart_products AS c1
JOIN
    cart_products AS c2
ON
    c1.cart_id = c2.cart_id
WHERE
    c1.name = 'Yogurt' AND c2.name = 'Milk'
    OR 
    c1.name = 'Milk' AND c2.name = 'Yogurt'
ORDER BY
    cart_id
;

-- max() 이용 방법
SELECT
    cart_id
FROM
    cart_products
GROUP BY
    cart_id
HAVING
    MAX(name = 'Milk') = 1 AND MAX(name = 'Yogurt') = 1
ORDER BY
    cart_id
;