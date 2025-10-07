SELECT 
    DISTINCT RIGHT(bike_id,5) AS bike_id_number
FROM
    rental_history
WHERE
    rent_station_id = '135'
ORDER BY
    bike_id_number
;