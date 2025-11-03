SELECT 
    aqi_category,
    COUNT(*) AS total_records,
	ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS "percentage (%)"
FROM air_quality
GROUP BY aqi_category
ORDER BY total_records DESC;
