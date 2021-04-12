select if(c.country = 'Czech Republic', 'Czechia', c.country) as country,
c.capital_city ,
c.median_age_2018,
c.life_expectancy ,
c.population_density ,
e.GDP/e.population as GDP_pc,
e.gini ,
e.mortaliy_under5 ,
led.life_exp_diff ,
r.Christianity ,
r.Islam ,
r.Buddhism ,
r.Hinduism ,
r.Judaism ,
r.`Folk Religions` ,
r.`Other Religions` ,
r.`Unaffiliated Religions` 
from countries c 
join economies e 
on c.country = e.country
join t_vb_life_exp_diff led
on led.country = c.country 
join t_vb_religion r
on r.Country = c.country 
where e.`year` = 2015