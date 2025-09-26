SELECT
    customer_id,
    last_order_date,
    cnt_orders,
    sum_sales,
    IF(last_order_date >= '2020-12-01', 'recent','past') AS recency,
    IF(cnt_orders >= 3, 'high','low') AS frequency,
    IF(sum_sales >= 500, 'high','low') AS monetary
FROM
    customer_stats
;