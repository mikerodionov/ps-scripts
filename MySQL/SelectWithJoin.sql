SELECT 
 vehicle_type.vtype AS 'Vehicle Type',
 AVG(a.accident_severity) AS 'Average Severity',
 COUNT(a.accident_severity) AS 'Number of Accidents'
FROM accidents_2015 AS a
JOIN vehicles_2015 ON a.accident_index = vehicles_2015.accident_index
JOIN vehicle_type ON vehicles_2015.vehicle_type = vehicle_type.vcode
WHERE vehicle_type.vtype LIKE '%motorcycle%'
GROUP BY vehicle_type.vtype;