-- item_info에서 희귀도 rare인 item_id 추출
-- 해당 item_id를 item_tree의 parent_item_id에서 찾아서 그것의 item_id를 추출
-- 그 item_id의 id, name, rarity를 item_info에서 추출

SELECT
    item_id,
    item_name,
    rarity
FROM
    item_info
WHERE
    item_id IN (
                SELECT
                    item_id
                FROM
                    item_tree
                WHERE
                    parent_item_id IN (SELECT item_id FROM item_info WHERE rarity = 'RARE'))
ORDER BY
    item_id DESC
;

-- 더 간결한 풀이
SELECT
    i.item_id,
    item_name,
    rarity
FROM
    item_info AS i
JOIN
    item_tree AS t
ON 
    i.item_id = t.item_id
WHERE
    t.parent_item_id IN (SELECT item_id FROM item_info WHERE rarity = 'RARE')
ORDER BY
    i.item_id DESC
;