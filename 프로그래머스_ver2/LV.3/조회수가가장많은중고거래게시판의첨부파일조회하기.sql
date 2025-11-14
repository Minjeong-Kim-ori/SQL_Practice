SELECT
    CONCAT('/home/grep/src/', b.board_id,'/', file_id, file_name, file_ext) AS file_path
FROM
    used_goods_board AS b
JOIN
    used_goods_file AS f
ON
    b.board_id = f.board_id
WHERE
    b.views IN (SELECT MAX(views) FROM used_goods_board)
ORDER BY
    file_id DESC
;