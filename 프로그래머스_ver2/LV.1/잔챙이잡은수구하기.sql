SELECT 
    COUNT(*) AS fish_count
FROM
    fish_info
WHERE 
    length IS NULL
;