/*
===========================================================
Retail Business Performance Analytics
Dashboard Queries
Author : Neeraj Samineni
===========================================================
*/


-----------------------------------------------------------
-- 1. Overall Business KPI
-----------------------------------------------------------

SELECT

COUNT(DISTINCT "Order ID") AS total_orders,

COUNT(DISTINCT "Customer ID") AS total_customers,

COUNT(DISTINCT "Product ID") AS total_products,

SUM(quantity) AS total_quantity,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit,

ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin

FROM superstore;



-----------------------------------------------------------
-- 2. Monthly Sales Trend
-----------------------------------------------------------

SELECT

DATE_TRUNC('month',order_date) AS month,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY month

ORDER BY month;



-----------------------------------------------------------
-- 3. Category Performance
-----------------------------------------------------------

SELECT

category,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY category

ORDER BY total_sales DESC;



-----------------------------------------------------------
-- 4. Sub Category Performance
-----------------------------------------------------------

SELECT

"Sub-Category",

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY "Sub-Category"

ORDER BY total_sales DESC;



-----------------------------------------------------------
-- 5. Regional Performance
-----------------------------------------------------------

SELECT

region,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY region

ORDER BY total_sales DESC;



-----------------------------------------------------------
-- 6. State Performance
-----------------------------------------------------------

SELECT

state,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY state

ORDER BY total_sales DESC;



-----------------------------------------------------------
-- 7. Top 10 Customers
-----------------------------------------------------------

SELECT

"Customer Name",

ROUND(SUM(sales),2) AS total_sales

FROM superstore

GROUP BY "Customer Name"

ORDER BY total_sales DESC

LIMIT 10;



-----------------------------------------------------------
-- 8. Top 10 Products
-----------------------------------------------------------

SELECT

"Product Name",

ROUND(SUM(sales),2) AS total_sales

FROM superstore

GROUP BY "Product Name"

ORDER BY total_sales DESC

LIMIT 10;



-----------------------------------------------------------
-- 9. Ship Mode Performance
-----------------------------------------------------------

SELECT

"Ship Mode",

COUNT(*) total_orders,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY "Ship Mode"

ORDER BY total_sales DESC;



-----------------------------------------------------------
-- 10. Segment Performance
-----------------------------------------------------------

SELECT

segment,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit

FROM superstore

GROUP BY segment

ORDER BY total_sales DESC;