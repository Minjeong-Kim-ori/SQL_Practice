SELECT
    COUNT(DISTINCT primary_breed) AS primary_breed_cnts
FROM
    seattle_pet_licenses
WHERE
    species = 'Dog'
;