SELECT 
    title,
    year,
    age,
    imdb,
    rotten_tomatoes
FROM
    movies
WHERE
    netflix = 1 
    AND
    year = '2020'
    AND
    (imdb >= 9.0 OR rotten_tomatoes >= 90)
;