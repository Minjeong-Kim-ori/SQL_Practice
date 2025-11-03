SELECT
    i.item_id,
    i.item_name
FROM
    item_info AS i
JOIN
    item_tree AS t
ON
    i.item_id = t.item_id
WHERE
    t.parent_item_id IS NULL
ORDER BY
    i.item_id
;