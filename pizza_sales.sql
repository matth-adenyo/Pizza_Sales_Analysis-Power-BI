#Select Pizza Table
SELECT *
FROM pizza_sales;

#Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

#Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales;

#Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

#Total Order Placed
SELECT COUNT(DISTINCT order_id) AS Total_Order_Placed
FROM pizza_sales;

#Average Pizzas Per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id), 3) AS Avg_Pizzas_Per_Order
FROM pizza_sales;

#Total Orders By Day
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_Day,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY Order_Day #DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY Total_Orders DESC; #DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y'));

#Total Orders By Months
SELECT MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_Month,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY Order_Month #MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY Total_Orders DESC; #MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'));

#Percentage of Sales By Pizza Category
SELECT pizza_category,
    ROUND(SUM(total_price), 3) AS Total_Sales,
    ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100, 3) AS Percentage_of_Sales_By_Category
FROM pizza_sales
GROUP BY pizza_category;

#Percentage of Sales By Pizza Size
SELECT pizza_size,
    ROUND(SUM(total_price), 3) AS Total_Sales,
    ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100, 3) AS Percentage_of_Sales_By_Size
FROM pizza_sales
GROUP BY pizza_size;

#Top 5 Pizza By Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

#Bottom 5 Pizza By Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

#Top 5 Pizza By Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

#Bottom 5 Pizza By Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold
LIMIT 5;

#Top 5 Pizza By Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

#Bottom 5 Pizza By Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
LIMIT 5;




