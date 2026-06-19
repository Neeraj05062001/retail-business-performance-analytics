import pandas as pd

# Load Dataset
df = pd.read_csv("../Data/Raw/Sample - Superstore.csv")

# Display basic information
print("=" * 50)
print("DATASET INFORMATION")
print("=" * 50)

print(df.info())

print("\nFirst 5 Rows")
print(df.head())

print("\nMissing Values")
print(df.isnull().sum())

print("\nDuplicate Rows")
print(df.duplicated().sum())

# Convert Dates
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

# Save cleaned dataset
df.to_csv("../Data/Processed/Superstore_Clean.csv", index=False)

print("\n✅ Clean dataset saved successfully.")