-- SQL Retail Sales Analysis - P1
Create Database SQL_Project_P1;

SELECT *
FROM Retail_sales_analysis

-- 
SELECT COUNT(*) FROM Retail_sales_analysis

-- Removing nulls in all columns
SELECT * FROM Retail_sales_analysis
WHERE transactions_id IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE sale_date IS NULL
-- 
SELECT * FROM Retail_sales_analysis
WHERE sale_time IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE customer_id IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE gender IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE AGE IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE category IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE quantiy IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE price_per_unit IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE cogs IS NULL
--
SELECT * FROM Retail_sales_analysis
WHERE total_sale IS NULL

-- Data Cleaning
-- other way to check all the columns at a time
SELECT * FROM Retail_sales_analysis
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

-- DELETING THE NULLS
DELETE FROM Retail_sales_analysis
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

-- Data Exploration
-- How many sales we have?
SELECT COUNT(*) as Total_Sale FROM Retail_sales_analysis

-- How many Unique customers we have?
SELECT COUNT(DISTINCT customer_id) as Total_Sale FROM Retail_sales_analysis

-- How many Unique category we have?
SELECT COUNT(DISTINCT category) as Total_Sale FROM Retail_sales_analysis

-- types of categories
SELECT DISTINCT category FROM Retail_sales_analysis



-- DATA ANALYSIS & BUSINESS KEY PROBELMS AND ANSWERS
-- Q1. Write a SQL Query to retrieve all columns for sales made on '2022-11-05'
-- Q2. Write a SQL Query to retrieve all transactions where the category is 'clothing' and the quantity is sold is more than 10 in the month of NOV-2022
-- Q3. Write a SQL Query to calculate the total sales (total_sale) for each category
-- Q4. Write a SQL Query to find the average age of customers who purchased items from the 'beauty' category.
-- Q5. Write a SQL Query to find all transactions where the total sale is greater than 1000
-- Q6. Write a SQL Query to find the total number of transactions (transactions_id) made by each gender in each category
-- Q7. Write a SQL Query to calculate the average sales of each month. find out best selling month in each year.
-- Q8. Write a SQL Query to find the top 5 customers based on the highest total sales.
-- Q9. Write a SQL Query to find the number of unique customers who purchased items from each category
-- Q10. Write a SQL Query to create each shift and number of orders (ex. morning <=12, afternoon between 12 & 17, evening >17)

-- Q1. Write a SQL Query to retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM Retail_sales_analysis
WHERE sale_date = '2022-11-05';

-- Q2. Write a SQL Query to retrieve all transactions where the category is 'clothing' and the quantity is sold is 
-- more than 4 in the month of NOV-2022
SELECT *
FROM Retail_sales_analysis
WHERE category = 'Clothing'
AND quantiy >= 4
AND sale_date >= '2022-11-01'
AND sale_date < '2022-12-01';

-- Q3. Write a SQL Query to calculate the total sales (total_sale) for each category
SELECT 
category,
SUM(total_sale) AS Total_Sales
FROM Retail_sales_analysis
GROUP BY category

-- Q4. Write a SQL Query to find the average age of customers who purchased items from the 'beauty' category.
SELECT 
 AVG(age) AS Avg_age
FROM Retail_sales_analysis
WHERE Category = 'Beauty'

-- Q5. Write a SQL Query to find all transactions where the total sale is greater than 1000.
SELECT *
FROM Retail_sales_analysis
WHERE total_sale > 1000

-- Q6. Write a SQL Query to find the total number of transactions (transactions_id) made by each gender in each category
SELECT 
category,
gender,
COUNT(*) AS Total_trans
FROM Retail_sales_analysis
GROUP BY gender, category
ORDER BY 1

-- Q7. Write a SQL Query to calculate the average sales of each month. find out best selling month in each year.
SELECT
    YEAR(sale_date) AS [Year],
    MONTH(sale_date) AS [Month],
    AVG(total_sale) AS avg_sale
FROM Retail_sales_analysis
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    [Year],
    [avg_sale] DESC;

-- Q8. Write a SQL Query to find the top 5 customers based on the highest total sales.
SELECT 
customer_id,
SUM(total_Sale) AS Total_sales
FROM Retail_sales_analysis
GROUP BY customer_id
ORDER BY Total_sales DESC
LIMIT 5

-- Q9. Write a SQL Query to find the number of unique customers who purchased items from each category.
SELECT
category,
COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM Retail_sales_analysis
GROUP BY Category

-- Q10. Write a SQL Query to create each shift and number of orders (ex. morning <=12, afternoon between 12 & 17, evening >17)
SELECT *,
 CASE 
  WHEN SALE
FROM Retail_sales_analysis


SELECT
    CASE
        WHEN DATEPART(HOUR, sale_time) <= 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,

    COUNT(transactions_id) AS Number_of_Orders

FROM Retail_sales_analysis

GROUP BY
    CASE
        WHEN DATEPART(HOUR, sale_time) <= 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END

ORDER BY
    MIN(DATEPART(HOUR, sale_time));

