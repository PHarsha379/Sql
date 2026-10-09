#        Date and Time Functions       

use pfs39;
select now();
select current_timestamp;
select current_date();
select curdate();
select current_time();
select curtime();
select date('2026-05-05');
select makedate(2026,366);
select year('2025-08-23') as yr;
select month(curdate());
select dayname(curdate());
select monthname(curdate());

select weekday(curdate());
select dayofweek(curdate());
select dayofmonth(curdate());
select dayofyear(curdate());

# 2026-10-05  26-oct-5th

# %a -- short day name --mon,tues
# %b --short month name - jan,feb
# %d -- day number-1,2,3,4,
# %m -- month number--1,3,4,
# %D-- date with suffix -- !st,2nd,3rd
# %M -- full month name -- march,october
# %W -- full day names -- monday,tuesday
# %Y --full day names -- monday,frif=day
# %y -- short year -- 26,25

select date_format(curdate(),'%Y-%m-%a');
select date_format(curdate(),'%Y-%M-%a');

# date attribute functions============
select datediff('2026-06-19',curdate());
select date_add(curdate(), interval 13 day);
select date_sub(curdate(),interval 365 day);
select * from superstore;
select order_date,ship_date from superstore;
select year(order_date) as year,month(order_date) as month,monthname(order_date) as monthname,day(order_date) as day from superstore;

select distinct ship_date,dayname(ship_date) as dayname,quarter(ship_date) as quater,week(ship_date) as week from superstore;
#claculate shipping days
select distinct ship_date,order_date,datediff(ship_date,order_date)as duarantion from superstore;
# Add 10 days to the order_date as excepted_date
# add 10 days to order_date
select order_date,date_add(order_date,interval 10 day) from superstore;
# sub 30 days from order_date
select order_date,date_sub(order_date,interval 30 day) as 'previous Date' from superstore;

select order_id from superstore;
select order_id,year(order_date) as year from superstore where year(order_date) = 2022;

select order_id,monthname(order_date) as month from superstore where monthname(order_date)='october';
select order_id,year('2022') from superstore;

select order_id,ship_date from superstore where datediff(ship_date,order_date)=0;

select order_id from superstore where order_date=ship_date;

select order_id from superstore ;

select year(order_date)as yr,count(order_id) as no_of from superstore group by yr;

# count order by month
# format the order_date in this format: 26-10-mon;