select cb.country,
cb.`date` ,
round((ct.tests_performed/c.population)*100, 2) as tests_percentage,
	CASE WHEN WEEKDAY(cb.date) IN (5, 6) THEN 1 ELSE 0 END AS weekend,
	WHEN MONTH(cb.date) BETWEEN 3 AND 5 THEN 0
	WHEN MONTH(cb.date) BETWEEN 6 AND 8 THEN 1
	WHEN MONTH(cb.date) BETWEEN 9 AND 11 THEN 2 ELSE 3 END AS season
from covid19_basic cb 
	join covid19_tests ct 
	on cb.country = ct.country
	and cb.`date` = ct.`date` 
		join countries c 
		on c.country = cb.country