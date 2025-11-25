SELECT
    YEAR(sales_date) AS YEAR,
    MONTH(sales_date) AS MONTH,
    u.gender AS GENDER,
    COUNT(DISTINCT u.user_id) AS USERS
FROM
    online_sale AS o
JOIN
    user_info AS u
ON 
    o.user_id = u.user_id
WHERE
    u.gender IS NOT NULL
GROUP BY
    YEAR(sales_date), MONTH(sales_date), u.gender
ORDER BY
    YEAR, MONTH, GENDER
;