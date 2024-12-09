
SELECT t.ride_date, 
       t.total_rides, 
       t.avg_distance, 
       w.DailyPrecipitation AS avg_precipitation, 
       w.DailyAverageWindSpeed AS avg_wind_speed
FROM (
    SELECT strftime('%Y-%m-%d', pickup_datetime) AS ride_date,
           COUNT(*) AS total_rides,
           AVG(trip_distance) AS avg_distance
    FROM (
        SELECT tpep_pickup_datetime AS pickup_datetime, trip_distance
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
        UNION ALL
        SELECT pickup_datetime, trip_miles AS trip_distance
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    ) AS combined_rides
    GROUP BY ride_date
) AS t
LEFT JOIN (
    SELECT DATE(DATE) AS ride_date,
           DailyPrecipitation,
           DailyAverageWindSpeed
    FROM daily_weather
) AS w ON t.ride_date = w.ride_date
ORDER BY t.total_rides DESC
LIMIT 10;


