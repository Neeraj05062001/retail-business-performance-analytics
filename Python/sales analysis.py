import pandas as pd

# Load cleaned dataset
df = pd.read_csv("../Data/Processed/Superstore_Clean.csv")

# KPIs
print("=" * 50)
print("BUSINESS KPIs")
print("=" * 50)

print(f"Total Sales      : {df['Sales'].sum():,.2f}")
print(f"Total Profit     : {df['Profit'].sum():,.2f}")
print(f"Total Orders     : {df['Order ID'].nunique()}")
print(f"Total Customers  : {df['Customer ID'].nunique()}")

print("\nTop 10 Customers")

top_customers = (
    df.groupby("Customer Name")["Sales"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

print(top_customers)

print("\nTop Categories")

print(
    df.groupby("Category")["Sales"]
      .sum()
      .sort_values(ascending=False)
)

print("\nRegion-wise Sales")

print(
    df.groupby("Region")["Sales"]
      .sum()
      .sort_values(ascending=False)
)