/*
===========================================
Cumulative Analysis
Tables Used: invoice, 
             invoice_line, 
             track, 
             customer, 
             genre, 
             media_type
===========================================
*/

-- Q1: What is the cumulative revenue over time (monthly)?
SELECT
	DATE_TRUNC('month', invoice_date) AS month,
	SUM(total) AS revenue,
	ROUND(SUM(SUM(total)) OVER (ORDER BY DATE_TRUNC('month', invoice_date)), 2)
	AS cumulative_revenue
FROM 
	invoice
GROUP BY
	month
ORDER BY
	month;

-- Q2: Running total of invoices issued over time
SELECT
	DATE_TRUNC('month', invoice_date) AS month,
	COUNT(*) AS invoices,
	ROUND(SUM(COUNT(*)) OVER(ORDER BY DATE_TRUNC('month', invoice_date)), 2) AS cumulative_invoices
FROM
	invoice
GROUP BY
	month
ORDER BY
	month;

-- Q3: Cumulative number of tracks sold (by quantity) over time
SELECT
	DATE_TRUNC('month', i.invoice_date) AS months,
	SUM(il.quantity) AS tracks_sold,
	SUM(SUM(il.quantity)) OVER(ORDER BY DATE_TRUNC('month', i.invoice_date)) AS cumulative_sales
FROM
	invoice i
JOIN
	invoice_line il ON i.invoice_id = il.invoice_id 
GROUP BY
	months
ORDER BY
	months;

-- Q4: Cumulative revenue by genre over time
SELECT
	DATE_TRUNC('month', i.invoice_date) AS months,
	g.name AS genre,
	SUM(il.unit_price * il.quantity) AS total_revenue,
	ROUND(SUM(SUM(il.unit_price * il.quantity)) 
	OVER
	(PARTITION BY g.name ORDER BY DATE_TRUNC('month', i.invoice_date)), 2) 
	AS cumulative_revenue
FROM 
	genre g
JOIN
	track t ON g.genre_id = t.genre_id
JOIN
	invoice_line il ON t.track_id = il.track_id
JOIN
	invoice i ON i.invoice_id = il.invoice_id
GROUP BY
	months, g.name
ORDER BY
	g.name,months;

-- Q5: Compare cumulative revenue of top 3 countries over time
WITH country_revenue AS (
    SELECT 
        c.country,
        DATE_TRUNC('month', i.invoice_date) AS month,
        SUM(i.total) AS monthly_revenue
    FROM invoice i
    JOIN customers c ON i.customer_id = c.customer_id
    GROUP BY c.country, month
),
top_3 AS (
    SELECT country
    FROM invoice i
    JOIN customers c ON i.customer_id = c.customer_id
    GROUP BY c.country
    ORDER BY SUM(i.total) DESC
    LIMIT 3
)
SELECT 
    cr.month,
    cr.country,
    cr.monthly_revenue,
    SUM(cr.monthly_revenue) OVER (PARTITION BY cr.country ORDER BY cr.month) AS cumulative_revenue
FROM country_revenue cr
JOIN top_3 t3 ON cr.country = t3.country
ORDER BY cr.country, cr.month;

-- Q6: Cumulative purchases by media type
SELECT
	m.name AS media_type,
	DATE_TRUNC('month', i.invoice_date) AS months,
	SUM(il.quantity) AS total_purchases,
	SUM(SUM(il.quantity)) 
	OVER(PARTITION BY m.name ORDER BY DATE_TRUNC('month', i.invoice_date)) AS cumulative_purchases
FROM
	media_type m
JOIN
	track t ON m.media_type_id = t.media_type_id
JOIN
	invoice_line il ON il.track_id = t.track_id
JOIN
	invoice i ON i.invoice_id = il.invoice_id
GROUP BY
	m.name, months
ORDER BY
	months;

