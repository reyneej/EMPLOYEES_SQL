# EMPLOYEES_SQL
This is a very simple dataset of 100 records showing employee with their sales. The goal of creating this dataset is to practice simple SQL queries.
Sample questions:

1. What is the Total Sales per Employee?
2. Calculate total sales for each month.
3. Calculate Sales in the Last 30 Days
4. Find Employees with Sales Above the Average

## 1. What is the Total Sales per Employee?
    select emp_name, SUM(saleamount) AS total_sales FROM employeesDATA
    group by emp_name;
