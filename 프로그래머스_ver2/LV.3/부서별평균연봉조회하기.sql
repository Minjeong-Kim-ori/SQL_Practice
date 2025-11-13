SELECT
    d.dept_id,
    dept_name_en,
    ROUND(AVG(sal)) AS avg_sal
FROM
    hr_department AS d
JOIN
    hr_employees AS e 
ON
    d.dept_id = e.dept_id
GROUP BY
    d.dept_id
ORDER BY
    avg_sal DESC
;