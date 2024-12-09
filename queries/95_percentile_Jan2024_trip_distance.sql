
SELECT trip_distance
FROM (
    SELECT trip_distance
    FROM (
        SELECT trip_distance
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
        UNION ALL
        SELECT trip_miles AS trip_distance
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    ) AS combined_trips
    ORDER BY trip_distance
) AS sorted_trips
LIMIT 1 OFFSET (
    SELECT CAST(COUNT(*) * 0.95 AS INTEGER) - 1
    FROM (
        SELECT trip_distance
        FROM taxi_trips
        WHERE tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
        UNION ALL
        SELECT trip_miles AS trip_distance
        FROM uber_trips
        WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    ) AS combined_trips_for_count
);

