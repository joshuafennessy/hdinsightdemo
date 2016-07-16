CREATE DATABASE IF NOT EXISTS weather;

USE weather;

CREATE TABLE daily_metrics STORED AS ORC
AS
SELECT 
	d.station_id,
	d.year_month_date,
	d.element,
	d.data_value,
	d.obs_time,
	c.actual_date,
	c.year,
	c.month,
	c.month_name_short,
	c.month_name_short + ’ ‘ + CAST(c.year as STRING) as month_year
FROM
	weather_daily_main_metrics d
JOIN
	calendar c
ON
	d.year_month_date = c.date_id
