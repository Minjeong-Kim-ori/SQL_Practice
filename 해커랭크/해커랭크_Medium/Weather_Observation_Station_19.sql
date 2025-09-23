SELECT  
    ROUND(SQRT(POW(MIN(lat_n) - MAX(lat_n),2) + POW(MIN(long_w) - MAX(long_w),2)),4)
FROM
    station
;