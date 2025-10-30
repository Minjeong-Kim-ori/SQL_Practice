-- 정답 처리된 거
SELECT
    COUNT(i.id) AS fish_count,
    n.fish_name
FROM
    fish_info AS i
JOIN
    fish_name_info AS n
ON
    i.fish_type = n.fish_type
GROUP BY
    n.fish_name
ORDER BY
    fish_count DESC
;

-- 이건 왜 안될까...?
SELECT
    c.fish_count,
    n.fish_name
FROM
    fish_name_info AS n
JOIN (SELECT
          fish_type,
          COUNT(id) AS fish_count
      FROM
          fish_info
      GROUP BY
          fish_type
      ) AS c
ON 
    n.fish_type = c.fish_type
ORDER BY
    c.fish_count DESC
;