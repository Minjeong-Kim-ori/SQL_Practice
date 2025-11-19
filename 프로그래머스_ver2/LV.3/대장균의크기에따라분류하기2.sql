SELECT
    id,
    CASE
        WHEN colony_percent <= 0.25 THEN 'CRITICAL'
        WHEN colony_percent <= 0.5 THEN 'HIGH'
        WHEN colony_percent <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS colony_name
FROM (SELECT
          id,
          size_of_colony,
          PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) AS colony_percent
      FROM
          ecoli_data) AS percent_table
ORDER BY
    id 
;
  