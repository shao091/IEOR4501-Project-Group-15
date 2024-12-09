
CREATE TABLE IF NOT EXISTS hourly_weather (
    id INTEGER PRIMARY KEY,
    DATE DATETIME,
    hourly_precipitation FLOAT,
    hourly_wind_speed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather (
    id INTEGER PRIMARY KEY,
    date DATETIME,
    daily_precipitation FLOAT,
    daily_wind_speed FLOAT,
    snowfall FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    trip_id INTEGER PRIMARY KEY,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    trip_distance FLOAT,
    fare_amount FLOAT,
    tip_amount FLOAT,
    total_amount FLOAT,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT
);

CREATE TABLE IF NOT EXISTS uber_trips (
    id INTEGER PRIMARY KEY,
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT,
    trip_miles FLOAT,
    fare_amount FLOAT,
    tolls_amount FLOAT,
    bcf FLOAT,
    sales_tax FLOAT,
    tip_amount FLOAT,
    airport_fee FLOAT,
    congestion_surcharge FLOAT
);
