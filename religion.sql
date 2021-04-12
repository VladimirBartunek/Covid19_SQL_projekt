create table t_vb_religion as
select r.country,
sum(r.population) as pop
from religions r 
where r.`year` = 2020
group by r.country 
;

create table t_vb_religion2 as
select tr.*,
case when r.religion = 'Islam' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Islam',
case when r.religion = 'Christianity' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Christianity',
case when r.religion = 'Hinduism' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Hinduism',
case when r.religion = 'Judaism' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Judaism',
case when r.religion = 'Buddhism' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Buddhism',
case when r.religion = 'Unaffiliated Religions' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Unaffiliated Religions',
case when r.religion = 'Folk Religions' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Folk Religions',
case when r.religion = 'Other Religions' then (NULLIF(r.population , 0)/tr.pop)*100 end as 'Other Religions'
from t_vb_religion tr
join religions r 
on tr.country = r.country
where r.`year` = 2020
;
drop table t_vb_religion
;
create table t_vb_religion3 as
select t.country,
sum(t.Buddhism) as Buddhism ,
sum(t.Christianity) as Christianity ,
sum(t.`Folk Religions`) as `Folk Religions` ,
sum(t.Hinduism) as Hinduism ,
sum(t.Islam) as Islam ,
sum(t.Judaism) as Judaism ,
sum(t.`Other Religions`) as `Other Religions` ,
sum(t.`Unaffiliated Religions`) as `Unaffiliated Religions` 
from t_vb_religion2 t
group by t.country 
;
drop table t_vb_religion2 
;
create table t_vb_religion as
select if(t.country = 'Czech Republic', 'Czechia', t.country) as Country,
COALESCE (t.Buddhism, 0) as Buddhism ,
COALESCE (t.Christianity , 0) as Christianity ,
COALESCE (t.`Folk Religions` , 0) `Folk Religions` ,
COALESCE (t.Hinduism , 0) as Hinduism ,
COALESCE (t.Islam , 0) as Islam ,
COALESCE (t.Judaism , 0) as Judaism ,
COALESCE (t.`Other Religions` , 0) as `Other Religions` ,
COALESCE (t.`Unaffiliated Religions` , 0) as `Unaffiliated Religions`
from t_vb_religion3 t
;
drop table t_vb_religion3 

select *
from t_vb_religion