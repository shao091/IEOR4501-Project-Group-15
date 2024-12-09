
SELECT 
    strftime('%H', tpep_pickup_datetime) AS hour,
    COUNT(*) AS ride_count
FROM taxi_trips
WHERE tpep_pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
GROUP BY hour
ORDER BY ride_count DESC;
