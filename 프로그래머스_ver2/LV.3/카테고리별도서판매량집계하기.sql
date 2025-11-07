SELECT DISTINCT
    b.category,
    SUM(s.sales) OVER (PARTITION BY b.category) AS total_sales
FROM
    book AS b
JOIN
    book_sales AS s
ON
    b.book_id = s.book_id
WHERE
    s.sales_date LIKE '2022-01%'
ORDER BY
    category
;