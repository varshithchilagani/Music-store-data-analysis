/*
===========================================
Reporting & Insights
Objective: View key insights in summary format
===========================================
*/

-- Total Revenue
SELECT 
	ROUND(SUM(total), 2) AS total_revenue
FROM
	invoice;
-- 4709.43 $


-- Total Customers
SELECT
	COUNT(*) AS total_customers
FROM
	customers;
-- 59

-- Total Tracks
SELECT 
	COUNT(*) AS total_tracks
FROM
	track;
-- 3503

-- Top Revenue-Generating Genre
SELECT
	g.name AS genre,
	SUM(il.unit_price * il.quantity) AS total_revenue
FROM
	genre g
JOIN
	track t ON t.genre_id = g.genre_id
JOIN 
	invoice_line il ON t.track_id = il.track_id
GROUP BY
	genre
ORDER BY 
	total_revenue DESC
LIMIT 1;
-- Genre: ROCK, Revenue: 2608.65

-- Most Valuable Customer
SELECT
	c.customer_id,
	CONCAT_WS(' ', c.first_name, c.last_name) AS customer_name,
	SUM(i.total) AS total_spending
FROM
	customers c
JOIN
	invoice i ON i.customer_id = c.customer_id
GROUP BY 
	c.customer_id,
	customer_name
ORDER BY
	total_spending DESC
LIMIT 1;
-- customer_id: 5, customer_name: František Wichterlová, totak_spending: 144.54$

-- Country Contributing Highest Revenue
SELECT
	c.country,
	SUM(i.total) AS total_spending
FROM
	customers c
JOIN
	invoice i ON i.customer_id = c.customer_id
GROUP BY 
	c.country
ORDER BY
	total_spending DESC
LIMIT 1;
-- country: USA, total_spending: 1040.49$