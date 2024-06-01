-- Causes of suicide in India

use india_suicide;
-- Checking each columns/ from anomalies to fix

select *
from india_suicide;

select distinct(type_code)
from india_suicide;

select distinct(gender)
from india_suicide
Order by 1;

select distinct(age_group)
from india_suicide;

select distinct(total)
from india_suicide;
use india_suicide;

-- Removing duplicate
-- Standardizing the Columns


create table india_suicide2
like india_suicide;

insert india_suicide2
select *
from india_suicide;

select *
from india_suicide2;

select *,
ROW_NUMBER() over(partition by state, 'year', type_code,type, gender, age_group) AS ROW_NUM
from india_suicide2;


with duplicate_cte as (
select *,
ROW_NUMBER() over(partition by state, 'year', type_code,type, gender, age_group) AS ROW_NUM
from india_suicide2
	)
select *
from duplicate_cte
where ROW_NUM >1;


with duplicate_cte as (
select *,
ROW_NUMBER() over(partition by state, 'year', type_code,type, gender, age_group) AS ROW_NUM
from india_suicide2
	)
delete
from duplicate_cte
where ROW_NUM >1;

select *
from india_suicide;


Create table india_suicide3 (
State text,
Year int,
Type_code text,
Type text,
Gender text,
Age_group text,
Total int,
Row_Num INT
) engine=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from india_suicide3;

insert into india_suicide3
select *,
ROW_NUMBER() over(partition by state, 'year', type_code,type, gender, age_group) AS ROW_NUM
from india_suicide2;

select *
from india_suicide3;

delete
from india_suicide3
where ROW_NUM >1;


-- Standardizing the columns

select distinct(type_code)
from india_suicide3;

select distinct(gender)
from india_suicide3
Order by 1;

select distinct(age_group)
from india_suicide3;

select distinct(total)
from india_suicide3;

select distinct(Type)
from india_suicide3;

-- Standardizing from the column
select distinct(Type)
from india_suicide3;


select distinct(Type)
from india_suicide3
where type like 'Bankruptcy%';

UPDATE india_suicide3
set type = 'Bankruptcy or Sudden change in econimic Status'
where type like 'Bankruptcy%';

select distinct(Type)
from india_suicide3
where type like 'Not having children%';

UPDATE india_suicide3
set type = 'Not having children(Barrenness/Impotency)'
where type like 'Not having children%';

select distinct(Type)
from india_suicide3
where type like '%Prolonged Illness';

UPDATE india_suicide3
set type = 'Prolonged Illness'
where type like '%Prolonged illness';

select distinct(Type)
from india_suicide3
where type like '%secondary';

UPDATE india_suicide3
set type = 'Undergraduate'
where type like '%secondary';

select distinct(Type)
from india_suicide3
where type like 'hr%';

UPDATE india_suicide3
set type = 'High School Graduate'
where type like 'hr%';

select distinct(Type)
from india_suicide3
where type like 'middle%';

UPDATE india_suicide3
set type = 'Middle School'
where type like 'middle%';

select distinct(Type)
from india_suicide3
where type like 'primary%';

UPDATE india_suicide3
set type = 'Primary School'
where type like 'primary%';

select distinct(Type)
from india_suicide3;


select distinct(Type)
from india_suicide3
where type like 'causes%';

UPDATE india_suicide3
set type = 'Unknown Causes'
where type like 'causes%';

select distinct(Type)
from india_suicide3
where type like 'other causes%';

UPDATE india_suicide3
set type = 'Unknown Causes'
where type like 'other causes%';

select distinct(Type)
from india_suicide3
where type like '%coming under%';

UPDATE india_suicide3
set type = 'Accident by running vehicles/trains'
where type like '%coming under%';

select distinct(Type)
from india_suicide3
where type like '%consuming insecticides';

UPDATE india_suicide3
set type = 'Consuming Insecticides/Poison'
where type like '%%consuming insecticides';

select distinct(Type)
from india_suicide3
where type like '%consuming other poison';

UPDATE india_suicide3
set type = 'Consuming Insecticides/Poison'
where type like '%consuming other poison';

