use pfs39;

# Inner join -Returns only the matching records from boyh the tables
# left join - Returns all the records from the left table and only the matching 
                  # records from the right table
# right join -Returns all the records from the right table and only the 
               # matching records from the left table
# full join - Returns both(matching & non -matching records) from both tables
# cross join - Return cartesian product of both tables
#self join - A table joins with itself
# equi join - 
# non-equi join -
# natural join-

select * from emps1;
select * from depts;

select emps1.emp_name,depts.dept_name from emps1 inner join depts on emps1.dept_id=depts.dept_id;
