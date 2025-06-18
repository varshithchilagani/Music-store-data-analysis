/*
===========================================
 Date Exploration
Tables Used: invoice
-- ===========================================
*/

-- Q1: What is the date range of the sales data (first and last invoice date)?
SELECT 
	MIN(invoice_date) AS first_invoice_date,
	MAX(invoice_date) AS last_invoice_date
FROM
	invoice;

-- Q2: How many invoices were created per month?
SELECT
	DATE_TRUNC('month', invoice_date) AS invoice_month,
	COUNT(*) AS total_invoices
FROM
	invoice
GROUP BY
	invoice_month
ORDER BY
	invoice_month;

-- Q3: What is the average number of invoices per month?
WITH monthly_avg AS(
SELECT
	DATE_TRUNC('month', invoice_date) AS invoice_month,
	COUNT(*) AS total_invoices
FROM
	invoice
GROUP BY
	invoice_month
ORDER BY
	invoice_month
)
SELECT
	ROUND(AVG(total_invoices), 2) AS avg_invoice FROM monthly_avg;

-- Q4: In how many unique years does the sales data exist?
SELECT 
	COUNT(DISTINCT EXTRACT(YEAR FROM invoice_date)) AS total_years
FROM invoice;

-- Q5: What is the invoice count per year?
SELECT
	EXTRACT(YEAR FROM invoice_date) AS year,
	COUNT(*) AS invoice_count
FROM 
	invoice
GROUP BY 
		YEAR
ORDER BY 
		YEAR;

