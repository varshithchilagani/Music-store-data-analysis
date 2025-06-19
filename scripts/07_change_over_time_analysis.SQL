/*
===========================================
Change Over Time Analysis
Tables Used: invoice, 
             invoice_line, 
             customer
===========================================
*/

-- Q1: Monthly revenue trend
SELECT 
	DATE_TRUNC('month', invoice_date) AS month,
	SUM(total) AS total_revenue
FROM
	invoice
GROUP BY 
	month
ORDER BY
	month;

-- Q2: Year-over-year total revenue trend
SELECT 
	DATE_TRUNC('year', invoice_date) AS year,
	SUM(total) AS total_revenue
FROM
	invoice
GROUP BY 
	year
ORDER BY 
	year;

-- Q3: Monthly trend of track sales volume (total quantity sold)
SELECT
	DATE_TRUNC('month', invoice_date) AS month,
	SUM(il.quantity) AS total_sales
FROM
	invoice i
JOIN
	invoice_line il ON i.invoice_id = il.invoice_id
GROUP BY
	month
ORDER BY
	month;

-- Q4: Number of new customers acquired per month
SELECT
	DATE_TRUNC('month', i.invoice_date) AS month,
	COUNT(DISTINCT c.customer_id) AS new_customers
FROM
	customers c
JOIN 
	invoice i ON c.customer_id = i.customer_id
GROUP BY 
	month
ORDER BY
	month

-- Q5: Monthly trend of active customers
SELECT
	DATE_TRUNC('month', invoice_date) AS month,
	COUNT(DISTINCT customer_id) AS active_customers
FROM
	invoice
GROUP BY
	month
ORDER BY
	month;
	
-- Q6: How many customers made repeat purchases per month(more than one month)
SELECT COUNT(*) AS repeat_customers FROM (
SELECT
		customer_id,
		COUNT(DISTINCT DATE_TRUNC('month', invoice_date)) AS months_active
	FROM
		invoice
	GROUP BY
		customer_id
)
WHERE months_active > 1;