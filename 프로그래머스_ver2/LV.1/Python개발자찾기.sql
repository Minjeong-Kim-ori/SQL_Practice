SELECT
    id, 
    email,
    first_name,
    last_name
FROM
    developer_infos
WHERE
    skill_1 = 'Python' OR skill_2 = 'Python' OR skill_3 = 'Python'
-- WHERE
--    'Python' IN (skill_1,skill_2,skill_3) : column IN (value1, value2, value3) 말고 반대도 가능함!!! 
ORDER BY
    id 
;