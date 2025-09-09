-- 어째서 저 FROM절 서브쿼리를 WITH 구문으로 쓰면 답이 아니라고 하는거죠? 하....
-- WITH sub_table AS (
--     SELECT
--         c.company_code,
--         c.founder,
--         l.lead_manager_code,
--         s.senior_manager_code,
--         m.manager_code,
--         e.employee_code
--     FROM
--         company AS c
--     LEFT JOIN lead_manager AS l ON c.company_code = l.company_code
--     LEFT JOIN senior_manager AS s ON l.lead_manager_code = s.lead_manager_code
--     LEFT JOIN manager AS m ON s.senior_manager_code = m.senior_manager_code
--     LEFT JOIN employee AS e ON m.manager_code = e.manager_code
-- )

SELECT 
    company_code,
    founder,
    COUNT(DISTINCT lead_manager_code),
    COUNT(DISTINCT senior_manager_code),
    COUNT(DISTINCT manager_code),
    COUNT(DISTINCT employee_code)
FROM
    (
    SELECT
        c.company_code,
        c.founder,
        l.lead_manager_code,
        s.senior_manager_code,
        m.manager_code,
        e.employee_code
    FROM
        company AS c
    LEFT JOIN lead_manager AS l ON c.company_code = l.company_code
    LEFT JOIN senior_manager AS s ON l.lead_manager_code = s.lead_manager_code
    LEFT JOIN manager AS m ON s.senior_manager_code = m.senior_manager_code
    LEFT JOIN employee AS e ON m.manager_code = e.manager_code
    ) AS sub_table
GROUP BY    
    company_code, founder
ORDER BY    
    company_code
;
    