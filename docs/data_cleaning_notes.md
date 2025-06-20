# Data Cleaning Notes

This document outlines the small but necessary data transformations performed to make the raw dataset compatible with AWS RDS (PostgreSQL).

---

## 🧾 Issues Encountered

### 1. Timestamp Format in `employee.csv` and `invoice.csv`

- **Issue**: `HireDate` and `InvoiceDate` columns had the format `YYYY-MM-DD 00:00:00`, which worked locally but caused format errors in AWS PostgreSQL.
- **Solution**: Reformatted the date to `YYYY-MM-DD` using Excel before uploading.

---

### 2. Float-to-Integer Mismatch

- **Issue**: Some columns expected integers (like IDs), but had float values like `9.0`, which PostgreSQL rejected.
- **Solution**: Cast float-like values to integers using spreadsheet tools before importing.

---

### 3. Encoding Differences

- **Observation**: AWS PostgreSQL can be stricter about special characters or delimiters.
- **Preventive Step**: All CSVs were saved in UTF-8 encoding and delimiter issues were double-checked.

---

## ✅ Outcome

All tables were successfully ingested into AWS RDS after these changes. No schema changes were made — only minor format adjustments. These are typical data engineering challenges and were documented for transparency.

