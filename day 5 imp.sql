#================================ Day 4 ===========================================================================
use pfs39;

#====================== countaries 'spain' and itaky and sales above 5000==========================================================
# ================using distinct=================
 
select distinct country,sales from superstore where country in ('spain','italy') and sales > 500;
select distinct  country,sales from superstore where (country='spain' or country='italy') and sales > 500;
#=========================without distinct======================================
select country,sales from superstore where country in ('spain','italy') and sales > 500;
select country,sales from superstore where (country='spain' or country='italy') and sales > 500;

select sales from superstore where sales>=500 and sales<=2000 order by sales asc;

#========================Betweeen operator============================
select sales from superstore where sales between 500 and 2000 order by sales asc;
select sales from superstore where sales between 500 and 2000 order by sales desc;


# =========================get the countries from spain and france we used betweenm operator===============================
select distinct country from superstore where country between 'france' and 'spain' order by country;
#==================================================================================
# ==================================from table country is asc and sales is desc==============================
select distinct country,sales from superstore order by country desc , sales desc;
select distinct country,category from superstore order by country ,category;

#====================== pattern matching ------ like ,not like=============
#===================start with letter %=================
select distinct country from superstore where country like 'i%';
#=========================== ends with % letter=================
select distinct country from superstore where country like '%a';

#============== start or ending the word contains like ia we used % starting letter  and % ending letter ===========
select distinct country from superstore where country like '%ia%';


select  distinct customer_name from superstore where customer_name like 's%';

select distinct country from superstore where country like '%land';

select distinct country from superstore where country like '%king%';


#========== get the countries starting with 'i', word must be 5 letters';
# no need of % (trat like =<
select distinct country from superstore where country like'i____';
# countries contain 7 letters 
select distinct country from superstore where country like '_______';
# countries contain 4 letters and greater than 4letters
select distinct country from superstore where country like '_______%';
# =============countries with less than & letter ===========
select distinct country from superstore where country not like'_______%';

select distinct country from superstore where country like'__d%';

#Arthmetic operator " +,-,*,/,%'
select distinct profit,quantity from superstore;
select distinct profit,quantity,profit/quantity as profit_per_item from superstore;
select distinct sales,sales+200 as bonus_per_sale from superstore;

# Assinment operator =(set):(select/set)

set @min_sales=500;
select sales from superstore where sales>@min_sales;

select @max_sales := 600;

select sales from superstore where sales>@max_sales;

# Bitwise operator  &,|,^,~,<<,>>

select 2&6;
select 2|6;
select 2^6;
select 2~6;

select 5<<3;  # multiplies by 2 power n; 5*(2^3)=40 2^3=2*2*2
select 5<<4;
select 10>>2;
select 10>>3;
select * from emps;
truncate emps;
insert into emps values(1,'Harsha',null),(2,null,34999),(3,'vardhan',23333),(4,null,78888);
select * from emps where emp_name is not null;

 



