create database customerdb;

select * from customer_shopping;
-- Total Revenue
select SUM(purchase_amount) AS Total_Revenue from customer_shopping;

-- Total Orders
select COUNT(*) as Total_Orders from customer_shopping;

-- Average Order Value
select CAST(ROUND(AVG(purchase_amount * 1.0), 2) AS DECIMAL(10,2)) as AVG_Order_Value from customer_shopping;

-- Average Review Rating
select ROUND(AVG(review_rating),2) AS AVG_Review_Rating from customer_shopping;

-- Total Customers
select COUNT(DISTINCT customer_id) AS Total_Customers from customer_shopping;

--Highest Revenue Generating Product Category
select category,SUM(purchase_amount) AS Total_Revenue from customer_shopping
GROUP BY category
ORDER BY Total_Revenue DESC;

-- Top 10 Revenue Generating Products
select TOP 10 item_purchased as Product ,SUM(purchase_amount) AS Total_Revenue from customer_shopping
GROUP BY item_purchased
ORDER BY Total_Revenue DESC;

-- Top Revenue Generating Product
select TOP 1 item_purchased AS Product, SUM(purchase_amount) AS Total_Revenue
from customer_shopping
GROUP BY item_purchased
ORDER BY Total_Revenue DESC;

--- Most Frequent Purchased Product
select TOP 1 item_purchased AS Product, COUNT(*) AS Total_Purchases
from customer_shopping
GROUP BY item_purchased
ORDER BY COUNT(*) DESC;

-- Highest Rated Product
select TOP 1 item_purchased as Product, ROUND(AVG(review_rating),2) as AVG_Rating
from customer_shopping
GROUP BY item_purchased
ORDER BY AVG_Rating DESC;

--Top 5 Highest Rated Products By Avg Ratings
select TOP 5 item_purchased AS Product, COUNT(review_rating) AS Total_Ratings,
ROUND(AVG(review_rating),2) AS AVG_Rating
from customer_shopping
GROUP BY item_purchased
ORDER BY AVG_Rating DESC;

-- Subscribers V/S Non- Subscribers
select subscription_status,COUNT(*) AS Total_Customers,
SUM(purchase_amount) AS Total_Revenue, CAST(ROUND(AVG(purchase_amount * 1.0), 2) AS DECIMAL(10,2)) as AVG_Order_Value
from customer_shopping
GROUP BY subscription_status;

-- Which age group spends the most?
SELECT
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 50 THEN '36-50'
ELSE '51-70'
END AS Age_Group,
COUNT(*) AS Total_Customers,
SUM(purchase_amount) AS Total_Revenue,
CAST(ROUND(AVG(purchase_amount * 1.0),2) as DECIMAL(10,2)) AS AVG_Order_Value
from customer_shopping
GROUP BY
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 50 THEN '36-50'
ELSE '51-70'
END
ORDER BY Total_Revenue DESC;

-- Which payment methods generated more than $35,000 in revenue?
Select payment_method, SUM(purchase_amount) AS Total_Revenue
from customer_shopping 
GROUP BY payment_method
HAVING SUM(purchase_amount) > 40000
ORDER BY Total_Revenue DESC;

-- Which season generates the highest revenue?
select season, SUM(purchase_amount) AS Total_Revenue from customer_shopping
GROUP BY season
ORDER BY Total_Revenue DESC;