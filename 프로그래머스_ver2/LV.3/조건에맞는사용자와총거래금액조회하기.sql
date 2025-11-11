SELECT
    user_id,
    nickname,
    SUM(price) AS total_sales
FROM
    used_goods_user AS u
JOIN
    used_goods_board AS b
ON
    u.user_id = b.writer_id
WHERE
    b.status = 'DONE'
GROUP BY
    user_id, nickname
HAVING
    SUM(price) >= 700000
ORDER BY
    total_sales
;