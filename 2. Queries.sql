select *
from road
--------------------------------------------------
--1. Which times of the year see the most road incidents?--
SELECT 
    month, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    month
ORDER BY 
    incident_count DESC;

---------------------------------------------------------
--2. What are the peak hours for road incidents
--and how can traffic management be improved during these times?
SELECT 
    hour, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    hour
ORDER BY 
    incident_count DESC;

-------------------------------------------------------------

--3. Which geographic locations cities are most prone to accidents

SELECT 
    city, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    city
ORDER BY 
    incident_count DESC
LIMIT 15;
-------------------------------------------------------
--4. How do weather conditions impact road safety--
SELECT 
    weather_condition, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    weather_condition
ORDER BY 
    incident_count DESC;

---------------------------------------------------------
--5. What types of road features (e.g., traffic signals, junctions)
--are linked to higher accident rates
--and how can these be redesigned to improve safety?
SELECT 
    junction, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    junction
ORDER BY 
    incident_count DESC;
-----------------------------
SELECT 
    traffic_signal, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    traffic_signal
ORDER BY 
    incident_count DESC;

--------------------------------------------------------
--6. What role do human factors (e.g., fatigue, distraction) play in causing accidents
--and how can awareness and enforcement efforts be improved?
SELECT 
    hour, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    hour >= 22 OR hour <= 5
GROUP BY 
    hour
ORDER BY 
    incident_count DESC;
-------------------------------------------------------------------
--7. How do traffic-calming measures (e.g., speed bumps, reduced speed zones) 
--affect accident rates and where can these be effectively implemented?
SELECT 
    traffic_calming, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    traffic_calming = 'True'
GROUP BY 
    traffic_calming;
---------------------------------------------------------------------
--8. How do holidays or special events affect road safety
--and how can incidents during these periods be reduced?

SELECT 
    day_name, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month = 12  -- For December holidays, adjust as needed for other months
GROUP BY 
    day_name
ORDER BY 
    incident_count DESC;
-------------------------------------------------
SELECT 
    day_name, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    day_name IN ('Saturday', 'Sunday')  
GROUP BY 
    day_name
ORDER BY 
    incident_count DESC;
-------------------------------------------------------------
--9. What is the long-term trend in road safety across the years
--and are the implemented measures improving safety over time?
SELECT 
    year, 
    COUNT(*) AS incident_count,
    AVG(severity) AS avg_severity
FROM 
    road
GROUP BY 
    year
ORDER BY 
    year;


------------------------------------------------------------------------
--10.Knowing if there is a link between a certain time
--weather condition and a certain place
--that increases the likelihood of serious accidents
SELECT 
    weather_condition, 
    hour, 
    state,
	COUNT(*) AS incident_count
FROM 
    road
WHERE 
    severity = 4 -- تحليل فقط للحوادث الخطيرة
GROUP BY 
    weather_condition, hour, state
ORDER BY 
    incident_count DESC;
---------------------------------------------------------------
--11.Social Events Impact--
SELECT 
    day_name, 
    month, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    (month = 10 AND day = 31) OR (month = 11 AND day = 25) -- مثال لحساب حوادث يوم Halloween أو Thanksgiving
GROUP BY 
    day_name, month
ORDER BY 
    incident_count DESC;
--------------------------------------------------------------------
--12.Seasonal Trend Analysis--
SELECT 
    season, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    season
ORDER BY 
    incident_count DESC;

------------------------------------------------------------------

--13.Infrastructure Analysis--
SELECT 
    crossing, 
    junction, 
    railway, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    severity IN (3, 4) -- تحليل الحوادث الخطيرة فقط
GROUP BY 
    crossing, junction, railway
ORDER BY 
    incident_count DESC;
---------------------------------------------------------
--14.Analysis of areas with "hot spots" of accidents
SELECT 
    street, 
    city, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    street, city
HAVING 
    COUNT(*) > 100 -- اعتبر أي شارع به أكثر من 100 حادث كنقطة ساخنة
ORDER BY 
    incident_count DESC;

--------------------------------------------------------------
--15.Analysis of the impact of geographical elements such as highs and lows--
SELECT 
    city, 
    description, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    description LIKE '%hill%' -- تحليل الحوادث في المناطق المرتفعة
GROUP BY 
    city, description
ORDER BY 
    incident_count DESC;
-------------------------------------------------------------------
--------------//////////////////////////////////_______________
-----------------------Street-----------------------------------
--------------//////////////////////////////////_______________

--1.Top Streets with Most Incidents--
SELECT 
    street, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    street
ORDER BY 
    incident_count DESC
LIMIT 10;
----------------------------------------------------
--2.Incidents by Time on Streets--
SELECT 
    street, 
    hour, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    street, hour
