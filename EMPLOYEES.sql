select * from employeesDATA;			

select emp_name, SUM(saleamount) AS total_sales FROM employeesDATA
group by emp_name;

SELECT 
  STRFTIME('%Y-%m', Date) AS Month,
  SUM(SaleAmount) AS TotalSales
FROM employeesDATA
GROUP BY Month
ORDER BY Month;


SELECT SUM(saleamount) total
FROM employeesDATA
where (SELECT saledate from employeesDATA
GROUP BY saledate
ORDER BY saledate DESc
LIMIT 30);


SELECT emp_name,
       Sum(saleamount) TOTAL_SALES
FROM   employeesdata
GROUP  BY emp_name
HAVING TOTAL_SALES > (SELECT AVG(TOTAL_SALES) AS AVERAGE_SALES
                      FROM   (SELECT Sum(saleamount) TOTAL_SALES
                              FROM   employeesdata
                              GROUP  BY emp_name));


SELECT 
    Emp_Name,
    SUM(SaleAmount) AS total_sales
FROM 
    employeesDATA
GROUP BY 
    Emp_Name
HAVING 
    total_sales > (
        SELECT AVG(total_sales_per_emp)
        FROM (
            SELECT SUM(SaleAmount) AS total_sales_per_emp
            FROM employeesDATA
            GROUP BY emp_name
        )
    );
