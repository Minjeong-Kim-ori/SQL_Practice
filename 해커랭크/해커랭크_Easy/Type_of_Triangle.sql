SELECT
    CASE
        WHEN a+b <= c OR b+c <= a OR a+c <= b THEN 'Not A Triangle'
        WHEN a=b AND b=c THEN 'Equilateral'
        WHEN a=b OR b=c OR a=c THEN 'Isosceles'
        ELSE 'Scalene'
    END 
FROM
    triangles