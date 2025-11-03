SELECT 'PM2.5' AS pollutant, country_name, city_name
FROM air_quality
WHERE "pm2.5_aqi_value" IS NOT NULL and "pm2.5_aqi_value" > 0

UNION ALL

SELECT 'Ozone', country_name,city_name 
FROM air_quality
WHERE ozone_aqi_value IS NOT NULL and ozone_aqi_value > 0

UNION ALL

SELECT 'NO2', country_name,city_name
FROM air_quality
WHERE no2_aqi_value IS NOT NULL and no2_aqi_value > 0

UNION ALL

SELECT 'CO', country_name, city_name
FROM air_quality
WHERE co_aqi_value IS NOT NULL and co_aqi_value > 0


