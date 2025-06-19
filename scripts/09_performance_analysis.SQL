/*
===========================================
Performance Analysis
Tables Used: invoice, 
             invoice_line, 
             customer, 
             track, 
             genre, 
             media_type
===========================================
*/

-- Q1: What is the average revenue per invoice?
SELECT 
	ROUND(AVG(total), 2) AS avg_revenue 
FROM invoice;

-- Q2: Which customers have the highest average invoice value?
SELECT 
	CONCAT_WS(' ', c.first_name, c.last_name) AS customer_name,
	ROUND(AVG(i.total), 2) AS avg_invoice_value
FROM
	customers c
JOIN 
	invoice i ON c.customer_id = c.customer_id
GROUP BY
	customer_name
ORDER BY
	avg_invoice_value DESC
LIMIT 10;
	
-- Q3: What is the average number of tracks per invoice?
SELECT
	ROUND(AVG(track_count), 2) AS avg_track_per_invoice
FROM (
	SELECT
		invoice_id,
		SUM(quantity) AS track_count
	FROM
		invoice_line
	GROUP BY
		invoice_id
) sub;	
	
-- Q4: What is the average revenue per genre?	
SELECT 
    g.name AS genre,
    ROUND(AVG(i.total), 2) AS avg_revenue_per_invoice_for_genre
FROM genre g
JOIN track t ON g.genre_id = t.genre_id
JOIN invoice_line il ON t.track_id = il.track_id
JOIN invoice i ON il.invoice_id = i.invoice_id
GROUP BY g.name
ORDER BY avg_revenue_per_invoice_for_genre DESC;

-- Q5: What is the average revenue per media type?
SELECT 
    m.name AS media_type,
    ROUND(AVG(i.total), 2) AS avg_revenue_per_invoice_for_media_type
FROM media_type m
JOIN track t ON m.media_type_id = t.media_type_id
JOIN invoice_line il ON t.track_id = il.track_id
JOIN invoice i ON il.invoice_id = i.invoice_id
GROUP BY m.name
ORDER BY avg_revenue_per_invoice_for_media_type DESC;
