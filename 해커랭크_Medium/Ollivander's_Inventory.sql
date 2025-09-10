SELECT
    w.id,
    p.age,
    w.coins_needed,
    w.power
FROM
    wands AS w
JOIN
    wands_property AS p
ON w.code = p.code
JOIN (SELECT 
          wp.age,
          w.power,
          MIN(w.coins_needed) AS min_coins
      FROM
          wands AS w
      JOIN
          wands_property AS wp 
      USING(code)
      WHERE
          wp.is_evil = 0 
      GROUP BY
          wp.age, w.power) AS m
ON p.age = m.age
AND w.power = m.power
AND w.coins_needed = m.min_coins
WHERE
    p.is_evil = 0
ORDER BY
    w.power DESC, p.age DESC
;
