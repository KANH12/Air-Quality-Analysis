WITH country_avg AS (
    SELECT 
        country_name,
        ROUND(AVG(co_aqi_value), 2) AS co,
        ROUND(AVG(no2_aqi_value), 2) AS no2,
        ROUND(AVG(ozone_aqi_value), 2) AS ozone,
        ROUND(AVG("pm2.5_aqi_value"), 2) AS pm25
    FROM air_quality
    GROUP BY country_name
),
country_total AS (
    SELECT 
        country_name,
        (co + no2 + ozone + pm25) AS total_pollutant
    FROM country_avg
)
SELECT country_name, 'CO' AS pollutant,
       ROUND(co / total_pollutant * 100, 2) AS percent
FROM country_avg
JOIN country_total USING (country_name)

UNION ALL

SELECT country_name, 'NO2',
       ROUND(no2 / total_pollutant * 100, 2)
FROM country_avg
JOIN country_total USING (country_name)

UNION ALL

SELECT country_name, 'Ozone',
       ROUND(ozone / total_pollutant * 100, 2)
FROM country_avg
JOIN country_total USING (country_name)

UNION ALL

SELECT country_name, 'PM2.5',
       ROUND(pm25 / total_pollutant * 100, 2)
FROM country_avg
JOIN country_total USING (country_name)

ORDER BY country_name, percent DESC;
