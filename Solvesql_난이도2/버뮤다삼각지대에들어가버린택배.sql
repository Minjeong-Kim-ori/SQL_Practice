SELECT 
    DATE_FORMAT(order_delivered_carrier_date, '%Y-%m-%d') AS delivered_carrier_date,
    COUNT(*) AS orders
FROM
    olist_orders_dataset
WHERE 
    LEFT(order_delivered_carrier_date, 7) = '2017-01'
    AND
    order_delivered_carrier_date IS NOT NULL 
    AND 
    order_delivered_customer_date IS NULL
GROUP BY    
    DATE_FORMAT(order_delivered_carrier_date, '%Y-%m-%d')
ORDER BY      
    DATE_FORMAT(order_delivered_carrier_date, '%Y-%m-%d')
;