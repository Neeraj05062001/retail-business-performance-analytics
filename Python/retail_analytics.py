"""
===========================================================
Retail Business Performance Analytics
Python Analytics Automation

Author : Neeraj Samineni
===========================================================
"""

import pandas as pd
from pathlib import Path

# ----------------------------------------------------------
# File Paths
# ----------------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent.parent

INPUT_FILE = BASE_DIR / "Data" / "Raw" / "Sample - Superstore.csv"
OUTPUT_DIR = BASE_DIR / "Data" / "Processed"

OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# ----------------------------------------------------------
# Load Dataset
# ----------------------------------------------------------

df = pd.read_csv(INPUT_FILE)

print("=" * 60)
print("RETAIL BUSINESS PERFORMANCE ANALYTICS")
print("=" * 60)

print(f"\nTotal Records : {len(df)}")
print(f"Total Columns : {len(df.columns)}")

# ----------------------------------------------------------
# Data Cleaning
# ----------------------------------------------------------

df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

df = df.drop_duplicates()

df.columns = (
    df.columns
      .str.strip()
      .str.lower()
      .str.replace(" ", "_")
      .str.replace("-", "_")
)

# ----------------------------------------------------------
# Business KPIs
# ----------------------------------------------------------

total_sales = df["sales"].sum()
total_profit = df["profit"].sum()
total_orders = df["order_id"].nunique()
total_customers = df["customer_id"].nunique()
total_products = df["product_id"].nunique()

print("\n========== BUSINESS KPIs ==========\n")

print(f"Total Sales      : ${total_sales:,.2f}")
print(f"Total Profit     : ${total_profit:,.2f}")
print(f"Total Orders     : {total_orders}")
print(f"Total Customers  : {total_customers}")
print(f"Total Products   : {total_products}")

# ----------------------------------------------------------
# Sales by Category
# ----------------------------------------------------------

category_sales = (
    df.groupby("category")["sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\n========== SALES BY CATEGORY ==========\n")
print(category_sales)

# ----------------------------------------------------------
# Sales by Region
# ----------------------------------------------------------

region_sales = (
    df.groupby("region")["sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\n========== SALES BY REGION ==========\n")
print(region_sales)

# ----------------------------------------------------------
# Top 10 Customers
# ----------------------------------------------------------

top_customers = (
    df.groupby("customer_name")["sales"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

print("\n========== TOP 10 CUSTOMERS ==========\n")
print(top_customers)

# ----------------------------------------------------------
# Top 10 Products
# ----------------------------------------------------------

top_products = (
    df.groupby("product_name")["sales"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

print("\n========== TOP 10 PRODUCTS ==========\n")
print(top_products)

# ----------------------------------------------------------
# Monthly Sales
# ----------------------------------------------------------

df["order_month"] = df["order_date"].dt.to_period("M")

monthly_sales = (
    df.groupby("order_month")["sales"]
      .sum()
      .reset_index()
)

monthly_sales["order_month"] = monthly_sales["order_month"].astype(str)

print("\n========== MONTHLY SALES ==========\n")
print(monthly_sales)

# ----------------------------------------------------------
# Export Reports
# ----------------------------------------------------------

category_sales.to_csv(
    OUTPUT_DIR / "category_sales.csv"
)

region_sales.to_csv(
    OUTPUT_DIR / "region_sales.csv"
)

top_customers.to_csv(
    OUTPUT_DIR / "top_customers.csv"
)

top_products.to_csv(
    OUTPUT_DIR / "top_products.csv"
)

monthly_sales.to_csv(
    OUTPUT_DIR / "monthly_sales.csv",
    index=False
)

df.to_csv(
    OUTPUT_DIR / "superstore_clean.csv",
    index=False
)

print("\n==========================================")
print("Analytics Completed Successfully")
print("Reports Generated Successfully")
print("==========================================")