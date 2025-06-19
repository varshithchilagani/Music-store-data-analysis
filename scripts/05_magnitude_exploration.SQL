/*
===========================================
Magnitude Exploration

Tables Used: invoice, 
             invoice_line, 
             customer, 
             employee, 
             track, 
             album, 
             artist, 
             genre, 
             media_type
===========================================
*/

-- Q1: Which customer has spent the most?
SELECT 
	CONCAT_WS(' ', c.first_name, c.last_name) AS customer_name,
	i.total AS money_spent	
FROM
	customers c
LEFT JOIN 
	invoice i ON c.customer_id = i.customer_id
ORDER BY 
	money_spent DESC
LIMIT 1;

-- Q2: Which country contributed the most revenue?
SELECT 
	billing_country AS country,
	SUM(total) AS revenue_collected
FROM 
	invoice
GROUP BY
	billing_country
ORDER BY
	revenue_collected DESC
LIMIT 1;

-- Q3: Which genre generated the most revenue?
SELECT 
	g.name,
	SUM(i.unit_price * i.quantity) AS genre_revenue
FROM 
	genre g
JOIN 
	track t ON g.genre_id = t.genre_id
JOIN 
	invoice_line i ON t.track_id = i.track_id
GROUP BY 
	g.name
ORDER BY 
	genre_revenue DESC
LIMIT 1;

-- Q4: Which track has been sold the most (by quantity)?
SELECT 
	t.name,
	SUM(i.quantity) AS tracks_sold
FROM 
	track t
JOIN 
	invoice_line i ON t.track_id = i.track_id
GROUP BY 
	t.name
ORDER BY 
	tracks_sold DESC
LIMIT 1;

-- Q5: Which employee’s customers generated the most revenue?
SELECT 
	e.employee_id AS emp_id,
	CONCAT_WS(' ', e.first_name, e.last_name) AS emp_name,
	SUM(i.total) AS total_revenue
FROM
	employees e
JOIN
	customers c ON e.employee_id = c.support_rep_id
LEFT JOIN 
	invoice i ON c.customer_id = i.customer_id
GROUP BY 
	emp_id
ORDER BY 
	total_revenue DESC
LIMIT 1;

-- Q6: Which media type is the top revenue generator?
SELECT 
	m.name,
	SUM(i.unit_price * i.quantity) AS total_revenue
FROM 
	media_type m
JOIN 
	track t ON m.media_type_id = t.media_type_id
JOIN 
	invoice_line i ON t.track_id = i.track_id
GROUP BY 
	m.name
ORDER BY 
	total_revenue DESC
LIMIT 1;

-- Q7: Which artist has generated the most revenue?
SELECT 
	a.name,
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
	a.name
ORDER BY 
	total_revenue DESC
LIMIT 1;




