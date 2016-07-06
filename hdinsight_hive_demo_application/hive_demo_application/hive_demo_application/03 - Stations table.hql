USE weather;

--create an external table
--this data is in fixed width format

CREATE EXTERNAL TABLE IF NOT EXISTS stations_raw_format
(
    station_data VARCHAR(5000)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\0' STORED AS TEXTFILE
LOCATION '/data/weather/stations/';

--because this data is stored in fixed width format, we'll need to manually translate it to columns
CREATE TABLE IF NOT EXISTS stations STORED AS ORC
AS
SELECT 
    ltrim(rtrim(substring(station_data, 1, 11))) as station_id,
    ltrim(rtrim(substring(station_data, 13, 8))) as station_latitude,
    ltrim(rtrim(substring(station_data, 22, 9))) as station_longitude,
    ltrim(rtrim(substring(station_data, 32, 6))) as station_elevation,
    ltrim(rtrim(substring(station_data, 39, 2))) as station_state,
    ltrim(rtrim(substring(station_data, 42, 30))) as station_name,
    ltrim(rtrim(substring(station_data, 73, 3))) as station_gsn_flag,
    ltrim(rtrim(substring(station_data, 77, 3))) as station_hcn_crn_flag,
    ltrim(rtrim(substring(station_data, 81, 5))) as station_wmo_id
FROM stations_raw_format;