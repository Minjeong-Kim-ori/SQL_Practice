SELECT
    b.author_id, 
    a.author_name,
    b.category,
    SUM(s.sales * b.price) AS total_sales
FROM
    book AS b
JOIN
    book_sales AS s
ON
    b.book_id = s.book_id
JOIN
    author AS a
ON
    b.author_id = a.author_id
WHERE
    s.sales_date LIKE '2022-01%'
GROUP BY
    b.author_id, a.author_name, b.category
ORDER BY
    b.author_id, b.category DESC
;