SELECT
    title,
    genres,
    language,
    netflix,
    runtime,
    imdb
FROM
    movies
WHERE 
    runtime < 5 
    AND
    LEFT(title,1) NOT IN ('A','E','I','O','U')
;