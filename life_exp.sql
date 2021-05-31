SELECT IF (a.country = 'Czech Republic', 'Czechia', a.country) AS country,
    	   round(b.life_exp_2015 - a.life_exp_1965, 2) AS life_exp_diff
FROM (
    SELECT le.country , le.life_expectancy AS life_exp_1965
    FROM life_expectancy le 
    WHERE year = 1965
    ) a 
    	JOIN (
    		SELECT le.country , le.life_expectancy AS life_exp_2015
    		FROM life_expectancy le 
    		WHERE year = 2015
    		) b
    		ON a.country = b.country