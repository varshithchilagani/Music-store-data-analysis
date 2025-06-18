/*
===========================================
Dimensions Exploration

Tables Used: artist, albums, genre, media_type, track, employees, customers
===========================================
*/

--  Artist Dimension
-- Q1: How many unique artists are there?
SELECT COUNT(DISTINCT(artist_id))
AS no_of_artists
FROM artists;

-- Q2: Which artist has the highest number of albums?
SELECT 
	a.name, 
	COUNT(ab.album_id) AS album_count
FROM 
	artists a
LEFT JOIN 
	albums ab ON a.artist_id = ab.artist_id
GROUP BY 
	a.name
ORDER BY 
	album_count DESC
LIMIT 1;

--  Album Dimension
-- Q3: How many albums are there?
SELECT COUNT(*) AS total_albums FROM albums;

-- Q4: Which album contains the most tracks?
SELECT 
	a.title, 
	COUNT(t.track_id) AS track_count
FROM 
	albums a
LEFT JOIN 
	track t ON a.album_id = t.album_id
GROUP BY 
	a.title
ORDER BY 
	track_count DESC
LIMIT 1;

--  Genre Dimension
-- Q5: How many music genres are present?
SELECT COUNT(*) AS genre_count FROM genre;

-- Q6: Which genre has the highest number of tracks?
SELECT g.name, 
	COUNT(t.track_id) AS track_count
FROM 
	genre g
LEFT JOIN 
	track t ON g.genre_id = t.genre_id
GROUP BY 
	g.name
ORDER BY 
	track_count DESC
LIMIT 1;

-- Media Type Dimension
-- Q7: What are the different media types in the store?
SELECT 
	COUNT(*) AS media_type_count
FROM media_type;

-- Q8: Which media type has the most tracks?
SELECT m.name, 
	COUNT(track_id) AS track_count
FROM 
	media_type m
LEFT JOIN 
	track t ON m.media_type_id = t.media_type_id
GROUP BY 
	m.name
ORDER BY 
	track_count DESC
LIMIT 1;

--  Employee Dimension
-- Q9: What are the different designations of employees?
SELECT 
	DISTINCT title AS designations
FROM employees;

--  Customer Dimension
-- Q10: From how many countries do customers come?
SELECT 
	COUNT(country) AS country_count
FROM customers;

-- Q11: What is the customer distribution by country?
SELECT country, 
	COUNT(customer_id) AS customer_distribution
FROM 
	customers
GROUP BY 
	country
ORDER BY 
	customer_distribution DESC;
