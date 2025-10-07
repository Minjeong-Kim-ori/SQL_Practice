SELECT 
    object_number,
    title,
    medium,
    acquisition_date,
    department
FROM 
    artworks 
WHERE 
    LOWER(medium) LIKE '%pastel%' -- medium : 대소문자 구분하는 컬럼
    OR LOWER(medium) LIKE '%crayon%'
ORDER BY
    acquisition_date DESC 
;
