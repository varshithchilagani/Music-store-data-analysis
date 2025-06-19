/*
===========================================
Ranking Exploration
Tables Used: invoice, 
             invoice_line, 
             customer, 
             track, 
             artist, 
             genre
===========================================
*/

-- Q1: Top 5 customers by total revenue
SELECT
	CONCAT_WS(' ', c.first_name, c.last_name) AS customer_name,
	SUM(i.total) AS total_revenue
FROM
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
GROUP BY
	customer_name
ORDER BY 
	total_revenue DESC
LIMIT 5;

-- Q2: Top 10 most sold tracks (by quantity)
SELECT
	t.name AS track_name,
	SUM(i.quantity) AS total_sales
FROM
	track t
JOIN
	invoice_line i ON t.track_id = i.track_id
GROUP BY
	t.name
ORDER BY 
	total_sales DESC
LIMIT 10;

-- Q3: Top 5 artists by total revenue
SELECT
	a.artist_id,
	a.name AS artist_name,
	SUM(i.unit_price * i.quantity) AS total_revenue
FROM
	artists a
JOIN
	albums ab ON a.artist_id = ab.artist_id
JOIN
	track t ON ab.album_id = t.album_id
JOIN
	invoice_line i ON t.track_id = i.track_id
GROUP BY
	a.artist_id
ORDER BY 
	total_revenue DESC
LIMIT 5;

-- Q4: Top 5 countries by revenue
SELECT 
	c.country, 
	SUM(i.total) AS total_revenue
FROM
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
GROUP BY
	c.country
ORDER BY 
	total_revenue DESC
LIMIT 5;

-- Q5: Top 3 genres by number of sales
SELECT
	g.genre_id,
	g.name AS genre_name,
	SUM(i.quantity) AS total_sales
FROM
	genre g
JOIN
	track t ON g.genre_id = t.genre_id
JOIN
	invoice_line i ON t.track_id = i.track_id
GROUP BY
	g.genre_id
ORDER BY 
	total_sales DESC
LIMIT 3;

-- Q6: Tracks that have never been sold
SELECT
	t.name AS track_name
FROM
	track t
LEFT JOIN
	invoice_line i ON t.track_id = i.track_id
WHERE i.track_id IS NULL;

-- count of unsold tracks
SELECT
	COUNT(t.track_id) AS unsold_tracks
FROM
	track t
LEFT JOIN
	invoice_line i ON t.track_id = i.track_id
WHERE 
	i.track_id IS NULL;

-- Q7: Bottom 5 customers by total revenue
SELECT
	CONCAT_WS(' ', c.first_name, c.last_name) AS customer_name,
	SUM(i.total) AS total_revenue
FROM
	customers c
JOIN
	invoice i ON c.customer_id = i.customer_id
GROUP BY
	customer_name
ORDER BY 
	total_revenue
LIMIT 5;

-- Q8: Least popular genres by number of track sales
SELECT
	g.genre_id,
	g.name AS genre_name,
	SUM(i.quantity) AS total_sales
FROM
	genre g
JOIN
	track t ON g.genre_id = t.genre_id
JOIN
	invoice_line i ON t.track_id = i.track_id
GROUP BY
	g.genre_id
ORDER BY 
	total_sales
LIMIT 5;