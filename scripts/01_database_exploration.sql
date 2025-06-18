/*
===========================================================================================
EXPLORATORY DATA ANALYSIS - DATABASE EXPLORATION
===========================================================================================
Purpose:
	- To explore the the list of tables and their schemas in the database.
        - To inspect the columns and metadata for specific tables.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
============================================================================================
*/


-- What tables exist in the database, and what are their primary columns and datatypes?

-- List of tables in the database
SELECT    
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'public';   


-- Retrieve all columns and their datatypes for 'artists' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'artists';

-- Retrieve all columns and their datatypes for 'invoice' table
SELECT 
	COLUMN_NAME,
	DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'invoice';

-- Retrieve all columns and their datatypes for 'albums' table
SELECT
	COLUMN_NAME,
	DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'albums';

-- Retrieve all columns and their datatypes for 'genre' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'genre';

-- Retrieve all columns and their datatypes for 'media_type' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'media_type';

-- Retrieve all columns and their datatypes for 'playlist' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'playlist';

-- Retrieve all columns and their datatypes for 'track' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'track';

-- Retrieve all columns and their datatypes for 'playlist_track' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'playlist_track';

-- Retrieve all columns and their datatypes for 'employees' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'employees';

-- Retrieve all columns and their datatypes for 'customers' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers';

-- Retrieve all columns and their datatypes for 'invoice' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'invoice';

-- Retrieve all columns and their datatypes for 'invoice_line' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'invoice_line';
	
