select if(w.city = 'Prague', 'Praha', w.city) as city,
w.`date`,
avg(case when w.`hour`>=7&&`hour`<=21 then temp end) avg_temp,
sum(case when w.rain != 0 then 3 else 0 end) rainfall_hours,
max(wind) max_wind
	from weather w 
		where w.`date` between '2020-07-01' and '2020-07-31'
		group by w.city, w.`date`