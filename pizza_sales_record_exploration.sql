SELECT * 
FROM pizza_sales.pizza_sales;

CREATE TABLE pizza_sales2
LIKE pizza_sales;

INSERT pizza_sales2
SELECT *
FROM pizza_sales;

SELECT *
FROM pizza_sales2;

SELECT `order_date`
FROM pizza_sales2;

SELECT `order_date`,
STR_TO_DATE(`order_date`, '%d-%m-%Y')
FROM pizza_sales2;

UPDATE pizza_sales2
SET `order_date` = STR_TO_DATE(`order_date`, '%d-%m-%Y');

ALTER TABLE pizza_sales2
MODIFY COLUMN `order_date` DATE;

SELECT `order_date`
FROM pizza_sales2;

SELECT `order_time`
FROM pizza_sales2;

ALTER TABLE pizza_sales2
MODIFY COLUMN `order_time` TIME;

SELECT *
FROM pizza_sales2;

SELECT SUM(total_price) AS total_income, SUM(quantity) AS total_sales, COUNT(pizza_id) AS total_units_sold
FROM pizza_sales2;

SELECT pizza_name, pizza_size, SUM(total_price) AS Income_Ranking
FROM pizza_sales2
GROUP BY pizza_name, pizza_size
ORDER BY 3 DESC;

SELECT pizza_name, pizza_size, SUM(quantity) AS Order_Ranking
FROM pizza_sales2
GROUP BY pizza_name, pizza_size
ORDER BY 3 DESC;

SELECT pizza_name, pizza_size, SUM(total_price) AS income_Ranking
FROM pizza_sales2
GROUP BY pizza_name, pizza_size
ORDER BY 3 DESC;

SELECT pizza_category, pizza_size, SUM(quantity) AS category_rankings
FROM pizza_sales2
GROUP BY pizza_category, pizza_size
ORDER BY 3 DESC;

SELECT *
FROM pizza_sales2;

SELECT `order_date`
FROM pizza_sales2;

SELECT MAX(total_price) AS Highest_single_order, MIN(total_price) AS Lowest_single_order
FROM pizza_sales2;

SELECT SUBSTRING(`order_date`, 1,10) AS `DAYS`, SUM(quantity) as Total_sales_per_day,SUM(total_price) AS Total_income_per_day
FROM pizza_sales2
GROUP BY `DAYS`;

SELECT SUBSTRING(`order_date`, 1,10) AS `DAYS`, SUM(quantity) as Total_sales_per_day,SUM(total_price) AS Total_income_per_day
FROM pizza_sales2
GROUP BY `DAYS`
ORDER BY 2 DESC;

SELECT SUBSTRING(`order_date`, 1,10) AS `DAYS`, SUM(quantity) as Total_sales_per_day,SUM(total_price) AS Total_income_per_day
FROM pizza_sales2
GROUP BY `DAYS`
ORDER BY 3 DESC;

SELECT SUBSTRING(`order_date`, 6,2) AS `MONTH`, SUM(quantity)
FROM pizza_sales2
GROUP BY `MONTH`;

SELECT SUBSTRING(`order_date`, 6,2) AS `MONTH`, SUM(quantity) AS Sales_by_month
FROM pizza_sales2
GROUP BY `MONTH`
ORDER BY 2 DESC;

WITH Rolling_Total AS
(
SELECT SUBSTRING(`order_date`, 6,2) AS `MONTH`, SUM(quantity) AS Sales_by_month
FROM pizza_sales2
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, Sales_by_month,
SUM(Sales_by_month) OVER(ORDER BY `MONTH`) AS Rolling_Total
FROM Rolling_Total;


SELECT SUBSTRING(`order_date`, 6,2) AS `MONTH`, SUM(total_price) AS income_by_month
FROM pizza_sales2
GROUP BY `MONTH`;

SELECT SUBSTRING(`order_date`, 6,2) AS `MONTH`, SUM(total_price) AS income_by_month
FROM pizza_sales2
GROUP BY `MONTH`
ORDER BY 2 DESC;

WITH Rolling_Total AS
(
SELECT SUBSTRING(`order_date`, 6,2) AS `MONTH`, SUM(total_price) AS income_by_month
FROM pizza_sales2
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`,income_by_month,
SUM(income_by_month) OVER(ORDER BY `MONTH`) AS Rolling_Total
FROM Rolling_Total;


SELECT order_time
FROM pizza_sales2;


SELECT 
pizza_id, order_id, pizza_name_id, quantity, order_date, order_time, unit_price, total_price, pizza_size, pizza_category, pizza_ingredients, pizza_name,
CASE
	WHEN order_time BETWEEN '11:00:00' AND '13:59:59' THEN 'Mid-day'
    WHEN order_time BETWEEN '14:00:00' AND '18:59:59' THEN 'Afternoon'
    WHEN order_time BETWEEN '19:00:00' AND '23:59:59' THEN 'Night'
    ELSE NULL
END AS time_frame
FROM pizza_sales2;

SELECT *
FROM pizza_sales2;
