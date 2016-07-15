--the daily weather data is comma seperated format
--Hive handles that really well.  
--Let's create a table that can read those files.
CREATE DATABASE IF NOT EXISTS weather;

USE weather;

DROP TABLE IF EXISTS daily_raw_format;

CREATE EXTERNAL TABLE IF NOT EXISTS daily_raw_format
(
    station_id STRING,
    year_month_date INT,
    element STRING,
    data_value STRING,
    m_flag STRING,
    q_flag STRING,
    s_flag STRING,
    obs_time STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'wasb://hdi@jfennessytraining.blob.core.windows.net/data/weather/daily/';