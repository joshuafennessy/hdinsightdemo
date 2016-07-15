USE weather;

DROP TABLE IF EXISTS stations_raw_format;

CREATE EXTERNAL TABLE IF NOT EXISTS stations_raw_format(
                station_id STRING,
                station_latitude STRING,
                station_longitude STRING,
                station_elevation STRING,
                station_state STRING,
                station_name STRING,
                station_gsn_flag STRING,
                station_hcn_crn_flag STRING,
                station_wmo_id STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES ("input.regex" = "(.{11})(.{10})(.{10})(.{6})(.{2})(.{30})(.{3})(.{3})(.{5}).*")
LOCATION '/data/weather/stations';
