
import pandas as pd

input_file = r"Data\raw\Sample - Superstore.csv"
output_file = r"Data\processed\Sample_Superstore_Clean.csv"

print("Reading CSV...")

df = pd.read_csv(
    input_file,
    encoding="latin1",
    engine="python",
    on_bad_lines="skip"
)

print(f"Rows Read: {len(df)}")

# Remove unwanted characters
df = df.replace("\xa0", " ", regex=True)

# Convert dates
df["Order Date"] = pd.to_datetime(
    df["Order Date"],
    errors="coerce"
).dt.strftime("%Y-%m-%d")

df["Ship Date"] = pd.to_datetime(
    df["Ship Date"],
    errors="coerce"
).dt.strftime("%Y-%m-%d")

# Trim spaces
for col in df.select_dtypes(include="object"):
    df[col] = df[col].str.strip()

# Save clean CSV
df.to_csv(
    output_file,
    index=False,
    encoding="utf-8"
)

print("================================")
print("✅ CLEAN CSV CREATED")
print("================================")
print(output_file)