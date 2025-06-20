# Data Cleaning & Preparation Notes

This document explains the adjustments made to some dataset files to ensure they were compatible with AWS RDS (PostgreSQL). These changes were necessary for smooth data ingestion and did not affect the meaning or structure of the data.

---

## 1. Date Format Correction

- **Affected Files**: `employee.csv`, `invoice.csv`
- **Issue**: Date fields included time components (e.g., `YYYY-MM-DD 00:00:00`), which caused errors in PostgreSQL.
- **Fix Applied**: Converted all date values to `YYYY-MM-DD` format to match PostgreSQL’s `DATE` data type requirement.

---

## 2. Integer Format Adjustment

- **Affected Files**: `invoice_line.csv` and others
- **Issue**: Some numeric values meant to be integers (e.g., `9.0`) were stored with decimal points.
- **Fix Applied**: Converted these values to plain integers (e.g., `9.0` → `9`) for compatibility with PostgreSQL’s `INTEGER` type.

---

## 3. Column Consistency Check

- **Action Taken**: Verified column names and data types across all CSVs to ensure they matched the SQL schema used in the AWS RDS database.

---

## Note

- Original raw files are in the `Datasets/` folder.
- Cleaned versions were used only for cloud database upload.
- These changes reflect learning and adaptation to real-world cloud database environments.
