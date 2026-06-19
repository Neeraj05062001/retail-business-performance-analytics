/*
===========================================================
Retail Business Performance Analytics
Phase 2 - Data Cleaning & Validation
Author : Neeraj Samineni
===========================================================

Objective:
1. Check data types
2. Check NULL values
3. Check duplicate records
4. Validate date format
5. Check negative values
6. Validate discount range
7. Validate profit range
8. Check empty strings
===========================================================
*/


-----------------------------------------------------------
-- 1. Check Data Types
-----------------------------------------------------------

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'superstore';



-----------------------------------------------------------
-- 2. Check NULL Values
-----------------------------------------------------------

SELECT

COUNT(*) AS total_rows,

COUNT("Row ID") AS row_id,
COUNT("Order ID") AS order_id,
COUNT("Order Date") AS order_date,
COUNT("Ship Date") AS ship_date,
COUNT("Ship Mode") AS ship_mode,
COUNT("Customer ID") AS customer_id,
COUNT("Customer Name") AS customer_name,
COUNT(segment) AS segment,
COUNT(country) AS country,
COUNT(city) AS city,
COUNT(state) AS state,
COUNT("Postal Code") AS postal_code,
COUNT(region) AS region,
COUNT("Product ID") AS product_id,
COUNT(category) AS category,
COUNT("Sub-Category") AS sub_category,
COUNT("Product Name") AS product_name,
COUNT(sales) AS sales,
COUNT(quantity) AS quantity,
COUNT(discount) AS discount,
COUNT(profit) AS profit

FROM superstore;



-----------------------------------------------------------
-- 3. Check Duplicate Row IDs
-----------------------------------------------------------

SELECT
    "Row ID",
    COUNT(*)
FROM superstore
GROUP BY "Row ID"
HAVING COUNT(*) > 1;



-----------------------------------------------------------
-- 4. Validate Order Date Conversion
-----------------------------------------------------------

SELECT
    "Order Date",
    TO_DATE("Order Date",'MM/DD/YYYY') AS converted_order_date
FROM superstore
LIMIT 10;



-----------------------------------------------------------
-- 5. Validate Ship Date Conversion
-----------------------------------------------------------

SELECT
    "Ship Date",
    TO_DATE("Ship Date",'MM/DD/YYYY') AS converted_ship_date
FROM superstore
LIMIT 10;



-----------------------------------------------------------
-- 6. Check Invalid Dates
-----------------------------------------------------------

SELECT *
FROM superstore
WHERE TO_DATE("Order Date",'MM/DD/YYYY') IS NULL
   OR TO_DATE("Ship Date",'MM/DD/YYYY') IS NULL;



-----------------------------------------------------------
-- 7. Check Negative Sales
-----------------------------------------------------------

SELECT *
FROM superstore
WHERE sales < 0;



-----------------------------------------------------------
-- 8. Check Negative Quantity
-----------------------------------------------------------

SELECT *
FROM superstore
WHERE quantity < 0;



-----------------------------------------------------------
-- 9. Check Discount Range
-----------------------------------------------------------

SELECT

MIN(discount) AS minimum_discount,
MAX(discount) AS maximum_discount

FROM superstore;



-----------------------------------------------------------
-- 10. Check Profit Range
-----------------------------------------------------------

SELECT

MIN(profit) AS minimum_profit,
MAX(profit) AS maximum_profit

FROM superstore;



-----------------------------------------------------------
-- 11. Check Empty Customer Names
-----------------------------------------------------------

SELECT *
FROM superstore
WHERE TRIM("Customer Name") = '';



-----------------------------------------------------------
-- 12. Check Empty Product Names
-----------------------------------------------------------

SELECT *
FROM superstore
WHERE TRIM("Product Name") = '';



-----------------------------------------------------------
-- 13. Check Distinct Business Dimensions
-----------------------------------------------------------

SELECT DISTINCT segment
FROM superstore;

SELECT DISTINCT category
FROM superstore;

SELECT DISTINCT "Sub-Category"
FROM superstore;

SELECT DISTINCT region
FROM superstore;



-----------------------------------------------------------
-- 14. Final Data Quality Summary
-----------------------------------------------------------

SELECT

COUNT(*) AS total_records,

COUNT(DISTINCT "Order ID") AS total_orders,

COUNT(DISTINCT "Customer ID") AS total_customers,

COUNT(DISTINCT "Product ID") AS total_products,

ROUND(SUM(sales),2) AS total_sales,

ROUND(SUM(profit),2) AS total_profit,

SUM(quantity) AS total_quantity

FROM superstore;