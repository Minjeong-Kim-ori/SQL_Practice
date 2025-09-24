SELECT 
    DATE_FORMAT(event_timestamp_kst,'%Y-%m-%d') AS dt,
    COUNT(DISTINCT user_pseudo_id) AS users
FROM
    ga
WHERE
    DATE_FORMAT(event_timestamp_kst,'%Y-%m-%d') BETWEEN '2021-08-02' AND '2021-08-09'
GROUP BY
    DATE_FORMAT(event_timestamp_kst,'%Y-%m-%d')
ORDER BY
    dt 
;