SELECT
    artwork_id,
    title,
    classification,
    acquisition_date
FROM
    artworks
WHERE
    YEAR(acquisition_date) = '2005'
    AND
    credit IS NULL
;