select distinct(Type)
from india_suicide3
where type like '%drowning';

UPDATE india_suicide3
set type = 'Drowning'
where type like '%drowning';

select distinct(Type)
from india_suicide3
where type like '%fire-arms';

UPDATE india_suicide3
set type = 'Fire-Arms'
where type like '%fire-arms';

select distinct(Type)
from india_suicide3
where type like '%self immolation';

UPDATE india_suicide3
set type = 'Fire/Self Immolation'
where type like '%self immolation';

select distinct(Type)
from india_suicide3
where type like '%hanging';

UPDATE india_suicide3
set type = 'Hanging'
where type like '%hanging';

select distinct(Type)
from india_suicide3
where type like '%jumping%';

UPDATE india_suicide3
set type = 'Jumpimg from buildings/sites'
where type like '%jumping';

select distinct(Type)
from india_suicide3
where type like '%jumping%';

UPDATE india_suicide3
set type = 'Jumpimg from buildings/sites'
where type like '%jumping%';

select distinct(Type)
from india_suicide3
where type like '%machine';

UPDATE india_suicide3
set type = 'Machine'
where type like '%machine';

select distinct(Type)
from india_suicide3
where type like '%other means';

UPDATE india_suicide3
set type = 'Other Means'
where type like '%other means';

select distinct(Type)
from india_suicide3
where type like '%other means%';

UPDATE india_suicide3
set type = 'Other Means'
where type like '%other means%';

select distinct(Type)
from india_suicide3
where type like 'other %';

UPDATE india_suicide3
set type = 'Other Means'
where type like '%other%';

select distinct(Type)
from india_suicide3
where type like '%over alcoholism';

UPDATE india_suicide3
set type = 'Over Alcoholism'
where type like '%over alcoholism';

select distinct(Type)
from india_suicide3
where type like '%overdose%';

UPDATE india_suicide3
set type = 'Drug Abuse/Addiction'
where type like '%overdose%';

select distinct(Type)
from india_suicide3
where type like '%self infliction%';

UPDATE india_suicide3
set type = 'Self Infliction of Injury'
where type like '%self infliction%';

select distinct(Type)
from india_suicide3
where type like '%touching%';

UPDATE india_suicide3
set type = 'Electrocution'
where type like '%touching%';

select distinct(Type)
from india_suicide3
where type like 'illegitimate%';

UPDATE india_suicide3
set type = 'Unwanted Pregnancy'
where type like 'illegitimate%';

select distinct(Type)
from india_suicide3
where type like 'unemployment%';

UPDATE india_suicide3
set type = 'Unemployed'
where type like 'unemployment%';
select distinct(Type)
from india_suicide3
order by type asc;

-- Standardizing Age_group

select distinct(Age_group)
from india_suicide3;

select distinct(Age_group)
from india_suicide3
where Age_group = 60;

UPDATE india_suicide3
set Age_group = '60+'
where Age_group = 60;

delete
from india_suicide3
where Age_group = '0-100+' ;

select distinct(Age_group)
from india_suicide3;



-- Exploratory Data Analysis
 select *
from india_suicide3;


select distinct(age_group)as Age, count(total) as Total_Death
from india_suicide3
group by Age;

select distinct(year)as Year, count(total) as Total_Death
from india_suicide3
group by year;

select distinct(type_code)as Tc, count(total) as Total_Death
from india_suicide3
group by Tc;

select distinct(gender)as Gender, count(total) as Total_Death
from india_suicide3
group by gender;

select distinct(year)as Year, gender, count(total) as Total_Death
from india_suicide3
group by year, gender;

select distinct(year)as Year, gender, count(total) as Total_Death,type
from india_suicide3
group by year, gender, type;

select distinct(year)as Year, gender, total,type
from india_suicide3
group by year, gender, type;

select distinct(Age_group)as Age, gender, count(total) as Total_Death,type
from india_suicide3
group by year, gender, type, age;

select distinct(year)as Year, gender,total,type
from india_suicide3
group by year, gender, type;

select distinct(type), count(year)as Year, gender,total
from india_suicide3
group by year, gender, type;









