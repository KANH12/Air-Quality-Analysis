WITH avg_values AS (
    SELECT 
        ROUND(AVG(co_aqi_value), 2) AS co,
        ROUND(AVG(no2_aqi_value), 2) AS no2,
        ROUND(AVG(ozone_aqi_value), 2) AS ozone,
        ROUND(AVG("pm2.5_aqi_value"), 2) AS pm25
    FROM air_quality
),
total AS (
    SELECT (co + no2 + ozone + pm25) AS total_pollutant
    FROM avg_values
)
SELECT 'CO' AS pollutant, 
       ROUND(co / total_pollutant * 100, 2) AS percent
FROM avg_values, total
UNION ALL
SELECT 'NO2', 
       ROUND(no2 / total_pollutant * 100, 2)
FROM avg_values, total
UNION ALL
SELECT 'Ozone', 
       ROUND(ozone / total_pollutant * 100, 2)
FROM avg_values, total
UNION ALL
SELECT 'PM2.5', 
       ROUND(pm25 / total_pollutant * 100, 2)
FROM avg_values, total
ORDER BY percent DESC;
