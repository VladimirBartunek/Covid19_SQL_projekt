select 
cbd.country,
cbd.`date` ,
cbd.confirmed,
c.calculated_gdp ,
c.life_exp_diff ,
c.median_age_2018 ,
c.mortaliy_under5 ,
c.population_density ,
c.gini ,
c.Buddhism ,
c.Christianity ,
c.Folk_Religions ,
c.Hinduism ,
c.Islam ,
c.Judaism ,
c.Other_Religions ,
c.Unaffiliated_Religions ,
w.avg_temp ,
w.max_wind ,
w.no_zero_rain,
d.season ,
d.weekend ,
d.tests_percentage 
  from covid19_basic_differences cbd 
    left join t_vb_sql_countries c
    on c.country = cbd.country 
      left outer join t_vb_sql_weather w
      on cbd.`date` = w.`date` 
      and cbd.country = w.country
        left join t_vb_sql_dates d
        on d.country = cbd.country
        and d.`date` = cbd.`date` 
           where cbd.`date` between '2020-07-01' and '2020-07-31'
            order by cbd.`date`