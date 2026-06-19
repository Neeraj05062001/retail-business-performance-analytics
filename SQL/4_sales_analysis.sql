/*
===========================================================
Retail Business Performance Analytics
Phase 4 - Sales Analysis
Author : Neeraj Samineni
===========================================================
*/

-----------------------------------------------------------
-- 1. Sales by Category
-----------------------------------------------------------

SELECT
category,
ROUND(SUM(sales)::NUMERIC,2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-----------------------------------------------------------
-- 2. Sales by Sub-Category
-----------------------------------------------------------

SELECT
"Sub-Category",
ROUND(SUM(sales)::NUMERIC,2) AS total_sales
FROM superstore
GROUP BY "Sub-Category"
ORDER BY total_sales DESC;


-----------------------------------------------------------
-- 3. Profit by Category
-----------------------------------------------------------

SELECT
category,
ROUND(SUM(profit)::NUMERIC,2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;


-----------------------------------------------------------
-- 4. Profit by Sub-Category
-----------------------------------------------------------

SELECT
"Sub-Category",
ROUND(SUM(profit)::NUMERIC,2) AS total_profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY total_profit DESC;


-----------------------------------------------------------
-- 5. Top 10 Products by Sales
-----------------------------------------------------------

SELECT
"Product Name",
ROUND(SUM(sales)::NUMERIC,2) AS total_sales
FROM superstore
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;


-----------------------------------------------------------
-- 6. Top 10 Products by Profit
-----------------------------------------------------------

SELECT
"Product Name",
ROUND(SUM(profit)::NUMERIC,2) AS total_profit
FROM superstore
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;


-----------------------------------------------------------
-- 7. Loss Making Products
-----------------------------------------------------------

SELECT
"Product Name",
ROUND(SUM(profit)::NUMERIC,2) AS total_profit
FROM superstore
GROUP BY "Product Name"
HAVING SUM(profit) < 0
ORDER BY total_profit;


-----------------------------------------------------------
-- 8. Sales by Ship Mode
-----------------------------------------------------------

SELECT
"Ship Mode",
ROUND(SUM(sales)::NUMERIC,2) AS total_sales
FROM superstore
GROUP BY "Ship Mode"
ORDER BY total_sales DESC;


-----------------------------------------------------------
-- 9. Average Discount by Category
-----------------------------------------------------------

SELECT
category,
ROUND(AVG(discount)::NUMERIC,2) AS avg_discount
FROM superstore
GROUP BY category
ORDER BY avg_discount DESC;