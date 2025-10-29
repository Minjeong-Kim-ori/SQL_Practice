SELECT
    ingredient_type,
    SUM(total_order) AS total_order
FROM
    first_half AS f
JOIN
    icecream_info AS i
ON
    f.flavor = i.flavor
GROUP BY
    ingredient_type
ORDER BY
    total_order
;

-- 윈도우 함수 버전
SELECT
    DISTINCT ingredient_type,
    SUM(total_order) OVER (PARTITION BY ingredient_type) AS total_order
FROM
    first_half AS f
JOIN
    icecream_info AS i
ON
    f.flavor = i.flavor
ORDER BY
    total_order
;