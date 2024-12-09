
SELECT t.ride_date, 
       t.total_rides, 
       w.DailySnowfall
FROM(
    SELECT strftime('%Y-%m-%d', pickup_datetime) AS ride_date,
           COUNT(*) AS total_rides
    FROM (
        SELECT tpep_pickup_datetime AS pickup_datetime
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2020-01-01' AND '2024-8-31'
        UNION ALL
        SELECT pickup_datetime
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2020-01-01' AND '2024-8-31'
    ) AS combined_rides
    GROUP BY ride_date
) AS t
LEFT JOIN (
    SELECT DATE(DATE) AS ride_date,
           DailySnowfall
    FROM daily_weather
) AS w ON t.ride_date = w.ride_date
ORDER BY w.DailySnowfall DESC
LIMIT 10;
