# Music Store Data Analysis 📊

An end-to-end SQL-based data analytics project performed on the Chinook music store dataset. The goal is to extract business insights using structured SQL queries and showcase real-world analytical thinking and cloud deployment.

---

## 🚀 Project Overview

- Performed 12-step structured business analysis using PostgreSQL.
- Explored 11 relational tables of the music store dataset.
- Organized SQL queries into focused, modular scripts.
- Deployed the project database to **AWS RDS (PostgreSQL)** for cloud-based querying and demonstration.

---

## 📁 Project Structure

```plaintext
.
├── dataset/                   # Original CSV files used to build the database music_store_db
├── scripts/                   # All analysis queries categorized step-wise
├── insights_summary.md        # Key business insights from SQL analysis
└── docs/                      # ER Diagram, screenshots


---

## 🔍 Analysis Highlights

This project includes both Exploratory and Advanced Analytical insights:

- **Dimensions Analysis** – Artists, Albums, Genres, Media, Employees, Customers
- **Date Analysis** – Sales timeline, invoice volume per month/year
- **Measures Analysis** – Revenue, track duration, track size
- **Magnitude & Ranking** – Top customers, top artists, best-selling tracks
- **Change Over Time** – Revenue trends, active customer growth
- **Cumulative Metrics** – Revenue buildup, purchases over time
- **Performance Analysis** – Average sales metrics
- **Part to Whole Analysis** – Share of revenue by genre, customer, country
- **Segmentation** – Customers by country, city, and employees
- **Reporting** – Business summary for stakeholders

---

## ☁️ Cloud Deployment – AWS RDS

- The PostgreSQL database was deployed to **Amazon RDS**.
- Connected and tested using **pgAdmin** and PostgreSQL client.
- AWS deployment steps and screenshots are available in `/docs`.

---

## 🛠️ Tech Stack

- **SQL (PostgreSQL)**
- **AWS RDS**
- **pgAdmin**
- **Excel** (for CSV preview)
- **VS Code** (for SQL scripting)
- **GitHub** (for version control and portfolio hosting)

---

## ▶️ How to Run This Project Locally

1. Clone the repository.
2. Use any PostgreSQL-compatible tool (e.g., pgAdmin, DBeaver).
3. Run `00_table_schema.sql` to create schema and tables.
4. Import CSV files into tables.
5. Run scripts in `scripts/` sequentially.
6. Review business insights from `insights_summary.md`.

---

## 📊 Key Business Insights

- *Rock* is the most popular genre (by revenue and quantity).
- *MPEG Audio File* generates over 89% of total sales.
- *Queen* is the top artist by revenue.
- *USA* is the leading country by number of customers and revenue.
- Around 1700 tracks were never sold.
- Top 10 customers contribute nearly 24% of the store’s revenue.

👉 Full insights are available in [`insights_summary.md`](./insights_summary.md)

---

## 📄 Documentation in `/docs`

- ER Diagram
- AWS RDS Deployment Screenshots

---

## 👤 Author

**Varshith Chilagani**  
Aspiring **Data Engineer** with strong foundations in **SQL, cloud platforms (AWS)**, and **data analytics**.  
Focused on building scalable data solutions while also capable of performing analytical deep dives for business insights.

[LinkedIn](https://www.linkedin.com/in/varshith-chilagani) | [GitHub](https://github.com/varshithchilagani)

---



