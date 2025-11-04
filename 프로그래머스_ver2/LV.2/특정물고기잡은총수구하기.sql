SELECT
    COUNT(*) AS fish_count
FROM
    (SELECT
         i.fish_type,
         n.fish_name
     FROM
        fish_info AS i
     JOIN
        fish_name_info AS n
     ON
        i.fish_type = n.fish_type) AS j
WHERE
    j.fish_name IN ('BASS','SNAPPER')
;