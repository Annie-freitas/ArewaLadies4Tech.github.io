-- Data cleaning
Use world_layoff;

Select *
from layoffs;

-- 1. Remove Duplicate
-- 2. Satandize the Data  
-- 3. Null Values or Blank Values
-- 4. Remove colums and rows not necessary

create table layoffs_stagging
like layoffs;

select *
from layoffs_stagging;


insert layoffs_stagging
Select *
From layoffs;
USE WORLD_LAYOFF;

Select *,
ROW_NUMBER() over( 
partition by Company, industry, total_laid_off, percentage_laid_off, 'Date') As Row_Num
From layoffs_stagging
;

with duplicate_cte as
(
Select *,
ROW_NUMBER() over( 
partition by Company, Location,  industry, total_laid_off, percentage_laid_off, 'Date', stage, country) As Row_Num
From layoffs_stagging
)

Select *
From duplicate_cte
where Row_Num > 1;

 Select *
From layoffs_stagging
where company = 'Casper'; 

Use world_layoff;

with duplicate_cte as
(
Select *,
ROW_NUMBER() over( 
partition by Company, Location,  industry, total_laid_off, percentage_laid_off, 'Date', stage, country) As Row_Num
From layoffs_stagging
)
Delete
from duplicate_cte
Where Row_Num > 1;


Create table layoff_2 (
company text,
location text,
industry text,
total_laid_off int,
percentage_laid_off text,
date text,
stage text,
country text,
fund_raised_millions int,
Row_Num INT
) engine=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
From Layoff_2;


Insert into layoff_2
Select *,
ROW_NUMBER() over( 
partition by Company, Location,  industry, total_laid_off, percentage_laid_off, 'Date', stage, country) As Row_Num
From layoffs_stagging;

Select *
From Layoff_2
Where Row_Num < 2;

Delete 
From Layoff_2
Where Row_Num > 1;


-- Standadizing Data

SELECT company, TRIM(company) 
from Layoff_2;

update layoff_2
set company = TRIM(company);

SELECT distinct industry
from Layoff_2
Order By industry asc;


SELECT *
from Layoff_2
where industry like 'crypto%';

update layoff_2
set industry = 'Crypto'
where industry like 'Crypto%';

SELECT distinct industry
from Layoff_2
Order By industry asc;


SELECT distinct location
from Layoff_2
Order By location asc;

SELECT distinct country
from Layoff_2
Order By country asc;

SELECT distinct country,TRIM(trailing '.' from country) 
from Layoff_2
Order By country desc;

update layoff_2
set country = TRIM(trailing '.' from country) 
where country like 'United State%';

select date,
STR_TO_DATE(date, '%m/%d/%Y')
From layoff_2;

update layoff_2
SET date= STR_TO_DATE(date, '%m/%d/%Y');

alter table layoff_2
modify column date DATE;


-- Remove Nulls andblanks values

select *
from layoff_2 t1
join layoff_2 t2
on t1.company = t2.company
WHERE (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoff_2 t1
join layoff_2 t2
on t1.company = t2.company
set t1.industry = t2.industry
WHERE (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoff_2
set industry = null
where industry = '';

update layoff_2 t1
join layoff_2 t2
on t1.company = t2.company
set t1.industry = t2.industry
WHERE t1.industry is null 
and t2.industry is not null;

select *
from layoff_2
where industry = null;

select *
from layoff_2
where total_laid_off is Null
And percentage_laid_off is Null;

delete
from layoff_2
where total_laid_off is Null
And percentage_laid_off is Null;

alter TABLE layoff_2
drop column Row_Num;

select *
from layoff_2;

