/*
===========================================================
Retail Business Performance Analytics
Customer Analysis
===========================================================
*/

-----------------------------------------------------------
-- 1. Top 10 Customers by Sales
-----------------------------------------------------------

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY "Customer ID","Customer Name"
ORDER BY total_sales DESC
LIMIT 10;


-----------------------------------------------------------
-- 2. Top 10 Customers by Profit
-----------------------------------------------------------

SELECT
    "Customer ID",
    "Customer Name",
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY "Customer ID","Customer Name"
ORDER BY total_profit DESC
LIMIT 10;


-----------------------------------------------------------
-- 3. Customer Ranking by Sales
-----------------------------------------------------------

SELECT
    "Customer Name",
    ROUND(SUM(sales),2) AS total_sales,
    RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
FROM superstore
GROUP BY "Customer Name";


-----------------------------------------------------------
-- 4. Dense Rank Customers
-----------------------------------------------------------

SELECT
    "Customer Name",
    ROUND(SUM(sales),2) AS total_sales,
    DENSE_RANK() OVER(ORDER BY SUM(sales) DESC) AS dense_rank
FROM superstore
GROUP BY "Customer Name";


-----------------------------------------------------------
-- 5. Top Customer in Each Segment (CTE)
-----------------------------------------------------------

WITH customer_sales AS
(
SELECT

segment,

"Customer Name",

SUM(sales) AS total_sales,

RANK() OVER
(
PARTITION BY segment
ORDER BY SUM(sales) DESC
) AS ranking

FROM superstore

GROUP BY segment,"Customer Name"
)

SELECT *

FROM customer_sales

WHERE ranking = 1;


-----------------------------------------------------------
-- 6. Customer Lifetime Value
-----------------------------------------------------------

SELECT

"Customer ID",

"Customer Name",

ROUND(SUM(sales),2) AS lifetime_value

FROM superstore

GROUP BY "Customer ID","Customer Name"

ORDER BY lifetime_value DESC;


-----------------------------------------------------------
-- 7. Average Order Value per Customer
-----------------------------------------------------------

SELECT

"Customer Name",

ROUND(
SUM(sales) /
COUNT(DISTINCT "Order ID"),2
) AS avg_order_value

FROM superstore

GROUP BY "Customer Name"

ORDER BY avg_order_value DESC;


-----------------------------------------------------------
-- 8. Repeat Customers
-----------------------------------------------------------

SELECT

"Customer Name",

COUNT(DISTINCT "Order ID") AS total_orders

FROM superstore

GROUP BY "Customer Name"

HAVING COUNT(DISTINCT "Order ID") > 1

ORDER BY total_orders DESC;