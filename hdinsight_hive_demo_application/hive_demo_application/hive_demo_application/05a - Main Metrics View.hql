CREATE DATABASE IF NOT EXISTS weather;

USE weather;

CREATE VIEW weather_daily_main_metrics
AS

SELECT 
	station_id,
	year_month_date,
	element,
	data_value,	
	obs_time
FROM	
	weather.daily_raw_format
WHERE	
	element IN 
		('PRCP', 'SNOW', 'SNWD', 'TMAX', 'TMIN')
AND	
	q_flag = '';