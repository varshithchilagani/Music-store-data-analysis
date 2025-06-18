-- 1. Artist table
CREATE TABLE IF NOT EXISTS artists(
    artist_id	SERIAL PRIMARY KEY,
    name 		VARCHAR(100) NOT NULL
);


-- 2. Album table
CREATE TABLE IF NOT EXISTS albums(
    album_id 		SERIAL PRIMARY KEY,
    title 			VARCHAR(100) NOT NULL,
    artist_id 		INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);


-- 3. Genre table
CREATE TABLE IF NOT EXISTS genre(
    genre_id 	SERIAL PRIMARY KEY,
    name 		VARCHAR(50)
);


-- 4. Media_type table
CREATE TABLE IF NOT EXISTS media_type(
    media_type_id 	SERIAL PRIMARY KEY,
    name 			VARCHAR(50)
);


-- 5. Playlist table
CREATE TABLE IF NOT EXISTS playlist(
    playlist_id 	SERIAL PRIMARY KEY,
    name 			VARCHAR(50)
);



-- 6. Track table
CREATE TABLE IF NOT EXISTS track(
    track_id 		SERIAL PRIMARY KEY,
    name 			VARCHAR(250),
    album_id 		INT,
    media_type_id 	INT,
    genre_id 		INT,
    composer 		VARCHAR(200),
    milliseconds 	INT,
    bytes 			INT,
    unit_price 		DECIMAL(5,2),
    FOREIGN KEY(album_id) REFERENCES albums(album_id),
    FOREIGN KEY(media_type_id) REFERENCES media_type(media_type_id),
    FOREIGN KEY(genre_id) REFERENCES genre(genre_id)
);


-- 7. Playlist_track table
CREATE TABLE IF NOT EXISTS Playlist_track(
    playlist_id 	INT,
    track_id 		INT,
    FOREIGN KEY(playlist_id) REFERENCES playlist(playlist_id),
    FOREIGN KEY(track_id) REFERENCES track( track_id)
);


-- 8. Employee table
CREATE TABLE IF NOT EXISTS employees(
    employee_id		SERIAL PRIMARY KEY,
    last_name 		VARCHAR(100),
    first_name 		VARCHAR(100),
    title 			VARCHAR(200),
    reports_to 		INT,
    levels 			VARCHAR(20),
    birthdate 		DATE,
    hire_date 		DATE,
    address			VARCHAR(300),
    city 			VARCHAR(100),
    state 			VARCHAR(50),
    country			VARCHAR(50),
    postal_code 	VARCHAR(100),
    phone 			VARCHAR(50),
    fax				VARCHAR(100),
    email 			VARCHAR(100)
);


-- 9. Customers table
CREATE TABLE IF NOT EXISTS customers(
    customer_id		SERIAL PRIMARY KEY,
    first_name		VARCHAR(100),
    last_name		VARCHAR(100),
    company			VARCHAR(300),
    address			VARCHAR(300),
    city			VARCHAR(50),
    state			VARCHAR(50),
    country			VARCHAR(50),
    postal_code		VARCHAR(100),
    phone			VARCHAR(25),
    fax				VARCHAR(100),
    email			VARCHAR(200),
    support_rep_id 	INT
)


-- 10. Invoice table
CREATE TABLE IF NOT EXISTS invoice(
    invoice_id 				SERIAL PRIMARY KEY,
    customer_id				INT,
    invoice_date 			DATE,
    billing_address			VARCHAR(300),
    billing_city 			VARCHAR(50),
    billing_state 			VARCHAR(50),
    billing_country 		VARCHAR(50),
    billing_postal_code		VARCHAR(100),
    total 					DECIMAL(5,2),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);


-- 11. Invoice line table
CREATE TABLE IF NOT EXISTS invoice_line(
    invoice_line_id 	SERIAL PRIMARY KEY,
    invoice_id 			INT,
    track_id 			INT,
    unit_price 			DECIMAL(5,2),
    quantity 			INT,
    FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY(track_id) REFERENCES track(track_id)
);



