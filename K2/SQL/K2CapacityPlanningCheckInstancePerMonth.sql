--Number of instances used over a monthly basis
--More details: https://johnnyk2com.wordpress.com/2015/08/11/how-do-you-plan-for-k2-database-sizing-for-performance/
USE K2
SELECT YEAR(StartDate) AS [Year], MONTH(StartDate) AS [Month], COUNT(MONTH(StartDate)) AS Instances 
FROM ServerLog.ProcInst GROUP BY YEAR(StartDate), MONTH(StartDate) ORDER BY YEAR(StartDate), MONTH(StartDate)
