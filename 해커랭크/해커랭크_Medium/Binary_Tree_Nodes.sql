SELECT
    n,
    CASE
        WHEN p IS NULL THEN 'Root'
        WHEN n IN (SELECT p FROM bst WHERE p IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS 'node type'
FROM
    bst
ORDER BY    
    n
;
