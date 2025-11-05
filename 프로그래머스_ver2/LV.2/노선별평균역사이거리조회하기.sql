SELECT
    route,
    CONCAT(ROUND(SUM(d_between_dist),1),'km') AS total_distance,
    CONCAT(ROUND(AVG(d_between_dist),2),'km') AS average_distance
FROM
    subway_distance
GROUP BY
    route
ORDER BY
    ROUND(SUM(d_between_dist),1) DESC # total_distance로 하면 'km' 때문에 정렬이 제대로 안됨
;