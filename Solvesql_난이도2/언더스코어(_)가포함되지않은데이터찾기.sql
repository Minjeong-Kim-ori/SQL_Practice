SELECT 
    DISTINCT page_location
FROM
    ga
WHERE
    page_location NOT LIKE '%\_%' -- %_% : 임의의 한글자, \ : 이스케이프 문자 써줘야함
ORDER BY
    page_location
;