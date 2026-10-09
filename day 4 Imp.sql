create database pfs39;
use pfs39;

select * from Superstore;
select category, country,segment from superstore;
select country from superstore;
select city from superstore;

# distinct ---> menas remove duplicate values return only unique values

select distinct country from superstore;

select distinct category from superstore;

select distinct category, country,segment from superstore;
select distinct  country from superstore  order by country asc;
select distinct  country from superstore  order by country desc;

select distinct sales from superstore order by sales asc;
select distinct sales from superstore order by sales desc limit 3;



# order by --- it's a clause used to sort the result
# interview question like second highest we use offset and limit and order clause

select distinct sales from superstore order by sales desc limit 2 offset 6;
select distinct sales from superstore order by sales asc
 limit 1 offset 1;
select distinct  country from superstore;

select distinct country from superstore where country='germany' order by country asc;


select distinct country,category from superstore where country='Germany' and category='Technology';

select distinct country from  superstore where country <> 'Germany';

select distinct country from superstore where country in ('Germany','France');
select distinct country from superstore where country='Germany' or country='France';

select distinct country from superstore where country not in ('Germany','France');
select distinct country from superstore where country <> 'germany' and country <>'france';

# get the sales for germany france spain italy

select distinct country, sales from superstore where country in ('germany','spain','france','italy');
select distinct country,sales from superstore where country  in ('germany','spain','france','italy') and sales >500 order by sales desc;
select distinct country,sales from superstore where country  in ('germany','spain','france','italy') and sales >500  order by sales;