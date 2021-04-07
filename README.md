# Engeto_SQL
Engeto SQL project

Dobrý den,
vytvořil jsem tabulku s požadovanými údaji. Tabulka se jmenuje t_vladimir_bartunek_projekt_SQL_final.
Skript, který vedl k výsledné tabulce najdete na konci tohoto emailu.
Tabulka obsahuje denní počty nakažených v jednotlivých zemích za období od 21.6.2020 do 20.12.2020.
Z důvodu chybějících hodnot v databázi, máme u některých zemí neúplné informace, a to:
1. Chybí meteorologické údaje u zemí, které leží mimo Evropu.
2. Chybí ekonomické a náboženské údaje u Ruska, US a některých menších zemí. U Ruska a US jsem nejzákladnější hodnoty doplnil
z externích zdrojů.
3. Dále také chybí gini koeficient u více než poloviny zemí.
S pozdravem, Vladimír Bartůněk

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
        left join t_vb_sql_dates2 b
        on b.country = cbd.country
        and b.`date` = cbd.`date` 
           where cbd.`date` between '2020-06-21' and '2020-12-20'
            order by cbd.`date`
