SELECT
    LEFT(product_code,2) AS category,
    COUNT(*) AS products
FROM
    product
GROUP BY
    LEFT(product_code,2)
ORDER BY
    category
;

## window function version
SELECT
    DISTINCT LEFT(product_code,2) AS category,
    COUNT(*) OVER (PARTITION BY LEFT(product_code,2)) AS products
FROM
    product
ORDER BY
    category
;