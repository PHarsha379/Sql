use pfs39;

# Null handling  isnull(), ifnull(), coalesce()

desc student;

select * from student;

create table students1(std_id int, std_name varchar(20),email char(30),phn_no bigint, city varchar(20), age tinyint);
insert into students1 values(1,'Thanuj',null,3456789,'vij',22),
(2,'kavya','kavya@gamil.com',null,'vizag',null),
(3,'pavan','pavan@gmail.com',23456789,'blr',24),
(4,'praveen',null,null,'hyd',27);
desc students1;
select * from students1;

#=================== isnull() is used to check the value  returns true(1) if it null else(0)   function and operator =====================
# function is used in select command ========== operator is used in where clause============

select email,isnull(email) from students1;
select  std_name,isnull(std_name)as result from students1;

#================== if null check only one   values provides an alternative values if it is null
select phn_no,ifnull(phn_no,'not provided') from students1;

select age,ifnull(age, 0) from students1;


# coalesce() checks multiple values and return the first non null values

select * from students1;
select email,phn_no, coalesce(email,phn_no,'Not provided') as first_contact from students1;


# Agregation function sum,min,max,avg,count,

select sum(sales) as total_sales from superstore;
select avg(sales) as avg_sales from superstore;
select min(sales) as min_sales from superstore;
select count(sales) as count_sales from superstore;
select max(sales) as max_sales from superstore;
select country ,sum(sales) as total_sales from superstore;

# group by a clause is used to group the rows 
select   country,sum(sales) as total_sales from superstore group by country order by total_sales desc;
select country,sum(sales) as  total_sales from superstore group by country order by total_sales limit 1 offset 1;
select category,avg(sales) as avg_sales from superstore group by category order by avg_sales desc limit 1 offset 1;
select country,category, sum(sales) as total_sales from superstore group by country,category order by total_sales;
select country,max(sales) as max_sales from superstore 
where country in ('spain','germany','france','austria','italy') 
group by country 
having max_sales>5000
order by max_sales desc;

##########===========      Excecution order ====================================
# having -- filters the groups
# flow of excetution 
# from  - chooses the table from database;
#where - filters the data
#group by - groups the rows, aggregtae the column;
# having - aggregate colums filtering we use having
# select - to select the column from the table
# distinct - removes duplicates
# order by -- sort the result
#=================================
# find total and avg sales for the countries which has the letters 
#a and s in it and the total_sale should be above 5l and 
# sort the result in highest to low;
select country,sum(sales) as Total_sale, avg(sales) as avg_sales from superstore
 group by country having Total_sale>1000 order by Total_sale,avg_sales desc;
 
select  distinct country,sum(sales) as Total_sale,avg(sales) as avg_sales from superstore where country like '%a%' and   country like '%s%'
group by country having Total_sale>100000 order by Total_sale desc;
 
 
select avg(sales) from superstore;

# non scalar functions -- round(),ceil()/ceiling(),floor(),truncate()
#round()== rounds to the nearest integer based on the decimal value if the value is>=5,
# round to the nearest else rounds Down to the nearest integer .alter

# ceil()/ceiling() -- rounds up to the nearest integer
# floor() -- round Down to the nearest integer 
# truncate() -- just trims the value.

select round(153.45);
select round(154.34,1);
select round(154.34,0);
#-1 - rounds to the nearest 10s
# -2 - rounds to the nearwst to the 100s
# -3 - rounds to the nearest to the 1lak
# 0- rounds to the integer base don the decimal values
# 1 - rounds to the 1 decimal value based on the next decimal value 

select round(135.5,1);
select round(135.5);
select ceil(135.56);
select floor(135.56);
select truncate(135.56,1);

select round(avg(sales),3  from superstore);


select abs(100-200); ## returns the absolute value means number with 
select sqrt(36);
select power(2,3);
select mod(23,2);
select sign(-2345);
select pi();
select rand();
select exp(2);
select log(7.38905609893065);
select greatest(22,33,444);
select least(12,55,567);

## string functions

# string search functions -- locat(),position(),instr()

select distinct order_id from superstore;
select distinct order_id,locate('-',order_id)from superstore;
select distinct order_id,position('-' in order_id) from superstore;
select distinct order_id,instr(order_id,'-') from superstore;
# locate (substring , string)
# position (substring in string)
# instr(string , substring)

select distinct order_id,instr(order_id,'') from superstore;

select distinct order_id,locate('-' ,order_id) as  1st,
locate('-',order_id,locate('-',order_id)+1) as 2nd from superstore;

select distinct customer_name from superstore;
select distinct customer_name,locate(' ',customer_name) from superstore;
select distinct product_name from superstore;
select distinct product_name,locate(' ',product_name) as 1st,
locate(' ',product_name,locate(' ',product_name)+1) as 2nd,
locate(' ',product_name,locate(' ',product_name,locate(' ',product_name)+1)+1) as 3rd from superstore;


############# STring Length function '''''''''''''''''''''''''''''''''
# Function 
# length() == counts in bytes
# char_length() == counts the characters
select length("Harsha Varshan");
select char_length("Harsha  vardhan");

select distinct country from superstore;
select distinct country,char_length(country)  from superstore;
select distinct customer_name from superstore;
select distinct customer_name,length(customer_name) as length_name from superstore;
select distinct customer_name,length(customer_name) as length_name from superstore;



######### String modification function ###################

# upper()
# lower()
# reverse()
# replace()

select distinct customer_name,upper(customer_name) ,lower(customer_name) from superstore;
select distinct country,upper(country),lower(country) from superstore;

select distinct country,reverse(country)from superstore;

select distinct order_id from superstore;
select distinct order_id,replace(order_id,'ES','IT')  from superstore;
select distinct order_id,replace(order_id,'2019','2025') from superstore;

#string concatenation function -- concat(),concat_ws()
select concat('pfs',' ', 'jfs','da');
select concat_ws(' ','pfs','jfs','da');
select concat('code',' ' , null,'gnan');

select distinct customer_name,country,
concat(customer_name,' ',country,' ',region)
from superstore;
select concat_ws(' ',customer_name,country, region) from superstore;

# string Extraction Function -- left(),right(),mid()/Substring()
# left(string, length)
#right(string, length)
# mid(string,length,starting_position

select left('Harsha vardhan peddiboyina',5) as name;
select right("Harsha vardhan peddiboyina",5) as name;
select mid("Harsha vardhan peddiboyina",8,5) as name;
select substring("Harsha vardhan Peddiboyina",1,5);
select order_id from superstore;

select distinct order_id,left(order_id,2) as code,
mid(order_id,4,4) as year, right(order_id,7) as value from superstore;
select distinct customer_name from superstore;
select distinct customer_name,left(' ',customer_name)-locate(' ',customer_name) as  1st ,
right(customer_name-length(customer_name-locate(' ', customer_name))) from superstore;



#string formations --lpad() / rpad()
# xxxx xxx 1234, ****ab
#lpad(str,len,p)
#rpad(str,len,p)
select lpad(123,12,'x');
select rpad('AB','5','*');

#trim(), ltrim(),rtrim()
#trim() - removes both forward and trailing space
#ltrim() - trims only the forward space
#rtrim()- trims only the trailing space

select trim('  helo  ');
select ltrim('    helo        ');
select rtrim('   hello      ');

