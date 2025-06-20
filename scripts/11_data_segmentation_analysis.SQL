/*
===========================================
Data Segmentation Analysis
Tables Used: invoice, 
             invoice_line, 
             customer, 
             employee, 
             genre, 
             media_type, 
             artist
===========================================
*/

-- Q1: Average revenue per customer by country
SELECT
	c.country,
	SUM(i.total)/COUNT(DISTINCT c.customer_id)
	AS avg_revenue_per_customer
FROM 
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
GROUP BY
	c.country
ORDER BY 
	avg_revenue_per_customer DESC;

-- Q2: Segment customer behavior by city
SELECT
	c.city,
	COUNT(i.invoice_id) AS total_invoices,
	SUM(i.total) AS total_spent,
	ROUND(AVG(i.total), 2) AS avg_spending
FROM 
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
GROUP BY
	c.city
ORDER BY
	total_spent DESC;

-- Q3: Segment customers by their support rep (employee)
SELECT
	e.employee_id,
	CONCAT_WS(' ', e.first_name, e.last_name) AS emp_name,
	COUNT(DISTINCT c.customer_id) AS no_of_customers,
	COUNT(i.invoice_id) AS total_invoices,
	SUM(i.total) AS total_revenue,
	ROUND(AVG(i.total), 2) AS avg_spending
FROM 
	customers c
JOIN
	employees e ON c.support_rep_id = e.employee_id
JOIN
	invoice i ON c.customer_id = i.customer_id
GROUP BY
	e.employee_id
ORDER BY
	no_of_customers DESC;

-- Q4: Segment invoices by size (Small, Medium, Large)
SELECT
	invoice_id,
	total,
	CASE
		WHEN total <= 5 THEN 'small'
		WHEN total BETWEEN 5 AND 15 THEN 'medium'
		ELSE 'large'
	END AS invoice_size
FROM 
	invoice;

-- Q5: Distribution of invoice size categories per country
WITH 
invoice_segments AS( 
SELECT
	c.country,
	i.invoice_id,
	i.total,
	CASE
		WHEN total <= 5 THEN 'small'
		WHEN total BETWEEN 5 AND 15 THEN 'medium'
		ELSE 'large'
	END AS invoice_size
FROM 
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
)
SELECT
	country,
	invoice_size,
	COUNT(*) AS invoice_segments
FROM 
	invoice_segments
GROUP BY
	country, 
	invoice_size
ORDER BY
	country, 
	invoice_size;

-- Q6: Sales pattern across different genres
SELECT
	g.name,
	SUM(il.quantity) AS total_sales,
	SUM(il.unit_price * il.quantity) AS total_revenue,
	ROUND(AVG(il.unit_price * il.quantity) ,2) AS avg_sales_per_revenue
FROM
	genre g
JOIN 
	track t ON t.genre_id = g.genre_id
JOIN
	invoice_line il ON t.track_id = il.track_id
GROUP BY
	g.name
ORDER BY
	total_revenue DESC;

-- Q7: Media type popularity across countries
SELECT
	c.country,
	m.name AS media_type,
	COUNT(il.quantity) AS track_sales
FROM
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
JOIN
	invoice_line il ON il.invoice_id = i.invoice_id
JOIN
	track t ON t.track_id = il.track_id
JOIN
	media_type m ON m.media_type_id = t.media_type_id
GROUP BY
	c.country, 
	m.name
ORDER BY
	c.country, 
	track_sales DESC;

-- Q8: Segment top tracks by genre and revenue tier
WITH 
track_revenue AS(
SELECT
	t.track_id,
	t.name AS track_name,
	g.name AS genre,
	SUM(il.unit_price * il.quantity) AS revenue
FROM
	track t
JOIN 
	invoice_line il ON t.track_id = il.track_id
JOIN
	genre g ON t.genre_id = g.genre_id
GROUP BY
	t.track_id, track_name, genre
)
SELECT 
	track_name,
	genre,
	revenue,
	CASE
		WHEN revenue <= 5 THEN 'bronze'
		WHEN revenue BETWEEN 5 AND 15 THEN 'silver'
		ELSE 'gold'
	END AS revenue_tier
FROM 
	track_revenue
ORDER BY
	revenue DESC;

-- Q9: Segment artists by total sales into Gold/Silver/Bronze tiers
WITH 
artist_sales AS(
SELECT
	a.artist_id,
	a.name,
	SUM(il.quantity) AS total_sales
FROM
	artists a
JOIN 
	albums ab ON a.artist_id = ab.artist_id
JOIN
	track t ON t.album_id = ab.album_id
JOIN
	invoice_line il ON il.track_id = t.track_id
GROUP BY
	a.artist_id,
	a.name
ORDER BY
	total_sales DESC
)
SELECT
	artist_id,
	name,
	total_sales,
	CASE
		WHEN total_sales <= 50 THEN 'bronze'
		WHEN total_sales BETWEEN 50 AND 100 THEN 'silver'
		ELSE 'gold'
	END AS artist_tier
FROM
	artist_sales;

























