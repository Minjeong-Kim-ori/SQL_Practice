SELECT  
    f1.x, f1.y
FROM 
    functions AS f1 
JOIN
    functions AS f2
ON f1.x = f2.y AND f1.y = f2.x
WHERE
    f1.x <= f1.y
GROUP BY 
    f1.x, f1.y
HAVING 
    COUNT(*) > 1 OR f1.x <> f1.y -- self join할 때 (20,20)과 같이 자기자신 쌍이 1개만 있었던 경우는 뻥튀기 됨. (x,x)쌍은 최소 2개 있어야 출력되도록!
ORDER BY
    f1.x
;
