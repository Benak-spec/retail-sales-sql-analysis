--Q.1 What is the total sales value in the dataset?
SELECT SUM(total_amount) AS total_sales FROM retail_sales

--Q.2 How many total transactions are recorded?
SELECT COUNT(*) FROM retail_sales

--Q.3 Which product category generates the highest total sales?
SELECT product_category,SUM(total_amount) AS total_sales FROM retail_sales
GROUP BY product_category
ORDER BY SUM(total_amount) DESC

--Q.4 Which product category has the highest total quantity sold?
SELECT product_category,SUM(quantity) AS total_quantity_sol FROM retail_sales
GROUP BY product_category
ORDER BY SUM(quantity) DESC

--Q.5. What is the average price per unit value?
SELECT ROUND(AVG(price_per_unit),2) AS avg_price_per_unit FROM retail_sales

--Q.6. Which month had the highest total sales?
SELECT TO_CHAR(date,'MM YYYY') AS month,SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY TO_CHAR(date,'MM YYYY')
ORDER BY total_sales DESC
LIMIT 1

--Q.7. Which product category has the highest average transaction value?
SELECT product_category,ROUND(AVG(total_amount),2) AS avg_transaction_value FROM retail_sales
GROUP BY product_category
ORDER BY ROUND(AVG(total_amount),2) DESC

--Q.8. How does sales performance differ by gender within each product category?
SELECT gender,product_category,SUM(total_amount) AS total_sales FROM retail_sales
GROUP BY product_category, gender
ORDER BY product_category

--Q.9. Which age group generates the highest total sales?
SELECT 
CASE 
    WHEN age >= 18 AND age <= 25 THEN '18-25'
	WHEN age >= 26 AND age <= 35 THEN '25-35'
	WHEN age >= 36 AND age <= 50 THEN '35-50'
	WHEN age >= 51 AND age <= 65 THEN '50-65'
	ELSE 'other'
END AS age_group,
SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY age_group
ORDER BY total_sales DESC

--Q.10. What is the monthly sales trend by product category?
SELECT TO_CHAR(date,'YYYY MM') AS monthly,product_category,SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY product_category,TO_CHAR(date,'YYYY MM')
ORDER BY TO_CHAR(date,'YYYY MM')

