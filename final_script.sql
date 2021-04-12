select 
cbd.country,
cbd.`date` ,
cbd.confirmed,
a.calculated_gdp ,
a.life_exp_diff ,
a.median_age_2018 ,
a.mortaliy_under5 ,
a.population_density ,
a.gini ,
a.Buddhism ,
a.Christianity ,
a.Folk_Religions ,
a.Hinduism ,
a.Islam ,
a.Judaism ,
a.Other_Religions ,
a.Unaffiliated_Religions ,
c.avg_temp ,
c.max_wind ,
c.no_zero_rain,
b.season ,
b.weekend ,
b.tests_percentage 
  from covid19_basic_differences cbd 
    left join t_vb_sql_countries a
    on a.country = cbd.country 
      left outer join t_vb_sql_weather c
      on cbd.`date` = c.`date` 
      and cbd.country = c.country
        left join t_vb_sql_dates b
        on b.country = cbd.country
        and b.`date` = cbd.`date` 
           where cbd.`date` between '2020-07-01' and '2020-07-31'
            order by cbd.`date`