ORDER BY 
    incident_count DESC
LIMIT 10;
----------------------------------------------------
--3.Streets and Weather Conditions--
SELECT 
    street, 
    weather_condition, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    street, weather_condition
ORDER BY 
    incident_count DESC
LIMIT 10;
-----------------------------------------------------
--4.Seasonal Trends on Streets--
SELECT 
    street, 
    season, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    street, season
ORDER BY 
    incident_count DESC
LIMIT 10;
-------------------------------------------------------
--5.Traffic Calming Measures Impact--
SELECT 
    street, 
    traffic_calming, 
    COUNT(*) AS incident_count
FROM 
    road
GROUP BY 
    street, traffic_calming
ORDER BY 
    incident_count DESC
LIMIT 10;
-------------------------------------------------------------
--6.Intersection Impact on Streets
SELECT 
    street, 
    junction, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    junction IS NOT NULL
GROUP BY 
    street, junction
ORDER BY 
    incident_count DESC
LIMIT 10;
--------------------------------------------------------
--7.Severity Analysis by Street--
SELECT 
    street, 
	city,
    severity, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    severity = 4 -- الحوادث الشديدة فقط
GROUP BY 
    street,city, severity
ORDER BY 
    incident_count DESC
LIMIT 100;



------------------------------------------------------------------------
--------------//////////////////////////////////_______________
--we found that October was the most month have incident--
--------------//////////////////////////////////_______________

--1. How do weather conditions change from September to November
--and do they influence the incident trend?


SELECT 
    month, 
    weather_condition, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month IN (9, 10, 11)
GROUP BY 
    month, weather_condition
ORDER BY 
    month, incident_count DESC;
-------------------------------------------------
--2. Does the time of day or peak hours shift between these months?
SELECT 
    month, 
    hour, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month IN (9, 10, 11)
GROUP BY 
    month, hour
ORDER BY 
    month, incident_count DESC;

------------------------------------------------------
--3. Which cities or states experience the largest fluctuation
--in incidents across these three months?
SELECT 
    state, 
    city, 
    SUM(CASE WHEN month = 9 THEN 1 ELSE 0 END) AS september_incidents,
    SUM(CASE WHEN month = 10 THEN 1 ELSE 0 END) AS october_incidents,
    SUM(CASE WHEN month = 11 THEN 1 ELSE 0 END) AS november_incidents,
    (SUM(CASE WHEN month = 10 THEN 1 ELSE 0 END) - SUM(CASE WHEN month = 9 THEN 1 ELSE 0 END)) AS sept_to_oct_increase,
    (SUM(CASE WHEN month = 10 THEN 1 ELSE 0 END) - SUM(CASE WHEN month = 11 THEN 1 ELSE 0 END)) AS oct_to_nov_decrease
FROM 
    road
GROUP BY 
    state, city
ORDER BY 
    sept_to_oct_increase DESC, oct_to_nov_decrease DESC;
------------------------------------------------------------------------
--4. Are specific road features more prone to incidents during this period
--and do they vary from month to month?

SELECT 
    month, 
    junction, 
    roundabout, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month IN (9, 10, 11)
GROUP BY 
    month, junction, roundabout
ORDER BY 
    month, incident_count DESC;
----------------------------------------------------------------
--5. Does the severity
--of incidents change in November compared to September and October?
SELECT 
    month, 
    AVG(severity) AS avg_severity
FROM 
    road
WHERE 
    month IN (9, 10, 11)
GROUP BY 
    month
ORDER BY 
    month;
----------------------------------------------------------------
--6. What role does traffic during holidays or events play in the spike in incidents
--in October and the decline in November?

SELECT 
    month, 
    day_name, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month IN (9, 10, 11)
    AND day_name IN ('Saturday', 'Sunday')
GROUP BY 
    month, day_name
ORDER BY 
    month, incident_count DESC;
-----------------------------------------------------------
--7. Are incidents more likely to happen during weekends across these months
--and does that affect the trend?

SELECT 
    month, 
    day_name, 
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month IN (9, 10, 11)
GROUP BY 
    month, day_name
ORDER BY 
    month, incident_count DESC;
	
-----------------------------------------------------------------------
--8. How do incidents in daylight versus nighttime hours change across these months?
SELECT 
    month, 
    CASE 
        WHEN hour BETWEEN 6 AND 18 THEN 'Day'
        ELSE 'Night'
    END AS time_period,
    COUNT(*) AS incident_count
FROM 
    road
WHERE 
    month IN (9, 10, 11)
GROUP BY 
    month, time_period
ORDER BY 
    month, incident_count DESC;
-------------------------------------------------------------------------




