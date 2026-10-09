use pfs39;
# eque join all equie joins in on condition is called equi join 

create table salary_grade(grade char(20), min_marks int, max_marks int);
alter table salary_grade rename  column min_marks to min_salary;
alter table salary_grade rename column max_marks to max_salary;
insert into salary_grade values('A',51000,90000),('B',31000,50000),('C',20000,30000);
select * from salary_grade;
desc salary_grade;
select * from emps1;

select emps1.emp_name,emps1.salary,salary_grade.grade from emps1 
join salary_grade on emps1.salary 
between salary_grade.min_salary
 and salary_grade.max_salary;
 # find min and max for grade 'B'
 select emps1.emp_name,emps1.salary,salary_grade.grade from emps1 join salary_grade on emps1.salary between salary_grade.min_salary and 
 salary_grade.max_salary where salary_grade.grade='B';

# find avg salary of all grade
select salary_grade.grade, avg(emps1.salary) as avg 
from emps1 
join salary_grade on emps1.salary 
between salary_grade.min_salary
 and salary_grade.max_salary
 group by salary_grade.grade;
 
 select * from emps1 natural join depts;
 select * from customers natural join products;
 
 # ------------------------------------------ SUBQUERY----------------------------------------------
 
 # single-row subquery -- ==, !=, >,  <;
 #multiple -row subquery  -- not in any all
 #correlated subquery
 # non-correlated subquery
 
 
 # Find the sales which are greater than avg sales 
 
 select avg(sales) from superstore;
 select sales from superstore where sales > (select avg(sales) from superstore);
 select max(sales) from superstore;
 select max(sales) from superstore where sales < (select max(sales) from superstore);
 
 select distinct sales from superstore order by sales desc limit 1 offset 1;
 
 # Find the profit which are greater than max profit in furniture category
 
 select max(profit) from superstore;
 
 select profit from superstore where profit > ( 
 select max(profit) from superstore where category = 'furniture');

select max(order_date) from superstore; 

select order_id from superstore where order_date=(select max(order_date) from superstore); 
 ################# MUltiple row subquerry                 
select customer_name from superstore where state='england';
select customer_name,state,order_id from superstore
where customer_name in  (select distinct customer_name from superstore where state='england');

select orders_id,customer_name from superstore;

select * from superstore;
select customer_name from superstore where category ='Technology';

select customer_name,order_id from superstore where customer_name in (select customer_name from superstore where category ='Technology');
select sales from superstore where category='furniture';
select category,sales from superstore where sales > any (select sales from superstore where category='furniture');
select category,sales from superstore where sales > all (select sales from superstore where category='furniture');

# Display the customer who placed the order_id=3
# Display the products purchased in order_id=5
# Display the price of the product in order_id=1
# Display the product which has greater  thann  the avg price of all products
# Display the customer Who placed latest order 
# Display the customer who never ordered
# Display the products that were never purchased 
# Display the products Which were purchased more than once
# Display the customers who purchased smartphone