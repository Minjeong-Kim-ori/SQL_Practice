SELECT
    item_id,
    item_name,
    rarity
FROM
    item_info
WHERE
    item_id NOT IN (SELECT DISTINCT parent_item_id FROM item_tree WHERE parent_item_id IS NOT NULL)
ORDER BY
    item_id DESC
;