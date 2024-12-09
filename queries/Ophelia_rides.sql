
SELECT 
    t1.hour AS date_hour,
    COALESCE(t2.total_rides, 0) AS total_rides,
    COALESCE(t3.total_precipitation, 0.0) AS total_precipitation,
    COALESCE(t3.sus_wind_speed, 0.0) AS sus_wind_speed
FROM (
    SELECT DISTINCT STRFTIME('%Y-%m-%d %H:00:00', DATE) AS hour
    FROM hourly_weather
    WHERE DATE BETWEEN '2023-09-25' AND '2023-10-03'
    UNION
    SELECT DISTINCT STRFTIME('%Y-%m-%d %H:00:00', tpep_pickup_datetime) AS hour
    FROM taxi_trips
    WHERE tpep_pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03'
    UNION
    SELECT DISTINCT STRFTIME('%Y-%m-%d %H:00:00', pickup_datetime) AS hour
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03'
) AS t1
LEFT JOIN (
    SELECT 
        hour,
        COUNT(*) AS total_rides
    FROM (
        SELECT 
            STRFTIME('%Y-%m-%d %H:00:00', tpep_pickup_datetime) AS hour
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03'
        UNION ALL
        SELECT 
            STRFTIME('%Y-%m-%d %H:00:00', pickup_datetime) AS hour
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03'
    ) AS all_rides
    GROUP BY hour
) AS t2 ON t1.hour = t2.hour
LEFT JOIN (
    SELECT 
        STRFTIME('%Y-%m-%d %H:00:00', date) AS hour,
        SUM(HourlyPrecipitation) AS total_precipitation,
        AVG(HourlyWindSpeed) AS sus_wind_speed
    FROM hourly_weather
    WHERE DATE BETWEEN '2023-09-25' AND '2023-10-03'
    GROUP BY hour
) AS t3 ON t1.hour = t3.hour
ORDER BY t1.hour;

