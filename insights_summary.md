# Insights Summary – Music Store Data Analysis

A business-focused summary of findings from the SQL-based analysis of the Chinook Music Store dataset. 
This document highlights actionable insights derived through structured exploratory and advanced data analysis.
---

## 1. Dimensions Analysis

- **Artists**: 275 unique artists; *Iron Maiden* has the most albums (21).
- **Albums**: 347 albums; *Greatest Hits* has the most tracks (57).
- **Genres**: 25 distinct genres; *Rock* leads with 1,297 tracks.
- **Media Types**: 5 media types; *MPEG audio file* has 3,034 tracks.
- **Employees**: 6 designations including Sales Manager, IT Staff.
- **Customers**: Users from 59 countries; USA has the most (13 customers).

---

## 2. Date Analysis

- **Date Range**: Jan 3, 2017 to Dec 30, 2020.
- **Invoices per Year**: 154 (2017), 151 (2018), 159 (2019), 150 (2020).
- **Average Invoices per Month**: 12.79.

---

## 3. Measures Analysis

- **Total Revenue**: $4709.43.
- **Average Invoice Value**: $7.67.
- **Track Price Range**: $0.99 – $1.99 (Avg: $1.05).
- **Longest Track**: 88 minutes; **Shortest**: 1.07 minutes.
- **Average Track Size**: ~33.5 MB.

---

## 4. Magnitude Analysis

- **Top Customer**: Wyatt Girard ($23.76).
- **Top Country**: USA ($1040.49).
- **Top Genre by Revenue**: Rock ($2608.65).
- **Top Media Type**: MPEG audio file ($4216.41).
- **Top Artist**: Queen ($190.08).
- **Most Sold Track**: War Pigs (33 units).
- **Top Employee by Revenue**: Jane Peacock ($1731.51).

---

## 5. Ranking Analysis

- **Top 5 Customers**: František Wichterlová, Helena Holý, Hugh O'Reilly, Manoj Pareek, Luís Gonçalves.
- **Top 10 Tracks Sold**: War Pigs, Are You Experienced?, Changes, etc.
- **Top 5 Artists by Revenue**: Queen, Jimi Hendrix, Nirvana, RHCP, Pearl Jam.
- **Unsold Tracks**: 1697.
- **Least Popular Genres**: Drama, TV Shows, Soundtrack.

---

## 6. Change Over Time Analysis

- **Revenue per Year**: ~$1200 consistently.
- **Track Sales Volume**: Peaks early 2017.
- **New Customers**: Steady growth from 2017 onward.
- **Repeat Buyers**: 59 customers made multiple-month purchases.

---

## 7. Cumulative Analysis

- **Cumulative Revenue**: $4700+ over 4 years.
- **Cumulative Invoices**: Reached ~614 by end of 2020.
- **Track Sales**: Consistent upward trajectory from 2017.
- **Media Type & Country-wise Cumulative Growth**: MPEG and USA lead.

---

## 8. Performance Analysis

- **Avg Revenue per Invoice**: $7.67.
- **Avg Tracks per Invoice**: 7.75.
- **Top Avg Invoice Customers**: Multiple at $7.67.
- **Avg Revenue by Media Type**: MPEG leads with $10.08.

---

## 9. Part-to-Whole Analysis

- **Revenue by Genre**: Rock = 55.39% of total.
- **Revenue by Media Type**: MPEG audio = 89.53%.
- **Top 10 Customers**: Account for 23.71% of revenue.
- **Track Sales by Media**: MPEG = 89% of all sales.

---

## 10. Segmentation Analysis

- **Top Revenue per Customer by Country**: Czech Republic ($136.62).
- **City Behavior**: Prague = highest orders & spend.
- **Employee Impact**: Jane Peacock’s customers contributed the most.
- **Customer Tiering**: Gold/Silver/Bronze based on artist revenue.

---

- This summary represents a consolidated view of the most important business metrics and patterns observed.
- All insights were derived using SQL queries performed on a PostgreSQL version of the Chinook dataset.
- For full analysis scripts, refer to the `/scripts/` folder.
- For technical deployment and visual assets, refer to the `/docs/` folder.
