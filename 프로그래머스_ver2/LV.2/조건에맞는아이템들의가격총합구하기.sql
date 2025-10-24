SELECT
    SUM(price) AS total_price
FROM
    item_info
WHERE
    rarity = 'LEGEND'
;
