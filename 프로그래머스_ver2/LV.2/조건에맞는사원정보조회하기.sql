-- 코드를 작성해주세요
SELECT
    SUM(g.score) AS score,
    e.emp_no,
    e.emp_name,
    e.position,
    e.email
FROM
    hr_employees AS e
JOIN
    hr_grade AS g
ON
    e.emp_no = g.emp_no
WHERE
    g.year = '2022'
GROUP BY
    e.emp_no
ORDER BY
    score DESC
LIMIT 1
;
    
