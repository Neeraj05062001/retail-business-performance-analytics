-- ==========================================
-- Retail Business Performance Analytics
-- Data Profiling
-- ==========================================

-- Total Records
SELECT COUNT(*) AS total_records
FROM superstore;

-- Total Orders
SELECT COUNT(DISTINCT "Order ID") AS total_orders
FROM superstore;

-- Total Customers
SELECT COUNT(DISTINCT "Customer ID") AS total_customers
FROM superstore;

-- Total Products
SELECT COUNT(DISTINCT "Product ID") AS total_products
FROM superstore;

-- Date Range
SELECT
    MIN(TO_DATE("Order Date",'MM/DD/YYYY')) AS first_order_date,
    MAX(TO_DATE("Order Date",'MM/DD/YYYY')) AS last_order_date
FROM superstore;

-- Total Sales
SELECT
    ROUND(SUM(sales),2) AS total_sales
FROM superstore;

-- Total Profit
SELECT
    ROUND(SUM(profit),2) AS total_profit
FROM superstore;

-- Total Quantity Sold
SELECT
    SUM(quantity) AS total_quantity
FROM superstore;

-- Distinct Regions
SELECT DISTINCT region
FROM superstore;

-- Distinct Categories
SELECT DISTINCT category
FROM superstore;

-- Distinct Segments
SELECT DISTINCT segment
FROM superstore;