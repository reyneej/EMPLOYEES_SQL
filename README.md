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
Output:

<img width="484" height="374" alt="image" src="https://github.com/user-attachments/assets/b2a18374-084f-4eaf-bfa3-8472558b4aea" />

## 2. Calculate total sales for each month.
    SELECT 
      STRFTIME('%Y-%m', Date) AS Month,
      SUM(SaleAmount) AS TotalSales
    FROM employeesDATA
    GROUP BY Month
    ORDER BY Month;
Output:

<img width="483" height="456" alt="image" src="https://github.com/user-attachments/assets/e80bf6c7-690b-42d2-9d29-442d56cbc5df" />

## 3. Calculate Sales in the Last 30 Days
    SELECT SUM(SaleAmount) AS total
    FROM employeesDATA
    WHERE DATE(SaleDate) IN (
        SELECT DATE(SaleDate)
        FROM employeesDATA
        GROUP BY DATE(SaleDate)
        ORDER BY DATE(SaleDate) DESC
        LIMIT 30
    );

Output:

<img width="121" height="71" alt="image" src="https://github.com/user-attachments/assets/6b52e33a-cdd7-41cd-85ca-770f5213bb88" />

## 4. Find Employees with Sales Above the Average
    SELECT emp_name,
           Sum(saleamount) TOTAL_SALES
    FROM   employeesdata
    GROUP  BY emp_name
    HAVING TOTAL_SALES > (SELECT AVG(TOTAL_SALES) AS AVERAGE_SALES
                          FROM   (SELECT Sum(saleamount) TOTAL_SALES
                                  FROM   employeesdata
                                  GROUP  BY emp_name));
Output:

<img width="489" height="130" alt="image" src="https://github.com/user-attachments/assets/7e455975-3b44-4df2-8e33-e79a24fada4c" />




