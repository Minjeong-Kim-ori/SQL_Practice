WITH mem_review_cnt AS (
SELECT
    member_id,
    COUNT(*) AS review_cnt 
FROM
    rest_review
GROUP BY
    member_id)
    
SELECT
    p.member_name,
    r.review_text,
    DATE_FORMAT(r.review_date,'%Y-%m-%d') AS review_date
FROM
    mem_review_cnt AS rc
JOIN
    rest_review AS r
ON
    rc.member_id = r.member_id
JOIN
    member_profile AS p
ON
    r.member_id = p.member_id
WHERE
    review_cnt = (SELECT MAX(review_cnt) FROM mem_review_cnt)
ORDER BY    
    review_date, r.review_text
;