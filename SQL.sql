Q. Order of Execution of SQL
The order of execution in SQL is as follows:

FROM – Identify the tables involved.
JOIN – Combine tables if needed.
WHERE – Filter rows before grouping.
GROUP BY – Group the results based on specified columns.
HAVING – Filter groups.
SELECT – Select columns to display.
DISTINCT – Remove duplicate rows.
ORDER BY – Sort the results.
LIMIT/OFFSET – Restrict the number of rows.

Q.Write a SQL query to find the top 5 products sold in the last 5 days based on the amount column.
SELECT 
    ProductID, 
    ProductName, 
    SUM(Amount) AS TotalAmount
FROM 
    Sales
WHERE 
    SaleDate >= DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY) -- Filter last 5 days
GROUP BY 
    ProductID, ProductName
ORDER BY 
    TotalAmount DESC -- Order by total sales amount in descending order
LIMIT 5; -- Retrieve the top 5 products

Window Functions:
1. Calculate the cumulative sales for each product category.
SELECT 
    product_category,
    SUM(sales) OVER (PARTITION BY product_category ORDER BY product_id) AS cumulative_sales
FROM 
    product;
 2. Compute the difference between the highest and lowest order value for each customer.

CTE:
1. Use a recursive CTE to calculate the factorial of numbers from one to ten.
WITH RECURSIVE FactorialCTE AS (
    -- Anchor member: Start the factorial calculation with 1
    SELECT 
        1 AS number,
        1 AS factorial
    UNION ALL
    -- Recursive member: Calculate factorial iteratively
    SELECT 
        number + 1 AS number,
        factorial * (number + 1) AS factorial
    FROM 
        FactorialCTE
    WHERE 
        number < 10
)
-- Select the results
SELECT 
    number,
    factorial
FROM 
    FactorialCTE;

