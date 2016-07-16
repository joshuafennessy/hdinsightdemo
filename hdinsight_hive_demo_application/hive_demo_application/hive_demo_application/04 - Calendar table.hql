CREATE DATABASE IF NOT EXISTS weather;

USE weather;

CREATE EXTERNAL TABLE calendar
(
    id INT,
	date_id INT,
	actual_date	DATE,
    local_data_string STRING,
	year INT,
	month INT,
	day INT,
	month_name STRING,
	month_name_short STRING,
	weekday STRING,
    weekday_short STRING,
	day_of_week INT,
	quarter INT,
	quarter_string STRING,
	day_of_year INT,
	week_number INT,
	week_number_string STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/data/utils/calendar/';