SELECT 
    classification,
    SUM(CASE WHEN YEAR(acquisition_date) = 2014 THEN 1 ELSE 0 END) AS '2014',
    SUM(CASE WHEN YEAR(acquisition_date) = 2015 THEN 1 ELSE 0 END) AS '2015',
    SUM(CASE WHEN YEAR(acquisition_date) = 2016 THEN 1 ELSE 0 END) AS '2016' -- mysql은 피벗 기능 없음. case when으로 구현 
FROM
    artworks
GROUP BY
    classification
HAVING
    SUM(CASE WHEN YEAR(acquisition_date) <= 2013 OR acquisition_date IS NULL THEN 1 ELSE 0 END) > 0
    OR
    SUM(CASE WHEN YEAR(acquisition_date) BETWEEN 2014 AND 2016 THEN 1 ELSE 0 END) > 0
ORDER BY
    classification
;