SELECT 
    e.employee_id,
    e.name,
    e.manager_id,
    m.name AS manager_name
FROM 
    employees AS e 
JOIN 
    employees AS m 
ON e.manager_id = m.employee_id
ORDER BY
    e.employee_id
;