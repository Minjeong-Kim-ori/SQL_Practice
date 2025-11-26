SELECT
    h.flavor
FROM
    first_half AS h
JOIN
    july AS j
ON
    h.flavor = j.flavor
GROUP BY
    h.flavor
ORDER BY
    SUM(h.total_order + j.total_order) DESC
LIMIT 3
;