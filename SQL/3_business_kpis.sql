/*
===========================================================
Retail Business Performance Analytics
Phase 3 - Business KPIs
Author : Neeraj Samineni
===========================================================
*/


-----------------------------------------------------------
-- 1. Total Sales
-----------------------------------------------------------

SELECT
ROUND(SUM(sales),2) AS total_sales
FROM superstore;


-----------------------------------------------------------
-- 2. Total Profit
-----------------------------------------------------------

SELECT
ROUND(SUM(profit),2) AS total_profit
FROM superstore;


-----------------------------------------------------------
-- 3. Total Orders
-----------------------------------------------------------

SELECT
COUNT(DISTINCT "Order ID") AS total_orders
FROM superstore;


-----------------------------------------------------------
-- 4. Total Customers
-----------------------------------------------------------

SELECT
COUNT(DISTINCT "Customer ID") AS total_customers
FROM superstore;


-----------------------------------------------------------
-- 5. Total Products
-----------------------------------------------------------

SELECT
COUNT(DISTINCT "Product ID") AS total_products
FROM superstore;


-----------------------------------------------------------
-- 6. Total Quantity Sold
-----------------------------------------------------------

SELECT
SUM(quantity) AS total_quantity
FROM superstore;


-----------------------------------------------------------
-- 7. Average Order Value
-----------------------------------------------------------

SELECT
ROUND(
SUM(sales) /
COUNT(DISTINCT "Order ID"),2
) AS average_order_value
FROM superstore;


-----------------------------------------------------------
-- 8. Average Profit Per Order
-----------------------------------------------------------

SELECT
ROUND(
SUM(profit) /
COUNT(DISTINCT "Order ID"),2
) AS average_profit_per_order
FROM superstore;


-----------------------------------------------------------
-- 9. Profit Margin %
-----------------------------------------------------------

SELECT
ROUND(
(SUM(profit)/SUM(sales))*100,2
) AS profit_margin_percentage
FROM superstore;


-----------------------------------------------------------
-- 10. Average Discount
-----------------------------------------------------------

SELECT
ROUND(AVG(discount),2) AS average_discount
FROM superstore;


-----------------------------------------------------------
-- 11. Sales Per Customer
-----------------------------------------------------------

SELECT
ROUND(
SUM(sales) /
COUNT(DISTINCT "Customer ID"),2
) AS sales_per_customer
FROM superstore;