SELECT
    animal_type,
    COUNT(*) AS count
FROM
    animal_ins
GROUP BY
    animal_type
ORDER BY
    animal_type
;

-- 윈도우 함수 버전
SELECT
    DISTINCT animal_type,
    COUNT(*) OVER (PARTITION BY animal_type) AS count
FROM
    animal_ins
ORDER BY
    animal_type
;