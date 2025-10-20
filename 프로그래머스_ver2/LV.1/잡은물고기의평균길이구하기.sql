SELECT
    ROUND(AVG(IFNULL(length,10)),2) AS average_length
FROM
    fish_info
;