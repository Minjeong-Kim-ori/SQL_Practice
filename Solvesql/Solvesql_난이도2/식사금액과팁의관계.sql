SELECT 
    day,
    SUM(tip) AS tip_daily,
    SUM(total_bill) AS revenue_daily,
    ROUND(SUM(tip) / SUM(total_bill) * 100,2) AS tip_revenue_pct 
FROM
    tips
GROUP BY
    day 
ORDER BY
    tip_revenue_pct DESC
;